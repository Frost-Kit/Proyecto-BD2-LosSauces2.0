-- 7. CONSULTAS
/* --------------------  Consultas de Mimi --------------------*/

-- 1 --
select p.nombre, p.ApPaterno, p.ApMaterno, p.DocumentoDeIdentidad, FactorRH, GrupoSanguineo, sum(u.Unidad_ID) as VolumenTotalML, count(h.Unidad_ID) as CantidadUnidades
from Persona p
	INNER JOIN Donante_Receptor dr on dr.Persona_ID = p.Persona_ID
	INNER JOIN HistorialSolicitudes h on h.Paciente_ID = dr.Donante_Receptor_ID
	INNER JOIN UnidadExtraida u on u.Unidad_ID = h.Unidad_ID
Group by p.nombre, p.ApPaterno, p.ApMaterno, p.DocumentoDeIdentidad, dr.GrupoSanguineo, dr.FactorRH
Having count(h.Unidad_ID) > 2;

/*=======================================================================================================================================
    TODO: Cristhian
*/
-- 3.1 
SELECT 
    TP.TipoComponente,
    TP.DiasVigencia,
    COUNT(UE.Unidad_ID) AS UnidadesDescartadas
FROM TipoComponente AS TP 
    INNER JOIN UnidadExtraida AS UE ON TP.TipoComponente_ID = UE.TipoComponente_ID
WHERE Estado = 0
GROUP BY 
    TP.TipoComponente,
    TP.DiasVigencia
HAVING COUNT(UE.Unidad_ID) > 3;
GO

-- 3.2
-- Aqui talves unas views para acortar codigo...
SELECT DISTINCT
    DG.Ciudad,
    DG.Pais
FROM V_DireccionesCompletas AS DG
    INNER JOIN LugarExtraccion AS LE ON DG.Direccion_ID = LE.Direccion_ID
INTERSECT
SELECT DISTINCT
    DG.Ciudad,
    DG.Pais
FROM V_DireccionesCompletas DG
    INNER JOIN HistorialSolicitudes AS HS ON DG.Direccion_ID = HS.Direccion_ID;
GO

-- 3.3
SELECT 
    UE.Unidad_ID AS ID_Unidad
FROM UnidadExtraida UE 
WHERE UE.UnidadOrigen_ID IS NULL
    AND (
        SELECT SUM(UEh.VolumenML) 
        FROM UnidadExtraida UEh
        WHERE UEh.UnidadOrigen_ID = UE.Unidad_ID
    ) < (VolumenML * 0.75);
GO

-- 3.4
WITH TrazabilidadUnidades AS
(
    SELECT
        -- Donante y fecha de extracción
        CONCAT(
            PD.Nombre, ' ', PD.ApPaterno, ' ', PD.ApMaterno
        ) AS Donante,
        FORMAT(E.Fecha,'dd/MM/yyyy HH:mm') AS FechaExtraccion,
        -- Unidad madre
        M.Unidad_ID AS ID_UnidadMadre,
        TM.TipoComponente AS TipoComponenteMadre,
        -- Unidad hija
        H.Unidad_ID AS ID_UnidadHija,
        TH.TipoComponente AS TipoComponenteHija,
        H.VolumenML AS VolumenUnidadML

    FROM UnidadExtraida AS H
        -- auto-Join: la hija referencia a la madre
        INNER JOIN UnidadExtraida AS M
            ON M.Unidad_ID = H.UnidadOrigen_ID
        INNER JOIN TipoComponente AS TH
            ON TH.TipoComponente_ID = H.TipoComponente_ID
        INNER JOIN TipoComponente AS TM
            ON TM.TipoComponente_ID = M.TipoComponente_ID
        -- Extracción de la unidad madre
        INNER JOIN Extraccion AS E
            ON E.Extraccion_ID = M.Extraccion_ID
        -- Donante
        INNER JOIN Donante_Receptor AS D
            ON D.Donante_Receptor_ID = E.Donante_ID
        INNER JOIN Persona AS PD
            ON PD.Persona_ID = D.Persona_ID
    WHERE H.UnidadOrigen_ID IS NOT NULL
)
SELECT
    TU.Donante, TU.FechaExtraccion,
    TU.ID_UnidadMadre, TU.TipoComponenteMadre,
    TU.ID_UnidadHija, TU.TipoComponenteHija,
    CONCAT(
        PR.Nombre, ' ', PR.ApPaterno, ' ',PR.ApMaterno
    ) AS Receptor,
    TU.VolumenUnidadML
FROM TrazabilidadUnidades AS TU
    INNER JOIN HistorialSolicitudes AS HS
        ON HS.Unidad_ID = TU.ID_UnidadHija
    INNER JOIN Donante_Receptor AS R
        ON R.Donante_Receptor_ID = HS.Paciente_ID
    INNER JOIN Persona AS PR
        ON PR.Persona_ID = R.Persona_ID;
GO
-- Variante con la Vista V_DireccionesCompletas
SELECT
    TU.Donante, TU.FechaExtraccion,
    TU.ID_UnidadMadre, TU.TipoComponenteMadre,
    TU.ID_UnidadHija, TU.TipoComponenteHija,
    CONCAT(
        PR.Nombre, ' ', PR.ApPaterno, ' ',PR.ApMaterno
    ) AS Receptor,
    TU.VolumenUnidadML
FROM V_UnidadesHijasInfoCompleta AS TU
    INNER JOIN HistorialSolicitudes AS HS
        ON HS.Unidad_ID = TU.ID_UnidadHija
    INNER JOIN Donante_Receptor AS R
        ON R.Donante_Receptor_ID = HS.Paciente_ID
    INNER JOIN Persona AS PR
        ON PR.Persona_ID = R.Persona_ID
WHERE TU.ID_UnidadMadre IS NOT NULL;
GO

-- =======================================================================================================================================
--4.1 Todo de Pablo
select year(c.Fecha) as año,month(c.Fecha) as mes ,e.Gravedad, count(ce.Enfermedad_ID) as mensual
from CheckeoEnfermedad ce
inner join Enfermedad e on e.Enfermedad_ID=ce.Enfermedad_ID
inner join Checkeo c on c.Checkeo_ID=ce.Checkeo_ID
group by year(c.Fecha),month(c.Fecha),e.Gravedad
having count(ce.Enfermedad_ID)>1;

--4.2
select dr.Donante_Receptor_ID as ID, p.DocumentoDeIdentidad as CI, CONCAT(p.Nombre, ' ', p.ApPaterno, ' ', p.ApMaterno) AS Nombre_Completo
from Extraccion e
inner join Donante_Receptor dr on dr.Donante_Receptor_ID=e.Donante_ID
inner join Persona p on p.Persona_ID=dr.Persona_ID
where year(e.Fecha)=2024
except
select dr.Donante_Receptor_ID as ID, p.DocumentoDeIdentidad as CI, CONCAT(p.Nombre, ' ', p.ApPaterno, ' ', p.ApMaterno) AS Nombre_Completo
from Extraccion e
inner join Donante_Receptor dr on dr.Donante_Receptor_ID=e.Donante_ID
inner join Persona p on p.Persona_ID=dr.Persona_ID
where year(e.Fecha)=2025

--4.3
select le.LugarExtraccion_ID as ID, le.Tipo,d.Calle
from TipoComponente tc
inner join UnidadExtraida ue on ue.TipoComponente_ID=tc.TipoComponente_ID
inner join Extraccion e on e.Extraccion_ID = ue.Extraccion_ID
inner join LugarExtraccion le on le.LugarExtraccion_ID=e.LugarExtraccion_ID
inner join Direccion d on d.Direccion_ID=le.Direccion_ID
group by le.LugarExtraccion_ID,le.Tipo,d.Calle
having count(distinct tc.TipoComponente_ID) = (select count(TipoComponente_ID) from TipoComponente)

--4.4

with VolumenSuma as (
select p.Personal_ID,concat(pe.Nombre,' ',pe.ApPaterno,' ', pe.ApMaterno) as Nombre_Completo,c.Nombre as Cargo ,sum(e.VolumenTotal_ML) as total
from Personal p
inner join Extraccion e on e.Personal_ID=p.Personal_ID
inner join persona pe on pe.Persona_ID= p.Persona_ID
inner join Cargo c on c.Cargo_ID=p.Cargo_ID
group by p.Personal_ID,pe.Nombre,pe.ApPaterno,pe.ApMaterno,c.Nombre)

select vm.Nombre_Completo,vm.Cargo,vm.total,
    (select top 1 e.Fecha
         from Extraccion e
         where e.Personal_ID=vm.Personal_ID
         order by e.Fecha desc ) as Ultima_Fecha,
    (select top 1 e.Metodo
         from Extraccion e
         where e.Personal_ID=vm.Personal_ID
         order by e.Fecha desc)
from VolumenSuma vm
where vm.total>(select avg(VolumenSuma.total) from VolumenSuma);

--alt con Last value
with VolumenSuma as (
select p.Personal_ID,concat(pe.Nombre,' ',pe.ApPaterno,' ', pe.ApMaterno) as Nombre_Completo,c.Nombre as Cargo ,sum(e.VolumenTotal_ML) as total
from Personal p
inner join Extraccion e on e.Personal_ID=p.Personal_ID
inner join persona pe on pe.Persona_ID= p.Persona_ID
inner join Cargo c on c.Cargo_ID=p.Cargo_ID
group by p.Personal_ID,pe.Nombre,pe.ApPaterno,pe.ApMaterno,c.Nombre),

Ultima_FyM as(
select distinct Personal_ID,
       last_value(Fecha) over (partition by Personal_ID order by Fecha ROWS between unbounded preceding and unbounded following ) as Ultima_fecha,
       last_value(Metodo) over (partition by Personal_ID order by Fecha ROWS  between unbounded preceding and unbounded following ) as Ultimo_metodo
from Extraccion)

select v.Nombre_Completo,v.Cargo,v.total,u.Ultima_fecha,u.Ultimo_metodo
from VolumenSuma v
inner join Ultima_FyM u on u.Personal_ID=v.Personal_ID
where v.total>(select avg(total) from VolumenSuma);


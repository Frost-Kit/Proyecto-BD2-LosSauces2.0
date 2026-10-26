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

-- =======================================================================================================================================


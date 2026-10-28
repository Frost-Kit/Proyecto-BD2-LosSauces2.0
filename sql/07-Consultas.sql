-- 7. CONSULTAS
Use Banco_de_Sangre;
GO

/* --------------------  Consultas de Emily --------------------*/


--- 1. Pacientes receptores de alto requerimiento transfusional ---

select CONCAT(p.Nombre, ' ', p.ApPaterno, ' ', p.ApMaterno) AS NombreCompleto, p.DocumentoDeIdentidad, 
FactorRH+GrupoSanguineo as tipo_sangre, count(h.Unidad_ID) as CantidadUnidades, sum(u.VolumenML) as VolumenTotalML
from Persona p
	INNER JOIN Donante_Receptor dr on dr.Persona_ID = p.Persona_ID
	INNER JOIN HistorialSolicitudes h on h.Donante_Receptor_ID = dr.Donante_Receptor_ID
	INNER JOIN UnidadExtraida u on u.Unidad_ID = h.Unidad_ID
Group by p.nombre, p.ApPaterno, p.ApMaterno, p.DocumentoDeIdentidad, dr.GrupoSanguineo, dr.FactorRH
Having count(h.Unidad_ID) > 2;

--- 2. Donantes evaluados pero sin extracciones registradas ---

SELECT p.DocumentoDeIdentidad, CONCAT(p.Nombre, ' ', p.ApPaterno, ' ', p.ApMaterno) AS NombreCompleto,
    dr.FactorRH+dr.GrupoSanguineo as tipo_sangre 
FROM Persona p
INNER JOIN Donante_Receptor dr
    ON p.Persona_ID = dr.Persona_ID
WHERE EXISTS (
    SELECT 1
    FROM Checkeo c
    WHERE c.Donante_Receptor_ID = dr.Donante_Receptor_ID
)
AND NOT EXISTS (
    SELECT 1
    FROM Extraccion e
    WHERE e.Donante_Receptor_ID = dr.Donante_Receptor_ID
);

--- 3. Unidades fragmentadas con volumen superior al promedio de su propio componente ---

SELECT u.Unidad_ID, u.UnidadOrigen_ID, tc.TipoComponente, u.VolumenML
FROM UnidadExtraida u
INNER JOIN TipoComponente tc
    ON u.TipoComponente_ID = tc.TipoComponente_ID
WHERE u.UnidadOrigen_ID IS NOT NULL
AND u.VolumenML > (
    SELECT AVG(U2.VolumenML)
    FROM UnidadExtraida u2
    WHERE u2.TipoComponente_ID = u.TipoComponente_ID
);

/* =================JAEL==========================*/
USE BancoSangre;
GO
-- 5 Cobertura de atencion del personal de salud--
SELECT
    p.Nombre + '' + p.ApPaterno + ISNULL('' + p.ApMaterno, '') AS NombreTrabajador, c.Nombre AS Cargo,
    COUNT(DISTINCT e.Donante_Receptor_ID) AS TotalDonantesUnicos
FROM Personal per
INNER JOIN Persona p ON per.Persona_ID = p.Persona_ID
INNER JOIN Cargo c ON per.Cargo_ID = c.Cargo_ID
INNER JOIN Extraccion e ON per.Personal_ID = e.Personal_ID
GROUP BY p.Persona_ID, p.Nombre, p.ApPaterno, P.ApMaterno, C.Nombre
HAVING COUNT(DISTINCT e.Donante_Receptor_ID) > 5;
GO

-- 6 Extracciones con volumen por encima de la media global
SELECT
    e.Extraccion_ID, e.Fecha, e.Metodo, p.Nombre + '' + p.ApPaterno + ISNULL('' + p.ApMaterno, '') AS NombreDonante,
    e.VolumenTotal_ML
FROM Extraccion e
INNER JOIN Donante_Receptor dr ON e.Donante_Receptor_ID = dr.Donante_Receptor_ID
INNER JOIN Persona p ON dr.Persona_ID = p.Persona_ID
WHERE e.VolumenTotal_ML > (SELECT AVG(VolumenTotal_ML) FROM Extraccion);
GO 

-- 7 Donante VIP historico
SELECT
    p.DocumentoDeIdentidad, p.Nombre + '' + p.ApPaterno + ISNULL('' + p.ApMaterno, '') AS NombreDonante,
    dr.GrupoSanguineo, dr.FactorRH, SUM(e.VolumenTotal_ML) AS TotalMililitrosDonados
FROM Donante_Receptor dr
INNER JOIN Persona p ON dr.Persona_ID = p.Persona_ID
INNER JOIN Extraccion e ON dr.Donante_Receptor_ID = e.Donante_Receptor_ID
GROUP BY p.DocumentoDeIdentidad, p.Nombre, p.ApPaterno, p.ApMaterno, dr.GrupoSanguineo, dr.FactorRH
HAVING SUM(e.VolumenTotal_ML) >= ALL (
        SELECT SUM(e2.VolumenTotal_ML)
        FROM Extraccion e2 
        GROUP BY e2.Donante_Receptor_ID
);
GO

--8 Resumen antropometrico y ultimo peso registrado
WITH Ultimopeso AS (
    SELECT
        c.Donante_Receptor_ID, c.Peso, ROW_NUMBER() OVER (PARTITION BY c.Donante_Receptor_ID
        ORDER BY c.Fecha DESC, c, Checkeo_ID DESC) AS rn
    FROM Checkeo c
) 
SELECT 
    p.DocumentoDeIdentidad, p.Nombre + '' + Ap.ApPaterno + ISNULL('' + p.ApMaterno, '') AS NombreDonante,
    COUNT(c.Checkeo_ID) AS TotalCheckeos,
    AVG(c.Peso) AS PesoPromedioHistorico,
    up.Peso AS UltimoPesoRegistrado
FROM Donante_Receptor dr
INNER JOIN Persona p ON dr.Persona_ID = p.Persona_ID
INNER JOIN Checkeo c ON dr.Donante_Receptor_ID = c.Donante_Receptor_ID
INNER JOIN Ultimopeso up ON dr.Donante_Receptor_ID = up.Donante_Receptor_ID and up.rn = 1
GROUP BY p.DocumentoDeIdentidad, p.Nombre, p.ApPaterno, p.ApMaterno, up.Peso;
GO

/*==================================================================================== */


/*======================================================================================================================
    TODO: Cristhian
*/
-- 9 o 3.1 Índice de descarte por tipo de hemocomponente.
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

-- 10 o 3.2 Red logística de ciudades con extracción y solicitud simultánea.
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

-- 11. o 3.3 Pérdida excesiva de volumen en el fraccionamiento sanguíneo. 
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

-- 12 o 3.4 Trazabilidad de extremo a extremo en unidades fraccionadas.
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
            ON D.Donante_Receptor_ID = E.Donante_Receptor_ID
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
        ON R.Donante_Receptor_ID = HS.Donante_Receptor_ID
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
        ON R.Donante_Receptor_ID = HS.Donante_Receptor_ID
    INNER JOIN Persona AS PR
        ON PR.Persona_ID = R.Persona_ID
WHERE TU.ID_UnidadMadre IS NOT NULL;
GO

/*=======================================================================================================================================
    4.1 Todo de Pablo - Consultas
=======================================================================================================================================*/

-- 13 o 4.1 Conteo mensual de patologías detectadas en chequeos por nivel de gravedad
SELECT
    YEAR(c.Fecha) AS [año],
    MONTH(c.Fecha) AS mes,
    e.Gravedad,
    COUNT(ce.Enfermedad_ID) AS mensual
FROM CheckeoEnfermedad ce
INNER JOIN Enfermedad e ON e.Enfermedad_ID = ce.Enfermedad_ID
INNER JOIN Checkeo c ON c.Checkeo_ID = ce.Checkeo_ID
GROUP BY YEAR(c.Fecha), MONTH(c.Fecha), e.Gravedad
HAVING COUNT(ce.Enfermedad_ID) > 1;
GO

-- 14 o 4.2 Donantes que realizaron extracciones en 2024 pero no volvieron a donar en 2025
SELECT
    dr.Donante_Receptor_ID AS ID,
    p.DocumentoDeIdentidad AS CI,
    CONCAT(p.Nombre, ' ', p.ApPaterno, ' ', p.ApMaterno) AS Nombre_Completo
FROM Extraccion e
INNER JOIN Donante_Receptor dr ON dr.Donante_Receptor_ID = e.Donante_Receptor_ID
INNER JOIN Persona p ON p.Persona_ID = dr.Persona_ID
WHERE YEAR(e.Fecha) = 2026

EXCEPT

SELECT
    dr.Donante_Receptor_ID AS ID,
    p.DocumentoDeIdentidad AS CI,
    CONCAT(p.Nombre, ' ', p.ApPaterno, ' ', p.ApMaterno) AS Nombre_Completo
FROM Extraccion e
INNER JOIN Donante_Receptor dr ON dr.Donante_Receptor_ID = e.Donante_Receptor_ID
INNER JOIN Persona p ON p.Persona_ID = dr.Persona_ID
WHERE YEAR(e.Fecha) = 2025;
GO

-- 15 o 4.3 Lugares de extracción que han generado todos los tipos de componentes registrados
SELECT
    le.LugarExtraccion_ID AS ID,
    le.Tipo,
    d.Calle
FROM TipoComponente tc
INNER JOIN UnidadExtraida ue ON ue.TipoComponente_ID = tc.TipoComponente_ID
INNER JOIN Extraccion e ON e.Extraccion_ID = ue.Extraccion_ID
INNER JOIN LugarExtraccion le ON le.LugarExtraccion_ID = e.LugarExtraccion_ID
INNER JOIN Direccion d ON d.Direccion_ID = le.Direccion_ID
GROUP BY le.LugarExtraccion_ID, le.Tipo, d.Calle
HAVING COUNT(DISTINCT tc.TipoComponente_ID) = (SELECT COUNT(TipoComponente_ID) FROM TipoComponente);
GO

-- 16 o 4.4 Personal con volumen total extraído superior al promedio general (Versión con Subconsultas)
WITH VolumenSuma AS (
    SELECT
        p.Personal_ID,
        CONCAT(pe.Nombre, ' ', pe.ApPaterno, ' ', pe.ApMaterno) AS Nombre_Completo,
        c.Nombre AS Cargo,
        SUM(e.VolumenTotal_ML) AS total
    FROM Personal p
    INNER JOIN Extraccion e ON e.Personal_ID = p.Personal_ID
    INNER JOIN Persona pe ON pe.Persona_ID = p.Persona_ID
    INNER JOIN Cargo c ON c.Cargo_ID = p.Cargo_ID
    GROUP BY p.Personal_ID, pe.Nombre, pe.ApPaterno, pe.ApMaterno, c.Nombre
)
SELECT
    vm.Nombre_Completo,
    vm.Cargo,
    vm.total,
    (SELECT TOP 1 e.Fecha
     FROM Extraccion e
     WHERE e.Personal_ID = vm.Personal_ID
     ORDER BY e.Fecha DESC) AS Ultima_Fecha,
    (SELECT TOP 1 e.Metodo
     FROM Extraccion e
     WHERE e.Personal_ID = vm.Personal_ID
     ORDER BY e.Fecha DESC) AS Ultimo_Metodo
FROM VolumenSuma vm
WHERE vm.total > (SELECT AVG(VolumenSuma.total) FROM VolumenSuma);
GO

-- 4.4 Alternativa con Función de Ventana (LAST_VALUE)
WITH VolumenSuma AS (
    SELECT
        p.Personal_ID,
        CONCAT(pe.Nombre, ' ', pe.ApPaterno, ' ', pe.ApMaterno) AS Nombre_Completo,
        c.Nombre AS Cargo,
        SUM(e.VolumenTotal_ML) AS total
    FROM Personal p
    INNER JOIN Extraccion e ON e.Personal_ID = p.Personal_ID
    INNER JOIN Persona pe ON pe.Persona_ID = p.Persona_ID
    INNER JOIN Cargo c ON c.Cargo_ID = p.Cargo_ID
    GROUP BY p.Personal_ID, pe.Nombre, pe.ApPaterno, pe.ApMaterno, c.Nombre
),
Ultima_FyM AS (
    SELECT DISTINCT
        Personal_ID,
        LAST_VALUE(Fecha) OVER (
            PARTITION BY Personal_ID
            ORDER BY Fecha
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) AS Ultima_fecha,
        LAST_VALUE(Metodo) OVER (
            PARTITION BY Personal_ID
            ORDER BY Fecha
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) AS Ultimo_metodo
    FROM Extraccion
)
SELECT
    v.Nombre_Completo,
    v.Cargo,
    v.total,
    u.Ultima_fecha,
    u.Ultimo_metodo
FROM VolumenSuma v
INNER JOIN Ultima_FyM u ON u.Personal_ID = v.Personal_ID
WHERE v.total > (SELECT AVG(total) FROM VolumenSuma);
GO

/*============================================================================================================================================
Thierry consultas */

-- CONSULTA 24. Unidades sin asignar ni utilizadas como origen de otras
SELECT u.Unidad_ID, t.TipoComponente, u.VolumenML, u.FechaObtencion
FROM dbo.UnidadExtraida AS u
INNER JOIN dbo.TipoComponente AS t
    ON t.TipoComponente_ID = u.TipoComponente_ID
WHERE u.Estado = 1
  AND NOT EXISTS (
      SELECT 1 FROM dbo.HistorialSolicitudes AS h
      WHERE h.Unidad_ID = u.Unidad_ID
  )
  AND NOT EXISTS (
      SELECT 1 FROM dbo.UnidadExtraida AS hija
      WHERE hija.UnidadOrigen_ID = u.Unidad_ID
  )
ORDER BY u.Unidad_ID;
GO

-- CONSULTA 25. Solicitudes interurbanas: ciudad de extraccion distinta de entrega (NIVEL 3)
SELECT h.Solicitud_ID,
       h.Fecha AS FechaEntrega,
       CONCAT(p.Nombre, ' ', p.ApPaterno, ' ', ISNULL(p.ApMaterno, '')) AS PacienteReceptor,
       h.Unidad_ID,
       cOrigen.Nombre AS CiudadExtraccion,
       cDestino.Nombre AS CiudadEntrega
FROM dbo.HistorialSolicitudes AS h
INNER JOIN dbo.Donante_Receptor AS dr
    ON dr.Donante_Receptor_ID = h.Donante_Receptor_ID
INNER JOIN dbo.Persona AS p ON p.Persona_ID = dr.Persona_ID
INNER JOIN dbo.UnidadExtraida AS u ON u.Unidad_ID = h.Unidad_ID
INNER JOIN dbo.Extraccion AS e ON e.Extraccion_ID = u.Extraccion_ID
INNER JOIN dbo.LugarExtraccion AS l
    ON l.LugarExtraccion_ID = e.LugarExtraccion_ID
INNER JOIN dbo.Direccion AS dOrigen ON dOrigen.Direccion_ID = l.Direccion_ID
INNER JOIN dbo.Direccion AS dDestino ON dDestino.Direccion_ID = h.Direccion_ID
INNER JOIN dbo.Ciudad AS cOrigen ON cOrigen.Ciudad_ID = dOrigen.Ciudad_ID
INNER JOIN dbo.Ciudad AS cDestino ON cDestino.Ciudad_ID = dDestino.Ciudad_ID
WHERE dOrigen.Ciudad_ID <> dDestino.Ciudad_ID
ORDER BY h.Fecha;
GO

/*============================================================================================================================================
Matias consultas */
/* CONSULTA 26 Demanda mensual de componentes por grupo sanguíneo y RH*/
USE BancoSangre;
GO

SELECT 
    YEAR(hs.Fecha) AS Anio,
    MONTH(hs.Fecha) AS Mes,
    dr.GrupoSanguineo,
    dr.FactorRH,
    SUM(ue.VolumenML) AS VolumenTotalDespachado
FROM HistorialSolicitudes hs
INNER JOIN Donante_Receptor dr ON hs.Paciente_ID = dr.Donante_Receptor_ID
INNER JOIN UnidadExtraida ue ON hs.Unidad_ID = ue.Unidad_ID
GROUP BY 
    YEAR(hs.Fecha),
    MONTH(hs.Fecha),
    dr.GrupoSanguineo,
    dr.FactorRH
HAVING SUM(ue.VolumenML) > 1000.00;



/*------------------------------------------------------------------------------------------------*/
/* CONSULTA 27 Directorio maestro de contactos del banco de sangre */
-- Personas que pertenecen al Personal
SELECT DISTINCT
    p.DocumentoDeIdentidad,
    CONCAT(p.Nombre, ' ', p.ApPaterno, ' ', ISNULL(p.ApMaterno, '')) AS NombreCompleto,
    e.DireccionE AS CorreoElectronico,
    'Personal' AS TipoVinculo
FROM Persona p
INNER JOIN EmailPersona ep ON p.Persona_ID = ep.Persona_ID
INNER JOIN Email e ON ep.Email_ID = e.Email_ID
INNER JOIN Personal per ON p.Persona_ID = per.Persona_ID
WHERE ep.Flag = 1

UNION

-- Personas que son Donantes
SELECT DISTINCT
    p.DocumentoDeIdentidad,
    CONCAT(p.Nombre, ' ', p.ApPaterno, ' ', ISNULL(p.ApMaterno, '')) AS NombreCompleto,
    e.DireccionE AS CorreoElectronico,
    'Donante' AS TipoVinculo
FROM Persona p
INNER JOIN EmailPersona ep ON p.Persona_ID = ep.Persona_ID
INNER JOIN Email e ON ep.Email_ID = e.Email_ID
INNER JOIN Donante_Receptor dr ON p.Persona_ID = dr.Persona_ID
INNER JOIN Extraccion ex ON dr.Donante_Receptor_ID = ex.Donante_ID
WHERE ep.Flag = 1

UNION

-- Personas que son Pacientes Receptores
SELECT DISTINCT
    p.DocumentoDeIdentidad,
    CONCAT(p.Nombre, ' ', p.ApPaterno, ' ', ISNULL(p.ApMaterno, '')) AS NombreCompleto,
    e.DireccionE AS CorreoElectronico,
    'Paciente Receptor' AS TipoVinculo
FROM Persona p
INNER JOIN EmailPersona ep ON p.Persona_ID = ep.Persona_ID
INNER JOIN Email e ON ep.Email_ID = e.Email_ID
INNER JOIN Donante_Receptor dr ON p.Persona_ID = dr.Persona_ID
INNER JOIN HistorialSolicitudes hs ON dr.Donante_Receptor_ID = hs.Paciente_ID
WHERE ep.Flag = 1;



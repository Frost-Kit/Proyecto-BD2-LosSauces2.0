-- 4. VISTAS/VIEWS
USE BancoSangre;
GO
-- PRUEBA
CREATE OR ALTER VIEW V_Donantes AS
(
    SELECT 
        Nombre, 
        ApPaterno, 
        ApMaterno,
        FechaNacimiento, 
        GrupoSanguineo + FactorRH AS TIPOSANGRE
    FROM Donante_Receptor DR 
        INNER JOIN Persona P ON P.Persona_ID = DR.Persona_ID
);
GO

--SELECT * FROM V_Donantes

/*=======================================================================================================================================
    TODO: Cristhian
*/
-- Para las direcciones
CREATE OR ALTER VIEW V_DireccionesCompletas
AS
SELECT
    D.Direccion_ID,
    D.Calle,
    C.Ciudad_ID,
    C.Nombre AS Ciudad,
    P.Pais_ID,
    P.Nombre AS Pais
FROM Direccion AS D
    INNER JOIN Ciudad AS C ON C.Ciudad_ID = D.Ciudad_ID
    INNER JOIN Pais AS P ON P.Pais_ID = C.Pais_ID;
GO
-- Pa probar -> SELECT * FROM V_DireccionesCompletas

-- Para ver todo sobre las unidades hijas
CREATE OR ALTER VIEW V_UnidadesHijasInfoCompleta
AS
SELECT
    -- Donante y fecha de extracción
    CONCAT(
        PD.Nombre, ' ', PD.ApPaterno, ' ', PD.ApMaterno
    ) AS Donante,
    FORMAT(E.Fecha,'dd/MM/yyyy HH:mm') AS FechaExtraccion,
    -- Unidad hija
    H.Unidad_ID AS ID_UnidadHija,
    TH.TipoComponente AS TipoComponenteHija,
    H.Estado AS Estado,
    H.FechaObtencion AS FechaFragmentacion,
    H.VolumenML AS VolumenUnidadML,
    -- Unidad madre
    M.Unidad_ID AS ID_UnidadMadre,
    TM.TipoComponente AS TipoComponenteMadre

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
GO
-- Pa probar -> SELECT * FROM V_UnidadesHijasInfoCompleta

/*=======================================================================================================================================
    TODO: Pablo (Vistas)
*/
-- Vista para la Consulta 3: Centros de extracción integrales
CREATE OR ALTER VIEW V_CentrosExtraccionIntegrales AS
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

-- Vista para la Consulta 4: Personal de rendimiento superior al promedio
CREATE OR ALTER VIEW V_PersonalRendimientoSuperior AS
WITH VolumenSuma AS (
    SELECT
        p.Personal_ID,
        CONCAT(pe.Nombre,' ',pe.ApPaterno,' ', pe.ApMaterno) AS Nombre_Completo,
        c.Nombre AS Cargo,
        SUM(e.VolumenTotal_ML) AS total
    FROM Personal p
    INNER JOIN Extraccion e ON e.Personal_ID = p.Personal_ID
    INNER JOIN Persona pe ON pe.Persona_ID = p.Persona_ID
    INNER JOIN Cargo c ON c.Cargo_ID = p.Cargo_ID
    GROUP BY p.Personal_ID, pe.Nombre, pe.ApPaterno, pe.ApMaterno, c.Nombre
),
Ultima_FyM AS(
    SELECT DISTINCT
        Personal_ID,
        LAST_VALUE(Fecha) OVER (PARTITION BY Personal_ID ORDER BY Fecha ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Ultima_fecha,
        LAST_VALUE(Metodo) OVER (PARTITION BY Personal_ID ORDER BY Fecha ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Ultimo_metodo
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

/*=======================================================================================================================================
    THIERRY*/
--Alertas actuales: unidades aun marcadas activas y no asignadas
--que venceran dentro de 7 dias, incluyendo las ya vencidas.
CREATE OR ALTER VIEW dbo.vw_AlertasVencimiento
AS
SELECT i.Unidad_ID, i.TipoComponente, i.FechaObtencion, i.FechaVencimiento,
       DATEDIFF(DAY, GETDATE(), i.FechaVencimiento) AS DiasRestantes,
       CASE WHEN i.FechaVencimiento <= GETDATE() THEN 'Vencida'
            ELSE 'Proxima a vencer' END AS Alerta
FROM dbo.vw_InventarioUnidades i
WHERE i.Estado = 1
  AND NOT EXISTS (SELECT 1 FROM dbo.HistorialSolicitudes h WHERE h.Unidad_ID = i.Unidad_ID)
  AND i.FechaVencimiento <= DATEADD(DAY, 7, GETDATE());
GO

/*=======================================================================================================================================
    ENZO */
-- V5. Historial de evaluaciones previas; no es una decision de aptitud.
CREATE OR ALTER VIEW dbo.vw_CheckeosDonantes
AS
SELECT ch.Checkeo_ID, dr.Donante_Receptor_ID AS Donante_ID,
       CONCAT(p.Nombre, ' ', p.ApPaterno, ' ', COALESCE(p.ApMaterno, '')) AS Donante,
       ch.Fecha, ch.Peso, ch.Altura,
       COUNT(ce.Enfermedad_ID) AS NumeroAntecedentesRegistrados
FROM dbo.Checkeo ch
JOIN dbo.Donante_Receptor dr ON dr.Donante_Receptor_ID = ch.Donante_ID
JOIN dbo.Persona p ON p.Persona_ID = dr.Persona_ID
LEFT JOIN dbo.CheckeoEnfermedad ce ON ce.Checkeo_ID = ch.Checkeo_ID
GROUP BY ch.Checkeo_ID, dr.Donante_Receptor_ID, p.Nombre, p.ApPaterno, p.ApMaterno,
         ch.Fecha, ch.Peso, ch.Altura;
GO


/*=======================================================================================================================================
THIERRYY
*/
CREATE OR ALTER VIEW dbo.vw_UnidadesSinAsignar
AS
SELECT
    u.Unidad_ID,
    t.TipoComponente,
    u.VolumenML,
    u.FechaObtencion,
    u.Estado
FROM dbo.UnidadExtraida AS u
INNER JOIN dbo.TipoComponente AS t
    ON u.TipoComponente_ID = t.TipoComponente_ID
WHERE u.Estado = 1
AND NOT EXISTS (
    SELECT 1
    FROM dbo.HistorialSolicitudes AS h
    WHERE h.Unidad_ID = u.Unidad_ID
);




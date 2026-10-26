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
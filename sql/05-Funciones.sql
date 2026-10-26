-- 5. FUNCIONES
/*=======================================================================================================================================
    TODO: Cristhian
*/
CREATE OR ALTER FUNCTION DBO.Fn_DarTipoComponente(@UnidadS_ID INT)
RETURNS VARCHAR(100)
AS
BEGIN
    RETURN (
        SELECT T.TipoComponente 
        FROM TipoComponente AS T
            INNER JOIN UnidadExtraida AS U 
                ON T.TipoComponente_ID = U.TipoComponente_ID
        WHERE Unidad_ID = @UnidadS_ID
    )
END;
GO
/*=======================================================================================================================================
    TODO: Pablo (Funciones)
*/
-- Función para la Consulta 1: Detección mensual de patologías dinámico
CREATE OR ALTER FUNCTION DBO.Fn_PatologiasMensuales (@MinCasos INT)
RETURNS TABLE
AS
RETURN (
    SELECT
        YEAR(c.Fecha) AS Anio,
        MONTH(c.Fecha) AS Mes,
        e.Gravedad,
        COUNT(ce.Enfermedad_ID) AS Mensual
    FROM CheckeoEnfermedad ce
    INNER JOIN Enfermedad e ON e.Enfermedad_ID = ce.Enfermedad_ID
    INNER JOIN Checkeo c ON c.Checkeo_ID = ce.Checkeo_ID
    GROUP BY YEAR(c.Fecha), MONTH(c.Fecha), e.Gravedad
    HAVING COUNT(ce.Enfermedad_ID) >= @MinCasos
);
GO
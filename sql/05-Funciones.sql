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
/*======================================================================================================================================
THIERRY 

CREATE OR ALTER FUNCTION dbo.fn_FechaVencimiento (@UnidadID INT)
RETURNS DATETIME
AS
BEGIN
    DECLARE @Fecha DATETIME;
    SELECT @Fecha = DATEADD(DAY, t.DiasVigencia, u.FechaObtencion)
    FROM dbo.UnidadExtraida u
    JOIN dbo.TipoComponente t ON t.TipoComponente_ID = u.TipoComponente_ID
    WHERE u.Unidad_ID = @UnidadID;
    RETURN @Fecha;
END;
GO
/*======================================================================================================================================
ENZO

CREATE OR ALTER FUNCTION dbo.fn_CantidadExtracciones (@DonanteID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Total INT;
    SELECT @Total = COUNT(*) FROM dbo.Extraccion WHERE Donante_ID = @DonanteID;
    RETURN @Total;
END;
GO


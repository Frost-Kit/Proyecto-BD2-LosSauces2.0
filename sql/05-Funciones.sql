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
/*======================================================================================================================================= */
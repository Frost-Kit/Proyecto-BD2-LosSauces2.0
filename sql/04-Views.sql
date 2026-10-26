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
/*======================================================================================================================================= */
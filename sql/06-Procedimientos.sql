-- 6. PROCEDIMIENTO ALMACENADOS
/*=======================================================================================================================================
    TODO: Pablo (Procedimientos Almacenados)
*/
-- Procedimiento para la Consulta 2: Fidelización y deserción anual de donantes
CREATE OR ALTER PROCEDURE Sp_FidelizacionDesercionDonantes
    @AnioActivo INT,
    @AnioInactivo INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        dr.Donante_Receptor_ID AS ID,
        p.DocumentoDeIdentidad AS CI,
        CONCAT(p.Nombre, ' ', p.ApPaterno, ' ', p.ApMaterno) AS Nombre_Completo
    FROM Extraccion e
    INNER JOIN Donante_Receptor dr ON dr.Donante_Receptor_ID = e.Donante_ID
    INNER JOIN Persona p ON p.Persona_ID = dr.Persona_ID
    WHERE YEAR(e.Fecha) = @AnioActivo

    EXCEPT

    SELECT
        dr.Donante_Receptor_ID AS ID,
        p.DocumentoDeIdentidad AS CI,
        CONCAT(p.Nombre, ' ', p.ApPaterno, ' ', p.ApMaterno) AS Nombre_Completo
    FROM Extraccion e
    INNER JOIN Donante_Receptor dr ON dr.Donante_Receptor_ID = e.Donante_ID
    INNER JOIN Persona p ON p.Persona_ID = dr.Persona_ID
    WHERE YEAR(e.Fecha) = @AnioInactivo;
END;
GO
EXEC Sp_FidelizacionDesercionDonantes @AnioActivo = 2024, @AnioInactivo = 2026;
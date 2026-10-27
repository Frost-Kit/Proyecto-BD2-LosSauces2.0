-- 6. PROCEDIMIENTO ALMACENADOS
/*=======================================================================================================================================
    TODO: Pablo (Procedimientos Almacenados)
=======================================================================================================================================*/

-- Procedimiento para la Consulta 4.2: Fidelización y deserción anual de donantes
CREATE PROCEDURE dbo.Sp_FidelizacionDesercionDonantes
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
    INNER JOIN Donante_Receptor dr ON dr.Donante_Receptor_ID = e.Donante_Receptor_ID
    INNER JOIN Persona p ON p.Persona_ID = dr.Persona_ID
    WHERE YEAR(e.Fecha) = @AnioActivo

    EXCEPT

    SELECT
        dr.Donante_Receptor_ID AS ID,
        p.DocumentoDeIdentidad AS CI,
        CONCAT(p.Nombre, ' ', p.ApPaterno, ' ', p.ApMaterno) AS Nombre_Completo
    FROM Extraccion e
    INNER JOIN Donante_Receptor dr ON dr.Donante_Receptor_ID = e.Donante_Receptor_ID
    INNER JOIN Persona p ON p.Persona_ID = dr.Persona_ID
    WHERE YEAR(e.Fecha) = @AnioInactivo;
END;
GO

-- Prueba del procedimiento almacenado
EXEC dbo.Sp_FidelizacionDesercionDonantes @AnioActivo = 2026, @AnioInactivo = 2025;
GO
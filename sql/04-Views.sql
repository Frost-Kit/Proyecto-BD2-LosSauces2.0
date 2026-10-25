-- 4. VISTAS/VIEWS
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
)

SELECT * FROM V_Donantes
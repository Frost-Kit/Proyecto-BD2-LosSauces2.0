USE BancoSangre;
GO
--1 Cobertura de atencion del personal de salud--
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

--2 Extracciones con volumen por encima de la media global
SELECT
    e.Extraccion_ID, e.Fecha, e.Metodo, p.Nombre + '' + p.ApPaterno + ISNULL('' + p.ApMaterno, '') AS NombreDonante,
    e.VolumenTotal_ML
FROM Extraccion e
INNER JOIN Donante_Receptor dr ON e.Donante_Receptor_ID = dr.Donante_Receptor_ID
INNER JOIN Persona p ON dr.Persona_ID = p.Persona_ID
WHERE e.VolumenTotal_ML > (SELECT AVG(VolumenTotal_ML) FROM Extraccion);
GO 

--3 Donante VIP historico
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

--4 Resumen antropometrico y ultimo peso registrado
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
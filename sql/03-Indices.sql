-- 3. INDICES
/*=======================================================================================================================================
    TODO: Pablo (Índices para optimizar filtros por fecha y personal)
=======================================================================================================================================*/
CREATE NONCLUSTERED INDEX IX_Extraccion_Fecha ON Extraccion(Fecha);
CREATE NONCLUSTERED INDEX IX_Extraccion_Personal ON Extraccion(Personal_ID);
CREATE NONCLUSTERED INDEX IX_Checkeo_Fecha ON Checkeo(Fecha);
GO
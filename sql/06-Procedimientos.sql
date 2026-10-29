-- 6. PROCEDIMIENTO ALMACENADOS
USE BancoSangre;
GO
/*=======================================================================================================================================
    TODO: Cristhian
=======================================================================================================================================*/
-- Para registrar Personal
CREATE OR ALTER PROCEDURE Sp_RegistrarPersonal
    @Persona_ID INT,
    @Nombre VARCHAR(100), @ApPaterno VARCHAR(100), @ApMaterno VARCHAR(100),
    @FechaNacimiento DATE, @DocumentoDeIdentidad VARCHAR(30), @Sexo CHAR(1),
    @Cargo_ID INT,
    @FechaInicio DATE/*,
    @FechaFin DATE = NULL*/
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- IF @Persona_ID < 0
        -- BEGIN
        --     THROW 50000, 'ID de persona invalido.', 1;
        -- END

        -- IF @Cargo_ID < 0
        -- BEGIN
        --     THROW 50001, 'ID de cargo invalido.', 1;
        -- END
        
        -- si la persona es nueva
        IF @Persona_ID IS NULL OR @Persona_ID = 0
        BEGIN
            -- por si ya hay alguien con el mismo documento de identidad, se va.. 
            -- IF EXISTS (SELECT 1 FROM Persona WHERE DocumentoDeIdentidad = @DocumentoDeIdentidad)
            -- BEGIN
            --     THROW 50002, 'El documento de identidad ya se encuentra registrado en el sistema.', 1;
            -- END

            INSERT INTO Persona (Nombre, ApPaterno, ApMaterno, FechaNacimiento, DocumentoDeIdentidad, Sexo)
                VALUES (@Nombre, @ApPaterno, @ApMaterno, @FechaNacimiento, @DocumentoDeIdentidad, @Sexo);
            
            SET @Persona_ID = CONVERT(INT, SCOPE_IDENTITY());
        END

        -- por si vuelve a poner el cargo, se va.. 
        -- IF EXISTS (SELECT 1 FROM Personal WHERE Persona_ID = @Persona_ID AND Cargo_ID = @Cargo_ID AND FechaInicio = @FechaInicio)
        -- BEGIN
        --     THROW 50003, 'Ya existe un registro para esta persona con el mismo cargo y fecha de inicio.', 1;
        -- END

        -- se baja al cargo actual activo de la persona, si tiene uno
        UPDATE Personal 
        SET FechaFin = CONVERT(DATE, @FechaInicio), 
            Activo = 0
        WHERE Persona_ID = @Persona_ID AND Activo = 1;

        INSERT INTO Personal (Persona_ID, Cargo_ID, FechaInicio, Activo)
            VALUES (@Persona_ID, @Cargo_ID, @FechaInicio, 1);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH
END;
GO

/*=======================================================================================================================================
    TODO: Pablo (Procedimientos Almacenados)
=======================================================================================================================================*/

-- Procedimiento para la Consulta 4.2: Fidelización y deserción anual de donantes
CREATE OR ALTER PROCEDURE dbo.Sp_FidelizacionDesercionDonantes
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

-- Proceso 2
CREATE OR ALTER PROCEDURE sp_RegistrarDonador
    -- Datos de Persona
    @Nombre VARCHAR(100),
    @ApPaterno VARCHAR(100),
    @ApMaterno VARCHAR(100) = NULL,
    @FechaNacimiento DATE,
    @DocumentoDeIdentidad VARCHAR(30),
    @Sexo CHAR(1),
    -- Datos de Donante_Receptor
    @FactorRH CHAR(1),
    @GrupoSanguineo VARCHAR(2),
    -- Datos de Contacto (Opcionales)
    @DireccionEmail VARCHAR(150) = NULL,
    @NumTelefono VARCHAR(20) = NULL,
    @CodPais VARCHAR(8) = '+591',
    @TipoTelefono VARCHAR(30) = 'Movil'
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @Persona_ID INT;
        DECLARE @Donante_Receptor_ID INT;

        SELECT @Persona_ID = Persona_ID 
        FROM Persona 
        WHERE DocumentoDeIdentidad = @DocumentoDeIdentidad;

        IF @Persona_ID IS NULL
        BEGIN
            INSERT INTO Persona (Nombre, ApPaterno, ApMaterno, FechaNacimiento, DocumentoDeIdentidad, Sexo)
            VALUES (@Nombre, @ApPaterno, @ApMaterno, @FechaNacimiento, @DocumentoDeIdentidad, @Sexo);

            SET @Persona_ID = SCOPE_IDENTITY();
        END

        IF EXISTS (SELECT 1 FROM Donante_Receptor WHERE Persona_ID = @Persona_ID)
        BEGIN
            RAISERROR('La persona ya se encuentra registrada como donante/receptor.', 16, 1);
        END

        INSERT INTO Donante_Receptor (Persona_ID, FactorRH, GrupoSanguineo)
        VALUES (@Persona_ID, @FactorRH, @GrupoSanguineo);

        SET @Donante_Receptor_ID = SCOPE_IDENTITY();

        IF @DireccionEmail IS NOT NULL
        BEGIN
            INSERT INTO Email (Persona_ID, DireccionE)
            VALUES (@Persona_ID, @DireccionEmail);
        END

        IF @NumTelefono IS NOT NULL
        BEGIN
            INSERT INTO Telefono (Persona_ID, numTelefono, CodPais, TipoTelefono)
            VALUES (@Persona_ID, @NumTelefono, @CodPais, @TipoTelefono);
        END

        COMMIT TRANSACTION;

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH
END;
GO

-- ESCENARIO 1: Registro completo (con Email y Teléfono)
EXEC sp_RegistrarDonador
    @Nombre = 'Carlos',
    @ApPaterno = 'Mendoza',
    @ApMaterno = 'Rojas',
    @FechaNacimiento = '1998-05-14',
    @DocumentoDeIdentidad = '10458921',
    @Sexo = 'M',
    @FactorRH = '+',
    @GrupoSanguineo = 'O',
    @DireccionEmail = 'carlos.mendoza@correo.com',
    @NumTelefono = '71234567',
    @CodPais = '+591',
    @TipoTelefono = 'Movil';
GO

select * from Persona
order by Persona_ID desc;
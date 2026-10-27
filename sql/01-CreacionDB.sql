-- 1. Creacion de la DB y tablas
USE master;
GO

CREATE DATABASE BancoSangre;
GO

USE BancoSangre;
GO

CREATE TABLE Pais (
    Pais_ID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) UNIQUE NOT NULL
);
GO

CREATE TABLE Ciudad (
    Ciudad_ID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Pais_ID INT NOT NULL REFERENCES Pais(Pais_ID),
    CONSTRAINT Ciudad_nombre_pais UNIQUE (Nombre, Pais_ID)
);
GO

CREATE TABLE Direccion (
    Direccion_ID INT PRIMARY KEY IDENTITY(1,1),
    Calle VARCHAR(200) NOT NULL,
    Ciudad_ID INT NOT NULL REFERENCES Ciudad(Ciudad_ID),
    CONSTRAINT Direccion_calle_ciudad UNIQUE (Calle, Ciudad_ID)
);
GO

CREATE TABLE Persona (
    Persona_ID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    ApPaterno VARCHAR(100) NOT NULL,
    ApMaterno VARCHAR(100) NULL,
    FechaNacimiento DATE NOT NULL,
    DocumentoDeIdentidad VARCHAR(30) UNIQUE NOT NULL,
    Sexo CHAR(1) NOT NULL,
    CONSTRAINT Persona_sexo CHECK (Sexo IN ('M','F'))
);
GO

CREATE TABLE Email (
    Email_ID INT PRIMARY KEY IDENTITY(1,1),
    Persona_ID INT NOT NULL REFERENCES Persona(Persona_ID),
    DireccionE VARCHAR(150) NOT NULL,
    FechaRegistro DATETIME NOT NULL DEFAULT GETDATE(),
    Flag BIT NOT NULL DEFAULT 1,
    CONSTRAINT Email_direccion_unica UNIQUE (DireccionE),
    CONSTRAINT Email_formato_valido CHECK (DireccionE LIKE '%_@__%.__%')
);
GO

CREATE TABLE Telefono (
    Telefono_ID INT PRIMARY KEY IDENTITY(1,1),
    Persona_ID INT NOT NULL REFERENCES Persona(Persona_ID),
    numTelefono VARCHAR(20) NOT NULL,
    CodPais VARCHAR(8) NOT NULL,
    TipoTelefono VARCHAR(30) NOT NULL,
    FechaRegistro DATETIME NOT NULL DEFAULT GETDATE(),
    Flag BIT NOT NULL DEFAULT 1,
    CONSTRAINT Telefono_numero_cod_unico UNIQUE (numTelefono, CodPais),
    CONSTRAINT Telefono_tipo_valido CHECK (TipoTelefono IN ('Movil', 'Fijo', 'Trabajo', 'Emergencia'))
);
GO

CREATE TABLE Cargo (
    Cargo_ID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) UNIQUE NOT NULL,
    Activo BIT NOT NULL DEFAULT 1
);
GO

CREATE TABLE Enfermedad (
    Enfermedad_ID INT PRIMARY KEY IDENTITY(1,1),
    Enfermedad VARCHAR(150) UNIQUE NOT NULL,
    Gravedad VARCHAR(50) NOT NULL,
    CONSTRAINT Gravedad_Nom CHECK (Gravedad IN ('Rechazo permanente','Rechazo temporal','Cronica/Sistematica','TranstornoS&G'))
);
GO

CREATE TABLE TipoComponente (
    TipoComponente_ID INT PRIMARY KEY IDENTITY(1,1),
    TipoComponente VARCHAR(100) UNIQUE NOT NULL,
    DiasVigencia INT NOT NULL,
    CondicionDeAlmacenamiento VARCHAR(200) NULL,
    CONSTRAINT TipoComp_vigencia CHECK (DiasVigencia > 0)
);
GO

CREATE TABLE Personal (
    Personal_ID INT PRIMARY KEY IDENTITY(1,1),
    Persona_ID INT NOT NULL REFERENCES Persona(Persona_ID),
    Cargo_ID INT NOT NULL REFERENCES Cargo(Cargo_ID),
    FechaInicio DATE NOT NULL,
    FechaFin DATE NULL,
    Activo BIT NOT NULL DEFAULT 1,
    CONSTRAINT Personal_persona_cargo_inicio UNIQUE (Persona_ID, Cargo_ID, FechaInicio),
    CONSTRAINT Personal_fechas CHECK (FechaFin IS NULL OR FechaFin > FechaInicio),
    CONSTRAINT Actividad CHECK ((Activo = 0 AND FechaFin IS NOT NULL) OR (Activo = 1 AND FechaFin IS NULL))
);
GO

CREATE TABLE Donante_Receptor (
    Donante_Receptor_ID INT PRIMARY KEY IDENTITY(1,1),
    Persona_ID INT UNIQUE NOT NULL REFERENCES Persona(Persona_ID),
    FactorRH CHAR(1) NOT NULL,
    GrupoSanguineo VARCHAR(2) NOT NULL,
    CONSTRAINT Donante_factor CHECK (FactorRH IN ('+','-')),
    CONSTRAINT Donante_grupo CHECK (GrupoSanguineo IN ('A','B','AB','O'))
);
GO


CREATE TABLE Checkeo (
    Checkeo_ID INT PRIMARY KEY IDENTITY(1,1),
    Donante_Receptor_ID INT NOT NULL REFERENCES Donante_Receptor(Donante_Receptor_ID),
    Altura DECIMAL(5,2) NOT NULL,
    Fecha DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE),
    Peso DECIMAL(5,2) NOT NULL,
    CONSTRAINT Checkeo_valores CHECK (Peso > 0 AND Altura > 0)
);
GO

CREATE TABLE CheckeoEnfermedad (
    CheckeoEnfermedad_ID INT PRIMARY KEY IDENTITY(1,1),
    Checkeo_ID INT NOT NULL REFERENCES Checkeo(Checkeo_ID),
    Enfermedad_ID INT NOT NULL REFERENCES Enfermedad(Enfermedad_ID),
    CONSTRAINT Checkeo_enfermedad_unica UNIQUE (Checkeo_ID, Enfermedad_ID)
);
GO

CREATE TABLE LugarExtraccion (
    LugarExtraccion_ID INT PRIMARY KEY IDENTITY(1,1),
    Direccion_ID INT NOT NULL REFERENCES Direccion(Direccion_ID),
    Tipo VARCHAR(100) NOT NULL,
    CONSTRAINT Lugar_direccion_tipo UNIQUE (Direccion_ID, Tipo)
);
GO

CREATE TABLE Extraccion (
    Extraccion_ID INT PRIMARY KEY IDENTITY(1,1),
    Personal_ID INT NOT NULL REFERENCES Personal(Personal_ID),
    Donante_Receptor_ID INT NOT NULL REFERENCES Donante_Receptor(Donante_Receptor_ID),
    LugarExtraccion_ID INT NOT NULL REFERENCES LugarExtraccion(LugarExtraccion_ID),
    Fecha DATETIME NOT NULL DEFAULT GETDATE(),
    Metodo VARCHAR(100) NULL,
    VolumenTotal_ML DECIMAL(8,2) NOT NULL,
    CONSTRAINT Extraccion_volumen CHECK (VolumenTotal_ML > 0)
);
GO

CREATE TABLE UnidadExtraida (
    Unidad_ID INT PRIMARY KEY IDENTITY(1,1),
    Extraccion_ID INT NOT NULL REFERENCES Extraccion(Extraccion_ID),
    UnidadOrigen_ID INT NULL REFERENCES UnidadExtraida(Unidad_ID),
    TipoComponente_ID INT NOT NULL REFERENCES TipoComponente(TipoComponente_ID),
    VolumenML DECIMAL(8,2) NOT NULL,
    FechaObtencion DATETIME NOT NULL DEFAULT GETDATE(),
    Estado BIT NOT NULL DEFAULT 1,
    CONSTRAINT Unidad_volumen CHECK (VolumenML > 0),
    CONSTRAINT Unidad_no_auto_origen CHECK (UnidadOrigen_ID IS NULL OR UnidadOrigen_ID <> Unidad_ID)
);
GO

CREATE TABLE HistorialSolicitudes (
    Solicitud_ID INT PRIMARY KEY IDENTITY(1,1),
    Donante_Receptor_ID INT NOT NULL REFERENCES Donante_Receptor(Donante_Receptor_ID),
    Unidad_ID INT NOT NULL REFERENCES UnidadExtraida(Unidad_ID),
    Direccion_ID INT NOT NULL REFERENCES Direccion(Direccion_ID),
    Fecha DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT Historial_unidad_unica UNIQUE (Unidad_ID)
);
GO

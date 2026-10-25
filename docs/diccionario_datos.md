# Diccionario de datos — BancoSangre

**Proyecto:** Sistema de gestión de banco de sangre  
**Motor de base de datos:** Microsoft SQL Server  
**Base de datos:** `BancoSangre`  
**Fuente:** `01-CreacionDB.sql`

> **Alcance:** este documento describe las tablas, columnas, claves y restricciones definidas en el script SQL proporcionado. Las descripciones funcionales se interpretan a partir de los nombres y relaciones existentes; deben ajustarse si las reglas del proyecto definen un comportamiento distinto. Este documento no sustituye la validación clínica ni normativa de un sistema real de banco de sangre.

## 1. Convenciones

- **PK:** clave primaria.
- **FK:** clave foránea.
- **UQ:** restricción de unicidad (`UNIQUE`).
- **NN:** no admite valores nulos (`NOT NULL`).
- **NULL:** admite valores nulos.
- **IDENTITY(1,1):** SQL Server genera el identificador, comenzando en 1 e incrementándolo de uno en uno.
- **DEFAULT:** valor o expresión aplicada cuando el `INSERT` no proporciona un valor para la columna.
- Los tipos y las restricciones que aparecen aquí reflejan el script entregado.

## 2. Resumen de tablas

| Tabla | Propósito |
|---|---|
| `Pais` | Catálogo de países. |
| `Ciudad` | Ciudades asociadas a un país. |
| `Direccion` | Direcciones asociadas a una ciudad. |
| `Persona` | Datos personales y documento de identidad. |
| `Email` | Catálogo de direcciones de correo electrónico. |
| `Telefono` | Catálogo de números telefónicos. |
| `Cargo` | Catálogo de cargos del personal. |
| `Enfermedad` | Catálogo de enfermedades y su clasificación definida por el proyecto. |
| `TipoComponente` | Catálogo de componentes sanguíneos, vigencia y almacenamiento. |
| `EmailPersona` | Relación entre personas y correos electrónicos. |
| `PersonaTelefono` | Relación entre personas y teléfonos. |
| `Personal` | Vincula una persona con un cargo durante un período. |
| `Donante_Receptor` | Registra grupo sanguíneo y factor Rh de una persona que participa como donante/receptor. |
| `Checkeo` | Evaluaciones registradas para un donante/receptor. |
| `CheckeoEnfermedad` | Relación entre evaluaciones y enfermedades. |
| `LugarExtraccion` | Lugares de extracción asociados a una dirección. |
| `Extraccion` | Registro de una extracción y sus datos principales. |
| `UnidadExtraida` | Unidades o componentes obtenidos a partir de una extracción. |
| `HistorialSolicitudes` | Registro de solicitudes asociadas a una unidad, paciente y dirección. |

---

## 3. Diccionario detallado

### 3.1 `Pais`

**Descripción:** catálogo de países.

| Columna | Tipo de dato | Nulabilidad | Clave / valor predeterminado | Descripción |
|---|---|---|---|---|
| `Pais_ID` | `INT` | NN | PK, IDENTITY(1,1) | Identificador único del país. |
| `Nombre` | `VARCHAR(100)` | NN | UQ | Nombre del país; no puede repetirse. |

**Restricciones:** `Nombre` es único.

### 3.2 `Ciudad`

**Descripción:** ciudades pertenecientes a un país.

| Columna | Tipo de dato | Nulabilidad | Clave / valor predeterminado | Descripción |
|---|---|---|---|---|
| `Ciudad_ID` | `INT` | NN | PK, IDENTITY(1,1) | Identificador único de la ciudad. |
| `Nombre` | `VARCHAR(100)` | NN | — | Nombre de la ciudad. |
| `Pais_ID` | `INT` | NN | FK → `Pais(Pais_ID)` | País al que pertenece la ciudad. |

**Restricciones:** `UNIQUE (Nombre, Pais_ID)`; permite nombres de ciudad iguales si pertenecen a países diferentes, pero no dentro del mismo país.

### 3.3 `Direccion`

**Descripción:** direcciones asociadas a una ciudad.

| Columna | Tipo de dato | Nulabilidad | Clave / valor predeterminado | Descripción |
|---|---|---|---|---|
| `Direccion_ID` | `INT` | NN | PK, IDENTITY(1,1) | Identificador único de la dirección. |
| `Calle` | `VARCHAR(200)` | NN | — | Texto de la calle o dirección. |
| `Ciudad_ID` | `INT` | NN | FK → `Ciudad(Ciudad_ID)` | Ciudad donde se encuentra la dirección. |

**Restricciones:** `UNIQUE (Calle, Ciudad_ID)`.

### 3.4 `Persona`

**Descripción:** datos de identificación y datos personales básicos.

| Columna | Tipo de dato | Nulabilidad | Clave / valor predeterminado | Descripción |
|---|---|---|---|---|
| `Persona_ID` | `INT` | NN | PK, IDENTITY(1,1) | Identificador único de la persona. |
| `Nombre` | `VARCHAR(100)` | NN | — | Nombre de la persona. |
| `ApPaterno` | `VARCHAR(100)` | NN | — | Apellido paterno. |
| `ApMaterno` | `VARCHAR(100)` | NULL | — | Apellido materno, si corresponde. |
| `FechaNacimiento` | `DATE` | NN | — | Fecha de nacimiento. |
| `DocumentoDeIdentidad` | `VARCHAR(30)` | NN | UQ | Número o código del documento de identidad; no puede repetirse. |
| `Sexo` | `CHAR(1)` | NN | CHECK | Código de sexo admitido por el esquema: `M` o `F`. |

**Restricciones:** `CHECK (Sexo IN ('M','F'))`; `DocumentoDeIdentidad` es único.

### 3.5 `Email`

**Descripción:** catálogo de direcciones de correo electrónico.

| Columna | Tipo de dato | Nulabilidad | Clave / valor predeterminado | Descripción |
|---|---|---|---|---|
| `Email_ID` | `INT` | NN | PK, IDENTITY(1,1) | Identificador único del correo. |
| `DireccionE` | `VARCHAR(150)` | NN | UQ | Dirección de correo electrónico; no puede repetirse. |

### 3.6 `Telefono`

**Descripción:** catálogo de números telefónicos y sus características.

| Columna | Tipo de dato | Nulabilidad | Clave / valor predeterminado | Descripción |
|---|---|---|---|---|
| `Telefono_ID` | `INT` | NN | PK, IDENTITY(1,1) | Identificador único del teléfono. |
| `numTelefono` | `VARCHAR(20)` | NN | — | Número telefónico, almacenado como texto para conservar posibles ceros iniciales. |
| `CodPais` | `VARCHAR(8)` | NN | — | Código telefónico de país. |
| `TipoTelefono` | `VARCHAR(30)` | NN | — | Tipo o categoría del teléfono, según los valores definidos por el proyecto. |

**Restricciones:** `UNIQUE (numTelefono, CodPais)`; el mismo número y código de país no pueden repetirse en conjunto.

### 3.7 `Cargo`

**Descripción:** catálogo de cargos que puede ocupar el personal.

| Columna | Tipo de dato | Nulabilidad | Clave / valor predeterminado | Descripción |
|---|---|---|---|---|
| `Cargo_ID` | `INT` | NN | PK, IDENTITY(1,1) | Identificador único del cargo. |
| `Nombre` | `VARCHAR(100)` | NN | UQ | Nombre del cargo; no puede repetirse. |
| `Activo` | `BIT` | NN | DEFAULT `1` | Indicador de actividad del cargo: `1` activo, `0` inactivo. |

### 3.8 `Enfermedad`

**Descripción:** catálogo de enfermedades y clasificación definida para el proyecto.

| Columna | Tipo de dato | Nulabilidad | Clave / valor predeterminado | Descripción |
|---|---|---|---|---|
| `Enfermedad_ID` | `INT` | NN | PK, IDENTITY(1,1) | Identificador único de la enfermedad. |
| `Enfermedad` | `VARCHAR(150)` | NN | UQ | Nombre de la enfermedad; no puede repetirse. |
| `Gravedad` | `VARCHAR(50)` | NN | CHECK | Clasificación admitida por el esquema. |

**Restricciones:** `Gravedad` debe ser uno de los siguientes valores exactos: `Rechazo permanente`, `Rechazo temporal`, `Cronica/Sistematica` o `TranstornoS&G`.

**Nota:** las etiquetas y su significado clínico deben ser validados por el equipo docente o por una fuente sanitaria competente antes de usarlos para tomar decisiones reales.

### 3.9 `TipoComponente`

**Descripción:** catálogo de tipos de componentes sanguíneos, con su vigencia y condiciones de almacenamiento.

| Columna | Tipo de dato | Nulabilidad | Clave / valor predeterminado | Descripción |
|---|---|---|---|---|
| `TipoComponente_ID` | `INT` | NN | PK, IDENTITY(1,1) | Identificador único del tipo de componente. |
| `TipoComponente` | `VARCHAR(100)` | NN | UQ | Nombre del tipo de componente; no puede repetirse. |
| `DiasVigencia` | `INT` | NN | CHECK | Cantidad de días de vigencia configurada para el componente. |
| `CondicionDeAlmacenamiento` | `VARCHAR(200)` | NULL | — | Descripción de las condiciones de almacenamiento, si se registran. |

**Restricciones:** `CHECK (DiasVigencia > 0)`.

### 3.10 `EmailPersona`

**Descripción:** tabla intermedia que relaciona personas con correos electrónicos y registra la fecha y el estado de la asociación.

| Columna | Tipo de dato | Nulabilidad | Clave / valor predeterminado | Descripción |
|---|---|---|---|---|
| `EmailPersona_ID` | `INT` | NN | PK, IDENTITY(1,1) | Identificador de la asociación persona-correo. |
| `Persona_ID` | `INT` | NN | FK → `Persona(Persona_ID)` | Persona asociada al correo. |
| `Email_ID` | `INT` | NN | FK → `Email(Email_ID)` | Correo electrónico asociado. |
| `FechaRegistro` | `DATETIME` | NN | DEFAULT `GETDATE()` | Fecha y hora de creación del registro. |
| `Flag` | `BIT` | NN | DEFAULT `1` | Indicador de estado de la asociación; el significado operativo de `1` y `0` debe mantenerse consistente en la aplicación. |

**Restricciones:** `UNIQUE (Persona_ID, Email_ID)`; una misma pareja persona-correo no puede repetirse.

### 3.11 `PersonaTelefono`

**Descripción:** tabla intermedia que relaciona personas con teléfonos y registra la fecha y el estado de la asociación.

| Columna | Tipo de dato | Nulabilidad | Clave / valor predeterminado | Descripción |
|---|---|---|---|---|
| `PersonTelef_ID` | `INT` | NN | PK, IDENTITY(1,1) | Identificador de la asociación persona-teléfono. |
| `Persona_ID` | `INT` | NN | FK → `Persona(Persona_ID)` | Persona asociada al teléfono. |
| `Telefono_ID` | `INT` | NN | FK → `Telefono(Telefono_ID)` | Teléfono asociado. |
| `FechaRegistro` | `DATETIME` | NN | DEFAULT `GETDATE()` | Fecha y hora de creación del registro. |
| `Flag` | `BIT` | NN | DEFAULT `1` | Indicador de estado de la asociación; el significado operativo de `1` y `0` debe mantenerse consistente en la aplicación. |

**Restricciones:** `UNIQUE (Persona_ID, Telefono_ID)`.

### 3.12 `Personal`

**Descripción:** registra la asignación de una persona a un cargo durante un período determinado.

| Columna | Tipo de dato | Nulabilidad | Clave / valor predeterminado | Descripción |
|---|---|---|---|---|
| `Personal_ID` | `INT` | NN | PK, IDENTITY(1,1) | Identificador único del registro de personal. |
| `Persona_ID` | `INT` | NN | FK → `Persona(Persona_ID)` | Persona que ocupa el cargo. |
| `Cargo_ID` | `INT` | NN | FK → `Cargo(Cargo_ID)` | Cargo asignado. |
| `FechaInicio` | `DATE` | NN | — | Fecha de inicio de la asignación. |
| `FechaFin` | `DATE` | NULL | CHECK | Fecha de finalización; puede ser nula si la asignación continúa activa. |
| `Activo` | `BIT` | NN | DEFAULT `1`, CHECK | Estado de la asignación: `1` activa, `0` inactiva, sujeto a la regla de fechas definida. |

**Restricciones:**
- `UNIQUE (Persona_ID, Cargo_ID, FechaInicio)`.
- `CHECK (FechaFin IS NULL OR FechaFin > FechaInicio)`.
- `CHECK ((Activo = 0 AND FechaFin IS NOT NULL) OR (Activo = 1 AND FechaFin IS NULL))`.

La última restricción exige que un registro activo no tenga `FechaFin` y que uno inactivo sí la tenga.

### 3.13 `Donante_Receptor`

**Descripción:** relaciona una persona con su grupo sanguíneo y factor Rh para el registro como donante/receptor en el sistema.

| Columna | Tipo de dato | Nulabilidad | Clave / valor predeterminado | Descripción |
|---|---|---|---|---|
| `Donante_Receptor_ID` | `INT` | NN | PK, IDENTITY(1,1) | Identificador único del registro de donante/receptor. |
| `Persona_ID` | `INT` | NN | FK → `Persona(Persona_ID)`, UQ | Persona vinculada; cada persona puede aparecer como máximo una vez en esta tabla. |
| `FactorRH` | `CHAR(1)` | NN | CHECK | Factor Rh permitido: `+` o `-`. |
| `GrupoSanguineo` | `VARCHAR(2)` | NN | CHECK | Grupo sanguíneo permitido: `A`, `B`, `AB` u `O`. |

**Restricciones:** `CHECK (FactorRH IN ('+','-'))` y `CHECK (GrupoSanguineo IN ('A','B','AB','O'))`.

**Observación de diseño:** la tabla no contiene un campo que distinga explícitamente el rol de donante del rol de receptor. Si el sistema necesita diferenciarlos, se debe definir cómo representar esos roles.

### 3.14 `Checkeo`

**Descripción:** registra una evaluación asociada a un registro de donante/receptor.

| Columna | Tipo de dato | Nulabilidad | Clave / valor predeterminado | Descripción |
|---|---|---|---|---|
| `Checkeo_ID` | `INT` | NN | PK, IDENTITY(1,1) | Identificador único de la evaluación. |
| `Donante_ID` | `INT` | NN | FK → `Donante_Receptor(Donante_Receptor_ID)` | Donante/receptor al que corresponde la evaluación. |
| `Altura` | `DECIMAL(5,2)` | NN | CHECK | Altura registrada; unidad de medida no especificada por el esquema. |
| `Fecha` | `DATE` | NN | DEFAULT `CAST(GETDATE() AS DATE)` | Fecha de la evaluación; por defecto, la fecha actual del servidor. |
| `Peso` | `DECIMAL(5,2)` | NN | CHECK | Peso registrado; unidad de medida no especificada por el esquema. |

**Restricciones:** `CHECK (Peso > 0 AND Altura > 0)`.

**Nota:** se recomienda documentar explícitamente las unidades de altura y peso en los requisitos de la aplicación.

### 3.15 `CheckeoEnfermedad`

**Descripción:** relaciona una evaluación con las enfermedades registradas para esa evaluación.

| Columna | Tipo de dato | Nulabilidad | Clave / valor predeterminado | Descripción |
|---|---|---|---|---|
| `CheckeoEnfermedad_ID` | `INT` | NN | PK, IDENTITY(1,1) | Identificador de la asociación evaluación-enfermedad. |
| `Checkeo_ID` | `INT` | NN | FK → `Checkeo(Checkeo_ID)` | Evaluación asociada. |
| `Enfermedad_ID` | `INT` | NN | FK → `Enfermedad(Enfermedad_ID)` | Enfermedad asociada a la evaluación. |

**Restricciones:** `UNIQUE (Checkeo_ID, Enfermedad_ID)`; una misma enfermedad no puede asociarse dos veces a la misma evaluación.

### 3.16 `LugarExtraccion`

**Descripción:** registra lugares de extracción vinculados a una dirección.

| Columna | Tipo de dato | Nulabilidad | Clave / valor predeterminado | Descripción |
|---|---|---|---|---|
| `LugarExtraccion_ID` | `INT` | NN | PK, IDENTITY(1,1) | Identificador único del lugar de extracción. |
| `Direccion_ID` | `INT` | NN | FK → `Direccion(Direccion_ID)` | Dirección del lugar. |
| `Tipo` | `VARCHAR(50)` | NN | — | Tipo de lugar, según las categorías definidas por el proyecto. |

**Restricciones:** `UNIQUE (Direccion_ID, Tipo)`.

### 3.17 `Extraccion`

**Descripción:** registra una extracción, el personal responsable, el donante, el lugar, la fecha, el método y el volumen total.

| Columna | Tipo de dato | Nulabilidad | Clave / valor predeterminado | Descripción |
|---|---|---|---|---|
| `Extraccion_ID` | `INT` | NN | PK, IDENTITY(1,1) | Identificador único de la extracción. |
| `Personal_ID` | `INT` | NN | FK → `Personal(Personal_ID)` | Registro de personal asociado a la extracción. |
| `Donante_ID` | `INT` | NN | FK → `Donante_Receptor(Donante_Receptor_ID)` | Donante asociado a la extracción. |
| `LugarExtraccion_ID` | `INT` | NN | FK → `LugarExtraccion(LugarExtraccion_ID)` | Lugar donde se realizó la extracción. |
| `Fecha` | `DATETIME` | NN | DEFAULT `GETDATE()` | Fecha y hora de la extracción; por defecto, fecha y hora del servidor. |
| `Metodo` | `VARCHAR(100)` | NULL | — | Método de extracción, si se registra. |
| `VolumenTotal_ML` | `DECIMAL(8,2)` | NN | CHECK | Volumen total extraído, expresado en mililitros según el nombre de la columna. |

**Restricciones:** `CHECK (VolumenTotal_ML > 0)`.

### 3.18 `UnidadExtraida`

**Descripción:** registra unidades o componentes obtenidos de una extracción y permite una referencia opcional a otra unidad de la misma tabla.

| Columna | Tipo de dato | Nulabilidad | Clave / valor predeterminado | Descripción |
|---|---|---|---|---|
| `Unidad_ID` | `INT` | NN | PK, IDENTITY(1,1) | Identificador único de la unidad. |
| `Extraccion_ID` | `INT` | NN | FK → `Extraccion(Extraccion_ID)` | Extracción de la que procede la unidad. |
| `UnidadOrigen_ID` | `INT` | NULL | FK → `UnidadExtraida(Unidad_ID)`, CHECK | Referencia opcional a una unidad de origen dentro de la misma tabla. |
| `TipoComponente_ID` | `INT` | NN | FK → `TipoComponente(TipoComponente_ID)` | Tipo de componente de la unidad. |
| `VolumenML` | `DECIMAL(8,2)` | NN | CHECK | Volumen de la unidad, en mililitros según el nombre de la columna. |
| `FechaObtencion` | `DATETIME` | NN | DEFAULT `GETDATE()` | Fecha y hora de obtención; por defecto, fecha y hora del servidor. |
| `Estado` | `BIT` | NN | DEFAULT `1` | Indicador binario de estado: `1` o `0`; el significado operativo de cada valor debe definirse en el proyecto. |

**Restricciones:**
- `CHECK (VolumenML > 0)`.
- `CHECK (UnidadOrigen_ID IS NULL OR UnidadOrigen_ID <> Unidad_ID)`, que impide que una unidad se señale a sí misma como origen.

**Observación:** el campo `Estado` solo permite dos valores. Si se requieren estados detallados (por ejemplo, disponible, reservada, utilizada, descartada o vencida), el diseño actual no los representa por sí solo.

### 3.19 `HistorialSolicitudes`

**Descripción:** registra una relación entre un paciente, una unidad extraída, una dirección y la fecha del registro.

| Columna | Tipo de dato | Nulabilidad | Clave / valor predeterminado | Descripción |
|---|---|---|---|---|
| `Solicitud_ID` | `INT` | NN | PK, IDENTITY(1,1) | Identificador único del registro de solicitud. |
| `Paciente_ID` | `INT` | NN | FK → `Donante_Receptor(Donante_Receptor_ID)` | Registro de donante/receptor asociado al paciente. |
| `Unidad_ID` | `INT` | NN | FK → `UnidadExtraida(Unidad_ID)`, UQ | Unidad vinculada a la solicitud; no puede aparecer en más de un registro de esta tabla. |
| `Direccion_ID` | `INT` | NN | FK → `Direccion(Direccion_ID)` | Dirección asociada al registro de solicitud. |
| `Fecha` | `DATETIME` | NN | DEFAULT `GETDATE()` | Fecha y hora del registro; por defecto, fecha y hora del servidor. |

**Restricciones:** `UNIQUE (Unidad_ID)`; una unidad solo puede aparecer una vez en `HistorialSolicitudes`.

**Observación de diseño:** el esquema actual no incluye columnas explícitas para el estado de la solicitud, cantidad solicitada ni fecha de atención. Evalúen si son necesarias según los requisitos del proyecto.

---

## 4. Relaciones entre tablas

Las siguientes relaciones se derivan de las claves foráneas declaradas en el script:

| Tabla de origen | Columna FK | Tabla referenciada | Columna referenciada |
|---|---|---|---|
| `Ciudad` | `Pais_ID` | `Pais` | `Pais_ID` |
| `Direccion` | `Ciudad_ID` | `Ciudad` | `Ciudad_ID` |
| `EmailPersona` | `Persona_ID` | `Persona` | `Persona_ID` |
| `EmailPersona` | `Email_ID` | `Email` | `Email_ID` |
| `PersonaTelefono` | `Persona_ID` | `Persona` | `Persona_ID` |
| `PersonaTelefono` | `Telefono_ID` | `Telefono` | `Telefono_ID` |
| `Personal` | `Persona_ID` | `Persona` | `Persona_ID` |
| `Personal` | `Cargo_ID` | `Cargo` | `Cargo_ID` |
| `Donante_Receptor` | `Persona_ID` | `Persona` | `Persona_ID` |
| `Checkeo` | `Donante_ID` | `Donante_Receptor` | `Donante_Receptor_ID` |
| `CheckeoEnfermedad` | `Checkeo_ID` | `Checkeo` | `Checkeo_ID` |
| `CheckeoEnfermedad` | `Enfermedad_ID` | `Enfermedad` | `Enfermedad_ID` |
| `LugarExtraccion` | `Direccion_ID` | `Direccion` | `Direccion_ID` |
| `Extraccion` | `Personal_ID` | `Personal` | `Personal_ID` |
| `Extraccion` | `Donante_ID` | `Donante_Receptor` | `Donante_Receptor_ID` |
| `Extraccion` | `LugarExtraccion_ID` | `LugarExtraccion` | `LugarExtraccion_ID` |
| `UnidadExtraida` | `Extraccion_ID` | `Extraccion` | `Extraccion_ID` |
| `UnidadExtraida` | `UnidadOrigen_ID` | `UnidadExtraida` | `Unidad_ID` |
| `UnidadExtraida` | `TipoComponente_ID` | `TipoComponente` | `TipoComponente_ID` |
| `HistorialSolicitudes` | `Paciente_ID` | `Donante_Receptor` | `Donante_Receptor_ID` |
| `HistorialSolicitudes` | `Unidad_ID` | `UnidadExtraida` | `Unidad_ID` |
| `HistorialSolicitudes` | `Direccion_ID` | `Direccion` | `Direccion_ID` |

## 5. Reglas y restricciones importantes

1. Los identificadores primarios se generan automáticamente mediante `IDENTITY(1,1)`.
2. Los documentos de identidad de `Persona` no pueden repetirse.
3. Los correos electrónicos de `Email` son únicos.
4. La combinación de número telefónico y código de país es única en `Telefono`.
5. Una persona solo puede tener un registro en `Donante_Receptor`, debido a `UNIQUE (Persona_ID)`.
6. Las evaluaciones requieren valores positivos de peso y altura.
7. Los volúmenes registrados en `Extraccion` y `UnidadExtraida` deben ser mayores que cero.
8. `DiasVigencia` debe ser mayor que cero.
9. `FechaFin` en `Personal`, si se especifica, debe ser posterior a `FechaInicio`; además, debe ser nula cuando `Activo = 1` y no nula cuando `Activo = 0`.
10. Las tablas intermedias impiden repetir la misma asociación mediante restricciones `UNIQUE`.
11. Una unidad no puede referenciarse a sí misma en `UnidadOrigen_ID`.
12. Una unidad solo puede figurar una vez en `HistorialSolicitudes`.

## 6. Aspectos que conviene revisar con el equipo

Estos puntos son observaciones de diseño, no errores confirmados; dependen de los requisitos funcionales que les haya dado el docente.

- **Rol de persona:** definir si una persona puede ser donante, receptor o ambos y cómo se registrará esa distinción.
- **Unidades de medida:** documentar si `Altura` se registra en metros o centímetros y `Peso` en kilogramos, y validar que los rangos correspondan a esa elección.
- **Estado de las unidades:** definir qué significa `Estado = 1` y `Estado = 0`; considerar un catálogo de estados si se necesitan más de dos.
- **Solicitudes:** comprobar si `UNIQUE (Unidad_ID)` es adecuado. Esta regla impide que una unidad se asocie a varias solicitudes.
- **Direcciones:** determinar si el sistema debe asociar domicilios a personas o si solo necesita direcciones de lugares y solicitudes.
- **Reglas clínicas:** la compatibilidad, elegibilidad, vigencia y seguridad de componentes requieren reglas validadas por fuentes sanitarias competentes; no se deben deducir únicamente de la estructura de las tablas.
- **Nombres y etiquetas:** corregir posibles inconsistencias ortográficas solo mediante un cambio acordado del esquema y sus datos, manteniendo sincronizados SQL, documentación y diagrama ER.

## 7. Mantenimiento del documento

Cuando se modifique una tabla o restricción:

1. Actualizar el script SQL correspondiente.
2. Actualizar esta ficha del diccionario.
3. Actualizar el diagrama entidad-relación.
4. Probar la creación de la base de datos y la carga de datos de prueba desde un estado limpio.
5. Registrar el cambio en Git con un mensaje descriptivo.

**Y ya 🫡**

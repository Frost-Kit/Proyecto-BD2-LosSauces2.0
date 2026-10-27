# BancoSangre --- Base de datos para la gestión de un banco de sangre

Proyecto académico de **Base de Datos II** desarrollado en SQL Server.
Su propósito es organizar la información relacionada con personas,
donantes y receptores, personal sanitario, evaluaciones médicas,
extracciones, hemocomponentes, solicitudes y trazabilidad de las
unidades sanguíneas.

> **Importante:** este README describe la estructura y el procedimiento
> de ejecución del repositorio. La ejecución satisfactoria de cada
> script y de las consultas debe comprobarse en SQL Server; la presencia
> de un archivo no implica por sí sola que todo el código esté validado.

## Objetivo del proyecto

Diseñar e implementar una base de datos relacional que permita almacenar
y relacionar la información del proceso de donación y transfusión
sanguínea, mantener la integridad de los datos y facilitar consultas
para el seguimiento de extracciones, unidades, vencimientos, solicitudes
y trazabilidad.

## Tecnologías

-   **Microsoft SQL Server**
-   **Transact-SQL (T-SQL)**
-   **SQL Server Management Studio (SSMS), VScode** u otra herramienta
    compatible para ejecutar scripts SQL
-   **Git y GitHub** para el control de versiones y el trabajo
    colaborativo

## Estructura del repositorio

  -----------------------------------------------------------------------
  Archivo                             Descripción
  ----------------------------------- -----------------------------------
  `01-CreacionDB.sql`                 Crea la base de datos `BancoSangre`
                                      y sus tablas, claves, relaciones y
                                      restricciones.

  `02-InsertData.sql`                 Inserta datos de ejemplo para
                                      poblar las tablas y permitir
                                      consultas de prueba.

  `03-Indices.sql`                    Define índices no agrupados para
                                      apoyar búsquedas por fecha de
                                      extracción, personal responsable y
                                      fecha de chequeo médico.

  `04-Views.sql`                      Define vistas para simplificar
                                      consultas y presentar información
                                      relacionada, como donantes,
                                      direcciones, unidades derivadas y
                                      alertas.

  `05-Funciones.sql`                  Contiene funciones para consultar
                                      información de componentes,
                                      calcular vencimientos, contar
                                      extracciones y resumir patologías
                                      por mes.

  `06-Procedimientos.sql`             Define procedimientos almacenados;
                                      incluye la comparación de donantes
                                      entre dos años mediante `EXCEPT`.

  `07-Consultas.sql`                  Reúne consultas SQL del proyecto
                                      organizadas por secciones e
                                      integrantes.

  -----------------------------------------------------------------------


## Modelo de datos

El esquema incluye las siguientes áreas principales:

-   **Geografía y ubicación:** `Pais`, `Ciudad`, `Direccion` y
    `LugarExtraccion`.
-   **Personas y contacto:** `Persona`, `Email` y `Telefono`.
-   **Personal y funciones:** `Cargo` y `Personal`.
-   **Donantes y evaluación médica:** `Donante_Receptor`, `Checkeo`,
    `Enfermedad` y `CheckeoEnfermedad`.
-   **Extracción y hemocomponentes:** `Extraccion`, `TipoComponente` y
    `UnidadExtraida`.
-   **Solicitudes y destino:** `HistorialSolicitudes`.

Las claves primarias, claves foráneas y restricciones definidas en el
esquema buscan mantener relaciones válidas y evitar datos
inconsistentes.

## Requisitos previos

1.  Tener acceso a una instancia de Microsoft SQL Server.
2.  Contar con permisos para crear bases de datos y objetos.
3.  Abrir los scripts en SQL Server Management Studio (SSMS) o una
    herramienta compatible.
4.  Revisar que no exista una base de datos `BancoSangre` que deba
    conservarse antes de ejecutar el script de creación.

## Orden de ejecución

Ejecutar los scripts en el siguiente orden, comprobando cada paso antes
de continuar:

1.  `01-CreacionDB.sql` --- creación de la base de datos y las tablas.
2.  `02-InsertData.sql` --- carga de datos de ejemplo.
3.  `03-Indices.sql` --- creación de índices.
4.  `04-Views.sql` --- creación de vistas.
5.  `05-Funciones.sql` --- creación de funciones.
6.  `06-Procedimientos.sql` --- creación de procedimientos almacenados.
7.  `07-Consultas.sql` --- ejecución de consultas
    para revisar la información.

Para ejecutar cada archivo en SSMS, abrirlo, seleccionar la base de
datos indicada en el propio script y ejecutar el contenido. Revisar los
mensajes de error antes de continuar. Algunos scripts pueden depender de
tablas u objetos creados previamente.

> **Precaución:** el script inicial utiliza
> `CREATE DATABASE BancoSangre`. Si la base ya existe, la ejecución
> puede fallar. No elimine ni sobrescriba una base con información que
> deba conservarse.

## Objetos SQL

El repositorio incorpora distintas clases de objetos:

-   **Índices:** buscan mejorar el acceso a los datos en columnas
    utilizadas en filtros y búsquedas.
-   **Vistas:** presentan información combinada y reutilizable de varias
    tablas.
-   **Funciones:** encapsulan cálculos o consultas que pueden
    reutilizarse.
-   **Procedimientos almacenados:** permiten ejecutar operaciones
    parametrizadas desde SQL Server.
-   **Consultas:** responden preguntas de análisis relacionadas con
    donantes, personal, extracciones, componentes, solicitudes e
    inventario.

La utilidad y el rendimiento de estos objetos deben comprobarse con
ejecuciones reales y datos adecuados.

## Consultas oficiales y demostración

Las consultas oficiales se documentan en el informe técnico del proyecto
con su nombre y objetivo. El código fuente se mantiene en los archivos
SQL del repositorio. Durante la presentación del equipo se demostrará la
ejecución de las consultas seleccionadas y se explicarán los resultados
obtenidos.

Antes de la entrega, el equipo debe confirmar que todas las consultas
oficiales estén incluidas en los scripts definitivos, que los nombres de
tablas y columnas coincidan con el esquema y que los resultados sean
coherentes con los datos de prueba.

## Validación

Se recomienda verificar, como mínimo:

-   Que la base de datos y todas las tablas se creen sin errores.
-   Que la carga de datos termine correctamente y respete las claves y
    restricciones.
-   Que las vistas, funciones e índices se creen correctamente.
-   Que el procedimiento almacenado devuelva los resultados esperados
    para los años utilizados en la prueba.
-   Que las consultas se ejecuten y respondan a sus objetivos.
-   Que se documenten los casos probados, los resultados reales y los
    errores corregidos.

No se debe marcar una prueba como aprobada hasta haberla ejecutado y
revisado en SQL Server.

## Trabajo colaborativo

El proyecto se desarrolla de forma grupal. Se recomienda que cada
integrante trabaje en una rama o realice cambios pequeños y
descriptivos, revise los cambios antes de integrarlos y evite mantener
varias copias de un mismo script con sufijos diferentes.

## Alcance académico

Este proyecto es una solución académica de gestión de datos. La base de
datos organiza información y facilita consultas, pero no sustituye los
protocolos clínicos, los controles de calidad sanguínea ni las
decisiones del personal sanitario.

## Autores

Proyecto grupal de **Base de Datos II**. GRUPO 1 - Los Sauces 2.0


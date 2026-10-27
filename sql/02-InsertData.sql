-- =============================================================================
-- 2. POBLADO MASIVO PROFESIONAL - SISTEMA DE BANCO DE SANGRE (TARIJA, BOLIVIA)
-- Especialidad: Medicina Transfusional, Inmunohematología y Fraccionamiento
-- =============================================================================
USE BancoSangre;
GO
SET NOCOUNT ON;
SET DATEFORMAT ymd;
GO

-- 1. PAIS (5 registros: predominio Bolivia y países limítrofes del sur)
INSERT INTO Pais (Nombre) VALUES
('Bolivia'),    -- ID: 1
('Argentina'),  -- ID: 2
('Paraguay'),   -- ID: 3
('Chile'),      -- ID: 4
('Peru');       -- ID: 5
GO

-- 2. CIUDAD (20 registros: provincias de Tarija, capitales de Bolivia y frontera)
INSERT INTO Ciudad (Nombre, Pais_ID) VALUES
('Tarija (Cercado)', 1),           -- ID: 1
('Yacuiba', 1),                    -- ID: 2
('Bermejo', 1),                    -- ID: 3
('Villa Montes', 1),               -- ID: 4
('San Lorenzo (Mendez)', 1),       -- ID: 5
('Uriondo (Concepcion)', 1),       -- ID: 6
('Padcaya', 1),                    -- ID: 7
('Entre Rios (OConnor)', 1),       -- ID: 8
('Carapari', 1),                   -- ID: 9
('El Puente', 1),                  -- ID: 10
('Yunchara', 1),                   -- ID: 11
('La Paz', 1),                     -- ID: 12
('Santa Cruz de la Sierra', 1),    -- ID: 13
('Cochabamba', 1),                 -- ID: 14
('Sucre', 1),                      -- ID: 15
('Potosi', 1),                     -- ID: 16
('Oruro', 1),                      -- ID: 17
('Salta', 2),                      -- ID: 18
('San Salvador de Jujuy', 2),      -- ID: 19
('Asuncion', 3);                   -- ID: 20
GO

-- 3. DIRECCION (50 registros: hospitales, centros de salud y barrios de Tarija)
INSERT INTO Direccion (Calle, Ciudad_ID) VALUES
('Av. Potosi Nro 750 - Banco de Sangre de Referencia Departamental Tarija', 1), -- ID: 1
('Av. Victor Paz Estenssoro s/n - Hospital Regional San Juan de Dios', 1),      -- ID: 2
('Av. Victor Paz Estenssoro Nro 1240 - Hospital Obrero Nro 7 CNS', 1),          -- ID: 3
('Calle Gral. Trigo esq. Madrid - Plaza Luis de Fuentes y Vargas', 1),          -- ID: 4
('Av. Jaime Paz Zamora - Campus Universitario UAJMS El Tejar', 1),              -- ID: 5
('Calle Bolivar Nro 430 - Clinica Prost', 1),                                   -- ID: 6
('Calle Santa Cruz Nro 820 - Instituto Oncologico de Tarija', 1),               -- ID: 7
('Av. La Banda Nro 310 - Centro de Salud Integral San Jorge', 1),               -- ID: 8
('Calle Sucre Nro 615 - Clinica CIES Tarija', 1),                               -- ID: 9
('Av. Integracion Nro 1500 - Campo Ferial Multipropósito Fexpo Tarija', 1),     -- ID: 10
('Calle Cochabamba Nro 945 - Hospital Municipal San Antonio', 1),               -- ID: 11
('Calle Juan XXIII Nro 210 - Hospital Rubén Zelaya', 2),                        -- ID: 12
('Av. Petrolera s/n - Hospital Basico de Yacuiba', 2),                          -- ID: 13
('Av. Bolivar Nro 540 - Hospital Virgen de Chaguaya', 3),                       -- ID: 14
('Calle Campero esq. Avaroa - Hospital Basico Villa Montes', 4),                -- ID: 15
('Calle Jurado Nro 120 - Centro de Salud San Lorenzo', 5),                      -- ID: 16
('Plaza Principal 6 de Agosto s/n - Centro de Salud Concepcion', 6),            -- ID: 17
('Av. Panamericana Nro 305 - Centro de Salud Padcaya', 7),                      -- ID: 18
('Calle Comercio Nro 180 - Hospital Basico Entre Rios', 8),                     -- ID: 19
('Barrio El Molino, Calle Corrado Nro 452', 1),                                 -- ID: 20
('Barrio Las Panosas, Calle Virginio Lema Nro 318', 1),                         -- ID: 21
('Barrio San Roque, Calle Fray Manuel Mingo Nro 712', 1),                       -- ID: 22
('Barrio Senac, Av. Los Ceibos Nro 145', 1),                                    -- ID: 23
('Barrio Tabladita, Calle Avaroa Nro 1120', 1),                                 -- ID: 24
('Barrio Juan XXIII, Av. Circunvalacion Nro 890', 1),                           -- ID: 25
('Barrio Guadalquivir, Calle Los Sauces Nro 234', 1),                           -- ID: 26
('Barrio Miraflores, Av. Las Americas Nro 670', 1),                             -- ID: 27
('Barrio Moto Mendez, Calle Eustaquio Mendez Nro 405', 1),                      -- ID: 28
('Barrio Simon Bolivar, Calle Daniel Campos Nro 990', 1),                       -- ID: 29
('Barrio La Pampa, Calle Oruro Nro 560', 1),                                    -- ID: 30
('Barrio Villa Avaroa, Calle Junin Nro 810', 1),                                -- ID: 31
('Barrio Lourdes, Calle Ballivian Nro 1340', 1),                                -- ID: 32
('Barrio San Bernardo, Av. Héroes del Chaco Nro 320', 1),                       -- ID: 33
('Barrio Defensores del Chaco, Calle Boqueron Nro 215', 1),                     -- ID: 34
('Barrio Aranjuez, Av. Los Parrales Nro 190', 1),                               -- ID: 35
('Barrio Morros Blancos, Av. Fuerza Aerea Nro 740', 1),                         -- ID: 36
('Barrio Pedro Antonio Flores, Calle Colon Nro 1105', 1),                       -- ID: 37
('Barrio Narciso Campero, Calle Ingavi Nro 625', 1),                            -- ID: 38
('Barrio 4 de Julio, Calle Mendez Arcos Nro 330', 1),                           -- ID: 39
('Barrio San Geronimo, Av. Costanera del Guadalquivir Nro 510', 1),             -- ID: 40
('Barrio San Jose, Calle Crevaux Nro 412', 2),                                  -- ID: 41
('Barrio Lourdes, Av. Santa Cruz Nro 780', 2),                                  -- ID: 42
('Barrio Azucarero, Calle Tarija Nro 250', 3),                                  -- ID: 43
('Barrio Ferroviario, Av. Pilcomayo Nro 615', 4),                               -- ID: 44
('Zona Tomatitas, Av. Principal Nro 140', 5),                                   -- ID: 45
('Comunidad Calamuchita, Ruta al Valle Nro 85', 6),                             -- ID: 46
('Zona Sopocachi, Av. 6 de Agosto Nro 2410', 12),                               -- ID: 47
('Equipetrol Norte, Calle 4 Este Nro 125', 13),                                 -- ID: 48
('Zona Cala Cala, Av. America Nro 980', 14),                                    -- ID: 49
('Calle Caseros Nro 650 - Centro Ciudad', 18);                                  -- ID: 50
GO

-- 4. PERSONA (90 registros: 1-15 Personal del Banco; 16-90 Donantes y Receptores)
INSERT INTO Persona (Nombre, ApPaterno, ApMaterno, FechaNacimiento, DocumentoDeIdentidad, Sexo) VALUES
('Carlos Eduardo', 'Kohlberg', 'Castellanos', '1978-04-12', '1845201-TJA', 'M'),     -- ID: 1
('Maria Fernanda', 'Navajas', 'Lea Plaza', '1982-09-23', '1890342-TJA', 'F'),        -- ID: 2
('Rodrigo Javier', 'Trigo', 'Baldiviezo', '1985-01-15', '5012983-TJA', 'M'),         -- ID: 3
('Valeria Soledad', 'Echazu', 'Paz', '1990-06-30', '7120491-TJA', 'F'),              -- ID: 4
('Luis Fernando', 'Zamora', 'Raña', '1980-11-08', '1876543-TJA', 'M'),               -- ID: 5
('Claudia Patricia', 'Avila', 'Tejerina', '1988-03-19', '5049182-TJA', 'F'),         -- ID: 6
('Jorge Antonio', 'Vacaflores', 'Hoyos', '1983-07-25', '1899204-TJA', 'M'),          -- ID: 7
('Gabriela Alejandra', 'Gareca', 'Soruco', '1992-12-04', '7189302-TJA', 'F'),        -- ID: 8
('Marcelo Alejandro', 'Darwich', 'Mogro', '1987-05-14', '5088321-TJA', 'M'),         -- ID: 9
('Paola Andrea', 'Ruiz', 'Tolaba', '1994-08-21', '7201948-TJA', 'F'),                -- ID: 10
('Diego Mauricio', 'Jurado', 'Aparicio', '1991-02-10', '7145029-TJA', 'M'),          -- ID: 11
('Carla Jimena', 'Farfan', 'Copa', '1989-10-17', '5092817-TJA', 'F'),                -- ID: 12
('Gustavo Adolfo', 'Segovia', 'Ontiveros', '1984-04-03', '1865930-TJA', 'M'),        -- ID: 13
('Daniela Belen', 'Castrillo', 'Zenteno', '1995-07-29', '7239104-TJA', 'F'),         -- ID: 14
('Ramiro Hernan', 'Michel', 'Campero', '1979-12-11', '1850293-TJA', 'M'),            -- ID: 15
('Juan Pablo', 'Castellanos', 'Arce', '1996-03-05', '7250192-TJA', 'M'),             -- ID: 16
('Lucia Mariana', 'Lea Plaza', 'Mendez', '1998-05-18', '10623819-TJA', 'F'),         -- ID: 17
('Sergio Andres', 'Baldiviezo', 'Cossio', '1993-11-22', '7190283-TJA', 'M'),         -- ID: 18
('Camila Victoria', 'Paz', 'Estenssoro', '2000-01-14', '10789201-TJA', 'F'),         -- ID: 19
('Cristian David', 'Raña', 'Figueroa', '1986-09-09', '5067123-TJA', 'M'),            -- ID: 20
('Natalia Carolina', 'Tejerina', 'Guzman', '1997-04-27', '7289103-TJA', 'F'),        -- ID: 21
('Alvaro Sebastian', 'Hoyos', 'Vaca', '1991-08-13', '7156290-TJA', 'M'),             -- ID: 22
('Fabiana Rocio', 'Soruco', 'Lopez', '1999-02-28', '10691823-TJA', 'F'),             -- ID: 23
('Oscar Eduardo', 'Mogro', 'Sanchez', '1984-06-16', '5023891-TJA', 'M'),             -- ID: 24
('Veronica Cecilia', 'Tolaba', 'Choque', '1990-12-01', '7110293-TJA', 'F'),          -- ID: 25
('Hugo Armando', 'Aparicio', 'Reyes', '1982-03-24', '1889201-TJA', 'M'),             -- ID: 26
('Adriana Lorena', 'Copa', 'Mamani', '1995-09-15', '7241092-TJA', 'F'),              -- ID: 27
('Fernando Jose', 'Ontiveros', 'Vargas', '1988-07-07', '5078192-TJA', 'M'),          -- ID: 28
('Silvana Beatriz', 'Zenteno', 'Flores', '1993-01-30', '7182901-TJA', 'F'),          -- ID: 29
('Roberto Carlos', 'Campero', 'Ugarte', '1981-05-19', '1870192-TJA', 'M'),           -- ID: 30
('Mariela Ines', 'Arce', 'Calderon', '1996-10-08', '7267182-TJA', 'F'),              -- ID: 31
('Julio Cesar', 'Mendez', 'Cardozo', '1989-02-14', '5089102-TJA', 'M'),              -- ID: 32
('Tatiana Elizabeth', 'Cossio', 'Salazar', '2001-06-21', '10812903-TJA', 'F'),       -- ID: 33
('Marco Antonio', 'Figueroa', 'Romero', '1987-11-11', '5071892-TJA', 'M'),           -- ID: 34
('Pamela Alejandra', 'Guzman', 'Pinto', '1994-04-04', '7210928-TJA', 'F'),           -- ID: 35
('Edgar Rolando', 'Vaca', 'Galean', '1983-08-26', '1892019-TJA', 'M'),               -- ID: 36
('Lorena Patricia', 'Lopez', 'Velasquez', '1998-12-17', '10651920-TJA', 'F'),        -- ID: 37
('Victor Hugo', 'Sanchez', 'Ortega', '1992-03-03', '7178291-TJA', 'M'),              -- ID: 38
('Monica Liliana', 'Choque', 'Condori', '1986-07-23', '5056192-TJA', 'F'),           -- ID: 39
('Gonzalo Martin', 'Reyes', 'Borda', '1990-01-09', '7102938-TJA', 'M'),              -- ID: 40
('Cecilia Noemi', 'Mamani', 'Quispe', '1997-05-29', '7290182-TJA', 'F'),             -- ID: 41
('Ruben Dario', 'Vargas', 'Peralta', '1985-09-12', '5034918-TJA', 'M'),              -- ID: 42
('Ximena Raquel', 'Flores', 'Aguilar', '2002-02-06', '10890123-TJA', 'F'),           -- ID: 43
('Pablo Esteban', 'Ugarte', 'Medina', '1991-06-18', '7160291-TJA', 'M'),             -- ID: 44
('Karina Marisol', 'Calderon', 'Rios', '1989-10-25', '5098123-TJA', 'F'),            -- ID: 45
('Milton Rene', 'Cardozo', 'Garzon', '1984-01-31', '5019283-TJA', 'M'),              -- ID: 46
('Vanesa Judith', 'Salazar', 'Molina', '1995-04-15', '7230192-TJA', 'F'),            -- ID: 47
('Hector Ivan', 'Romero', 'Benitez', '1993-08-08', '7198201-TJA', 'M'),              -- ID: 48
('Fabiola Carmen', 'Pinto', 'Cabrera', '1999-11-20', '10712938-TJA', 'F'),           -- ID: 49
('Javier Ernesto', 'Galean', 'Cuellar', '1988-02-27', '5081920-TJA', 'M'),           -- ID: 50
('Roxana Elizabeth', 'Velasquez', 'Tapia', '1992-07-14', '7180293-TJA', 'F'),        -- ID: 51
('Miguel Angel', 'Ortega', 'Serrano', '1980-10-02', '1860192-TJA', 'M'),             -- ID: 52
('Patricia Eugenia', 'Condori', 'Ayala', '1996-01-19', '7259102-TJA', 'F'),          -- ID: 53
('Alejandro Daniel', 'Borda', 'Padilla', '2000-05-05', '10792019-TJA', 'M'),         -- ID: 54
('Sandra Marcela', 'Quispe', 'Torrez', '1987-09-28', '5074918-LP', 'F'),             -- ID: 55
('David Leonardo', 'Peralta', 'Suarez', '1994-12-10', '7219023-SCZ', 'M'),           -- ID: 56
('carmen Rosa', 'Aguilar', 'Peñaranda', '1983-03-16', '1895012-CHQ', 'F'),           -- ID: 57
('Jose Luis', 'Medina', 'Llanos', '1991-07-22', '7165920-CBBA', 'M'),                -- ID: 58
('Leticia Viviana', 'Rios', 'Barrios', '1998-11-03', '10649182-TJA', 'F'),           -- ID: 59
('Raul Alberto', 'Garzon', 'Nieves', '1986-04-18', '5060192-TJA', 'M'),              -- ID: 60
('Miriam Gladis', 'Molina', 'humacata', '1965-08-29', '1810293-TJA', 'F'),           -- ID: 61
('Eduardo Simon', 'Benitez', 'Burgos', '1972-12-12', '1829301-TJA', 'M'),            -- ID: 62
('Teresa Margarita', 'Cabrera', 'Lema', '1968-02-04', '1819203-TJA', 'F'),           -- ID: 63
('Mario Alberto', 'Cuellar', 'Sandoval', '1975-06-25', '1834912-TJA', 'M'),          -- ID: 64
('Elena Victoria', 'Tapia', 'Gutiérrez', '1960-10-15', '1790283-TJA', 'F'),          -- ID: 65
('Walter Armando', 'Serrano', 'Zeballos', '1970-01-07', '1820194-TJA', 'M'),         -- ID: 66
('Rosa Maria', 'Ayala', 'Montes', '1981-05-30', '1874920-TJA', 'F'),                 -- ID: 67
('Arturo Federico', 'Padilla', 'Carrizo', '1977-09-14', '1840192-TJA', 'M'),         -- ID: 68
('Norma Angelica', 'Torrez', 'Hurtado', '1963-03-21', '1802938-PTS', 'F'),           -- ID: 69
('Hernan Patricio', 'Suarez', 'Justiniano', '1985-07-08', '5039182-SCZ', 'M'),       -- ID: 70
('Martha Alicia', 'Peñaranda', 'Daza', '1974-11-19', '1831029-CHQ', 'F'),            -- ID: 71
('Oscar Mauricio', 'Llanos', 'Villarroel', '1990-04-02', '7108293-ORU', 'M'),        -- ID: 72
('Beatriz Clara', 'Barrios', 'Abdo', '1988-08-17', '28910293-ARG', 'F'),             -- ID: 73
('Matias Ezequiel', 'Nieves', 'Ovejero', '1992-12-28', '35102938-ARG', 'M'),         -- ID: 74
('Silvia Graciela', 'Humacata', 'Valdez', '1979-02-11', '1854920-TJA', 'F'),         -- ID: 75
('Ricardo Tomas', 'Burgos', 'Cata', '1967-06-06', '1815029-TJA', 'M'),               -- ID: 76
('Juana Francisca', 'Lema', 'Retamozo', '1971-10-23', '1824910-TJA', 'F'),           -- ID: 77
('Nelson Ovidio', 'Sandoval', 'Gallardo', '1982-01-15', '1884920-TJA', 'M'),         -- ID: 78
('Gladys Nelly', 'Gutierrez', 'Colque', '1969-05-09', '1821093-TJA', 'F'),           -- ID: 79
('Rene Osvaldo', 'Zeballos', 'Maraz', '1976-09-27', '1839102-TJA', 'M'),             -- ID: 80
('Susana Raquel', 'Montes', 'Ordoñez', '1984-12-14', '5028193-TJA', 'F'),            -- ID: 81
('bertha Elsa', 'Carrizo', 'Panique', '1962-04-03', '1798201-TJA', 'F'),             -- ID: 82
('Felix Antenor', 'Hurtado', 'Bejarano', '1958-08-19', '1782910-TJA', 'M'),          -- ID: 83
('Yolanda Esther', 'Justiniano', 'Añez', '1973-02-25', '1828192-TJA', 'F'),          -- ID: 84
('Wilfredo Cesar', 'Daza', 'Subia', '1966-07-11', '1812093-TJA', 'M'),               -- ID: 85
('Sonia Lourdes', 'Villarroel', 'Claros', '1980-11-30', '1864920-TJA', 'F'),         -- ID: 86
('Armando Efren', 'Abdo', 'Bascope', '1978-03-08', '1843920-TJA', 'M'),              -- ID: 87
('Olga Cristina', 'Ovejero', 'Palacios', '1964-09-01', '1807192-TJA', 'F'),          -- ID: 88
('Nicolas Mateo', 'Valdez', 'Irahola', '2004-06-12', '12901823-TJA', 'M'),           -- ID: 89
('Luciana Sofia', 'Cata', 'Lizarraga', '2005-10-20', '13019283-TJA', 'F');           -- ID: 90
GO

-- 5. EMAIL (90 registros: formato válido %_@__%.__% y único por persona)
INSERT INTO Email (Persona_ID, DireccionE, FechaRegistro, Flag) VALUES
(1, 'ckohlberg.hemato@bancosangretarija.gob.bo', '2024-01-10 08:00:00', 1),
(2, 'mnavajas.lab@bancosangretarija.gob.bo', '2024-01-10 08:05:00', 1),
(3, 'rtrigo.fraccionamiento@bancosangretarija.gob.bo', '2024-01-10 08:10:00', 1),
(4, 'vechazu.serologia@bancosangretarija.gob.bo', '2024-01-10 08:15:00', 1),
(5, 'lfzamora.calidad@bancosangretarija.gob.bo', '2024-01-10 08:20:00', 1),
(6, 'cavila.inmuno@bancosangretarija.gob.bo', '2024-01-10 08:25:00', 1),
(7, 'jvacaflores.hemoterapia@bancosangretarija.gob.bo', '2024-01-10 08:30:00', 1),
(8, 'ggareca.flebotomia@bancosangretarija.gob.bo', '2024-01-10 08:35:00', 1),
(9, 'mdarwich.aferesis@bancosangretarija.gob.bo', '2024-01-10 08:40:00', 1),
(10, 'pruiz.enfermeria@bancosangretarija.gob.bo', '2024-01-10 08:45:00', 1),
(11, 'djurado.kardex@bancosangretarija.gob.bo', '2024-01-10 08:50:00', 1),
(12, 'cfarfan.colectas@bancosangretarija.gob.bo', '2024-01-10 08:55:00', 1),
(13, 'gsegovia.sistemas@bancosangretarija.gob.bo', '2024-01-10 09:00:00', 1),
(14, 'dcastrillo.recepcion@bancosangretarija.gob.bo', '2024-01-10 09:05:00', 1),
(15, 'rmichel.direccion@hrsjd-tarija.gob.bo', '2024-01-10 09:10:00', 1),
(16, 'jpcastellanos96@uajms.edu.bo', '2025-02-01 09:00:00', 1),
(17, 'lucia.leaplaza@uajms.edu.bo', '2025-02-01 09:15:00', 1),
(18, 'sergio.baldiviezo@gmail.com', '2025-02-02 10:00:00', 1),
(19, 'camila.paz2000@uajms.edu.bo', '2025-02-02 10:20:00', 1),
(20, 'cristian.rana86@hotmail.com', '2025-02-03 11:00:00', 1),
(21, 'natalia.tejerina@gmail.com', '2025-02-03 11:30:00', 1),
(22, 'alvaro.hoyos.tja@gmail.com', '2025-02-04 08:45:00', 1),
(23, 'fabiana.soruco99@uajms.edu.bo', '2025-02-04 09:10:00', 1),
(24, 'oscar.mogro84@gmail.com', '2025-02-05 10:05:00', 1),
(25, 'vero.tolaba90@yahoo.com', '2025-02-05 10:40:00', 1),
(26, 'hugo.aparicio.tja@gmail.com', '2025-02-06 08:30:00', 1),
(27, 'adriana.copa95@gmail.com', '2025-02-06 09:15:00', 1),
(28, 'fernando.ontiveros@cosett.com.bo', '2025-02-07 11:00:00', 1),
(29, 'silvana.zenteno@gmail.com', '2025-02-07 14:20:00', 1),
(30, 'roberto.campero81@gmail.com', '2025-02-08 08:50:00', 1),
(31, 'mariela.arce96@uajms.edu.bo', '2025-02-08 09:30:00', 1),
(32, 'julio.mendez.tja@gmail.com', '2025-02-09 10:15:00', 1),
(33, 'tatiana.cossio01@uajms.edu.bo', '2025-02-09 11:00:00', 1),
(34, 'marco.figueroa87@gmail.com', '2025-02-10 08:40:00', 1),
(35, 'pamela.guzman94@hotmail.com', '2025-02-10 09:25:00', 1),
(36, 'edgar.vaca.bermejo@gmail.com', '2025-02-11 10:10:00', 1),
(37, 'lorena.lopez98@uajms.edu.bo', '2025-02-11 11:05:00', 1),
(38, 'victor.sanchez92@gmail.com', '2025-02-12 08:30:00', 1),
(39, 'monica.choque86@gmail.com', '2025-02-12 09:45:00', 1),
(40, 'gonzalo.reyes90@gmail.com', '2025-02-13 10:20:00', 1),
(41, 'cecilia.mamani97@uajms.edu.bo', '2025-02-13 11:15:00', 1),
(42, 'ruben.vargas.yacuiba@gmail.com', '2025-02-14 08:50:00', 1),
(43, 'ximena.flores02@uajms.edu.bo', '2025-02-14 09:30:00', 1),
(44, 'pablo.ugarte91@gmail.com', '2025-02-15 10:00:00', 1),
(45, 'karina.calderon89@hotmail.com', '2025-02-15 11:20:00', 1),
(46, 'milton.cardozo84@gmail.com', '2025-02-16 08:35:00', 1),
(47, 'vanesa.salazar95@gmail.com', '2025-02-16 09:50:00', 1),
(48, 'hector.romero93@gmail.com', '2025-02-17 10:30:00', 1),
(49, 'fabiola.pinto99@uajms.edu.bo', '2025-02-17 11:45:00', 1),
(50, 'javier.galean88@gmail.com', '2025-02-18 08:15:00', 1),
(51, 'roxana.velasquez92@gmail.com', '2025-02-18 09:30:00', 1),
(52, 'miguel.ortega80@gmail.com', '2025-02-19 10:05:00', 1),
(53, 'patricia.condori96@gmail.com', '2025-02-19 11:10:00', 1),
(54, 'alejandro.borda00@uajms.edu.bo', '2025-02-20 08:40:00', 1),
(55, 'sandra.quispe.lp@gmail.com', '2025-02-20 09:55:00', 1),
(56, 'david.peralta.scz@gmail.com', '2025-02-21 10:25:00', 1),
(57, 'carmen.aguilar.chq@gmail.com', '2025-02-21 11:30:00', 1),
(58, 'joseluis.medina.cbba@gmail.com', '2025-02-22 08:50:00', 1),
(59, 'leticia.rios98@uajms.edu.bo', '2025-02-22 09:40:00', 1),
(60, 'raul.garzon86@gmail.com', '2025-02-23 10:15:00', 1),
(61, 'miriam.molina65@gmail.com', '2025-03-01 08:20:00', 1),
(62, 'eduardo.benitez72@gmail.com', '2025-03-01 09:10:00', 1),
(63, 'teresa.cabrera68@gmail.com', '2025-03-02 10:00:00', 1),
(64, 'mario.cuellar75@gmail.com', '2025-03-02 11:05:00', 1),
(65, 'elena.tapia60@gmail.com', '2025-03-03 08:30:00', 1),
(66, 'walter.serrano70@gmail.com', '2025-03-03 09:45:00', 1),
(67, 'rosamaria.ayala81@gmail.com', '2025-03-04 10:20:00', 1),
(68, 'arturo.padilla77@gmail.com', '2025-03-04 11:15:00', 1),
(69, 'norma.torrez63@gmail.com', '2025-03-05 08:40:00', 1),
(70, 'hernan.suarez85@gmail.com', '2025-03-05 09:50:00', 1),
(71, 'martha.penaranda74@gmail.com', '2025-03-06 10:30:00', 1),
(72, 'oscar.llanos90@gmail.com', '2025-03-06 11:25:00', 1),
(73, 'beatriz.barrios.salta@gmail.com.ar', '2025-03-07 08:35:00', 1),
(74, 'matias.nieves.jujuy@gmail.com.ar', '2025-03-07 09:40:00', 1),
(75, 'silvia.humacata79@gmail.com', '2025-03-08 10:15:00', 1),
(76, 'ricardo.burgos67@gmail.com', '2025-03-08 11:10:00', 1),
(77, 'juana.lema71@gmail.com', '2025-03-09 08:45:00', 1),
(78, 'nelson.sandoval82@gmail.com', '2025-03-09 09:55:00', 1),
(79, 'gladys.gutierrez69@gmail.com', '2025-03-10 10:25:00', 1),
(80, 'rene.zeballos76@gmail.com', '2025-03-10 11:30:00', 1),
(81, 'susana.montes84@gmail.com', '2025-03-11 08:20:00', 1),
(82, 'bertha.carrizo62@gmail.com', '2025-03-11 09:15:00', 1),
(83, 'felix.hurtado58@gmail.com', '2025-03-12 10:05:00', 1),
(84, 'yolanda.justiniano73@gmail.com', '2025-03-12 11:00:00', 1),
(85, 'wilfredo.daza66@gmail.com', '2025-03-13 08:50:00', 1),
(86, 'sonia.villarroel80@gmail.com', '2025-03-13 09:35:00', 1),
(87, 'armando.abdo78@gmail.com', '2025-03-14 10:20:00', 1),
(88, 'olga.ovejero64@gmail.com', '2025-03-14 11:15:00', 1),
(89, 'nicolas.valdez04@uajms.edu.bo', '2025-03-15 08:30:00', 1),
(90, 'luciana.cata05@uajms.edu.bo', '2025-03-15 09:20:00', 1);
GO

-- 6. TELEFONO (90 registros: prefijos reales de Tarija 729/718/658/466 y +591/+54)
INSERT INTO Telefono (Persona_ID, numTelefono, CodPais, TipoTelefono, FechaRegistro, Flag) VALUES
(1, '72981001', '+591', 'Trabajo', '2024-01-10 08:00:00', 1),
(2, '72981002', '+591', 'Trabajo', '2024-01-10 08:05:00', 1),
(3, '72981003', '+591', 'Trabajo', '2024-01-10 08:10:00', 1),
(4, '72981004', '+591', 'Trabajo', '2024-01-10 08:15:00', 1),
(5, '72981005', '+591', 'Trabajo', '2024-01-10 08:20:00', 1),
(6, '72981006', '+591', 'Trabajo', '2024-01-10 08:25:00', 1),
(7, '72981007', '+591', 'Trabajo', '2024-01-10 08:30:00', 1),
(8, '72981008', '+591', 'Movil', '2024-01-10 08:35:00', 1),
(9, '72981009', '+591', 'Movil', '2024-01-10 08:40:00', 1),
(10, '72981010', '+591', 'Movil', '2024-01-10 08:45:00', 1),
(11, '46642011', '+591', 'Fijo', '2024-01-10 08:50:00', 1),
(12, '72981012', '+591', 'Movil', '2024-01-10 08:55:00', 1),
(13, '46642013', '+591', 'Trabajo', '2024-01-10 09:00:00', 1),
(14, '46642014', '+591', 'Fijo', '2024-01-10 09:05:00', 1),
(15, '46642015', '+591', 'Emergencia', '2024-01-10 09:10:00', 1),
(16, '71860016', '+591', 'Movil', '2025-02-01 09:00:00', 1),
(17, '71860017', '+591', 'Movil', '2025-02-01 09:15:00', 1),
(18, '71860018', '+591', 'Movil', '2025-02-02 10:00:00', 1),
(19, '71860019', '+591', 'Movil', '2025-02-02 10:20:00', 1),
(20, '71860020', '+591', 'Movil', '2025-02-03 11:00:00', 1),
(21, '71860021', '+591', 'Movil', '2025-02-03 11:30:00', 1),
(22, '71860022', '+591', 'Movil', '2025-02-04 08:45:00', 1),
(23, '71860023', '+591', 'Movil', '2025-02-04 09:10:00', 1),
(24, '71860024', '+591', 'Movil', '2025-02-05 10:05:00', 1),
(25, '71860025', '+591', 'Movil', '2025-02-05 10:40:00', 1),
(26, '65820026', '+591', 'Movil', '2025-02-06 08:30:00', 1),
(27, '65820027', '+591', 'Movil', '2025-02-06 09:15:00', 1),
(28, '46631028', '+591', 'Fijo', '2025-02-07 11:00:00', 1),
(29, '65820029', '+591', 'Movil', '2025-02-07 14:20:00', 1),
(30, '65820030', '+591', 'Movil', '2025-02-08 08:50:00', 1),
(31, '65820031', '+591', 'Movil', '2025-02-08 09:30:00', 1),
(32, '65820032', '+591', 'Movil', '2025-02-09 10:15:00', 1),
(33, '65820033', '+591', 'Movil', '2025-02-09 11:00:00', 1),
(34, '65820034', '+591', 'Movil', '2025-02-10 08:40:00', 1),
(35, '65820035', '+591', 'Movil', '2025-02-10 09:25:00', 1),
(36, '46972036', '+591', 'Fijo', '2025-02-11 10:10:00', 1),
(37, '76180037', '+591', 'Movil', '2025-02-11 11:05:00', 1),
(38, '76180038', '+591', 'Movil', '2025-02-12 08:30:00', 1),
(39, '76180039', '+591', 'Movil', '2025-02-12 09:45:00', 1),
(40, '76180040', '+591', 'Movil', '2025-02-13 10:20:00', 1),
(41, '76180041', '+591', 'Movil', '2025-02-13 11:15:00', 1),
(42, '46822042', '+591', 'Fijo', '2025-02-14 08:50:00', 1),
(43, '76180043', '+591', 'Movil', '2025-02-14 09:30:00', 1),
(44, '76180044', '+591', 'Movil', '2025-02-15 10:00:00', 1),
(45, '76180045', '+591', 'Movil', '2025-02-15 11:20:00', 1),
(46, '72990046', '+591', 'Movil', '2025-02-16 08:35:00', 1),
(47, '72990047', '+591', 'Movil', '2025-02-16 09:50:00', 1),
(48, '72990048', '+591', 'Movil', '2025-02-17 10:30:00', 1),
(49, '72990049', '+591', 'Movil', '2025-02-17 11:45:00', 1),
(50, '72990050', '+591', 'Movil', '2025-02-18 08:15:00', 1),
(51, '72990051', '+591', 'Movil', '2025-02-18 09:30:00', 1),
(52, '72990052', '+591', 'Movil', '2025-02-19 10:05:00', 1),
(53, '72990053', '+591', 'Movil', '2025-02-19 11:10:00', 1),
(54, '72990054', '+591', 'Movil', '2025-02-20 08:40:00', 1),
(55, '71540055', '+591', 'Movil', '2025-02-20 09:55:00', 1),
(56, '70830056', '+591', 'Movil', '2025-02-21 10:25:00', 1),
(57, '72870057', '+591', 'Movil', '2025-02-21 11:30:00', 1),
(58, '70710058', '+591', 'Movil', '2025-02-22 08:50:00', 1),
(59, '72990059', '+591', 'Movil', '2025-02-22 09:40:00', 1),
(60, '72990060', '+591', 'Movil', '2025-02-23 10:15:00', 1),
(61, '71860061', '+591', 'Emergencia', '2025-03-01 08:20:00', 1),
(62, '71860062', '+591', 'Emergencia', '2025-03-01 09:10:00', 1),
(63, '46650063', '+591', 'Fijo', '2025-03-02 10:00:00', 1),
(64, '71860064', '+591', 'Emergencia', '2025-03-02 11:05:00', 1),
(65, '46650065', '+591', 'Fijo', '2025-03-03 08:30:00', 1),
(66, '71860066', '+591', 'Emergencia', '2025-03-03 09:45:00', 1),
(67, '71860067', '+591', 'Movil', '2025-03-04 10:20:00', 1),
(68, '71860068', '+591', 'Movil', '2025-03-04 11:15:00', 1),
(69, '71860069', '+591', 'Emergencia', '2025-03-05 08:40:00', 1),
(70, '71860070', '+591', 'Movil', '2025-03-05 09:50:00', 1),
(71, '71860071', '+591', 'Movil', '2025-03-06 10:30:00', 1),
(72, '71860072', '+591', 'Movil', '2025-03-06 11:25:00', 1),
(73, '3874500073', '+54', 'Movil', '2025-03-07 08:35:00', 1),
(74, '3884200074', '+54', 'Movil', '2025-03-07 09:40:00', 1),
(75, '65830075', '+591', 'Movil', '2025-03-08 10:15:00', 1),
(76, '65830076', '+591', 'Emergencia', '2025-03-08 11:10:00', 1),
(77, '65830077', '+591', 'Emergencia', '2025-03-09 08:45:00', 1),
(78, '65830078', '+591', 'Movil', '2025-03-09 09:55:00', 1),
(79, '46650079', '+591', 'Fijo', '2025-03-10 10:25:00', 1),
(80, '65830080', '+591', 'Emergencia', '2025-03-10 11:30:00', 1),
(81, '65830081', '+591', 'Movil', '2025-03-11 08:20:00', 1),
(82, '46650082', '+591', 'Fijo', '2025-03-11 09:15:00', 1),
(83, '46650083', '+591', 'Emergencia', '2025-03-12 10:05:00', 1),
(84, '65830084', '+591', 'Movil', '2025-03-12 11:00:00', 1),
(85, '65830085', '+591', 'Emergencia', '2025-03-13 08:50:00', 1),
(86, '65830086', '+591', 'Movil', '2025-03-13 09:35:00', 1),
(87, '65830087', '+591', 'Movil', '2025-03-14 10:20:00', 1),
(88, '46650088', '+591', 'Fijo', '2025-03-14 11:15:00', 1),
(89, '65830089', '+591', 'Movil', '2025-03-15 08:30:00', 1),
(90, '65830090', '+591', 'Movil', '2025-03-15 09:20:00', 1);
GO

-- 7. CARGO (12 registros: organigrama funcional de un Banco de Sangre de Referencia)
INSERT INTO Cargo (Nombre, Activo) VALUES
('Medico Hematologo y Hemoterapista Jefe', 1),                     -- ID: 1
('Bioquimico Jefe de Inmunohematologia', 1),                       -- ID: 2
('Bioquimico Especialista en Fraccionamiento Sanguineo', 1),       -- ID: 3
('Bioquimico de Tamizaje Serologico y Biologia Molecular', 1),     -- ID: 4
('Bioquimico Responsable de Control de Calidad', 1),               -- ID: 5
('Bioquimico de Pruebas Cruzadas y Medicina Transfusional', 1),    -- ID: 6
('Tecnico Superior en Hemoterapia y Flebotomia', 1),               -- ID: 7
('Licenciado en Enfermeria Especialista en Aferesis', 1),          -- ID: 8
('Licenciado en Enfermeria de Seleccion Predonacion', 1),          -- ID: 9
('Promotor de Donacion Voluntaria y Colectas Moviles', 1),         -- ID: 10
('Encargado de Kardex, Cadena de Frio y Despacho', 1),             -- ID: 11
('Auxiliar de Esterilizacion y Bioseguridad', 0);                  -- ID: 12
GO

-- 8. ENFERMEDAD (25 registros: patologías de tamizaje y diferimiento en Tarija/Bolivia)
-- CHECK: Gravedad IN ('Rechazo permanente','Rechazo temporal','Cronica/Sistematica','TranstornoS&G')
INSERT INTO Enfermedad (Enfermedad, Gravedad) VALUES
('Enfermedad de Chagas (Trypanosoma cruzi Reactivo)', 'Rechazo permanente'),       -- ID: 1
('Infeccion por VIH 1/2 (ELISA/Quimioluminiscencia)', 'Rechazo permanente'),       -- ID: 2
('Hepatitis B Cronica (HBsAg y Anti-HBc Reactivo)', 'Rechazo permanente'),         -- ID: 3
('Hepatitis C (Anti-VHC Reactivo)', 'Rechazo permanente'),                         -- ID: 4
('Sifilis Activa (Treponema pallidum RPR/ELISA Reactivo)', 'Rechazo permanente'),  -- ID: 5
('Infeccion por Virus Linfotropico HTLV I/II', 'Rechazo permanente'),              -- ID: 6
('Antecedente de Neoplasia Maligna Hematologica', 'Rechazo permanente'),           -- ID: 7
('Dengue Clasico Reciente (< 6 meses en Bermejo/Yacuiba)', 'Rechazo temporal'),    -- ID: 8
('Malaria / Paludismo Tratado (< 12 meses)', 'Rechazo temporal'),                  -- ID: 9
('Tatuaje, Piercing o Acupuntura Reciente (< 12 meses)', 'Rechazo temporal'),      -- ID: 10
('Embarazo en Curso o Lactancia Materna (< 6 meses)', 'Rechazo temporal'),         -- ID: 11
('Tratamiento Antibiotico Agudo (< 14 dias)', 'Rechazo temporal'),                 -- ID: 12
('Cirugia Mayor o Endoscopia Reciente (< 6 meses)', 'Rechazo temporal'),           -- ID: 13
('Extraccion Dental sin Complicaciones (< 7 dias)', 'Rechazo temporal'),           -- ID: 14
('Hipertension Arterial Sistemica Descompensada', 'Cronica/Sistematica'),          -- ID: 15
('Diabetes Mellitus Tipo 1 Insulinodependiente', 'Cronica/Sistematica'),           -- ID: 16
('Insuficiencia Renal Cronica en Hemodialisis', 'Cronica/Sistematica'),            -- ID: 17
('Cardiopatia Chagasica Cronica Dilatada', 'Cronica/Sistematica'),                 -- ID: 18
('Cirrosis Hepatica e Hipertension Portal', 'Cronica/Sistematica'),                -- ID: 19
('Anemia Ferropenica Severa Sintomatica', 'TranstornoS&G'),                        -- ID: 20
('Hemofilia A (Deficit Congenito de Factor VIII)', 'TranstornoS&G'),               -- ID: 21
('Enfermedad de von Willebrand Tipo II', 'TranstornoS&G'),                         -- ID: 22
('Purpura Trombocitopenica Inmune (PTI)', 'TranstornoS&G'),                        -- ID: 23
('Policitemia Vera / Eritrocitosis Patologica', 'TranstornoS&G'),                  -- ID: 24
('Coagulopatia Intravascular Diseminada (CID)', 'TranstornoS&G');                  -- ID: 25
GO

-- 9. TIPOCOMPONENTE (10 registros: hemocomponentes primarios y de sub-fraccionamiento)
INSERT INTO TipoComponente (TipoComponente, DiasVigencia, CondicionDeAlmacenamiento) VALUES
('Sangre Total (ST - Unidad Madre)', 35, 'Refrigeracion de 2°C a 6°C (previo a fraccionamiento < 8h)'),  -- ID: 1
('Concentrado de Eritrocitos (CE en SAG-Manitol)', 42, 'Refrigeracion controlada de 2°C a 6°C'),         -- ID: 2
('Concentrado de Eritrocitos Leucorreducido (CEL)', 42, 'Refrigeracion controlada de 2°C a 6°C'),        -- ID: 3
('Plasma Fresco Congelado (PFC)', 365, 'Ultracongelacion de -18°C a -30°C'),                             -- ID: 4
('Concentrado de Plaquetas Estandar (CPE Buffy Coat)', 5, '20°C a 24°C en agitacion horizontal continua'),-- ID: 5
('Concentrado de Plaquetas por Aferesis (CPA)', 5, '20°C a 24°C en agitacion horizontal continua'),      -- ID: 6
('Crioprecipitado Rico en Factor VIII y Fibrinogeno (CRIO)', 365, 'Ultracongelacion de -18°C a -30°C'),  -- ID: 7
('Plasma Libre de Crioprecipitado (PLC / Sobrenadante)', 365, 'Ultracongelacion de -18°C a -30°C'),      -- ID: 8
('Alicuota Pediatrica de Eritrocitos (APE Neonatal)', 35, 'Refrigeracion de 2°C a 6°C (circuito cerrado)'),-- ID: 9
('Concentrado de Eritrocitos Lavados (CELV)', 1, 'Refrigeracion de 2°C a 6°C (uso maximo en 24 horas)'); -- ID: 10
GO

-- 10. PERSONAL (16 registros: cumple CHECK de Activo y FechaFin)
INSERT INTO Personal (Persona_ID, Cargo_ID, FechaInicio, FechaFin, Activo) VALUES
(1, 1, '2018-03-01', NULL, 1),          -- ID: 1 (Dr. Kohlberg - Jefe Hematólogo)
(2, 2, '2019-05-15', NULL, 1),          -- ID: 2 (Dra. Navajas - Inmunohematología)
(3, 7, '2017-02-01', '2020-12-31', 0),  -- ID: 3 (Dr. Trigo - Histórico como Técnico)
(3, 3, '2021-01-04', NULL, 1),          -- ID: 4 (Dr. Trigo - Ascenso a Jefe Fraccionamiento)
(4, 4, '2021-06-10', NULL, 1),          -- ID: 5 (Dra. Echazú - Serología)
(5, 5, '2018-08-20', NULL, 1),          -- ID: 6 (Dr. Zamora - Control de Calidad)
(6, 6, '2020-03-12', NULL, 1),          -- ID: 7 (Dra. Ávila - Pruebas Cruzadas)
(7, 7, '2019-11-01', NULL, 1),          -- ID: 8 (Lic. Vacaflores - Flebotomista Senior)
(8, 7, '2022-02-14', NULL, 1),          -- ID: 9 (Lic. Gareca - Flebotomista)
(9, 8, '2021-09-01', NULL, 1),          -- ID: 10 (Lic. Darwich - Aféresis)
(10, 9, '2023-01-16', NULL, 1),         -- ID: 11 (Lic. Ruíz - Selección Predonación)
(11, 11, '2020-07-01', NULL, 1),        -- ID: 12 (Téc. Jurado - Cadena de Frío y Despacho)
(12, 10, '2022-04-18', NULL, 1),        -- ID: 13 (Lic. Farfán - Colectas Móviles)
(13, 11, '2019-01-10', '2023-06-30', 0),-- ID: 14 (Téc. Segovia - Ex encargado de Kardex)
(14, 9, '2024-01-08', NULL, 1),         -- ID: 15 (Lic. Castrillo - Selección Predonación)
(15, 6, '2016-05-01', '2022-12-31', 0); -- ID: 16 (Dr. Michel - Ex médico transfusional)
GO

-- 11. DONANTE_RECEPTOR (80 registros: Personas 11..90 -> Donante_Receptor_ID 1..80)
-- IDs 1..50: Donantes aptos y diferidos; IDs 51..80: Pacientes receptores hospitalarios
INSERT INTO Donante_Receptor (Persona_ID, FactorRH, GrupoSanguineo) VALUES
(11, '+', 'O'), (12, '+', 'O'), (13, '+', 'A'), (14, '+', 'O'), (15, '-', 'O'), -- IDs: 1..5
(16, '+', 'O'), (17, '+', 'A'), (18, '+', 'O'), (19, '+', 'B'), (20, '-', 'O'), -- IDs: 6..10
(21, '+', 'O'), (22, '+', 'A'), (23, '+', 'O'), (24, '-', 'A'), (25, '+', 'O'), -- IDs: 11..15
(26, '+', 'O'), (27, '+', 'B'), (28, '+', 'A'), (29, '+', 'O'), (30, '+', 'AB'),-- IDs: 16..20
(31, '+', 'O'), (32, '-', 'O'), (33, '+', 'A'), (34, '+', 'O'), (35, '+', 'B'), -- IDs: 21..25
(36, '+', 'O'), (37, '+', 'A'), (38, '+', 'O'), (39, '-', 'B'), (40, '+', 'O'), -- IDs: 26..30
(41, '+', 'O'), (42, '+', 'A'), (43, '+', 'O'), (44, '+', 'A'), (45, '-', 'O'), -- IDs: 31..35
(46, '+', 'O'), (47, '+', 'B'), (48, '+', 'O'), (49, '+', 'A'), (50, '+', 'O'), -- IDs: 36..40
(51, '+', 'O'), (52, '+', 'A'), (53, '-', 'AB'),(54, '+', 'O'), (55, '+', 'O'), -- IDs: 41..45
(56, '+', 'A'), (57, '+', 'O'), (58, '+', 'B'), (59, '-', 'A'), (60, '+', 'O'), -- IDs: 46..50
(61, '+', 'O'), (62, '+', 'A'), (63, '+', 'O'), (64, '-', 'O'), (65, '+', 'B'), -- IDs: 51..55
(66, '+', 'O'), (67, '+', 'A'), (68, '+', 'AB'),(69, '+', 'O'), (70, '-', 'A'), -- IDs: 56..60
(71, '+', 'O'), (72, '+', 'B'), (73, '+', 'O'), (74, '+', 'A'), (75, '-', 'O'), -- IDs: 61..65
(76, '+', 'O'), (77, '+', 'A'), (78, '+', 'O'), (79, '+', 'B'), (80, '-', 'B'), -- IDs: 66..70
(81, '+', 'O'), (82, '+', 'A'), (83, '+', 'O'), (84, '+', 'AB'),(85, '-', 'O'), -- IDs: 71..75
(86, '+', 'O'), (87, '+', 'A'), (88, '+', 'O'), (89, '+', 'O'), (90, '-', 'O'); -- IDs: 76..80
GO

-- 12. CHECKEO (85 registros: triaje clínico antropométrico de donantes y receptores)
INSERT INTO Checkeo (Donante_Receptor_ID, Altura, Fecha, Peso) VALUES
(1, 1.74, '2026-01-05', 76.50), (2, 1.62, '2026-01-05', 61.20), (3, 1.78, '2026-01-06', 82.00),  -- IDs: 1..3
(4, 1.65, '2026-01-06', 59.80), (5, 1.71, '2026-01-07', 74.30), (6, 1.76, '2026-01-07', 71.00),  -- IDs: 4..6
(7, 1.60, '2026-01-08', 56.40), (8, 1.80, '2026-01-08', 84.50), (9, 1.63, '2026-01-09', 58.00),  -- IDs: 7..9
(10, 1.73, '2026-01-09', 79.20),(11, 1.66, '2026-01-10', 62.50),(12, 1.75, '2026-01-10', 77.80), -- IDs: 10..12
(13, 1.61, '2026-01-11', 57.30),(14, 1.79, '2026-01-11', 81.40),(15, 1.64, '2026-01-12', 64.00), -- IDs: 13..15
(16, 1.72, '2026-01-12', 75.60),(17, 1.59, '2026-01-13', 55.90),(18, 1.77, '2026-01-13', 80.10), -- IDs: 16..18
(19, 1.67, '2026-01-14', 63.40),(20, 1.70, '2026-01-14', 73.00),(21, 1.62, '2026-01-15', 58.70), -- IDs: 19..21
(22, 1.74, '2026-01-15', 78.50),(23, 1.65, '2026-01-16', 60.20),(24, 1.81, '2026-01-16', 86.00), -- IDs: 22..24
(25, 1.63, '2026-01-17', 61.80),(26, 1.69, '2026-01-17', 72.40),(27, 1.58, '2026-01-18', 54.60), -- IDs: 25..27
(28, 1.76, '2026-01-18', 79.90),(29, 1.60, '2026-01-19', 62.10),(30, 1.75, '2026-01-19', 77.00), -- IDs: 28..30
(31, 1.61, '2026-01-20', 56.80),(32, 1.73, '2026-01-20', 76.20),(33, 1.64, '2026-01-21', 59.50), -- IDs: 31..33
(34, 1.78, '2026-01-21', 83.10),(35, 1.66, '2026-01-22', 65.00),(36, 1.71, '2026-01-22', 74.80), -- IDs: 34..36
(37, 1.62, '2026-01-23', 60.40),(38, 1.77, '2026-01-23', 81.20),(39, 1.65, '2026-01-24', 57.90), -- IDs: 37..39
(40, 1.74, '2026-01-24', 78.00),(41, 1.63, '2026-01-25', 63.20),(42, 1.72, '2026-01-25', 75.10), -- IDs: 40..42
(43, 1.59, '2026-01-26', 55.40),(44, 1.80, '2026-01-26', 84.00),(45, 1.61, '2026-01-27', 58.60), -- IDs: 43..45
(46, 1.75, '2026-01-27', 72.30),(47, 1.57, '2026-01-28', 51.20),(48, 1.73, '2026-01-28', 74.00), -- IDs: 46..48
(49, 1.64, '2026-01-29', 53.50),(50, 1.70, '2026-01-29', 79.40),(51, 1.56, '2026-02-01', 64.20), -- IDs: 49..51
(52, 1.68, '2026-02-01', 71.50),(53, 1.55, '2026-02-02', 58.90),(54, 1.72, '2026-02-02', 76.80), -- IDs: 52..54
(55, 1.54, '2026-02-03', 55.00),(56, 1.69, '2026-02-03', 69.30),(57, 1.60, '2026-02-04', 61.40), -- IDs: 55..57
(58, 1.71, '2026-02-04', 73.20),(59, 1.53, '2026-02-05', 52.80),(60, 1.74, '2026-02-05', 78.60), -- IDs: 58..60
(61, 1.58, '2026-02-06', 60.10),(62, 1.70, '2026-02-06', 74.90),(63, 1.62, '2026-02-07', 63.70), -- IDs: 61..63
(64, 1.76, '2026-02-07', 80.50),(65, 1.59, '2026-02-08', 57.20),(66, 1.67, '2026-02-08', 68.40), -- IDs: 64..66
(67, 1.56, '2026-02-09', 59.60),(68, 1.72, '2026-02-09', 75.30),(69, 1.55, '2026-02-10', 56.10), -- IDs: 67..69
(70, 1.68, '2026-02-10', 70.80),(71, 1.61, '2026-02-11', 62.90),(72, 1.54, '2026-02-11', 54.30), -- IDs: 70..72
(73, 1.66, '2026-02-12', 66.70),(74, 1.58, '2026-02-12', 61.00),(75, 1.69, '2026-02-13', 71.20), -- IDs: 73..75
(76, 1.60, '2026-02-13', 64.50),(77, 1.73, '2026-02-14', 77.40),(78, 1.55, '2026-02-14', 53.90), -- IDs: 76..78
(79, 1.68, '2026-02-15', 59.20),(80, 1.57, '2026-02-15', 49.80),(1, 1.74, '2026-02-20', 76.80),  -- IDs: 79..81
(5, 1.71, '2026-02-21', 74.50), (6, 1.76, '2026-02-22', 71.40), (10, 1.73, '2026-02-23', 79.00), -- IDs: 82..84
(14, 1.79, '2026-02-24', 81.60);                                                                 -- ID: 85
GO

-- 13. CHECKEOENFERMEDAD (30 registros: diferimientos en triaje y patologías de receptores)
INSERT INTO CheckeoEnfermedad (Checkeo_ID, Enfermedad_ID) VALUES
(46, 8),  -- Donante 46 diferido temporalmente por Dengue reciente
(47, 11), -- Donante 47 diferida temporalmente por Lactancia materna
(48, 10), -- Donante 48 diferido temporalmente por Tatuaje < 12 meses
(49, 12), -- Donante 49 diferida temporalmente por Tratamiento antibiótico
(50, 1),  -- Donante 50 rechazado permanente por Serología Chagas Reactiva
(51, 18), (51, 20), -- Receptor 51: Cardiopatía chagásica + Anemia severa
(52, 17), (52, 20), -- Receptor 52: Insuficiencia renal en hemodiálisis + Anemia
(53, 7),            -- Receptor 53: Neoplasia hematológica (Instituto Oncológico)
(54, 19), (54, 25), -- Receptor 54: Cirrosis hepática + Coagulopatía
(55, 20),           -- Receptor 55: Anemia ferropénica severa
(56, 21),           -- Receptor 56: Hemofilia A (requiere Crioprecipitado)
(57, 22),           -- Receptor 57: Enfermedad de von Willebrand
(58, 23),           -- Receptor 58: Púrpura Trombocitopénica (requiere Plaquetas)
(59, 13), (59, 20), -- Receptor 59: Cirugía mayor + Anemia aguda postquirúrgica
(60, 17),           -- Receptor 60: Insuficiencia renal crónica
(61, 7),            -- Receptor 61: Paciente oncológico en quimioterapia
(62, 19),           -- Receptor 62: Cirrosis hepática descompensada
(63, 25),           -- Receptor 63: Coagulopatía Intravascular Diseminada (CID)
(64, 21),           -- Receptor 64: Hemofilia A con hemartrosis
(65, 20),           -- Receptor 65: Anemia severa sintomática
(66, 13),           -- Receptor 66: Cirugía traumatológica mayor
(67, 23),           -- Receptor 67: Trombocitopenia severa
(68, 7),            -- Receptor 68: Leucemia mieloide aguda
(69, 17),           -- Receptor 69: Hemodiálisis crónica
(79, 20),           -- Receptor 79: Paciente pediátrico/juvenil con anemia
(80, 22);           -- Receptor 80: Paciente con déficit de factores de coagulación
GO

-- 14. LUGAREXTRACCION (15 registros: sedes fijas y colectas móviles en Tarija)
INSERT INTO LugarExtraccion (Direccion_ID, Tipo) VALUES
(1, 'Sede Central - Sala de Flebotomia Banco de Sangre Tarija'),  -- ID: 1
(1, 'Sede Central - Unidad Especializada de Aferesis'),           -- ID: 2
(2, 'Puesto Fijo Intrahospitalario - HRSJD Tarija'),              -- ID: 3
(3, 'Servicio de Transfusion y Colecta - Hospital Obrero CNS'),   -- ID: 4
(4, 'Unidad Movil - Campaña Plaza Luis de Fuentes y Vargas'),     -- ID: 5
(5, 'Unidad Movil - Campaña Universitaria UAJMS El Tejar'),       -- ID: 6
(10, 'Unidad Movil - Colecta Solidaria Fexpo Tarija'),            -- ID: 7
(11, 'Punto de Colecta - Hospital Municipal San Antonio'),        -- ID: 8
(12, 'Posta Regional de Hemoterapia - Hospital Ruben Zelaya'),    -- ID: 9
(14, 'Posta Regional de Hemoterapia - Hospital Virgen Chaguaya'), -- ID: 10
(15, 'Posta Regional de Hemoterapia - Hospital Villa Montes'),    -- ID: 11
(16, 'Brigada Movil Provincial - San Lorenzo Mendez'),            -- ID: 12
(17, 'Brigada Movil Provincial - Valle de la Concepcion'),        -- ID: 13
(18, 'Brigada Movil Provincial - Municipio de Padcaya'),          -- ID: 14
(19, 'Brigada Movil Provincial - Entre Rios OConnor');            -- ID: 15
GO

-- 15. EXTRACCION (45 registros: 40 de Sangre Total y 5 de Aféresis Automatizada)
INSERT INTO Extraccion (Personal_ID, Donante_Receptor_ID, LugarExtraccion_ID, Fecha, Metodo, VolumenTotal_ML) VALUES
(8, 1, 1, '2026-01-05 08:30:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 450.00),  -- ID: 1
(9, 2, 1, '2026-01-05 09:00:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 450.00),  -- ID: 2
(8, 3, 1, '2026-01-06 08:20:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 460.00),  -- ID: 3
(9, 4, 1, '2026-01-06 09:10:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 450.00),  -- ID: 4
(8, 5, 1, '2026-01-07 08:40:00', 'Flebotomia Bolsa Cuadruple Top & Bottom', 455.00),     -- ID: 5
(13, 6, 6, '2026-01-07 10:00:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 450.00), -- ID: 6
(13, 7, 6, '2026-01-08 09:30:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 445.00), -- ID: 7
(8, 8, 1, '2026-01-08 10:15:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 465.00),  -- ID: 8
(9, 9, 5, '2026-01-09 09:00:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 450.00),  -- ID: 9
(8, 10, 1, '2026-01-09 10:30:00', 'Flebotomia Bolsa Cuadruple Top & Bottom', 460.00),    -- ID: 10
(9, 11, 1, '2026-01-10 08:15:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 450.00), -- ID: 11
(8, 12, 3, '2026-01-10 09:20:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 455.00), -- ID: 12
(13, 13, 6, '2026-01-11 09:00:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 440.00),-- ID: 13
(8, 14, 1, '2026-01-11 10:10:00', 'Flebotomia Bolsa Cuadruple Top & Bottom', 460.00),    -- ID: 14
(9, 15, 1, '2026-01-12 08:30:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 450.00), -- ID: 15
(8, 16, 4, '2026-01-12 09:45:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 455.00), -- ID: 16
(9, 17, 1, '2026-01-13 08:25:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 445.00), -- ID: 17
(8, 18, 1, '2026-01-13 09:50:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 460.00), -- ID: 18
(13, 19, 5, '2026-01-14 09:15:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 450.00),-- ID: 19
(8, 20, 1, '2026-01-14 10:40:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 450.00), -- ID: 20
(9, 21, 1, '2026-01-15 08:30:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 445.00), -- ID: 21
(8, 22, 1, '2026-01-15 09:35:00', 'Flebotomia Bolsa Cuadruple Top & Bottom', 460.00),    -- ID: 22
(13, 23, 7, '2026-01-16 10:00:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 450.00),-- ID: 23
(8, 24, 1, '2026-01-16 11:10:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 465.00), -- ID: 24
(9, 25, 1, '2026-01-17 08:20:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 450.00), -- ID: 25
(13, 26, 10, '2026-01-17 09:30:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 455.00),-- ID: 26
(9, 27, 1, '2026-01-18 08:45:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 440.00), -- ID: 27
(8, 28, 1, '2026-01-18 10:00:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 460.00), -- ID: 28
(9, 29, 8, '2026-01-19 08:30:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 450.00), -- ID: 29
(8, 30, 1, '2026-01-19 09:50:00', 'Flebotomia Bolsa Cuadruple CPD/SAG-Manitol', 455.00), -- ID: 30
(13, 31, 12, '2026-01-20 09:00:00', 'Flebotomia Bolsa Triple CPDA-1', 450.00),           -- ID: 31
(13, 32, 9, '2026-01-20 10:30:00', 'Flebotomia Bolsa Triple CPDA-1', 455.00),            -- ID: 32
(9, 33, 13, '2026-01-21 09:15:00', 'Flebotomia Bolsa Triple CPDA-1', 445.00),            -- ID: 33
(8, 34, 1, '2026-01-21 10:20:00', 'Flebotomia Bolsa Triple CPDA-1', 460.00),             -- ID: 34
(9, 35, 1, '2026-01-22 08:40:00', 'Flebotomia Bolsa Triple CPDA-1', 450.00),             -- ID: 35
(13, 36, 11, '2026-01-22 10:00:00', 'Flebotomia Bolsa Triple CPDA-1', 455.00),           -- ID: 36
(8, 37, 14, '2026-01-23 09:10:00', 'Flebotomia Bolsa Triple CPDA-1', 450.00),            -- ID: 37
(9, 38, 15, '2026-01-23 10:35:00', 'Flebotomia Bolsa Triple CPDA-1', 460.00),            -- ID: 38
(8, 39, 1, '2026-01-24 08:30:00', 'Flebotomia Bolsa Simple CPDA-1', 450.00),             -- ID: 39
(9, 40, 1, '2026-01-24 09:40:00', 'Flebotomia Bolsa Simple CPDA-1', 455.00),             -- ID: 40
(10, 41, 2, '2026-01-25 08:30:00', 'Plaquetoaferesis Automatizada Doble Dosis', 420.00), -- ID: 41
(10, 42, 2, '2026-01-25 10:30:00', 'Plaquetoaferesis Automatizada Doble Dosis', 430.00), -- ID: 42
(10, 43, 2, '2026-01-26 08:30:00', 'Plaquetoaferesis Automatizada Doble Dosis', 415.00), -- ID: 43
(10, 44, 2, '2026-01-26 10:30:00', 'Eritroaferesis Automatizada Doble Unidad', 400.00),  -- ID: 44
(10, 45, 2, '2026-01-27 09:00:00', 'Plaquetoaferesis Automatizada Dosis Unica', 220.00); -- ID: 45
GO

-- =============================================================================
-- 16. UNIDADEXTRAIDA (170 registros en 3 niveles jerárquicos de fraccionamiento)
-- =============================================================================
-- NIVEL 0 (IDs 1..45): UNIDADES MADRE EXTRAÍDAS DIRECTAMENTE (UnidadOrigen_ID = NULL)
-- Unidades 1..38: Sangre Total (Estado=0 tras centrifugación y separación en < 8h)
-- Unidades 39..40: Sangre Total conservada sin fraccionar (Estado=1)
-- Unidades 41..44: Colectas madre de Aféresis divididas en 2 dosis (Estado=0)
-- Unidad 45: Dosis única de Plaquetas por Aféresis directa (Estado=1)
INSERT INTO UnidadExtraida (Extraccion_ID, UnidadOrigen_ID, TipoComponente_ID, VolumenML, FechaObtencion, Estado) VALUES
(1, NULL, 1, 450.00, '2026-01-05 08:45:00', 0),  -- ID: 1 (Madre ST -> origina IDs 46, 47, 48)
(2, NULL, 1, 450.00, '2026-01-05 09:15:00', 0),  -- ID: 2 (Madre ST -> origina IDs 49, 50, 51)
(3, NULL, 1, 460.00, '2026-01-06 08:35:00', 0),  -- ID: 3 (Madre ST -> origina IDs 52, 53, 54)
(4, NULL, 1, 450.00, '2026-01-06 09:25:00', 0),  -- ID: 4 (Madre ST -> origina IDs 55, 56, 57)
(5, NULL, 1, 455.00, '2026-01-07 08:55:00', 0),  -- ID: 5 (Madre ST -> origina IDs 58, 59, 60)
(6, NULL, 1, 450.00, '2026-01-07 10:15:00', 0),  -- ID: 6 (Madre ST -> origina IDs 61, 62, 63)
(7, NULL, 1, 445.00, '2026-01-08 09:45:00', 0),  -- ID: 7 (Madre ST -> origina IDs 64, 65, 66)
(8, NULL, 1, 465.00, '2026-01-08 10:30:00', 0),  -- ID: 8 (Madre ST -> origina IDs 67, 68, 69)
(9, NULL, 1, 450.00, '2026-01-09 09:15:00', 0),  -- ID: 9 (Madre ST -> origina IDs 70, 71, 72)
(10, NULL, 1, 460.00, '2026-01-09 10:45:00', 0), -- ID: 10 (Madre ST -> origina IDs 73, 74, 75)
(11, NULL, 1, 450.00, '2026-01-10 08:30:00', 0), -- ID: 11 (Madre ST -> origina IDs 76, 77, 78)
(12, NULL, 1, 455.00, '2026-01-10 09:35:00', 0), -- ID: 12 (Madre ST -> origina IDs 79, 80, 81)
(13, NULL, 1, 440.00, '2026-01-11 09:15:00', 0), -- ID: 13 (Madre ST -> origina IDs 82, 83, 84)
(14, NULL, 1, 460.00, '2026-01-11 10:25:00', 0), -- ID: 14 (Madre ST -> origina IDs 85, 86, 87)
(15, NULL, 1, 450.00, '2026-01-12 08:45:00', 0), -- ID: 15 (Madre ST -> origina IDs 88, 89, 90)
(16, NULL, 1, 455.00, '2026-01-12 10:00:00', 0), -- ID: 16 (Madre ST -> origina IDs 91, 92, 93)
(17, NULL, 1, 445.00, '2026-01-13 08:40:00', 0), -- ID: 17 (Madre ST -> origina IDs 94, 95, 96)
(18, NULL, 1, 460.00, '2026-01-13 10:05:00', 0), -- ID: 18 (Madre ST -> origina IDs 97, 98, 99)
(19, NULL, 1, 450.00, '2026-01-14 09:30:00', 0), -- ID: 19 (Madre ST -> origina IDs 100, 101, 102)
(20, NULL, 1, 450.00, '2026-01-14 10:55:00', 0), -- ID: 20 (Madre ST -> origina IDs 103, 104, 105)
(21, NULL, 1, 445.00, '2026-01-15 08:45:00', 0), -- ID: 21 (Madre ST -> origina IDs 106, 107, 108)
(22, NULL, 1, 460.00, '2026-01-15 09:50:00', 0), -- ID: 22 (Madre ST -> origina IDs 109, 110, 111)
(23, NULL, 1, 450.00, '2026-01-16 10:15:00', 0), -- ID: 23 (Madre ST -> origina IDs 112, 113, 114)
(24, NULL, 1, 465.00, '2026-01-16 11:25:00', 0), -- ID: 24 (Madre ST -> origina IDs 115, 116, 117)
(25, NULL, 1, 450.00, '2026-01-17 08:35:00', 0), -- ID: 25 (Madre ST -> origina IDs 118, 119, 120)
(26, NULL, 1, 455.00, '2026-01-17 09:45:00', 0), -- ID: 26 (Madre ST -> origina IDs 121, 122, 123)
(27, NULL, 1, 440.00, '2026-01-18 09:00:00', 0), -- ID: 27 (Madre ST -> origina IDs 124, 125, 126)
(28, NULL, 1, 460.00, '2026-01-18 10:15:00', 0), -- ID: 28 (Madre ST -> origina IDs 127, 128, 129)
(29, NULL, 1, 450.00, '2026-01-19 08:45:00', 0), -- ID: 29 (Madre ST -> origina IDs 130, 131, 132)
(30, NULL, 1, 455.00, '2026-01-19 10:05:00', 0), -- ID: 30 (Madre ST -> origina IDs 133, 134, 135)
(31, NULL, 1, 450.00, '2026-01-20 09:15:00', 0), -- ID: 31 (Madre ST -> origina IDs 136, 137)
(32, NULL, 1, 455.00, '2026-01-20 10:45:00', 0), -- ID: 32 (Madre ST -> origina IDs 138, 139)
(33, NULL, 1, 445.00, '2026-01-21 09:30:00', 0), -- ID: 33 (Madre ST -> origina IDs 140, 141)
(34, NULL, 1, 460.00, '2026-01-21 10:35:00', 0), -- ID: 34 (Madre ST -> origina IDs 142, 143)
(35, NULL, 1, 450.00, '2026-01-22 08:55:00', 0), -- ID: 35 (Madre ST -> origina IDs 144, 145)
(36, NULL, 1, 455.00, '2026-01-22 10:15:00', 0), -- ID: 36 (Madre ST -> origina IDs 146, 147)
(37, NULL, 1, 450.00, '2026-01-23 09:25:00', 0), -- ID: 37 (Madre ST -> origina IDs 148, 149)
(38, NULL, 1, 460.00, '2026-01-23 10:50:00', 0), -- ID: 38 (Madre ST -> origina IDs 150, 151)
(39, NULL, 1, 450.00, '2026-01-24 08:45:00', 1), -- ID: 39 (Sangre Total íntegra disponible)
(40, NULL, 1, 455.00, '2026-01-24 09:55:00', 1), -- ID: 40 (Sangre Total íntegra disponible)
(41, NULL, 6, 420.00, '2026-01-25 09:45:00', 0), -- ID: 41 (Madre Aféresis -> origina IDs 152, 153)
(42, NULL, 6, 430.00, '2026-01-25 11:45:00', 0), -- ID: 42 (Madre Aféresis -> origina IDs 154, 155)
(43, NULL, 6, 415.00, '2026-01-26 09:45:00', 0), -- ID: 43 (Madre Aféresis -> origina IDs 156, 157)
(44, NULL, 3, 400.00, '2026-01-26 11:30:00', 0), -- ID: 44 (Madre Eritroaféresis -> IDs 158, 159)
(45, NULL, 6, 220.00, '2026-01-27 10:15:00', 1); -- ID: 45 (Aféresis dosis única disponible)
GO

-- NIVEL 1 (IDs 46..159): FRACCIONAMIENTO PRIMARIO (Hijas directas de Unidades Madre 1..38 y 41..44)
-- Cada bolsa cuádruple (IDs 1..30) genera: 1 Eritrocitos (CE/CEL), 1 Plasma (PFC) y 1 Plaquetas (CPE)
INSERT INTO UnidadExtraida (Extraccion_ID, UnidadOrigen_ID, TipoComponente_ID, VolumenML, FechaObtencion, Estado) VALUES
(1, 1, 2, 260.00, '2026-01-05 11:00:00', 0),   -- ID: 46 (CE hijo de 1 -> sub-fraccionado en Pediátricas 160, 161, 162)
(1, 1, 4, 200.00, '2026-01-05 11:00:00', 0),   -- ID: 47 (PFC hijo de 1 -> sub-fraccionado en CRIO 166 y PLC 167)
(1, 1, 5, 55.00, '2026-01-05 11:00:00', 0),    -- ID: 48 (CPE hijo de 1 -> transfundido en Solicitud 1)
(2, 2, 2, 255.00, '2026-01-05 11:30:00', 0),   -- ID: 49 (CE hijo de 2 -> transfundido en Solicitud 2)
(2, 2, 4, 205.00, '2026-01-05 11:30:00', 0),   -- ID: 50 (PFC hijo de 2 -> sub-fraccionado en CRIO 168 y PLC 169)
(2, 2, 5, 52.00, '2026-01-05 11:30:00', 0),    -- ID: 51 (CPE hijo de 2 -> transfundido en Solicitud 3)
(3, 3, 2, 268.00, '2026-01-06 11:00:00', 0),   -- ID: 52 (CE hijo de 3 -> transfundido en Solicitud 4)
(3, 3, 4, 210.00, '2026-01-06 11:00:00', 0),   -- ID: 53 (PFC hijo de 3 -> transfundido en Solicitud 5)
(3, 3, 5, 58.00, '2026-01-06 11:00:00', 0),    -- ID: 54 (CPE hijo de 3 -> transfundido en Solicitud 6)
(4, 4, 2, 258.00, '2026-01-06 11:45:00', 0),   -- ID: 55 (CE hijo de 4 -> transfundido en Solicitud 7)
(4, 4, 4, 198.00, '2026-01-06 11:45:00', 1),   -- ID: 56 (PFC hijo de 4 -> disponible)
(4, 4, 5, 54.00, '2026-01-06 11:45:00', 0),    -- ID: 57 (CPE hijo de 4 -> transfundido en Solicitud 8)
(5, 5, 3, 250.00, '2026-01-07 11:15:00', 0),   -- ID: 58 (CEL O- hijo de 5 -> sub-fraccionado en Pediátricas 163, 164, 165)
(5, 5, 4, 205.00, '2026-01-07 11:15:00', 0),   -- ID: 59 (PFC hijo de 5 -> transfundido en Solicitud 9)
(5, 5, 5, 56.00, '2026-01-07 11:15:00', 0),    -- ID: 60 (CPE hijo de 5 -> transfundido en Solicitud 10)
(6, 6, 2, 260.00, '2026-01-07 13:00:00', 0),   -- ID: 61 (CE hijo de 6 -> lavado en CELV 170)
(6, 6, 4, 200.00, '2026-01-07 13:00:00', 0),   -- ID: 62 (PFC hijo de 6 -> transfundido en Solicitud 11)
(6, 6, 5, 53.00, '2026-01-07 13:00:00', 0),    -- ID: 63 (CPE hijo de 6 -> transfundido en Solicitud 12)
(7, 7, 2, 252.00, '2026-01-08 12:15:00', 0),   -- ID: 64 (CE hijo de 7 -> transfundido en Solicitud 13)
(7, 7, 4, 195.00, '2026-01-08 12:15:00', 1),   -- ID: 65 (PFC hijo de 7 -> disponible)
(7, 7, 5, 50.00, '2026-01-08 12:15:00', 0),    -- ID: 66 (CPE hijo de 7 -> transfundido en Solicitud 14)
(8, 8, 2, 270.00, '2026-01-08 13:00:00', 0),   -- ID: 67 (CE hijo de 8 -> transfundido en Solicitud 15)
(8, 8, 4, 212.00, '2026-01-08 13:00:00', 0),   -- ID: 68 (PFC hijo de 8 -> transfundido en Solicitud 16)
(8, 8, 5, 58.00, '2026-01-08 13:00:00', 1),    -- ID: 69 (CPE hijo de 8 -> disponible)
(9, 9, 2, 256.00, '2026-01-09 12:00:00', 0),   -- ID: 70 (CE hijo de 9 -> transfundido en Solicitud 17)
(9, 9, 4, 202.00, '2026-01-09 12:00:00', 1),   -- ID: 71 (PFC hijo de 9 -> disponible)
(9, 9, 5, 55.00, '2026-01-09 12:00:00', 0),    -- ID: 72 (CPE hijo de 9 -> transfundido en Solicitud 18)
(10, 10, 3, 255.00, '2026-01-09 13:15:00', 0), -- ID: 73 (CEL hijo de 10 -> transfundido en Solicitud 19)
(10, 10, 4, 208.00, '2026-01-09 13:15:00', 1), -- ID: 74 (PFC hijo de 10 -> disponible)
(10, 10, 5, 57.00, '2026-01-09 13:15:00', 1),  -- ID: 75 (CPE hijo de 10 -> disponible)
(11, 11, 2, 260.00, '2026-01-10 11:00:00', 0), -- ID: 76 (CE hijo de 11 -> transfundido en Solicitud 20)
(11, 11, 4, 198.00, '2026-01-10 11:00:00', 0), -- ID: 77 (PFC hijo de 11 -> transfundido en Solicitud 21)
(11, 11, 5, 54.00, '2026-01-10 11:00:00', 1),  -- ID: 78 (CPE hijo de 11 -> disponible)
(12, 12, 2, 262.00, '2026-01-10 12:00:00', 0), -- ID: 79 (CE hijo de 12 -> transfundido en Solicitud 22)
(12, 12, 4, 204.00, '2026-01-10 12:00:00', 1), -- ID: 80 (PFC hijo de 12 -> disponible)
(12, 12, 5, 55.00, '2026-01-10 12:00:00', 0),  -- ID: 81 (CPE hijo de 12 -> transfundido en Solicitud 23)
(13, 13, 2, 250.00, '2026-01-11 11:45:00', 0), -- ID: 82 (CE hijo de 13 -> transfundido en Solicitud 24)
(13, 13, 4, 192.00, '2026-01-11 11:45:00', 1), -- ID: 83 (PFC hijo de 13 -> disponible)
(13, 13, 5, 51.00, '2026-01-11 11:45:00', 1),  -- ID: 84 (CPE hijo de 13 -> disponible)
(14, 14, 3, 258.00, '2026-01-11 12:45:00', 0), -- ID: 85 (CEL hijo de 14 -> transfundido en Solicitud 25)
(14, 14, 4, 206.00, '2026-01-11 12:45:00', 0), -- ID: 86 (PFC hijo de 14 -> transfundido en Solicitud 26)
(14, 14, 5, 56.00, '2026-01-11 12:45:00', 1),  -- ID: 87 (CPE hijo de 14 -> disponible)
(15, 15, 2, 257.00, '2026-01-12 11:15:00', 0), -- ID: 88 (CE hijo de 15 -> transfundido en Solicitud 27)
(15, 15, 4, 200.00, '2026-01-12 11:15:00', 1), -- ID: 89 (PFC hijo de 15 -> disponible)
(15, 15, 5, 54.00, '2026-01-12 11:15:00', 0),  -- ID: 90 (CPE hijo de 15 -> transfundido en Solicitud 28)
(16, 16, 2, 263.00, '2026-01-12 12:30:00', 0), -- ID: 91 (CE hijo de 16 -> transfundido en Solicitud 29)
(16, 16, 4, 202.00, '2026-01-12 12:30:00', 1), -- ID: 92 (PFC hijo de 16 -> disponible)
(16, 16, 5, 55.00, '2026-01-12 12:30:00', 1),  -- ID: 93 (CPE hijo de 16 -> disponible)
(17, 17, 2, 254.00, '2026-01-13 11:00:00', 0), -- ID: 94 (CE hijo de 17 -> transfundido en Solicitud 30)
(17, 17, 4, 196.00, '2026-01-13 11:00:00', 1), -- ID: 95 (PFC hijo de 17 -> disponible)
(17, 17, 5, 52.00, '2026-01-13 11:00:00', 1),  -- ID: 96 (CPE hijo de 17 -> disponible)
(18, 18, 2, 266.00, '2026-01-13 12:15:00', 0), -- ID: 97 (CE hijo de 18 -> transfundido en Solicitud 31)
(18, 18, 4, 208.00, '2026-01-13 12:15:00', 0), -- ID: 98 (PFC hijo de 18 -> transfundido en Solicitud 32)
(18, 18, 5, 57.00, '2026-01-13 12:15:00', 1),  -- ID: 99 (CPE hijo de 18 -> disponible)
(19, 19, 2, 259.00, '2026-01-14 12:00:00', 0), -- ID: 100 (CE hijo de 19 -> transfundido en Solicitud 33)
(19, 19, 4, 200.00, '2026-01-14 12:00:00', 1), -- ID: 101 (PFC hijo de 19 -> disponible)
(19, 19, 5, 54.00, '2026-01-14 12:00:00', 0),  -- ID: 102 (CPE hijo de 19 -> transfundido en Solicitud 34)
(20, 20, 2, 258.00, '2026-01-14 13:10:00', 0), -- ID: 103 (CE hijo de 20 -> transfundido en Solicitud 35)
(20, 20, 4, 201.00, '2026-01-14 13:10:00', 1), -- ID: 104 (PFC hijo de 20 -> disponible)
(20, 20, 5, 55.00, '2026-01-14 13:10:00', 1),  -- ID: 105 (CPE hijo de 20 -> disponible)
(21, 21, 2, 253.00, '2026-01-15 11:00:00', 0), -- ID: 106 (CE hijo de 21 -> transfundido en Solicitud 36)
(21, 21, 4, 195.00, '2026-01-15 11:00:00', 1), -- ID: 107 (PFC hijo de 21 -> disponible)
(21, 21, 5, 53.00, '2026-01-15 11:00:00', 1),  -- ID: 108 (CPE hijo de 21 -> disponible)
(22, 22, 3, 256.00, '2026-01-15 12:00:00', 0), -- ID: 109 (CEL hijo de 22 -> transfundido en Solicitud 37)
(22, 22, 4, 207.00, '2026-01-15 12:00:00', 1), -- ID: 110 (PFC hijo de 22 -> disponible)
(22, 22, 5, 56.00, '2026-01-15 12:00:00', 1),  -- ID: 111 (CPE hijo de 22 -> disponible)
(23, 23, 2, 260.00, '2026-01-16 12:30:00', 0), -- ID: 112 (CE hijo de 23 -> transfundido en Solicitud 38)
(23, 23, 4, 199.00, '2026-01-16 12:30:00', 1), -- ID: 113 (PFC hijo de 23 -> disponible)
(23, 23, 5, 54.00, '2026-01-16 12:30:00', 1),  -- ID: 114 (CPE hijo de 23 -> disponible)
(24, 24, 2, 269.00, '2026-01-16 13:30:00', 1), -- ID: 115 (CE hijo de 24 -> disponible)
(24, 24, 4, 210.00, '2026-01-16 13:30:00', 1), -- ID: 116 (PFC hijo de 24 -> disponible)
(24, 24, 5, 58.00, '2026-01-16 13:30:00', 1),  -- ID: 117 (CPE hijo de 24 -> disponible)
(25, 25, 2, 258.00, '2026-01-17 11:00:00', 1), -- ID: 118 (CE hijo de 25 -> disponible)
(25, 25, 4, 200.00, '2026-01-17 11:00:00', 1), -- ID: 119 (PFC hijo de 25 -> disponible)
(25, 25, 5, 55.00, '2026-01-17 11:00:00', 1),  -- ID: 120 (CPE hijo de 25 -> disponible)
(26, 26, 2, 261.00, '2026-01-17 12:15:00', 1), -- ID: 121 (CE hijo de 26 -> disponible)
(26, 26, 4, 203.00, '2026-01-17 12:15:00', 1), -- ID: 122 (PFC hijo de 26 -> disponible)
(26, 26, 5, 55.00, '2026-01-17 12:15:00', 1),  -- ID: 123 (CPE hijo de 26 -> disponible)
(27, 27, 2, 251.00, '2026-01-18 11:30:00', 1), -- ID: 124 (CE hijo de 27 -> disponible)
(27, 27, 4, 193.00, '2026-01-18 11:30:00', 1), -- ID: 125 (PFC hijo de 27 -> disponible)
(27, 27, 5, 51.00, '2026-01-18 11:30:00', 1),  -- ID: 126 (CPE hijo de 27 -> disponible)
(28, 28, 2, 265.00, '2026-01-18 12:30:00', 1), -- ID: 127 (CE hijo de 28 -> disponible)
(28, 28, 4, 206.00, '2026-01-18 12:30:00', 1), -- ID: 128 (PFC hijo de 28 -> disponible)
(28, 28, 5, 56.00, '2026-01-18 12:30:00', 1),  -- ID: 129 (CPE hijo de 28 -> disponible)
(29, 29, 2, 257.00, '2026-01-19 11:00:00', 1), -- ID: 130 (CE hijo de 29 -> disponible)
(29, 29, 4, 199.00, '2026-01-19 11:00:00', 1), -- ID: 131 (PFC hijo de 29 -> disponible)
(29, 29, 5, 54.00, '2026-01-19 11:00:00', 1),  -- ID: 132 (CPE hijo de 29 -> disponible)
(30, 30, 2, 262.00, '2026-01-19 12:15:00', 1), -- ID: 133 (CE hijo de 30 -> disponible)
(30, 30, 4, 204.00, '2026-01-19 12:15:00', 1), -- ID: 134 (PFC hijo de 30 -> disponible)
(30, 30, 5, 55.00, '2026-01-19 12:15:00', 1),  -- ID: 135 (CPE hijo de 30 -> disponible)
(31, 31, 2, 258.00, '2026-01-20 11:30:00', 1), -- ID: 136 (CE hijo de 31 -> disponible)
(31, 31, 4, 200.00, '2026-01-20 11:30:00', 1), -- ID: 137 (PFC hijo de 31 -> disponible)
(32, 32, 2, 261.00, '2026-01-20 12:45:00', 1), -- ID: 138 (CE hijo de 32 -> disponible)
(32, 32, 4, 202.00, '2026-01-20 12:45:00', 1), -- ID: 139 (PFC hijo de 32 -> disponible)
(33, 33, 2, 254.00, '2026-01-21 11:30:00', 1), -- ID: 140 (CE hijo de 33 -> disponible)
(33, 33, 4, 196.00, '2026-01-21 11:30:00', 1), -- ID: 141 (PFC hijo de 33 -> disponible)
(34, 34, 2, 264.00, '2026-01-21 12:30:00', 1), -- ID: 142 (CE hijo de 34 -> disponible)
(34, 34, 4, 206.00, '2026-01-21 12:30:00', 1), -- ID: 143 (PFC hijo de 34 -> disponible)
(35, 35, 2, 258.00, '2026-01-22 11:00:00', 1), -- ID: 144 (CE hijo de 35 -> disponible)
(35, 35, 4, 200.00, '2026-01-22 11:00:00', 1), -- ID: 145 (PFC hijo de 35 -> disponible)
(36, 36, 2, 260.00, '2026-01-22 12:30:00', 1), -- ID: 146 (CE hijo de 36 -> disponible)
(36, 36, 4, 203.00, '2026-01-22 12:30:00', 1), -- ID: 147 (PFC hijo de 36 -> disponible)
(37, 37, 2, 257.00, '2026-01-23 11:30:00', 1), -- ID: 148 (CE hijo de 37 -> disponible)
(37, 37, 4, 198.00, '2026-01-23 11:30:00', 1), -- ID: 149 (PFC hijo de 37 -> disponible)
(38, 38, 2, 265.00, '2026-01-23 12:45:00', 1), -- ID: 150 (CE hijo de 38 -> disponible)
(38, 38, 4, 205.00, '2026-01-23 12:45:00', 1), -- ID: 151 (PFC hijo de 38 -> disponible)
(41, 41, 6, 210.00, '2026-01-25 10:00:00', 0), -- ID: 152 (CPA Dosis 1 hija de 41 -> Solicitud 39)
(41, 41, 6, 210.00, '2026-01-25 10:00:00', 0), -- ID: 153 (CPA Dosis 2 hija de 41 -> Solicitud 40)
(42, 42, 6, 215.00, '2026-01-25 12:00:00', 0), -- ID: 154 (CPA Dosis 1 hija de 42 -> Solicitud 41)
(42, 42, 6, 215.00, '2026-01-25 12:00:00', 1), -- ID: 155 (CPA Dosis 2 hija de 42 -> disponible)
(43, 43, 6, 207.50, '2026-01-26 10:00:00', 0), -- ID: 156 (CPA Dosis 1 hija de 43 -> Solicitud 42)
(43, 43, 6, 207.50, '2026-01-26 10:00:00', 1), -- ID: 157 (CPA Dosis 2 hija de 43 -> disponible)
(44, 44, 3, 200.00, '2026-01-26 11:45:00', 0), -- ID: 158 (CEL Dosis 1 hija de 44 -> Solicitud 43)
(44, 44, 3, 200.00, '2026-01-26 11:45:00', 1); -- ID: 159 (CEL Dosis 2 hija de 44 -> disponible)
GO

-- NIVEL 2 (IDs 160..170): SUB-FRACCIONAMIENTO SECUNDARIO (Nietas de Sangre Total)
-- Alícuotas Pediátricas (de CE ID 46 y CEL ID 58), Crioprecipitado + PLC (de PFC IDs 47 y 50) y Lavado (de CE ID 61)
INSERT INTO UnidadExtraida (Extraccion_ID, UnidadOrigen_ID, TipoComponente_ID, VolumenML, FechaObtencion, Estado) VALUES
(1, 46, 9, 85.00, '2026-01-06 08:00:00', 0),  -- ID: 160 (Alícuota Pediátrica 1 hija de CE 46 -> Solicitud 44)
(1, 46, 9, 85.00, '2026-01-06 08:00:00', 0),  -- ID: 161 (Alícuota Pediátrica 2 hija de CE 46 -> Solicitud 45)
(1, 46, 9, 85.00, '2026-01-06 08:00:00', 1),  -- ID: 162 (Alícuota Pediátrica 3 hija de CE 46 -> disponible)
(5, 58, 9, 80.00, '2026-01-08 08:00:00', 0),  -- ID: 163 (Alícuota Pediátrica O- 1 hija de CEL 58 -> Solicitud 46)
(5, 58, 9, 80.00, '2026-01-08 08:00:00', 0),  -- ID: 164 (Alícuota Pediátrica O- 2 hija de CEL 58 -> Solicitud 47)
(5, 58, 9, 80.00, '2026-01-08 08:00:00', 1),  -- ID: 165 (Alícuota Pediátrica O- 3 hija de CEL 58 -> disponible)
(1, 47, 7, 20.00, '2026-01-06 09:30:00', 0),  -- ID: 166 (Crioprecipitado hijo de PFC 47 -> Solicitud 48)
(1, 47, 8, 180.00, '2026-01-06 09:30:00', 1), -- ID: 167 (Plasma Libre de Crio hijo de PFC 47 -> disponible)
(2, 50, 7, 22.00, '2026-01-06 10:00:00', 0),  -- ID: 168 (Crioprecipitado hijo de PFC 50 -> Solicitud 49)
(2, 50, 8, 183.00, '2026-01-06 10:00:00', 1), -- ID: 169 (Plasma Libre de Crio hijo de PFC 50 -> disponible)
(6, 61, 10, 240.00, '2026-01-08 07:30:00', 0);-- ID: 170 (Eritrocitos Lavados hijo de CE 61 -> Solicitud 50)
GO

-- 17. HISTORIALSOLICITUDES (50 registros: despacho transfusional con Unidad_ID único)
INSERT INTO HistorialSolicitudes (Donante_Receptor_ID, Unidad_ID, Direccion_ID, Fecha) VALUES
(58, 48, 2, '2026-01-06 14:00:00'),  -- ID: 1 (Plaquetas a HRSJD Tarija)
(51, 49, 2, '2026-01-06 15:30:00'),  -- ID: 2 (Eritrocitos a HRSJD Tarija)
(58, 51, 2, '2026-01-06 16:00:00'),  -- ID: 3 (Plaquetas a HRSJD Tarija)
(52, 52, 3, '2026-01-07 09:00:00'),  -- ID: 4 (Eritrocitos a Hospital Obrero CNS)
(54, 53, 2, '2026-01-07 10:30:00'),  -- ID: 5 (PFC a HRSJD Tarija)
(53, 54, 7, '2026-01-07 11:45:00'),  -- ID: 6 (Plaquetas a Instituto Oncológico Tarija)
(55, 55, 11, '2026-01-07 14:20:00'), -- ID: 7 (Eritrocitos a Hospital San Antonio)
(61, 57, 7, '2026-01-08 08:30:00'),  -- ID: 8 (Plaquetas a Instituto Oncológico Tarija)
(63, 59, 2, '2026-01-08 09:45:00'),  -- ID: 9 (PFC a HRSJD Tarija)
(67, 60, 3, '2026-01-08 11:00:00'),  -- ID: 10 (Plaquetas a Hospital Obrero CNS)
(62, 62, 2, '2026-01-08 15:10:00'),  -- ID: 11 (PFC a HRSJD Tarija)
(68, 63, 7, '2026-01-09 08:40:00'),  -- ID: 12 (Plaquetas a Instituto Oncológico Tarija)
(57, 64, 6, '2026-01-09 10:00:00'),  -- ID: 13 (Eritrocitos a Clínica Prost)
(53, 66, 7, '2026-01-09 11:30:00'),  -- ID: 14 (Plaquetas a Instituto Oncológico Tarija)
(59, 67, 2, '2026-01-09 14:15:00'),  -- ID: 15 (Eritrocitos a HRSJD Tarija)
(54, 68, 2, '2026-01-10 09:20:00'),  -- ID: 16 (PFC a HRSJD Tarija)
(60, 70, 3, '2026-01-10 10:45:00'),  -- ID: 17 (Eritrocitos a Hospital Obrero CNS)
(61, 72, 7, '2026-01-10 12:00:00'),  -- ID: 18 (Plaquetas a Instituto Oncológico Tarija)
(65, 73, 2, '2026-01-11 08:30:00'),  -- ID: 19 (Eritrocitos Leucorreducidos O- a HRSJD)
(66, 76, 6, '2026-01-11 10:15:00'),  -- ID: 20 (Eritrocitos a Clínica Prost)
(63, 77, 2, '2026-01-11 11:50:00'),  -- ID: 21 (PFC a HRSJD Tarija)
(69, 79, 3, '2026-01-12 09:00:00'),  -- ID: 22 (Eritrocitos a Hospital Obrero CNS)
(67, 81, 3, '2026-01-12 10:30:00'),  -- ID: 23 (Plaquetas a Hospital Obrero CNS)
(70, 82, 9, '2026-01-12 14:00:00'),  -- ID: 24 (Eritrocitos a Clínica CIES Tarija)
(71, 85, 12, '2026-01-13 08:45:00'), -- ID: 25 (CEL a Hospital Rubén Zelaya Yacuiba)
(62, 86, 2, '2026-01-13 10:10:00'),  -- ID: 26 (PFC a HRSJD Tarija)
(72, 88, 14, '2026-01-13 11:30:00'), -- ID: 27 (Eritrocitos a Hospital Virgen de Chaguaya Bermejo)
(68, 90, 7, '2026-01-14 08:20:00'),  -- ID: 28 (Plaquetas a Instituto Oncológico Tarija)
(73, 91, 15, '2026-01-14 09:50:00'), -- ID: 29 (Eritrocitos a Hospital Básico Villa Montes)
(74, 94, 2, '2026-01-14 11:15:00'),  -- ID: 30 (Eritrocitos a HRSJD Tarija)
(75, 97, 2, '2026-01-15 08:30:00'),  -- ID: 31 (Eritrocitos a HRSJD Tarija)
(63, 98, 2, '2026-01-15 09:45:00'),  -- ID: 32 (PFC a HRSJD Tarija)
(76, 100, 3, '2026-01-15 11:00:00'), -- ID: 33 (Eritrocitos a Hospital Obrero CNS)
(58, 102, 2, '2026-01-15 14:30:00'), -- ID: 34 (Plaquetas a HRSJD Tarija)
(77, 103, 6, '2026-01-16 09:00:00'), -- ID: 35 (Eritrocitos a Clínica Prost)
(78, 106, 11, '2026-01-16 10:20:00'),-- ID: 36 (Eritrocitos a Hospital San Antonio)
(51, 109, 2, '2026-01-16 11:40:00'), -- ID: 37 (CEL a HRSJD Tarija)
(52, 112, 3, '2026-01-17 08:30:00'), -- ID: 38 (Eritrocitos a Hospital Obrero CNS)
(53, 152, 7, '2026-01-26 08:30:00'), -- ID: 39 (Plaquetas por Aféresis a Instituto Oncológico)
(61, 153, 7, '2026-01-26 09:15:00'), -- ID: 40 (Plaquetas por Aféresis a Instituto Oncológico)
(68, 154, 7, '2026-01-26 11:00:00'), -- ID: 41 (Plaquetas por Aféresis a Instituto Oncológico)
(67, 156, 3, '2026-01-27 08:45:00'), -- ID: 42 (Plaquetas por Aféresis a Hospital Obrero CNS)
(59, 158, 2, '2026-01-27 10:00:00'), -- ID: 43 (Eritroaféresis a HRSJD Tarija)
(79, 160, 2, '2026-01-06 11:00:00'), -- ID: 44 (Alícuota Pediátrica 1 a Neonatología HRSJD)
(79, 161, 2, '2026-01-08 11:00:00'), -- ID: 45 (Alícuota Pediátrica 2 a Neonatología HRSJD)
(80, 163, 2, '2026-01-08 16:00:00'), -- ID: 46 (Alícuota Pediátrica O- 1 a Pediatría HRSJD)
(80, 164, 2, '2026-01-10 16:00:00'), -- ID: 47 (Alícuota Pediátrica O- 2 a Pediatría HRSJD)
(56, 166, 2, '2026-01-07 08:00:00'), -- ID: 48 (Crioprecipitado a Paciente Hemofilia A en HRSJD)
(64, 168, 3, '2026-01-07 09:30:00'), -- ID: 49 (Crioprecipitado a Paciente Hemofilia A en CNS)
(60, 170, 3, '2026-01-08 09:00:00'); -- ID: 50 (Eritrocitos Lavados a Paciente Renal en CNS)
GO
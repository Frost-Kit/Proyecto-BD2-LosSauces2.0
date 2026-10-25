USE BancoSangre;
GO
SET NOCOUNT ON;
GO

/* =========================================================================
   1. PAISES (6 registros)
   ========================================================================= */
INSERT INTO Pais (Nombre) VALUES
('Bolivia'),
('Argentina'),
('Paraguay'),
('Chile'),
('Peru'),
('Brasil');
GO

/* =========================================================================
   2. CIUDADES (16 registros - Tarija, provincias y departamentos cercanos)
   ========================================================================= */
INSERT INTO Ciudad (Nombre, Pais_ID) VALUES
('Tarija', 1),                  -- Ciudad_ID = 1
('Yacuiba', 1),                 -- Ciudad_ID = 2
('Bermejo', 1),                 -- Ciudad_ID = 3
('Villamontes', 1),             -- Ciudad_ID = 4
('San Lorenzo', 1),             -- Ciudad_ID = 5
('Entre Rios', 1),              -- Ciudad_ID = 6
('Padcaya', 1),                 -- Ciudad_ID = 7
('Uriondo (Concepcion)', 1),    -- Ciudad_ID = 8
('Carapari', 1),                -- Ciudad_ID = 9
('Sucre', 1),                   -- Ciudad_ID = 10
('Camargo', 1),                 -- Ciudad_ID = 11
('Potosi', 1),                  -- Ciudad_ID = 12
('Tupiza', 1),                  -- Ciudad_ID = 13
('Villazon', 1),                -- Ciudad_ID = 14
('Santa Cruz de la Sierra', 1), -- Ciudad_ID = 15
('Salta', 2);                   -- Ciudad_ID = 16
GO

/* =========================================================================
   3. DIRECCIONES (30 registros - Puntos reales de Tarija para extracciones y hospitales)
   ========================================================================= */
INSERT INTO Direccion (Calle, Ciudad_ID) VALUES
('Av. Victor Paz Estenssoro s/n - Hospital Regional San Juan de Dios', 1),       -- Direccion_ID = 1
('Calle Santa Cruz esq. Bolivar - Banco de Sangre Departamental Tarija', 1),     -- Direccion_ID = 2
('Av. Jaime Paz Zamora Nro. 450 - Hospital Obrero Nro. 7 CNS', 1),               -- Direccion_ID = 3
('Calle Sucre frente a Plaza Luis de Fuentes y Vargas', 1),                      -- Direccion_ID = 4
('Av. Las Americas Campus El Tejar - Universidad Juan Misael Saracho', 1),       -- Direccion_ID = 5
('Calle General Trigo esq. Madrid - Atrio Plaza Principal', 1),                  -- Direccion_ID = 6
('Av. Integracion esq. Pando - Parque Tematico Tarija', 1),                      -- Direccion_ID = 7
('Calle Colon entre Madrid y 15 de Abril - Parque Bolivar', 1),                  -- Direccion_ID = 8
('Calle Colon Nro. 734 - Universidad Catolica Boliviana San Pablo', 1),          -- Direccion_ID = 9
('Barrio El Molino Calle Corrado Nro. 345 - Clinica CIES', 1),                   -- Direccion_ID = 10
('Barrio La Pampa Calle Cochabamba Nro. 620 - Clinica San Antonio', 1),          -- Direccion_ID = 11
('Av. Domingo Paz Nro. 512 - Clinica Prosalud Tarija', 1),                       -- Direccion_ID = 12
('Barrio Senac Av. Circunvalacion s/n - Centro de Salud Senac', 1),              -- Direccion_ID = 13
('Barrio San Bernardo Av. Panamericana - Explanada Mercado Campesino', 1),       -- Direccion_ID = 14
('Barrio Juan XXIII Av. Heroes del Chaco - Coliseo Universitario', 1),           -- Direccion_ID = 15
('Barrio San Roque Calle General Trigo - Plazuela San Roque', 1),                -- Direccion_ID = 16
('Barrio Fatima Av. La Paz esq. Belgrano - Parroquia Fatima', 1),                -- Direccion_ID = 17
('Barrio Las Panosas Calle Mendez - Plazuela Sucre', 1),                         -- Direccion_ID = 18
('Barrio Tabladita Calle Avaroa s/n - Centro de Salud Tabladita', 1),            -- Direccion_ID = 19
('Barrio Morros Blancos Av. Fuerza Aerea - Nueva Terminal de Buses', 1),         -- Direccion_ID = 20
('Barrio Guadalquivir Av. Los Membrillos - Hospital Municipal San Antonio', 1),  -- Direccion_ID = 21
('Barrio San Geronimo Av. Los Sauces - Posta Sanitaria San Geronimo', 1),        -- Direccion_ID = 22
('Barrio Palmarcito Av. Circunvalacion Norte - Coliseo Garcia Agreda', 1),       -- Direccion_ID = 23
('Barrio La Loma de San Juan Calle Virgen de Chaguaya - Mirador La Loma', 1),    -- Direccion_ID = 24
('Plaza Eustaquio Mendez Acera Norte - Hospital San Lorenzo', 5),                -- Direccion_ID = 25
('Plaza Principal de Concepcion - Centro de Salud Uriondo', 8),                  -- Direccion_ID = 26
('Calle Crevaux esq. Comercio - Hospital Ruben Zelaya', 2),                      -- Direccion_ID = 27
('Av. Petrolera s/n - Hospital Virgen de Chaguaya', 3),                          -- Direccion_ID = 28
('Calle Capitan Manchego s/n - Hospital Basico Villamontes', 4),                 -- Direccion_ID = 29
('Calle Bolivar s/n - Hospital San Juan de Dios Entre Rios', 6);                 -- Direccion_ID = 30
GO

/* =========================================================================
   4. CARGOS (10 registros)
   ========================================================================= */
INSERT INTO Cargo (Nombre, Activo) VALUES
('Medico Hemoterapista', 1),                  -- Cargo_ID = 1
('Bioquimico Clinico', 1),                    -- Cargo_ID = 2
('Licenciado en Enfermeria', 1),              -- Cargo_ID = 3
('Tecnico Flebotomista', 1),                  -- Cargo_ID = 4
('Especialista en Inmunohematologia', 1),     -- Cargo_ID = 5
('Responsable de Fraccionamiento', 1),        -- Cargo_ID = 6
('Encargado de Control de Calidad', 1),       -- Cargo_ID = 7
('Promotor de Donacion Voluntaria', 1),       -- Cargo_ID = 8
('Auxiliar de Laboratorio', 1),               -- Cargo_ID = 9
('Coordinador Medico de Campana Temporal', 0);-- Cargo_ID = 10
GO

/* =========================================================================
   5. ENFERMEDADES (16 registros - Cumpliendo el CHECK Gravedad_Nom)
   ========================================================================= */
INSERT INTO Enfermedad (Enfermedad, Gravedad) VALUES
('Enfermedad de Chagas Positivo', 'Rechazo permanente'),       -- Enfermedad_ID = 1
('Hepatitis B Cronica', 'Rechazo permanente'),                 -- Enfermedad_ID = 2
('Hepatitis C Positivo', 'Rechazo permanente'),                -- Enfermedad_ID = 3
('VIH / SIDA', 'Rechazo permanente'),                          -- Enfermedad_ID = 4
('Resfrio Comun / Estado Gripal', 'Rechazo temporal'),         -- Enfermedad_ID = 5
('Tatuaje o Piercing Reciente (< 12 meses)', 'Rechazo temporal'), -- Enfermedad_ID = 6
('Cirugia Menor Reciente', 'Rechazo temporal'),                -- Enfermedad_ID = 7
('Infeccion Dental con Antibioticos', 'Rechazo temporal'),     -- Enfermedad_ID = 8
('Embarazo o Lactancia Actual', 'Rechazo temporal'),           -- Enfermedad_ID = 9
('Hipertension Arterial Controlada', 'Cronica/Sistematica'),   -- Enfermedad_ID = 10
('Diabetes Mellitus Tipo 1 Insulinodependiente', 'Cronica/Sistematica'), -- Enfermedad_ID = 11
('Insuficiencia Renal Cronica', 'Cronica/Sistematica'),        -- Enfermedad_ID = 12
('Cardiopatia Isquemica', 'Cronica/Sistematica'),              -- Enfermedad_ID = 13
('Anemia Ferropenica (Hemoglobina Baja)', 'TranstornoS&G'),    -- Enfermedad_ID = 14
('Hemofilia Tipo A', 'TranstornoS&G'),                         -- Enfermedad_ID = 15
('Trombocitopenia Idiopatica', 'TranstornoS&G');               -- Enfermedad_ID = 16
GO

/* =========================================================================
   6. TIPOS DE COMPONENTE (6 registros)
   ========================================================================= */
INSERT INTO TipoComponente (TipoComponente, DiasVigencia, CondicionDeAlmacenamiento) VALUES
('Sangre Total (ST)', 35, 'Refrigeracion de 2 C a 6 C'),                                   -- TipoComponente_ID = 1
('Concentrado de Globulos Rojos (CGR)', 42, 'Refrigeracion de 2 C a 6 C con solucion aditiva'), -- TipoComponente_ID = 2
('Plasma Fresco Congelado (PFC)', 365, 'Congelacion inferior a -18 C'),                    -- TipoComponente_ID = 3
('Concentrado de Plaquetas (CP)', 5, 'Temperatura controlada de 20 C a 24 C en agitacion continua'), -- TipoComponente_ID = 4
('Crioprecipitado (CRIO)', 365, 'Congelacion inferior a -18 C'),                           -- TipoComponente_ID = 5
('Globulos Rojos Lavados (GRL)', 1, 'Refrigeracion de 2 C a 6 C (uso inmediato 24h)');     -- TipoComponente_ID = 6
GO

/* =========================================================================
   7. PERSONAS (125 registros)
      - Persona_ID 1 al 35: Personal del Banco de Sangre (35 personas)
      - Persona_ID 26 al 125: Donantes/Receptores (100 personas)
      - Nota: Las personas 26 a 35 son TANTO Personal como Donantes/Receptores.
   ========================================================================= */
INSERT INTO Persona (Nombre, ApPaterno, ApMaterno, FechaNacimiento, DocumentoDeIdentidad, Sexo) VALUES
-- 1 a 25: Personal exclusivo
('Rodrigo', 'Castellanos', 'Trigo', '1980-04-12', '1800101-TJA', 'M'),
('Maria Fernanda', 'Kohlberg', 'Navajas', '1985-08-23', '1800102-TJA', 'F'),
('Carlos Alberto', 'Echazu', 'Paz', '1978-11-05', '1800103-TJA', 'M'),
('Gabriela', 'Vacaflores', 'Avila', '1990-02-14', '1800104-TJA', 'F'),
('Jorge Luis', 'Baldiviezo', 'Lea Plaza', '1983-07-19', '1800105-TJA', 'M'),
('Claudia', 'Methfessel', 'Rana', '1988-12-01', '1800106-TJA', 'F'),
('Fernando', 'Campero', 'Hoyos', '1975-05-30', '1800107-TJA', 'M'),
('Daniela', 'Gareca', 'Tejerina', '1992-09-17', '1800108-TJA', 'F'),
('Marcelo', 'Jurado', 'Tolaba', '1987-03-22', '1800109-TJA', 'M'),
('Valeria', 'Soruco', 'Ruiz', '1994-06-11', '1800110-TJA', 'F'),
('Gustavo', 'Ontiveros', 'Farfan', '1981-01-25', '1800111-TJA', 'M'),
('Paola Andrea', 'Darlach', 'Castrillo', '1989-10-08', '1800112-TJA', 'F'),
('Ramiro', 'Zamora', 'Barrenechea', '1979-04-03', '1800113-TJA', 'M'),
('Lorena', 'Arce', 'Mogro', '1991-07-29', '1800114-TJA', 'F'),
('Eduardo', 'Lema', 'Oller', '1984-11-15', '1800115-TJA', 'M'),
('Silvana', 'Schnorr', 'Aparicio', '1993-02-28', '1800116-TJA', 'F'),
('Alejandro', 'Calabi', 'Michel', '1986-08-09', '1800117-TJA', 'M'),
('Micaela', 'Donoso', 'Ichazo', '1995-05-16', '1800118-TJA', 'F'),
('Javier', 'Pantoja', 'Borda', '1982-12-20', '1800119-TJA', 'M'),
('Natalia', 'Bacarreza', 'Mendieta', '1990-09-04', '1800120-TJA', 'F'),
('Oscar', 'Pino', 'Sarmiento', '1977-03-10', '1800121-TJA', 'M'),
('Veronica', 'Casso', 'Guzman', '1988-06-27', '1800122-TJA', 'F'),
('Mauricio', 'bluske', 'Morales', '1985-01-13', '1800123-TJA', 'M'),
('Carolina', 'Rodo', 'Salinas', '1992-04-21', '1800124-TJA', 'F'),
('Hugo', 'Canedo', 'Pacheco', '1976-10-31', '1800125-TJA', 'M'),
-- 26 a 35: Personal que TAMBIEN es Donante/Receptor
('Sergio', 'Aguirre', 'Cardozo', '1991-01-18', '1800126-TJA', 'M'),
('Camila', 'Bejarano', 'Copa', '1994-03-07', '1800127-TJA', 'F'),
('Diego', 'Vedia', 'Ortega', '1989-07-12', '1800128-TJA', 'M'),
('Andrea', 'Segovia', 'Gallardo', '1993-11-24', '1800129-TJA', 'F'),
('Cristian', 'Molina', 'Velasquez', '1987-05-02', '1800130-TJA', 'M'),
('Lucia', 'Subia', 'Penaloza', '1995-08-19', '1800131-TJA', 'F'),
('Gonzalo', 'Nieves', 'Romero', '1984-02-06', '1800132-TJA', 'M'),
('Patricia', 'Zenteno', 'Mamani', '1990-12-14', '1800133-TJA', 'F'),
('Ruben', 'Choque', 'Condori', '1986-09-28', '1800134-TJA', 'M'),
('Mariana', 'Cossio', 'Vargas', '1992-06-05', '1800135-TJA', 'F'),
-- 36 a 125: Donantes y Receptores (90 personas adicionales = 100 Donantes/Receptores en total)
('Juan Pablo', 'Rios', 'Aldana', '1996-02-10', '5010136-TJA', 'M'),
('Maria Belen', 'Rojas', 'Giron', '1998-05-22', '5010137-TJA', 'F'),
('Jose Luis', 'Flores', 'Tarifa', '1985-09-14', '5010138-TJA', 'M'),
('Ana Carola', 'Vargas', 'Mejia', '1993-12-03', '5010139-TJA', 'F'),
('Marco Antonio', 'Cruz', 'Serrano', '1988-04-17', '5010140-TJA', 'M'),
('Fabiana', 'Diaz', 'Altamirano', '1999-07-29', '5010141-TJA', 'F'),
('Luis Fernando', 'Gomez', 'Valdez', '1991-11-11', '5010142-TJA', 'M'),
('Carla', 'Sanchez', 'humacata', '1995-01-25', '5010143-TJA', 'F'),
('Pedro', 'Torrez', 'Yucra', '1982-06-08', '5010144-TJA', 'M'),
('Cecilia', 'Ramirez', 'Soliz', '1997-03-19', '5010145-TJA', 'F'),
('Miguel Angel', 'Herrera', 'Cuellar', '1984-08-30', '5010146-TJA', 'M'),
('Ximena', 'Medina', 'Llanos', '1990-10-12', '5010147-TJA', 'F'),
('Roberto', 'Castro', 'Portal', '1979-02-04', '5010148-TJA', 'M'),
('Alejandra', 'suarez', 'Garzon', '1996-06-15', '5010149-TJA', 'F'),
('David', 'Ortega', 'Benitez', '1987-12-27', '5010150-TJA', 'M'),
('Tatiana', 'Silva', 'Mendoza', '1994-04-09', '5010151-TJA', 'F'),
('Victor Hugo', 'Nunez', 'cabrera', '1981-07-21', '5010152-TJA', 'M'),
('Rocio', 'Aguilar', 'Peralta', '2000-01-13', '5010153-TJA', 'F'),
('alvaro', 'Guerrero', 'Jaramillo', '1992-05-24', '5010154-TJA', 'M'),
('Noelia', 'Pena', 'Sullca', '1998-09-06', '5010155-TJA', 'F'),
('Ricardo', 'Salazar', 'Chavez', '1986-03-18', '5010156-TJA', 'M'),
('Jimena', 'Delgado', 'Tapia', '1991-08-29', '5010157-TJA', 'F'),
('hector', 'Vega', 'Mariscal', '1983-11-02', '5010158-TJA', 'M'),
('Wendy', 'Romero', 'Lozano', '1997-02-14', '5010159-TJA', 'F'),
('Ariel', 'Morales', 'Pantaleon', '1989-06-26', '5010160-TJA', 'M'),
('Belen', 'Soto', 'Vilca', '2001-10-08', '5010161-TJA', 'F'),
('Martin', 'Contreras', 'Mendez', '1980-04-20', '5010162-TJA', 'M'),
('Pamela', 'Luna', 'Carrasco', '1993-07-01', '5010163-TJA', 'F'),
('Julio Cesar', 'Miranda', 'Espinoza', '1985-12-13', '5010164-TJA', 'M'),
('Jessica', 'Palacios', 'Zuniga', '1996-03-25', '5010165-TJA', 'F'),
('Ronald', 'Cortez', 'Alarcon', '1990-08-07', '5010166-TJA', 'M'),
('Cinthia', 'Bautista', 'Guzman', '1995-11-19', '5010167-TJA', 'F'),
('Efrain', 'Quispe', 'Mamani', '1982-01-31', '5010168-CHQ', 'M'),
('Liliana', 'Ponce', 'figueroa', '1999-05-12', '5010169-CHQ', 'F'),
('Freddy', 'Reyes', 'Arias', '1987-09-23', '5010170-CHQ', 'M'),
('Mayra', 'Escobar', 'Montero', '1994-12-05', '5010171-PTS', 'F'),
('Limbert', 'Huanca', 'Colque', '1988-02-16', '5010172-PTS', 'M'),
('katherine', 'maldonado', 'Soria', '2000-06-28', '5010173-PTS', 'F'),
('Wilfredo', 'perales', 'Tito', '1981-10-10', '5010174-SCZ', 'M'),
('Vanesa', 'Acosta', 'Saucedo', '1992-01-22', '5010175-SCZ', 'F'),
('Edwin', 'padilla', 'Justiniano', '1984-05-04', '5010176-SCZ', 'M'),
('Nadia', 'Montano', 'Cuellar', '1998-08-15', '5010177-TJA', 'F'),
('Boris', 'Navarro', 'Urzagaste', '1989-11-27', '5010178-TJA', 'M'),
('karina', 'Avendano', 'Duran', '1993-03-09', '5010179-TJA', 'F'),
('Milton', 'Galean', 'Segovia', '1986-07-20', '5010180-TJA', 'M'),
('Yolanda', 'Coca', 'Vda de Paz', '1978-10-01', '5010181-TJA', 'F'),
('Rene', 'bustamante', 'Claros', '1991-02-12', '5010182-TJA', 'M'),
('Sonia', 'Villalba', 'Calvimontes', '1996-05-25', '5010183-TJA', 'F'),
('ivan', 'Zeballos', 'Ayarde', '1983-09-05', '5010184-TJA', 'M'),
('Raquel', 'arteaga', 'Llanos', '2001-12-17', '5010185-TJA', 'F'),
('Grover', 'Apaza', 'Nina', '1985-04-28', '5010186-TJA', 'M'),
('Sandra', 'valdivia', 'Moscoso', '1990-07-10', '5010187-TJA', 'F'),
('Franz', 'Ticona', 'huanaco', '1988-10-21', '5010188-TJA', 'M'),
('Beatriz', 'Murillo', 'Prado', '1995-02-02', '5010189-TJA', 'F'),
('Bismarck', 'Giron', 'Wayar', '1980-06-14', '5010190-TJA', 'M'),
('Gladys', 'Paco', 'Huarachi', '1997-09-26', '5010191-TJA', 'F'),
('Ademar', 'Cuellar', 'Antelo', '1984-01-07', '5010192-TJA', 'M'),
('Monica', 'Rueda', 'Terceros', '1992-04-19', '5010193-TJA', 'F'),
('Yamil', 'Caballero', 'Daza', '1989-08-31', '5010194-TJA', 'M'),
('Tania', 'Velasco', 'Ovando', '1999-11-11', '5010195-TJA', 'F'),
('Hernan', 'Lizarraga', 'Bellido', '1982-03-23', '5010196-TJA', 'M'),
('Miriam', 'Choquehuanca', 'Quispe', '1994-06-04', '5010197-TJA', 'F'),
('jaime', 'Orellana', 'rodriguez', '1987-10-16', '5010198-TJA', 'M'),
('viviana', 'Lavadenz', 'Kempff', '1991-01-28', '5010199-TJA', 'F'),
('Elias', 'Cardenas', 'Mollo', '1986-05-09', '5010200-TJA', 'M'),
('Griselda', 'Paredes', 'Gallo', '1996-08-21', '5010201-TJA', 'F'),
('Paul', 'Montellano', 'Sanz', '1983-12-02', '5010202-TJA', 'M'),
('fabiola', 'Salvatierra', 'Vaca', '2000-03-14', '5010203-TJA', 'F'),
('Dorian', 'Aramayo', 'Zenteno', '1985-07-26', '5010204-TJA', 'M'),
('Marisol', 'Calizaya', 'Copa', '1993-11-06', '5010205-TJA', 'F'),
('Kevin', 'Aguilera', 'Banos', '2002-02-18', '5010206-TJA', 'M'),
('Brenda', 'Paz', 'Estenssoro', '1998-06-30', '5010207-TJA', 'F'),
('Gaston', 'Lozada', 'Sánchez', '1981-09-11', '5010208-ARG', 'M'),
('Agustina', 'Cornejo', 'Figueroa', '1995-12-23', '5010209-ARG', 'F'),
('Edson', 'Barrios', 'Garnica', '1989-04-04', '5010210-TJA', 'M'),
('Nelly', 'Mendoza', 'Torrez', '1990-08-16', '5010211-TJA', 'F'),
('Dante', 'Villanueva', 'Cano', '1977-11-28', '5010212-TJA', 'M'),
('Katerine', 'Abasto', 'Rojas', '1997-03-10', '5010213-TJA', 'F'),
('Jhonny', 'Condori', 'Alvarez', '1984-06-22', '5010214-TJA', 'M'),
('Milenka', 'Rivera', 'Costas', '1993-10-03', '5010215-TJA', 'F'),
('Erick', 'Sanjines', 'Noya', '1991-01-15', '5010216-TJA', 'M'),
('Denisse', 'Quiroga', 'Crespo', '1996-04-27', '5010217-TJA', 'F'),
('Ruben Dario', 'Borda', 'Guzman', '1974-08-08', '5010218-TJA', 'M'),
('Carmen Rosa', 'Arias', 'Vega', '1969-11-19', '5010219-TJA', 'F'),
('Genaro', 'Mamani', 'Choque', '1971-02-28', '5010220-TJA', 'M'),
('Marta', 'Salguero', 'Rocha', '1973-05-15', '5010221-TJA', 'F'),
('Humberto', 'Peredo', 'Galarza', '1968-09-01', '5010222-TJA', 'M'),
('Teresa', 'Ledezma', 'Crespo', '1972-12-10', '5010223-TJA', 'F'),
('Arturo', 'Urzagaste', 'Pinto', '1970-03-21', '5010224-TJA', 'M'),
('Elena', 'Monzon', 'Dalence', '1975-07-04', '5010225-TJA', 'F');
GO

/* =========================================================================
   8. EMAILS (140 registros: 125 principales + 15 secundarios laborales)
   ========================================================================= */
INSERT INTO Email (DireccionE) VALUES
('rodrigo.castellanos@bancosangretarija.gob.bo'),
('mfernanda.kohlberg@bancosangretarija.gob.bo'),
('carlos.echazu@bancosangretarija.gob.bo'),
('gabriela.vacaflores@bancosangretarija.gob.bo'),
('jorge.baldiviezo@bancosangretarija.gob.bo'),
('claudia.methfessel@bancosangretarija.gob.bo'),
('fernando.campero@bancosangretarija.gob.bo'),
('daniela.gareca@bancosangretarija.gob.bo'),
('marcelo.jurado@bancosangretarija.gob.bo'),
('valeria.soruco@bancosangretarija.gob.bo'),
('gustavo.ontiveros@bancosangretarija.gob.bo'),
('paola.darlach@bancosangretarija.gob.bo'),
('ramiro.zamora@bancosangretarija.gob.bo'),
('lorena.arce@bancosangretarija.gob.bo'),
('eduardo.lema@bancosangretarija.gob.bo'),
('silvana.schnorr@bancosangretarija.gob.bo'),
('alejandro.calabi@bancosangretarija.gob.bo'),
('micaela.donoso@bancosangretarija.gob.bo'),
('javier.pantoja@bancosangretarija.gob.bo'),
('natalia.bacarreza@bancosangretarija.gob.bo'),
('oscar.pino@bancosangretarija.gob.bo'),
('veronica.casso@bancosangretarija.gob.bo'),
('mauricio.bluske@bancosangretarija.gob.bo'),
('carolina.rodo@bancosangretarija.gob.bo'),
('hugo.canedo@bancosangretarija.gob.bo'),
('sergio.aguirre@bancosangretarija.gob.bo'),
('camila.bejarano@bancosangretarija.gob.bo'),
('diego.vedia@bancosangretarija.gob.bo'),
('andrea.segovia@bancosangretarija.gob.bo'),
('cristian.molina@bancosangretarija.gob.bo'),
('lucia.subia@bancosangretarija.gob.bo'),
('gonzalo.nieves@bancosangretarija.gob.bo'),
('patricia.zenteno@bancosangretarija.gob.bo'),
('ruben.choque@bancosangretarija.gob.bo'),
('mariana.cossio@bancosangretarija.gob.bo'),
('juanpablo.rios36@gmail.com'),
('mbelen.rojas37@gmail.com'),
('joseluis.flores38@hotmail.com'),
('anacarola.vargas39@gmail.com'),
('marco.cruz40@yahoo.com'),
('fabiana.diaz41@uajms.edu.bo'),
('luis.gomez42@gmail.com'),
('carla.sanchez43@gmail.com'),
('pedro.torrez44@hotmail.com'),
('cecilia.ramirez45@gmail.com'),
('miguel.herrera46@gmail.com'),
('ximena.medina47@ucb.edu.bo'),
('roberto.castro48@gmail.com'),
('alejandra.suarez49@gmail.com'),
('david.ortega50@hotmail.com'),
('tatiana.silva51@gmail.com'),
('victor.nunez52@gmail.com'),
('rocio.aguilar53@uajms.edu.bo'),
('alvaro.guerrero54@gmail.com'),
('noelia.pena55@gmail.com'),
('ricardo.salazar56@hotmail.com'),
('jimena.delgado57@gmail.com'),
('hector.vega58@gmail.com'),
('wendy.romero59@uajms.edu.bo'),
('ariel.morales60@gmail.com'),
('belen.soto61@gmail.com'),
('martin.contreras62@hotmail.com'),
('pamela.luna63@gmail.com'),
('juliocesar.miranda64@gmail.com'),
('jessica.palacios65@ucb.edu.bo'),
('ronald.cortez66@gmail.com'),
('cinthia.bautista67@gmail.com'),
('efrain.quispe68@hotmail.com'),
('liliana.ponce69@gmail.com'),
('freddy.reyes70@gmail.com'),
('mayra.escobar71@gmail.com'),
('limbert.huanca72@hotmail.com'),
('katherine.maldonado73@gmail.com'),
('wilfredo.perales74@gmail.com'),
('vanesa.acosta75@gmail.com'),
('edwin.padilla76@hotmail.com'),
('nadia.montano77@gmail.com'),
('boris.navarro78@gmail.com'),
('karina.avendano79@uajms.edu.bo'),
('milton.galean80@gmail.com'),
('yolanda.coca81@hotmail.com'),
('rene.bustamante82@gmail.com'),
('sonia.villalba83@gmail.com'),
('ivan.zeballos84@gmail.com'),
('raquel.arteaga85@uajms.edu.bo'),
('grover.apaza86@gmail.com'),
('sandra.valdivia87@hotmail.com'),
('franz.ticona88@gmail.com'),
('beatriz.murillo89@gmail.com'),
('bismarck.giron90@gmail.com'),
('gladys.paco91@hotmail.com'),
('ademar.cuellar92@gmail.com'),
('monica.rueda93@gmail.com'),
('yamil.caballero94@gmail.com'),
('tania.velasco95@uajms.edu.bo'),
('hernan.lizarraga96@gmail.com'),
('miriam.choquehuanca97@gmail.com'),
('jaime.orellana98@hotmail.com'),
('viviana.lavadenz99@gmail.com'),
('elias.cardenas100@gmail.com'),
('griselda.paredes101@gmail.com'),
('paul.montellano102@hotmail.com'),
('fabiola.salvatierra103@gmail.com'),
('dorian.aramayo104@gmail.com'),
('marisol.calizaya105@gmail.com'),
('kevin.aguilera106@uajms.edu.bo'),
('brenda.paz107@ucb.edu.bo'),
('gaston.lozada108@gmail.com'),
('agustina.cornejo109@gmail.com'),
('edson.barrios110@hotmail.com'),
('nelly.mendoza111@gmail.com'),
('dante.villanueva112@gmail.com'),
('katerine.abasto113@gmail.com'),
('jhonny.condori114@hotmail.com'),
('milenka.rivera115@gmail.com'),
('erick.sanjines116@gmail.com'),
('denisse.quiroga117@gmail.com'),
('rubendario.borda118@hotmail.com'),
('carmen.arias119@gmail.com'),
('genaro.mamani120@gmail.com'),
('marta.salguero121@hotmail.com'),
('humberto.peredo122@gmail.com'),
('teresa.ledezma123@gmail.com'),
('arturo.urzagaste124@hotmail.com'),
('elena.monzon125@gmail.com'),
-- 15 correos personales secundarios para las primeras 15 personas
('rodrigo.castellanos.personal@gmail.com'),
('mfernanda.kohlberg.personal@gmail.com'),
('carlos.echazu.med@gmail.com'),
('gaby.vacaflores90@gmail.com'),
('jorge.baldiviezo83@hotmail.com'),
('claudia.methfessel@gmail.com'),
('dr.fernandocampero@gmail.com'),
('dani.gareca.bio@gmail.com'),
('marcelo.jurado.tja@gmail.com'),
('valeria.soruco94@gmail.com'),
('gustavo.ontiveros81@hotmail.com'),
('paola.darlach.lab@gmail.com'),
('ramiro.zamora.tja@gmail.com'),
('lorena.arce91@gmail.com'),
('eduardo.lema.salud@gmail.com');
GO

/* =========================================================================
   9. EMAIL_PERSONA (140 registros - 1 o máximo 2 correos por persona)
   ========================================================================= */
INSERT INTO EmailPersona (Persona_ID, Email_ID, FechaRegistro, Flag) VALUES
(1, 1, '2023-01-10 08:30:00', 1), (2, 2, '2023-01-10 08:35:00', 1), (3, 3, '2023-01-10 08:40:00', 1),
(4, 4, '2023-01-10 08:45:00', 1), (5, 5, '2023-01-10 08:50:00', 1), (6, 6, '2023-01-11 09:00:00', 1),
(7, 7, '2023-01-11 09:10:00', 1), (8, 8, '2023-01-11 09:20:00', 1), (9, 9, '2023-01-11 09:30:00', 1),
(10, 10, '2023-01-11 09:40:00', 1), (11, 11, '2023-01-12 08:15:00', 1), (12, 12, '2023-01-12 08:25:00', 1),
(13, 13, '2023-01-12 08:35:00', 1), (14, 14, '2023-01-12 08:45:00', 1), (15, 15, '2023-01-12 08:55:00', 1),
(16, 16, '2023-01-15 10:00:00', 1), (17, 17, '2023-01-15 10:10:00', 1), (18, 18, '2023-01-15 10:20:00', 1),
(19, 19, '2023-01-15 10:30:00', 1), (20, 20, '2023-01-15 10:40:00', 1), (21, 21, '2023-01-16 11:00:00', 1),
(22, 22, '2023-01-16 11:10:00', 1), (23, 23, '2023-01-16 11:20:00', 1), (24, 24, '2023-01-16 11:30:00', 1),
(25, 25, '2023-01-16 11:40:00', 1), (26, 26, '2023-02-01 08:30:00', 1), (27, 27, '2023-02-01 08:40:00', 1),
(28, 28, '2023-02-01 08:50:00', 1), (29, 29, '2023-02-01 09:00:00', 1), (30, 30, '2023-02-01 09:10:00', 1),
(31, 31, '2023-02-02 09:20:00', 1), (32, 32, '2023-02-02 09:30:00', 1), (33, 33, '2023-02-02 09:40:00', 1),
(34, 34, '2023-02-02 09:50:00', 1), (35, 35, '2023-02-02 10:00:00', 1), (36, 36, '2024-01-05 08:30:00', 1),
(37, 37, '2024-01-05 09:00:00', 1), (38, 38, '2024-01-06 10:15:00', 1), (39, 39, '2024-01-06 11:00:00', 1),
(40, 40, '2024-01-07 08:45:00', 1), (41, 41, '2024-01-08 09:20:00', 1), (42, 42, '2024-01-08 10:30:00', 1),
(43, 43, '2024-01-09 14:10:00', 1), (44, 44, '2024-01-10 08:15:00', 1), (45, 45, '2024-01-10 09:40:00', 1),
(46, 46, '2024-01-11 10:05:00', 1), (47, 47, '2024-01-12 11:20:00', 1), (48, 48, '2024-01-12 15:00:00', 1),
(49, 49, '2024-01-13 08:50:00', 1), (50, 50, '2024-01-14 09:10:00', 1), (51, 51, '2024-01-15 10:25:00', 1),
(52, 52, '2024-01-15 11:45:00', 1), (53, 53, '2024-01-16 08:30:00', 1), (54, 54, '2024-01-17 09:15:00', 1),
(55, 55, '2024-01-18 10:40:00', 1), (56, 56, '2024-01-19 14:20:00', 1), (57, 57, '2024-01-20 08:10:00', 1),
(58, 58, '2024-01-21 09:35:00', 1), (59, 59, '2024-01-22 10:50:00', 1), (60, 60, '2024-01-23 11:15:00', 1),
(61, 61, '2024-02-01 08:20:00', 1), (62, 62, '2024-02-02 09:45:00', 1), (63, 63, '2024-02-03 10:10:00', 1),
(64, 64, '2024-02-04 11:30:00', 1), (65, 65, '2024-02-05 14:50:00', 1), (66, 66, '2024-02-06 08:25:00', 1),
(67, 67, '2024-02-07 09:10:00', 1), (68, 68, '2024-02-08 10:35:00', 1), (69, 69, '2024-02-09 11:00:00', 1),
(70, 70, '2024-02-10 15:15:00', 1), (71, 71, '2024-02-11 08:40:00', 1), (72, 72, '2024-02-12 09:20:00', 1),
(73, 73, '2024-02-13 10:05:00', 1), (74, 74, '2024-02-14 11:25:00', 1), (75, 75, '2024-02-15 14:40:00', 1),
(76, 76, '2024-02-16 08:15:00', 1), (77, 77, '2024-02-17 09:30:00', 1), (78, 78, '2024-02-18 10:45:00', 1),
(79, 79, '2024-02-19 11:10:00', 1), (80, 80, '2024-02-20 15:00:00', 1), (81, 81, '2024-03-01 08:30:00', 1),
(82, 82, '2024-03-02 09:15:00', 1), (83, 83, '2024-03-03 10:20:00', 1), (84, 84, '2024-03-04 11:40:00', 1),
(85, 85, '2024-03-05 14:10:00', 1), (86, 86, '2024-03-06 08:50:00', 1), (87, 87, '2024-03-07 09:25:00', 1),
(88, 88, '2024-03-08 10:30:00', 1), (89, 89, '2024-03-09 11:05:00', 1), (90, 90, '2024-03-10 15:20:00', 1),
(91, 91, '2024-03-11 08:10:00', 1), (92, 92, '2024-03-12 09:35:00', 1), (93, 93, '2024-03-13 10:50:00', 1),
(94, 94, '2024-03-14 11:15:00', 1), (95, 95, '2024-03-15 14:30:00', 1), (96, 96, '2024-03-16 08:25:00', 1),
(97, 97, '2024-03-17 09:40:00', 1), (98, 98, '2024-03-18 10:15:00', 1), (99, 99, '2024-03-19 11:30:00', 1),
(100, 100, '2024-03-20 14:45:00', 1), (101, 101, '2024-04-01 08:20:00', 1), (102, 102, '2024-04-02 09:10:00', 1),
(103, 103, '2024-04-03 10:35:00', 1), (104, 104, '2024-04-04 11:00:00', 1), (105, 105, '2024-04-05 15:10:00', 1),
(106, 106, '2024-04-06 08:45:00', 1), (107, 107, '2024-04-07 09:20:00', 1), (108, 108, '2024-04-08 10:05:00', 1),
(109, 109, '2024-04-09 11:25:00', 1), (110, 110, '2024-04-10 14:40:00', 1), (111, 111, '2024-04-11 08:15:00', 1),
(112, 112, '2024-04-12 09:30:00', 1), (113, 113, '2024-04-13 10:45:00', 1), (114, 114, '2024-04-14 11:10:00', 1),
(115, 115, '2024-04-15 15:00:00', 1), (116, 116, '2024-04-16 08:30:00', 1), (117, 117, '2024-04-17 09:15:00', 1),
(118, 118, '2024-04-18 10:20:00', 1), (119, 119, '2024-04-19 11:40:00', 1), (120, 120, '2024-04-20 14:10:00', 1),
(121, 121, '2024-04-21 08:50:00', 1), (122, 122, '2024-04-22 09:25:00', 1), (123, 123, '2024-04-23 10:30:00', 1),
(124, 124, '2024-04-24 11:05:00', 1), (125, 125, '2024-04-25 15:20:00', 1),
-- Segundo correo para las primeras 15 personas
(1, 126, '2024-06-01 10:00:00', 1), (2, 127, '2024-06-01 10:05:00', 1), (3, 128, '2024-06-01 10:10:00', 1),
(4, 129, '2024-06-01 10:15:00', 1), (5, 130, '2024-06-01 10:20:00', 1), (6, 131, '2024-06-01 10:25:00', 1),
(7, 132, '2024-06-01 10:30:00', 1), (8, 133, '2024-06-01 10:35:00', 1), (9, 134, '2024-06-01 10:40:00', 1),
(10, 135, '2024-06-01 10:45:00', 1), (11, 136, '2024-06-01 10:50:00', 0), (12, 137, '2024-06-01 10:55:00', 1),
(13, 138, '2024-06-01 11:00:00', 1), (14, 139, '2024-06-01 11:05:00', 1), (15, 140, '2024-06-01 11:10:00', 1);
GO

/* =========================================================================
   10. TELEFONOS (145 registros: 125 celulares + 20 fijos de Tarija 466-XXXXX)
   ========================================================================= */
INSERT INTO Telefono (numTelefono, CodPais, TipoTelefono) VALUES
('72980101', '+591', 'Celular'), ('72980102', '+591', 'Celular'), ('72980103', '+591', 'Celular'),
('72980104', '+591', 'Celular'), ('72980105', '+591', 'Celular'), ('72980106', '+591', 'Celular'),
('72980107', '+591', 'Celular'), ('72980108', '+591', 'Celular'), ('72980109', '+591', 'Celular'),
('72980110', '+591', 'Celular'), ('72980111', '+591', 'Celular'), ('72980112', '+591', 'Celular'),
('72980113', '+591', 'Celular'), ('72980114', '+591', 'Celular'), ('72980115', '+591', 'Celular'),
('72980116', '+591', 'Celular'), ('72980117', '+591', 'Celular'), ('72980118', '+591', 'Celular'),
('72980119', '+591', 'Celular'), ('72980120', '+591', 'Celular'), ('72980121', '+591', 'Celular'),
('72980122', '+591', 'Celular'), ('72980123', '+591', 'Celular'), ('72980124', '+591', 'Celular'),
('72980125', '+591', 'Celular'), ('72980126', '+591', 'Celular'), ('72980127', '+591', 'Celular'),
('72980128', '+591', 'Celular'), ('72980129', '+591', 'Celular'), ('72980130', '+591', 'Celular'),
('72980131', '+591', 'Celular'), ('72980132', '+591', 'Celular'), ('72980133', '+591', 'Celular'),
('72980134', '+591', 'Celular'), ('72980135', '+591', 'Celular'), ('71860136', '+591', 'Celular'),
('71860137', '+591', 'Celular'), ('71860138', '+591', 'Celular'), ('71860139', '+591', 'Celular'),
('71860140', '+591', 'Celular'), ('71860141', '+591', 'Celular'), ('71860142', '+591', 'Celular'),
('71860143', '+591', 'Celular'), ('71860144', '+591', 'Celular'), ('71860145', '+591', 'Celular'),
('71860146', '+591', 'Celular'), ('71860147', '+591', 'Celular'), ('71860148', '+591', 'Celular'),
('71860149', '+591', 'Celular'), ('71860150', '+591', 'Celular'), ('71860151', '+591', 'Celular'),
('71860152', '+591', 'Celular'), ('71860153', '+591', 'Celular'), ('71860154', '+591', 'Celular'),
('71860155', '+591', 'Celular'), ('71860156', '+591', 'Celular'), ('71860157', '+591', 'Celular'),
('71860158', '+591', 'Celular'), ('71860159', '+591', 'Celular'), ('71860160', '+591', 'Celular'),
('65820161', '+591', 'Celular'), ('65820162', '+591', 'Celular'), ('65820163', '+591', 'Celular'),
('65820164', '+591', 'Celular'), ('65820165', '+591', 'Celular'), ('65820166', '+591', 'Celular'),
('65820167', '+591', 'Celular'), ('65820168', '+591', 'Celular'), ('65820169', '+591', 'Celular'),
('65820170', '+591', 'Celular'), ('65820171', '+591', 'Celular'), ('65820172', '+591', 'Celular'),
('65820173', '+591', 'Celular'), ('65820174', '+591', 'Celular'), ('65820175', '+591', 'Celular'),
('65820176', '+591', 'Celular'), ('65820177', '+591', 'Celular'), ('65820178', '+591', 'Celular'),
('65820179', '+591', 'Celular'), ('65820180', '+591', 'Celular'), ('65820181', '+591', 'Celular'),
('65820182', '+591', 'Celular'), ('65820183', '+591', 'Celular'), ('65820184', '+591', 'Celular'),
('65820185', '+591', 'Celular'), ('65820186', '+591', 'Celular'), ('65820187', '+591', 'Celular'),
('65820188', '+591', 'Celular'), ('65820189', '+591', 'Celular'), ('65820190', '+591', 'Celular'),
('76190191', '+591', 'Celular'), ('76190192', '+591', 'Celular'), ('76190193', '+591', 'Celular'),
('76190194', '+591', 'Celular'), ('76190195', '+591', 'Celular'), ('76190196', '+591', 'Celular'),
('76190197', '+591', 'Celular'), ('76190198', '+591', 'Celular'), ('76190199', '+591', 'Celular'),
('76190200', '+591', 'Celular'), ('76190201', '+591', 'Celular'), ('76190202', '+591', 'Celular'),
('76190203', '+591', 'Celular'), ('76190204', '+591', 'Celular'), ('76190205', '+591', 'Celular'),
('76190206', '+591', 'Celular'), ('76190207', '+591', 'Celular'), ('387540208', '+54', 'Celular'),
('387540209', '+54', 'Celular'), ('76190210', '+591', 'Celular'), ('76190211', '+591', 'Celular'),
('76190212', '+591', 'Celular'), ('76190213', '+591', 'Celular'), ('76190214', '+591', 'Celular'),
('76190215', '+591', 'Celular'), ('76190216', '+591', 'Celular'), ('76190217', '+591', 'Celular'),
('76190218', '+591', 'Celular'), ('76190219', '+591', 'Celular'), ('76190220', '+591', 'Celular'),
('76190221', '+591', 'Celular'), ('76190222', '+591', 'Celular'), ('76190223', '+591', 'Celular'),
('76190224', '+591', 'Celular'), ('76190225', '+591', 'Celular'),
-- 20 Teléfonos Fijos de Tarija (Código 466-XXXXX)
('46642101', '+591', 'Fijo Domicilio'), ('46642102', '+591', 'Fijo Domicilio'),
('46642103', '+591', 'Fijo Consultorio'), ('46642104', '+591', 'Fijo Domicilio'),
('46642105', '+591', 'Fijo Domicilio'), ('46642106', '+591', 'Fijo Domicilio'),
('46642107', '+591', 'Fijo Consultorio'), ('46642108', '+591', 'Fijo Domicilio'),
('46642109', '+591', 'Fijo Domicilio'), ('46642110', '+591', 'Fijo Domicilio'),
('46643201', '+591', 'Fijo Domicilio'), ('46643202', '+591', 'Fijo Domicilio'),
('46643203', '+591', 'Fijo Trabajo'), ('46643204', '+591', 'Fijo Domicilio'),
('46643205', '+591', 'Fijo Domicilio'), ('46643206', '+591', 'Fijo Trabajo'),
('46643207', '+591', 'Fijo Domicilio'), ('46643208', '+591', 'Fijo Domicilio'),
('46643209', '+591', 'Fijo Domicilio'), ('46643210', '+591', 'Fijo Domicilio');
GO

/* =========================================================================
   11. PERSONA_TELEFONO (145 registros - 1 o máximo 2 teléfonos por persona)
   ========================================================================= */
INSERT INTO PersonaTelefono (Persona_ID, Telefono_ID, FechaRegistro, Flag) VALUES
(1, 1, '2023-01-10 08:30:00', 1), (2, 2, '2023-01-10 08:35:00', 1), (3, 3, '2023-01-10 08:40:00', 1),
(4, 4, '2023-01-10 08:45:00', 1), (5, 5, '2023-01-10 08:50:00', 1), (6, 6, '2023-01-11 09:00:00', 1),
(7, 7, '2023-01-11 09:10:00', 1), (8, 8, '2023-01-11 09:20:00', 1), (9, 9, '2023-01-11 09:30:00', 1),
(10, 10, '2023-01-11 09:40:00', 1), (11, 11, '2023-01-12 08:15:00', 1), (12, 12, '2023-01-12 08:25:00', 1),
(13, 13, '2023-01-12 08:35:00', 1), (14, 14, '2023-01-12 08:45:00', 1), (15, 15, '2023-01-12 08:55:00', 1),
(16, 16, '2023-01-15 10:00:00', 1), (17, 17, '2023-01-15 10:10:00', 1), (18, 18, '2023-01-15 10:20:00', 1),
(19, 19, '2023-01-15 10:30:00', 1), (20, 20, '2023-01-15 10:40:00', 1), (21, 21, '2023-01-16 11:00:00', 1),
(22, 22, '2023-01-16 11:10:00', 1), (23, 23, '2023-01-16 11:20:00', 1), (24, 24, '2023-01-16 11:30:00', 1),
(25, 25, '2023-01-16 11:40:00', 1), (26, 26, '2023-02-01 08:30:00', 1), (27, 27, '2023-02-01 08:40:00', 1),
(28, 28, '2023-02-01 08:50:00', 1), (29, 29, '2023-02-01 09:00:00', 1), (30, 30, '2023-02-01 09:10:00', 1),
(31, 31, '2023-02-02 09:20:00', 1), (32, 32, '2023-02-02 09:30:00', 1), (33, 33, '2023-02-02 09:40:00', 1),
(34, 34, '2023-02-02 09:50:00', 1), (35, 35, '2023-02-02 10:00:00', 1), (36, 36, '2024-01-05 08:30:00', 1),
(37, 37, '2024-01-05 09:00:00', 1), (38, 38, '2024-01-06 10:15:00', 1), (39, 39, '2024-01-06 11:00:00', 1),
(40, 40, '2024-01-07 08:45:00', 1), (41, 41, '2024-01-08 09:20:00', 1), (42, 42, '2024-01-08 10:30:00', 1),
(43, 43, '2024-01-09 14:10:00', 1), (44, 44, '2024-01-10 08:15:00', 1), (45, 45, '2024-01-10 09:40:00', 1),
(46, 46, '2024-01-11 10:05:00', 1), (47, 47, '2024-01-12 11:20:00', 1), (48, 48, '2024-01-12 15:00:00', 1),
(49, 49, '2024-01-13 08:50:00', 1), (50, 50, '2024-01-14 09:10:00', 1), (51, 51, '2024-01-15 10:25:00', 1),
(52, 52, '2024-01-15 11:45:00', 1), (53, 53, '2024-01-16 08:30:00', 1), (54, 54, '2024-01-17 09:15:00', 1),
(55, 55, '2024-01-18 10:40:00', 1), (56, 56, '2024-01-19 14:20:00', 1), (57, 57, '2024-01-20 08:10:00', 1),
(58, 58, '2024-01-21 09:35:00', 1), (59, 59, '2024-01-22 10:50:00', 1), (60, 60, '2024-01-23 11:15:00', 1),
(61, 61, '2024-02-01 08:20:00', 1), (62, 62, '2024-02-02 09:45:00', 1), (63, 63, '2024-02-03 10:10:00', 1),
(64, 64, '2024-02-04 11:30:00', 1), (65, 65, '2024-02-05 14:50:00', 1), (66, 66, '2024-02-06 08:25:00', 1),
(67, 67, '2024-02-07 09:10:00', 1), (68, 68, '2024-02-08 10:35:00', 1), (69, 69, '2024-02-09 11:00:00', 1),
(70, 70, '2024-02-10 15:15:00', 1), (71, 71, '2024-02-11 08:40:00', 1), (72, 72, '2024-02-12 09:20:00', 1),
(73, 73, '2024-02-13 10:05:00', 1), (74, 74, '2024-02-14 11:25:00', 1), (75, 75, '2024-02-15 14:40:00', 1),
(76, 76, '2024-02-16 08:15:00', 1), (77, 77, '2024-02-17 09:30:00', 1), (78, 78, '2024-02-18 10:45:00', 1),
(79, 79, '2024-02-19 11:10:00', 1), (80, 80, '2024-02-20 15:00:00', 1), (81, 81, '2024-03-01 08:30:00', 1),
(82, 82, '2024-03-02 09:15:00', 1), (83, 83, '2024-03-03 10:20:00', 1), (84, 84, '2024-03-04 11:40:00', 1),
(85, 85, '2024-03-05 14:10:00', 1), (86, 86, '2024-03-06 08:50:00', 1), (87, 87, '2024-03-07 09:25:00', 1),
(88, 88, '2024-03-08 10:30:00', 1), (89, 89, '2024-03-09 11:05:00', 1), (90, 90, '2024-03-10 15:20:00', 1),
(91, 91, '2024-03-11 08:10:00', 1), (92, 92, '2024-03-12 09:35:00', 1), (93, 93, '2024-03-13 10:50:00', 1),
(94, 94, '2024-03-14 11:15:00', 1), (95, 95, '2024-03-15 14:30:00', 1), (96, 96, '2024-03-16 08:25:00', 1),
(97, 97, '2024-03-17 09:40:00', 1), (98, 98, '2024-03-18 10:15:00', 1), (99, 99, '2024-03-19 11:30:00', 1),
(100, 100, '2024-03-20 14:45:00', 1), (101, 101, '2024-04-01 08:20:00', 1), (102, 102, '2024-04-02 09:10:00', 1),
(103, 103, '2024-04-03 10:35:00', 1), (104, 104, '2024-04-04 11:00:00', 1), (105, 105, '2024-04-05 15:10:00', 1),
(106, 106, '2024-04-06 08:45:00', 1), (107, 107, '2024-04-07 09:20:00', 1), (108, 108, '2024-04-08 10:05:00', 1),
(109, 109, '2024-04-09 11:25:00', 1), (110, 110, '2024-04-10 14:40:00', 1), (111, 111, '2024-04-11 08:15:00', 1),
(112, 112, '2024-04-12 09:30:00', 1), (113, 113, '2024-04-13 10:45:00', 1), (114, 114, '2024-04-14 11:10:00', 1),
(115, 115, '2024-04-15 15:00:00', 1), (116, 116, '2024-04-16 08:30:00', 1), (117, 117, '2024-04-17 09:15:00', 1),
(118, 118, '2024-04-18 10:20:00', 1), (119, 119, '2024-04-19 11:40:00', 1), (120, 120, '2024-04-20 14:10:00', 1),
(121, 121, '2024-04-21 08:50:00', 1), (122, 122, '2024-04-22 09:25:00', 1), (123, 123, '2024-04-23 10:30:00', 1),
(124, 124, '2024-04-24 11:05:00', 1), (125, 125, '2024-04-25 15:20:00', 1),
-- Teléfono fijo secundario para 20 personas
(1, 126, '2024-05-10 09:00:00', 1), (2, 127, '2024-05-10 09:05:00', 1), (3, 128, '2024-05-10 09:10:00', 1),
(4, 129, '2024-05-10 09:15:00', 1), (5, 130, '2024-05-10 09:20:00', 1), (6, 131, '2024-05-10 09:25:00', 1),
(7, 132, '2024-05-10 09:30:00', 1), (8, 133, '2024-05-10 09:35:00', 1), (9, 134, '2024-05-10 09:40:00', 1),
(10, 135, '2024-05-10 09:45:00', 1), (36, 136, '2024-05-12 10:00:00', 1), (37, 137, '2024-05-12 10:05:00', 1),
(38, 138, '2024-05-12 10:10:00', 1), (39, 139, '2024-05-12 10:15:00', 1), (40, 140, '2024-05-12 10:20:00', 1),
(41, 141, '2024-05-12 10:25:00', 1), (42, 142, '2024-05-12 10:30:00', 1), (43, 143, '2024-05-12 10:35:00', 1),
(44, 144, '2024-05-12 10:40:00', 1), (45, 145, '2024-05-12 10:45:00', 1);
GO

/* =========================================================================
   12. PERSONAL (35 registros: 30 activos + 5 con contrato finalizado)
       Cumple el CHECK Actividad: (Activo=1 AND FechaFin IS NULL) OR (Activo=0 AND FechaFin IS NOT NULL)
   ========================================================================= */
INSERT INTO Personal (Persona_ID, Cargo_ID, FechaInicio, FechaFin, Activo) VALUES
(1, 1, '2018-03-01', NULL, 1),
(2, 2, '2019-05-15', NULL, 1),
(3, 1, '2017-08-10', NULL, 1),
(4, 3, '2020-02-01', NULL, 1),
(5, 4, '2020-06-20', NULL, 1),
(6, 5, '2019-11-11', NULL, 1),
(7, 6, '2018-09-01', NULL, 1),
(8, 2, '2021-01-15', NULL, 1),
(9, 4, '2021-04-12', NULL, 1),
(10, 3, '2022-02-28', NULL, 1),
(11, 7, '2019-07-01', NULL, 1),
(12, 6, '2020-10-05', NULL, 1),
(13, 4, '2021-08-19', NULL, 1),
(14, 3, '2022-05-10', NULL, 1),
(15, 5, '2020-03-15', NULL, 1),
(16, 4, '2023-01-09', NULL, 1),
(17, 2, '2021-11-22', NULL, 1),
(18, 8, '2023-04-03', NULL, 1),
(19, 9, '2022-07-18', NULL, 1),
(20, 3, '2021-09-01', NULL, 1),
(21, 1, '2019-02-14', NULL, 1),
(22, 4, '2022-10-10', NULL, 1),
(23, 6, '2020-12-01', NULL, 1),
(24, 3, '2023-02-20', NULL, 1),
(25, 7, '2018-06-15', NULL, 1),
(26, 4, '2023-05-02', NULL, 1),
(27, 3, '2023-06-12', NULL, 1),
(28, 2, '2022-08-01', NULL, 1),
(29, 9, '2023-09-18', NULL, 1),
(30, 4, '2022-03-07', NULL, 1),
-- 5 Ex-trabajadores con FechaFin definida y Activo = 0
(31, 8, '2021-02-01', '2023-12-31', 0),
(32, 10, '2022-01-10', '2023-06-30', 0),
(33, 9, '2020-05-01', '2022-11-30', 0),
(34, 4, '2021-07-15', '2024-01-31', 0),
(35, 10, '2023-01-15', '2024-03-15', 0);
GO

/* =========================================================================
   13. DONANTE_RECEPTOR (100 registros: Donante_Receptor_ID 1 al 100)
       Mapeados a Persona_ID 26 al 125.
   ========================================================================= */
INSERT INTO Donante_Receptor (Persona_ID, FactorRH, GrupoSanguineo) VALUES
(26, '+', 'O'),  -- Donante_Receptor_ID = 1 (También Personal)
(27, '+', 'A'),  -- Donante_Receptor_ID = 2 (También Personal)
(28, '-', 'O'),  -- Donante_Receptor_ID = 3 (También Personal)
(29, '+', 'B'),  -- Donante_Receptor_ID = 4 (También Personal)
(30, '+', 'O'),  -- Donante_Receptor_ID = 5 (También Personal)
(31, '+', 'A'),  -- Donante_Receptor_ID = 6 (También Personal)
(32, '-', 'A'),  -- Donante_Receptor_ID = 7 (También Personal)
(33, '+', 'AB'), -- Donante_Receptor_ID = 8 (También Personal)
(34, '+', 'O'),  -- Donante_Receptor_ID = 9 (También Personal)
(35, '+', 'O'),  -- Donante_Receptor_ID = 10 (También Personal)
(36, '+', 'O'),  -- Donante_Receptor_ID = 11
(37, '+', 'A'),  -- Donante_Receptor_ID = 12
(38, '+', 'O'),  -- Donante_Receptor_ID = 13
(39, '+', 'B'),  -- Donante_Receptor_ID = 14
(40, '-', 'O'),  -- Donante_Receptor_ID = 15
(41, '+', 'O'),  -- Donante_Receptor_ID = 16
(42, '+', 'A'),  -- Donante_Receptor_ID = 17
(43, '+', 'O'),  -- Donante_Receptor_ID = 18
(44, '+', 'AB'), -- Donante_Receptor_ID = 19
(45, '+', 'O'),  -- Donante_Receptor_ID = 20
(46, '-', 'A'),  -- Donante_Receptor_ID = 21
(47, '+', 'O'),  -- Donante_Receptor_ID = 22
(48, '+', 'B'),  -- Donante_Receptor_ID = 23
(49, '+', 'O'),  -- Donante_Receptor_ID = 24
(50, '+', 'A'),  -- Donante_Receptor_ID = 25
(51, '-', 'O'),  -- Donante_Receptor_ID = 26
(52, '+', 'O'),  -- Donante_Receptor_ID = 27
(53, '+', 'A'),  -- Donante_Receptor_ID = 28
(54, '+', 'B'),  -- Donante_Receptor_ID = 29
(55, '+', 'O'),  -- Donante_Receptor_ID = 30
(56, '-', 'B'),  -- Donante_Receptor_ID = 31
(57, '+', 'O'),  -- Donante_Receptor_ID = 32
(58, '+', 'A'),  -- Donante_Receptor_ID = 33
(59, '+', 'O'),  -- Donante_Receptor_ID = 34
(60, '+', 'AB'), -- Donante_Receptor_ID = 35
(61, '+', 'O'),  -- Donante_Receptor_ID = 36
(62, '+', 'A'),  -- Donante_Receptor_ID = 37
(63, '-', 'O'),  -- Donante_Receptor_ID = 38
(64, '+', 'O'),  -- Donante_Receptor_ID = 39
(65, '+', 'B'),  -- Donante_Receptor_ID = 40
(66, '+', 'O'),  -- Donante_Receptor_ID = 41
(67, '+', 'A'),  -- Donante_Receptor_ID = 42
(68, '+', 'O'),  -- Donante_Receptor_ID = 43
(69, '-', 'AB'), -- Donante_Receptor_ID = 44
(70, '+', 'O'),  -- Donante_Receptor_ID = 45
(71, '+', 'A'),  -- Donante_Receptor_ID = 46
(72, '+', 'O'),  -- Donante_Receptor_ID = 47
(73, '+', 'B'),  -- Donante_Receptor_ID = 48
(74, '-', 'O'),  -- Donante_Receptor_ID = 49
(75, '+', 'O'),  -- Donante_Receptor_ID = 50
(76, '+', 'A'),  -- Donante_Receptor_ID = 51
(77, '+', 'O'),  -- Donante_Receptor_ID = 52
(78, '+', 'B'),  -- Donante_Receptor_ID = 53
(79, '-', 'A'),  -- Donante_Receptor_ID = 54
(80, '+', 'O'),  -- Donante_Receptor_ID = 55
(81, '+', 'O'),  -- Donante_Receptor_ID = 56
(82, '+', 'A'),  -- Donante_Receptor_ID = 57
(83, '+', 'AB'), -- Donante_Receptor_ID = 58
(84, '+', 'O'),  -- Donante_Receptor_ID = 59
(85, '-', 'O'),  -- Donante_Receptor_ID = 60
(86, '+', 'O'),  -- Donante_Receptor_ID = 61
(87, '+', 'A'),  -- Donante_Receptor_ID = 62
(88, '+', 'O'),  -- Donante_Receptor_ID = 63
(89, '+', 'B'),  -- Donante_Receptor_ID = 64
(90, '+', 'O'),  -- Donante_Receptor_ID = 65
(91, '-', 'A'),  -- Donante_Receptor_ID = 66
(92, '+', 'O'),  -- Donante_Receptor_ID = 67
(93, '+', 'A'),  -- Donante_Receptor_ID = 68
(94, '+', 'O'),  -- Donante_Receptor_ID = 69
(95, '+', 'B'),  -- Donante_Receptor_ID = 70
(96, '-', 'O'),  -- Donante_Receptor_ID = 71
(97, '+', 'O'),  -- Donante_Receptor_ID = 72
(98, '+', 'A'),  -- Donante_Receptor_ID = 73
(99, '+', 'O'),  -- Donante_Receptor_ID = 74
(100, '+', 'AB'),-- Donante_Receptor_ID = 75
(101, '+', 'O'), -- Donante_Receptor_ID = 76
(102, '+', 'A'), -- Donante_Receptor_ID = 77
(103, '-', 'B'), -- Donante_Receptor_ID = 78
(104, '+', 'O'), -- Donante_Receptor_ID = 79
(105, '+', 'A'), -- Donante_Receptor_ID = 80
(106, '+', 'O'), -- Donante_Receptor_ID = 81
(107, '+', 'B'), -- Donante_Receptor_ID = 82
(108, '-', 'O'), -- Donante_Receptor_ID = 83
(109, '+', 'O'), -- Donante_Receptor_ID = 84
(110, '+', 'A'), -- Donante_Receptor_ID = 85
(111, '+', 'O'), -- Donante_Receptor_ID = 86
(112, '+', 'A'), -- Donante_Receptor_ID = 87
(113, '+', 'O'), -- Donante_Receptor_ID = 88
(114, '-', 'A'), -- Donante_Receptor_ID = 89
(115, '+', 'O'), -- Donante_Receptor_ID = 90
(116, '+', 'O'), -- Donante_Receptor_ID = 91
(117, '+', 'A'), -- Donante_Receptor_ID = 92
(118, '+', 'B'), -- Donante_Receptor_ID = 93
(119, '-', 'O'), -- Donante_Receptor_ID = 94
(120, '+', 'O'), -- Donante_Receptor_ID = 95
(121, '+', 'A'), -- Donante_Receptor_ID = 96
(122, '+', 'AB'),-- Donante_Receptor_ID = 97
(123, '+', 'O'), -- Donante_Receptor_ID = 98
(124, '-', 'A'), -- Donante_Receptor_ID = 99
(125, '+', 'O'); -- Donante_Receptor_ID = 100
GO

/* =========================================================================
   14. CHECKEO (135 registros - Evaluaciones pre-donación con Peso y Altura)
   ========================================================================= */
INSERT INTO Checkeo (Donante_ID, Altura, Fecha, Peso) VALUES
(1, 1.75, '2024-01-10', 76.50), (2, 1.63, '2024-01-10', 61.00), (3, 1.78, '2024-01-11', 80.20),
(4, 1.65, '2024-01-11', 64.00), (5, 1.72, '2024-01-12', 73.40), (6, 1.60, '2024-01-12', 58.50),
(7, 1.76, '2024-01-13', 79.00), (8, 1.62, '2024-01-13', 60.00), (9, 1.70, '2024-01-14', 71.80),
(10, 1.66, '2024-01-14', 63.20), (11, 1.74, '2024-01-15', 74.00), (12, 1.61, '2024-01-15', 57.50),
(13, 1.79, '2024-01-16', 82.00), (14, 1.64, '2024-01-16', 62.30), (15, 1.73, '2024-01-17', 75.10),
(16, 1.67, '2024-01-17', 65.00), (17, 1.80, '2024-01-18', 84.50), (18, 1.59, '2024-01-18', 56.00),
(19, 1.71, '2024-01-19', 70.20), (20, 1.65, '2024-01-19', 61.80), (21, 1.77, '2024-01-20', 78.40),
(22, 1.62, '2024-01-20', 59.00), (23, 1.75, '2024-01-21', 77.00), (24, 1.68, '2024-01-21', 66.50),
(25, 1.72, '2024-01-22', 72.00), (26, 1.60, '2024-01-22', 58.00), (27, 1.76, '2024-01-23', 81.30),
(28, 1.63, '2024-01-23', 60.50), (29, 1.74, '2024-01-24', 75.00), (30, 1.61, '2024-01-24', 57.20),
(31, 1.78, '2024-02-01', 79.80), (32, 1.64, '2024-02-01', 63.00), (33, 1.70, '2024-02-02', 69.50),
(34, 1.66, '2024-02-02', 62.00), (35, 1.75, '2024-02-03', 76.00), (36, 1.58, '2024-02-03', 55.40),
(37, 1.81, '2024-02-04', 85.00), (38, 1.65, '2024-02-04', 64.20), (39, 1.73, '2024-02-05', 74.60),
(40, 1.62, '2024-02-05', 59.80), (41, 1.76, '2024-02-06', 77.50), (42, 1.60, '2024-02-06', 58.10),
(43, 1.69, '2024-02-07', 68.00), (44, 1.63, '2024-02-07', 61.40), (45, 1.74, '2024-02-08', 73.90),
(46, 1.67, '2024-02-08', 65.20), (47, 1.71, '2024-02-09', 71.00), (48, 1.61, '2024-02-09', 56.80),
(49, 1.77, '2024-02-10', 80.00), (50, 1.64, '2024-02-10', 62.50), (51, 1.75, '2024-02-11', 76.20),
(52, 1.62, '2024-02-11', 59.30), (53, 1.78, '2024-02-12', 81.00), (54, 1.65, '2024-02-12', 63.70),
(55, 1.72, '2024-02-13', 72.80), (56, 1.60, '2024-02-13', 57.90), (57, 1.76, '2024-02-14', 78.10),
(58, 1.63, '2024-02-14', 60.40), (59, 1.74, '2024-02-15', 75.50), (60, 1.61, '2024-02-15', 58.60),
(61, 1.70, '2024-03-01', 70.00), (62, 1.66, '2024-03-01', 64.00), (63, 1.73, '2024-03-02', 74.20),
(64, 1.62, '2024-03-02', 59.50), (65, 1.79, '2024-03-03', 83.00), (66, 1.59, '2024-03-03', 55.80),
(67, 1.75, '2024-03-04', 76.90), (68, 1.64, '2024-03-04', 61.70), (69, 1.77, '2024-03-05', 79.30),
(70, 1.63, '2024-03-05', 60.20), (71, 1.71, '2024-03-06', 71.50), (72, 1.65, '2024-03-06', 63.10),
(73, 1.74, '2024-03-07', 75.00), (74, 1.60, '2024-03-07', 57.40), (75, 1.76, '2024-03-08', 78.60),
(76, 1.62, '2024-03-08', 59.10), (77, 1.78, '2024-03-09', 80.50), (78, 1.67, '2024-03-09', 65.80),
(79, 1.72, '2024-03-10', 73.00), (80, 1.61, '2024-03-10', 58.20), (81, 1.75, '2024-03-11', 74.80),
(82, 1.64, '2024-03-11', 62.00), (83, 1.80, '2024-03-12', 84.00), (84, 1.66, '2024-03-12', 63.50),
(85, 1.73, '2024-03-13', 73.70), (86, 1.60, '2024-03-13', 57.00), (87, 1.76, '2024-03-14', 77.90),
(88, 1.63, '2024-03-14', 60.80), (89, 1.71, '2024-03-15', 70.60), (90, 1.65, '2024-03-15', 62.90),
(91, 1.74, '2024-03-16', 74.10), (92, 1.62, '2024-03-16', 58.40), (93, 1.69, '2024-03-17', 68.50),
(94, 1.58, '2024-03-17', 54.00), (95, 1.72, '2024-03-18', 71.20), (96, 1.61, '2024-03-18', 56.50),
(97, 1.75, '2024-03-19', 76.00), (98, 1.60, '2024-03-19', 57.80), (99, 1.70, '2024-03-20', 69.00),
(100, 1.63, '2024-03-20', 60.00),
-- 35 Segundos chequeos de donantes habituales meses después (2024-07 y 2024-08)
(1, 1.75, '2024-07-10', 77.00), (2, 1.63, '2024-07-10', 61.50), (3, 1.78, '2024-07-11', 80.00),
(4, 1.65, '2024-07-11', 64.20), (5, 1.72, '2024-07-12', 73.00), (6, 1.60, '2024-07-12', 59.00),
(7, 1.76, '2024-07-13', 78.50), (8, 1.62, '2024-07-13', 60.30), (9, 1.70, '2024-07-14', 72.00),
(10, 1.66, '2024-07-14', 63.00), (11, 1.74, '2024-07-15', 74.50), (12, 1.61, '2024-07-15', 58.00),
(13, 1.79, '2024-07-16', 81.80), (14, 1.64, '2024-07-16', 62.00), (15, 1.73, '2024-07-17', 75.50),
(16, 1.67, '2024-07-17', 65.30), (17, 1.80, '2024-07-18', 84.00), (18, 1.59, '2024-07-18', 56.50),
(19, 1.71, '2024-07-19', 70.50), (20, 1.65, '2024-07-19', 62.00), (21, 1.77, '2024-08-01', 78.00),
(22, 1.62, '2024-08-01', 59.40), (23, 1.75, '2024-08-02', 76.80), (24, 1.68, '2024-08-02', 66.00),
(25, 1.72, '2024-08-03', 72.40), (26, 1.60, '2024-08-03', 58.30), (27, 1.76, '2024-08-04', 81.00),
(28, 1.63, '2024-08-04', 60.80), (29, 1.74, '2024-08-05', 75.20), (30, 1.61, '2024-08-05', 57.50),
(31, 1.78, '2024-08-06', 80.10), (32, 1.64, '2024-08-06', 63.40), (33, 1.70, '2024-08-07', 70.00),
(34, 1.66, '2024-08-07', 62.50), (35, 1.75, '2024-08-08', 76.30);
GO

/* =========================================================================
   15. CHECKEO_ENFERMEDAD (35 registros - Condiciones detectadas en algunos chequeos)
   ========================================================================= */
INSERT INTO CheckeoEnfermedad (Checkeo_ID, Enfermedad_ID) VALUES
(91, 5),  -- Resfrío común
(92, 6),  -- Tatuaje reciente
(93, 10), -- Hipertensión controlada
(93, 14), -- Además presentó anemia leve en el mismo chequeo
(94, 14), -- Anemia ferropénica
(95, 1),  -- Chagas positivo
(96, 8),  -- Infección dental
(97, 11), -- Diabetes tipo 1
(98, 9),  -- Embarazo / Lactancia
(99, 13), -- Cardiopatía
(99, 10), -- Hipertensión asociada
(100, 14),-- Anemia
(121, 5), -- En su segundo chequeo tuvo resfrío temporal
(122, 8), -- En su segundo chequeo estaba tomando antibióticos dentales
(123, 6), -- Tatuaje reciente
(124, 14),-- Hemoglobina baja temporal
(125, 5), -- Resfrío común
(126, 7), -- Cirugía menor reciente
(127, 10),-- Hipertensión controlada
(128, 5), -- Estado gripal
(129, 8), -- Tratamiento dental
(130, 14),-- Anemia leve
(131, 6), -- Piercing reciente
(132, 5), -- Resfrío
(133, 7), -- Cirugía menor
(134, 9), -- Lactancia
(135, 5), -- Resfrío
(85, 10), -- Hipertensión controlada
(86, 5),  -- Resfrío
(87, 6),  -- Tatuaje
(88, 14), -- Anemia
(89, 8),  -- Infección dental
(90, 7),  -- Cirugía menor
(84, 10), -- Hipertensión controlada
(83, 10); -- Hipertensión controlada
GO

/* =========================================================================
   16. LUGAR_EXTRACCION (18 registros - EXCLUSIVAMENTE EN TARIJA)
   ========================================================================= */
INSERT INTO LugarExtraccion (Direccion_ID, Tipo) VALUES
(2, 'Sede Fija Banco de Sangre Departamental'),       -- LugarExtraccion_ID = 1
(1, 'Unidad Intrahospitalaria HRSJD'),                -- LugarExtraccion_ID = 2
(3, 'Unidad Intrahospitalaria Hospital Obrero CNS'),  -- LugarExtraccion_ID = 3
(4, 'Carpa de Campana Movil Plaza Luis de Fuentes'),  -- LugarExtraccion_ID = 4
(5, 'Punto de Colecta Universitaria Campus El Tejar'),-- LugarExtraccion_ID = 5
(6, 'Unidad Movil Hemocentro Plaza Principal'),       -- LugarExtraccion_ID = 6
(7, 'Carpa de Campana Movil Parque Tematico'),        -- LugarExtraccion_ID = 7
(8, 'Carpa de Campana Movil Parque Bolivar'),         -- LugarExtraccion_ID = 8
(9, 'Punto de Colecta Universitaria UCB Tarija'),     -- LugarExtraccion_ID = 9
(13, 'Campana Barrial Centro de Salud Senac'),        -- LugarExtraccion_ID = 10
(14, 'Carpa de Campana Movil Mercado Campesino'),     -- LugarExtraccion_ID = 11
(15, 'Campana Universitaria Coliseo Juan XXIII'),     -- LugarExtraccion_ID = 12
(16, 'Carpa de Campana Movil Plazuela San Roque'),    -- LugarExtraccion_ID = 13
(17, 'Campana Parroquial Barrio Fatima'),             -- LugarExtraccion_ID = 14
(18, 'Carpa de Campana Movil Plazuela Sucre'),        -- LugarExtraccion_ID = 15
(20, 'Punto de Colecta Terminal de Buses Tarija'),    -- LugarExtraccion_ID = 16
(23, 'Campana Deportiva Coliseo Garcia Agreda'),      -- LugarExtraccion_ID = 17
(24, 'Carpa de Campana Movil Loma de San Juan');      -- LugarExtraccion_ID = 18
GO

/* =========================================================================
   17. EXTRACCION (110 registros: Extraccion_ID 1 al 110)
       Realizadas por Personal activo en lugares de Tarija a donantes aptos.
   ========================================================================= */
INSERT INTO Extraccion (Personal_ID, Donante_ID, LugarExtraccion_ID, Fecha, Metodo, VolumenTotal_ML) VALUES
-- Primeras 55 extracciones (Serán fraccionadas en Glóbulos Rojos, Plasma y Plaquetas)
(5, 1, 1, '2024-01-10 09:00:00', 'Punzon Venoso Sangre Total', 450.00),
(9, 2, 1, '2024-01-10 09:30:00', 'Punzon Venoso Sangre Total', 450.00),
(13, 3, 2, '2024-01-11 08:45:00', 'Punzon Venoso Sangre Total', 450.00),
(16, 4, 2, '2024-01-11 09:15:00', 'Punzon Venoso Sangre Total', 450.00),
(22, 5, 4, '2024-01-12 10:00:00', 'Punzon Venoso Sangre Total', 450.00),
(26, 6, 4, '2024-01-12 10:30:00', 'Punzon Venoso Sangre Total', 450.00),
(30, 7, 5, '2024-01-13 09:00:00', 'Punzon Venoso Sangre Total', 450.00),
(4, 8, 5, '2024-01-13 09:40:00', 'Punzon Venoso Sangre Total', 450.00),
(10, 9, 6, '2024-01-14 10:15:00', 'Punzon Venoso Sangre Total', 450.00),
(14, 10, 6, '2024-01-14 11:00:00', 'Punzon Venoso Sangre Total', 450.00),
(20, 11, 1, '2024-01-15 08:30:00', 'Punzon Venoso Sangre Total', 450.00),
(24, 12, 1, '2024-01-15 09:10:00', 'Punzon Venoso Sangre Total', 450.00),
(27, 13, 7, '2024-01-16 09:45:00', 'Punzon Venoso Sangre Total', 450.00),
(5, 14, 7, '2024-01-16 10:20:00', 'Punzon Venoso Sangre Total', 450.00),
(9, 15, 8, '2024-01-17 08:50:00', 'Punzon Venoso Sangre Total', 450.00),
(13, 16, 8, '2024-01-17 09:30:00', 'Punzon Venoso Sangre Total', 450.00),
(16, 17, 9, '2024-01-18 10:00:00', 'Punzon Venoso Sangre Total', 450.00),
(22, 18, 9, '2024-01-18 10:40:00', 'Punzon Venoso Sangre Total', 450.00),
(26, 19, 1, '2024-01-19 08:20:00', 'Punzon Venoso Sangre Total', 450.00),
(30, 20, 1, '2024-01-19 09:05:00', 'Punzon Venoso Sangre Total', 450.00),
(4, 21, 10, '2024-01-20 09:30:00', 'Punzon Venoso Sangre Total', 450.00),
(10, 22, 10, '2024-01-20 10:15:00', 'Punzon Venoso Sangre Total', 450.00),
(14, 23, 11, '2024-01-21 08:40:00', 'Punzon Venoso Sangre Total', 450.00),
(20, 24, 11, '2024-01-21 09:20:00', 'Punzon Venoso Sangre Total', 450.00),
(24, 25, 12, '2024-01-22 10:00:00', 'Punzon Venoso Sangre Total', 450.00),
(27, 26, 12, '2024-01-22 10:45:00', 'Punzon Venoso Sangre Total', 450.00),
(5, 27, 1, '2024-01-23 08:30:00', 'Punzon Venoso Sangre Total', 450.00),
(9, 28, 1, '2024-01-23 09:15:00', 'Punzon Venoso Sangre Total', 450.00),
(13, 29, 3, '2024-01-24 09:50:00', 'Punzon Venoso Sangre Total', 450.00),
(16, 30, 3, '2024-01-24 10:30:00', 'Punzon Venoso Sangre Total', 450.00),
(22, 31, 4, '2024-02-01 08:45:00', 'Punzon Venoso Sangre Total', 450.00),
(26, 32, 4, '2024-02-01 09:25:00', 'Punzon Venoso Sangre Total', 450.00),
(30, 33, 5, '2024-02-02 10:10:00', 'Punzon Venoso Sangre Total', 450.00),
(4, 34, 5, '2024-02-02 10:50:00', 'Punzon Venoso Sangre Total', 450.00),
(10, 35, 13, '2024-02-03 08:30:00', 'Punzon Venoso Sangre Total', 450.00),
(14, 36, 13, '2024-02-03 09:15:00', 'Punzon Venoso Sangre Total', 450.00),
(20, 37, 14, '2024-02-04 09:45:00', 'Punzon Venoso Sangre Total', 450.00),
(24, 38, 14, '2024-02-04 10:30:00', 'Punzon Venoso Sangre Total', 450.00),
(27, 39, 1, '2024-02-05 08:20:00', 'Punzon Venoso Sangre Total', 450.00),
(5, 40, 1, '2024-02-05 09:00:00', 'Punzon Venoso Sangre Total', 450.00),
(9, 41, 15, '2024-02-06 09:40:00', 'Punzon Venoso Sangre Total', 450.00),
(13, 42, 15, '2024-02-06 10:20:00', 'Punzon Venoso Sangre Total', 450.00),
(16, 43, 16, '2024-02-07 08:50:00', 'Punzon Venoso Sangre Total', 450.00),
(22, 44, 16, '2024-02-07 09:30:00', 'Punzon Venoso Sangre Total', 450.00),
(26, 45, 17, '2024-02-08 10:05:00', 'Punzon Venoso Sangre Total', 450.00),
(30, 46, 17, '2024-02-08 10:45:00', 'Punzon Venoso Sangre Total', 450.00),
(4, 47, 18, '2024-02-09 08:35:00', 'Punzon Venoso Sangre Total', 450.00),
(10, 48, 18, '2024-02-09 09:15:00', 'Punzon Venoso Sangre Total', 450.00),
(14, 49, 1, '2024-02-10 09:50:00', 'Punzon Venoso Sangre Total', 450.00),
(20, 50, 1, '2024-02-10 10:30:00', 'Punzon Venoso Sangre Total', 450.00),
(24, 51, 2, '2024-02-11 08:40:00', 'Punzon Venoso Sangre Total', 450.00),
(27, 52, 2, '2024-02-11 09:20:00', 'Punzon Venoso Sangre Total', 450.00),
(5, 53, 4, '2024-02-12 10:00:00', 'Punzon Venoso Sangre Total', 450.00),
(9, 54, 4, '2024-02-12 10:40:00', 'Punzon Venoso Sangre Total', 450.00),
(13, 55, 5, '2024-02-13 08:30:00', 'Punzon Venoso Sangre Total', 450.00),
-- Extracciones 56 a 110 (55 extracciones directas sin fraccionamiento posterior)
(16, 56, 5, '2024-02-13 09:15:00', 'Punzon Venoso Sangre Total', 450.00),
(22, 57, 6, '2024-02-14 09:45:00', 'Punzon Venoso Sangre Total', 450.00),
(26, 58, 6, '2024-02-14 10:25:00', 'Punzon Venoso Sangre Total', 450.00),
(30, 59, 1, '2024-02-15 08:30:00', 'Punzon Venoso Sangre Total', 450.00),
(4, 60, 1, '2024-02-15 09:10:00', 'Punzon Venoso Sangre Total', 450.00),
(10, 61, 7, '2024-03-01 08:45:00', 'Punzon Venoso Sangre Total', 450.00),
(14, 62, 7, '2024-03-01 09:30:00', 'Punzon Venoso Sangre Total', 450.00),
(20, 63, 8, '2024-03-02 10:05:00', 'Punzon Venoso Sangre Total', 450.00),
(24, 64, 8, '2024-03-02 10:45:00', 'Punzon Venoso Sangre Total', 450.00),
(27, 65, 9, '2024-03-03 08:30:00', 'Aferesis Automatizada', 450.00),
(5, 66, 9, '2024-03-03 09:15:00', 'Punzon Venoso Sangre Total', 450.00),
(9, 67, 1, '2024-03-04 09:50:00', 'Punzon Venoso Sangre Total', 450.00),
(13, 68, 1, '2024-03-04 10:30:00', 'Punzon Venoso Sangre Total', 450.00),
(16, 69, 2, '2024-03-05 08:40:00', 'Punzon Venoso Sangre Total', 450.00),
(22, 70, 2, '2024-03-05 09:20:00', 'Punzon Venoso Sangre Total', 450.00),
(26, 71, 3, '2024-03-06 10:00:00', 'Punzon Venoso Sangre Total', 450.00),
(30, 72, 3, '2024-03-06 10:40:00', 'Punzon Venoso Sangre Total', 450.00),
(4, 73, 4, '2024-03-07 08:30:00', 'Punzon Venoso Sangre Total', 450.00),
(10, 74, 4, '2024-03-07 09:15:00', 'Punzon Venoso Sangre Total', 450.00),
(14, 75, 5, '2024-03-08 09:45:00', 'Aferesis Automatizada', 450.00),
(20, 76, 5, '2024-03-08 10:25:00', 'Punzon Venoso Sangre Total', 450.00),
(24, 77, 1, '2024-03-09 08:30:00', 'Punzon Venoso Sangre Total', 450.00),
(27, 78, 1, '2024-03-09 09:10:00', 'Punzon Venoso Sangre Total', 450.00),
(5, 79, 10, '2024-03-10 09:50:00', 'Punzon Venoso Sangre Total', 450.00),
(9, 80, 10, '2024-03-10 10:30:00', 'Punzon Venoso Sangre Total', 450.00),
(13, 81, 11, '2024-03-11 08:40:00', 'Punzon Venoso Sangre Total', 450.00),
(16, 82, 11, '2024-03-11 09:20:00', 'Punzon Venoso Sangre Total', 450.00),
(22, 83, 12, '2024-03-12 10:00:00', 'Punzon Venoso Sangre Total', 450.00),
(26, 84, 12, '2024-03-12 10:40:00', 'Punzon Venoso Sangre Total', 450.00),
(30, 85, 1, '2024-03-13 08:30:00', 'Punzon Venoso Sangre Total', 450.00),
-- Segundas donaciones de los donantes 1 al 20 en Julio de 2024 (Extracciones 86 a 110)
(4, 1, 1, '2024-07-10 08:30:00', 'Punzon Venoso Sangre Total', 450.00),
(10, 2, 1, '2024-07-10 09:15:00', 'Punzon Venoso Sangre Total', 450.00),
(14, 3, 2, '2024-07-11 08:45:00', 'Punzon Venoso Sangre Total', 450.00),
(20, 4, 2, '2024-07-11 09:30:00', 'Punzon Venoso Sangre Total', 450.00),
(24, 5, 4, '2024-07-12 10:00:00', 'Punzon Venoso Sangre Total', 450.00),
(27, 6, 4, '2024-07-12 10:40:00', 'Punzon Venoso Sangre Total', 450.00),
(5, 7, 5, '2024-07-13 08:30:00', 'Punzon Venoso Sangre Total', 450.00),
(9, 8, 5, '2024-07-13 09:15:00', 'Punzon Venoso Sangre Total', 450.00),
(13, 9, 6, '2024-07-14 09:50:00', 'Punzon Venoso Sangre Total', 450.00),
(16, 10, 6, '2024-07-14 10:30:00', 'Punzon Venoso Sangre Total', 450.00),
(22, 11, 1, '2024-07-15 08:40:00', 'Punzon Venoso Sangre Total', 450.00),
(26, 12, 1, '2024-07-15 09:20:00', 'Punzon Venoso Sangre Total', 450.00),
(30, 13, 7, '2024-07-16 10:00:00', 'Punzon Venoso Sangre Total', 450.00),
(4, 14, 7, '2024-07-16 10:40:00', 'Punzon Venoso Sangre Total', 450.00),
(10, 15, 8, '2024-07-17 08:30:00', 'Punzon Venoso Sangre Total', 450.00),
(14, 16, 8, '2024-07-17 09:15:00', 'Punzon Venoso Sangre Total', 450.00),
(20, 17, 9, '2024-07-18 09:45:00', 'Punzon Venoso Sangre Total', 450.00),
(24, 18, 9, '2024-07-18 10:25:00', 'Punzon Venoso Sangre Total', 450.00),
(27, 19, 1, '2024-07-19 08:30:00', 'Punzon Venoso Sangre Total', 450.00),
(5, 20, 1, '2024-07-19 09:10:00', 'Punzon Venoso Sangre Total', 450.00),
(9, 36, 13, '2024-08-10 08:45:00', 'Punzon Venoso Sangre Total', 450.00),
(13, 37, 14, '2024-08-10 09:30:00', 'Punzon Venoso Sangre Total', 450.00),
(16, 38, 15, '2024-08-11 10:00:00', 'Punzon Venoso Sangre Total', 450.00),
(22, 39, 16, '2024-08-11 10:40:00', 'Punzon Venoso Sangre Total', 450.00),
(26, 40, 18, '2024-08-12 09:00:00', 'Punzon Venoso Sangre Total', 450.00);
GO

/* =========================================================================
   18. UNIDAD_EXTRAIDA (275 registros en total: Unidad_ID 1 al 275)
       - Unidades 1 a 55: Bolsas madre de Sangre Total (UnidadOrigen_ID = NULL, Estado = 0 porque fueron FRACCIONADAS).
       - Unidades 56 a 85: Bolsas de Sangre Total sin fraccionar YA UTILIZADAS en transfusiones (UnidadOrigen_ID = NULL, Estado = 0).
       - Unidades 86 a 110: Bolsas de Sangre Total sin fraccionar DISPONIBLES en stock (UnidadOrigen_ID = NULL, Estado = 1).
       - Unidades 111 a 200: 90 Hemocomponentes derivados (CGR, PFC, Plaquetas) YA UTILIZADOS en transfusiones (UnidadOrigen_ID = 1..30, Estado = 0).
       - Unidades 201 a 275: 75 Hemocomponentes derivados (CGR, PFC, Plaquetas) DISPONIBLES en stock (UnidadOrigen_ID = 31..55, Estado = 1).
   ========================================================================= */
INSERT INTO UnidadExtraida (Extraccion_ID, UnidadOrigen_ID, TipoComponente_ID, VolumenML, FechaObtencion, Estado) VALUES
-- 1 a 55: Bolsas Madre de Sangre Total que pasaron a Fraccionamiento (Estado = 0)
(1, NULL, 1, 450.00, '2024-01-10 09:15:00', 0),
(2, NULL, 1, 450.00, '2024-01-10 09:45:00', 0),
(3, NULL, 1, 450.00, '2024-01-11 09:00:00', 0),
(4, NULL, 1, 450.00, '2024-01-11 09:30:00', 0),
(5, NULL, 1, 450.00, '2024-01-12 10:15:00', 0),
(6, NULL, 1, 450.00, '2024-01-12 10:45:00', 0),
(7, NULL, 1, 450.00, '2024-01-13 09:15:00', 0),
(8, NULL, 1, 450.00, '2024-01-13 09:55:00', 0),
(9, NULL, 1, 450.00, '2024-01-14 10:30:00', 0),
(10, NULL, 1, 450.00, '2024-01-14 11:15:00', 0),
(11, NULL, 1, 450.00, '2024-01-15 08:45:00', 0),
(12, NULL, 1, 450.00, '2024-01-15 09:25:00', 0),
(13, NULL, 1, 450.00, '2024-01-16 10:00:00', 0),
(14, NULL, 1, 450.00, '2024-01-16 10:35:00', 0),
(15, NULL, 1, 450.00, '2024-01-17 09:05:00', 0),
(16, NULL, 1, 450.00, '2024-01-17 09:45:00', 0),
(17, NULL, 1, 450.00, '2024-01-18 10:15:00', 0),
(18, NULL, 1, 450.00, '2024-01-18 10:55:00', 0),
(19, NULL, 1, 450.00, '2024-01-19 08:35:00', 0),
(20, NULL, 1, 450.00, '2024-01-19 09:20:00', 0),
(21, NULL, 1, 450.00, '2024-01-20 09:45:00', 0),
(22, NULL, 1, 450.00, '2024-01-20 10:30:00', 0),
(23, NULL, 1, 450.00, '2024-01-21 08:55:00', 0),
(24, NULL, 1, 450.00, '2024-01-21 09:35:00', 0),
(25, NULL, 1, 450.00, '2024-01-22 10:15:00', 0),
(26, NULL, 1, 450.00, '2024-01-22 11:00:00', 0),
(27, NULL, 1, 450.00, '2024-01-23 08:45:00', 0),
(28, NULL, 1, 450.00, '2024-01-23 09:30:00', 0),
(29, NULL, 1, 450.00, '2024-01-24 10:05:00', 0),
(30, NULL, 1, 450.00, '2024-01-24 10:45:00', 0),
(31, NULL, 1, 450.00, '2024-02-01 09:00:00', 0),
(32, NULL, 1, 450.00, '2024-02-01 09:40:00', 0),
(33, NULL, 1, 450.00, '2024-02-02 10:25:00', 0),
(34, NULL, 1, 450.00, '2024-02-02 11:05:00', 0),
(35, NULL, 1, 450.00, '2024-02-03 08:45:00', 0),
(36, NULL, 1, 450.00, '2024-02-03 09:30:00', 0),
(37, NULL, 1, 450.00, '2024-02-04 10:00:00', 0),
(38, NULL, 1, 450.00, '2024-02-04 10:45:00', 0),
(39, NULL, 1, 450.00, '2024-02-05 08:35:00', 0),
(40, NULL, 1, 450.00, '2024-02-05 09:15:00', 0),
(41, NULL, 1, 450.00, '2024-02-06 09:55:00', 0),
(42, NULL, 1, 450.00, '2024-02-06 10:35:00', 0),
(43, NULL, 1, 450.00, '2024-02-07 09:05:00', 0),
(44, NULL, 1, 450.00, '2024-02-07 09:45:00', 0),
(45, NULL, 1, 450.00, '2024-02-08 10:20:00', 0),
(46, NULL, 1, 450.00, '2024-02-08 11:00:00', 0),
(47, NULL, 1, 450.00, '2024-02-09 08:50:00', 0),
(48, NULL, 1, 450.00, '2024-02-09 09:30:00', 0),
(49, NULL, 1, 450.00, '2024-02-10 10:05:00', 0),
(50, NULL, 1, 450.00, '2024-02-10 10:45:00', 0),
(51, NULL, 1, 450.00, '2024-02-11 08:55:00', 0),
(52, NULL, 1, 450.00, '2024-02-11 09:35:00', 0),
(53, NULL, 1, 450.00, '2024-02-12 10:15:00', 0),
(54, NULL, 1, 450.00, '2024-02-12 10:55:00', 0),
(55, NULL, 1, 450.00, '2024-02-13 08:45:00', 0),
-- 56 a 85: Bolsas de Sangre Total sin fraccionar que YA FUERON TRANSFUNDIDAS (Estado = 0)
(56, NULL, 1, 450.00, '2024-02-13 09:30:00', 0),
(57, NULL, 1, 450.00, '2024-02-14 10:00:00', 0),
(58, NULL, 1, 450.00, '2024-02-14 10:40:00', 0),
(59, NULL, 1, 450.00, '2024-02-15 08:45:00', 0),
(60, NULL, 1, 450.00, '2024-02-15 09:25:00', 0),
(61, NULL, 1, 450.00, '2024-03-01 09:00:00', 0),
(62, NULL, 1, 450.00, '2024-03-01 09:45:00', 0),
(63, NULL, 1, 450.00, '2024-03-02 10:20:00', 0),
(64, NULL, 1, 450.00, '2024-03-02 11:00:00', 0),
(65, NULL, 2, 450.00, '2024-03-03 08:50:00', 0),
(66, NULL, 1, 450.00, '2024-03-03 09:30:00', 0),
(67, NULL, 1, 450.00, '2024-03-04 10:05:00', 0),
(68, NULL, 1, 450.00, '2024-03-04 10:45:00', 0),
(69, NULL, 1, 450.00, '2024-03-05 08:55:00', 0),
(70, NULL, 1, 450.00, '2024-03-05 09:35:00', 0),
(71, NULL, 1, 450.00, '2024-03-06 10:15:00', 0),
(72, NULL, 1, 450.00, '2024-03-06 10:55:00', 0),
(73, NULL, 1, 450.00, '2024-03-07 08:45:00', 0),
(74, NULL, 1, 450.00, '2024-03-07 09:30:00', 0),
(75, NULL, 4, 450.00, '2024-03-08 10:05:00', 0),
(76, NULL, 1, 450.00, '2024-03-08 10:40:00', 0),
(77, NULL, 1, 450.00, '2024-03-09 08:45:00', 0),
(78, NULL, 1, 450.00, '2024-03-09 09:25:00', 0),
(79, NULL, 1, 450.00, '2024-03-10 10:05:00', 0),
(80, NULL, 1, 450.00, '2024-03-10 10:45:00', 0),
(81, NULL, 1, 450.00, '2024-03-11 08:55:00', 0),
(82, NULL, 1, 450.00, '2024-03-11 09:35:00', 0),
(83, NULL, 1, 450.00, '2024-03-12 10:15:00', 0),
(84, NULL, 1, 450.00, '2024-03-12 10:55:00', 0),
(85, NULL, 1, 450.00, '2024-03-13 08:45:00', 0),
-- 86 a 110: Bolsas de Sangre Total sin fraccionar DISPONIBLES en refrigeración (Estado = 1)
(86, NULL, 1, 450.00, '2024-07-10 08:45:00', 1),
(87, NULL, 1, 450.00, '2024-07-10 09:30:00', 1),
(88, NULL, 1, 450.00, '2024-07-11 09:00:00', 1),
(89, NULL, 1, 450.00, '2024-07-11 09:45:00', 1),
(90, NULL, 1, 450.00, '2024-07-12 10:15:00', 1),
(91, NULL, 1, 450.00, '2024-07-12 10:55:00', 1),
(92, NULL, 1, 450.00, '2024-07-13 08:45:00', 1),
(93, NULL, 1, 450.00, '2024-07-13 09:30:00', 1),
(94, NULL, 1, 450.00, '2024-07-14 10:05:00', 1),
(95, NULL, 1, 450.00, '2024-07-14 10:45:00', 1),
(96, NULL, 1, 450.00, '2024-07-15 08:55:00', 1),
(97, NULL, 1, 450.00, '2024-07-15 09:35:00', 1),
(98, NULL, 1, 450.00, '2024-07-16 10:15:00', 1),
(99, NULL, 1, 450.00, '2024-07-16 10:55:00', 1),
(100, NULL, 1, 450.00, '2024-07-17 08:45:00', 1),
(101, NULL, 1, 450.00, '2024-07-17 09:30:00', 1),
(102, NULL, 1, 450.00, '2024-07-18 10:00:00', 1),
(103, NULL, 1, 450.00, '2024-07-18 10:40:00', 1),
(104, NULL, 1, 450.00, '2024-07-19 08:45:00', 1),
(105, NULL, 1, 450.00, '2024-07-19 09:25:00', 1),
(106, NULL, 1, 450.00, '2024-08-10 09:00:00', 1),
(107, NULL, 1, 450.00, '2024-08-10 09:45:00', 1),
(108, NULL, 1, 450.00, '2024-08-11 10:15:00', 1),
(109, NULL, 1, 450.00, '2024-08-11 10:55:00', 1),
(110, NULL, 1, 450.00, '2024-08-12 09:15:00', 1),
-- 111 a 200: 90 Hemocomponentes Fraccionados (de Unidades Madre 1 a 30) YA TRANSFUNDIDOS (Estado = 0)
(1, 1, 2, 250.00, '2024-01-10 14:00:00', 0),
(1, 1, 3, 150.00, '2024-01-10 14:05:00', 0),
(1, 1, 4, 50.00, '2024-01-10 14:10:00', 0),
(2, 2, 2, 250.00, '2024-01-10 14:30:00', 0),
(2, 2, 3, 150.00, '2024-01-10 14:35:00', 0),
(2, 2, 4, 50.00, '2024-01-10 14:40:00', 0),
(3, 3, 2, 250.00, '2024-01-11 14:00:00', 0),
(3, 3, 3, 150.00, '2024-01-11 14:05:00', 0),
(3, 3, 4, 50.00, '2024-01-11 14:10:00', 0),
(4, 4, 2, 250.00, '2024-01-11 14:30:00', 0),
(4, 4, 3, 150.00, '2024-01-11 14:35:00', 0),
(4, 4, 4, 50.00, '2024-01-11 14:40:00', 0),
(5, 5, 2, 250.00, '2024-01-12 15:00:00', 0),
(5, 5, 3, 150.00, '2024-01-12 15:05:00', 0),
(5, 5, 4, 50.00, '2024-01-12 15:10:00', 0),
(6, 6, 2, 250.00, '2024-01-12 15:30:00', 0),
(6, 6, 3, 150.00, '2024-01-12 15:35:00', 0),
(6, 6, 4, 50.00, '2024-01-12 15:40:00', 0),
(7, 7, 2, 250.00, '2024-01-13 14:00:00', 0),
(7, 7, 3, 150.00, '2024-01-13 14:05:00', 0),
(7, 7, 4, 50.00, '2024-01-13 14:10:00', 0),
(8, 8, 2, 250.00, '2024-01-13 14:30:00', 0),
(8, 8, 3, 150.00, '2024-01-13 14:35:00', 0),
(8, 8, 4, 50.00, '2024-01-13 14:40:00', 0),
(9, 9, 2, 250.00, '2024-01-14 15:00:00', 0),
(9, 9, 3, 150.00, '2024-01-14 15:05:00', 0),
(9, 9, 4, 50.00, '2024-01-14 15:10:00', 0),
(10, 10, 2, 250.00, '2024-01-14 15:30:00', 0),
(10, 10, 3, 150.00, '2024-01-14 15:35:00', 0),
(10, 10, 4, 50.00, '2024-01-14 15:40:00', 0),
(11, 11, 2, 250.00, '2024-01-15 14:00:00', 0),
(11, 11, 3, 150.00, '2024-01-15 14:05:00', 0),
(11, 11, 4, 50.00, '2024-01-15 14:10:00', 0),
(12, 12, 2, 250.00, '2024-01-15 14:30:00', 0),
(12, 12, 3, 150.00, '2024-01-15 14:35:00', 0),
(12, 12, 4, 50.00, '2024-01-15 14:40:00', 0),
(13, 13, 2, 250.00, '2024-01-16 14:00:00', 0),
(13, 13, 3, 150.00, '2024-01-16 14:05:00', 0),
(13, 13, 4, 50.00, '2024-01-16 14:10:00', 0),
(14, 14, 2, 250.00, '2024-01-16 14:30:00', 0),
(14, 14, 3, 150.00, '2024-01-16 14:35:00', 0),
(14, 14, 4, 50.00, '2024-01-16 14:40:00', 0),
(15, 15, 2, 250.00, '2024-01-17 14:00:00', 0),
(15, 15, 3, 150.00, '2024-01-17 14:05:00', 0),
(15, 15, 4, 50.00, '2024-01-17 14:10:00', 0),
(16, 16, 2, 250.00, '2024-01-17 14:30:00', 0),
(16, 16, 3, 150.00, '2024-01-17 14:35:00', 0),
(16, 16, 4, 50.00, '2024-01-17 14:40:00', 0),
(17, 17, 2, 250.00, '2024-01-18 15:00:00', 0),
(17, 17, 3, 150.00, '2024-01-18 15:05:00', 0),
(17, 17, 4, 50.00, '2024-01-18 15:10:00', 0),
(18, 18, 2, 250.00, '2024-01-18 15:30:00', 0),
(18, 18, 3, 150.00, '2024-01-18 15:35:00', 0),
(18, 18, 4, 50.00, '2024-01-18 15:40:00', 0),
(19, 19, 2, 250.00, '2024-01-19 14:00:00', 0),
(19, 19, 3, 150.00, '2024-01-19 14:05:00', 0),
(19, 19, 4, 50.00, '2024-01-19 14:10:00', 0),
(20, 20, 2, 250.00, '2024-01-19 14:30:00', 0),
(20, 20, 3, 150.00, '2024-01-19 14:35:00', 0),
(20, 20, 4, 50.00, '2024-01-19 14:40:00', 0),
(21, 21, 2, 250.00, '2024-01-20 14:00:00', 0),
(21, 21, 3, 150.00, '2024-01-20 14:05:00', 0),
(21, 21, 4, 50.00, '2024-01-20 14:10:00', 0),
(22, 22, 2, 250.00, '2024-01-20 14:30:00', 0),
(22, 22, 3, 150.00, '2024-01-20 14:35:00', 0),
(22, 22, 4, 50.00, '2024-01-20 14:40:00', 0),
(23, 23, 2, 250.00, '2024-01-21 14:00:00', 0),
(23, 23, 3, 150.00, '2024-01-21 14:05:00', 0),
(23, 23, 4, 50.00, '2024-01-21 14:10:00', 0),
(24, 24, 2, 250.00, '2024-01-21 14:30:00', 0),
(24, 24, 3, 150.00, '2024-01-21 14:35:00', 0),
(24, 24, 4, 50.00, '2024-01-21 14:40:00', 0),
(25, 25, 2, 250.00, '2024-01-22 15:00:00', 0),
(25, 25, 3, 150.00, '2024-01-22 15:05:00', 0),
(25, 25, 4, 50.00, '2024-01-22 15:10:00', 0),
(26, 26, 2, 250.00, '2024-01-22 15:30:00', 0),
(26, 26, 3, 150.00, '2024-01-22 15:35:00', 0),
(26, 26, 4, 50.00, '2024-01-22 15:40:00', 0),
(27, 27, 2, 250.00, '2024-01-23 14:00:00', 0),
(27, 27, 3, 150.00, '2024-01-23 14:05:00', 0),
(27, 27, 4, 50.00, '2024-01-23 14:10:00', 0),
(28, 28, 2, 250.00, '2024-01-23 14:30:00', 0),
(28, 28, 3, 150.00, '2024-01-23 14:35:00', 0),
(28, 28, 4, 50.00, '2024-01-23 14:40:00', 0),
(29, 29, 2, 250.00, '2024-01-24 15:00:00', 0),
(29, 29, 3, 150.00, '2024-01-24 15:05:00', 0),
(29, 29, 4, 50.00, '2024-01-24 15:10:00', 0),
(30, 30, 2, 250.00, '2024-01-24 15:30:00', 0),
(30, 30, 3, 150.00, '2024-01-24 15:35:00', 0),
(30, 30, 4, 50.00, '2024-01-24 15:40:00', 0),
-- 201 a 275: 75 Hemocomponentes Fraccionados (de Unidades Madre 31 a 55) DISPONIBLES EN STOCK (Estado = 1)
(31, 31, 2, 250.00, '2024-02-01 14:00:00', 1),
(31, 31, 3, 150.00, '2024-02-01 14:05:00', 1),
(31, 31, 4, 50.00, '2024-02-01 14:10:00', 1),
(32, 32, 2, 250.00, '2024-02-01 14:30:00', 1),
(32, 32, 3, 150.00, '2024-02-01 14:35:00', 1),
(32, 32, 4, 50.00, '2024-02-01 14:40:00', 1),
(33, 33, 2, 250.00, '2024-02-02 15:00:00', 1),
(33, 33, 3, 150.00, '2024-02-02 15:05:00', 1),
(33, 33, 4, 50.00, '2024-02-02 15:10:00', 1),
(34, 34, 2, 250.00, '2024-02-02 15:30:00', 1),
(34, 34, 3, 150.00, '2024-02-02 15:35:00', 1),
(34, 34, 4, 50.00, '2024-02-02 15:40:00', 1),
(35, 35, 2, 250.00, '2024-02-03 14:00:00', 1),
(35, 35, 3, 150.00, '2024-02-03 14:05:00', 1),
(35, 35, 4, 50.00, '2024-02-03 14:10:00', 1),
(36, 36, 2, 250.00, '2024-02-03 14:30:00', 1),
(36, 36, 3, 150.00, '2024-02-03 14:35:00', 1),
(36, 36, 4, 50.00, '2024-02-03 14:40:00', 1),
(37, 37, 2, 250.00, '2024-02-04 15:00:00', 1),
(37, 37, 3, 150.00, '2024-02-04 15:05:00', 1),
(37, 37, 4, 50.00, '2024-02-04 15:10:00', 1),
(38, 38, 2, 250.00, '2024-02-04 15:30:00', 1),
(38, 38, 3, 150.00, '2024-02-04 15:35:00', 1),
(38, 38, 4, 50.00, '2024-02-04 15:40:00', 1),
(39, 39, 2, 250.00, '2024-02-05 14:00:00', 1),
(39, 39, 3, 150.00, '2024-02-05 14:05:00', 1),
(39, 39, 4, 50.00, '2024-02-05 14:10:00', 1),
(40, 40, 2, 250.00, '2024-02-05 14:30:00', 1),
(40, 40, 3, 150.00, '2024-02-05 14:35:00', 1),
(40, 40, 4, 50.00, '2024-02-05 14:40:00', 1),
(41, 41, 2, 250.00, '2024-02-06 15:00:00', 1),
(41, 41, 3, 150.00, '2024-02-06 15:05:00', 1),
(41, 41, 4, 50.00, '2024-02-06 15:10:00', 1),
(42, 42, 2, 250.00, '2024-02-06 15:30:00', 1),
(42, 42, 3, 150.00, '2024-02-06 15:35:00', 1),
(42, 42, 4, 50.00, '2024-02-06 15:40:00', 1),
(43, 43, 2, 250.00, '2024-02-07 14:00:00', 1),
(43, 43, 3, 150.00, '2024-02-07 14:05:00', 1),
(43, 43, 4, 50.00, '2024-02-07 14:10:00', 1),
(44, 44, 2, 250.00, '2024-02-07 14:30:00', 1),
(44, 44, 3, 150.00, '2024-02-07 14:35:00', 1),
(44, 44, 4, 50.00, '2024-02-07 14:40:00', 1),
(45, 45, 2, 250.00, '2024-02-08 15:00:00', 1),
(45, 45, 3, 150.00, '2024-02-08 15:05:00', 1),
(45, 45, 4, 50.00, '2024-02-08 15:10:00', 1),
(46, 46, 2, 250.00, '2024-02-08 15:30:00', 1),
(46, 46, 3, 150.00, '2024-02-08 15:35:00', 1),
(46, 46, 4, 50.00, '2024-02-08 15:40:00', 1),
(47, 47, 2, 250.00, '2024-02-09 14:00:00', 1),
(47, 47, 3, 150.00, '2024-02-09 14:05:00', 1),
(47, 47, 4, 50.00, '2024-02-09 14:10:00', 1),
(48, 48, 2, 250.00, '2024-02-09 14:30:00', 1),
(48, 48, 3, 150.00, '2024-02-09 14:35:00', 1),
(48, 48, 4, 50.00, '2024-02-09 14:40:00', 1),
(49, 49, 2, 250.00, '2024-02-10 15:00:00', 1),
(49, 49, 3, 150.00, '2024-02-10 15:05:00', 1),
(49, 49, 4, 50.00, '2024-02-10 15:10:00', 1),
(50, 50, 2, 250.00, '2024-02-10 15:30:00', 1),
(50, 50, 3, 150.00, '2024-02-10 15:35:00', 1),
(50, 50, 4, 50.00, '2024-02-10 15:40:00', 1),
(51, 51, 2, 250.00, '2024-02-11 14:00:00', 1),
(51, 51, 3, 150.00, '2024-02-11 14:05:00', 1),
(51, 51, 4, 50.00, '2024-02-11 14:10:00', 1),
(52, 52, 2, 250.00, '2024-02-11 14:30:00', 1),
(52, 52, 3, 150.00, '2024-02-11 14:35:00', 1),
(52, 52, 4, 50.00, '2024-02-11 14:40:00', 1),
(53, 53, 2, 250.00, '2024-02-12 15:00:00', 1),
(53, 53, 3, 150.00, '2024-02-12 15:05:00', 1),
(53, 53, 4, 50.00, '2024-02-12 15:10:00', 1),
(54, 54, 2, 250.00, '2024-02-12 15:30:00', 1),
(54, 54, 5, 150.00, '2024-02-12 15:35:00', 1),
(54, 54, 4, 50.00, '2024-02-12 15:40:00', 1),
(55, 55, 2, 250.00, '2024-02-13 14:00:00', 1),
(55, 55, 5, 150.00, '2024-02-13 14:05:00', 1),
(55, 55, 4, 50.00, '2024-02-13 14:10:00', 1);
GO

/* =========================================================================
   19. HISTORIAL_SOLICITUDES (120 registros)
       - Consume exactamente las 120 unidades utilizables con Estado = 0:
         * Unidades 56 a 85 (30 unidades de Sangre Total)
         * Unidades 111 a 200 (90 unidades de Hemocomponentes Fraccionados)
       - Incluye Pacientes puros (Donante_Receptor_ID 86 a 100) y Donantes que
         también recibieron sangre en otra fecha (Donante_Receptor_ID 1 a 45).
   ========================================================================= */
INSERT INTO HistorialSolicitudes (Paciente_ID, Unidad_ID, Direccion_ID, Fecha) VALUES
-- 30 solicitudes de unidades completas (Unidad_ID 56 al 85)
(91, 56, 1, '2024-02-16 10:00:00'),
(92, 57, 1, '2024-02-16 11:30:00'),
(93, 58, 3, '2024-02-17 09:20:00'),
(94, 59, 3, '2024-02-18 14:15:00'),
(95, 60, 10, '2024-02-19 16:40:00'),
(96, 61, 11, '2024-03-03 08:50:00'),
(97, 62, 12, '2024-03-04 12:10:00'),
(98, 63, 1, '2024-03-05 15:30:00'),
(99, 64, 1, '2024-03-06 10:25:00'),
(100, 65, 3, '2024-03-06 18:00:00'),
(86, 66, 21, '2024-03-07 09:45:00'),
(87, 67, 27, '2024-03-08 11:20:00'),
(88, 68, 28, '2024-03-09 13:50:00'),
(89, 69, 29, '2024-03-10 08:15:00'),
(90, 70, 1, '2024-03-10 17:30:00'),
-- Donantes que meses después requirieron transfusión (Donante_Receptor_ID 1 a 15)
(1, 71, 1, '2024-03-11 10:00:00'),
(2, 72, 3, '2024-03-11 14:20:00'),
(3, 73, 10, '2024-03-12 09:10:00'),
(4, 74, 11, '2024-03-12 16:45:00'),
(5, 75, 12, '2024-03-13 11:05:00'),
(6, 76, 1, '2024-03-14 08:30:00'),
(7, 77, 1, '2024-03-14 15:15:00'),
(8, 78, 3, '2024-03-15 10:40:00'),
(9, 79, 21, '2024-03-15 19:00:00'),
(10, 80, 1, '2024-03-16 09:25:00'),
(11, 81, 3, '2024-03-16 13:10:00'),
(12, 82, 10, '2024-03-17 11:50:00'),
(13, 83, 11, '2024-03-18 08:40:00'),
(14, 84, 12, '2024-03-18 17:20:00'),
(15, 85, 1, '2024-03-19 10:30:00'),
-- 90 solicitudes de hemocomponentes fraccionados (Unidad_ID 111 al 200)
(91, 111, 1, '2024-01-12 08:30:00'),
(91, 112, 1, '2024-01-12 09:00:00'),
(92, 113, 1, '2024-01-12 10:15:00'),
(93, 114, 3, '2024-01-12 11:40:00'),
(93, 115, 3, '2024-01-12 12:10:00'),
(94, 116, 10, '2024-01-13 09:20:00'),
(95, 117, 11, '2024-01-13 14:00:00'),
(96, 118, 12, '2024-01-13 16:30:00'),
(97, 119, 1, '2024-01-14 08:45:00'),
(98, 120, 1, '2024-01-14 10:50:00'),
(99, 121, 3, '2024-01-14 15:15:00'),
(100, 122, 21, '2024-01-15 09:30:00'),
(100, 123, 21, '2024-01-15 10:00:00'),
(86, 124, 1, '2024-01-15 13:45:00'),
(87, 125, 3, '2024-01-16 08:20:00'),
(88, 126, 10, '2024-01-16 11:10:00'),
(89, 127, 11, '2024-01-16 16:05:00'),
(90, 128, 12, '2024-01-17 09:40:00'),
(16, 129, 1, '2024-01-17 14:25:00'),
(17, 130, 1, '2024-01-18 08:50:00'),
(18, 131, 3, '2024-01-18 11:30:00'),
(19, 132, 27, '2024-01-18 17:00:00'),
(20, 133, 28, '2024-01-19 09:15:00'),
(21, 134, 29, '2024-01-19 13:20:00'),
(22, 135, 1, '2024-01-20 08:40:00'),
(23, 136, 1, '2024-01-20 10:55:00'),
(24, 137, 3, '2024-01-20 15:10:00'),
(25, 138, 10, '2024-01-21 09:05:00'),
(26, 139, 11, '2024-01-21 12:30:00'),
(27, 140, 12, '2024-01-21 16:45:00'),
(28, 141, 1, '2024-01-22 08:15:00'),
(29, 142, 1, '2024-01-22 11:00:00'),
(30, 143, 3, '2024-01-22 14:35:00'),
(31, 144, 21, '2024-01-23 09:50:00'),
(32, 145, 1, '2024-01-23 13:15:00'),
(33, 146, 3, '2024-01-23 17:40:00'),
(34, 147, 10, '2024-01-24 08:30:00'),
(35, 148, 11, '2024-01-24 11:20:00'),
(36, 149, 12, '2024-01-24 15:50:00'),
(37, 150, 1, '2024-01-25 09:10:00'),
(38, 151, 1, '2024-01-25 12:40:00'),
(39, 152, 3, '2024-01-25 16:15:00'),
(40, 153, 27, '2024-01-26 08:45:00'),
(41, 154, 28, '2024-01-26 11:30:00'),
(42, 155, 29, '2024-01-26 14:55:00'),
(43, 156, 30, '2024-01-27 09:20:00'),
(44, 157, 1, '2024-01-27 13:05:00'),
(45, 158, 1, '2024-01-27 17:30:00'),
(91, 159, 3, '2024-01-28 08:50:00'),
(92, 160, 10, '2024-01-28 11:15:00'),
(93, 161, 11, '2024-01-28 15:40:00'),
(94, 162, 12, '2024-01-29 09:00:00'),
(95, 163, 1, '2024-01-29 12:25:00'),
(96, 164, 1, '2024-01-29 16:50:00'),
(97, 165, 3, '2024-01-30 08:35:00'),
(98, 166, 21, '2024-01-30 11:45:00'),
(99, 167, 1, '2024-01-30 14:10:00'),
(100, 168, 3, '2024-01-31 09:30:00'),
(86, 169, 10, '2024-01-31 13:00:00'),
(87, 170, 11, '2024-01-31 16:20:00'),
(88, 171, 12, '2024-02-01 08:40:00'),
(89, 172, 1, '2024-02-01 11:10:00'),
(90, 173, 1, '2024-02-01 15:35:00'),
(1, 174, 3, '2024-02-02 09:15:00'),
(2, 175, 21, '2024-02-02 12:45:00'),
(3, 176, 1, '2024-02-02 17:00:00'),
(4, 177, 3, '2024-02-03 08:25:00'),
(5, 178, 10, '2024-02-03 11:50:00'),
(6, 179, 11, '2024-02-03 14:30:00'),
(7, 180, 12, '2024-02-04 09:05:00'),
(8, 181, 1, '2024-02-04 12:20:00'),
(9, 182, 1, '2024-02-04 16:40:00'),
(10, 183, 3, '2024-02-05 08:55:00'),
(11, 184, 27, '2024-02-05 11:35:00'),
(12, 185, 28, '2024-02-05 15:10:00'),
(13, 186, 29, '2024-02-06 09:40:00'),
(14, 187, 1, '2024-02-06 13:15:00'),
(15, 188, 1, '2024-02-06 17:25:00'),
(16, 189, 3, '2024-02-07 08:30:00'),
(17, 190, 10, '2024-02-07 11:05:00'),
(18, 191, 11, '2024-02-07 14:45:00'),
(19, 192, 12, '2024-02-08 09:20:00'),
(20, 193, 1, '2024-02-08 12:50:00'),
(21, 194, 1, '2024-02-08 16:15:00'),
(22, 195, 3, '2024-02-09 08:45:00'),
(23, 196, 21, '2024-02-09 11:30:00'),
(24, 197, 1, '2024-02-09 15:00:00'),
(25, 198, 3, '2024-02-10 09:10:00'),
(26, 199, 10, '2024-02-10 13:40:00'),
(27, 200, 1, '2024-02-10 17:10:00');
GO
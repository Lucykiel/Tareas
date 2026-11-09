CREATE DATABASE IF NOT EXISTS carreteras;
USE carreteras;

CREATE TABLE IF NOT EXISTS titularidades(
 pk_titularidad INT AUTO_INCREMENT PRIMARY KEY,
 titularidad ENUM('Estatal', 'Autonómica', 'Provincial', 'Municipal') NOT NULL
);

CREATE TABLE IF NOT EXISTS tipos_via(
 pk_tipo_via INT AUTO_INCREMENT PRIMARY KEY,
 via ENUM('Autopista', 'Autovía', 'Multicarril', 'Convencional') NOT NULL
);

CREATE TABLE IF NOT EXISTS niveles(
 pk_nivel INT AUTO_INCREMENT PRIMARY KEY,
 nivel ENUM('1', '2', '3') NOT NULL,
 color ENUM('naranja', 'verde', 'amarillo') NOT NULL
);

CREATE TABLE IF NOT EXISTS carreteras(
 pk_carretera INT AUTO_INCREMENT PRIMARY KEY,
 codigo_carretera VARCHAR(15) NOT NULL,
 nombre_carretera VARCHAR(50) NOT NULL,
 fk_titularidad INTEGER,
 fk_tipo_via INTEGER,
 fk_nivel INTEGER,
 acceso_controlado BOOLEAN DEFAULT FALSE,
 doble_calzada BOOLEAN DEFAULT FALSE,
 prefijo VARCHAR(5),
 senyal VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS observaciones_carretera(
 pk_observaciones INT AUTO_INCREMENT PRIMARY KEY,
 fk_carretera INTEGER NOT NULL,
 FOREIGN KEY (fk_carretera) REFERENCES carreteras(pk_carretera),
 observacion TEXT
);

CREATE TABLE IF NOT EXISTS tipo_terreno(
 pk_tipo_terreno INT AUTO_INCREMENT PRIMARY KEY,
 tipo_terreno ENUM('Plano', 'Cuesta_subida', 'Cuesta_bajada') NOT NULL
);

CREATE TABLE IF NOT EXISTS entornos(
 pk_entorno INT AUTO_INCREMENT PRIMARY KEY,
 entorno ENUM('Urbano', 'Travesía', 'Extraurbano') NOT NULL
);

CREATE TABLE IF NOT EXISTS tipo_tramo(
 pk_tipo_tramo INT AUTO_INCREMENT PRIMARY KEY,
 tipo_tramo VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS comunidades_autonomas(
 pk_ccaa INT AUTO_INCREMENT PRIMARY KEY,
 comunidad_autonoma VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS provincias(
 pk_provincia INT AUTO_INCREMENT PRIMARY KEY,
 nombre_provincia VARCHAR(50) NOT NULL,
 fk_ccaa INTEGER
);

CREATE TABLE IF NOT EXISTS tramos_1(
 pk_tramo INT AUTO_INCREMENT PRIMARY KEY,
 fk_carretera INTEGER,
 fk_tipo_tramo INTEGER,
 km_inicial,
 fk_provincia_inicial,
 km_final,
 fk_provincia_final,
 longitud,
 fk_tipo_terreno,
 fk_entorno,
 velocidad_limite,
 sentidos,
 carriles_ida,
 carriles_vuelta,
 observaciones VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS confluencias(
 pk_confluencia,
 fk_tramo1,
 km_tramo1,
 fk_provincia,
 fk_tramo2,
 km_tramo2
);






CREATE DATABASE IF NOT EXISTS vuelos;
USE vuelos;

CREATE TABLE IF NOT EXISTS paises(
 pk_codigo_pais INT PRIMARY KEY,
 pais VARCHAR (50) NOT NULL
);

CREATE TABLE IF NOT EXISTS ciudades(
 pk_codigo_ciudad INT PRIMARY KEY,
 ciudad VARCHAR(50),
 fk_pais INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS vuelos(
 pk_vuelo INT PRIMARY KEY,
 numero_vuelo VARCHAR(10),
 fecha DATE,
 hora TIME,
 plazas_vacias VARCHAR(10),
 modelo VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS lineas_aereas(
 pk_linea_aerea INT PRIMARY KEY,
 linea_aerea VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS programas_vuelo(
 pk_programa_vuelo VARCHAR(20) PRIMARY KEY,
 numero_vuelo VARCHAR(10) NOT NULL,
 linea_aerea VARCHAR(10) NOT NULL,
 fk_aeropuerto_partida INTEGER NOT NULL,
 fk_aeropuerto_llegada INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS aeropuertos(
 pk_codigo_aeropuerto INT PRIMARY KEY,
 aeropuerto VARCHAR(50) NOT NULL,
 fk_ciudad INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS aeropuertos_1(
 pk_codigo_aeropuerto1 INT PRIMARY KEY,
 aeropuerto VARCHAR(50) NOT NULL,
 fk_ciudad INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS schedule_programas_vuelos(
 fk_programa_vuelo VARCHAR(20) NOT NULL,
 dia_semana VARCHAR(10) NOT NULL,
 hora_salida TIME NOT NULL,
  CONSTRAINT PK_schedule_programas_vuelos
   PRIMARY KEY (dia_semana, hora_salida)
);

CREATE TABLE IF NOT EXISTS modelos_aviones(
 pk_modelo INT AUTO_INCREMENT PRIMARY KEY,
 modelo VARCHAR(20) NOT NULL,
 capacidad VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS aeropuerto_modelos_aviones(
 fk_aeropuerto INTEGER NOT NULL,
 fk_modelo INTEGER NOT NULL,
  CONSTRAINT PK_aeropuerto_modelos_aviones
   PRIMARY KEY (fk_aeropuerto, fk_modelo)
);


DROP 

ALTER TABLE ciudades
ADD CONSTRAINT ciudades_2
FOREIGN KEY (fk_pais) REFERENCES paises(pk_codigo_pais);


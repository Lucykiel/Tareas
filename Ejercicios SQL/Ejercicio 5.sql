-- DROP DATABASE transporte_mercancias;

CREATE DATABASE IF NOT EXISTS transporte_mercancias;
USE transporte_mercancias;

CREATE TABLE IF NOT EXISTS marcas(
 pk_marca INT AUTO_INCREMENT PRIMARY KEY,
 marca VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS empleados(
 pk_dni VARCHAR(20) PRIMARY KEY,
 nombre VARCHAR(50) NOT NULL,
 apellido1 VARCHAR(50) NOT NULL,
 apellido2 VARCHAR(50),
 telefono VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS conductores(
 fk_dni VARCHAR(20) PRIMARY KEY,
 carnet VARCHAR(50) NOT NULL,
 fk_categoria INT
);

CREATE TABLE IF NOT EXISTS categoria_conductores(
 pk_categoria INT AUTO_INCREMENT PRIMARY KEY,
 descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS administrativos(
 fk_dni VARCHAR(20) PRIMARY KEY,
 fk_departamento INT
);

CREATE TABLE IF NOT EXISTS departamentos(
 pk_departamento INT AUTO_INCREMENT PRIMARY KEY,
 departamento VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS modelos(
 pk_modelo INT AUTO_INCREMENT PRIMARY KEY,
 fk_marca INT,
 modelo VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS vehiculos(
 pk_matricula VARCHAR(20) PRIMARY KEY,
 fk_modelo INT,
 anyo INT
);








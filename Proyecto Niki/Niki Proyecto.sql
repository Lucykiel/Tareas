CREATE DATABASE IF NOT EXISTS plataforma_steam;
USE plataforma_steam;

CREATE TABLE IF NOT EXISTS usuarios(
 pk_usuario INT AUTO_INCREMENT PRIMARY KEY,
 alias VARCHAR(20) NOT NULL,
 contrasena_encriptada VARCHAR(50) NOT NULL,
 pais VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS catalogo_steam(
 pk_videojuego INT AUTO_INCREMENT PRIMARY KEY,
 titulo VARCHAR(100) UNIQUE NOT NULL,
 desarrollador VARCHAR(50) NOT NULL,
 fecha_lanzamiento DATE NOT NULL,
 almacenamiento VARCHAR(20) NOT NULL,
 precio_base DECIMAL(5,2) NOT NULL CHECK (precio_base >= 0)
);

CREATE TABLE IF NOT EXISTS promociones(
 pk_promocion INT AUTO_INCREMENT PRIMARY KEY,
 fk_videojuego INTEGER NOT NULL,
 FOREIGN KEY (fk_videojuego) REFERENCES catalogo_steam(pk_videojuego), -- recordar eliminar, despues de que se coloque abajo
 porcentaje_descuento TINYINT DEFAULT 0,
 fecha_inicio_oferta DATE,
 fecha_fin_oferta DATE
);

CREATE TABLE IF NOT EXISTS logros(
 pk_logro INT AUTO_INCREMENT PRIMARY KEY,
 fk_videojuego INTEGER NOT NULL,
 FOREIGN KEY (fk_videojuego) REFERENCES catalogo_steam(pk_videojuego), -- recordar eliminar, despues de que se coloque abajo
 nombre_logro VARCHAR(50) NOT NULL,
 descripción VARCHAR(100) NOT NULL,
 rareza_global DECIMAL(4,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS logros_usuarios(
 fk_usuario INTEGER NOT NULL,
 fk_logro INTEGER NOT NULL,
 CONSTRAINT pk_logros_usuarios
  PRIMARY KEY (fk_usuario, fk_logro),
 fecha_desbloqueado DATE
);

CREATE TABLE IF NOT EXISTS estado_videojuego_usuarios(
 pk_estado INT AUTO_INCREMENT PRIMARY KEY,
 nombre_estado ENUM('cinta azul', 'terminado', 'pendiente', 'oculto', 'no_instalado', 'wishlist') NOT NULL
);

CREATE TABLE IF NOT EXISTS catalogo_usuarios(
 fk_usuario INTEGER NOT NULL,
 fk_videojuego INTEGER NOT NULL,
 CONSTRAINT pk_catalogo_usuarios
  PRIMARY KEY (fk_usuario, fk_videojuego),
 fk_estado INTEGER NOT NULL,
 FOREIGN KEY (fk_estado) REFERENCES estado_videojuego_usuarios(pk_estado), -- recordar eliminar, despues de que se coloque abajo
 fecha_agregado DATE,
 fecha_adquisicion DATE,
 horas_jugadas INT,
 ultima_sesion DATE
);



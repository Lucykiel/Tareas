-- DROP DATABASE plataforma_steam;

CREATE DATABASE IF NOT EXISTS plataforma_steam;
USE plataforma_steam;

CREATE TABLE IF NOT EXISTS usuarios(
 pk_usuario INT AUTO_INCREMENT PRIMARY KEY,
 alias VARCHAR(20) UNIQUE NOT NULL,
 contrasena_encriptada VARCHAR(10) UNIQUE NOT NULL,
 pais VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS catalogo_steam(
 pk_videojuego INT AUTO_INCREMENT PRIMARY KEY,
 titulo VARCHAR(150) UNIQUE NOT NULL,
 desarrollador VARCHAR(100) NOT NULL,
 fecha_lanzamiento DATE NOT NULL,
 almacenamiento VARCHAR(20) NOT NULL,
 precio_base DECIMAL(5,2) NOT NULL CHECK (precio_base >= 0)
);

CREATE TABLE IF NOT EXISTS promociones(
 pk_promocion INT AUTO_INCREMENT PRIMARY KEY,
 fk_videojuego INTEGER NOT NULL,
 porcentaje_descuento TINYINT UNSIGNED DEFAULT 0,
 fecha_inicio_oferta DATE,
 fecha_fin_oferta DATE
);

CREATE TABLE IF NOT EXISTS logros(
 pk_logro INT AUTO_INCREMENT PRIMARY KEY,
 fk_videojuego INTEGER NOT NULL,
 nombre_logro VARCHAR(50) NOT NULL,
 descripción VARCHAR(100) NOT NULL,
 rareza_global DECIMAL(4,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS logros_usuarios(
 fk_usuario INTEGER NOT NULL,
 fk_logro INTEGER NOT NULL,
 fecha_desbloqueado DATE NOT NULL DEFAULT (CURRENT_DATE)
);

CREATE TABLE IF NOT EXISTS estado_videojuego_usuarios(
 pk_estado INT AUTO_INCREMENT PRIMARY KEY,
 nombre_estado ENUM('Cinta Azul', 'Terminado', 'Pendiente', 'Oculto', 'No Instalado', 'Wishlist') NOT NULL
);

CREATE TABLE IF NOT EXISTS catalogo_usuarios(
 fk_usuario INTEGER NOT NULL,
 fk_videojuego INTEGER NOT NULL,
 fk_estado INTEGER NOT NULL,
 fecha_agregado DATE,
 fecha_adquisicion DATE,
 horas_jugadas INT,
 ultima_sesion DATE
);


ALTER TABLE promociones
ADD FOREIGN KEY (fk_videojuego) REFERENCES catalogo_steam(pk_videojuego)
ON UPDATE CASCADE ON DELETE CASCADE,
ADD CONSTRAINT chk_porcentaje CHECK (porcentaje_descuento <= 100),
ADD CONSTRAINT chk_fechas_oferta CHECK (fecha_fin_oferta >= fecha_inicio_oferta);

ALTER TABLE logros
ADD FOREIGN KEY (fk_videojuego) REFERENCES catalogo_steam(pk_videojuego)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE logros_usuarios
ADD PRIMARY KEY (fk_usuario, fk_logro),
ADD CONSTRAINT logros_usuarios_usuario
FOREIGN KEY (fk_usuario) REFERENCES usuarios(pk_usuario)
ON UPDATE CASCADE ON DELETE CASCADE,
ADD CONSTRAINT logros_usuarios_logro
FOREIGN KEY (fk_logro) REFERENCES logros(pk_logro)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE catalogo_usuarios
ADD PRIMARY KEY (fk_usuario, fk_videojuego),
ADD FOREIGN KEY (fk_usuario) REFERENCES usuarios(pk_usuario)
ON UPDATE CASCADE ON DELETE CASCADE,
ADD FOREIGN KEY (fk_videojuego) REFERENCES catalogo_steam(pk_videojuego)
ON UPDATE CASCADE ON DELETE CASCADE,
ADD FOREIGN KEY (fk_estado) REFERENCES estado_videojuego_usuarios(pk_estado)
ON UPDATE CASCADE ON DELETE CASCADE;


DELIMITER //
CREATE TRIGGER generar_contrasena_azar
BEFORE INSERT ON usuarios
FOR EACH ROW
 BEGIN
  IF NEW.contrasena_encriptada IS NULL OR NEW.contrasena_encriptada = '' THEN
   SET NEW.contrasena_encriptada = SUBSTRING(MD5(RAND()), 1, 10);
  END IF;
END //

DELIMITER ;





-- DROP DATABASE tienda;

CREATE DATABASE IF NOT EXISTS tienda;
USE tienda;

CREATE TABLE IF NOT EXISTS fabricante(
 pk_fabricante INT AUTO_INCREMENT PRIMARY KEY,
 nombre_fabricante VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS producto(
 pk_producto INT AUTO_INCREMENT PRIMARY KEY,
 fk_fabricante INTEGER NOT NULL,
 nombre_producto VARCHAR(50) NOT NULL,
 precio DECIMAL(5,2) CHECK (precio > 0) NOT NULL
);


DELIMITER $$ 
CREATE TRIGGER IF NOT EXISTS fabricante_mayusculas
BEFORE INSERT ON fabricante
FOR EACH ROW
 BEGIN
  SET NEW.nombre_fabricante = UPPER(NEW.nombre_fabricante);
END;
DELIMITER ;


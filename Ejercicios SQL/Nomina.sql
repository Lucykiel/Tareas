-- DROP DATABASE nomina;
-- nomina.sql

CREATE DATABASE IF NOT EXISTS nomina;
USE nomina;

-- tabla departamento
CREATE TABLE IF NOT EXISTS departamento(
  pk_departamento int AUTO_INCREMENT,
  departamento varchar(50) unique,
  primary key (pk_departamento)
);

-- tabla cargo
CREATE TABLE IF NOT EXISTS cargo(
  pk_cargo int AUTO_INCREMENT primary key,
  cargo varchar(50) unique
);

 -- tabla empleado
 CREATE TABLE IF NOT EXISTS empleado (
  pk_empleado int AUTO_INCREMENT primary key,
  apellido varchar(25) not null,
  nombre varchar(25) not null,
  sexo enum('Hombre', 'Mujer') not null,
  fecha_nacimiento date not null comment 'con esto se calculará la edad',
  estado_civil enum('Soltero', 'Casado', 'Divorciado', 'Viudo', 'Otro') not null,
  hijos int UNSIGNED default 0 ,
  fk_cargo integer,
  fk_departamento integer,
  fecha_contrato date not null,
  sueldo decimal(10,2) not null CHECK (sueldo > 700*12),
  retencion_sso decimal(10,2) GENERATED ALWAYS AS (sueldo * 0.047) STORED
);

-- 1. Change the delimiter at the very beginning
DELIMITER //

-- 2. Drop procedure without parentheses
DROP PROCEDURE IF EXISTS delall //

-- 3. Create the procedure
CREATE PROCEDURE delall()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_table VARCHAR(255);
    DECLARE v_con VARCHAR(255);

    DECLARE cur CURSOR FOR 
        SELECT TABLE_NAME, CONSTRAINT_NAME 
        FROM information_schema.TABLE_CONSTRAINTS 
        WHERE CONSTRAINT_SCHEMA = DATABASE()
        AND CONSTRAINT_TYPE = 'FOREIGN KEY';

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO v_table, v_con;
        IF done = 1 THEN 
            LEAVE read_loop;
        END IF; 

        -- Added missing '=' and commas for CONCAT
        SET @s = CONCAT('ALTER TABLE `', v_table, '` DROP FOREIGN KEY `', v_con, '`;');
        PREPARE stmt FROM @s;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END LOOP;

    CLOSE cur;
END //

-- 4. Reset delimiter back to default semicolon
DELIMITER ;

-- 5. Call the procedure
CALL delall();

-- foreign keys

ALTER TABLE empleado 
ADD CONSTRAINT cargos_empleados
FOREIGN KEY (fk_cargo) REFERENCES cargo(pk_cargo)
ON UPDATE CASCADE -- si un padre se cambia se cambian sus hijos en la tabla empleado
ON DELETE RESTRICT; -- si un padre se intenta borrar y tiene hijos, no se permite la operación

ALTER TABLE empleado 
ADD CONSTRAINT departamentos_empleados
FOREIGN KEY (fk_departamento) REFERENCES departamento(pk_departamento)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE empleado ADD COLUMN num_sso varchar(15) ;

ALTER TABLE empleado
ADD CONSTRAINT sso_empleado UNIQUE(num_sso);

DELIMITER $$ 
CREATE TRIGGER impuestos
BEFORE INSERT ON empleado
FOR EACH ROW
 BEGIN
 
  IF NEW.num_sso IS NULL THEN
  SET NEW.num_sso= NEW.pk_empleado ;
 END IF;
 END 
DELIMITER ;


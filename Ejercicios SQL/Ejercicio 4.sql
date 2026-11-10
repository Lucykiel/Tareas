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
 fk_numero_vuelo VARCHAR(10),
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
 numero_vuelo VARCHAR(10) NOT NULL UNIQUE,
 fk_linea_aerea INT NOT NULL UNIQUE,
 fk_aeropuerto_partida INTEGER NOT NULL UNIQUE,
 fk_aeropuerto_llegada INTEGER NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS aeropuertos(
 pk_codigo_aeropuerto INT PRIMARY KEY,
 aeropuerto VARCHAR(50) NOT NULL,
 fk_ciudad INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS aeropuertos_1(
 pk_codigo_aeropuerto_1 INT PRIMARY KEY,
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


ALTER TABLE ciudades
ADD CONSTRAINT ciudades_paises
FOREIGN KEY (fk_pais) REFERENCES paises(pk_codigo_pais);

ALTER TABLE aeropuertos
ADD CONSTRAINT aeropuertos_ciudades
FOREIGN KEY (fk_ciudad) REFERENCES ciudades(pk_codigo_ciudad);

ALTER TABLE aeropuertos_1
ADD CONSTRAINT aeropuertos_1_ciudades
FOREIGN KEY (fk_ciudad) REFERENCES ciudades(pk_codigo_ciudad);


ALTER TABLE vuelos
ADD CONSTRAINT vuelos_programas_vuelo
FOREIGN KEY (fk_numero_vuelo) REFERENCES programas_vuelo(numero_vuelo);


ALTER TABLE programas_vuelo
ADD CONSTRAINT programas_vuelo_lineas_aereas
FOREIGN KEY (fk_linea_aerea) REFERENCES lineas_aereas(pk_linea_aerea),
ADD CONSTRAINT programas_vuelo_aeropuertos
FOREIGN KEY (fk_aeropuerto_partida) REFERENCES aeropuertos(pk_codigo_aeropuerto),
ADD CONSTRAINT programas_vuelo_aeropuertos_1
FOREIGN KEY (fk_aeropuerto_llegada) REFERENCES aeropuertos_1(pk_codigo_aeropuerto_1);



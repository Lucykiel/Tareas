-- DROP DATABASE llamadas;

CREATE DATABASE IF NOT EXISTS llamadas;
USE llamadas;

CREATE TABLE IF NOT EXISTS llamadas(
 tipo_llamada VARCHAR(20) NOT NULL,
 destino VARCHAR(20) NOT NULL,
 tlf_origen VARCHAR(20) NOT NULL,
 fecha DATE,
 tlf_destino VARCHAR(20) NOT NULL,
 importe_minuto DECIMAL(5,2),
 minutos VARCHAR(10) NOT NULL,
 segundos VARCHAR(10) NOT NULL,
 importe_llamada DECIMAL(5,2) NOT NULL
);

SET GLOBAL local_infile = 1;

LOAD DATA INFILE
    'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/llamadas1.csv'
INTO TABLE llamadas
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT * FROM llamadas;
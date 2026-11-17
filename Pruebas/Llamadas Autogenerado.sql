CREATE DATABASE IF NOT EXISTS llamadas;
USE llamadas;


-- 1. Crear la tabla con la columna generada automáticamente
CREATE TABLE IF NOT EXISTS llamadas (
    tipo_llamada VARCHAR(20) NOT NULL,
    destino VARCHAR(20) NOT NULL,
    tlf_origen VARCHAR(20) NOT NULL,
    fecha DATE,
    tlf_destino VARCHAR(20) NOT NULL,
    importe_minuto DECIMAL(5,2),
    minutos VARCHAR(10) NOT NULL,
    segundos VARCHAR(10) NOT NULL,
    -- Columna calculada automáticamente por la base de datos
    importe_llamada DECIMAL(5,2) GENERATED ALWAYS AS (
        importe_minuto * (CAST(minutos AS DECIMAL(10,2)) + (CAST(segundos AS DECIMAL(10,2)) / 60))
    ) STORED
);

-- 2. Habilitar la carga local de archivos (necesario ejecutarlo previamente en la sesión)
SET GLOBAL local_infile = 1;

-- 3. Importar el archivo CSV (el @dummy descarta el importe que trae el Excel)
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/llamadas1.csv'
INTO TABLE llamadas
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(tipo_llamada, destino, tlf_origen, fecha, tlf_destino, importe_minuto, minutos, segundos, @dummy);

-- 4. Verificar los resultados calculados
SELECT * FROM llamadas;
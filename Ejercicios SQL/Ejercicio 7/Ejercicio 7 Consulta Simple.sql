USE nomina;

-- 1. Lista los nombres de todos los empleados que hay en la tabla empleado.
SELECT
nombre
FROM
empleado;

-- 2. Lista los nombres y los sueldos de todos los empleados de la tabla empleado.
SELECT
nombre, sueldo
FROM
empleado;

-- 3. Lista todas las columnas (*) de la tabla empleado.
SELECT * FROM empleado;

-- 4. Lista el nombre + apellido de todos los empleados, su fecha de nacimiento y su fecha de contrato.
SELECT CONCAT(nombre, " ", apellido) AS nombre_apellido,
fecha_nacimiento, fecha_contrato
FROM
empleado;

-- 5. Lista el nombre de los empleados, su apellido, el sexo e hijos.
SELECT
nombre, apellido, sexo, hijos
FROM
empleado;

-- 6. Utiliza los siguientes alias para las columnas: nombre del empleado, apellido del empleado, sexo, número de hijos.
SELECT
nombre AS nombre_empleado,
apellido AS apellido_empleado,
hijos AS numero_hijos
FROM
empleado;

-- 7. Lista los nombres + apellidos y el sueldo de todos los empleados de la tabla empleado, mostrando los apellidos en mayúsculas (función UPPER).
SELECT CONCAT(nombre, ' ', UPPER(apellido)) AS nombre_apellido,
sueldo
FROM
empleado;

-- 8. Lista los nombres + apellidos y estado civil de todos los empleados de la tabla empleado, mostrando el estado civil en minúscula (función LOWER).
SELECT CONCAT(nombre, ' ', apellido) AS nombre_apellido,
LOWER(estado_civil) AS estado_civil
FROM
empleado;

-- 9. Lista los nombres + apellidos de todos los empleados y calcula las iniciales de los
-- mismos (primera letra del nombre y primera letra del apellido seguidas de punto.
-- Ejemplo: Marcos Rodríguez sería M.R.). (función LEFT)
SELECT CONCAT(nombre, ' ', apellido, ' ', LEFT(nombre, 1), '.', LEFT(apellido, 1), '.') AS nombre_apellido_inicial
FROM
empleado;

-- 10. Lista los nombres + apellidos de todos los empleados y calcula su edad a partir de la fecha de nacimiento.
SELECT CONCAT(nombre, ' ', apellido) AS nombre_apellido,
TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad
FROM
empleado;

-- 11. Lista los nombres + apellidos de todos los empleados y calcula su antigüedad a partir de la fecha del contrato. 
SELECT CONCAT(nombre, ' ', apellido) AS nombre_apellido,
TIMESTAMPDIFF(YEAR, fecha_contrato, CURDATE()) AS antiguedad
FROM
empleado;

-- 12. Lista sin repetir el código de los cargos (fk_cargo) de la tabla empleado.
SELECT DISTINCT fk_cargo
FROM
empleado;

-- 13. Lista la tabla empleado ordenada de forma ascendente (ASC) por apellido y nombre.
SELECT * FROM empleado
ORDER BY apellido, nombre ASC;

-- 14. Lista la tabla empleado ordenada de forma descendente (DESC) por sueldos.
SELECT * FROM empleado
ORDER BY sueldo DESC;

-- 15. Lista los empleados ordenados en primer lugar por el estado civil de forma ascendente y en segundo lugar el sueldo de forma descendente.
SELECT * FROM empleado
ORDER BY estado_civil ASC, sueldo DESC;

-- 16. Devuelve una lista con las 3 primeras filas de la tabla cargo.
SELECT * FROM cargo
LIMIT 3;

-- 17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla departamento. La cuarta fila también se debe incluir en la respuesta.
SELECT * FROM departamento
ORDER BY pk_departamento ASC
LIMIT 2 
OFFSET 3;

-- 18. Lista el nombre + apellido y el sueldo del empleado que gane menos sueldo.
SELECT CONCAT(nombre, ' ', apellido) AS nombre_apellido, sueldo
FROM empleado
ORDER BY sueldo ASC
LIMIT 1;

-- 19. Lista el nombre + apellido y la fecha de nacimiento del empleado de mayor edad.
SELECT CONCAT(nombre, ' ', apellido) AS nombre_apellido, fecha_nacimiento
FROM empleado
ORDER BY fecha_nacimiento ASC
LIMIT 1;

-- 20.Lista el nombre de todos los empleados cuyo fk_departamento es igual a 2.
SELECT nombre, fk_departamento
FROM empleado
WHERE fk_departamento = 2;

-- 21. Lista nombre + apellido de los empleados que tienen un sueldo menor o igual a 15.000€.
SELECT CONCAT(nombre, ' ', apellido) AS nombre_apellido, sueldo
FROM empleado
WHERE sueldo <= 15000
ORDER BY sueldo DESC;

-- 22.Lista nombre + apellido de los empleados que tienen un sueldo mayor o igual a 40.000€.
SELECT CONCAT(nombre, ' ', apellido) AS nombre_apellido, sueldo
FROM empleado
WHERE sueldo >= 40000
ORDER BY sueldo ASC;

-- 23.Lista nombre + apellido de los empleados que no tienen un sueldo mayor o igual a 14.000€.
SELECT CONCAT(nombre, ' ', apellido) AS nombre_apellido, sueldo
FROM empleado
WHERE sueldo < 14000
ORDER BY sueldo DESC;

-- 24.Lista todos los empleados que tengan un sueldo entre 18.000€ y 25.000€.
-- Sin utilizar el operador BETWEEN.
SELECT CONCAT(nombre, ' ', apellido) AS nombre_apellido, sueldo
FROM empleado
WHERE sueldo >= 18000 AND sueldo <= 25000
ORDER BY sueldo DESC;

-- 25.Lista todos los empleados que tengan un sueldo entre 16.000€ y 20.000€.
-- Utilizando el operador BETWEEN.
SELECT CONCAT(nombre, ' ', apellido) AS nombre_apellido, sueldo
FROM empleado
WHERE sueldo BETWEEN 16000 AND 20000
ORDER BY sueldo DESC;

-- 26.Lista los empleados que tengan un sueldo mayor que 15.000€ y que el fk_departamento sea igual a 6.
SELECT CONCAT(nombre, ' ', apellido) AS nombre_apellido, fk_departamento, sueldo
FROM empleado
WHERE fk_departamento = 6 AND sueldo > 15000
ORDER BY sueldo ASC;

-- 27. Lista los empleados donde el fk_cargo sea 1,3 o 5.
-- Sin utilizar el operador IN.
SELECT CONCAT(nombre, ' ', apellido) AS nombre_apellido, fk_cargo
FROM empleado
WHERE fk_cargo = 1 
OR fk_cargo = 3 
OR fk_cargo = 5;

-- 28.Lista todos los empleados donde el fk_cargo sea 1, 3 o 5.
-- Utilizando el operador IN.
SELECT CONCAT(nombre, ' ', apellido) AS nombre_apellido, fk_cargo
FROM empleado
WHERE fk_cargo IN (1, 3, 5);








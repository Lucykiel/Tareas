USE nomina;
USE jardineria;

-- 1. Calcula el número total de empleados que hay en la tabla empleado.
SELECT COUNT(*) AS total_empleados
FROM empleado;

-- 2. Calcula el número total de departamentos que hay en la tabla departamento.
SELECT COUNT(*) AS total_departamentos
FROM departamento;

-- 3. Calcula la media de sueldo de todos los empleados.
SELECT ROUND(AVG(sueldo), 2) AS salario_medio
FROM empleado;

-- 4. Indica quién es el empleado más joven.
SELECT nombre, fecha_nacimiento
FROM empleado
ORDER BY fecha_nacimiento DESC
LIMIT 1;

-- 5. Indica quién es el empleado menos joven.
SELECT nombre, fecha_nacimiento
FROM empleado
ORDER BY fecha_nacimiento ASC
LIMIT 1;

-- 6. Calcula el número total de empleados por estado civil.
SELECT estado_civil, COUNT(*) AS total_empleados
FROM empleado
GROUP BY estado_civil;

-- 7. Muestra el número de empleados que han ingresado cada año a la empresa
SELECT YEAR(fecha_contrato) AS anio, COUNT(*) AS total_empleados
FROM empleado
GROUP BY YEAR(fecha_contrato);

-- 8. Lista el nombre y el precio del producto más caro.
SELECT nombre, precio_venta
FROM producto
ORDER BY precio_venta DESC
LIMIT 1;

-- 9. Calcula la suma de los salarios de los empleados por departamento.
SELECT d.departamento AS nombre_departamento, SUM(e.sueldo) AS suma_salarios
FROM empleado AS e
JOIN departamento AS d ON e.fk_departamento = d.pk_departamento
GROUP BY d.pk_departamento, d.departamento;

-- 10.Calcula la suma de los salarios de los empleados por sexo.
SELECT sexo, SUM(sueldo) AS suma_salarios
FROM empleado
GROUP BY sexo;

-- 11. Calcula el número de empleados que son Asistentes.
SELECT c.cargo AS nombre_cargo, COUNT(pk_empleado) AS total_empleados
FROM empleado AS e
JOIN cargo AS c ON e.fk_cargo = c.pk_cargo
WHERE c.cargo = 'Asistente'
GROUP BY c.pk_cargo, c.cargo;

-- 12. Calcula la media de hijos de los empleados por sexo y estado civil
SELECT sexo, estado_civil, ROUND(AVG(hijos), 2) AS hijos
FROM empleado
GROUP BY sexo, estado_civil;

-- 13.Calcula el sueldo más bajo de los Analistas.
SELECT c.cargo, COUNT(pk_empleado) AS total_empleados, MIN(sueldo)
FROM empleado AS e
JOIN cargo AS c ON e.fk_cargo = c.pk_cargo
WHERE c.cargo = 'Analista'
GROUP BY c.pk_cargo, c.cargo;

-- 14.Calcula el sueldo más alto de los Analistas.
SELECT c.cargo, COUNT(pk_empleado) AS total_empleados, MAX(sueldo)
FROM empleado AS e
JOIN cargo AS c ON e.fk_cargo = c.pk_cargo
WHERE c.cargo = 'Analista'
GROUP BY c.pk_cargo, c.cargo;

-- 15. Muestra el sueldo máximo, sueldo mínimo, sueldo promedio y el número total de empleados por cargo.
SELECT c.cargo, COUNT(*) AS total_empleados,
MAX(sueldo) AS sueldo_maximo, MIN(sueldo) AS sueldo_minimo, AVG(sueldo) AS sueldo_medio
FROM empleado AS e
JOIN cargo AS c ON e.fk_cargo = c.pk_cargo
GROUP BY c.cargo;

-- 16. Muestra el sueldo máximo, sueldo mínimo, sueldo promedio y el número total
-- de empleados por departamento, ordenando de forma descendente por el sueldo promedio.
SELECT d.departamento, COUNT(*) AS total_empleados,
MAX(sueldo) AS sueldo_maximo, MIN(sueldo) AS sueldo_minimo, ROUND(AVG(sueldo), 2) AS sueldo_medio
FROM empleado AS e
JOIN departamento AS d ON d.pk_departamento = e.fk_departamento
GROUP BY d.departamento
ORDER BY AVG(sueldo) DESC;

-- 17. Muestra la edad máxima, edad mínima, edad promedio y el número total de
-- empleados de los departamentos que tienen una edad promedio superior a los 45 años.
SELECT d.departamento, COUNT(*) AS total_empleados,
MAX(TIMESTAMPDIFF(YEAR, e.fecha_nacimiento, CURDATE())) AS edad_maxima, MIN(TIMESTAMPDIFF(YEAR, e.fecha_nacimiento, CURDATE())) AS edad_minima,
ROUND(AVG(TIMESTAMPDIFF(YEAR, e.fecha_nacimiento, CURDATE())), 2) AS edad_promedio
FROM empleado AS e
JOIN departamento AS d ON d.pk_departamento = e.fk_departamento
GROUP BY d.departamento
HAVING AVG(TIMESTAMPDIFF(YEAR, e.fecha_nacimiento, CURDATE())) > 45;

-- 18.Calcula el número de empleados que tienen un sueldo mayor o igual a 1800€.
SELECT COUNT(pk_empleado) AS total_empleados
FROM empleado
WHERE sueldo >= 1800;

-- 19. Calcula el número de empleados que tienen una edad menor o igual a 28 años.
SELECT COUNT(pk_empleado) AS total_empleados
FROM empleado
WHERE TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) <= 28;

-- 20.Lista los nombres de los departamentos cuyos empleados tienen una edad promedio mayor o igual a 35 años.
SELECT d.departamento, COUNT(*) AS total_empleados,
ROUND(AVG(TIMESTAMPDIFF(YEAR, e.fecha_nacimiento, CURDATE())), 2) AS edad_promedio
FROM empleado AS e
JOIN departamento AS d ON d.pk_departamento = e.fk_departamento
GROUP BY d.departamento
HAVING edad_promedio >= 35;

-- 21. Devuelve un listado con los nombres de los cargos que tienen 5 o más empleados.
SELECT c.cargo, COUNT(*) AS total_empleados
FROM empleado AS e
JOIN cargo AS c ON c.pk_cargo = e.fk_cargo
GROUP BY c.cargo
HAVING total_empleados >= 5;

-- 22.Devuelve un listado con los nombres de los departamentos donde el promedio de edad sea superior 40 años.
SELECT d.departamento, ROUND(AVG(TIMESTAMPDIFF(YEAR, e.fecha_nacimiento, CURDATE())), 2) AS edad_promedio
FROM empleado AS e
JOIN departamento AS d ON d.pk_departamento = e.fk_departamento
GROUP BY d.departamento
HAVING edad_promedio > 40;

-- 23.Muestra el número total de empleados que tiene cada departamento. El listado también debe incluir los departamentos que no tienen ningún
-- empleado. El resultado mostrará dos columnas, una con el nombre del departamento y otra con el número de empleados que tiene. Ordena el
-- resultado descendentemente por el número de empleados.
SELECT d.departamento, COUNT(pk_empleado) AS total_empleados
FROM empleado AS e
RIGHT JOIN departamento AS d ON d.pk_departamento = e.fk_departamento
GROUP BY d.departamento
ORDER BY total_empleados DESC;

-- 24.Explica las diferencias entre las cláusulas WHERE y HAVING, y cuándo utilizar cada una de ellas.

-- Where solo aplica a una columna de todo una tabla y establece una regla, Having la establece en un conjunto.





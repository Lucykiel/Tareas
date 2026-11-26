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





13.Calcula el sueldo más bajo de los Analistas.
14.Calcula el sueldo más alto de los Analistas.
15. Muestra el sueldo máximo, sueldo mínimo, sueldo promedio y el número total
de empleados por cargo.




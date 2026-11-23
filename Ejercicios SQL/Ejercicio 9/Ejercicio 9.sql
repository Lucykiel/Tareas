USE nomina;

-- Composición interna (INNER JOIN)
-- 1. Lista el nombre y apellido de los empleados, su sueldo y el nombre del departamento donde trabaja.
SELECT d.departamento, e.nombre, e.apellido, e.sueldo FROM departamento d
JOIN empleado e
ON d.pk_departamento = e.fk_departamento;

-- 2. Lista el nombre y apellido de los empleados, su fecha de contrato y el nombre del cargo.
SELECT e.nombre, e.apellido, e.fecha_contrato, c.cargo FROM cargo c
JOIN empleado e
ON c.pk_cargo = e.fk_cargo;

-- 3. Ordena el resultado por la fecha de contrato.
SELECT e.nombre, e.apellido, e.fecha_contrato, c.cargo FROM cargo c
JOIN empleado e
ON c.pk_cargo = e.fk_cargo
ORDER BY e.fecha_contrato ASC;

-- 4. Lista el código del empleado, su nombre y apellido, el código del departameto y el
-- nombre del departamento de los empleados que ganen más de 2000€.
SELECT e.pk_empleado, e.nombre, e.apellido, e.sueldo, d.pk_departamento, d.departamento FROM departamento d
JOIN empleado e
ON d.pk_departamento = e.fk_departamento
WHERE e.sueldo >= 2000
ORDER BY e.sueldo DESC;

-- 5. Indica el nombre, apellido y nombre del cargo del empleado más joven.
SELECT e.nombre, e.apellido, e.fecha_nacimiento, c.cargo FROM cargo c
JOIN empleado e
ON c.pk_cargo = e.fk_cargo
ORDER BY e.fecha_nacimiento DESC
LIMIT 1;

-- 6. Indica el nombre, apellido y nombre del departamento de los empleados que tengan hijos.
SELECT e.nombre, e.apellido, e.hijos, d.departamento FROM departamento d
JOIN empleado e
ON d.pk_departamento = e.fk_departamento
WHERE e.hijos > 0;

-- 7. Lista todos los datos de los empleados de Contabilidad.
SELECT e.*, d.departamento FROM departamento d
JOIN empleado e
ON d.pk_departamento = e.fk_departamento
WHERE d.departamento = 'contabilidad';

-- 8. Lista el nombre y apellido del empleado, el nombre del cargo y el del
-- departamento de los empleados solteros sin hijos
SELECT e.nombre, e.apellido, c.cargo, d.departamento FROM empleado e
JOIN cargo c ON e.fk_cargo = c.pk_cargo
JOIN departamento d ON e.fk_departamento = d.pk_departamento
WHERE e.hijos = 0 AND e.estado_civil = 'Soltero';

-- 9. Lista los empleados de los departamentos de Compras y Ventas sin utilizar el operador IN.
SELECT e.nombre, e.apellido, d.departamento FROM empleado AS e
JOIN departamento AS d ON e.fk_departamento = d.pk_departamento
WHERE d.departamento = 'Compras' OR d.departamento = 'Ventas';

-- 10.Lista los empleados de los departamentos de Compras y Ventas utilizando el operador IN.
SELECT e.nombre, e.apellido, d.departamento FROM empleado AS e
JOIN departamento AS d ON e.fk_departamento = d.pk_departamento
WHERE d.departamento IN('Compras', 'Ventas');

-- 11. Lista el nombre y apellido del empleado, el nombre del cargo y del departamento
-- de aquellas personas que tienen más de 20 años en la empresa. Ordena el
-- resultado en primer lugar por el departamento (en orden ascendente) y en
-- segundo lugar por el tiempo trabajado (en orden descendente)
SELECT e.nombre, e.apellido, e.fecha_contrato, c.cargo, d.departamento FROM empleado AS e
JOIN cargo AS c ON e.fk_cargo = c.pk_cargo
JOIN departamento AS d ON e.fk_departamento = d.pk_departamento
WHERE e.fecha_contrato <= DATE_SUB(CURDATE(), INTERVAL 20 YEAR)
ORDER BY d.departamento ASC, e.fecha_contrato DESC;

-- 12. Lista nombre y apellido, edad, nombre del cargo, nombre del departamento de los empleados Solteros, Divorciados o Viudos que tengan más de un hijo.
SELECT e.nombre, e.apellido, TIMESTAMPDIFF(YEAR, e.fecha_nacimiento, CURDATE()) AS edad, c.cargo, d.departamento FROM empleado e
JOIN cargo c ON e.fk_cargo = c.pk_cargo
JOIN departamento d ON e.fk_departamento = d.pk_departamento
WHERE e.estado_civil IN('Soltero', 'Divorciado', 'Viudo') AND e.hijos > 1;


-- Composición externa ( LEFT JOIN, RIGHT JOIN )
-- 13. Lista todos departamentos registrados que existen en la base de datos, junto con
-- el código, nombre y apellido del empleado que tiene cada uno de ellos. El listado
-- deberá mostrar también aquellos departamentos que no tienen empleados asociados.
SELECT d.*, e.pk_empleado, e.nombre, e.apellido FROM departamento AS d
LEFT JOIN empleado AS e ON d.pk_departamento = e.fk_departamento;

-- 14. Lista todos cargos registrados que existen en la base de datos, junto con el
-- nombre y apellido del empleado, la edad y estado civil que tiene cada empleado.
-- El listado deberá mostrar también aquellos cargos que no tienen empleados asociados.
SELECT c.*, e.nombre, e.apellido, TIMESTAMPDIFF(YEAR, e.fecha_nacimiento, CURDATE()) AS edad, e.estado_civil FROM cargo AS c
LEFT JOIN empleado AS e ON c.pk_cargo = e.fk_cargo;

-- 15. Lista los departamentos sin empleados asociados.
SELECT d.* FROM departamento AS d
LEFT JOIN empleado AS e ON d.pk_departamento = e.fk_departamento
WHERE e.fk_departamento IS NULL;

-- 16. ¿Se puede asignar a un empleado un cargo que no esté registrado en la tabla de cargos? Justifica tu respuesta.

-- No. Proteccion de datos, la base de datos no permite asignar a un empleado un cargo que no existe en los registros de la tabla
-- cargos. Por la vinculacion de clave primaria y foranea, no se permite romper la consistencia.


-- Utilizando la Base de Datos Jardinería:
-- Composición interna (INNER JOIN)
USE jardineria;

-- 1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
SELECT c.nombre_cliente, e.nombre, e.apellido1, e.apellido2, e.puesto FROM cliente AS c
JOIN empleado AS e ON c.fk_representante_ventas = e.pk_empleado
WHERE e.puesto = 'Representante Ventas';

-- 2. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
SELECT DISTINCT c.nombre_cliente, e.nombre, e.puesto FROM cliente AS c
JOIN empleado AS e ON c.fk_representante_ventas = e.pk_empleado
JOIN pago AS p ON c.pk_cliente = p.fk_cliente
WHERE e.puesto = 'Representante Ventas';

-- 3. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.
SELECT DISTINCT c.nombre_cliente, e.nombre, e.puesto FROM cliente AS c
JOIN empleado AS e ON c.fk_representante_ventas = e.pk_empleado
LEFT JOIN pago AS p ON c.pk_cliente = p.fk_cliente
WHERE e.puesto = 'Representante Ventas' AND p.fk_cliente IS NULL;

-- 4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus
-- representantes junto con la ciudad de la oficina a la que pertenece el representante.
SELECT DISTINCT c.nombre_cliente, e.nombre, e.puesto, o.ciudad FROM cliente AS c
JOIN empleado AS e ON c.fk_representante_ventas = e.pk_empleado
JOIN pago AS p ON c.pk_cliente = p.fk_cliente
JOIN oficina AS o ON o.pk_oficina = e.fk_oficina
WHERE e.puesto = 'Representante Ventas';

-- 5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus
-- representantes junto con la ciudad de la oficina a la que pertenece el representante.




-- 6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

-- 7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.






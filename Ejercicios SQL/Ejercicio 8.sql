USE jardineria;

-- 1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
SELECT pk_oficina, ciudad
FROM oficina;

-- 2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
SELECT pk_oficina, ciudad, pais, telefono
FROM oficina
WHERE pais = 'españa';

-- 3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
SELECT nombre, apellido1, apellido2, email
FROM empleado
WHERE fk_jefe = 7;

-- 4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
SELECT puesto, nombre, apellido1, apellido2, email
FROM empleado
WHERE puesto = 'Director General';

-- 5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.
SELECT nombre, apellido1, apellido2, puesto
FROM empleado
WHERE puesto != 'Representante Ventas';

-- 6. Devuelve un listado con el nombre de los todos los clientes españoles.
SELECT nombre_cliente, pais
FROM cliente
WHERE pais = 'spain';

-- 7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.
SELECT DISTINCT estado
FROM pedido;

-- 8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron
-- algún pago en 2008. Ten en cuenta que no deberás mostrar aquellos códigos de
-- cliente que aparezcan repetidos. Resuelve la consulta:
-- o Utilizando la función YEAR de MySQL.
-- o Utilizando la función DATE_FORMAT de MySQL.
-- o Sin utilizar ninguna de las funciones anteriores.
SELECT DISTINCT fk_cliente
FROM pago
WHERE YEAR(fecha_pago) = 2008;

SELECT DISTINCT fk_cliente
FROM pago
WHERE DATE_FORMAT(fecha_pago, '%Y') = '2008';

SELECT fk_cliente, GROUP_CONCAT(fecha_pago) AS fechas_pago
FROM pago
WHERE fecha_pago LIKE '%2008%'
GROUP BY fk_cliente;

-- 9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.
SELECT pk_pedido, fk_cliente, fecha_esperada, fecha_entrega
FROM pedido
WHERE fecha_esperada < fecha_entrega OR fecha_entrega IS NULL;

-- 10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y
-- fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
-- o Utilizando la función ADDDATE de MySQL.
-- o Utilizando la función DATEDIFF de MySQL.
-- o ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?
SELECT pk_pedido, fk_cliente, fecha_esperada, fecha_entrega,
ADDDATE(fecha_esperada, INTERVAL -2 DAY) AS resultado
FROM pedido
WHERE fecha_entrega <= ADDDATE(fecha_esperada, INTERVAL -2 DAY);

SELECT pk_pedido, fk_cliente, fecha_esperada, fecha_entrega,
DATEDIFF(fecha_esperada, fecha_entrega) AS resultado
FROM pedido
WHERE DATEDIFF(fecha_esperada, fecha_entrega) >= 2;

SELECT pk_pedido, fk_cliente, fecha_esperada, fecha_entrega,
fecha_esperada - fecha_entrega AS resultado
FROM pedido
WHERE (fecha_esperada - fecha_entrega) >= 2;




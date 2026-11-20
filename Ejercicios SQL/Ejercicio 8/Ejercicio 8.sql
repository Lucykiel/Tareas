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

-- 11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
SELECT pk_pedido, fecha_pedido, estado
FROM pedido
WHERE YEAR(fecha_pedido) = 2009 AND estado = 'Rechazado';

-- 12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.
SELECT pk_pedido, fecha_entrega
FROM pedido
WHERE MONTH(fecha_entrega) = 1
ORDER BY pk_pedido ASC; 

-- 13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordena el resultado de mayor a menor.
SELECT fk_cliente, forma_pago, fecha_pago, total
FROM pago
WHERE YEAR(fecha_pago) = 2008 AND forma_pago = 'Paypal'
ORDER BY fecha_pago ASC;

-- 14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.
SELECT DISTINCT forma_pago
FROM pago;

-- 15. Devuelve un listado con todos los productos que pertenecen a la gama
-- Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar
-- ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.
SELECT pk_producto, fk_gama, cantidad_en_stock, precio_venta
FROM producto
WHERE fk_gama = 5 AND cantidad_en_stock >= 100
ORDER BY precio_venta DESC;

-- 16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.
SELECT pk_cliente, nombre_cliente, ciudad, fk_representante_ventas
FROM cliente
WHERE fk_representante_ventas = 11 OR fk_representante_ventas = 30 AND ciudad = 'Madrid';







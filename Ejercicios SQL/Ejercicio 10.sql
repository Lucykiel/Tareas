USE jardineria;

-- 1. Crea una vista llamada pedidos_no_entregados que muestre para cada uno de
-- los pedidos de la Base de Datos de jardinería, el código del pedido, la fecha del
-- pedido, el nombre completo del cliente que lo realizó y su estado para aquellos
-- pedidos que no hayan sido entregados. Ordenala por estado.
CREATE OR REPLACE VIEW pedidos_no_entregados AS
SELECT pe.pk_pedido, pe.fecha_pedido, c.nombre_cliente, pe.estado FROM pedido AS pe
LEFT JOIN cliente AS c ON c.pk_cliente = pe.fk_cliente
WHERE pe.estado != 'Entregado'
ORDER BY pe.estado ASC;

SELECT * FROM pedidos_no_entregados;

-- 2. Crea una vista que se llame listado_pagos_clientes que muestre un listado
-- donde aparezcan todos los clientes y los pagos que ha realizado cada uno de
-- ellos. La vista deberá tener las siguientes columnas: nombre y apellidos del cliente
-- concatenados, teléfono, ciudad, pais, fecha_pago, total del pago e id de la transacción.
CREATE OR REPLACE VIEW listado_pagos_clientes AS
SELECT CONCAT(c.nombre_contacto, " ", c.apellido_contacto) AS nombre_apellido, c.telefono, c.ciudad, c.pais, pa.fecha_pago, pa.total, pa.id_transaccion
FROM cliente AS c
LEFT JOIN pago AS pa ON c.pk_cliente = pa.fk_cliente;

SELECT * FROM listado_pagos_clientes;

-- 3. Crea una vista que se llame listado_pedidos_clientes que muestre un listado
-- donde aparezcan todos los clientes y los pedidos que ha realizado cada uno de
-- ellos. La vista deberá tener las siguientes columnas: código del cliente, nombre y
-- apellidos del cliente concatendados, teléfono, ciudad, pais, código del pedido,
-- fecha del pedido, fecha esperada y fecha de entrega.
CREATE OR REPLACE VIEW listado_pedidos_clientes AS
SELECT c.pk_cliente, CONCAT(c.nombre_contacto, " ", c.apellido_contacto) AS nombre_apellido, c.telefono, c.ciudad, c.pais, pe.pk_pedido,
pe.fecha_pedido, pe.fecha_esperada, pe.fecha_entrega
FROM cliente AS c
LEFT JOIN pedido AS pe ON c.pk_cliente = pe.fk_cliente;

SELECT * FROM listado_pedidos_clientes;

-- 4. Crea una variable de sesión denominada @ciudad. Utiliza la vista que ha creado
-- en el punto 2, para crear una consulta que muestre el listado de los clientes de la
-- ciudad de Madrid que han realizado pagos.
SET @ciudad = 'Madrid';

SELECT * FROM listado_pagos_clientes 
WHERE ciudad = @ciudad AND id_transaccion IS NOT NULL;

-- 5. Cambia el valor de la variable @ciudad a Miami y repite la operación anterior
SET @ciudad = 'Miami';

SELECT * FROM listado_pagos_clientes 
WHERE ciudad = @ciudad AND id_transaccion IS NOT NULL;

-- 6. Crea ocho vistas basadas en las consultas realizadas en el Ejercicio 9 (Consultas
-- Multitabla), cuatro de ellas con los ejercicios que hayas considerado más difíciles
-- de la Base de Datos de nómina y cuatro con los ejercicios que hayas considerado
-- más difíciles de la Base de Datos de jardinería.
USE nomina;
CREATE OR REPLACE VIEW empleados_hijos AS
SELECT e.nombre, e.apellido, TIMESTAMPDIFF(YEAR, e.fecha_nacimiento, CURDATE()) AS edad, c.cargo, d.departamento FROM empleado e
JOIN cargo c ON e.fk_cargo = c.pk_cargo
JOIN departamento d ON e.fk_departamento = d.pk_departamento
WHERE e.estado_civil IN('Soltero', 'Divorciado', 'Viudo') AND e.hijos > 1;

SELECT * FROM empleados_hijos;

CREATE OR REPLACE VIEW empleados_mas_20_anios AS
SELECT e.nombre, e.apellido, e.fecha_contrato, c.cargo, d.departamento FROM empleado AS e
JOIN cargo AS c ON e.fk_cargo = c.pk_cargo
JOIN departamento AS d ON e.fk_departamento = d.pk_departamento
WHERE e.fecha_contrato <= DATE_SUB(CURDATE(), INTERVAL 20 YEAR)
ORDER BY d.departamento ASC, e.fecha_contrato DESC;

SELECT * FROM empleados_mas_20_anios;

CREATE OR REPLACE VIEW empleados_compras_ventas AS
SELECT e.nombre, e.apellido, d.departamento FROM empleado AS e
JOIN departamento AS d ON e.fk_departamento = d.pk_departamento
WHERE d.departamento IN('Compras', 'Ventas');

SELECT * FROM empleados_compras_ventas;

CREATE OR REPLACE VIEW empleados_solteros_sin_hijos AS
SELECT e.nombre, e.apellido, c.cargo, d.departamento FROM empleado e
JOIN cargo c ON e.fk_cargo = c.pk_cargo
JOIN departamento d ON e.fk_departamento = d.pk_departamento
WHERE e.hijos = 0 AND e.estado_civil = 'Soltero';

SELECT * FROM empleados_solteros_sin_hijos;


USE jardineria;

CREATE OR REPLACE VIEW gamas_producto_por_cliente AS
SELECT DISTINCT c.nombre_cliente, g.gama FROM cliente AS c
JOIN pedido AS pe ON c.pk_cliente = pe.fk_cliente
JOIN detalle_pedido AS d ON pe.pk_pedido = d.fk_pedido
JOIN producto AS pr ON pr.pk_producto = d.fk_producto
JOIN gama_producto AS g ON g.pk_gama = pr.fk_gama
ORDER BY c.nombre_cliente ASC;

SELECT * FROM gamas_producto_por_cliente;

CREATE OR REPLACE VIEW clientes_pedidos_retrasados AS
SELECT c.nombre_cliente, COUNT(p.pk_pedido) AS total_pedidos_retrasados FROM cliente AS c
JOIN pedido AS p ON c.pk_cliente = p.fk_cliente
WHERE p.fecha_entrega > p.fecha_esperada OR p.estado IN ('Pendiente', 'Rechazado')
GROUP BY c.nombre_cliente;

SELECT * FROM clientes_pedidos_retrasados;

CREATE OR REPLACE VIEW empleados_jefes AS
SELECT e.nombre AS nombre_empleado, j.nombre AS nombre_jefe FROM empleado AS e
LEFT JOIN empleado AS j ON e.fk_jefe = j.pk_empleado;

SELECT * FROM empleados_jefes;

CREATE OR REPLACE VIEW vista_clientes_representantes_oficina AS
SELECT DISTINCT c.nombre_cliente, e.nombre AS nombre_representante, o.ciudad FROM cliente AS c
JOIN empleado AS e ON c.fk_representante_ventas = e.pk_empleado
JOIN oficina AS o ON o.pk_oficina = e.fk_oficina
WHERE e.puesto = 'Representante Ventas';

SELECT * FROM vista_clientes_representantes_oficina;

-- 7. Elimina la vista listado_pedidos_clientes de la Base de Datos jardineria.

-- DROP VIEW IF EXISTS listado_pedidos_clientes

-- 8. Crea una nueva tabla con el resultado de la vista que te haya resultado más sencilla del Ejercicio 9 (Consultas Multitabla).
USE jardineria;

CREATE OR REPLACE VIEW empleados_jefes AS
SELECT e.nombre AS nombre_empleado, j.nombre AS nombre_jefe FROM empleado AS e
LEFT JOIN empleado AS j ON e.fk_jefe = j.pk_empleado;

SELECT * FROM empleados_jefes;

CREATE TABLE IF NOT EXISTS tabla_empleados_jefes
AS (SELECT * FROM empleados_jefes);

SELECT * FROM tabla_empleados_jefes;


SELECT * FROM cliente;














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




SELECT * FROM cliente;














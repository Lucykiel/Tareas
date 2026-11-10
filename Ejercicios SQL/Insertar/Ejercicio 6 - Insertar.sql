-- tienda.sql

-- inserts tabla fabricante

INSERT INTO fabricante (pk_fabricante, nombre_fabricante) VALUES (1, 'Asus');
INSERT INTO fabricante (pk_fabricante, nombre_fabricante) VALUES (2, 'Lenovo');
INSERT INTO fabricante (pk_fabricante, nombre_fabricante) VALUES (3, 'Hewlett-Packard');
INSERT INTO fabricante (pk_fabricante, nombre_fabricante) VALUES (4, 'Samsung');
INSERT INTO fabricante (pk_fabricante, nombre_fabricante) VALUES (5, 'Seagate');
INSERT INTO fabricante (pk_fabricante, nombre_fabricante) VALUES (6, 'Crucial');
INSERT INTO fabricante (pk_fabricante, nombre_fabricante) VALUES (7, 'Gigabyte');
INSERT INTO fabricante (pk_fabricante, nombre_fabricante) VALUES (8, 'Huawei');
INSERT INTO fabricante (pk_fabricante, nombre_fabricante) VALUES (9, 'Xiaomi');

SELECT * FROM fabricante;

-- inserts tabla producto

INSERT INTO producto (pk_producto, fk_fabricante, nombre_producto, precio) VALUES (1, 5, 'Disco duro SATA3 1TB', 86.99);
INSERT INTO producto (pk_producto, fk_fabricante, nombre_producto, precio) VALUES (2, 6, 'Memoria RAM DDR4 8GB', 120.00);
INSERT INTO producto (pk_producto, fk_fabricante, nombre_producto, precio) VALUES (3, 4, 'Disco SSD 1 TB', 150.99);
INSERT INTO producto (pk_producto, fk_fabricante, nombre_producto, precio) VALUES (4, 7, 'GeForce GTX 1050Ti', 185.00);
INSERT INTO producto (pk_producto, fk_fabricante, nombre_producto, precio) VALUES (5, 3, 'GeForce GTX 1080 Xtreme', 750.00);
INSERT INTO producto (pk_producto, fk_fabricante, nombre_producto, precio) VALUES (6, 1, 'Monitor 24 LED Full HD', 202.00);
INSERT INTO producto (pk_producto, fk_fabricante, nombre_producto, precio) VALUES (7, 1, 'Monitor 27 LED Full HD', 245.91);
INSERT INTO producto (pk_producto, fk_fabricante, nombre_producto, precio) VALUES (8, 2, 'Portátil Yoga 520', 559.00);
INSERT INTO producto (pk_producto, fk_fabricante, nombre_producto, precio) VALUES (9, 2, 'Portátil Ideapd 320', 444.00);
INSERT INTO producto (pk_producto, fk_fabricante, nombre_producto, precio) VALUES (10, 3, 'Impresora HP Deskjet 3720', 59.99);
INSERT INTO producto (pk_producto, fk_fabricante, nombre_producto, precio) VALUES (11, 3, 'Impresora HP Laserjet Pro M26nw', 180.00);

SELECT * FROM producto;





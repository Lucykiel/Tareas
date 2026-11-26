USE plataforma_steam;

SELECT u.alias, cs.titulo, ev.nombre_estado 
FROM catalogo_usuarios AS cu
JOIN usuarios AS u ON u.pk_usuario = fk_usuario
JOIN catalogo_steam AS cs ON cs. pk_videojuego = cu.fk_videojuego
JOIN estado_videojuego_usuarios AS ev ON ev.pk_estado = cu.fk_estado;


SELECT pk_logro, fk_videojuego, nombre_logro, descripción, CONCAT(TRIM(TRAILING '0' FROM TRIM(TRAILING '.' FROM CAST(rareza_global AS CHAR))), '%') AS rareza_global
FROM logros;










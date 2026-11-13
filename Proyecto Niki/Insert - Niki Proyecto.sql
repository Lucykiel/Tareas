INSERT INTO estado_videojuego_usuarios (pk_estado, nombre_estado)
VALUES
(1, 'Cinta Azul'), (2, 'Terminado'), (3, 'Pendiente'), (4, 'Oculto'), (5, 'No Instalado'), (6, 'Wishlist');

SELECT * FROM estado_videojuego_usuarios;

INSERT INTO usuarios (pk_usuario, alias, pais)
VALUES
(1, 'Lucykiel', 'Peru'), (2, 'KiritoSwords', 'España'), (3, 'Alexandro', 'Argentina'), (4, 'VortexApex', 'Australia'), (5, 'EldritchBlade', 'Bélgica'),
(6, 'Error404Player', 'Brasil'), (7, 'NeonPulse', 'Canadá'), (8, 'ZenithGamer', 'Chile'), (9, 'MythicRider', 'Corea del Sur'),
(10, 'Afk_Tacos', 'México'), (11, 'GlitchWave', 'Egipto'), (12, 'AlphaPhantom', 'Filipinas'), (13, 'RoninGhost', 'Japón'),
(14, 'Procrastinador', 'Kazajistán'), (15, 'Dystopia_x', 'Noruega');

SELECT * FROM usuarios;

INSERT INTO catalogo_steam (titulo, desarrollador, fecha_lanzamiento, almacenamiento, precio_base)
VALUES
('Elden Ring', 'FromSoftware', '2022-02-25', '60 GB', 59.99), ('Baldur''s Gate 3', 'Larian Studios', '2023-08-03', '150 GB', 59.99),
('Stardew Valley', 'ConcernedApe', '2016-02-26', '500 MB', 13.99);

SELECT * FROM catalogo_steam;
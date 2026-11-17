INSERT INTO estado_videojuego_usuarios
(pk_estado, nombre_estado)
VALUES
(1, 'Cinta Azul'),
(2, 'Terminado'),
(3, 'Pendiente'),
(4, 'Oculto'),
(5, 'No Instalado'),
(6, 'Wishlist');

SELECT * FROM estado_videojuego_usuarios;


INSERT INTO usuarios
(pk_usuario, alias, pais)
VALUES
(1, 'Lucykiel', 'Peru'),
(2, 'KiritoSwords', 'España'),
(3, 'Alexandro', 'Argentina'),
(4, 'VortexApex', 'Australia'),
(5, 'EldritchBlade', 'Bélgica'),
(6, 'Error404Player', 'Brasil'),
(7, 'NeonPulse', 'Canadá'),
(8, 'ZenithGamer', 'Chile'),
(9, 'MythicRider', 'Corea del Sur'),
(10, 'Afk_Tacos', 'México'),
(11, 'GlitchWave', 'Egipto'),
(12, 'AlphaPhantom', 'Filipinas'),
(13, 'RoninGhost', 'Japón'),
(14, 'Procrastinador', 'Kazajistán'),
(15, 'Dystopia_x', 'Noruega');

SELECT * FROM usuarios;


INSERT INTO catalogo_steam
(titulo, desarrollador, fecha_lanzamiento, almacenamiento, precio_base)
VALUES
('Elden Ring', 'FromSoftware', '2022-02-25', '60 GB', 59.99),
('Baldur''s Gate 3', 'Larian Studios', '2023-08-03', '150 GB', 59.99),
('Stardew Valley', 'ConcernedApe', '2016-02-26', '500 MB', 13.99),
('Monster Hunter Rise', 'CAPCOM Co., Ltd.', '2022-01-12', '23 GB', 39.99),
('Bloons TD 6', 'Ninja Kiwi', '2018-12-18', '2 GB', 13.99),
('Cyberpunk 2077', 'CD PROJEKT RED', '2020-12-09', '70 GB', 59.99),
('Terraria', 'Re-Logic', '2011-05-16', '500 MB', 9.99),
('Hades', 'Supergiant Games', '2020-09-17', '20 GB', 24.99),
('Hollow Knight', 'Team Cherry', '2017-02-24', '9 GB', 14.99),
('Grand Theft Auto V', 'Rockstar Games', '2015-04-14', '110 GB', 29.99),
('Portal 2', 'Valve', '2011-04-19', '8 GB', 9.99),
('Left 4 Dead 2', 'Valve', '2009-11-16', '13 GB', 9.99),
('Portal', 'Valve', '2007-10-10', '15 GB', 9.99),
('Dying Light', 'Techland', '2015-01-27', '40 GB', 24.99),
('Vampire Survivors', 'poncle', '2022-10-20', '1 GB', 4.99),
('Half-Life 2', 'Valve', '2004-11-16', '7 GB', 9.99),
('Subnautica', 'Unknown Worlds Entertainment', '2018-01-23', '20 GB', 29.99),
('Crypt of the NecroDancer', 'Brace Yourself Games', '2015-04-23', '3 GB', 14.99),
('The Witcher 3: Wild Hunt', 'CD PROJEKT RED', '2015-05-18', '50 GB', 39.99),
('Slay the Spire', 'MegaCrit', '2019-01-23', '2 GB', 22.99),
('RimWorld', 'Ludeon Studios', '2018-10-17', '1 GB', 31.99),
('Factorio', 'Wube Software', '2020-08-14', '3 GB', 31.99),
('Deep Rock Galactic', 'Ghost Ship Games', '2020-05-13', '3 GB', 29.99),
('Disco Elysium', 'ZA/UM', '2019-10-15', '22 GB', 39.99),
('Celeste', 'Maddy Makes Games', '2018-01-25', '1 GB', 19.99),
('Phasmophobia', 'Kinetic Games', '2020-09-18', '21 GB', 13.99),
('Risk of Rain 2', 'Hopoo Games', '2020-08-11', '4 GB', 24.99),
('The Binding of Isaac: Rebirth', 'Nicalis, Inc.', '2014-11-04', '500 MB', 14.99),
('Cookie Clicker', 'Orteil', '2021-09-01', '200 MB', 4.99);


SELECT * FROM catalogo_steam;






INSERT IGNORE INTO estado_videojuego_usuarios
(pk_estado, nombre_estado)
VALUES
(1, 'Cinta Azul'),
(2, 'Terminado'),
(3, 'Pendiente'),
(4, 'Oculto'),
(5, 'No Instalado'),
(6, 'Wishlist');

SELECT * FROM estado_videojuego_usuarios;


INSERT IGNORE INTO usuarios
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


INSERT IGNORE INTO catalogo_steam
(titulo, desarrollador, fecha_lanzamiento, almacenamiento, precio_base)
VALUES
('Elden Ring', 'FromSoftware', '2022-02-25', '60 GB', 59.99),
('Baldur''s Gate 3', 'Larian Studios', '2023-08-03', '150 GB', 59.99),
('Stardew Valley', 'ConcernedApe', '2016-02-26', '500 MB', 13.99),
('Monster Hunter Rise', 'CAPCOM Co., Ltd.', '2022-01-12', '23 GB', 39.99),
('Fallout: New Vegas', 'Obsidian Entertainment', '2010-10-19', '10 GB', 9.99),
('Cyberpunk 2077', 'CD PROJEKT RED', '2020-12-09', '70 GB', 59.99),
('Terraria', 'Re-Logic', '2011-05-16', '500 MB', 9.99),
('Hades', 'Supergiant Games', '2020-09-17', '20 GB', 24.99),
('To the Moon', 'Freebird Games', '2011-11-01', '500 MB', 9.99),
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
('Cookie Clicker', 'Orteil', '2021-09-01', '200 MB', 4.99),
('Brotato', 'Blobfish', '2022-10-20', '250 MB', 4.99),
('Papers, Please', '3909', '2013-08-08', '100 MB', 9.99),
('Code Vein', 'Bandai Namco Entertainment', '2019-09-26', '35 GB', 59.99),
('Monster Hunter Wilds', 'CAPCOM Co., Ltd.', '2025-02-27', '145 GB', 69.99),
('Hades II', 'Supergiant Games', '2025-09-25', '11 GB', 29.99),
('Monster Hunter World', 'CAPCOM Co., Ltd.', '2018-08-09', '48 GB', 29.99),
('Halo: The Master Chief Collection', 'Xbox Game Studios', '2019-12-03', '300 GB', 39.99),
('Cities: Skylines', 'Colossal Order', '2015-03-10', '4 GB', 29.99),
('Among Us', 'Innersloth', '2018-11-16', '250 MB', 4.99),
('Garry''s Mod', 'Facepunch Studios', '2006-11-29', '5 GB', 9.99),
('God of War', 'Jetpack Interactive', '2022-01-14', '70 GB', 49.99),
('Red Dead Redemption 2', 'Rockstar Games', '2019-12-05', '150 GB', 59.99),
('Dead Cells', 'Motion Twin', '2018-08-07', '2 GB', 24.99),
('Project Zomboid', 'The Indie Stone', '2013-11-08', '5 GB', 19.99),
('The Forest', 'Endnight Games', '2018-04-30', '5 GB', 19.99),
('Satisfactory', 'Coffee Stain Studios', '2024-09-10', '15 GB', 39.99),
('Don''t Starve Together', 'Klei Entertainment', '2016-04-21', '3 GB', 14.99),
('A Way Out', 'Hazelight Studios', '2018-03-23', '25 GB', 29.99),
('Barotrauma', 'FakeFish', '2023-03-13', '1 GB', 29.99),
('Ori and the Blind Forest', 'Moon Studios', '2015-03-11', '8 GB', 19.99),
('BattleBit Remastered', 'SgtOkiDoki', '2023-06-15', '2 GB', 14.99),
('Slime Rancher', 'Monomi Park', '2017-08-01', '1 GB', 19.99),
('Schedule I', 'Greenhouse Games', '2023-05-12', '4 GB', 12.99),
('Super Meat Boy', 'Team Meat', '2010-11-30', '300 MB', 14.99),
('Amnesia: The Dark Descent', 'Frictional Games', '2010-09-08', '3 GB', 19.99),
('Hollow Knight', 'Team Cherry', '2017-02-24', '9 GB', 14.99),
('GRIS', 'Nomada Studio', '2018-12-13', '4 GB', 16.99),
('Stellaris', 'Paradox Development Studio', '2016-05-09', '10 GB', 39.99),
('Cities: Skylines II', 'Colossal Order', '2023-10-24', '60 GB', 49.99),
('Mount & Blade II: Bannerlord', 'TaleWorlds Entertainment', '2022-10-25', '60 GB', 49.99),
('Outer Wilds', 'Mobius Digital', '2020-06-18', '8 GB', 22.99),
('Metro Exodus', '4A Games', '2019-02-15', '59 GB', 39.99),
('BioShock Infinite', 'Irrational Games', '2013-03-26', '30 GB', 29.99),
('Cuphead', 'Studio MDHR', '2017-09-29', '4 GB', 19.99),
('Dark Souls III', 'FromSoftware', '2016-04-12', '25 GB', 39.99),
('Bloons TD 6', 'Ninja Kiwi', '2018-12-18', '2 GB', 13.99),
('Mirror''s Edge', 'DICE', '2009-01-13', '8 GB', 9.99),
('Age of Empires II: Definitive Edition', 'Forgotten Empires', '2019-11-14', '30 GB', 19.99),
('Terraria Otherworld', 'Re-Logic', '2015-02-17', '1 GB', 9.99),
('Just Cause 3', 'Avalanche Studios', '2015-12-01', '54 GB', 19.99),
('Nine Sols', 'Red Candle Games', '2024-05-29', '20 GB', 29.99),
('Detroit: Become Human', 'Quantic Dream', '2020-06-18', '55 GB', 39.99),
('Grand Theft Auto IV', 'Rockstar Games', '2008-12-02', '22 GB', 19.99),
('Left 4 Dead', 'Valve', '2008-11-17', '7 GB', 9.99),
('Spore', 'Maxis', '2008-12-19', '6 GB', 19.99),
('Titan Quest', 'Iron Lore Entertainment', '2006-06-26', '5 GB', 19.99),
('Balatro', 'LocalThunk', '2024-02-20', '150 MB', 14.99),
('Mafia: Definitive Edition', 'Hangar 13', '2020-09-25', '50 GB', 39.99),
('Borderlands 2', 'Gearbox Software', '2012-09-18', '13 GB', 19.99),
('XCOM 2', 'Firaxis Games', '2016-02-05', '45 GB', 49.99),
('Cities in Motion', 'Colossal Order', '2011-02-22', '2 GB', 19.99),
('Euro Truck Simulator 2', 'SCS Software', '2012-10-19', '25 GB', 19.99),
('Outlast', 'Red Barrels', '2013-09-04', '30 GB', 19.99),
('The Stanley Parable', 'Cavedog / Galactic Cafe', '2013-10-17', '3 GB', 14.99),
('Hotline Miami', 'Dennaton Games', '2012-10-23', '500 MB', 9.99),
('Doom', 'id Software', '2016-05-13', '55 GB', 19.99),
('Battlefield 1', 'DICE', '2016-10-21', '50 GB', 39.99),
('Tails of Iron', 'Odd Bug Studio', '2021-09-17', '2 GB', 24.99),
('Tails of Iron 2: Whiskers of Winter', 'Odd Bug Studio', '2025-01-28', '6 GB', 24.99),
('Dead Space', 'Visceral Games', '2008-10-20', '10 GB', 19.99),
('Subnautica: Below Zero', 'Unknown Worlds Entertainment', '2021-05-14', '15 GB', 29.99),
('Plants vs. Zombies: Game of the Year', 'PopCap Games, Inc.', '2009-05-05', '650 MB', 4.99),
('Risk of Rain Returns', 'Hopoo Games', '2023-11-08', '500 MB', 14.99),
('Grim Dawn', 'Crate Entertainment', '2016-02-25', '5 GB', 24.99),
('Cat Quest', 'The Gentlebros', '2017-08-08', '1 GB', 12.99),
('Cat Quest II', 'The Gentlebros', '2019-09-24', '2 GB', 14.99),
('Cat Quest III', 'The Gentlebros', '2024-08-08', '1 GB', 19.99),
('Age of Mythology: Retold', 'World Edge', '2024-09-04', '25 GB', 49.99),
('The Binding of Isaac', 'Edmund McMillen', '2011-09-28', '50 MB', 4.99),
('Chained Together', 'Anegar Games', '2024-06-19', '6 GB', 4.99),
('Kingdom Two Crowns', 'Raw Fury', '2018-12-11', '1 GB', 19.99);

SELECT * FROM catalogo_steam;


INSERT IGNORE INTO logros
(fk_videojuego, nombre_logro, descripción, rareza_global)
VALUES
(1, 'Margit, el Aojo Cruel', 'Derrotaste a Margit, el Aojo Cruel.', 71.0),
(1, 'Portafragmentos Godric', 'Derrotaste al portafragmentos Godric.', 65.1),
(2, 'Fuga de Averno', 'Toma el control del nautiloide y escapa de los Infiernos.', 89.0),
(2, 'Juego de rol', 'Completa diez objetivos de trasfondo en una sola partida: eres uno con tu personaje.', 56.9),
(3, 'Multimillonario', 'Consigue un patrimonio neto de 10.000.000 de granos.', 8.9),
(3, 'Maestro de la granja', 'Completa todos los lotes del Centro Cívico.', 15.3),
(4, 'Trofeo heroico', 'La enseña de un gran héroe que ha conseguido un gran número de recompensas', 0.7),
(4, 'Escudo de corona de oro', 'Se concede por registrar casi todos los monstruos dignos de la corona de oro', 1.0),
(5, 'Solo para profesionales', 'Has completado tres desafíos de tres estrellas cualquiera del Gun Runners'' Arsenal (GRA).', 1.9),
(5, 'Superviviente del desierto', 'Has curado 10.000 puntos de daño con comida.', 3.4),
(6, 'El camino a la gloria', 'Completa todas las misiones secundarias de la trama principal de los PNJ de apoyo.', 12.4),
(6, 'Te lo tengo guardado', 'Consigue todos los vehículos que se pueden comprar.', 5.8),
(7, '¡Timber!', 'Derrota al Ojo de Cthulhu por primera vez.', 65.2),
(7, 'Mejor imposible', 'Consigue el equipamiento definitivo de armadura y herramientas.', 4.1),
(8, 'Amigos para siempre', 'Consigue el nivel máximo de todos los recuerdos estándar.', 5.9),
(8, 'Colección completa', 'Consigue todos los compañeros ctónicos.', 6.7),
(9, 'Wish Granted', 'Envía a Johnny a la luna.', 61.8),
(10, 'Cerebros', 'GTA Online: completa los 3 desafíos Cerebro delictivo de Golpe del Juicio Final.', 1.3),
(10, 'Elitista', 'GTA Online: completa los 3 desafíos de élite de Golpe del Juicio Final.', 1.3),
(11, 'Sigo vivo', 'Completa el circuito 4 sin que muráis ni tú ni tu compañero de equipo.', 2.4),
(11, 'Concurso de talentos', 'No pierdas ningún cubo en la cámara 6 del circuito cooperativo de geles de movilidad.', 2.7);

SELECT * FROM logros;


INSERT IGNORE INTO catalogo_usuarios
(fk_usuario, fk_videojuego, fk_estado)
VALUES
(1, 4, 1),
(1, 5, 3),
(1, 12, 2),
(1, 14, 6),
(1, 15, 1),
(1, 18, 4),
(1, 29, 3),
(1, 32, 1),
(1, 36, 2),
(1, 55, 3),
(1, 70, 1),
(1, 76, 4),
(1, 82, 5),
(1, 87, 1),
(1, 95, 3);

SELECT * FROM catalogo_usuarios;




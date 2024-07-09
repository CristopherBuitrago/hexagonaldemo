-- insert of data

-- insert permissions
INSERT INTO permission(description) VALUES
("Gestion de equipos"),
("Gestion de jugadores"),
("Programacion de partidos"),
("Registro de resultados"), 
("Visualización de estadísticas"),
("Gestión de noticias y comunicados"),
("Gestión de entrenadores"),
("Gestión de entrenadores"),
("Gestión de arbitros"),
("Gestión de estadios"),
("Venta de entradas"),
("Gestion de patrocinios"),
("Generacion de informes"),
("Gestión de incidentes y sanciones"),
("Consulta de calendario de partidos"),
("Gestión de medios de comunicación"),
("Gestión de lesiones de jugadores"),
("Gestion de entrenamientos"),
("Seguimiento de rendimiento de jugadores"),
("Gestion de transferencia de jugadores"),
("Gestion de equipamiento"),
("Gestion de convocatorias de jugadores"),
("Gestion de premios y reconocimientos"),
("Gestión de usuarios y roles"),
("Gestion de patrocinadores y publicidad"),
("Gestion de relaciones publicas");

-- insert roles
INSERT INTO role(name) VALUES
("Administrador de la liga"),
("Equipo técnico"),
("Arbitro"),
("Aficionado"),
("Periodista"),
("Medico del equipo");

-- insert permission to roles
INSERT INTO role_has_permission(role, permission) VALUES
-- administrador de la liga
(1,1),
(1,2),
(1,3),
(1,4),
(1,6),
(1,7),
(1,8),
(1,9),
(1,11),
(1,12),
(1,13),
(1,15),
(1,19),
(1,20),
(1,22),
(1,23),
(1,24),
(1,25),
-- equipo técnico
(2,2),
(2,5),
(2,7),
(2,12),
(2,14),
(2,16),
(2,17),
(2,18),
(2,19),
(2,20),
(2,21),
-- arbitro
(3,4),
(3,13),
-- aficionado
(4,5),
(4,10),
(4,14),
-- periodista
(5,5),
(5,6),
(5,14),
(5,15),
(5,25),
-- medico del equipo
(6,16);

-- insert card types
INSERT INTO card_type(color, description) VALUES
("Amarilla", "El jugador tuvo una falta leve por comprotamiento, puede ser tanto fisico como verbal."),
("Roja", "El jugador cometió una falta grave por comportamiento, puede ser tanto fisico como verbal.");

-- insert injury_severity
INSERT INTO injury_severity (name, description) VALUES
("Leve", "Ejemplos: moretones, etc; El jugador se recuperará en poco tiempo, con un poco de cuidado y atención es suficiente."),
("Media", "Ejemplos: hinchazón, golpes moderados, etc; El jugador se recuperará en el transcurso de las semanas."),
("Grave", "Ejemplos: Desgarres, fracturas, etc; El jugadro tendrá incapacidad hasta su recuperación. Podrán ser meses o semanas.");

-- insert injury_type
INSERT INTO injury_type (type, description) VALUES
("Fisica", "La lesion fue recibida en el cuerpo o parte de este.");

-- insert position
INSERT INTO position (name, description) VALUES
("Portero", "Se encarga de que la pelota no entre al arco."),
("Defensa", "Intenta detener al equipo enemigo para que no llegue al arco de su equipo."),
("Medio Campista", "Se encarga de ayudar a delanteros y defensores, están en un punto estratégico para que su movilidad de facilite."),
("Delantero", "Es el que se encarga de intentar anotar goles en la porteria enemiga para así asegurar su victoria.");

-- insert activity
INSERT INTO activity (title, description, duration) VALUES
("Actividad física", "Con la actividad física nos aseguramos de mejorar la resistencia y el físico de nuestros jugadores para obtener mayor ventaja frente equipos enemigos.", "2:00"),
("Actividad estratégica", "Estudios de diferentes estratégias para aplicarlas en partidos", "2:00"),
("Actividad psicológica", "Se centra en estudiar los movimientos del equipo enemigo para obtener más ventaja", "2:00");
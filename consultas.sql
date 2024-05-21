USE filtroMYSQL;

SHOW TABLES;

-- Consulta de Todos los Eventos en un Complejo Deportivo Específico.

SELECT E.nombre
FROM evento_complejo_poli AS ECP
INNER JOIN complejo_polideportivo AS CP ON ECP.id_complejo =  CP.id_complejo_polideportivo
INNER JOIN eventos AS E ON ECP.id_evento = E.id_evento
WHERE ECP.id_complejo = 8 --asigno un complejo ya que no nos dan uno para la consulta
;

-- Consulta de Comisarios Asignados a un Evento en Particular.

SELECT C.nombre
FROM evento_comisario AS EC
INNER JOIN comisario AS C ON EC.id_comisario = C.id_comisario
WHERE EC.id_evento = 3; --asigno un comisario ya que no nos dan uno para la consulta

-- Consulta de Todos los Eventos en un Rango de Fechas.

SELECT nombre
FROM eventos 
WHERE "2023-02-10 10:00:00" < fecha AND "2025-01-01 10:00:00" > fecha;
-- no nos dan fechas entonces damos una generica

-- Consulta del Número Total de Comisarios Asignados a Eventos.

SELECT COUNT(id_comisario)
FROM evento_comisario;

-- Consulta de Complejos Polideportivos con Área Total Ocupada Superior a un Valor Específico.

SELECT CP.nombre
FROM info_complejo AS IC
INNER JOIN complejo_polideportivo AS CP ON IC.id_complejo = CP.id_info_complejo
WHERE area_complejo > 10
GROUP BY CP.id_complejo_polideportivo;

-- Consulta de Eventos con Número de Participantes Mayor que la Media.

SELECT nombre
FROM eventos
WHERE num_participantes <
(SELECT AVG(num_participantes)
FROM eventos);

-- Consulta de Equipamiento Necesario para un Evento Específico.

SELECT E.nombre_equipos 
FROM evento_equipo AS EE
INNER JOIN equipamiento AS E ON EE.id_equipamiento = E.id_equipamiento
WHERE EE.id_evento = 3; -- se asigna valor arbitrario

-- Consulta de Eventos Celebrados en Complejos Deportivos con Jefe de Organización Específico.

SELECT E.nombre, J.nombre
FROM evento_complejo_deportivo AS ECD 
INNER JOIN complejo_deportivo AS CD ON ECD.id_complejo = CD.id_complejo_deportivo
INNER JOIN info_complejo AS IC ON CD.id_info_complejo = IC.id_complejo
INNER JOIN jefes AS J ON IC.id_jefe = J.id_jefe
INNER JOIN eventos AS E ON ECD.id_evento = E.id_evento
WHERE J.id = 3;

-- Consulta de Complejos Polideportivos sin Eventos Celebrados.


SELECT nombre
FROM complejo_polideportivo
WHERE id_complejo_polideportivo NOT IN
(SELECT id_complejo
FROM evento_complejo_poli);

-- Consulta de Comisarios que Actúan como Jueces en Todos los Eventos.

SELECT C.nombre
FROM evento_comisario AS EC
INNER JOIN comisario AS C ON EC.id_comisario = C.id_comisario;
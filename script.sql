# FILTRO - 1 MYSQL

#Creacion del script de la base de datos

DROP SCHEMA IF EXISTS filtroMYSQL;
CREATE SCHEMA filtroMYSQL;

USE filtroMYSQL;

CREATE TABLE jefes(
    id_jefe INT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    titulo VARCHAR(100)
);

CREATE TABLE deportes(
    id_deporte INT PRIMARY KEY,
    nombre VARCHAR(100),
    num_jugadores INT
);

CREATE TABLE comisario(
    id_comisario INT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    telefono VARCHAR(20),
    tipo VARCHAR(10)
);

CREATE TABLE eventos(
    id_evento INT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha DATETIME,
    duracion TIME,
    num_participantes INT
);

CREATE TABLE equipamiento(
    id_equipamiento INT PRIMARY KEY,
    nombre_equipos VARCHAR(100),
    stock INT
);

CREATE TABLE evento_comisario(
    id_evento_comisario INT PRIMARY KEY,
    id_evento INT,
    id_comisario INT,
    FOREIGN KEY (id_evento) REFERENCES eventos(id_evento),
    FOREIGN KEY (id_comisario) REFERENCES comisario(id_comisario)
);

CREATE TABLE evento_equipo(
    id_evento_equipo INT PRIMARY KEY,
    id_evento INT,
    id_equipamiento INT,
    FOREIGN KEY (id_evento) REFERENCES eventos(id_evento),
    FOREIGN KEY (id_equipamiento) REFERENCES equipamiento(id_equipamiento)
);

CREATE TABLE info_complejo(
    id_complejo INT PRIMARY KEY,
    locacion VARCHAR(100),
    area_complejo FLOAT,
    id_jefe INT,
    FOREIGN KEY (id_jefe) REFERENCES jefes(id_jefe)
);


CREATE TABLE complejo_deportivo(
    id_complejo_deportivo INT PRIMARY KEY,
    nombre VARCHAR(100),
    id_deporte INT,
    id_info_complejo INT,
    FOREIGN KEY (id_deporte) REFERENCES deportes(id_deporte),
    FOREIGN KEY (id_info_complejo) REFERENCES info_complejo(id_complejo)
);

CREATE TABLE evento_complejo_deportivo(
    id_evento_complejo_deportivo INT PRIMARY KEY,
    id_evento INT,
    id_complejo INT,
    FOREIGN KEY (id_evento) REFERENCES eventos(id_evento),
    FOREIGN KEY (id_complejo) REFERENCES complejo_deportivo(id_complejo_deportivo)
);

CREATE TABLE complejo_polideportivo(
    id_complejo_polideportivo INT PRIMARY KEY,
    nombre VARCHAR(100),
    id_deporte INT,
    id_info_complejo INT,
    FOREIGN KEY (id_deporte) REFERENCES deportes(id_deporte),
    FOREIGN KEY (id_info_complejo) REFERENCES info_complejo(id_complejo)
);

CREATE TABLE evento_complejo_poli(
    id_evento_complejo INT PRIMARY KEY,
    id_evento INT,
    id_complejo INT,
    FOREIGN KEY (id_evento) REFERENCES eventos(id_evento),
    FOREIGN KEY (id_complejo) REFERENCES complejo_polideportivo(id_complejo_polideportivo)
);

CREATE TABLE sede(
    id_sede INT PRIMARY KEY,
    nombre VARCHAR(100),
    id_complejo INT,
    presupuesto FLOAT,
    FOREIGN KEY (id_complejo) REFERENCES complejo_polideportivo(id_complejo_polideportivo)
);




# Desarrollado por Santiago Sandoval CC 1 XXXXXXXX 789
CREATE TABLE gimnasio(
id_gimnasio INTEGER PRIMARY KEY AUTOINCREMENT,
nombre VARCHAR(30) NOT NULL,
direccion VARCHAR(30) NOT NULL,
hora_apertura TIME NOT NULL,
hora_cierre TIME NOT NULL,
correo VARCHAR (20) NOT NULL,
telefono INTEGER NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE equipamiento(
id_equipamiento INTEGER PRIMARY KEY AUTOINCREMENT,
marca VARCHAR(20) NOT NULL,
ejercicio VARCHAR(30) NOT NULL,
tipo_ejercicio VARCHAR(20) NOT NULL);
CREATE TABLE IF NOT EXISTS "gimnasio_equipamiento"(
id_gimnasio INTEGER,
id_equipamiento INTEGER,
PRIMARY KEY(id_gimnasio, id_equipamiento),
FOREIGN KEY(id_gimnasio) REFERENCES gimnasio (id_gimnasio) ON DELETE CASCADE,
FOREIGN KEY (id_equipamiento) REFERENCES equipamiento(id_equipamiento) ON DELETE CASCADE);
CREATE TABLE empleado(
documentacion varchar(9) PRIMARY KEY,
nombre varchar(25) NOT NULL,
apellido varchar(25) NOT NULL,
labor varchar(30) NOT NULL);
CREATE TABLE cliente(
documentacion varchar(9) PRIMARY KEY,
nombre varchar(25) NOT NULL,
apellido varchar(25) NOT NULL,
fecha_nacimiento DATE NOT NULL,
IBAN varchar(34) NOT NULL,
fecha_inscripcion DATE NOT NULL,
modelo varchar(10),
FOREIGN KEY (modelo) REFERENCES suscripcion(modelo) ON DELETE CASCADE);
CREATE TABLE actividad(
id_actividad integer PRIMARY KEY AUTOINCREMENT,
tipo varchar(30) NOT NULL,
duracion TIME NOT NULL,
aforo integer NOT NULL,
numero_sala integer NOT NULL,
id_gimnasio integer,
documentacion VARCHAR(9),
fecha DATE NOT NULL,
UNIQUE (id_actividad,fecha),
FOREIGN KEY (id_gimnasio) REFERENCES gimnasio(id_gimnasio) ON DELETE CASCADE,
FOREIGN KEY (documentacion) REFERENCES empleado(documentacion) ON DELETE CASCADE);
CREATE TABLE suscripcion(
modelo varchar(10) PRIMARY KEY,
precio integer NOT NULL,
permanencia VARCHAR(10) NOT NULL,
matricula integer NOT NULL);
CREATE TABLE IF NOT EXISTS "gimnasio_cliente"(
id_gimnasio INTEGER,
documentacion VARCHAR(9),
PRIMARY KEY(id_gimnasio, documentacion),
FOREIGN KEY(id_gimnasio) REFERENCES gimnasio (id_gimnasio) ON DELETE CASCADE,
FOREIGN KEY (documentacion) REFERENCES cliente(documentacion) ON DELETE CASCADE);
CREATE TABLE IF NOT EXISTS "gimnasio_empleado"(
id_gimnasio INTEGER,
documentacion VARCHAR(9),
PRIMARY KEY(id_gimnasio, documentacion),
FOREIGN KEY(id_gimnasio) REFERENCES gimnasio (id_gimnasio) ON DELETE CASCADE,
FOREIGN KEY (documentacion) REFERENCES empleado(documentacion) ON DELETE CASCADE);
CREATE TABLE IF NOT EXISTS "actividad_cliente"(
id_actividad INTEGER,
documentacion VARCHAR(9),
PRIMARY KEY(id_actividad, documentacion),
FOREIGN KEY(id_actividad) REFERENCES actividad (id_actividad) ON DELETE CASCADE,
FOREIGN KEY (documentacion) REFERENCES cliente(documentacion) ON DELETE CASCADE);


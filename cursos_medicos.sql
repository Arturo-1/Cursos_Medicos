CREATE DATABASE Cursos_Medicos;
USE Cursos_Medicos;

CREATE TABLE Doctores( 
Id_Doctor int primary key not null auto_increment, 
Nombre varchar(70),
Apellidos varchar(70),
Telefono int,
Direccion varchar(150),
Correo varchar(80),
Cedula_Profecional varchar(50),
Id_Especialidad int not null
);

CREATE TABLE Especialidades( 
Id_Especialidad int primary key not null auto_increment, 
Nombre varchar(70),
Descripcion varchar(150));

CREATE TABLE Alumnos( 
Id_Alumno int primary key not null auto_increment, 
Nombre varchar(50), 
Apellidos varchar(80),  
Telefono int, 
Direccion varchar(200), 
Correo varchar(80),
Id_Alumno_Curso int not null
);

CREATE TABLE Cursos( 
Id_Curso int primary key not null auto_increment, 
Nombre_Curso varchar(50), 
Costo int,  
Fecha_Inicio date, 
Fecha_Fin date,
Id_Temario int not null,
Id_Turno int not null,
Id_Calificacion int not null
);

CREATE TABLE Temario( 
Id_Temario int primary key not null auto_increment, 
Nombre varchar(80),
Descripcion varchar(150)
);

CREATE TABLE Asistencia ( 
Id_Asistencia int primary key not null auto_increment, 
Fecha_Asistencia datetime,
Id_Alumno_Curso int not null,
Id_Curso int not null
);

CREATE TABLE Modalidad_Curso(
Id_Modalidad_Curso int primary key not null auto_increment,
Tipo_Modalidad varchar(50),
Id_Curso int not null
);

CREATE TABLE Comentarios(
Id_Comentario int primary key not null auto_increment,
Comentario varchar(200),
Id_Curso int not null,
Id_Alumno int not null,
Id_Doctor int not null
);

CREATE TABLE Turno(
Id_Turno int primary key not null auto_increment,
Turno varchar(50)
);

CREATE TABLE Alumno_Curso(
Id_Alumno_Curso int primary key not null auto_increment,
calificacion float(10),
Id_curso int not null,
Id_Alumno int not null
);


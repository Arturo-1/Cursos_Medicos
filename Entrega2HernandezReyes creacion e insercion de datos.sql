CREATE DATABASE Cursos_Medicos;
USE Cursos_Medicos;

CREATE TABLE Doctores( 
Id_Doctor int primary key not null auto_increment, 
Nombre varchar(70),
Apellidos varchar(70),
Telefono varchar(12),
Direccion varchar(150),
Correo varchar(80),
Cedula_Profecional varchar(40),
Id_Especialidad int not null
);

CREATE TABLE Especialidades( 
Id_Especialidad int primary key not null auto_increment, 
Nombre_esp varchar(70),
Descripcion varchar(150));

CREATE TABLE Alumnos( 
Id_Alumno int primary key not null auto_increment, 
Nombre varchar(50), 
Apellidos varchar(80),  
Telefono varchar(12), 
Direccion varchar(200), 
Correo varchar(80),
Id_Alumno_Curso int not null
);

CREATE TABLE Cursos( 
Id_Curso int primary key not null auto_increment, 
Nombre_Curso varchar(70), 
Costo int,  
Fecha_Inicio date, 
Fecha_Fin date,
Id_Temario int not null,
Id_Turno int not null
);

CREATE TABLE Temario( 
Id_Temario int primary key not null auto_increment, 
Nombre varchar(120),
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
Id_Alumno int,
Id_Doctor int,
fecha_comment timestamp default current_timestamp
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

CREATE table log_comment(
		log_id int auto_increment primary key not null,
		id_comentario int,
		usuario varchar(100), 
		fecha date,
		Hora time
		);
CREATE table logs_Calif(
		log_id int auto_increment primary key not null,
        calificacion int,
		usuario varchar(100), 
		fecha date,
		Hora time
		);

insert into especialidades(nombre_esp,descripcion) values (
'Pediatria','Rama de la medicina que se especializa en la salud y las enfermedades de los niños'),
('Cardiología','Rama de la medicina que se especiliza en el diagnóstico y tratamiento de enfermedades del corazón, los vasos sanguíneos y el sistema circulatorio'),
('Enfermeria','abarca el cuidado autónomo y colaborativo de personas de todas las edades, familias, grupos y comunidades, enfermos o sanos y en todos los entornos'),
('Medicina Familiar','es la especialidad que brinda atención médica continua e integral para el individuo y la familia.'),
('Endocrinología','Es una subespecialidad de medicina interna.'),
('Neumología','Tratan el sistema cardíaco-pulmonar, consiste en los órganos que trabajan juntos para ayudar a que la respire, como el corazón y los pulmones'),
('Neurología','Los neurólogos son los que tratan a los pacientes con condiciones que afectan al cerebro, espina vertebral o nervios'),
('Patología','La patología estudia las causas y la naturaleza de una enfermedad en particular'),
('Medicina física y rehabilitación','Ayudan a los pacientes con deshabilitación del cerebro, columna vertebral, nervios, huesos, articulaciones, ligamentos, músculos y tendones'),
('Otorrinolaringólogo',' son médicos que se especializan en el diagnóstico y el tratamiento de enfermedades o afecciones del oído, la nariz y la garganta');

insert into doctores(nombre,apellidos,telefono,direccion,correo,cedula_profecional,id_especialidad) values (
'Arturo','Hernandez Reyes','8128564447','santiago 4516, Apodaca, nuevo leon', 'art@gmail.com','568475',1),
('Carlos','Garcia Morales','8125849638','esperanza 25, Monterrey, nuevo leon', 'gmorales@gmail.com','5874210',3),
('Alejandro','Perez Olmos','7823587410','av 20 de noviembre, poza rica veracruz', 'a1985@gmail.com','96854122',5),
('Esteban','Vazquez Santes','7824896523','ciruelos 45 guadalajara jalisco', '@gmail.com','669997712',1),
('Luisa','Escobar Bautista','8128564447','santiago 4516 apodaca nuevo leon', 'luisa@gmail.com','0025484',1),
('ana','Perez Olmos','6925823444','carlos sanz 345, leon guanajuato', 'anapolmos@gmail.com','9852525',4),
('Griselda','Gomez Cruz','2584697485','santiago 4516 queretato queretaro', 'grisgomcruz@gmail.com','44336515',9),
('Fernanado','Martinez Ruiz','6359821479','santiago 4516 san nicolas nuevo leon', 'ferMer@gmail.com','9852614',8),
('Gonzalo','Rocha valdez','7481385410','santiago 4516 apodaca nuevo leon', 'g1979@gmail.com','6659812',10),
('cristobal','Guevara mendez','7325816889','santiago 4516 apodaca nuevo leon', 'cristobal2112@gmail.com','445220',1),
('Carlos','Hernandez Salcedo tovar','5525669102','santiago 4516 apodaca nuevo leon', 'carlos4502@gmail.com','368741',2),
('Maria','Rubalcaba Solis','8124965722','santiago 4516 apodaca nuevo leon', 'mariaRs80@gmail.com','588103',1);

insert into alumnos(nombre,apellidos,telefono,direccion,correo,id_alumno_curso) values (
'javier','balcazar ruelas', 815596004,'mongragon 1256 santiago, nuevo leon','monda2213@gmail.com',1),
('ernesto','sanchez martinez', 4489253611,'lopez mateos 09 cd de mexico','neto25@gmail.com',2),
('karla','perez vazquez', 112258943,'barnanrdo reyes 2344, anahuac veracruz','kpeva@gmail.com',1),
('Martin','perez garcia', 4448009222,'huayaquil 200, nuevo leon','martin@gmail.com',1),
('juan','gomez martinez', 5540220397,'santiago 212 veracruz','juan2731@gmail.com',2),
('kevin','mar escobar', 5582170002,'galapagos 404, medrano sonora','k_evin_68@gmail.com',1),
('luis','treviño prieto', 9663322441,'mezquital 23 garcia, nuevo leon','treviño1199@gmail.com',2),
('alan','vazquez garza', 8877665544,'santa rosa 28 4D  marqueza, cd mexico','alan4511@gmail.com',2),
('laura','solis bueno', 1122334455,'navidad 201, santa catarina nuevo leon','laurasb@gmail.com',2);

insert into cursos(nombre_curso, costo, Fecha_inicio, Fecha_Fin, id_temario, id_turno) values (
'curso de enfermedades metabolicas','2500','2022-05-22','2022-06-22',1,1),
('Importancia de pruebas cardiacas','3200','2022-05-20','2022-06-22',2,1),
('importancia del tamizaje en los bebes','2900','2022-06-04','2022-07-02',3,2),
('analisis de pruebas y padecimientos en los bebes','2000', '2022-06-09','2022-06-30',1,1);

insert into temario(nombre, descripcion) values (
'definicion y importancia de las pruebas metabolicas','se vera las definiciones y ma ilportancia que tiene este servicio en beneficio de la salud de los bebes'),
('definicion y consecuencias de pruebas cardiacas','se pretende orientar a los espealiostas y a los padres a evaluar las posibilidades de prevenir la muerte de cuna'),
('importancia del tamizaje en los bebes','ver la importancia de un tamizaje y la consecuencias de las enfermedades a las que se arriesga un recien nacido'),
('Prueba de eliminacion 1','validacion de eliminacion'),
('Prueba de eliminacion 2','validacion de eliminacion 2');

insert into Alumno_Curso(calificacion, id_curso, id_alumno) values(
10,1,1),
(9,1,2),
(7,1,5),
(8,1,1),
(10,1,7),
(10,1,3),
(10,1,6);

insert into comentarios(Comentario, id_curso, Id_alumno, id_doctor) values(
'me parece que al curos le falta contenido', 1, 4, null), 
('es un curso muy completo que cumple con mis requerimientos', 1, 1, null),
('pestoy interesado en cambiar el tuno de mi curso', 1, 2, null),
('no me parece que el curso sea apropido ya que los alumnos no cumplen con los requerimientos', 1, null, 1),
('soy medico', 1, null, 3),
('soy doctor', 1, null, 5);


insert into turno(turno)values('Matutino'),('Vespertino'),('Nocturno');

        
ALTER TABLE Doctores ADD FOREIGN KEY(Id_Especialidad) REFERENCES Especialidades(Id_Especialidad); 

ALTER TABLE Alumnos ADD FOREIGN KEY(Id_Alumno_Curso) REFERENCES Alumno_Curso(Id_Alumno_Curso);

ALTER TABLE Asistencia ADD FOREIGN KEY(Id_Alumno_Curso) REFERENCES Alumno_Curso(Id_Alumno_Curso),
ADD FOREIGN KEY(Id_Curso) REFERENCES Cursos(Id_Curso);

ALTER TABLE Modalidad_Curso ADD FOREIGN KEY(Id_Curso) REFERENCES Cursos(Id_Curso);

ALTER TABLE Comentarios ADD FOREIGN KEY(Id_Curso) REFERENCES Cursos(Id_Curso), 
ADD FOREIGN KEY(Id_Alumno) REFERENCES Alumnos(Id_Alumno), 
ADD FOREIGN KEY(Id_Doctor) REFERENCES Doctores(Id_Doctor) ;

ALTER TABLE Alumno_Curso ADD FOREIGN KEY(Id_Curso) REFERENCES Cursos(Id_Curso), 
ADD FOREIGN KEY(Id_Alumno) REFERENCES Alumnos(Id_Alumno);

ALTER TABLE Cursos ADD FOREIGN KEY(Id_Temario) REFERENCES Temario(Id_Temario), 
ADD FOREIGN KEY(Id_Turno) REFERENCES Turno(Id_Turno);

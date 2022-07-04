
-- SECCION PARA VISTAS
		## vista que muestra las especialides y la cantidad de especialistas de cada una
			CREATE VIEW Medicos_Esp as select esp.Nombre_esp, count(id_doctor) from doctores d
			join especialidades as esp on esp.Id_Especialidad = d.Id_Especialidad group by Nombre_esp ; 
			
			select * from medicos_esp; -- query para mostrar vista

		## vista para mostrar los alumnos inscritos al curso de enfermedades metabolicas, donde se pueda ver el contacto y correo del alumno.
			create view alumnos_cursos
			as select  nombre_curso, concat(nombre,' ', apellidos) as Nombre_Completo, telefono, correo from alumno_curso ac
			inner join cursos as c on ac.id_curso = c.id_curso
			inner join alumnos as a on a.id_alumno = ac.id_alumno group by Nombre_Completo order by correo desc ;
            
			select * from alumnos_cursos; -- query para mostrar vista 

		## en esta vista se obtiene la informacion de cada curso el temario que contiene y la descripcion del contenido)
		
			create view Datos_Curso as select nombre_curso, nombre as tema, descripcion from cursos c
			inner join temario as t on t.id_temario = c.id_temario ;

			select * from Datos_Curso; -- query para mostrar vista

		## vista que muestra la lista de cursos y precio de este cuyo turno sea matutino
			create view list_cursos  as select nombre_curso, costo  from cursos c inner join turno as t on t.id_turno=c.id_temario where t.id_turno=1;
            select * from turno;
			select * from list_cursos;

		## vista para mostrar los alumnos que han realizado comentarios a algun curso y la fecha en que realizaron su comentario
			create view comentarios_cursos as select concat( nombre,' ', apellidos) as Nombre_Completo, fecha_comment from alumnos a
			inner join comentarios as c on c.id_alumno = a.id_alumno order by fecha_comment desc;
            
            select *from comentarios_cursos;
            
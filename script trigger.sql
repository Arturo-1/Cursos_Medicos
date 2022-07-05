-- TRIGGERS PARA VALIDAR E INSERTAR REGISTRO DE COMENTARIOS 
		-- tabla para log de comentarios
		use cursos_medicos;
		-- se genera trigger para validar que campo de comentario no sea vacio en caso de que el campo tenga contenido se genera la insercion
		DELIMITER $$
		CREATE TRIGGER valida_comment
		BEFORE INSERT
		ON comentarios FOR EACH ROW 
		BEGIN   
			DECLARE MSG_ERROR VARCHAR(70);
			if (NEW.comentario = '') then
				SET MSG_ERROR = 'EL COMENTARIO NO PUEDE SER VACIO';
				SIGNAL SQLSTATE'45000' SET message_text= MSG_ERROR;
			end if;
		END$$
		DELIMITER ;
        

		-- el trigger insert permite agregar un registro a la tabla log_comment cada que se ingresa un registro para la tabla comentarios. En esta tabla se agrega usuario que realiza insercion, fecha y hora
		DELIMITER $$
		CREATE TRIGGER insert_commetarios
		AFTER insert
		ON comentarios FOR EACH ROW 
		BEGIN   
		insert into log_comment(id_comentario, usuario, fecha, hora) values(1, session_user(),current_date(), current_time());
		END$$
		DELIMITER ;
		
		-- query para insertar registro en tabla comnetarios
		insert into comentarios(Comentario, id_curso, Id_alumno, id_doctor) values('Prueba de comentario', 1, 4, NULL);

		select * from comentarios; -- query para ver comentarios ingresados
		select * from log_comment; -- query para ver los registros en log_comment realidos en la tabla comentarios

-- TRIGGERS PARA VALIDAR Y ACTUALIZAR CALIFICACION DE ALUMNOS
		-- tabla para log donde se guardaran los datos de quien modifica la fecha y la hora en que se realiza un cambio
		
	-- de declara triger que valida que se ingrese una calificacion permitida para hacer la actualizacion
        DELIMITER $$
		CREATE TRIGGER valida_calificacion
		BEFORE update
		ON Alumno_Curso FOR EACH ROW 
		BEGIN   
			DECLARE MSG_ERROR VARCHAR(70);
			if (NEW.calificacion = 0) then
				SET MSG_ERROR = 'Ingrese una calificacion valida';
				SIGNAL SQLSTATE'45000' SET message_text= MSG_ERROR;
			end if;
		END$$
		DELIMITER ;
        
	-- de declara triger para que al actualizar un registro de calificacion, se genere un log del cambio realizado con los datos correspondientes a quien realiza el cambio o actualizacion 
        DELIMITER $$
		CREATE TRIGGER update_calificacion
		AFTER update
		ON Alumno_Curso FOR EACH ROW 
		BEGIN   
			insert into logs_Calif(calificacion, usuario, fecha, hora) values(1, session_user(),current_date(), current_time());
		END$$
		DELIMITER ;
		
        -- query para actualizar calificacion de tabla 
        update Alumno_Curso
        set calificacion = 7,
			id_curso = 1,
            id_alumno = 1 
            where id_alumno_curso = 1;
		
        select *  from Alumno_curso; -- para mostrar tabla
        select *  from logs_calif;	-- para mostrar tabla donde se guardan los logs del cambio


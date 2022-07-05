-- SECCION PARA STORE PROCEDURE

-- STORE PROCEDURE PARA ORDENAMIENTO DE TABLA.- el ordenamiento del store y se habilita opcion para que eñl orden pueda ser de manera descendente o ascendente.

		DELIMITER $$
		CREATE PROCEDURE Q_ORDENAMIENTO(column1 varchar(200),orden INT)
		BEGIN
		 DECLARE Q_BASE VARCHAR(200);
		 DECLARE TIPO_ORDEN VARCHAR(10);
		 DECLARE Q_FINAL VARCHAR(200);
		 SET Q_BASE = 'SELECT NOMBRE, APELLIDOS, ID_ESPECIALIDAD FROM cursos_medicos.doctores';
		 
		 if orden = 1 THEN
			SET TIPO_ORDEN = 'asc;';
		 else
			SET TIPO_ORDEN = 'desc;';
		 end if;
		 
		 if column1 = "" then
			select 'La columna no puede ser vacia';
		 else
			SELECT concat(Q_BASE,' ORDER BY ',column1,' ', TIPO_ORDEN) into Q_FINAL;
			SET @m_orden = Q_FINAL;
			
			PREPARE EJECUTAR FROM @m_orden; 
			EXECUTE EJECUTAR;
			deallocate prepare EJECUTAR;
		end if;
		 
		 END $$
		 DELIMITER ;
		 
		CALL Q_ORDENAMIENTO('Apellidos',1);
		 
-- STORE PROCEDURE PARA INSERTAR Y ELIMINAR ELEMENTO.- el store cuenta con 2 opciones, las cuales dependiendo de la instruccion indicada inserta o elimina un registro dentro de la tabla temario
		 
		DELIMITER $$
		CREATE PROCEDURE ACCION_TABLE(
			Accion VARCHAR(200),
			TEM_ID INT,
			NameT varchar(100),
			Desct varchar(100)
			 )
		BEGIN	
			-- INSERT
			if Accion = "INSERT" THEN
				INSERT INTO Temario(id_temario,Nombre, Descripcion)
				VALUES (TEM_ID,NameT, Desct);
			end if;
			-- DELETE
			if Accion = "DELETE" THEN
				DELETE FROM Temario
				WHERE Id_temario = TEM_ID;
			end if;
		END$$

		CALL ACCION_TABLE("INSERT",0,'PROBAR INSERT','PROBAR INSERT');
		-- TABLA PARA VALIDAR MODIFICACIONES
		select *from temario;
		

-- STORE PROCEDURE PARA MOSTRAR LOS ALUMNOS QUE TENGAN EN SU NOMBRE LA LETRA INGRESADA Y SE GUARDA EN VARIABLE DE SALIDA LA CANTIDAD DE ALUMNOS ENCONTRADOS 
	DELIMITER $$
		CREATE PROCEDURE ALUMNO_LETRA(IN LETRA CHAR(10), OUT NUMERO INT)
		BEGIN
        SELECT COUNT(*) INTO NUMERO FROM ALUMNOS WHERE NOMBRE LIKE concat('%',LETRA, '%');
		 END $$
		 DELIMITER ;
		 
		CALL ALUMNO_LETRA('ar',@cantidad_ar);
        CALL ALUMNO_LETRA('m',@cantidad_m);
        CALL ALUMNO_LETRA('ju',@cantidad_ju);
        CALL ALUMNO_LETRA('a',@cantidad_a);
        
        select @cantidad_ar, @cantidad_m, @cantidad_ju, @cantidad_a;
               
        
        
        
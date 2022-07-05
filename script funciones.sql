-- SECCION PARA FUNCIONES

	-- FUNCION PARA REALIZAR LA SUMA DEL COSTO DE 2 CURSOS
			DELIMITER ##
			CREATE function suma_precio_cursos(precio1 int, precio2 int)
			returns int
			deterministic
			BEGIN
				declare suma_precios int;
				set suma_precios=precio1+precio2;
				return suma_precios;
			END ##
			select suma_precio_cursos(2500,3200);
			drop function name_doctor;

	-- FUNCION PARA MOSTRAR EL NOMBRE DEL MEDICO 
			DELIMITER ##
			CREATE function name_doctor(doctor_user int)
			returns varchar (250)
			reads sql data
			deterministic
			BEGIN
				declare datos_name varchar(80);
				select concat(Nombre,',',Apellidos) into datos_name from cursos_medicos.doctores where Id_Doctor=doctor_user;
				return datos_name;
			END ##
			select name_doctor(1);
            
		
	-- FUNCION PARA COMPARAR QUE DATO ES MAYOR 
            DELIMITER ##
			CREATE function PRECIO_MAYOR(DATO1 INT, DATO2 INT)
            returns int
			deterministic
			begin 
			  if DATO1>DATO2 then
				return DATO1;
			  else
				return DATO2;
			  end if;
			end ##
			delimiter ;
            select PRECIO_MAYOR(2500, 120);
			
        
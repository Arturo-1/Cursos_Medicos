CREATE DATABASE  IF NOT EXISTS `cursos_medicos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cursos_medicos`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: cursos_medicos
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumno_curso`
--

DROP TABLE IF EXISTS `alumno_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno_curso` (
  `Id_Alumno_Curso` int NOT NULL AUTO_INCREMENT,
  `calificacion` float DEFAULT NULL,
  `Id_curso` int NOT NULL,
  `Id_Alumno` int NOT NULL,
  PRIMARY KEY (`Id_Alumno_Curso`),
  KEY `Id_curso` (`Id_curso`),
  KEY `Id_Alumno` (`Id_Alumno`),
  CONSTRAINT `alumno_curso_ibfk_1` FOREIGN KEY (`Id_curso`) REFERENCES `cursos` (`Id_Curso`),
  CONSTRAINT `alumno_curso_ibfk_2` FOREIGN KEY (`Id_Alumno`) REFERENCES `alumnos` (`Id_Alumno`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno_curso`
--

LOCK TABLES `alumno_curso` WRITE;
/*!40000 ALTER TABLE `alumno_curso` DISABLE KEYS */;
INSERT INTO `alumno_curso` VALUES (1,7,1,1),(2,9,1,2),(3,7,4,3),(4,8,3,4),(5,6,3,5),(6,9,2,6),(7,9,1,7),(8,9,1,8),(9,8,2,9),(10,7,3,10),(11,8,1,11),(12,7,2,12);
/*!40000 ALTER TABLE `alumno_curso` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `valida_calificacion` BEFORE UPDATE ON `alumno_curso` FOR EACH ROW BEGIN   
			DECLARE MSG_ERROR VARCHAR(70);
			if (NEW.calificacion = 0) then
				SET MSG_ERROR = 'Ingrese una calificacion valida';
				SIGNAL SQLSTATE'45000' SET message_text= MSG_ERROR;
			end if;
		END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_calificacion` AFTER UPDATE ON `alumno_curso` FOR EACH ROW BEGIN   
			insert into logs_Calif(calificacion, usuario, fecha, hora) values(1, session_user(),current_date(), current_time());
		END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `Id_Alumno` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellidos` varchar(80) DEFAULT NULL,
  `Telefono` varchar(12) DEFAULT NULL,
  `Direccion` varchar(200) DEFAULT NULL,
  `Correo` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`Id_Alumno`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (1,'javier','balcazar ruelas','815596004','mongragon 1256 santiago, nuevo leon','monda2213@gmail.com'),(2,'ernesto','sanchez martinez','4489253611','lopez mateos 09 cd de mexico','neto25@gmail.com'),(3,'karla','perez vazquez','112258943','barnanrdo reyes 2344, anahuac veracruz','kpeva@gmail.com'),(4,'Martin','perez garcia','4448009222','huayaquil 200, nuevo leon','martin@gmail.com'),(5,'juan','gomez martinez','5540220397','santiago 212 veracruz','juan2731@gmail.com'),(6,'kevin','mar escobar','5582170002','galapagos 404, medrano sonora','k_evin_68@gmail.com'),(7,'luis','treviño prieto','9663322441','mezquital 23 garcia, nuevo leon','treviño1199@gmail.com'),(8,'alan','vazquez garza','8877665544','santa rosa 28 4D  marqueza, cd mexico','alan4511@gmail.com'),(9,'laura','solis bueno','1122334455','navidad 201, santa catarina nuevo leon','laurasb@gmail.com'),(10,'juan carlos','escobar medina','8125416987','san pedro, nuevo leon','medina@gmail.com'),(11,'alan','morales cordoba','5248716389','girasoles 23, cd mexico','alan@gmail.com'),(12,'miguel alejandro','motta trejo','1122334455','navidad 201, santa catarina nuevo leon','laurasb@gmail.com');
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `alumnos_cursos`
--

DROP TABLE IF EXISTS `alumnos_cursos`;
/*!50001 DROP VIEW IF EXISTS `alumnos_cursos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `alumnos_cursos` AS SELECT 
 1 AS `nombre_curso`,
 1 AS `Nombre_Completo`,
 1 AS `telefono`,
 1 AS `correo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencia` (
  `Id_Asistencia` int NOT NULL AUTO_INCREMENT,
  `Fecha_Asistencia` datetime DEFAULT NULL,
  `Id_Alumno_Curso` int NOT NULL,
  `Id_Curso` int NOT NULL,
  PRIMARY KEY (`Id_Asistencia`),
  KEY `Id_Alumno_Curso` (`Id_Alumno_Curso`),
  KEY `Id_Curso` (`Id_Curso`),
  CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`Id_Alumno_Curso`) REFERENCES `alumno_curso` (`Id_Alumno_Curso`),
  CONSTRAINT `asistencia_ibfk_2` FOREIGN KEY (`Id_Curso`) REFERENCES `cursos` (`Id_Curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencia`
--

LOCK TABLES `asistencia` WRITE;
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `Id_Comentario` int NOT NULL AUTO_INCREMENT,
  `Comentario` varchar(200) DEFAULT NULL,
  `Id_Curso` int NOT NULL,
  `Id_Alumno` int DEFAULT NULL,
  `Id_Doctor` int DEFAULT NULL,
  `fecha_comment` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id_Comentario`),
  KEY `Id_Curso` (`Id_Curso`),
  KEY `Id_Alumno` (`Id_Alumno`),
  KEY `Id_Doctor` (`Id_Doctor`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`Id_Curso`) REFERENCES `cursos` (`Id_Curso`),
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`Id_Alumno`) REFERENCES `alumnos` (`Id_Alumno`),
  CONSTRAINT `comentarios_ibfk_3` FOREIGN KEY (`Id_Doctor`) REFERENCES `doctores` (`Id_Doctor`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,'me parece que al curos le falta contenido',1,4,NULL,'2022-07-05 17:54:47'),(2,'es un curso muy completo que cumple con mis requerimientos',1,1,NULL,'2022-07-05 17:54:47'),(3,'pestoy interesado en cambiar el tuno de mi curso',1,2,NULL,'2022-07-05 17:54:47'),(4,'no me parece que el curso sea apropido ya que los alumnos no cumplen con los requerimientos',1,NULL,1,'2022-07-05 17:54:47'),(5,'soy medico',1,NULL,3,'2022-07-05 17:54:47'),(6,'soy doctor',1,NULL,5,'2022-07-05 17:54:47'),(7,'Prueba de comentario',1,4,NULL,'2022-07-05 17:54:48');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `valida_comment` BEFORE INSERT ON `comentarios` FOR EACH ROW BEGIN   
			DECLARE MSG_ERROR VARCHAR(70);
			if (NEW.comentario = '') then
				SET MSG_ERROR = 'EL COMENTARIO NO PUEDE SER VACIO';
				SIGNAL SQLSTATE'45000' SET message_text= MSG_ERROR;
			end if;
		END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_commetarios` AFTER INSERT ON `comentarios` FOR EACH ROW BEGIN   
		insert into log_comment(id_comentario, usuario, fecha, hora) values(1, session_user(),current_date(), current_time());
		END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `comentarios_cursos`
--

DROP TABLE IF EXISTS `comentarios_cursos`;
/*!50001 DROP VIEW IF EXISTS `comentarios_cursos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `comentarios_cursos` AS SELECT 
 1 AS `Nombre_Completo`,
 1 AS `fecha_comment`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `Id_Curso` int NOT NULL AUTO_INCREMENT,
  `Nombre_Curso` varchar(70) DEFAULT NULL,
  `Costo` int DEFAULT NULL,
  `Fecha_Inicio` date DEFAULT NULL,
  `Fecha_Fin` date DEFAULT NULL,
  `Id_Temario` int NOT NULL,
  `Id_Turno` int NOT NULL,
  PRIMARY KEY (`Id_Curso`),
  KEY `Id_Temario` (`Id_Temario`),
  KEY `Id_Turno` (`Id_Turno`),
  CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`Id_Temario`) REFERENCES `temario` (`Id_Temario`),
  CONSTRAINT `cursos_ibfk_2` FOREIGN KEY (`Id_Turno`) REFERENCES `turno` (`Id_Turno`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'curso de enfermedades metabolicas',2500,'2022-05-22','2022-06-22',1,1),(2,'Importancia de pruebas cardiacas',3200,'2022-05-20','2022-06-22',2,1),(3,'importancia del tamizaje en los bebes',2900,'2022-06-04','2022-07-02',3,2),(4,'analisis de pruebas y padecimientos en los bebes',2000,'2022-06-09','2022-06-30',1,1);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `datos_curso`
--

DROP TABLE IF EXISTS `datos_curso`;
/*!50001 DROP VIEW IF EXISTS `datos_curso`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `datos_curso` AS SELECT 
 1 AS `nombre_curso`,
 1 AS `tema`,
 1 AS `descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `doctores`
--

DROP TABLE IF EXISTS `doctores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctores` (
  `Id_Doctor` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(70) DEFAULT NULL,
  `Apellidos` varchar(70) DEFAULT NULL,
  `Telefono` varchar(12) DEFAULT NULL,
  `Direccion` varchar(150) DEFAULT NULL,
  `Correo` varchar(80) DEFAULT NULL,
  `Cedula_Profecional` varchar(40) DEFAULT NULL,
  `Id_Especialidad` int NOT NULL,
  PRIMARY KEY (`Id_Doctor`),
  KEY `Id_Especialidad` (`Id_Especialidad`),
  CONSTRAINT `doctores_ibfk_1` FOREIGN KEY (`Id_Especialidad`) REFERENCES `especialidades` (`Id_Especialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctores`
--

LOCK TABLES `doctores` WRITE;
/*!40000 ALTER TABLE `doctores` DISABLE KEYS */;
INSERT INTO `doctores` VALUES (1,'Arturo','Hernandez Reyes','8128564447','santiago 4516, Apodaca, nuevo leon','art@gmail.com','568475',1),(2,'Carlos','Garcia Morales','8125849638','esperanza 25, Monterrey, nuevo leon','gmorales@gmail.com','5874210',3),(3,'Alejandro','Perez Olmos','7823587410','av 20 de noviembre, poza rica veracruz','a1985@gmail.com','96854122',5),(4,'Esteban','Vazquez Santes','7824896523','ciruelos 45 guadalajara jalisco','@gmail.com','669997712',1),(5,'Luisa','Escobar Bautista','8128564447','santiago 4516 apodaca nuevo leon','luisa@gmail.com','0025484',1),(6,'ana','Perez Olmos','6925823444','carlos sanz 345, leon guanajuato','anapolmos@gmail.com','9852525',4),(7,'Griselda','Gomez Cruz','2584697485','santiago 4516 queretato queretaro','grisgomcruz@gmail.com','44336515',9),(8,'Fernanado','Martinez Ruiz','6359821479','santiago 4516 san nicolas nuevo leon','ferMer@gmail.com','9852614',8),(9,'Gonzalo','Rocha valdez','7481385410','santiago 4516 apodaca nuevo leon','g1979@gmail.com','6659812',10),(10,'cristobal','Guevara mendez','7325816889','santiago 4516 apodaca nuevo leon','cristobal2112@gmail.com','445220',1),(11,'Carlos','Hernandez Salcedo tovar','5525669102','santiago 4516 apodaca nuevo leon','carlos4502@gmail.com','368741',2),(12,'Maria','Rubalcaba Solis','8124965722','santiago 4516 apodaca nuevo leon','mariaRs80@gmail.com','588103',1);
/*!40000 ALTER TABLE `doctores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidades` (
  `Id_Especialidad` int NOT NULL AUTO_INCREMENT,
  `Nombre_esp` varchar(70) DEFAULT NULL,
  `Descripcion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`Id_Especialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidades`
--

LOCK TABLES `especialidades` WRITE;
/*!40000 ALTER TABLE `especialidades` DISABLE KEYS */;
INSERT INTO `especialidades` VALUES (1,'Pediatria','Rama de la medicina que se especializa en la salud y las enfermedades de los niños'),(2,'Cardiología','Rama de la medicina que se especiliza en el diagnóstico y tratamiento de enfermedades del corazón, los vasos sanguíneos y el sistema circulatorio'),(3,'Enfermeria','abarca el cuidado autónomo y colaborativo de personas de todas las edades, familias, grupos y comunidades, enfermos o sanos y en todos los entornos'),(4,'Medicina Familiar','es la especialidad que brinda atención médica continua e integral para el individuo y la familia.'),(5,'Endocrinología','Es una subespecialidad de medicina interna.'),(6,'Neumología','Tratan el sistema cardíaco-pulmonar, consiste en los órganos que trabajan juntos para ayudar a que la respire, como el corazón y los pulmones'),(7,'Neurología','Los neurólogos son los que tratan a los pacientes con condiciones que afectan al cerebro, espina vertebral o nervios'),(8,'Patología','La patología estudia las causas y la naturaleza de una enfermedad en particular'),(9,'Medicina física y rehabilitación','Ayudan a los pacientes con deshabilitación del cerebro, columna vertebral, nervios, huesos, articulaciones, ligamentos, músculos y tendones'),(10,'Otorrinolaringólogo',' son médicos que se especializan en el diagnóstico y el tratamiento de enfermedades o afecciones del oído, la nariz y la garganta');
/*!40000 ALTER TABLE `especialidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `list_cursos`
--

DROP TABLE IF EXISTS `list_cursos`;
/*!50001 DROP VIEW IF EXISTS `list_cursos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `list_cursos` AS SELECT 
 1 AS `nombre_curso`,
 1 AS `costo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `log_comment`
--

DROP TABLE IF EXISTS `log_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_comment` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `id_comentario` int DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_comment`
--

LOCK TABLES `log_comment` WRITE;
/*!40000 ALTER TABLE `log_comment` DISABLE KEYS */;
INSERT INTO `log_comment` VALUES (1,1,'root@localhost','2022-07-05','12:54:48');
/*!40000 ALTER TABLE `log_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs_calif`
--

DROP TABLE IF EXISTS `logs_calif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_calif` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `calificacion` int DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_calif`
--

LOCK TABLES `logs_calif` WRITE;
/*!40000 ALTER TABLE `logs_calif` DISABLE KEYS */;
INSERT INTO `logs_calif` VALUES (1,1,'root@localhost','2022-07-05','12:54:48');
/*!40000 ALTER TABLE `logs_calif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `medicos_esp`
--

DROP TABLE IF EXISTS `medicos_esp`;
/*!50001 DROP VIEW IF EXISTS `medicos_esp`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `medicos_esp` AS SELECT 
 1 AS `Nombre_esp`,
 1 AS `count(id_doctor)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `modalidad_curso`
--

DROP TABLE IF EXISTS `modalidad_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modalidad_curso` (
  `Id_Modalidad_Curso` int NOT NULL AUTO_INCREMENT,
  `Tipo_Modalidad` varchar(50) DEFAULT NULL,
  `Id_Curso` int NOT NULL,
  PRIMARY KEY (`Id_Modalidad_Curso`),
  KEY `Id_Curso` (`Id_Curso`),
  CONSTRAINT `modalidad_curso_ibfk_1` FOREIGN KEY (`Id_Curso`) REFERENCES `cursos` (`Id_Curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modalidad_curso`
--

LOCK TABLES `modalidad_curso` WRITE;
/*!40000 ALTER TABLE `modalidad_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `modalidad_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temario`
--

DROP TABLE IF EXISTS `temario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temario` (
  `Id_Temario` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(120) DEFAULT NULL,
  `Descripcion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`Id_Temario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temario`
--

LOCK TABLES `temario` WRITE;
/*!40000 ALTER TABLE `temario` DISABLE KEYS */;
INSERT INTO `temario` VALUES (1,'definicion y importancia de las pruebas metabolicas','se vera las definiciones y ma ilportancia que tiene este servicio en beneficio de la salud de los bebes'),(2,'definicion y consecuencias de pruebas cardiacas','se pretende orientar a los espealiostas y a los padres a evaluar las posibilidades de prevenir la muerte de cuna'),(3,'importancia del tamizaje en los bebes','ver la importancia de un tamizaje y la consecuencias de las enfermedades a las que se arriesga un recien nacido'),(4,'Prueba de eliminacion 1','validacion de eliminacion'),(5,'Prueba de eliminacion 2','validacion de eliminacion 2');
/*!40000 ALTER TABLE `temario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turno`
--

DROP TABLE IF EXISTS `turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turno` (
  `Id_Turno` int NOT NULL AUTO_INCREMENT,
  `Turno` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Turno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turno`
--

LOCK TABLES `turno` WRITE;
/*!40000 ALTER TABLE `turno` DISABLE KEYS */;
INSERT INTO `turno` VALUES (1,'Matutino'),(2,'Vespertino'),(3,'Nocturno');
/*!40000 ALTER TABLE `turno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cursos_medicos'
--

--
-- Dumping routines for database 'cursos_medicos'
--
/*!50003 DROP FUNCTION IF EXISTS `name_doctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `name_doctor`(doctor_user int) RETURNS varchar(250) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
				declare datos_name varchar(80);
				select concat(Nombre,',',Apellidos) into datos_name from cursos_medicos.doctores where Id_Doctor=doctor_user;
				return datos_name;
			END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `PRECIO_MAYOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `PRECIO_MAYOR`(DATO1 INT, DATO2 INT) RETURNS int
    DETERMINISTIC
begin 
			  if DATO1>DATO2 then
				return DATO1;
			  else
				return DATO2;
			  end if;
			end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `suma_precio_cursos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `suma_precio_cursos`(precio1 int, precio2 int) RETURNS int
    DETERMINISTIC
BEGIN
				declare suma_precios int;
				set suma_precios=precio1+precio2;
				return suma_precios;
			END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACCION_TABLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ACCION_TABLE`(
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
		END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ALUMNO_LETRA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ALUMNO_LETRA`(IN LETRA CHAR(10), OUT NUMERO INT)
BEGIN
        SELECT COUNT(*) INTO NUMERO FROM ALUMNOS WHERE NOMBRE LIKE concat('%',LETRA, '%');
		 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Q_ORDENAMIENTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q_ORDENAMIENTO`(column1 varchar(200),orden INT)
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
		 
		 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `alumnos_cursos`
--

/*!50001 DROP VIEW IF EXISTS `alumnos_cursos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alumnos_cursos` AS select `c`.`Nombre_Curso` AS `nombre_curso`,concat(`a`.`Nombre`,' ',`a`.`Apellidos`) AS `Nombre_Completo`,`a`.`Telefono` AS `telefono`,`a`.`Correo` AS `correo` from ((`alumno_curso` `ac` join `cursos` `c` on((`ac`.`Id_curso` = `c`.`Id_Curso`))) join `alumnos` `a` on((`a`.`Id_Alumno` = `ac`.`Id_Alumno`))) group by `Nombre_Completo` order by `a`.`Correo` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `comentarios_cursos`
--

/*!50001 DROP VIEW IF EXISTS `comentarios_cursos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `comentarios_cursos` AS select concat(`a`.`Nombre`,' ',`a`.`Apellidos`) AS `Nombre_Completo`,`c`.`fecha_comment` AS `fecha_comment` from (`alumnos` `a` join `comentarios` `c` on((`c`.`Id_Alumno` = `a`.`Id_Alumno`))) order by `c`.`fecha_comment` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `datos_curso`
--

/*!50001 DROP VIEW IF EXISTS `datos_curso`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `datos_curso` AS select `c`.`Nombre_Curso` AS `nombre_curso`,`t`.`Nombre` AS `tema`,`t`.`Descripcion` AS `descripcion` from (`cursos` `c` join `temario` `t` on((`t`.`Id_Temario` = `c`.`Id_Temario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `list_cursos`
--

/*!50001 DROP VIEW IF EXISTS `list_cursos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `list_cursos` AS select `c`.`Nombre_Curso` AS `nombre_curso`,`c`.`Costo` AS `costo` from (`cursos` `c` join `turno` `t` on((`t`.`Id_Turno` = `c`.`Id_Temario`))) where (`t`.`Id_Turno` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `medicos_esp`
--

/*!50001 DROP VIEW IF EXISTS `medicos_esp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `medicos_esp` AS select `esp`.`Nombre_esp` AS `Nombre_esp`,count(`d`.`Id_Doctor`) AS `count(id_doctor)` from (`doctores` `d` join `especialidades` `esp` on((`esp`.`Id_Especialidad` = `d`.`Id_Especialidad`))) group by `esp`.`Nombre_esp` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-08 10:06:00

CREATE DATABASE  IF NOT EXISTS `securitas` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `securitas`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: securitas
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `asegurado`
--

DROP TABLE IF EXISTS `asegurado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asegurado` (
  `Matricula` int NOT NULL,
  `FechaDeAlta` date DEFAULT NULL,
  `FechaDeBaja` date DEFAULT NULL,
  `CIDependiente` int DEFAULT NULL,
  `CI` int DEFAULT NULL,
  PRIMARY KEY (`Matricula`),
  KEY `CI` (`CI`),
  CONSTRAINT `asegurado_ibfk_1` FOREIGN KEY (`CI`) REFERENCES `persona` (`CI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asegurado`
--

LOCK TABLES `asegurado` WRITE;
/*!40000 ALTER TABLE `asegurado` DISABLE KEYS */;
INSERT INTO `asegurado` VALUES (12345671,'2020-03-19','2020-03-16',1234561,3456781),(12345672,'2020-03-15','2020-03-16',1234562,3456782),(12345673,'2020-03-15','2020-03-15',1234563,0),(12345674,'2020-03-13','2020-03-14',1234564,3456783),(12345675,'2020-03-12','2020-03-15',1234565,3456784);
/*!40000 ALTER TABLE `asegurado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citamedica`
--

DROP TABLE IF EXISTS `citamedica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citamedica` (
  `CodCitaMedica` int NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `CodMedico` int DEFAULT NULL,
  `Matricula` int DEFAULT NULL,
  PRIMARY KEY (`CodCitaMedica`),
  KEY `CodMedico` (`CodMedico`),
  KEY `Matricula` (`Matricula`),
  CONSTRAINT `citamedica_ibfk_1` FOREIGN KEY (`CodMedico`) REFERENCES `medico` (`CodMedico`),
  CONSTRAINT `citamedica_ibfk_2` FOREIGN KEY (`Matricula`) REFERENCES `asegurado` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citamedica`
--

LOCK TABLES `citamedica` WRITE;
/*!40000 ALTER TABLE `citamedica` DISABLE KEYS */;
INSERT INTO `citamedica` VALUES (3001,'2020-03-30 08:00:00',123,12345671),(3002,'2020-03-30 08:30:00',124,12345672),(3003,'2020-03-30 09:00:00',125,12345673),(3004,'2020-03-30 09:30:00',126,12345674),(3005,'2020-03-30 10:00:00',127,12345675);
/*!40000 ALTER TABLE `citamedica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultamedica`
--

DROP TABLE IF EXISTS `consultamedica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultamedica` (
  `CodConsultaMedica` int NOT NULL,
  `CodSignosVitales` int DEFAULT NULL,
  `CodDiagnostico` int DEFAULT NULL,
  `CodCitaMedica` int DEFAULT NULL,
  PRIMARY KEY (`CodConsultaMedica`),
  KEY `CodSignosVitales` (`CodSignosVitales`),
  KEY `CodDiagnostico` (`CodDiagnostico`),
  KEY `CodCitaMedica` (`CodCitaMedica`),
  CONSTRAINT `consultamedica_ibfk_1` FOREIGN KEY (`CodSignosVitales`) REFERENCES `signosvitales` (`CodSignosVitales`),
  CONSTRAINT `consultamedica_ibfk_2` FOREIGN KEY (`CodDiagnostico`) REFERENCES `diagnostico` (`CodDiagnostico`),
  CONSTRAINT `consultamedica_ibfk_3` FOREIGN KEY (`CodCitaMedica`) REFERENCES `citamedica` (`CodCitaMedica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultamedica`
--

LOCK TABLES `consultamedica` WRITE;
/*!40000 ALTER TABLE `consultamedica` DISABLE KEYS */;
INSERT INTO `consultamedica` VALUES (900231,1,1,3001),(900232,2,2,3002),(900233,3,3,3003),(900234,4,4,3004),(900235,5,5,3005);
/*!40000 ALTER TABLE `consultamedica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultorio`
--

DROP TABLE IF EXISTS `consultorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultorio` (
  `CodConsultorio` int NOT NULL,
  `NroConsultorio` int DEFAULT NULL,
  `Piso` int DEFAULT NULL,
  `CodHospital` int DEFAULT NULL,
  PRIMARY KEY (`CodConsultorio`),
  KEY `CodHospital` (`CodHospital`),
  CONSTRAINT `consultorio_ibfk_1` FOREIGN KEY (`CodHospital`) REFERENCES `hospital` (`CodHospital`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultorio`
--

LOCK TABLES `consultorio` WRITE;
/*!40000 ALTER TABLE `consultorio` DISABLE KEYS */;
INSERT INTO `consultorio` VALUES (1,101,1,8001),(2,102,1,8002),(3,103,1,8003),(4,104,1,8004),(5,105,1,8005);
/*!40000 ALTER TABLE `consultorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnostico`
--

DROP TABLE IF EXISTS `diagnostico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostico` (
  `CodDiagnostico` int NOT NULL,
  `Diagnostico` varchar(255) DEFAULT NULL,
  `Tratamiento` varchar(255) DEFAULT NULL,
  `Dosis` varchar(255) DEFAULT NULL,
  `CodReceta` int DEFAULT NULL,
  PRIMARY KEY (`CodDiagnostico`),
  KEY `CodReceta` (`CodReceta`),
  CONSTRAINT `diagnostico_ibfk_1` FOREIGN KEY (`CodReceta`) REFERENCES `receta` (`CodReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostico`
--

LOCK TABLES `diagnostico` WRITE;
/*!40000 ALTER TABLE `diagnostico` DISABLE KEYS */;
INSERT INTO `diagnostico` VALUES (1,'resfrio comun','Tomar paracetamol cada 6 horas','10',4011),(2,'infeccion','Tomar Dexametasol cada 8 horas','20',4012),(3,'anemia','Tomar Hierro cada 7 horas','14',4013),(4,'brazo roto','Enyesar',NULL,4014),(5,'diabetes','3 inyecciones cada dia','5',4015);
/*!40000 ALTER TABLE `diagnostico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad` (
  `CodEspecialidad` int NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CodEspecialidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
INSERT INTO `especialidad` VALUES (1,'Cardiología'),(2,'Gastroenterología'),(3,'Cirugía'),(4,'Oftalmología'),(5,'Dermatología');
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmacia`
--

DROP TABLE IF EXISTS `farmacia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farmacia` (
  `CodFarmacia` int NOT NULL,
  `NombreFarmacia` varchar(255) DEFAULT NULL,
  `CodHospital` int DEFAULT NULL,
  PRIMARY KEY (`CodFarmacia`),
  KEY `CodHospital` (`CodHospital`),
  CONSTRAINT `farmacia_ibfk_1` FOREIGN KEY (`CodHospital`) REFERENCES `hospital` (`CodHospital`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmacia`
--

LOCK TABLES `farmacia` WRITE;
/*!40000 ALTER TABLE `farmacia` DISABLE KEYS */;
INSERT INTO `farmacia` VALUES (401,'Farmacia Petrolera de Salud',8001),(402,'Farmacia Banca Privada',8002),(403,'Farmacia Caja Nacional de Salud',8003),(404,'Farmacia Seguro Social Universitario',8004),(405,'Farmacia Caja Salud Cordes',8005);
/*!40000 ALTER TABLE `farmacia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmacia_medicamentos`
--

DROP TABLE IF EXISTS `farmacia_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farmacia_medicamentos` (
  `CodFarmacia` int NOT NULL,
  `CodMedicamento` int NOT NULL,
  PRIMARY KEY (`CodFarmacia`,`CodMedicamento`),
  KEY `CodMedicamento` (`CodMedicamento`),
  CONSTRAINT `farmacia_medicamentos_ibfk_1` FOREIGN KEY (`CodFarmacia`) REFERENCES `farmacia` (`CodFarmacia`),
  CONSTRAINT `farmacia_medicamentos_ibfk_2` FOREIGN KEY (`CodMedicamento`) REFERENCES `medicamento` (`CodMedicamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmacia_medicamentos`
--

LOCK TABLES `farmacia_medicamentos` WRITE;
/*!40000 ALTER TABLE `farmacia_medicamentos` DISABLE KEYS */;
INSERT INTO `farmacia_medicamentos` VALUES (401,1111),(402,1112),(403,1113),(404,1114),(405,1115);
/*!40000 ALTER TABLE `farmacia_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital` (
  `CodHospital` int NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Ubicacion` varchar(255) DEFAULT NULL,
  `NroCamas` int DEFAULT NULL,
  `NroHabitaciones` int DEFAULT NULL,
  `NroPisos` int DEFAULT NULL,
  `CodSeguro` int DEFAULT NULL,
  PRIMARY KEY (`CodHospital`),
  KEY `CodSeguro` (`CodSeguro`),
  CONSTRAINT `hospital_ibfk_1` FOREIGN KEY (`CodSeguro`) REFERENCES `seguro` (`CodSeguro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (8001,'Caja Petrolera de Salud','Av. 16 de Julio #1616',48,16,4,1234000),(8002,'Caja de Salud de la Banca Privada','Av. Capitán Ravelo, calle Montevideo',45,15,4,1234001),(8003,'Caja Nacional de Salud','Av. Mariscal Santa Cruz, calle Almirante Grau',51,17,4,1234002),(8004,'Seguro Social Universitario','Av. 6 de agosto, calle M. Pinilla',36,12,3,1234003),(8005,'Caja de Salud Cordes','Av. Arce, calle Belisario Salinas',48,12,3,1234004);
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamento`
--

DROP TABLE IF EXISTS `medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamento` (
  `CodMedicamento` int NOT NULL,
  `NombreMedicamento` varchar(255) DEFAULT NULL,
  `Tipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CodMedicamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento`
--

LOCK TABLES `medicamento` WRITE;
/*!40000 ALTER TABLE `medicamento` DISABLE KEYS */;
INSERT INTO `medicamento` VALUES (1111,'Paracetamol','Analgésico'),(1112,'Ibuprofeno','Antiinflamatorio'),(1113,'Amoxisilina','Antibiótico'),(1114,'Diclofenaco','Desinflamante'),(1115,'Viadil','Antiespasmódico');
/*!40000 ALTER TABLE `medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `CodMedico` int NOT NULL,
  `CI` int DEFAULT NULL,
  `CodEspecialidad` int DEFAULT NULL,
  `CodConsultorio` int DEFAULT NULL,
  PRIMARY KEY (`CodMedico`),
  KEY `CodConsultorio` (`CodConsultorio`),
  KEY `CodEspecialidad` (`CodEspecialidad`),
  KEY `CI` (`CI`),
  CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`CodConsultorio`) REFERENCES `consultorio` (`CodConsultorio`),
  CONSTRAINT `medico_ibfk_2` FOREIGN KEY (`CodEspecialidad`) REFERENCES `especialidad` (`CodEspecialidad`),
  CONSTRAINT `medico_ibfk_3` FOREIGN KEY (`CI`) REFERENCES `persona` (`CI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (123,2345671,1,1),(124,2345672,2,2),(125,2345673,3,3),(126,2345674,4,4),(127,2345675,5,5);
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `CI` int NOT NULL,
  `ApellidoPaterno` varchar(255) NOT NULL,
  `ApellidoMaterno` varchar(255) DEFAULT NULL,
  `nombre1` varchar(255) NOT NULL,
  `nombre2` varchar(255) DEFAULT NULL,
  `fechaDeNacimiento` date DEFAULT NULL,
  PRIMARY KEY (`CI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1234561,'Müller','García','James','Karl','1982-10-15'),(1234562,'Smirnov','Nguyen','Anastasia','Maria','1995-02-05'),(1234563,'Smith','Wang ','Ben',NULL,'1996-03-29'),(1234564,'Hernández','Zhang','Emma','Alicia','1999-05-18'),(1234565,'González','Li – Lee','Miguel',NULL,'2000-02-25'),(2345671,'Lizarraga','Perez','Jaime',NULL,'1989-07-11'),(2345672,'Gonzales','Espinoza','Diego','Fernando','1989-11-07'),(2345673,'Arce','Peña','Livvia','Adele','1987-10-06'),(2345674,'Tortato','Martinez','Cristian','Jose','1987-06-10'),(2345675,'Linares','Carrasco','Claire',NULL,'1984-04-27');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta`
--

DROP TABLE IF EXISTS `receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta` (
  `CodReceta` int NOT NULL,
  `Cantidad` int DEFAULT NULL,
  `CodMedicamento` int DEFAULT NULL,
  PRIMARY KEY (`CodReceta`),
  KEY `CodMedicamento` (`CodMedicamento`),
  CONSTRAINT `receta_ibfk_1` FOREIGN KEY (`CodMedicamento`) REFERENCES `medicamento` (`CodMedicamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta`
--

LOCK TABLES `receta` WRITE;
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
INSERT INTO `receta` VALUES (4011,10,8001),(4012,20,8002),(4013,14,8003),(4014,1,8004),(4015,5,8005);
/*!40000 ALTER TABLE `receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguro`
--

DROP TABLE IF EXISTS `seguro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro` (
  `CodSeguro` int NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `MontoDeCobertura` int DEFAULT NULL,
  PRIMARY KEY (`CodSeguro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguro`
--

LOCK TABLES `seguro` WRITE;
/*!40000 ALTER TABLE `seguro` DISABLE KEYS */;
INSERT INTO `seguro` VALUES (1234000,'Bisa Seguros Y Reaseguros S.A.','Privada',100),(1234001,'Alianza Compañía de Seguros y Reaseguros S.A. E','Pública',70),(1234002,'La Boliviana Ciacruz','Pública',50),(1234003,'La Vitalicia','Pública',60),(1234004,'UNIVida S.A. - Sucursal La Paz','Privada',70);
/*!40000 ALTER TABLE `seguro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signosvitales`
--

DROP TABLE IF EXISTS `signosvitales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signosvitales` (
  `CodSignosVitales` int NOT NULL,
  `Respiracion` int DEFAULT NULL,
  `Pulso` int DEFAULT NULL,
  `Temperatura` int DEFAULT NULL,
  `PresionSistolica` int DEFAULT NULL,
  `PresionDistolica` int DEFAULT NULL,
  PRIMARY KEY (`CodSignosVitales`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signosvitales`
--

LOCK TABLES `signosvitales` WRITE;
/*!40000 ALTER TABLE `signosvitales` DISABLE KEYS */;
INSERT INTO `signosvitales` VALUES (1,12,70,40,110,70),(2,15,90,36,100,65),(3,13,65,35,115,75),(4,17,80,37,125,86),(5,18,75,35,130,90);
/*!40000 ALTER TABLE `signosvitales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud`
--

DROP TABLE IF EXISTS `solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud` (
  `CodSolicitud` int NOT NULL,
  `fechaDeSolicitud` date DEFAULT NULL,
  `CI` int DEFAULT NULL,
  `CodSeguro` int DEFAULT NULL,
  PRIMARY KEY (`CodSolicitud`),
  KEY `CI` (`CI`),
  KEY `CodSeguro` (`CodSeguro`),
  CONSTRAINT `solicitud_ibfk_1` FOREIGN KEY (`CI`) REFERENCES `persona` (`CI`),
  CONSTRAINT `solicitud_ibfk_2` FOREIGN KEY (`CodSeguro`) REFERENCES `seguro` (`CodSeguro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

LOCK TABLES `solicitud` WRITE;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
INSERT INTO `solicitud` VALUES (1,'2020-01-21',1234561,1234000),(2,'2019-11-03',1234562,1234001),(3,'2019-05-06',1234563,1234002),(4,'2018-09-02',1234564,1234003),(5,'2018-02-12',1234565,1234004);
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-21 12:05:05
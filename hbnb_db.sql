-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: hbnb_dev_db
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `amenities`
--
use hbnb_dev_db 

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenities` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(128) NOT NULL,
  `state_id` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES ('00b601a4-da90-4972-94cc-9957867bee54','2024-04-25 18:37:49','2024-04-25 18:37:49','Peoria','f0324336-f987-44fc-8fc2-3a73fdbf3807'),('17f6dea6-c1da-49d2-8105-461df9ee8195','2024-04-25 18:37:50','2024-04-25 18:37:50','Eugene','d703e458-abce-4aa1-8a09-5e063b4539bc'),('1fa375c8-54fd-41e9-aa14-60d9527ab4e2','2024-04-25 18:37:46','2024-04-25 18:37:46','Tempe','06db4e96-9b15-4871-8666-28fe9fc85dd9'),('22b45fc1-3316-49e1-9298-de660673048c','2024-04-25 18:37:49','2024-04-25 18:37:49','Lafayette','d87dc7c5-c897-4218-97f5-1c6e0226a969'),('33ed68e9-a48f-417a-8cc3-f0ca397e31a1','2024-04-25 18:37:49','2024-04-25 18:37:49','New Orleans','d87dc7c5-c897-4218-97f5-1c6e0226a969'),('36c7b960-9f50-4212-bc63-3c853e1f73cf','2024-04-25 18:37:48','2024-04-25 18:37:48','Chicago','f0324336-f987-44fc-8fc2-3a73fdbf3807'),('375011eb-775c-4f8e-a337-7e63d06d51e6','2024-04-25 18:37:50','2024-04-25 18:37:50','Jackson','84674573-4c2f-4d0b-8449-69596d7b5ab7'),('4078d8a5-6771-4e10-8f89-a3e0429d87cf','2024-04-25 15:18:41','2024-04-25 15:18:41','San Francisco','c303c509-0cec-4a34-933f-112563be5912'),('44360ea0-4299-4503-980c-a9a04fa7f8d7','2024-04-25 18:37:46','2024-04-25 18:37:46','Douglas','06db4e96-9b15-4871-8666-28fe9fc85dd9'),('459f5805-ff47-4d55-b0d0-e14ee1127e59','2024-04-25 18:37:50','2024-04-25 18:37:50','Meridian','84674573-4c2f-4d0b-8449-69596d7b5ab7'),('4e2c4a89-9b7e-4b86-9821-dc10d92cda87','2024-04-25 18:37:50','2024-04-25 18:37:50','Tupelo','84674573-4c2f-4d0b-8449-69596d7b5ab7'),('55f10d0b-200b-4b21-b9c7-85d63bee9fde','2024-04-25 18:37:48','2024-04-25 18:37:48','Joliet','f0324336-f987-44fc-8fc2-3a73fdbf3807'),('61c41f7f-869b-4fa1-9997-b221f6a7418b','2024-04-25 18:37:46','2024-04-25 18:37:46','Kearny','06db4e96-9b15-4871-8666-28fe9fc85dd9'),('6b56a86d-88a5-4377-925d-2356b1be4cf1','2024-04-25 18:37:50','2024-04-25 18:37:50','Portland','d703e458-abce-4aa1-8a09-5e063b4539bc'),('729ca0cd-d5d4-43fe-a0a2-8d018100c413','2024-04-25 18:37:49','2024-04-25 18:37:49','Saint Paul','18c63336-068d-4f41-9a0e-66e0ca0619b9'),('7765322b-5d6c-4e12-a0b7-c0dedb2e50de','2024-04-25 18:37:47','2024-04-25 18:37:47','Sonoma','a2eb76ba-309f-4ca4-9f6e-fc8529f083a9'),('85e392c3-9738-47a6-9103-367b84232b51','2024-04-25 18:37:48','2024-04-25 18:37:48','Kailua','d2ec3cd7-bb6e-40f1-a483-00855cc6100a'),('88828acb-f906-414c-9873-8878dcbdfca6','2024-04-25 18:37:48','2024-04-25 18:37:48','Honolulu','d2ec3cd7-bb6e-40f1-a483-00855cc6100a'),('96b592d1-2719-4121-928c-bd808b007466','2024-04-25 18:37:47','2024-04-25 18:37:47','San Jose','a2eb76ba-309f-4ca4-9f6e-fc8529f083a9'),('97262827-c9bb-4dfc-a33f-e3628917641a','2024-04-25 18:37:45','2024-04-25 18:37:45','Babbie','3082867f-2ba6-468e-b288-f5e078f01b3b'),('9dbfe47b-72f0-4b3e-b692-4978f0797a32','2024-04-25 18:37:49','2024-04-25 18:37:49','Naperville','f0324336-f987-44fc-8fc2-3a73fdbf3807'),('a102867c-61ab-40f0-9080-0b6f139b040d','2024-04-25 18:37:49','2024-04-25 18:37:49','Urbana','f0324336-f987-44fc-8fc2-3a73fdbf3807'),('ae434182-f228-4248-84f1-b4154d850b3b','2024-04-25 18:37:46','2024-04-25 18:37:46','Calera','3082867f-2ba6-468e-b288-f5e078f01b3b'),('b1c84882-951d-4b83-b6dd-4b1334450676','2024-04-25 18:37:49','2024-04-25 18:37:49','Baton rouge','d87dc7c5-c897-4218-97f5-1c6e0226a969'),('c3a3a589-b7ac-4c49-bce1-d6896c374aa2','2024-04-25 15:16:22','2024-04-25 15:16:22','San Jose','0f8f9150-902d-4e72-b7ca-f4154a3b2f7e'),('c7ad82da-ef94-4551-9503-c04fb47dfd10','2024-04-25 15:17:17','2024-04-25 15:17:17','San Francisco','c8bfb67c-8e5f-4b9f-a8e0-8d200d9ef8b3'),('d29c747d-2181-4ff0-844c-a61bd284bd80','2024-04-25 18:37:47','2024-04-25 18:37:47','San Francisco','a2eb76ba-309f-4ca4-9f6e-fc8529f083a9'),('d49d2292-af5d-4e88-8ee9-03e80c93ca2e','2024-04-25 18:37:47','2024-04-25 18:37:47','Denver','778a93bc-9853-4d7e-a0d3-f85968e41aa0'),('d51aae7d-ab56-436d-b370-1bfcf4fb9af9','2024-04-25 15:16:21','2024-04-25 15:16:21','San Francisco','0f8f9150-902d-4e72-b7ca-f4154a3b2f7e'),('d9fd437b-7d0c-432d-ac4e-cf3cba8f4b7a','2024-04-25 18:37:46','2024-04-25 18:37:46','Fairfield','3082867f-2ba6-468e-b288-f5e078f01b3b'),('e0612b66-fb73-4236-a489-7c6a5ccf7335','2024-04-25 18:37:48','2024-04-25 18:37:48','Pearl city','d2ec3cd7-bb6e-40f1-a483-00855cc6100a'),('e2f8eab1-b4f7-4a0c-9294-8a7f00f5da4a','2024-04-25 18:37:45','2024-04-25 18:37:45','Akron','3082867f-2ba6-468e-b288-f5e078f01b3b'),('e90a502e-a205-497b-88ed-d0a61048b741','2024-04-25 18:37:47','2024-04-25 18:37:47','Napa','a2eb76ba-309f-4ca4-9f6e-fc8529f083a9'),('ea37f40b-9996-4df6-847f-c9b34e07d8ba','2024-04-25 18:37:48','2024-04-25 18:37:48','Orlando','e3e4bcd6-c735-43b8-88f1-a20866008652'),('ea657192-3622-4d94-809d-7d6836bbaf73','2024-04-25 18:37:46','2024-04-25 18:37:46','Fremont','a2eb76ba-309f-4ca4-9f6e-fc8529f083a9'),('fe4f7e0c-72b5-4220-abd9-a442127234ae','2024-04-25 18:37:48','2024-04-25 18:37:48','Miami','e3e4bcd6-c735-43b8-88f1-a20866008652');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_amenity`
--

DROP TABLE IF EXISTS `place_amenity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place_amenity` (
  `place_id` varchar(60) NOT NULL,
  `amenity_id` varchar(60) NOT NULL,
  PRIMARY KEY (`place_id`,`amenity_id`),
  KEY `amenity_id` (`amenity_id`),
  CONSTRAINT `place_amenity_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`),
  CONSTRAINT `place_amenity_ibfk_2` FOREIGN KEY (`amenity_id`) REFERENCES `amenities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_amenity`
--

LOCK TABLES `place_amenity` WRITE;
/*!40000 ALTER TABLE `place_amenity` DISABLE KEYS */;
/*!40000 ALTER TABLE `place_amenity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `places` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `city_id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `number_rooms` int NOT NULL,
  `number_bathrooms` int NOT NULL,
  `max_guest` int NOT NULL,
  `price_by_night` int NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `places_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `places_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES ('6ab21aef-cd5d-4a66-b21f-6e2c164c7c6d','2024-04-25 15:17:19','2024-04-25 15:17:19','c7ad82da-ef94-4551-9503-c04fb47dfd10','4c1020fe-b3a5-4d5f-89ea-5f749926de97','Lovely place',NULL,3,1,6,120,37.774,-122.431),('9bcb6487-fbef-4bc0-bde6-26b4b8513a21','2024-04-25 15:18:42','2024-04-25 15:18:42','4078d8a5-6771-4e10-8f89-a3e0429d87cf','d6003ce6-bf4a-43d9-ab37-783ab9000a1d','Lovely place',NULL,3,1,6,120,37.774,-122.431);
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `text` varchar(1024) NOT NULL,
  `place_id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `place_id` (`place_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES ('cd448c1a-f29e-45a5-a294-754b9833d4c6','2024-04-25 15:18:44','2024-04-25 15:18:44','Amazing place, huge kitchen','9bcb6487-fbef-4bc0-bde6-26b4b8513a21','09b61d98-bfab-46ef-b85b-6170f6370a1e');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES ('06db4e96-9b15-4871-8666-28fe9fc85dd9','2024-04-25 18:37:46','2024-04-25 18:37:46','Arizona'),('0f8f9150-902d-4e72-b7ca-f4154a3b2f7e','2024-04-25 15:16:19','2024-04-25 15:16:19','California'),('16596c63-7bd5-4664-b7b5-8a33e8306ef7','2024-04-25 18:36:04','2024-04-25 18:36:04','Alabama'),('18c63336-068d-4f41-9a0e-66e0ca0619b9','2024-04-25 18:37:49','2024-04-25 18:37:49','Minnesota'),('194ad90d-4035-444c-97ce-15186ca10d46','2024-04-25 18:36:05','2024-04-25 18:36:05','Hawaii'),('22ca3517-5a4d-45bc-8300-e4a7ea046b3c','2024-04-25 18:36:04','2024-04-25 18:36:04','Colorado'),('3082867f-2ba6-468e-b288-f5e078f01b3b','2024-04-25 18:37:45','2024-04-25 18:37:45','Alabama'),('5c76b955-4dc0-48c3-b48b-8566c95701c5','2024-04-25 18:36:05','2024-04-25 18:36:05','Indiana'),('5f80eb00-a226-4819-985e-6a489448e20b','2024-04-25 18:36:04','2024-04-25 18:36:04','Florida'),('69183d0f-63ac-4b03-b554-5d9894119f07','2024-04-25 18:36:04','2024-04-25 18:36:04','Arizona'),('778a93bc-9853-4d7e-a0d3-f85968e41aa0','2024-04-25 18:37:47','2024-04-25 18:37:47','Colorado'),('7d467def-9a9b-41af-890f-79b458fa01e7','2024-04-25 18:37:48','2024-04-25 18:37:48','Georgia'),('84674573-4c2f-4d0b-8449-69596d7b5ab7','2024-04-25 18:37:49','2024-04-25 18:37:49','Mississippi'),('8869855c-4495-4cd8-ac8d-6f093eb73f1b','2024-04-25 18:36:04','2024-04-25 18:36:04','California'),('8a95d745-d84d-4ee1-89fb-b24f0f0fa9e4','2024-04-25 18:36:05','2024-04-25 18:36:05','Oregon'),('8bd6452f-7b05-4162-b905-215b38829153','2024-04-25 18:36:05','2024-04-25 18:36:05','Louisiana'),('99174f70-bbdb-4435-8154-2feaa1b46e8b','2024-04-25 18:37:49','2024-04-25 18:37:49','Indiana'),('9aa06ca0-5bb6-4e71-b644-ec58cf2e8f52','2024-04-25 18:36:05','2024-04-25 18:36:05','Minnesota'),('a2eb76ba-309f-4ca4-9f6e-fc8529f083a9','2024-04-25 18:37:46','2024-04-25 18:37:46','California'),('a3170d6a-14ce-4f29-926b-d68eaf7838fe','2024-04-25 18:36:04','2024-04-25 18:36:04','Georgia'),('c303c509-0cec-4a34-933f-112563be5912','2024-04-25 15:18:40','2024-04-25 15:18:40','California'),('c8bfb67c-8e5f-4b9f-a8e0-8d200d9ef8b3','2024-04-25 15:17:16','2024-04-25 15:17:16','California'),('d2ec3cd7-bb6e-40f1-a483-00855cc6100a','2024-04-25 18:37:48','2024-04-25 18:37:48','Hawaii'),('d703e458-abce-4aa1-8a09-5e063b4539bc','2024-04-25 18:37:50','2024-04-25 18:37:50','Oregon'),('d87dc7c5-c897-4218-97f5-1c6e0226a969','2024-04-25 18:37:49','2024-04-25 18:37:49','Louisiana'),('dff387e0-068d-41cf-8fda-19d7b628b657','2024-04-25 18:36:05','2024-04-25 18:36:05','Illinois'),('e3e4bcd6-c735-43b8-88f1-a20866008652','2024-04-25 18:37:47','2024-04-25 18:37:47','Florida'),('f0324336-f987-44fc-8fc2-3a73fdbf3807','2024-04-25 18:37:48','2024-04-25 18:37:48','Illinois'),('f4c266f5-8ce3-4ddf-b853-cfcc50354fa2','2024-04-25 18:36:05','2024-04-25 18:36:05','Mississippi');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('09b61d98-bfab-46ef-b85b-6170f6370a1e','2024-04-25 15:18:43','2024-04-25 15:18:43','bob@hbtn.io','bobpwd','Bob','Dylan'),('2b9450c6-c1f5-4ab7-b8da-29bd8021a14d','2024-04-25 15:16:48','2024-04-25 15:16:48','gui@hbtn.io','guipwd','Guillaume','Snow'),('4c1020fe-b3a5-4d5f-89ea-5f749926de97','2024-04-25 15:17:18','2024-04-25 15:17:18','gui@hbtn.io','guipwd','Guillaume','Snow'),('d6003ce6-bf4a-43d9-ab37-783ab9000a1d','2024-04-25 15:18:41','2024-04-25 15:18:41','gui@hbtn.io','guipwd','Guillaume','Snow');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-26 14:50:09

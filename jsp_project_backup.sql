-- MySQL dump 10.13  Distrib 8.0.32, for macos13.0 (arm64)
--
-- Host: localhost    Database: JSP_Project
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Current Database: `JSP_Project`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `JSP_Project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `JSP_Project`;

--
-- Table structure for table `destination_image`
--

DROP TABLE IF EXISTS `destination_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destination_image` (
  `destination_img_id` varchar(255) NOT NULL,
  `img_path` varchar(255) NOT NULL,
  PRIMARY KEY (`destination_img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destination_image`
--

LOCK TABLES `destination_image` WRITE;
/*!40000 ALTER TABLE `destination_image` DISABLE KEYS */;
INSERT INTO `destination_image` VALUES ('boston_img1','https://example.com/images/boston1.jpg'),('chicago_img1','https://example.com/images/chicago1.jpg'),('dc_img1','https://example.com/images/dc1.jpg'),('la_img1','https://example.com/images/la1.jpg'),('miami_img1','https://example.com/images/miami1.jpg'),('nyc_img1','https://example.com/images/nyc1.jpg'),('orlando_img1','https://example.com/images/orlando1.jpg'),('seattle_img1','https://example.com/images/seattle1.jpg'),('sf_img1','https://example.com/images/sf1.jpg'),('vegas_img1','https://example.com/images/vegas1.jpg');
/*!40000 ALTER TABLE `destination_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destination_listings`
--

DROP TABLE IF EXISTS `destination_listings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destination_listings` (
  `destination_id` int NOT NULL AUTO_INCREMENT,
  `destination_name` char(50) NOT NULL,
  `destination_img_id` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  PRIMARY KEY (`destination_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destination_listings`
--

LOCK TABLES `destination_listings` WRITE;
/*!40000 ALTER TABLE `destination_listings` DISABLE KEYS */;
INSERT INTO `destination_listings` VALUES (1,'New York City','nyc_img1','The largest city in the United States, famous for its skyscrapers and cultural landmarks.'),(2,'Los Angeles','la_img1','The second largest city in the United States, famous for its beaches and Hollywood entertainment industry.'),(3,'Chicago','chicago_img1','The third largest city in the United States, famous for its architecture and deep dish pizza.'),(4,'San Francisco','sf_img1','A city located in northern California, famous for its hilly terrain and iconic Golden Gate Bridge.'),(5,'Miami','miami_img1','A coastal city located in southeastern Florida, famous for its beaches and nightlife.'),(6,'Las Vegas','vegas_img1','A city located in the middle of the desert, famous for its casinos, entertainment, and nightlife.'),(7,'Boston','boston_img1','The capital city of Massachusetts, famous for its history and higher education institutions.'),(8,'Seattle','seattle_img1','A city located in the Pacific Northwest region, famous for its coffee culture and iconic Space Needle.'),(9,'Orlando','orlando_img1','A city located in central Florida, famous for its theme parks and attractions.'),(10,'Washington D.C.','dc_img1','The capital city of the United States, famous for its history and landmarks.');
/*!40000 ALTER TABLE `destination_listings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flights` (
  `flight_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `destination_id` int NOT NULL,
  `starting_airport` char(50) NOT NULL,
  `destination_airport` char(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `cost` int NOT NULL,
  `flight_number` varchar(20) NOT NULL,
  PRIMARY KEY (`flight_id`),
  KEY `user_id` (`user_id`),
  KEY `destination_id` (`destination_id`),
  CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`destination_id`) REFERENCES `destination_listings` (`destination_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES (1,1,1,'JFK','LGA','2023-06-01','2023-06-02',500,'WU2853'),(2,1,2,'LGA','LAX','2023-06-02','2023-06-03',800,'CO5414'),(3,1,3,'LAX','ORD','2023-06-03','2023-06-04',900,'AO6113'),(4,1,4,'ORD','SFO','2023-06-04','2023-06-05',1000,'LI2914'),(5,1,5,'SFO','MIA','2023-06-05','2023-06-06',1100,'NR8118'),(6,1,6,'MIA','LAS','2023-06-06','2023-06-07',1200,'BW0748'),(7,1,7,'LAS','BOS','2023-06-07','2023-06-08',1300,'VX0652'),(8,1,8,'BOS','SEA','2023-06-08','2023-06-09',1400,'PU1995'),(9,1,9,'SEA','MCO','2023-06-09','2023-06-10',1500,'PK2008'),(10,1,10,'MCO','DCA','2023-06-10','2023-06-11',1600,'UK6807');
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotels` (
  `hotel_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `destination_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `cost` int NOT NULL,
  `hotel_name` char(50) NOT NULL,
  PRIMARY KEY (`hotel_id`),
  KEY `user_id` (`user_id`),
  KEY `destination_id` (`destination_id`),
  CONSTRAINT `hotels_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `hotels_ibfk_2` FOREIGN KEY (`destination_id`) REFERENCES `destination_listings` (`destination_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (1,1,1,'2023-06-03','2023-06-04',209,'DSA HOTEL'),(2,1,2,'2023-06-04','2023-06-05',262,'CKQ HOTEL'),(3,1,3,'2023-06-05','2023-06-06',482,'AEW HOTEL'),(4,1,4,'2023-06-06','2023-06-07',221,'SYR HOTEL'),(5,1,5,'2023-06-07','2023-06-08',364,'MLV HOTEL'),(6,1,6,'2023-06-08','2023-06-09',356,'SDP HOTEL'),(7,1,7,'2023-06-09','2023-06-10',486,'MPN HOTEL'),(8,1,8,'2023-06-10','2023-06-11',260,'UJM HOTEL'),(9,1,9,'2023-06-11','2023-06-12',246,'JIQ HOTEL'),(10,1,10,'2023-06-12','2023-06-13',249,'CNK HOTEL');
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `username` char(50) NOT NULL,
  `password` char(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John Smith','johnsmith','password1');
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

-- Dump completed on 2023-05-03 19:01:44

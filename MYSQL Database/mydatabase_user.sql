-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydatabase
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `major` varchar(45) NOT NULL,
  `region` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `birthDate` varchar(45) NOT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Zainab Ibrahim','ibrahim-zainab@hotmail.com','$2a$10$RfT0yjCiaVTOpYGVzksxXuqM8bpaVntu6oJzYGSzneWuLa1TKeIDC',NULL,'Computer Science Student','Marjaayoun',NULL,'0000-00-00'),(2,'zainab','zainab@gmail.com','$2a$10$g66qOygab0TcY5hiJ8W5N.DyIFEm/c0UFod46Jfw7bA0Ze1y40/XW','','student','Bent Jbail','','2021-08-27'),(4,'Fatima','fatima@gmail.com','$2a$10$kkfGCE.O1BZ9aCsaAwFche0gRqyFCUjWsRgs94f/DRflSmpqT3Tr6','','student','Beirut','','2021-08-11'),(5,'hasan fayyad','hasan','$2a$10$LGVuyCuaNurz.NpQsanOgeSUPRfT/DP6.hk3dXl8EFq2aaG.EcYiK','','computer science','Beirut','','2021-08-27'),(6,'hassan','hasan@gmail.com','$2a$10$fCP8ibutfe2Un1A5aqWVDO/KFttgxUt/xERFp0NurmSYLeWRwXwJS','','student','Beirut','','2021-08-27'),(7,'roukaya','roukaya','$2a$10$8OWMlxOnq3lipYrXQynT8.0fm.rGl.v2bjRK7903L8MT7d70J.1YO','','student','Beirut','','2021-08-27'),(8,'zahraa','zahraa','$2a$10$n86NgA5G79r.1B/9WSa.8.Sj8bskJFTidz6W4hVWzzLpq5B1SlSnS','','student','Hermel','','2021-08-27'),(9,'zeina','zeina','$2a$10$LA041dyxN2bgXG9/y8dLYOjwCHSuHYx3yWlQsTWKH728taq.MRbVW','','teacher','Bent Jbail','','2021-08-10'),(10,'zein','zein','$2a$10$owVNbDMlOHfXxuRqTVRtB.vUFVlaWbWJWEp.FQjosLddADqKf5Usy','','teacher','Beirut','','2021-08-27'),(11,'ali','ali','$2a$10$1gV4S5.LHRQc8bY1VOTq9OJPnmaCAtBkoGqU/Zp3o1H3tbEsuvJg6','','doctor','Beirut','','2021-08-27'),(12,'alia','alia','$2a$10$0V.rF.OJJPzS9vsqjw2fJ.K29AO764dTkuL5saYyIUHa5cFe5CtlG','','nothing','Beirut','','2021-08-27'),(13,'Ibrahim','ibrahim-zainab@outlook.com','$2a$10$1Ryuri1sOAt022oRoihNoea9dR7BuTRpN86xc4NMlb30C7EKXYXe6',NULL,'Computer Science Student','Marjaayoun',NULL,'2000-08-27'),(14,'ibrahim','ibrahim@outlook.com','$2a$10$A6JLuBueuLvHOcHFoCbLweECEqUuxbqXOxuEw7CFxswTJ1OW3Yjxi',NULL,'Computer Science Student','Marjaayoun',NULL,'2000-08-27'),(15,'roa','roa@outlook.com','$2a$10$h/h4jIBK5AKVpE5VZBRULufYgT.YquEfPyAkQKTqhSAQklNOmhqHW',NULL,'Computer Science Student','Marjaayoun',NULL,'2000-08-27'),(16,'roaa','roaa@outlook.com','$2a$10$RgQwXvZx5NYGjUPxbGsYkOB3UcX7ReSElf.T1lxYnh80W1XF5xcHi',NULL,'Computer Science Student','Marjaayoun',NULL,'2000-08-27'),(17,'kamal','kamal@gmail.com','$2a$10$9yGiKTIYSPsONFLRmBJWG.Lb0kjTjV6Dhe3CHAssPuPAjX.M3xwVi','','doctor','Beirut','','2021-08-27');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-29 16:26:52

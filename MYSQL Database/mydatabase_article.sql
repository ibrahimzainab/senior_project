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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `idarticle` int NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `text` text NOT NULL,
  `imagePath` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idarticle`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'Bugs could be useful in the garden','Content content content content content content content content content content content content content content content content ',NULL),(2,'Why you should not trim your trees','Flying a hero from one route to another as it transforms from a circular shape to a rectangular shape is a slick effect that you can implement using Hero widgets. To accomplish this, the code animates the intersection of two clip shapes: a circle and a square. Throughout the animation, the circle clip (and the image) scales from minRadius to maxRadius, while the square clip maintains constant size. At the same time, the image flies from its position in the source route to its position in the destination route. For visual examples of this transition, see Radial transformation in the Material motion spec.\\nThis animation might seem complex (and it is), but you can customize the provided example to your needs. The heavy lifting is done for you.\\n\\nThe blue gradient (representing the image), indicates where the clip shapes intersect. At the beginning of the transition, the result of the intersection is a circular clip (ClipOval). During the transformation, the ClipOval scales from minRadius to maxRadius while the ClipRect maintains a constant size. At the end of the transition the intersection of the circular and rectangular clips yield a rectangle that’s the same size as the hero widget. In other words, at the end of the transition the image is no longer clipped.','assets/images/plant_grainy_illustration_alinashi.png'),(3,'A really really really really really really really really long long long long title','Content content content content content content content content content content content content content content content content',NULL),(4,'Something about planting something during summer','Content content content content content content content content content content content content content content content content ',NULL),(5,'Short title','Content content content content content content content content content content content content content content content content',NULL),(6,'Bugs could be useful in the garden','Content content content content content content content content content content content content content content content content',NULL),(7,'Bugs could be useful in the garden','Content content content content content content content content content content content content content content content content',NULL);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-29 16:26:51

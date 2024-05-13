-- MySQL dump 10.13  Distrib 8.3.0, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gtshop
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('9de8ab65-e72b-440f-831a-d5b5a90bad8a','778b4e10c2f2593ad3cae9304cab44ea6cd60cecb4e6fc97a3aecf96dbd5f720','2024-04-27 13:37:53.946','20240427133753_gtshop',NULL,NULL,'2024-04-27 13:37:53.861',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `itemID` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (2,2,2),(3,1,2),(4,1,1),(5,1,1),(13,4,16),(14,4,17),(15,3,28),(16,3,30),(17,3,29),(18,3,32),(19,4,23),(20,4,24),(21,4,25),(22,4,26),(24,4,37),(25,4,35),(26,32,17),(28,32,20),(30,34,15);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (15,'https://media.veli.store/media/product/4903208024983-101.jpg','new','ნივთის ზომა: 26 × 26 × 4.5 სმ',67,'2024-05-03 10:18:18.370'),(17,'https://media.veli.store/media/product/8697918902322-3.jpg','ოვალური ','ნივთის ზომა: 26 სმ',240,'2024-05-03 10:21:04.693'),(19,'https://media.veli.store/media/product/8411712763893-11.jpg','gio','giogio',3333,'2024-05-07 13:51:35.440'),(20,'https://media.veli.store/media/product/8720362198260.jpg','Mica Decorations,','დაწნული ლანგრების ნაკრები, 3 ცალი',20,'2024-05-10 13:43:33.222'),(21,'https://media.veli.store/media/product/373546-Z.jpg','WOOOD, Hari,','ხის ჯამი',50,'2024-05-10 13:44:03.545'),(22,'https://media.veli.store/media/product/8720362945925.jpg','Mica Decorations','სერვირების ჯამი, Ø35 სმ',10,'2024-05-10 13:44:35.048'),(23,'https://media.veli.store/media/product/kalati.jpg','Chefs Soul','სამ დონიანი ხილის კალათა',25,'2024-05-10 13:45:04.378'),(24,'https://media.veli.store/media/product/8720362953302.jpg','Mica Decorations','ჯამი ბადრიჯნის დიზაინით',55,'2024-05-10 13:45:26.996'),(25,'https://media.veli.store/media/product/8697918844271.webp','Karaca','ფაიფურის თასები, 5 სმ',50,'2024-05-10 13:45:59.943'),(26,'https://media.veli.store/media/product/8683650056577.jpg','Karaca','თასი/სასოუსე, 4 ცალი',50,'2024-05-10 13:46:35.932'),(27,'https://media.veli.store/media/product/8720362953296.jpg','Mica Decorations','ჯამი პომიდვრის დიზაინით',30,'2024-05-10 13:47:27.658'),(28,'https://media.veli.store/media/product/dell.1920x1080303020034.jpeg','Dell G16 7630','Intel Core i5-13450HX ',2000,'2024-05-10 13:48:12.036'),(29,'https://media.veli.store/media/product/14IRH8_-1.jpg','Lenovo Yoga','14IRH8 82Y70062RK ',3349,'2024-05-10 13:48:48.572'),(30,'https://media.veli.store/media/product/Untitled_-_2023-12-04T173728.060111269592205_43_29_900x900-1000x1000.webp','Acer Aspire 3','A315-24P Ryzen 5 7520U',1250,'2024-05-10 13:49:18.492'),(31,'https://media.veli.store/media/product/TCL_65P745_black_1_final.jpg','TCL 65P745 65\'','4K UHD TV Black',1000,'2024-05-10 13:50:54.998'),(32,'https://media.veli.store/media/product/tcl_c745_gaming_tv_65_black_1.jpg','TCL ','QLED Gaming TV Black',0,'2024-05-10 13:51:15.236'),(33,'https://media.veli.store/media/product/shopify-image_32b96de8-4e96-4804-9ba2-882d06e62dbb_1400x_wj1r-ik.jpg.jpg','Samsung ','4K Smart UHD TV Black',1500,'2024-05-10 13:51:55.301'),(34,'https://media.veli.store/media/product/smartqledtv50inchsmsng-1.jpg','Samsung ','4K QLED Smart TV Black',2500,'2024-05-10 13:52:27.230'),(35,'https://media.veli.store/media/product/7117195771951.jpg','PlayStation 5 Console','1TB Slim With CD Version White',1000,'2024-05-10 13:53:07.930'),(36,'https://media.veli.store/media/product/61hwaBMvOxL._SL1500_.jpg','Microsoft ','Xbox Series S Digital 1',1000,'2024-05-10 13:53:29.298'),(37,'https://media.veli.store/media/product/Electrolux_dishwasher_EMG48200L_1.jpg','ჭურჭლის სარეცხი ','Electrolux EMG48200L ',1400,'2024-05-10 13:54:06.998');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `upassword` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `groups` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_key` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'tako','$2b$10$qRJ.BWWe12Hz1jZJDjyf7epTMTI1oLdgB6J7S7ybb5MP6XNhgJ.ey','tako@gmail.com','2024-04-30 06:02:02.751','users'),(4,'gio','$2b$10$BSthUraIgKytYV2e1YXVa.1NYv7rtxRuovVsT2XLZM86qKMrEl4Sq','tako@gmail.com','2024-04-30 06:02:19.503','users');
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

-- Dump completed on 2024-05-13 13:13:07

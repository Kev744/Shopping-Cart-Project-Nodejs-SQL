-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: tp5
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id_article` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `quantite` int NOT NULL,
  PRIMARY KEY (`id_article`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (3,'Vélo','Allez au bout du monde avec ce magnifique vélo','150','https://www.cdiscount.com/pdt2/0/1/s/1/300x300/veveng2601s/rw/toimsa-velo-26-cadre-acier-homme-18-vitesse.jpg',5),(4,'Trotinette','Slalommez entre les taxis et les bus avec ce bolide !','50','https://www.cdiscount.com/pdt2/8/3/8/1/300x300/auc5900168932838/rw/hypermotion-trottinette-rockster-charge-max-100-k.jpg',50),(5,'Table de ping-pong','Le moment de détente que tout le monde attend entre deux pauses !','400','https://www.cdiscount.com/pdt2/6/0/6/1/300x300/spo4013771089606/rw/sponeta-table-tennis-de-table-table-ping-pong-co.jpg',5),(6,'Requin blanc','Quoi de mieux qu\'un requin pour mettre l\'ambiance dans votre soirée ?','15','https://www.cdiscount.com/pdt2/6/5/2/1/300x300/sch4005086147652/rw/figurine-requin-tigre.jpg',5),(12,'Ballon de footdddd','Entre copains !','15','www.google.fr',5),(23,'Ballon de foot','Entre copains !','15','www.google.fr',5),(24,'Ballon de foot','Entre copains !','15','www.google.fr',5),(29,'Portugal','0','1','France',5),(33,'Portugal','Footb','1','www.google.fr',5),(34,'Ballon de foot','Entre copains !','15','www.google.fr',5),(36,'Arabie','Saoudite','1','www.google.fr',5),(37,'fdffddf','ddospjdji','15','www.google.fr',5),(48,'ddddddd','dddddd','3','ddddddddddd',5),(49,'ddddddd','dddddd','3','ddddddddddd',5),(52,'ffffffffff','ffffffffff','4','ffffffffffffffff',5),(54,'ffffffffff','ffffffffff','4','ffffffffffffffff',5),(56,'ffffffffff','ffffffffff','4','ffffffffffffffff',5),(58,'dddddd','dddddddd','2','dddddddd',5),(59,'dddddd','dddddddd','2','dddddddd',5),(63,'ddddd','dddd','1','sssssss',5),(64,'ddddd','dddd','1','sssssss',5),(66,'ddddd','dddd','1','sssssss',5),(67,'ddddd','dddd','1','sssssss',5),(68,'ddddd','dddd','1','sssssss',5),(70,'ddddd','dddd','1','sssssss',5),(71,'ddddd','dddd','1','sssssss',5),(72,'ddddd','dddd','1','sssssss',5),(73,'ddddd','dddd','1','sssssss',5),(74,'ddddd','dddd','1','sssssss',5),(75,'ddddd','dddd','1','sssssss',5),(76,'ddddd','dddd','1','sssssss',5),(77,'ddddd','dddd','1','sssssss',5),(78,'ddddd','dddd','1','sssssss',5),(79,'ddddd','dddd','1','sssssss',5),(80,'ddddd','dddd','1','sssssss',5),(81,'ddddd','dddd','1','sssssss',5),(82,'ddddd','dddd','1','sssssss',5),(83,'ddddd','dddd','1','sssssss',5),(84,'ddddd','dddd','1','sssssss',5),(85,'ddddd','dddd','1','sssssss',5),(86,'ddddd','dddd','1','sssssss',5),(87,'ddddd','dddd','1','sssssss',5),(88,'ddddd','dddd','1','sssssss',5),(89,'ddddd','dddd','1','sssssss',5),(91,'ddddd','dddd','1','sssssss',5),(92,'ddddd','dddd','1','sssssss',5),(93,'ddddd','dddd','1','sssssss',5),(94,'ddddd','dddd','1','sssssss',5),(95,'ter','rrr','5','dddddddddsssssss',5),(96,'ter','rrr','5','dddddddddsssssss',5),(97,'aazzssd','dzzs','1','ddddzzzzzzzzz',5),(98,'aazzssd','dzzs','1','ddddzzzzzzzzz',5),(99,'aazzssd','dzzs','1','ddddzzzzzzzzz',5),(100,'fff','ffddf','1','fffffffsds',5),(101,'ffff','dddddd','2','ssssss',5),(102,'ffff','dddddd','2','ssssss',5),(103,'ffff','dddddd','2','ssssss',5),(104,'nique ta mere','qs','1','sqq',5),(105,'ddddddddds','qsAZ','4','AZZ',0),(107,'Enfin','Le prodige succès','4','Xeres',5),(108,'sss','ssssssss','2','ssssssssssssss',5),(109,'Coucou','Piti','3','Corps',5),(110,'ddd','ddd','1','sss',5),(111,'Essai','Final','4','Yes',5),(112,'dd','xxx','1','dssss',5),(113,'Portugal','Les vacances','1200','https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/2560px-Flag_of_Portugal.svg.png',5),(115,'Portugal','Les vacances','1200','ssss',5),(116,'ddd','dd','10','ddd',5),(117,'Ballon de foot','Entre copains !','15','www.google.fr',5),(119,'Essai','Final','4','https://www.cdiscount.com/pdt2/7/7/4/1/300x300/auc2009961531774/rw/kayak-airfusion-2013.jpg',5),(120,'Alors','On danse','3','Oupas',3),(121,'Alors','On danse','3','Ou pas ?',3);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panier`
--

DROP TABLE IF EXISTS `panier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `panier` (
  `idpanier` int NOT NULL AUTO_INCREMENT,
  `iduser` int NOT NULL,
  PRIMARY KEY (`idpanier`,`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panier`
--

LOCK TABLES `panier` WRITE;
/*!40000 ALTER TABLE `panier` DISABLE KEYS */;
INSERT INTO `panier` VALUES (35,5),(36,5),(37,5),(38,6),(39,5),(40,5),(41,6),(42,5),(43,5),(44,5);
/*!40000 ALTER TABLE `panier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panier_item`
--

DROP TABLE IF EXISTS `panier_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `panier_item` (
  `idpanieritem` int NOT NULL AUTO_INCREMENT,
  `id_article` int NOT NULL,
  `image` varchar(10000) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `iduser` int NOT NULL,
  PRIMARY KEY (`idpanieritem`,`id_article`,`iduser`),
  KEY `iduser_idx` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panier_item`
--

LOCK TABLES `panier_item` WRITE;
/*!40000 ALTER TABLE `panier_item` DISABLE KEYS */;
INSERT INTO `panier_item` VALUES (23,3,'https://www.cdiscount.com/pdt2/0/1/s/1/300x300/veveng2601s/rw/toimsa-velo-26-cadre-acier-homme-18-vitesse.jpg','Vélo','Allez au bout du monde avec ce magnifique vélo','150',6),(24,5,'https://www.cdiscount.com/pdt2/6/0/6/1/300x300/spo4013771089606/rw/sponeta-table-tennis-de-table-table-ping-pong-co.jpg','Table de ping-pong','Le moment de détente que tout le monde attend entre deux pauses !','400',6),(25,5,'https://www.cdiscount.com/pdt2/6/0/6/1/300x300/spo4013771089606/rw/sponeta-table-tennis-de-table-table-ping-pong-co.jpg','Table de ping-pong','Le moment de détente que tout le monde attend entre deux pauses !','400',6),(26,3,'https://www.cdiscount.com/pdt2/0/1/s/1/300x300/veveng2601s/rw/toimsa-velo-26-cadre-acier-homme-18-vitesse.jpg','Vélo','Allez au bout du monde avec ce magnifique vélo','150',6),(27,3,'https://www.cdiscount.com/pdt2/0/1/s/1/300x300/veveng2601s/rw/toimsa-velo-26-cadre-acier-homme-18-vitesse.jpg','Vélo','Allez au bout du monde avec ce magnifique vélo','150',6),(28,5,'https://www.cdiscount.com/pdt2/6/0/6/1/300x300/spo4013771089606/rw/sponeta-table-tennis-de-table-table-ping-pong-co.jpg','Table de ping-pong','Le moment de détente que tout le monde attend entre deux pauses !','400',6),(29,5,'https://www.cdiscount.com/pdt2/6/0/6/1/300x300/spo4013771089606/rw/sponeta-table-tennis-de-table-table-ping-pong-co.jpg','Table de ping-pong','Le moment de détente que tout le monde attend entre deux pauses !','400',6),(30,5,'https://www.cdiscount.com/pdt2/6/0/6/1/300x300/spo4013771089606/rw/sponeta-table-tennis-de-table-table-ping-pong-co.jpg','Table de ping-pong','Le moment de détente que tout le monde attend entre deux pauses !','400',6),(31,5,'https://www.cdiscount.com/pdt2/6/0/6/1/300x300/spo4013771089606/rw/sponeta-table-tennis-de-table-table-ping-pong-co.jpg','Table de ping-pong','Le moment de détente que tout le monde attend entre deux pauses !','400',6),(32,4,'https://www.cdiscount.com/pdt2/8/3/8/1/300x300/auc5900168932838/rw/hypermotion-trottinette-rockster-charge-max-100-k.jpg','Trotinette','Slalommez entre les taxis et les bus avec ce bolide !','50',5),(33,34,'www.google.fr','Ballon de foot','Entre copains !','15',5),(34,8,'www.google.fr','Ballon de foot','Entre copains !','15',6),(35,6,'https://www.cdiscount.com/pdt2/6/5/2/1/300x300/sch4005086147652/rw/figurine-requin-tigre.jpg','Requin blanc','Quoi de mieux qu\'un requin pour mettre l\'ambiance dans votre soirée ?','15',5),(36,6,'https://www.cdiscount.com/pdt2/6/5/2/1/300x300/sch4005086147652/rw/figurine-requin-tigre.jpg','Requin blanc','Quoi de mieux qu\'un requin pour mettre l\'ambiance dans votre soirée ?','15',5),(37,6,'https://www.cdiscount.com/pdt2/6/5/2/1/300x300/sch4005086147652/rw/figurine-requin-tigre.jpg','Requin blanc','Quoi de mieux qu\'un requin pour mettre l\'ambiance dans votre soirée ?','15',5),(38,4,'https://www.cdiscount.com/pdt2/8/3/8/1/300x300/auc5900168932838/rw/hypermotion-trottinette-rockster-charge-max-100-k.jpg','Trotinette','Slalommez entre les taxis et les bus avec ce bolide !','50',5),(39,8,'www.google.fr','Ballon de foot','Entre copains !','15',5),(40,8,'www.google.fr','Ballon de foot','Entre copains !','15',5),(41,24,'www.google.fr','Ballon de foot','Entre copains !','15',5),(42,120,'Oupas','Alors','On danse','3',5),(43,29,'France','Portugal','0','1',6),(44,49,'ddddddddddd','ddddddd','dddddd','3',6),(45,33,'www.google.fr','Portugal','Footb','1',6),(46,5,'https://www.cdiscount.com/pdt2/6/0/6/1/300x300/spo4013771089606/rw/sponeta-table-tennis-de-table-table-ping-pong-co.jpg','Table de ping-pong','Le moment de détente que tout le monde attend entre deux pauses !','400',6),(47,6,'https://www.cdiscount.com/pdt2/6/5/2/1/300x300/sch4005086147652/rw/figurine-requin-tigre.jpg','Requin blanc','Quoi de mieux qu\'un requin pour mettre l\'ambiance dans votre soirée ?','15',6),(48,3,'https://www.cdiscount.com/pdt2/0/1/s/1/300x300/veveng2601s/rw/toimsa-velo-26-cadre-acier-homme-18-vitesse.jpg','Vélo','Allez au bout du monde avec ce magnifique vélo','150',5),(49,4,'https://www.cdiscount.com/pdt2/8/3/8/1/300x300/auc5900168932838/rw/hypermotion-trottinette-rockster-charge-max-100-k.jpg','Trotinette','Slalommez entre les taxis et les bus avec ce bolide !','50',5),(50,12,'www.google.fr','Ballon de foot','Entre copains !','15',5),(51,3,'https://www.cdiscount.com/pdt2/0/1/s/1/300x300/veveng2601s/rw/toimsa-velo-26-cadre-acier-homme-18-vitesse.jpg','Vélo','Allez au bout du monde avec ce magnifique vélo','150',5),(52,3,'https://www.cdiscount.com/pdt2/0/1/s/1/300x300/veveng2601s/rw/toimsa-velo-26-cadre-acier-homme-18-vitesse.jpg','Vélo','Allez au bout du monde avec ce magnifique vélo','150',5),(53,3,'https://www.cdiscount.com/pdt2/0/1/s/1/300x300/veveng2601s/rw/toimsa-velo-26-cadre-acier-homme-18-vitesse.jpg','Vélo','Allez au bout du monde avec ce magnifique vélo','150',5),(54,3,'https://www.cdiscount.com/pdt2/0/1/s/1/300x300/veveng2601s/rw/toimsa-velo-26-cadre-acier-homme-18-vitesse.jpg','Vélo','Allez au bout du monde avec ce magnifique vélo','150',5),(55,3,'https://www.cdiscount.com/pdt2/0/1/s/1/300x300/veveng2601s/rw/toimsa-velo-26-cadre-acier-homme-18-vitesse.jpg','Vélo','Allez au bout du monde avec ce magnifique vélo','150',5),(56,3,'https://www.cdiscount.com/pdt2/0/1/s/1/300x300/veveng2601s/rw/toimsa-velo-26-cadre-acier-homme-18-vitesse.jpg','Vélo','Allez au bout du monde avec ce magnifique vélo','150',5),(57,3,'https://www.cdiscount.com/pdt2/0/1/s/1/300x300/veveng2601s/rw/toimsa-velo-26-cadre-acier-homme-18-vitesse.jpg','Vélo','Allez au bout du monde avec ce magnifique vélo','150',5),(58,4,'https://www.cdiscount.com/pdt2/8/3/8/1/300x300/auc5900168932838/rw/hypermotion-trottinette-rockster-charge-max-100-k.jpg','Trotinette','Slalommez entre les taxis et les bus avec ce bolide !','50',5),(59,11,'www.google.fr','Ballon de foot','Entre copains !','15',5),(60,5,'https://www.cdiscount.com/pdt2/6/0/6/1/300x300/spo4013771089606/rw/sponeta-table-tennis-de-table-table-ping-pong-co.jpg','Table de ping-pong','Le moment de détente que tout le monde attend entre deux pauses !','400',19);
/*!40000 ALTER TABLE `panier_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(1500) DEFAULT NULL,
  `admin` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'kavinesteves@gmail.com','LeRienDeRien',1),(2,'kevin.sebastiao-esteves@efrei.net','NoCracking',0),(3,'ristourne@gmail.com','TestFinal',1),(5,'kevaindu74@hotmail.fr','$2b$10$fshQ.R5BRcdaO55X9tQfJ.QSZ.My5AkQlZjnGI8QlBl2jgodv7myO',NULL),(6,'kevaintdu74@hotmail.fr','$2b$10$CC7HknWa20ZqP3mblzviO.4uzTITQuJbom.76lhNCiRIPP1fU4PtC',NULL),(10,'kevain-mel-du74@hotmail.fr','$2b$10$wo2I7lFM.OZmM0R4v/1pWeuFETrI.63GnlGoGxebq.E0ujbL27clu',NULL),(11,'kevainttdu74@hotmail.fr','$2b$10$bPgCBH7HjWpMVLRjSZgN4eajN69aU2eKC.RlsOXpFRAYNYFrDBXG2',1),(12,'anthonyesteves74000@gmail.com','$2b$10$y/TwDkpbCA/hpIqbUAPKUOpsQu.C9f.PG26sFeSf9IVYt.eSmnhkO',NULL),(13,'anthonyesteves740000@gmail.com','$2b$10$LR8SNeaeRtAff3YJxuVZieHc.73DlIg9dI6ze.Q5VGCi/vkO5HNWq',NULL),(14,'anthonyesteves7400000@gmail.com','$2b$10$4y.byWFcAp/lNgDUwzFhH.DBSuFLKMKcJncxtvx8FaYoDKvx1Zi4S',NULL),(15,'anthonyesteves4474000@gmail.com','$2b$10$YkGx7lIJsBghqqop59E6NOMvugiepWeccI1N98XQ2iMi3G436RNOW',0),(16,'anthonyesteves7444000@gmail.com','$2b$10$ZIgRks7HcRj3EmQXscgpOuqCsG2i0X9AnPSOfNAN3mez7/8XWHl8q',1),(17,'anthonyesteves754000@gmail.com','$2b$10$98dnZ17AyoewxKLoH5RS/.k/bMDa203cfBv7mbw1DZmlhOUmxm5la',1),(18,'kevaindu@hotmail.fr','$2b$10$L2DABLmfMMynCm7ZHknNZerZJvM0PEsIHd6Xg7FldV6jKHUQeRONG',0),(19,'kevainduss@hotmail.fr','$2b$10$kdtSWAHi9F.IQs3zyrEE0uk7dZZycPPhPjmrEq9lImwKfjiE8eBl6',0),(20,'kaaris@gmail.com','$2b$10$wiQVlPb0KlLQWHkkoJg75.b.irXlW3ZCBjQ33greddi9tBjELVTfi',1),(21,'dddd@gmail.com','$2b$10$h.1h5ssez1LMugVx14ZJN.7OZLsRpOPJDlDD.xTdx6lrZP/MJhnZq',0);
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

-- Dump completed on 2022-05-11 13:57:40

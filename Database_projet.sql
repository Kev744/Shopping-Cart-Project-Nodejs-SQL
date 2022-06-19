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
  `description` varchar(1000) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `quantite` int NOT NULL,
  PRIMARY KEY (`id_article`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (123,'Les Voyages de Gulliver','Gulliver débarque, bien malgré lui sur l\'île des Liliputiens. C\'est un géant dans un monde de nains. Et si les nains ont peur de cette invasion, ils trouvent rapidement le moyen de se défendre. Puis, Gulliver se retrouve chez les Brobdingnag, un peuple de géants où lui-même n\'est qu\'un nain. Là encore, son intelligence ne sera pas de trop pour lui laisser la vie sauve.','Jonathan Swift','https://th.bing.com/th/id/OIP.DEBONkPGC7YdzdCNyPCrwQAAAA?pid=ImgDet&rs=1',5),(124,'Frankenstein','C\'est alors qu\'à la lueur blafarde et jaunâtre de la lune qui se frayait un chemin au travers des volets, je vis cet être vil - le misérable monstre que j\'avais créé. Il soulevait le rideau du lit et avait les yeux - si l\'on peut les appeler ainsi - fixés sur moi. Ses mâchoires s\'ouvrirent et il bredouilla quelques sons inarticulés, tandis qu\'un rictus ridait ses joues. Peut-être dit-il quelque chose, mais je ne l\'entendis pas. Il tendit une main comme pour me retenir, mais je m\'échappai et descendis précipitamment les escaliers. Je me réfugiai dans la cour de la maison que j\'habitais ; j\'y demeurai le reste de la nuit, marchant de long en large dans un état d\'agitation extrême, écoutant attentivement, percevant et redoutant le moindre son, comme s\'il devait annoncer l\'approche de ce cadavre démoniaque auquel j\'avais si malheureusement donné la vie','Mary Shelley','https://static.fnac-static.com/multimedia/Images/FR/NR/97/4c/11/1133719/1540-1/tsp20201110074058/Frankenstein-ou-Le-Promethee-moderne.jpg',5),(125,'Croc Blanc','Croc Blanc est un classique de la littérature américaine. Il fut écrit en 1906 par Jack London et relate la vie d\'un chien-loup confronté à l\'impitoyable vie sauvage du Grand Nord puis à la violence des hommes. Ne connaissant que la loi du plus fort, livré à la haine, l\'animal va renaître au contact d\'un homme. Il va apprendre le respect et la confiance puis faire le deuil de sa liberté. Au delà de cette histoire, l\'auteur souligne des valeurs universelles qui sont le socle de la meilleure éducation possible.','Jack London','https://www.editionsartege.fr/pfs/vignettes/FIC170501HAB40.jpg',4),(126,'Orgueil & Préjugés','Élisabeth Bennet a quatre sœurs et une mère qui ne songe qu’à les marier. Quand parvient la nouvelle de l’installation à Netherfield, le domaine voisin, de Mr Bingley, célibataire et beau parti, toutes les dames des alentours sont en émoi, d’autant plus qu’il est accompagné de son ami Mr Darcy, un jeune et riche aristocrate. Les préparatifs du prochain bal occupent tous les esprits...\n\nJane Austen peint avec ce qu’il faut d’ironie les turbulences du cœur des jeunes filles et, aujourd’hui comme hier, on s’indigne avec l’orgueilleuse Élisabeth, puis on ouvre les yeux sur les voies détournées qu’emprunte l’amour.','Jane Austen','https://www.livredepoche.com/sites/default/files/styles/manual_crop_269_435/public/images/livres/couv/9782253259787-001-T.jpeg?itok=DOtdJs5M',4),(127,'La métamorphose','La Métamorphose révèle une vérité méconnue, les conventions disparaissent, les masques tombent. Le récit qui porte ce titre est un des plus pathétiques et des plus violents que Kafka ait écrits ; les effets en sont soulignés à l\'encre rouge, les péripéties ébranlent les nerfs du lecteur. C\'est l\'histoire, «excessivement répugnante», dit l\'auteur, d\'un homme qui se réveille changé en cancrelat. Cette transformation est un châtiment imaginaire que Kafka s\'inflige. Et son personnage est celui qui ne peut plus aimer, ni être aimé : le conflit qui se déroule dans une famille bourgeoise prend une ampleur mythique. Seuls quelques éléments comiques ou grotesques permettent de libérer de l\'oppression du cauchemar.','Franz Kafka','https://static.fnac-static.com/multimedia/Images/FR/NR/c6/9e/10/1089222/1540-1/tsp20200102070826/La-metamorphose.jpg',4),(128,'Les 50 nuances de Grey','Anastasia Steele, étudiante en littérature, a accepté la proposition de son amie journaliste de prendre sa place pour interviewer Christian Grey, un jeune et richissime chef d’entreprise de Seattle. Dès le premier regard, elle est à la fois séduite et intimidée. Convaincue que leur rencontre a été désastreuse, elle tente de l\'oublier, jusqu\'à ce qu\'il débarque dans le magasin où elle travaille à mi-temps et lui propose un rendez-vous. Ana est follement attirée par cet homme. Lorsqu\'ils entament une liaison passionnée, elle découvre son pouvoir érotique, ainsi que la part obscure qu’il tient à dissimuler... Romantique, libératrice et totalement addictive, la trilogie Fifty Shades, dont Cinquante nuances de Grey est le premier volume, vous obsédera, vous possédera et vous marquera à jamais.','E. L. James','https://www.livredepoche.com/sites/default/files/styles/manual_crop_269_435/public/images/livres/couv/9782253176503-001-T.jpeg?itok=aBkeTshU',5),(129,'Da Vinci Code','Robert Langdon, un éminent spécialiste de symbologie de Harvard, est convoqué d’urgence au Louvre. On a découvert un message codé sur le cadavre du conservateur en chef, retrouvé assassiné au milieu de la Grande Galerie. Pour examiner la série de pictogrammes, il est épaulé par Sophie Neveu, une brillante cryptographe membre de la police. À leur grande surprise, les premiers indices les conduisent à l\'œuvre de Léonard de Vinci. En déchiffrant le code, Langdon va mettre au jour l\'un des plus grands mystères de notre temps... et devenir un homme traqué.','Dan Brown','https://www.livredepoche.com/sites/default/files/styles/manual_crop_269_435/public/images/livres/couv/9782253001171-001-T.jpeg?itok=x1Y8EXp0',5),(130,'Le royaume de Kensuké','Le 10 septembre 1987, Michael embarque avec ses parents et leur chienne, Stella, sur un voilier pour faire le tour du monde. Ils s\'arrêtent, parfois, pour de fabuleuses escales, Afrique, Amérique, Australie, jusqu\'au jour où survient un terrible accident. Le jeune garçon se retrouve échoué, avec sa chienne, sur un île déserte perdue au milieu du Pacifique. Va-t-il pouvoir survivre, affamé, menacé par toutes sortes de dangers ? Reverra-t-il jamais ses parents ?Un matin, alors que l\'épuisement le gagne, Michael trouve auprès de lui un peu de nourriture et d\'eau douce. Il n\'est pas seul...','Michael Morpurgo','https://m.media-amazon.com/images/P/B095ZRBVS9.01._SCLZZZZZZZ_SX500_.jpg',5),(131,'Robinson Crusoé','Jeune Anglais assoiffé d\'aventures, Robinson décide de s\'embarquer à bord d\'un navire. Il apprend la dure vie de marin et affronte de multiples dangers. Après quelque temps passé au Brésil, il repart pour la Guinée, où il n\'arrivera jamais... Unique survivant d\'un naufrage, il échoue sur une île déserte. Il s\'invente alors une vie solitaire, jusqu\'au jour où débarque un jeune indigène, Vendredi...','Daniel Defoe','https://images-na.ssl-images-amazon.com/images/I/91fEFWpC1zL.jpg',5),(132,'Les Dix Petits Nègres','En a-t-on parlé de l’Île du Nègre! Elle avait, selon certains, été achetée par une star de Hollywood.Des journaux avaient insinué que l’Amirauté britannique s’y livrait à des expériences ultrasecrètes. Bref, quand ils reçurent –sans savoir de qui– cette invitation à passer des vacances à l’Île du Nègre, tous les dix accoururent.','Agatha Christie','https://www.bedetheque.com/media/Couvertures/agathachristiecle04.jpg',5);
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
  `id_user` int NOT NULL,
  `date_crea` date DEFAULT NULL,
  PRIMARY KEY (`idpanier`,`id_user`),
  KEY `id_user_idx` (`id_user`),
  CONSTRAINT `id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panier`
--

LOCK TABLES `panier` WRITE;
/*!40000 ALTER TABLE `panier` DISABLE KEYS */;
INSERT INTO `panier` VALUES (46,20,'2022-05-15'),(47,25,'2022-05-15');
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
  `id_user` int NOT NULL,
  `id_article` int NOT NULL,
  `quantite` int DEFAULT NULL,
  PRIMARY KEY (`idpanieritem`,`id_user`,`id_article`),
  KEY `id_user_idx` (`id_user`),
  KEY `id__user_idx` (`id_user`),
  KEY `id_article_idx` (`id_article`),
  CONSTRAINT `id__user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `id_article` FOREIGN KEY (`id_article`) REFERENCES `articles` (`id_article`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panier_item`
--

LOCK TABLES `panier_item` WRITE;
/*!40000 ALTER TABLE `panier_item` DISABLE KEYS */;
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
  `email` varchar(50) NOT NULL,
  `password` varchar(1500) NOT NULL,
  `admin` tinyint DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'kavinesteves@gmail.com','LeRienDeRien',1,NULL,NULL),(2,'kevin.sebastiao-esteves@efrei.net','NoCracking',0,NULL,NULL),(3,'ristourne@gmail.com','TestFinal',1,NULL,NULL),(5,'kevaindu74@hotmail.fr','$2b$10$fshQ.R5BRcdaO55X9tQfJ.QSZ.My5AkQlZjnGI8QlBl2jgodv7myO',NULL,NULL,NULL),(6,'kevaintdu74@hotmail.fr','$2b$10$CC7HknWa20ZqP3mblzviO.4uzTITQuJbom.76lhNCiRIPP1fU4PtC',NULL,NULL,NULL),(10,'kevain-mel-du74@hotmail.fr','$2b$10$wo2I7lFM.OZmM0R4v/1pWeuFETrI.63GnlGoGxebq.E0ujbL27clu',NULL,NULL,NULL),(11,'kevainttdu74@hotmail.fr','$2b$10$bPgCBH7HjWpMVLRjSZgN4eajN69aU2eKC.RlsOXpFRAYNYFrDBXG2',1,NULL,NULL),(12,'anthonyesteves74000@gmail.com','$2b$10$y/TwDkpbCA/hpIqbUAPKUOpsQu.C9f.PG26sFeSf9IVYt.eSmnhkO',NULL,NULL,NULL),(13,'anthonyesteves740000@gmail.com','$2b$10$LR8SNeaeRtAff3YJxuVZieHc.73DlIg9dI6ze.Q5VGCi/vkO5HNWq',NULL,NULL,NULL),(14,'anthonyesteves7400000@gmail.com','$2b$10$4y.byWFcAp/lNgDUwzFhH.DBSuFLKMKcJncxtvx8FaYoDKvx1Zi4S',NULL,NULL,NULL),(15,'anthonyesteves4474000@gmail.com','$2b$10$YkGx7lIJsBghqqop59E6NOMvugiepWeccI1N98XQ2iMi3G436RNOW',0,NULL,NULL),(16,'anthonyesteves7444000@gmail.com','$2b$10$ZIgRks7HcRj3EmQXscgpOuqCsG2i0X9AnPSOfNAN3mez7/8XWHl8q',1,NULL,NULL),(17,'anthonyesteves754000@gmail.com','$2b$10$98dnZ17AyoewxKLoH5RS/.k/bMDa203cfBv7mbw1DZmlhOUmxm5la',1,NULL,NULL),(18,'kevaindu@hotmail.fr','$2b$10$L2DABLmfMMynCm7ZHknNZerZJvM0PEsIHd6Xg7FldV6jKHUQeRONG',0,NULL,NULL),(19,'kevainduss@hotmail.fr','$2b$10$kdtSWAHi9F.IQs3zyrEE0uk7dZZycPPhPjmrEq9lImwKfjiE8eBl6',0,NULL,NULL),(20,'kaaris@gmail.com','$2b$10$wiQVlPb0KlLQWHkkoJg75.b.irXlW3ZCBjQ33greddi9tBjELVTfi',1,NULL,NULL),(21,'dddd@gmail.com','$2b$10$h.1h5ssez1LMugVx14ZJN.7OZLsRpOPJDlDD.xTdx6lrZP/MJhnZq',0,NULL,NULL),(23,'kev@gmail.com','$2b$10$yF5oVwOLRpz44pKGxUc4huJ/w0vnWm44hhVeIPz1K.nar80ROoXnK',0,'Berard','Etienne'),(24,'kevin@gmail.com','$2b$10$aKsvux06eO.ODRuBQ.tr2uUsZsqoqyS.B0G/iXLv4sNNvbDOLXTBC',0,'Berard','Emmanuel'),(25,'postman@gmail.com','$2b$10$D3pMZnU9kqS7RMxqDyf2tecFXaK45ACvhDAez5bu86o6aMRPY0dVK',0,'Berard','Monique'),(26,'melpaj@gmail.com','$2b$10$mqSWlz91vaxogsdAvKWFPeJFc3R9SUapUAIo7uFYZvZzI.CKr8ONm',1,'Mel','Mel'),(27,'lil@gmail.com','$2b$10$6PmF/Hngb9adDRcQaWv5SeZt/99Hmj2V6LH/3f8L5GrM8Ifd/PmjO',1,'Lil','Pump'),(28,'rousse@gmail.com','$2b$10$7Q/bEAIXRy7dmQJ9an2hkuhodVZoWcAgdLc7zZ/YBRS1WCbB2WdSO',0,'Postm','An'),(29,'rous@gmail.com','$2b$10$fREKghYMbBJTd10sGmk2lezr1DweuksFhP.TH3cmYoTu8CcMSum.S',0,'Kevin','Yu');
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

-- Dump completed on 2022-05-15 22:29:11

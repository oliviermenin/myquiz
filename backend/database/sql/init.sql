-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: myquiz
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.20.04.1

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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'Informatique'),(2,'Histoire'),(3,'Sciences'),(4,'Sport'),(5,'Géographie'),(6,'Littérature');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(6,'2025_05_23_110452_create_personal_access_tokens_table',2),(7,'2025_05_23_155419_create_quiz_results_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'auth-token','1375a1f017b329d215d95915357787fa841ffd53a7e19eeb3aac62db0de0307c','[\"*\"]','2025-05-23 16:49:02',NULL,'2025-05-23 14:24:01','2025-05-23 16:49:02');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_categorie` int DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,1,'Que signifie HTML ?'),(2,1,'Quel est le langage de programmation créé par Brendan Eich ?'),(3,2,'En quelle année a eu lieu la Révolution française ?'),(4,3,'Quel est le symbole chimique de l\'or ?'),(5,1,'Que signifie CSS ?'),(6,1,'Quel protocole est utilisé pour sécuriser les communications web ?'),(7,2,'Qui était le premier empereur romain ?'),(8,2,'En quelle année s\'est terminée la Seconde Guerre mondiale ?'),(9,3,'Combien de planètes y a-t-il dans notre système solaire ?'),(10,3,'Quelle est la vitesse de la lumière dans le vide ?'),(11,4,'Combien de joueurs composent une équipe de football sur le terrain ?'),(12,4,'Dans quel sport utilise-t-on un shuttlecock ?'),(13,5,'Quel est le plus grand océan du monde ?'),(14,5,'Quelle est la capitale de l\'Australie ?'),(15,1,'Quel est le langage de programmation développé par Google ?'),(16,1,'Que signifie SQL ?'),(17,1,'Quel est le système d\'exploitation mobile développé par Apple ?'),(18,1,'Combien d\'octets contient un kilooctet ?'),(19,2,'Qui a découvert l\'Amérique en 1492 ?'),(20,2,'En quelle année a eu lieu la chute du mur de Berlin ?'),(21,3,'Quelle est la formule chimique de l\'eau ?'),(22,3,'Combien de chromosomes possède l\'être humain ?'),(23,3,'Quel gaz représente environ 78% de l\'atmosphère terrestre ?'),(24,3,'Quelle est l\'unité de mesure de la force ?'),(25,3,'Qui a développé la théorie de la relativité ?'),(26,3,'Quel est l\'élément chimique le plus léger ?'),(27,4,'Combien de temps dure un match de football ?'),(28,4,'Dans quel sport Michael Jordan était-il célèbre ?'),(29,4,'Combien de joueurs composent une équipe de basketball sur le terrain ?'),(30,4,'Quel pays a remporté la Coupe du Monde de football en 2018 ?'),(31,4,'Dans quel sport utilise-t-on une raquette et une balle jaune ?'),(32,4,'Combien de sets faut-il gagner pour remporter un match de tennis masculin en Grand Chelem ?'),(33,4,'Quel est le nom du tournoi de tennis qui se déroule à Wimbledon ?'),(34,4,'Dans quel sport pratique-t-on le \"slam dunk\" ?'),(35,5,'Quel est le plus long fleuve du monde ?'),(36,5,'Quelle est la plus haute montagne du monde ?'),(37,5,'Combien de continents y a-t-il ?'),(38,5,'Quelle est la capitale du Canada ?'),(39,5,'Dans quel pays se trouve le Machu Picchu ?'),(40,5,'Quel est le plus petit pays du monde ?'),(41,5,'Quelle est la capitale de l\'Espagne ?'),(42,5,'Quel désert est le plus grand du monde ?'),(43,6,'Qui a écrit \"Les Misérables\" ?'),(44,6,'Quel est le premier livre de la saga Harry Potter ?'),(45,6,'Qui a écrit \"1984\" ?'),(46,6,'Dans quel pays se déroule l\'action de \"Don Quichotte\" ?'),(47,6,'Qui a écrit \"Le Petit Prince\" ?'),(48,6,'Quel est le vrai nom de Molière ?'),(49,6,'Qui a écrit \"Roméo et Juliette\" ?'),(50,6,'Quel prix littéraire est décerné chaque année en France ?'),(51,6,'Qui a écrit \"L\'Étranger\" ?'),(52,6,'Dans quelle ville se déroule l\'action de \"Notre-Dame de Paris\" ?');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_results`
--

DROP TABLE IF EXISTS `quiz_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_results` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorie_id` int NOT NULL,
  `score` int NOT NULL,
  `total_questions` int NOT NULL,
  `percentage` decimal(5,2) NOT NULL,
  `time_taken` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_results_categorie_id_percentage_index` (`categorie_id`,`percentage`),
  CONSTRAINT `quiz_results_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_results`
--

LOCK TABLES `quiz_results` WRITE;
/*!40000 ALTER TABLE `quiz_results` DISABLE KEYS */;
INSERT INTO `quiz_results` VALUES (1,'Olivier',1,4,4,100.00,14,'2025-05-27 23:04:25','2025-05-27 23:04:25');
/*!40000 ALTER TABLE `quiz_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reponse`
--

DROP TABLE IF EXISTS `reponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reponse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_question` int DEFAULT NULL,
  `reponse` varchar(255) DEFAULT NULL,
  `reponse_expected` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reponse`
--

LOCK TABLES `reponse` WRITE;
/*!40000 ALTER TABLE `reponse` DISABLE KEYS */;
INSERT INTO `reponse` VALUES (1,1,'HyperText Markup Language',1),(2,1,'Home Tool Markup Language',0),(3,1,'Hyperlinks and Text Markup Language',0),(4,1,'High Tech Modern Language',0),(5,2,'JavaScript',1),(6,2,'Python',0),(7,2,'Java',0),(8,2,'C++',0),(9,3,'1789',1),(10,3,'1792',0),(11,3,'1804',0),(12,3,'1799',0),(13,4,'Au',1),(14,4,'Ag',0),(15,4,'Go',0),(16,4,'Or',0),(17,5,'Cascading Style Sheets',1),(18,5,'Computer Style Sheets',0),(19,5,'Creative Style Sheets',0),(20,5,'Colorful Style Sheets',0),(21,6,'HTTPS',1),(22,6,'HTTP',0),(23,6,'FTP',0),(24,6,'SSH',0),(25,7,'Auguste',1),(26,7,'Jules César',0),(27,7,'Néron',0),(28,7,'Trajan',0),(29,8,'1945',1),(30,8,'1944',0),(31,8,'1946',0),(32,8,'1943',0),(33,15,'Go',1),(34,15,'Python',0),(35,15,'Java',0),(36,15,'C#',0),(37,16,'Structured Query Language',1),(38,16,'Simple Query Language',0),(39,16,'Standard Query Language',0),(40,16,'System Query Language',0),(41,17,'iOS',1),(42,17,'Android',0),(43,17,'Windows Mobile',0),(44,17,'BlackBerry OS',0),(45,18,'1024',1),(46,18,'1000',0),(47,18,'1048',0),(48,18,'1200',0),(49,19,'Christophe Colomb',1),(50,19,'Vasco de Gama',0),(51,19,'Marco Polo',0),(52,19,'Amerigo Vespucci',0),(53,20,'1989',1),(54,20,'1987',0),(55,20,'1991',0),(56,20,'1985',0),(57,9,'8',1),(58,9,'9',0),(59,9,'7',0),(60,9,'10',0),(61,10,'299 792 458 m/s',1),(62,10,'300 000 000 m/s',0),(63,10,'299 000 000 m/s',0),(64,10,'298 792 458 m/s',0),(65,21,'H2O',1),(66,21,'CO2',0),(67,21,'O2',0),(68,21,'H2SO4',0),(69,22,'46',1),(70,22,'44',0),(71,22,'48',0),(72,22,'42',0),(73,23,'Azote',1),(74,23,'Oxygène',0),(75,23,'Dioxyde de carbone',0),(76,23,'Argon',0),(77,24,'Newton',1),(78,24,'Joule',0),(79,24,'Watt',0),(80,24,'Pascal',0),(81,25,'Albert Einstein',1),(82,25,'Isaac Newton',0),(83,25,'Galilée',0),(84,25,'Stephen Hawking',0),(85,26,'Hydrogène',1),(86,26,'Hélium',0),(87,26,'Lithium',0),(88,26,'Carbone',0),(89,11,'11',1),(90,11,'10',0),(91,11,'12',0),(92,11,'9',0),(93,12,'Badminton',1),(94,12,'Tennis',0),(95,12,'Squash',0),(96,12,'Ping-pong',0),(97,27,'90 minutes',1),(98,27,'80 minutes',0),(99,27,'100 minutes',0),(100,27,'120 minutes',0),(101,28,'Basketball',1),(102,28,'Football américain',0),(103,28,'Baseball',0),(104,28,'Tennis',0),(105,29,'5',1),(106,29,'6',0),(107,29,'4',0),(108,29,'7',0),(109,30,'France',1),(110,30,'Brésil',0),(111,30,'Allemagne',0),(112,30,'Argentine',0),(113,31,'Tennis',1),(114,31,'Squash',0),(115,31,'Badminton',0),(116,31,'Ping-pong',0),(117,32,'3',1),(118,32,'2',0),(119,32,'4',0),(120,32,'5',0),(121,33,'The Championships',1),(122,33,'Wimbledon Open',0),(123,33,'British Open',0),(124,33,'London Tennis',0),(125,34,'Basketball',1),(126,34,'Volleyball',0),(127,34,'Handball',0),(128,34,'Football américain',0),(129,13,'Océan Pacifique',1),(130,13,'Océan Atlantique',0),(131,13,'Océan Indien',0),(132,13,'Océan Arctique',0),(133,14,'Canberra',1),(134,14,'Sydney',0),(135,14,'Melbourne',0),(136,14,'Perth',0),(137,35,'Le Nil',1),(138,35,'L\'Amazone',0),(139,35,'Le Mississippi',0),(140,35,'Le Yangtsé',0),(141,36,'Mont Everest',1),(142,36,'K2',0),(143,36,'Mont Blanc',0),(144,36,'Kangchenjunga',0),(145,37,'7',1),(146,37,'6',0),(147,37,'8',0),(148,37,'5',0),(149,38,'Ottawa',1),(150,38,'Toronto',0),(151,38,'Vancouver',0),(152,38,'Montréal',0),(153,39,'Pérou',1),(154,39,'Bolivie',0),(155,39,'Équateur',0),(156,39,'Chili',0),(157,40,'Vatican',1),(158,40,'Monaco',0),(159,40,'Saint-Marin',0),(160,40,'Liechtenstein',0),(161,41,'Madrid',1),(162,41,'Barcelone',0),(163,41,'Séville',0),(164,41,'Valence',0),(165,42,'Sahara',1),(166,42,'Gobi',0),(167,42,'Kalahari',0),(168,42,'Atacama',0),(169,43,'Victor Hugo',1),(170,43,'Émile Zola',0),(171,43,'Gustave Flaubert',0),(172,43,'Honoré de Balzac',0),(173,44,'Harry Potter à l\'école des sorciers',1),(174,44,'Harry Potter et la Chambre des secrets',0),(175,44,'Harry Potter et le Prisonnier d\'Azkaban',0),(176,44,'Harry Potter et la Coupe de feu',0),(177,45,'George Orwell',1),(178,45,'Aldous Huxley',0),(179,45,'Ray Bradbury',0),(180,45,'Philip K. Dick',0),(181,46,'Espagne',1),(182,46,'Portugal',0),(183,46,'Italie',0),(184,46,'France',0),(185,47,'Antoine de Saint-Exupéry',1),(186,47,'Jules Verne',0),(187,47,'Marcel Proust',0),(188,47,'André Gide',0),(189,48,'Jean-Baptiste Poquelin',1),(190,48,'Pierre Corneille',0),(191,48,'Jean Racine',0),(192,48,'Voltaire',0),(193,49,'William Shakespeare',1),(194,49,'Christopher Marlowe',0),(195,49,'Ben Jonson',0),(196,49,'John Webster',0),(197,50,'Prix Goncourt',1),(198,50,'Prix Nobel',0),(199,50,'Prix Pulitzer',0),(200,50,'Prix Booker',0),(201,51,'Albert Camus',1),(202,51,'Jean-Paul Sartre',0),(203,51,'Simone de Beauvoir',0),(204,51,'André Malraux',0),(205,52,'Paris',1),(206,52,'Lyon',0),(207,52,'Marseille',0),(208,52,'Rouen',0);
/*!40000 ALTER TABLE `reponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('apxK1RLQG21mBMJxgoF3EH3J4kV9A38SH4oo1gOr',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiSlBpQWJUeGNLbXhYYWtpalhGSTNDWE94NG9OSzBvbnVLRnJkUnZPVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1748381237),('ekvjyZCoaSwX1kdQK8Wblc2YweOqNv2BT1Ij5roY',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiOWxkd3FtSkN4OXJjekwzaUVtZ2psa0htcWFsU3JDUlRMcGFYN1VuRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1748380538),('HQrSp76CEpENOFW9T6TraBJfwkOcBr0FWS03HSeq',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiUnViSVN6OVZVbmloQ005dUFIUzh3Y3hlWWNiSlhPTzF3SHphZk40dSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1748381046),('K0Y08j3CiWvlx3O5zRwGQ9PSL7tRF44TQlkDhmRL',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiQ2xaZVpXQVY2aGN2cDBTUjF0akZPcVRBOVFtSHdwT2dIdklLaFRJTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1748380465),('mg6mNPF2oEHW3jkvU3McYd6x8g9abXKe4OgAb5a5',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYlVGaUpuSm81ZXRya290enI1Z3Nza0ZFNE5SdGxTNkJUZDB3bWF1USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1747999590),('UnOJaw1aRF3u7R0oBoLGj9VwH1LymAxYcccxPZgG',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEJnak03MGp2NHQxZEQ3akZKQUdJNENoUlJ4SGZHbVZVdDVtdkRNMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1747985693),('x4riYiTOkHEk68YxlbYEsZwCnVzgZ5KZVKtjnO6m',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiRnY4NHFwRUkwbnJYbnlFY2owbWVJdHFWeDF2TFBHZUhOaktDN3NERCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1748380457);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'olivier','olivier@live.fr',NULL,'$2y$12$xEMW1ifTzstJ9LIjc8k5uekvDzx/TdcbhFnDWmdEZU9rR3egExREq',NULL,'2025-05-23 09:44:54','2025-05-23 09:44:54');
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

-- Dump completed on 2025-05-30 23:22:17

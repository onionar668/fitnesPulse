-- MySQL dump 10.13  Distrib 9.4.0, for macos15 (arm64)
--
-- Host: localhost    Database: fitnesPulse
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `schedule_id` bigint unsigned NOT NULL,
  `status` enum('booked','visited') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_user_id_foreign` (`user_id`),
  KEY `bookings_schedule_id_foreign` (`schedule_id`),
  CONSTRAINT `bookings_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,2,12,'booked','2026-10-28 02:34:21','2026-10-28 02:34:21');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
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
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
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
-- Table structure for table `coach_reviews`
--

DROP TABLE IF EXISTS `coach_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `coach_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coach_reviews_coach_id_foreign` (`coach_id`),
  KEY `coach_reviews_user_id_foreign` (`user_id`),
  CONSTRAINT `coach_reviews_coach_id_foreign` FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `coach_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach_reviews`
--

LOCK TABLES `coach_reviews` WRITE;
/*!40000 ALTER TABLE `coach_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `coach_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coaches`
--

DROP TABLE IF EXISTS `coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coaches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `gym_id` bigint unsigned NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `specialization` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coaches_user_id_foreign` (`user_id`),
  KEY `coaches_gym_id_foreign` (`gym_id`),
  CONSTRAINT `coaches_gym_id_foreign` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `coaches_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
INSERT INTO `coaches` VALUES (16,4,1,'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Obcaecati, ea?','2026-10-28 01:53:29','2026-10-28 01:53:29','Мастер-тренер силового направления',10000),(17,5,6,'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Obcaecati, ea?','2026-10-28 01:53:29','2026-10-28 01:53:29','Ведущий тренер по пилатесу и растяжке',8000),(18,6,2,'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Obcaecati, ea?','2026-10-28 01:53:29','2026-10-28 01:53:29','Тренер по боксу и функциональной подготовке',15000),(19,7,3,'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Obcaecati, ea?','2026-10-28 01:53:29','2026-10-28 01:53:29','Тренер по йоге и гибкости',10000),(20,1,4,'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Obcaecati, ea?','2026-10-28 01:53:29','2026-10-28 01:53:29','Старший инструктор тренажерного зала',9000);
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
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
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
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
-- Table structure for table `gym_infrastructures`
--

DROP TABLE IF EXISTS `gym_infrastructures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gym_infrastructures` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gym_id` bigint unsigned NOT NULL,
  `infrastructure_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gym_infrastructures_gym_id_foreign` (`gym_id`),
  KEY `gym_infrastructures_infrastructure_id_foreign` (`infrastructure_id`),
  CONSTRAINT `gym_infrastructures_gym_id_foreign` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `gym_infrastructures_infrastructure_id_foreign` FOREIGN KEY (`infrastructure_id`) REFERENCES `infrastructures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_infrastructures`
--

LOCK TABLES `gym_infrastructures` WRITE;
/*!40000 ALTER TABLE `gym_infrastructures` DISABLE KEYS */;
INSERT INTO `gym_infrastructures` VALUES (4,20,1,NULL,NULL),(5,20,2,NULL,NULL),(6,20,3,NULL,NULL),(7,1,1,NULL,NULL),(8,1,2,NULL,NULL),(9,1,3,NULL,NULL);
/*!40000 ALTER TABLE `gym_infrastructures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gyms`
--

DROP TABLE IF EXISTS `gyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gyms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_id` bigint unsigned NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gyms_region_id_foreign` (`region_id`),
  CONSTRAINT `gyms_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gyms`
--

LOCK TABLES `gyms` WRITE;
/*!40000 ALTER TABLE `gyms` DISABLE KEYS */;
INSERT INTO `gyms` VALUES (1,'World Class Almaty','Премиальный фитнес-клуб с большим бассейном, спа-зоной и тренажерным залом.',1,'пр. Аль-Фараби, 6/3','gyms/world_class.jpg','2026-10-28 01:49:59','2026-10-28 01:49:59'),(2,'Invictus Go','Современный круглосуточный фитнес-клуб с американским оборудованием Hammer Strength.',1,'пр. Достык, 38','gyms/invictus.jpg','2026-10-28 01:49:59','2026-10-28 01:49:59'),(3,'FitNation','Семейный фитнес-центр с групповыми программами, йогой и кроссфит-зоной.',1,'ул. Розыбакиева, 289','gyms/fitnation.jpg','2026-10-28 01:49:59','2026-10-28 01:49:59'),(4,'Turnik Gym','Хардкорный зал для любителей тяжелой атлетики, пауэрлифтинга и бодибилдинга.',1,'пр. Абая, 150','gyms/turnik.jpg','2026-10-28 01:49:59','2026-10-28 01:49:59'),(5,'Rakhat Fitness','Легендарный спортивный комплекс с теннисными кортами и игровыми площадками.',1,'ул. Сатпаева, 27','gyms/rakhat.jpg','2026-10-28 01:49:59','2026-10-28 01:49:59'),(6,'CrossFit Almaty','Специализированная аффилированная бокс-площадка для функционального многоборья.',1,'ул. Шевченко, 165','gyms/crossfit.jpg','2026-10-28 01:49:59','2026-10-28 01:49:59'),(7,'Invictus Astana','Флагманский клуб сети с панорамными окнами и новейшей линейкой тренажеров.',2,'ул. Сарайшык, 5','gyms/invictus_astana.jpg','2026-10-28 01:49:59','2026-10-28 01:49:59'),(8,'Life Fitness','Уютный клуб с упором на персональные тренировки и кардио-зону.',2,'пр. Кабанбай Батыра, 11','gyms/lifefitness.jpg','2026-10-28 01:49:59','2026-10-28 01:49:59'),(9,'Olympia Fitness','Доступный районный спортзал со всем необходимым для поддержания формы.',1,'мкр. Аксай-4, 10','gyms/olympia.jpg','2026-10-28 01:49:59','2026-10-28 01:49:59'),(10,'Wellness Club LUX','Элитный велнес-центр с термальными источниками, массажем и фитнес-баром.',2,'ул. Достык, 16','gyms/lux.jpg','2026-10-28 01:49:59','2026-10-28 01:49:59'),(20,'Triumpher','adaugeo cohors arx',3,'ул. Рыскулова д. 31','gyms/E3ja5FRIUwMcUjvxwmxHzUvN8hVL3e884qVCgoKw.jpg','2026-11-09 00:51:05','2026-11-09 00:51:05');
/*!40000 ALTER TABLE `gyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infrastructures`
--

DROP TABLE IF EXISTS `infrastructures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infrastructures` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infrastructures`
--

LOCK TABLES `infrastructures` WRITE;
/*!40000 ALTER TABLE `infrastructures` DISABLE KEYS */;
INSERT INTO `infrastructures` VALUES (1,'Pool','2026-11-09 00:25:19','2026-11-09 00:25:19'),(2,'SPA','2026-11-09 00:25:19','2026-11-09 00:25:19'),(3,'Открытая терраса для йоги','2026-11-09 00:25:19','2026-11-09 00:25:19'),(4,'Зона единоборств с рингом','2026-11-09 00:25:19','2026-11-09 00:25:19'),(5,'Детская фитнес-комната','2026-11-09 00:25:19','2026-11-09 00:25:19'),(6,'Кабинет кинезиотерапии','2026-11-09 00:25:19','2026-11-09 00:25:19'),(7,'Термальный комплекс','2026-11-09 00:25:19','2026-11-09 00:25:19'),(8,'Официальный CrossFit бокс','2026-11-09 00:25:19','2026-11-09 00:25:19'),(9,'Хаммам и соляная пещера','2026-11-09 00:25:19','2026-11-09 00:25:19');
/*!40000 ALTER TABLE `infrastructures` ENABLE KEYS */;
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
  `attempts` smallint unsigned NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_10_27_055637_create_regions_table',1),(5,'2026_10_27_055708_create_gyms_table',1),(6,'2026_10_27_055709_create_subscriptions_table',1),(7,'2026_10_27_055710_create_user_subscriptions_table',1),(8,'2026_10_27_055746_create_coaches_table',1),(9,'2026_10_27_055747_create_reviews_table',1),(10,'2026_10_27_055799_create_schedules_table',1),(11,'2026_10_27_055800_create_bookings_table',1),(12,'2026_10_27_060545_create_personal_access_tokens_table',1),(13,'2026_11_09_050345_create_infrastructures_table',2),(14,'2026_11_09_050408_create_gym_infrastructures_table',2),(15,'2026_11_09_062025_create_coach_reviews_table',3),(16,'2026_11_09_062908_add_fields_to_coaches',4);
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
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',2,'auth','52929152db1d174c8c2717bd845699a0245dea21154d190ca5ce056d76190774','[\"*\"]','2026-10-28 03:26:04',NULL,'2026-10-28 02:28:09','2026-10-28 03:26:04'),(2,'App\\Models\\User',2,'auth','6afb696bb1aef15c68e567f07968cade4cdceea90490bf3b79991cff55187292','[\"*\"]',NULL,NULL,'2026-11-02 01:04:53','2026-11-02 01:04:53'),(3,'App\\Models\\User',2,'auth','0a486793b976dc38d2921f0cbaa0c69f0b88406be6a50b7bb54868f0ed7d7039','[\"*\"]',NULL,NULL,'2026-11-02 01:05:33','2026-11-02 01:05:33'),(4,'App\\Models\\User',2,'auth','152e781f238f12c4b069980b9fcd7fa81020e0083c947ab15077c107e5f29b0a','[\"*\"]',NULL,NULL,'2026-11-02 01:06:09','2026-11-02 01:06:09'),(5,'App\\Models\\User',2,'auth','2e4bbb574efe107c772bd3d284cf94f479554dccf19be88b91f9ad510c370c18','[\"*\"]',NULL,NULL,'2026-11-02 01:06:10','2026-11-02 01:06:10'),(6,'App\\Models\\User',2,'auth','b5b5bb795223aab60d6199087438b3edcadee8d49f623c9269f08ac7f128e961','[\"*\"]',NULL,NULL,'2026-11-02 01:06:37','2026-11-02 01:06:37'),(7,'App\\Models\\User',2,'auth','965a7e2b67789d9ac1ea1feb5ae39fa8de9c3ad9d5a28cc85e636072ce661143','[\"*\"]',NULL,NULL,'2026-11-02 01:09:53','2026-11-02 01:09:53'),(8,'App\\Models\\User',8,'auth','8a7f3e0d3590cc40cc79f93762898c864ad73beccdf7143e6bf14ead9e810a54','[\"*\"]',NULL,NULL,'2026-11-02 01:16:44','2026-11-02 01:16:44'),(9,'App\\Models\\User',2,'auth','c0edb1764d9f8b36aec954c5fe1b13a1ec16b8577e5916a212103c031695ab4e','[\"*\"]',NULL,NULL,'2026-11-02 01:54:34','2026-11-02 01:54:34'),(10,'App\\Models\\User',9,'auth','ba4358146adef37b7b520515c54bc75bb8c6421d670b566f978e60cd4a5c4dc8','[\"*\"]',NULL,NULL,'2026-11-02 02:32:43','2026-11-02 02:32:43'),(11,'App\\Models\\User',2,'auth','81d6d56c6a8e3fb1ba7710f12f5943aa730fec84631d7b3f6bbb2433a8248e43','[\"*\"]',NULL,NULL,'2026-11-02 03:24:57','2026-11-02 03:24:57'),(12,'App\\Models\\User',2,'auth','20e53c93b2b4ef8ebacb472bddae04535f8841cf6e766a4eaabd32e7e3c3c94d','[\"*\"]',NULL,NULL,'2026-11-02 03:43:38','2026-11-02 03:43:38'),(13,'App\\Models\\User',2,'auth','d8372b6caa6f742ffcf7eacf4efb655fc960148739c9b2ef7d755508b1113885','[\"*\"]',NULL,NULL,'2026-11-02 03:44:45','2026-11-02 03:44:45'),(14,'App\\Models\\User',2,'auth','a582a1326e153cbc3e9a11b75163d7ab54d098281ae2b7019c1c59b305c0cac1','[\"*\"]','2026-11-04 00:33:43',NULL,'2026-11-04 00:33:31','2026-11-04 00:33:43'),(15,'App\\Models\\User',2,'auth','e2d9f00e44a9d75341dc6afd3cf8473d827f4f62add30a15db94333409dd368f','[\"*\"]','2026-11-04 01:13:15',NULL,'2026-11-04 00:41:11','2026-11-04 01:13:15'),(16,'App\\Models\\User',3,'auth','b7a28c0cd23ea9a9ab8df9f810bf3a6fe28833d7333894e10655f429ff21d9b8','[\"*\"]','2026-11-04 01:11:07',NULL,'2026-11-04 01:10:00','2026-11-04 01:11:07'),(17,'App\\Models\\User',2,'auth','a818968588ee841ba163ce9bb5fb6bbd85aa7e26378473c4f0d2d897cfdbd2d8','[\"*\"]','2026-11-04 01:15:17',NULL,'2026-11-04 01:11:21','2026-11-04 01:15:17'),(18,'App\\Models\\User',3,'auth','cf252427d10c349052e3212b012a82c473902765251af09ea46c8ce74bbc4ada','[\"*\"]','2026-11-04 01:17:07',NULL,'2026-11-04 01:15:48','2026-11-04 01:17:07'),(19,'App\\Models\\User',2,'auth','3883a68aae67b6670e350410d6644ecd5695e017a4dacfed8dc1c47dde17eea4','[\"*\"]','2026-11-04 03:34:56',NULL,'2026-11-04 01:18:00','2026-11-04 03:34:56'),(20,'App\\Models\\User',3,'auth','b6f3db522f7f4ddcacb5d79abb29833cc8b3616a057e659fa2a54375d293255b','[\"*\"]','2026-11-04 03:35:14',NULL,'2026-11-04 03:35:14','2026-11-04 03:35:14'),(21,'App\\Models\\User',2,'auth','4b77bb39a903bb15b2166bf21beadd24de2366775257b4542890780e3da8ebe5','[\"*\"]','2026-11-05 00:15:45',NULL,'2026-11-04 03:35:49','2026-11-05 00:15:45'),(22,'App\\Models\\User',3,'auth','607aa7680711c88e479d2fa0d02c1c5d2c4f86e394801236012e486b3de08495','[\"*\"]','2026-11-05 00:21:45',NULL,'2026-11-05 00:15:56','2026-11-05 00:21:45'),(23,'App\\Models\\User',2,'auth','ffd6c27fc9adc878196ed5ab72c17b9031a14dbc6f48b4098df84f1b7b055107','[\"*\"]','2026-11-05 01:01:57',NULL,'2026-11-05 00:24:16','2026-11-05 01:01:57'),(24,'App\\Models\\User',2,'auth','9ca63667c309c99f0f184d94bf973d5688cc151f9183bb74953562807db03ff0','[\"*\"]','2026-11-05 03:16:39',NULL,'2026-11-05 01:02:21','2026-11-05 03:16:39'),(25,'App\\Models\\User',2,'auth','551b0c21f7ff98f4833e94d36e841ecf28fe08846750edf175757e54a7a1c95b','[\"*\"]','2026-11-09 00:51:05',NULL,'2026-11-09 00:34:38','2026-11-09 00:51:05');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'Almaty','2026-10-28 01:49:15','2026-10-28 01:49:15'),(2,'Astana','2026-10-28 01:49:15','2026-10-28 01:49:15'),(3,'Almaty region','2026-10-28 01:49:15','2026-10-28 01:49:15'),(4,'Shymkent','2026-10-28 01:49:15','2026-10-28 01:49:15'),(5,'Akmola region','2026-10-28 01:49:15','2026-10-28 01:49:15'),(6,'Zhambyl region','2026-10-28 01:49:15','2026-10-28 01:49:15'),(7,'Kostanai region','2026-10-28 01:49:15','2026-10-28 01:49:15'),(8,'Aktobe region','2026-10-28 01:49:15','2026-10-28 01:49:15'),(9,'Karagandy region','2026-10-28 01:49:15','2026-10-28 01:49:15'),(10,'Mangistay region','2026-10-28 01:49:15','2026-10-28 01:49:15'),(11,'Almaty','2026-10-28 01:49:53','2026-10-28 01:49:53'),(12,'Astana','2026-10-28 01:49:53','2026-10-28 01:49:53'),(13,'Almaty region','2026-10-28 01:49:53','2026-10-28 01:49:53'),(14,'Shymkent','2026-10-28 01:49:53','2026-10-28 01:49:53'),(15,'Akmola region','2026-10-28 01:49:53','2026-10-28 01:49:53'),(16,'Zhambyl region','2026-10-28 01:49:53','2026-10-28 01:49:53'),(17,'Kostanai region','2026-10-28 01:49:53','2026-10-28 01:49:53'),(18,'Aktobe region','2026-10-28 01:49:53','2026-10-28 01:49:53'),(19,'Karagandy region','2026-10-28 01:49:53','2026-10-28 01:49:53'),(20,'Mangistay region','2026-10-28 01:49:53','2026-10-28 01:49:53');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int unsigned NOT NULL DEFAULT '0',
  `user_id` bigint unsigned NOT NULL,
  `gym_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_user_id_foreign` (`user_id`),
  KEY `reviews_gym_id_foreign` (`gym_id`),
  CONSTRAINT `reviews_gym_id_foreign` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'very cool gym',4,2,1,'2026-10-28 03:26:04','2026-10-28 03:26:04');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gym_id` bigint unsigned NOT NULL,
  `coach_id` bigint unsigned NOT NULL,
  `start_at` time NOT NULL,
  `end_at` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedules_gym_id_foreign` (`gym_id`),
  KEY `schedules_coach_id_foreign` (`coach_id`),
  CONSTRAINT `schedules_coach_id_foreign` FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `schedules_gym_id_foreign` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (12,1,17,'11:00:00','13:00:00','2026-10-28 01:55:23','2026-10-28 01:55:23'),(13,1,17,'14:00:00','16:00:00','2026-10-28 01:55:23','2026-10-28 01:55:23'),(14,1,17,'17:00:00','19:00:00','2026-10-28 01:55:23','2026-10-28 01:55:23'),(15,1,16,'09:00:00','10:00:00','2026-10-28 01:55:23','2026-10-28 01:55:23'),(16,1,16,'11:00:00','12:00:00','2026-10-28 01:55:23','2026-10-28 01:55:23'),(17,1,16,'13:00:00','14:00:00','2026-10-28 01:55:23','2026-10-28 01:55:23'),(18,1,16,'15:00:00','16:00:00','2026-10-28 01:55:23','2026-10-28 01:55:23'),(19,2,17,'10:00:00','13:00:00','2026-10-28 01:55:23','2026-10-28 01:55:23'),(20,2,17,'15:00:00','18:00:00','2026-10-28 01:55:23','2026-10-28 01:55:23'),(21,2,17,'19:00:00','22:00:00','2026-10-28 01:55:23','2026-10-28 01:55:23');
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
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
INSERT INTO `sessions` VALUES ('EZnG55WoTCOilzRvofDYxYOmQuP2wskcBeFegmVL',NULL,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJBSUFnZFQ3YjRwTEJOOHJuYTVDZWhlSWVCdXhBWVg4MHZlOEUwUWp5IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1793780338);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int unsigned NOT NULL,
  `gym_id` bigint unsigned NOT NULL,
  `duration_days` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptions_gym_id_foreign` (`gym_id`),
  CONSTRAINT `subscriptions_gym_id_foreign` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (1,'Junior',18000,2,30,'2026-10-28 01:50:53','2026-10-28 01:50:53'),(2,'Middle',15000,5,30,'2026-10-28 01:50:53','2026-10-28 01:50:53'),(3,'Senior',13000,3,30,'2026-10-28 01:50:53','2026-10-28 01:50:53'),(4,'TeamLead',8000,9,30,'2026-10-28 01:50:53','2026-10-28 01:50:53'),(5,'TechLead',5000,6,30,'2026-10-28 01:50:53','2026-10-28 01:50:53'),(6,'Middle+',14000,2,30,'2026-10-28 01:50:53','2026-10-28 01:50:53'),(7,'Junior+',17000,8,30,'2026-10-28 01:50:53','2026-10-28 01:50:53'),(8,'Senior+',10000,6,30,'2026-10-28 01:50:53','2026-10-28 01:50:53'),(9,'Project manager',20000,8,60,'2026-10-28 01:50:53','2026-10-28 01:50:53'),(10,'Boss',365000,2,365,'2026-10-28 01:50:53','2026-10-28 01:50:53'),(11,'Junior',18000,1,30,'2026-11-09 01:50:48','2026-11-09 01:50:48'),(12,'Middle',15000,1,30,'2026-11-09 01:50:48','2026-11-09 01:50:48'),(13,'Senior',13000,1,30,'2026-11-09 01:50:48','2026-11-09 01:50:48'),(14,'TeamLead',8000,1,30,'2026-11-09 01:50:48','2026-11-09 01:50:48'),(15,'TechLead',5000,1,30,'2026-11-09 01:50:48','2026-11-09 01:50:48');
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_subscriptions`
--

DROP TABLE IF EXISTS `user_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_subscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime NOT NULL,
  `subscription_id` bigint unsigned NOT NULL,
  `status` enum('active','expired') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_subscriptions_user_id_foreign` (`user_id`),
  KEY `user_subscriptions_subscription_id_foreign` (`subscription_id`),
  CONSTRAINT `user_subscriptions_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_subscriptions`
--

LOCK TABLES `user_subscriptions` WRITE;
/*!40000 ALTER TABLE `user_subscriptions` DISABLE KEYS */;
INSERT INTO `user_subscriptions` VALUES (1,2,'2026-10-28 07:30:56','2026-11-27 07:30:56',4,'active','2026-10-28 02:30:56','2026-10-28 02:30:56');
/*!40000 ALTER TABLE `user_subscriptions` ENABLE KEYS */;
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
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('client','coach','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'client',
  `avatar_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Naz','naz@mail.ru','+123','$2y$12$c50dd4DlgsplvJwHA9WGl.Z9Pq7DFQW4TKmgW7USCdERk7QLaQeBm','coach',NULL,'2026-10-28 01:50:13','2026-10-28 01:50:13'),(2,'Daniil','daniil@mail.ru','+1234','$2y$12$Zf55uM/8E.M79LVDWwFAOeUKZNj0tG/z3EDfyPPCAa520yfZnR1RW','client',NULL,'2026-10-28 01:50:13','2026-10-28 01:50:13'),(3,'Yura','yura@mail.ru','+12345','$2y$12$avCFyGrayIpli2fX/CfyhOHr3AWPRFlEIWBVC2FUPCx.QjA6VUmfG','client',NULL,'2026-10-28 01:50:13','2026-10-28 01:50:13'),(4,'Max','max@mail.ru','+1236','$2y$12$3GbMZv8qvj6ki6v38IBLguJpBSvKkRQ7SnN7HygptPCiMQc3FHbAK','coach',NULL,'2026-10-28 01:50:13','2026-10-28 01:50:13'),(5,'Aslambek','aslambek@mail.ru','+1237','$2y$12$y1K5D8oNCc5UcKFKVU9VdenYL5bvV45qh2q4nFVgV0/LLuiC.uVtu','coach',NULL,'2026-10-28 01:50:14','2026-10-28 01:50:14'),(6,'Akzhol','akzhol@mail.ru','+1238','$2y$12$s1S4EWOjSfXz3fKz6Z0yCOotqlYBb7jPq9tKqZzx1m2bSX1Rj9ow6','coach',NULL,'2026-10-28 01:50:14','2026-10-28 01:50:14'),(7,'Tima','tima@mail.ru','+1239','$2y$12$VzWxMHbRSm8RR./P87ccZ.ROuF7tqaWzwNM0uv2M.ENOZ2bTqnHlm','coach',NULL,'2026-10-28 01:50:14','2026-10-28 01:50:14'),(8,'artem','arteoe@mail.ru','656656656','$2y$12$ynrFq.aW/Cimb1BOrwJezu.YD87v0yAc0LL.RBp6qSNOQlQC/Zpsu','client',NULL,'2026-11-02 01:16:44','2026-11-02 01:16:44'),(9,'dsa','dsa@mail.ru','dsadsa','$2y$12$x9tlZA6XjeveHRBH6Nq3NeJPzEeL4mu6ZoDffYO4Ch28jWshrd3CW','client',NULL,'2026-11-02 02:32:43','2026-11-02 02:32:43');
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

-- Dump completed on 2026-11-12 15:19:34

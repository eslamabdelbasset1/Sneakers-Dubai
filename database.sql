-- MariaDB dump 10.19  Distrib 10.6.4-MariaDB, for osx10.16 (x86_64)
--
-- Host: localhost    Database: shopwise
-- ------------------------------------------------------
-- Server version	10.6.4-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'ZsSdz7imraqzTjCFNBVGS18iIeR7JOBC',1,'2022-01-03 21:21:19','2022-01-03 21:21:19','2022-01-03 21:21:19');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime DEFAULT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicked` bigint(20) NOT NULL DEFAULT 0,
  `order` int(11) DEFAULT 0,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ads_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads_translations`
--

DROP TABLE IF EXISTS `ads_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ads_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ads_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ads_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads_translations`
--

LOCK TABLES `ads_translations` WRITE;
/*!40000 ALTER TABLE `ads_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` int(10) unsigned NOT NULL,
  `reference_id` int(10) unsigned NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Ecommerce',0,'Assumenda aperiam expedita temporibus voluptate veniam ut. Distinctio id rerum ut nisi facilis qui. Deleniti sunt explicabo cumque omnis deleniti natus. Incidunt est totam debitis voluptas.','published',1,'Botble\\ACL\\Models\\User',NULL,0,0,1,'2022-01-03 21:21:18','2022-01-03 21:21:18'),(2,'Fashion',0,'Laborum libero saepe qui velit velit eos. Neque et ut vitae esse sint dolor. Eligendi aut neque sit qui esse. Qui quae sit quis hic.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2022-01-03 21:21:18','2022-01-03 21:21:18'),(3,'Electronic',0,'Consectetur consequatur corporis enim ab. Ut placeat ut libero aliquam. Ipsum commodi hic vel.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2022-01-03 21:21:18','2022-01-03 21:21:18'),(4,'Commercial',0,'Sit ut est tempora quaerat quibusdam. Velit enim qui harum. Ad illo rem similique et ipsa placeat.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2022-01-03 21:21:18','2022-01-03 21:21:18');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
INSERT INTO `categories_translations` VALUES ('vi',1,'Thương mại điện tử',NULL),('vi',2,'Thời trang',NULL),('vi',3,'Điện tử',NULL),('vi',4,'Thương mại',NULL);
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int(10) unsigned NOT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `record_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_backup`
--

DROP TABLE IF EXISTS `cities_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities_backup` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int(10) unsigned NOT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `record_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_backup`
--

LOCK TABLES `cities_backup` WRITE;
/*!40000 ALTER TABLE `cities_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_translations`
--

DROP TABLE IF EXISTS `cities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` int(11) NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`cities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_translations`
--

LOCK TABLES `cities_translations` WRITE;
/*!40000 ALTER TABLE `cities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_replies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_backup`
--

DROP TABLE IF EXISTS `countries_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries_backup` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_backup`
--

LOCK TABLES `countries_backup` WRITE;
/*!40000 ALTER TABLE `countries_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_translations`
--

DROP TABLE IF EXISTS `countries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` int(11) NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_translations`
--

LOCK TABLES `countries_translations` WRITE;
/*!40000 ALTER TABLE `countries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `widget_id` int(10) unsigned NOT NULL,
  `order` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `status` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_brands`
--

DROP TABLE IF EXISTS `ec_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `is_featured` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_brands`
--

LOCK TABLES `ec_brands` WRITE;
/*!40000 ALTER TABLE `ec_brands` DISABLE KEYS */;
INSERT INTO `ec_brands` VALUES (1,'Fashion live',NULL,NULL,'brands/1.png','published',0,1,'2022-01-03 21:20:43','2022-01-03 21:20:43'),(2,'Hand crafted',NULL,NULL,'brands/2.png','published',1,1,'2022-01-03 21:20:43','2022-01-03 21:20:43'),(3,'Mestonix',NULL,NULL,'brands/3.png','published',2,1,'2022-01-03 21:20:43','2022-01-03 21:20:43'),(4,'Sunshine',NULL,NULL,'brands/4.png','published',3,1,'2022-01-03 21:20:43','2022-01-03 21:20:43'),(5,'Pure',NULL,NULL,'brands/5.png','published',4,1,'2022-01-03 21:20:43','2022-01-03 21:20:43'),(6,'Anfold',NULL,NULL,'brands/6.png','published',5,1,'2022-01-03 21:20:43','2022-01-03 21:20:43'),(7,'Automotive',NULL,NULL,'brands/7.png','published',6,1,'2022-01-03 21:20:43','2022-01-03 21:20:43');
/*!40000 ALTER TABLE `ec_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_brands_translations`
--

DROP TABLE IF EXISTS `ec_brands_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_brands_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_brands_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_brands_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_brands_translations`
--

LOCK TABLES `ec_brands_translations` WRITE;
/*!40000 ALTER TABLE `ec_brands_translations` DISABLE KEYS */;
INSERT INTO `ec_brands_translations` VALUES ('vi',1,'Fashion live',NULL),('vi',2,'Hand crafted',NULL),('vi',3,'Mestonix',NULL),('vi',4,'Sunshine',NULL),('vi',5,'Pure',NULL),('vi',6,'Anfold',NULL),('vi',7,'Automotive',NULL);
/*!40000 ALTER TABLE `ec_brands_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_cart`
--

DROP TABLE IF EXISTS `ec_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_cart` (
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`identifier`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_cart`
--

LOCK TABLES `ec_cart` WRITE;
/*!40000 ALTER TABLE `ec_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_currencies`
--

DROP TABLE IF EXISTS `ec_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `decimals` tinyint(3) unsigned DEFAULT 0,
  `order` int(10) unsigned DEFAULT 0,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `exchange_rate` double NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_currencies`
--

LOCK TABLES `ec_currencies` WRITE;
/*!40000 ALTER TABLE `ec_currencies` DISABLE KEYS */;
INSERT INTO `ec_currencies` VALUES (1,'USD','$',1,2,0,1,1,'2022-01-03 21:20:43','2022-01-03 21:20:43'),(2,'EUR','€',0,2,1,0,0.84,'2022-01-03 21:20:43','2022-01-03 21:20:43'),(3,'VND','₫',0,0,2,0,23203,'2022-01-03 21:20:43','2022-01-03 21:20:43');
/*!40000 ALTER TABLE `ec_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_addresses`
--

DROP TABLE IF EXISTS `ec_customer_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_customer_addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `is_default` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_addresses`
--

LOCK TABLES `ec_customer_addresses` WRITE;
/*!40000 ALTER TABLE `ec_customer_addresses` DISABLE KEYS */;
INSERT INTO `ec_customer_addresses` VALUES (1,'John Smith','john.smith@botble.com','+18288804370','TL','Utah','New Ena','209 Bode Road',1,1,'2022-01-03 21:20:46','2022-01-03 21:20:46','72689-0438'),(2,'John Smith','john.smith@botble.com','+18186619632','TT','Kentucky','East Mosesmouth','3350 Koepp Courts Apt. 439',1,0,'2022-01-03 21:20:46','2022-01-03 21:20:46','76467'),(3,'Gilda Gutkowski','ukozey@example.org','+15306245381','IO','Arizona','Barrettfort','57730 Abbigail Dam',2,1,'2022-01-03 21:20:47','2022-01-03 21:20:47','48932-5674'),(4,'Norris Heller','phirthe@example.net','+16604353530','TL','Washington','Eloyville','3814 Raina Pines Suite 619',3,1,'2022-01-03 21:20:47','2022-01-03 21:20:47','00098'),(5,'Dr. Megane O\'Keefe','pietro.maggio@example.org','+17274382659','LB','Iowa','Port Sigurdmouth','9944 Streich Curve',4,1,'2022-01-03 21:20:47','2022-01-03 21:20:47','70890'),(6,'Cody O\'Reilly','orrin05@example.com','+15206722188','GS','Massachusetts','Harberview','63261 Lavern Shore',5,1,'2022-01-03 21:20:47','2022-01-03 21:20:47','16348'),(7,'Betty Maggio Jr.','shanelle89@example.com','+14407015303','VC','Ohio','Camrynborough','36739 Bechtelar Street',6,1,'2022-01-03 21:20:47','2022-01-03 21:20:47','74159-1231'),(8,'Maudie Jacobi Jr.','cdietrich@example.net','+14586271866','BN','Oklahoma','Port Deontae','704 Marge Tunnel',7,1,'2022-01-03 21:20:47','2022-01-03 21:20:47','33560'),(9,'Prof. Kaden Gerhold','virginie88@example.net','+18014325651','AI','Missouri','Jacobsland','86903 Vernice Estates',8,1,'2022-01-03 21:20:47','2022-01-03 21:20:47','96845'),(10,'Prof. Rhiannon Hudson','geovanny53@example.net','+14848855711','CN','Tennessee','South Gavinville','460 Lela Spurs',9,1,'2022-01-03 21:20:47','2022-01-03 21:20:47','26517-5471'),(11,'Lavern Stoltenberg','rosella.blick@example.org','+18707120139','SY','West Virginia','Favianville','166 Nyah Shores',10,1,'2022-01-03 21:20:47','2022-01-03 21:20:47','46044-0994'),(12,'Miss Georgianna Rowe','rory17@example.org','+18564350372','UG','Wyoming','Port Catherine','334 Jaskolski Mews Suite 654',11,1,'2022-01-03 21:20:47','2022-01-03 21:20:47','51411-0474');
/*!40000 ALTER TABLE `ec_customer_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_password_resets`
--

DROP TABLE IF EXISTS `ec_customer_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `ec_customer_password_resets_email_index` (`email`),
  KEY `ec_customer_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_password_resets`
--

LOCK TABLES `ec_customer_password_resets` WRITE;
/*!40000 ALTER TABLE `ec_customer_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customers`
--

DROP TABLE IF EXISTS `ec_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activated',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_customers_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customers`
--

LOCK TABLES `ec_customers` WRITE;
/*!40000 ALTER TABLE `ec_customers` DISABLE KEYS */;
INSERT INTO `ec_customers` VALUES (1,'John Smith','john.smith@botble.com','$2y$10$/9/b4C1PqxZT7Hb3zZtRCOtwZXaFxZR3W/05KUSMpvP/mMtYonRhC','customers/1.jpg',NULL,'+16517592198',NULL,'2022-01-03 21:20:46','2022-01-03 21:20:46','2022-01-04 04:20:46',NULL,'activated'),(2,'Gilda Gutkowski','ukozey@example.org','$2y$10$6p2wEecZ3SCWXYMcpG33guXRlLohyGtQSpV1G7C3vImkCgJDysHG6','customers/1.jpg',NULL,'+17085045205',NULL,'2022-01-03 21:20:46','2022-01-03 21:20:47','2022-01-04 04:20:47',NULL,'activated'),(3,'Norris Heller','phirthe@example.net','$2y$10$d7pge0dBg9ZMLbKRgll4d.EG/I2.TmKyeYdKI8mIp/Onuy3fZ6rqG','customers/2.jpg',NULL,'+14429786561',NULL,'2022-01-03 21:20:47','2022-01-03 21:20:47','2022-01-04 04:20:47',NULL,'activated'),(4,'Dr. Megane O\'Keefe','pietro.maggio@example.org','$2y$10$n4OMnTbfAwxKIx1an.V3Z.jqEAvbJDJTi7s6lUw3fZXoTtgK9UhX.','customers/3.jpg',NULL,'+14454936268',NULL,'2022-01-03 21:20:47','2022-01-03 21:20:47','2022-01-04 04:20:47',NULL,'activated'),(5,'Cody O\'Reilly','orrin05@example.com','$2y$10$5OsxQp3L3FEkCq46ltWdruC4TAq7x5QvONneiMG/goHL15ceFUHvG','customers/4.jpg',NULL,'+19719610072',NULL,'2022-01-03 21:20:47','2022-01-03 21:20:47','2022-01-04 04:20:47',NULL,'activated'),(6,'Betty Maggio Jr.','shanelle89@example.com','$2y$10$glSqQ4Vt0Qzd2Fa2x9anIO5H.4OnglXwFmtX8GlWKML3rj7/7yy1u','customers/5.jpg',NULL,'+14308233006',NULL,'2022-01-03 21:20:47','2022-01-03 21:20:47','2022-01-04 04:20:47',NULL,'activated'),(7,'Maudie Jacobi Jr.','cdietrich@example.net','$2y$10$UOiuWClgWBrvixGA9PnsqO88qSyhjGqhGoy8Eaw4pSAyemOooX6yK','customers/6.jpg',NULL,'+17605634307',NULL,'2022-01-03 21:20:47','2022-01-03 21:20:47','2022-01-04 04:20:47',NULL,'activated'),(8,'Prof. Kaden Gerhold','virginie88@example.net','$2y$10$F3kzRLw3hcBmhQlfZR4Ty.CZ6h4QTHnNSE0CLaLWitUi9mylBSiAO','customers/7.jpg',NULL,'+19868678118',NULL,'2022-01-03 21:20:47','2022-01-03 21:20:47','2022-01-04 04:20:47',NULL,'activated'),(9,'Prof. Rhiannon Hudson','geovanny53@example.net','$2y$10$YLRI0Lvz.SFPsGq2K8KQb.bi.hHP7TMCXiAviDOKi4Ql8G4pYHTJS','customers/8.jpg',NULL,'+16895586146',NULL,'2022-01-03 21:20:47','2022-01-03 21:20:47','2022-01-04 04:20:47',NULL,'activated'),(10,'Lavern Stoltenberg','rosella.blick@example.org','$2y$10$aGsPnnfOIcm0pWyEFY6pV.NH4WRgTPICwGytIQUkwGJb/KzUp6s9.','customers/9.jpg',NULL,'+13522609240',NULL,'2022-01-03 21:20:47','2022-01-03 21:20:47','2022-01-04 04:20:47',NULL,'activated'),(11,'Miss Georgianna Rowe','rory17@example.org','$2y$10$RSHRiIk5mN7ZSZ6uPvP6uuOB/oOrXGWqs8g6F8wAEqRUYBuc7T9H.','customers/10.jpg',NULL,'+14409244086',NULL,'2022-01-03 21:20:47','2022-01-03 21:20:47','2022-01-04 04:20:47',NULL,'activated');
/*!40000 ALTER TABLE `ec_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_customers`
--

DROP TABLE IF EXISTS `ec_discount_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_discount_customers` (
  `discount_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_customers`
--

LOCK TABLES `ec_discount_customers` WRITE;
/*!40000 ALTER TABLE `ec_discount_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_product_collections`
--

DROP TABLE IF EXISTS `ec_discount_product_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_discount_product_collections` (
  `discount_id` int(10) unsigned NOT NULL,
  `product_collection_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_product_collections`
--

LOCK TABLES `ec_discount_product_collections` WRITE;
/*!40000 ALTER TABLE `ec_discount_product_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_product_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_products`
--

DROP TABLE IF EXISTS `ec_discount_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_discount_products` (
  `discount_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_products`
--

LOCK TABLES `ec_discount_products` WRITE;
/*!40000 ALTER TABLE `ec_discount_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discounts`
--

DROP TABLE IF EXISTS `ec_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_used` int(10) unsigned NOT NULL DEFAULT 0,
  `value` double DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'coupon',
  `can_use_with_promotion` tinyint(1) NOT NULL DEFAULT 0,
  `discount_on` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` int(10) unsigned DEFAULT NULL,
  `type_option` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `target` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all-orders',
  `min_order_price` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_discounts_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discounts`
--

LOCK TABLES `ec_discounts` WRITE;
/*!40000 ALTER TABLE `ec_discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sale_products`
--

DROP TABLE IF EXISTS `ec_flash_sale_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_flash_sale_products` (
  `flash_sale_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `price` double unsigned DEFAULT NULL,
  `quantity` int(10) unsigned DEFAULT NULL,
  `sold` int(10) unsigned NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sale_products`
--

LOCK TABLES `ec_flash_sale_products` WRITE;
/*!40000 ALTER TABLE `ec_flash_sale_products` DISABLE KEYS */;
INSERT INTO `ec_flash_sale_products` VALUES (1,22,57.5,17,4),(2,1,247.66,15,4);
/*!40000 ALTER TABLE `ec_flash_sale_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sales`
--

DROP TABLE IF EXISTS `ec_flash_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_flash_sales` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` datetime NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sales`
--

LOCK TABLES `ec_flash_sales` WRITE;
/*!40000 ALTER TABLE `ec_flash_sales` DISABLE KEYS */;
INSERT INTO `ec_flash_sales` VALUES (1,'Deal of the Day.','2022-04-13 00:00:00','published','2022-03-20 07:06:37','2022-03-20 07:06:37'),(2,'Gadgets & Accessories','2022-04-23 00:00:00','published','2022-03-20 07:06:37','2022-03-20 07:06:37');
/*!40000 ALTER TABLE `ec_flash_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sales_translations`
--

DROP TABLE IF EXISTS `ec_flash_sales_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_flash_sales_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_flash_sales_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_flash_sales_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sales_translations`
--

LOCK TABLES `ec_flash_sales_translations` WRITE;
/*!40000 ALTER TABLE `ec_flash_sales_translations` DISABLE KEYS */;
INSERT INTO `ec_flash_sales_translations` VALUES ('vi',1,'Khuyến mãi trong ngày.'),('vi',2,'Tiện ích & Phụ kiện');
/*!40000 ALTER TABLE `ec_flash_sales_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_grouped_products`
--

DROP TABLE IF EXISTS `ec_grouped_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_grouped_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_product_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `fixed_qty` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_grouped_products`
--

LOCK TABLES `ec_grouped_products` WRITE;
/*!40000 ALTER TABLE `ec_grouped_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_grouped_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_addresses`
--

DROP TABLE IF EXISTS `ec_order_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_order_addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_addresses`
--

LOCK TABLES `ec_order_addresses` WRITE;
/*!40000 ALTER TABLE `ec_order_addresses` DISABLE KEYS */;
INSERT INTO `ec_order_addresses` VALUES (1,'Cody O\'Reilly','+15206722188','orrin05@example.com','GS','Massachusetts','Harberview','63261 Lavern Shore',1,'16348'),(2,'Maudie Jacobi Jr.','+14586271866','cdietrich@example.net','BN','Oklahoma','Port Deontae','704 Marge Tunnel',2,'33560'),(3,'Gilda Gutkowski','+15306245381','ukozey@example.org','IO','Arizona','Barrettfort','57730 Abbigail Dam',3,'48932-5674'),(4,'Lavern Stoltenberg','+18707120139','rosella.blick@example.org','SY','West Virginia','Favianville','166 Nyah Shores',4,'46044-0994'),(5,'John Smith','+18288804370','john.smith@botble.com','TL','Utah','New Ena','209 Bode Road',5,'72689-0438'),(6,'Miss Georgianna Rowe','+18564350372','rory17@example.org','UG','Wyoming','Port Catherine','334 Jaskolski Mews Suite 654',6,'51411-0474'),(7,'Norris Heller','+16604353530','phirthe@example.net','TL','Washington','Eloyville','3814 Raina Pines Suite 619',7,'00098'),(8,'Gilda Gutkowski','+15306245381','ukozey@example.org','IO','Arizona','Barrettfort','57730 Abbigail Dam',8,'48932-5674'),(9,'Gilda Gutkowski','+15306245381','ukozey@example.org','IO','Arizona','Barrettfort','57730 Abbigail Dam',9,'48932-5674'),(10,'Dr. Megane O\'Keefe','+17274382659','pietro.maggio@example.org','LB','Iowa','Port Sigurdmouth','9944 Streich Curve',10,'70890'),(11,'Norris Heller','+16604353530','phirthe@example.net','TL','Washington','Eloyville','3814 Raina Pines Suite 619',11,'00098'),(12,'Cody O\'Reilly','+15206722188','orrin05@example.com','GS','Massachusetts','Harberview','63261 Lavern Shore',12,'16348'),(13,'Miss Georgianna Rowe','+18564350372','rory17@example.org','UG','Wyoming','Port Catherine','334 Jaskolski Mews Suite 654',13,'51411-0474'),(14,'Prof. Rhiannon Hudson','+14848855711','geovanny53@example.net','CN','Tennessee','South Gavinville','460 Lela Spurs',14,'26517-5471'),(15,'Betty Maggio Jr.','+14407015303','shanelle89@example.com','VC','Ohio','Camrynborough','36739 Bechtelar Street',15,'74159-1231'),(16,'Lavern Stoltenberg','+18707120139','rosella.blick@example.org','SY','West Virginia','Favianville','166 Nyah Shores',16,'46044-0994'),(17,'Betty Maggio Jr.','+14407015303','shanelle89@example.com','VC','Ohio','Camrynborough','36739 Bechtelar Street',17,'74159-1231'),(18,'Betty Maggio Jr.','+14407015303','shanelle89@example.com','VC','Ohio','Camrynborough','36739 Bechtelar Street',18,'74159-1231'),(19,'Norris Heller','+16604353530','phirthe@example.net','TL','Washington','Eloyville','3814 Raina Pines Suite 619',19,'00098'),(20,'Miss Georgianna Rowe','+18564350372','rory17@example.org','UG','Wyoming','Port Catherine','334 Jaskolski Mews Suite 654',20,'51411-0474');
/*!40000 ALTER TABLE `ec_order_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_histories`
--

DROP TABLE IF EXISTS `ec_order_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_order_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `extras` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_histories`
--

LOCK TABLES `ec_order_histories` WRITE;
/*!40000 ALTER TABLE `ec_order_histories` DISABLE KEYS */;
INSERT INTO `ec_order_histories` VALUES (1,'create_order_from_seeder','Order is created from the checkout page',NULL,1,NULL,'2022-03-15 07:06:38','2022-03-15 07:06:38'),(2,'confirm_order','Order was verified by %user_name%',0,1,NULL,'2022-03-15 07:06:38','2022-03-15 07:06:38'),(3,'confirm_payment','Payment was confirmed (amount $1,606.00) by %user_name%',0,1,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(4,'create_shipment','Created shipment for order',0,1,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(5,'create_order_from_seeder','Order is created from the checkout page',NULL,2,NULL,'2022-03-06 01:06:38','2022-03-06 01:06:38'),(6,'confirm_order','Order was verified by %user_name%',0,2,NULL,'2022-03-06 01:06:38','2022-03-06 01:06:38'),(7,'create_shipment','Created shipment for order',0,2,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(8,'create_order_from_seeder','Order is created from the checkout page',NULL,3,NULL,'2022-03-18 19:06:38','2022-03-18 19:06:38'),(9,'confirm_order','Order was verified by %user_name%',0,3,NULL,'2022-03-18 19:06:38','2022-03-18 19:06:38'),(10,'confirm_payment','Payment was confirmed (amount $483.90) by %user_name%',0,3,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(11,'create_shipment','Created shipment for order',0,3,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(12,'create_order_from_seeder','Order is created from the checkout page',NULL,4,NULL,'2022-03-17 11:06:38','2022-03-17 11:06:38'),(13,'confirm_order','Order was verified by %user_name%',0,4,NULL,'2022-03-17 11:06:38','2022-03-17 11:06:38'),(14,'create_shipment','Created shipment for order',0,4,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(15,'create_order_from_seeder','Order is created from the checkout page',NULL,5,NULL,'2022-03-06 23:06:38','2022-03-06 23:06:38'),(16,'confirm_order','Order was verified by %user_name%',0,5,NULL,'2022-03-06 23:06:38','2022-03-06 23:06:38'),(17,'confirm_payment','Payment was confirmed (amount $1,542.80) by %user_name%',0,5,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(18,'create_shipment','Created shipment for order',0,5,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(19,'update_status','Changed status of shipping to : Delivered . Updated by: %user_name%',0,5,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(20,'create_order_from_seeder','Order is created from the checkout page',NULL,6,NULL,'2022-03-14 01:06:38','2022-03-14 01:06:38'),(21,'confirm_order','Order was verified by %user_name%',0,6,NULL,'2022-03-14 01:06:38','2022-03-14 01:06:38'),(22,'create_shipment','Created shipment for order',0,6,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(23,'create_order_from_seeder','Order is created from the checkout page',NULL,7,NULL,'2022-03-10 23:06:38','2022-03-10 23:06:38'),(24,'confirm_order','Order was verified by %user_name%',0,7,NULL,'2022-03-10 23:06:38','2022-03-10 23:06:38'),(25,'create_shipment','Created shipment for order',0,7,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(26,'update_status','Changed status of shipping to : Delivered . Updated by: %user_name%',0,7,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(27,'create_order_from_seeder','Order is created from the checkout page',NULL,8,NULL,'2022-03-13 19:06:38','2022-03-13 19:06:38'),(28,'confirm_order','Order was verified by %user_name%',0,8,NULL,'2022-03-13 19:06:38','2022-03-13 19:06:38'),(29,'confirm_payment','Payment was confirmed (amount $430.50) by %user_name%',0,8,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(30,'create_shipment','Created shipment for order',0,8,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(31,'update_status','Changed status of shipping to : Delivered . Updated by: %user_name%',0,8,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(32,'create_order_from_seeder','Order is created from the checkout page',NULL,9,NULL,'2022-03-17 07:06:38','2022-03-17 07:06:38'),(33,'confirm_order','Order was verified by %user_name%',0,9,NULL,'2022-03-17 07:06:38','2022-03-17 07:06:38'),(34,'confirm_payment','Payment was confirmed (amount $1,330.00) by %user_name%',0,9,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(35,'create_shipment','Created shipment for order',0,9,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(36,'update_status','Changed status of shipping to : Delivered . Updated by: %user_name%',0,9,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(37,'create_order_from_seeder','Order is created from the checkout page',NULL,10,NULL,'2022-03-12 01:06:38','2022-03-12 01:06:38'),(38,'confirm_order','Order was verified by %user_name%',0,10,NULL,'2022-03-12 01:06:38','2022-03-12 01:06:38'),(39,'create_shipment','Created shipment for order',0,10,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(40,'update_status','Changed status of shipping to : Delivered . Updated by: %user_name%',0,10,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(41,'create_order_from_seeder','Order is created from the checkout page',NULL,11,NULL,'2022-03-14 11:06:38','2022-03-14 11:06:38'),(42,'confirm_order','Order was verified by %user_name%',0,11,NULL,'2022-03-14 11:06:38','2022-03-14 11:06:38'),(43,'confirm_payment','Payment was confirmed (amount $240.35) by %user_name%',0,11,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(44,'create_shipment','Created shipment for order',0,11,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(45,'update_status','Changed status of shipping to : Delivered . Updated by: %user_name%',0,11,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(46,'create_order_from_seeder','Order is created from the checkout page',NULL,12,NULL,'2022-03-12 19:06:38','2022-03-12 19:06:38'),(47,'confirm_order','Order was verified by %user_name%',0,12,NULL,'2022-03-12 19:06:38','2022-03-12 19:06:38'),(48,'create_shipment','Created shipment for order',0,12,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(49,'create_order_from_seeder','Order is created from the checkout page',NULL,13,NULL,'2022-03-16 07:06:38','2022-03-16 07:06:38'),(50,'confirm_order','Order was verified by %user_name%',0,13,NULL,'2022-03-16 07:06:38','2022-03-16 07:06:38'),(51,'confirm_payment','Payment was confirmed (amount $1,533.90) by %user_name%',0,13,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(52,'create_shipment','Created shipment for order',0,13,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(53,'update_status','Changed status of shipping to : Delivered . Updated by: %user_name%',0,13,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(54,'create_order_from_seeder','Order is created from the checkout page',NULL,14,NULL,'2022-03-15 15:06:38','2022-03-15 15:06:38'),(55,'confirm_order','Order was verified by %user_name%',0,14,NULL,'2022-03-15 15:06:38','2022-03-15 15:06:38'),(56,'create_shipment','Created shipment for order',0,14,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(57,'update_status','Changed status of shipping to : Delivered . Updated by: %user_name%',0,14,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(58,'create_order_from_seeder','Order is created from the checkout page',NULL,15,NULL,'2022-03-16 19:06:38','2022-03-16 19:06:38'),(59,'confirm_order','Order was verified by %user_name%',0,15,NULL,'2022-03-16 19:06:38','2022-03-16 19:06:38'),(60,'confirm_payment','Payment was confirmed (amount $608.55) by %user_name%',0,15,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(61,'create_shipment','Created shipment for order',0,15,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(62,'create_order_from_seeder','Order is created from the checkout page',NULL,16,NULL,'2022-03-19 11:06:38','2022-03-19 11:06:38'),(63,'confirm_order','Order was verified by %user_name%',0,16,NULL,'2022-03-19 11:06:38','2022-03-19 11:06:38'),(64,'create_shipment','Created shipment for order',0,16,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(65,'create_order_from_seeder','Order is created from the checkout page',NULL,17,NULL,'2022-03-18 07:06:38','2022-03-18 07:06:38'),(66,'confirm_order','Order was verified by %user_name%',0,17,NULL,'2022-03-18 07:06:38','2022-03-18 07:06:38'),(67,'create_shipment','Created shipment for order',0,17,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(68,'create_order_from_seeder','Order is created from the checkout page',NULL,18,NULL,'2022-03-18 01:06:39','2022-03-18 01:06:39'),(69,'confirm_order','Order was verified by %user_name%',0,18,NULL,'2022-03-18 01:06:39','2022-03-18 01:06:39'),(70,'confirm_payment','Payment was confirmed (amount $426.70) by %user_name%',0,18,NULL,'2022-03-20 07:06:39','2022-03-20 07:06:39'),(71,'create_shipment','Created shipment for order',0,18,NULL,'2022-03-20 07:06:39','2022-03-20 07:06:39'),(72,'update_status','Changed status of shipping to : Delivered . Updated by: %user_name%',0,18,NULL,'2022-03-20 07:06:39','2022-03-20 07:06:39'),(73,'create_order_from_seeder','Order is created from the checkout page',NULL,19,NULL,'2022-03-19 19:06:39','2022-03-19 19:06:39'),(74,'confirm_order','Order was verified by %user_name%',0,19,NULL,'2022-03-19 19:06:39','2022-03-19 19:06:39'),(75,'confirm_payment','Payment was confirmed (amount $518.83) by %user_name%',0,19,NULL,'2022-03-20 07:06:39','2022-03-20 07:06:39'),(76,'create_shipment','Created shipment for order',0,19,NULL,'2022-03-20 07:06:39','2022-03-20 07:06:39'),(77,'create_order_from_seeder','Order is created from the checkout page',NULL,20,NULL,'2022-03-20 03:06:39','2022-03-20 03:06:39'),(78,'confirm_order','Order was verified by %user_name%',0,20,NULL,'2022-03-20 03:06:39','2022-03-20 03:06:39'),(79,'confirm_payment','Payment was confirmed (amount $745.90) by %user_name%',0,20,NULL,'2022-03-20 07:06:39','2022-03-20 07:06:39'),(80,'create_shipment','Created shipment for order',0,20,NULL,'2022-03-20 07:06:39','2022-03-20 07:06:39'),(81,'update_status','Order confirmed by %user_name%',0,5,NULL,'2022-03-20 07:06:39','2022-03-20 07:06:39'),(82,'update_status','Order confirmed by %user_name%',0,8,NULL,'2022-03-20 07:06:39','2022-03-20 07:06:39'),(83,'update_status','Order confirmed by %user_name%',0,9,NULL,'2022-03-20 07:06:39','2022-03-20 07:06:39'),(84,'update_status','Order confirmed by %user_name%',0,11,NULL,'2022-03-20 07:06:39','2022-03-20 07:06:39'),(85,'update_status','Order confirmed by %user_name%',0,13,NULL,'2022-03-20 07:06:39','2022-03-20 07:06:39'),(86,'update_status','Order confirmed by %user_name%',0,18,NULL,'2022-03-20 07:06:39','2022-03-20 07:06:39');
/*!40000 ALTER TABLE `ec_order_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_product`
--

DROP TABLE IF EXISTS `ec_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_order_product` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` double(8,2) DEFAULT 0.00,
  `restock_quantity` int(10) unsigned DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_product`
--

LOCK TABLES `ec_order_product` WRITE;
/*!40000 ALTER TABLE `ec_order_product` DISABLE KEYS */;
INSERT INTO `ec_order_product` VALUES (1,1,1,406.00,40.60,'[]',32,'Smart Home Speaker',555.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(2,1,3,374.00,37.40,'[]',52,'Macbook Air 12 inch',2334.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(3,2,1,125.00,12.50,'[]',59,'Apple Keyboard',510.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(4,2,1,113.00,11.30,'[]',60,'MacSafe 80W',747.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(5,2,3,119.00,11.90,'[]',80,'Historic Alarm Clock',1989.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(6,2,2,50.00,5.00,'[]',105,'Red & Black Headphone',1610.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(7,3,1,113.00,11.30,'[]',61,'MacSafe 80W',747.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(8,3,1,115.00,11.50,'[]',85,'Black Glasses',847.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(9,3,2,111.00,11.10,'[]',88,'Gaming Keyboard',1398.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(10,4,3,125.00,12.50,'[]',54,'Apple Watch Serial 7',2322.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(11,4,2,113.00,11.30,'[]',60,'MacSafe 80W',1494.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(12,5,2,406.00,40.60,'[]',33,'Smart Home Speaker',1110.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(13,5,1,309.00,30.90,'[]',37,'Boxed - Bluetooth Headphone',882.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(14,5,3,113.00,11.30,'[]',64,'Hand playstation',1845.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(15,6,2,125.00,12.50,'[]',58,'Apple Keyboard',1020.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(16,6,3,113.00,11.30,'[]',74,'Leather Watch Band Serial 3',1557.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(17,6,3,111.00,11.10,'[]',89,'Gaming Keyboard',2097.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(18,7,1,374.00,37.40,'[]',50,'Macbook Air 12 inch',778.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(19,7,1,115.00,11.50,'[]',82,'Black Glasses',847.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(20,7,1,111.00,11.10,'[]',88,'Gaming Keyboard',699.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(21,8,2,44.00,4.40,'[]',41,'Camera Hikvision HK-35VS8',1458.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(22,8,2,111.00,11.10,'[]',88,'Gaming Keyboard',1398.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(23,8,2,50.00,5.00,'[]',109,'Samsung Smart TV',1422.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(24,9,3,309.00,30.90,'[]',37,'Boxed - Bluetooth Headphone',2646.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(25,9,1,113.00,11.30,'[]',70,'Cool Smart Watches',594.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(26,9,2,118.00,11.80,'[]',72,'Black Smart Watches',1392.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(27,10,2,121.00,12.10,'[]',86,'Phillips Mouse',1586.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(28,10,1,20.00,2.00,'[]',98,'Beat Headphone',747.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(29,11,1,128.00,12.80,'[]',77,'Macbook Pro 2015 13 inch',879.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(30,11,1,40.50,4.05,'[]',95,'Smart Watches',827.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(31,11,1,50.00,5.00,'[]',105,'Red & Black Headphone',805.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(32,12,2,406.00,40.60,'[]',33,'Smart Home Speaker',1110.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(33,12,3,125.00,12.50,'[]',57,'Apple Keyboard',1530.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(34,12,3,119.00,11.90,'[]',80,'Historic Alarm Clock',1989.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(35,12,3,115.00,11.50,'[]',85,'Black Glasses',2541.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(36,13,3,368.00,36.80,'[]',34,'Headphone Ultra Bass',2202.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(37,13,1,113.00,11.30,'[]',69,'Cool Smart Watches',594.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(38,13,2,128.00,12.80,'[]',79,'Macbook Pro 2015 13 inch',1758.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(39,14,2,125.00,12.50,'[]',53,'Apple Watch Serial 7',1548.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(40,14,2,20.00,2.00,'[]',100,'Beat Headphone',1494.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(41,15,2,112.00,11.20,'[]',66,'Apple Airpods Serial 3',1564.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(42,15,2,118.00,11.80,'[]',72,'Black Smart Watches',1392.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(43,15,3,40.50,4.05,'[]',93,'Smart Watches',2481.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(44,16,2,125.00,12.50,'[]',54,'Apple Watch Serial 7',1548.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(45,16,1,20.00,2.00,'[]',98,'Beat Headphone',747.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(46,17,3,53.00,5.30,'[]',44,'Camera Samsung SS-24',1740.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(47,17,3,124.00,12.40,'[]',48,'Apple iPhone 13 Plus',1509.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(48,17,1,113.00,11.30,'[]',73,'Leather Watch Band Serial 3',519.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(49,17,3,128.00,12.80,'[]',79,'Macbook Pro 2015 13 inch',2637.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(50,18,2,53.00,5.30,'[]',44,'Camera Samsung SS-24',1160.00,0,'2022-03-20 07:06:39','2022-03-20 07:06:39'),(51,18,2,124.00,12.40,'[]',48,'Apple iPhone 13 Plus',1006.00,0,'2022-03-20 07:06:39','2022-03-20 07:06:39'),(52,18,1,50.00,5.00,'[]',103,'Red & Black Headphone',805.00,0,'2022-03-20 07:06:39','2022-03-20 07:06:39'),(53,19,3,113.00,11.30,'[]',60,'MacSafe 80W',2241.00,0,'2022-03-20 07:06:39','2022-03-20 07:06:39'),(54,19,2,80.25,8.03,'[]',92,'Dual Camera 20MP',1706.00,0,'2022-03-20 07:06:39','2022-03-20 07:06:39'),(55,20,1,406.00,40.60,'[]',33,'Smart Home Speaker',555.00,0,'2022-03-20 07:06:39','2022-03-20 07:06:39'),(56,20,3,83.00,8.30,'[]',39,'Chikie - Bluetooth Speaker',1887.00,0,'2022-03-20 07:06:39','2022-03-20 07:06:39'),(57,20,2,20.00,2.00,'[]',99,'Beat Headphone',1494.00,0,'2022-03-20 07:06:39','2022-03-20 07:06:39');
/*!40000 ALTER TABLE `ec_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_orders`
--

DROP TABLE IF EXISTS `ec_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `amount` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) DEFAULT NULL,
  `shipping_amount` decimal(15,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `discount_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_finished` tinyint(1) DEFAULT 1,
  `token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_orders`
--

LOCK TABLES `ec_orders` WRITE;
/*!40000 ALTER TABLE `ec_orders` DISABLE KEYS */;
INSERT INTO `ec_orders` VALUES (1,5,'1','default','pending',1606.00,78.00,0.00,NULL,NULL,0.00,1528.00,1,NULL,1,'VosKRo0iSQkYCZxulw9vNQyIhDJN5',1,'2022-03-15 07:06:38','2022-03-20 07:06:38'),(2,7,'1','default','pending',735.70,40.70,0.00,NULL,NULL,0.00,695.00,1,NULL,1,'XK6PRxdhcNXccXKLXeFBAcSJDSWIs',2,'2022-03-06 01:06:38','2022-03-20 07:06:38'),(3,2,'1','default','pending',483.90,33.90,0.00,NULL,NULL,0.00,450.00,1,NULL,1,'xzpOUYboI7XRWF4tvAv8VM8ZUI9tr',3,'2022-03-18 19:06:38','2022-03-20 07:06:38'),(4,10,'1','default','pending',624.80,23.80,0.00,NULL,NULL,0.00,601.00,1,NULL,1,'PmOe1fCKRmjqgFWukVu7jVa2pgOZk',4,'2022-03-17 11:06:38','2022-03-20 07:06:38'),(5,1,'1','default','completed',1542.80,82.80,0.00,NULL,NULL,0.00,1460.00,1,NULL,1,'6DRrC8IpyUMZJFvWb0nqGp4tDvpDK',5,'2022-03-06 23:06:38','2022-03-20 07:06:38'),(6,11,'1','default','pending',956.90,34.90,0.00,NULL,NULL,0.00,922.00,1,NULL,1,'uT951I8ECbXePuV3r1oHXABPZwEC3',6,'2022-03-14 01:06:38','2022-03-20 07:06:38'),(7,3,'1','default','completed',660.00,60.00,0.00,NULL,NULL,0.00,600.00,1,NULL,1,'rSR82OlPu2brErYOsNIPOIql0Wz0X',7,'2022-03-10 23:06:38','2022-03-20 07:06:38'),(8,2,'1','default','completed',430.50,20.50,0.00,NULL,NULL,0.00,410.00,1,NULL,1,'l5IY8KUJ8IM1yOfgVHXAydIlGkTO0',8,'2022-03-13 19:06:38','2022-03-20 07:06:38'),(9,2,'1','default','completed',1330.00,54.00,0.00,NULL,NULL,0.00,1276.00,1,NULL,1,'PJNKsqF845uACrzUHfLQakiiLsn7B',9,'2022-03-17 07:06:38','2022-03-20 07:06:38'),(10,4,'1','default','completed',276.10,14.10,0.00,NULL,NULL,0.00,262.00,1,NULL,1,'9CpW0RcUzpeE4uP89YpwxbuuuC1F5',10,'2022-03-12 01:06:38','2022-03-20 07:06:38'),(11,3,'1','default','completed',240.35,21.85,0.00,NULL,NULL,0.00,218.50,1,NULL,1,'6K1HsGMx8fyrnVPAb6RYnvFbcyGGL',11,'2022-03-14 11:06:38','2022-03-20 07:06:38'),(12,5,'1','default','pending',1965.50,76.50,0.00,NULL,NULL,0.00,1889.00,1,NULL,1,'MhPdT3ggPQOTk0acuActZQqdlI6tM',12,'2022-03-12 19:06:38','2022-03-20 07:06:38'),(13,11,'1','default','completed',1533.90,60.90,0.00,NULL,NULL,0.00,1473.00,1,NULL,1,'g7UCF2tBjEcMaZQ6xCnXX9usjs0o2',13,'2022-03-16 07:06:38','2022-03-20 07:06:38'),(14,9,'1','default','completed',304.50,14.50,0.00,NULL,NULL,0.00,290.00,1,NULL,1,'qneSli7OWXIK4AIuRtf9nH8gobJuv',14,'2022-03-15 15:06:38','2022-03-20 07:06:38'),(15,6,'1','default','pending',608.55,27.05,0.00,NULL,NULL,0.00,581.50,1,NULL,1,'PKY96P7lIrkkEobjI8D1BRkm4cNV0',15,'2022-03-16 19:06:38','2022-03-20 07:06:38'),(16,10,'1','default','pending',284.50,14.50,0.00,NULL,NULL,0.00,270.00,1,NULL,1,'jvCiC0rbDTetL7PcSPKyxbY8JGJcX',16,'2022-03-19 11:06:38','2022-03-20 07:06:38'),(17,6,'1','default','pending',1069.80,41.80,0.00,NULL,NULL,0.00,1028.00,1,NULL,1,'6NaoqrYjnArq8ZLhloIUM8NsGxZVf',17,'2022-03-18 07:06:38','2022-03-20 07:06:38'),(18,6,'1','default','completed',426.70,22.70,0.00,NULL,NULL,0.00,404.00,1,NULL,1,'w7vun6ejKV1mHpmMTlFCCDuB9qkCl',18,'2022-03-18 01:06:39','2022-03-20 07:06:39'),(19,3,'1','default','pending',518.83,19.33,0.00,NULL,NULL,0.00,499.50,1,NULL,1,'8WkvLmIvy5L8ie2WhmQA5rJFslMBf',19,'2022-03-19 19:06:39','2022-03-20 07:06:39'),(20,11,'1','default','pending',745.90,50.90,0.00,NULL,NULL,0.00,695.00,1,NULL,1,'aOuCOI5LssPhqcVBqf6JdCb6jVBsY',20,'2022-03-20 03:06:39','2022-03-20 07:06:39');
/*!40000 ALTER TABLE `ec_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attribute_sets`
--

DROP TABLE IF EXISTS `ec_product_attribute_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_product_attribute_sets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_layout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'swatch_dropdown',
  `is_searchable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `is_comparable` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `is_use_in_product_listing` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `use_image_from_product_variation` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attribute_sets`
--

LOCK TABLES `ec_product_attribute_sets` WRITE;
/*!40000 ALTER TABLE `ec_product_attribute_sets` DISABLE KEYS */;
INSERT INTO `ec_product_attribute_sets` VALUES (1,'Color','color','visual',1,1,1,'published',0,'2022-03-20 07:06:37','2022-03-20 07:06:37',1),(2,'Size','size','text',1,1,1,'published',1,'2022-03-20 07:06:37','2022-03-20 07:06:37',0);
/*!40000 ALTER TABLE `ec_product_attribute_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attribute_sets_translations`
--

DROP TABLE IF EXISTS `ec_product_attribute_sets_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_product_attribute_sets_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attribute_sets_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_attribute_sets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attribute_sets_translations`
--

LOCK TABLES `ec_product_attribute_sets_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_attribute_sets_translations` DISABLE KEYS */;
INSERT INTO `ec_product_attribute_sets_translations` VALUES ('vi',1,'Màu sắc'),('vi',2,'Kích thước');
/*!40000 ALTER TABLE `ec_product_attribute_sets_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attributes`
--

DROP TABLE IF EXISTS `ec_product_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_product_attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` int(10) unsigned NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `order` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attributes`
--

LOCK TABLES `ec_product_attributes` WRITE;
/*!40000 ALTER TABLE `ec_product_attributes` DISABLE KEYS */;
INSERT INTO `ec_product_attributes` VALUES (1,1,'Green','green','#5FB7D4',NULL,1,1,'published','2022-03-20 07:06:37','2022-03-20 07:06:37'),(2,1,'Blue','blue','#333333',NULL,0,2,'published','2022-03-20 07:06:37','2022-03-20 07:06:37'),(3,1,'Red','red','#DA323F',NULL,0,3,'published','2022-03-20 07:06:37','2022-03-20 07:06:37'),(4,1,'Black','back','#2F366C',NULL,0,4,'published','2022-03-20 07:06:37','2022-03-20 07:06:37'),(5,1,'Brown','brown','#87554B',NULL,0,5,'published','2022-03-20 07:06:37','2022-03-20 07:06:37'),(6,2,'S','s',NULL,NULL,1,1,'published','2022-03-20 07:06:37','2022-03-20 07:06:37'),(7,2,'M','m',NULL,NULL,0,2,'published','2022-03-20 07:06:37','2022-03-20 07:06:37'),(8,2,'L','l',NULL,NULL,0,3,'published','2022-03-20 07:06:37','2022-03-20 07:06:37'),(9,2,'XL','xl',NULL,NULL,0,4,'published','2022-03-20 07:06:37','2022-03-20 07:06:37'),(10,2,'XXL','xxl',NULL,NULL,0,5,'published','2022-03-20 07:06:37','2022-03-20 07:06:37');
/*!40000 ALTER TABLE `ec_product_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attributes_translations`
--

DROP TABLE IF EXISTS `ec_product_attributes_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_product_attributes_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attributes_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_attributes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attributes_translations`
--

LOCK TABLES `ec_product_attributes_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_attributes_translations` DISABLE KEYS */;
INSERT INTO `ec_product_attributes_translations` VALUES ('vi',1,'Xanh lá cây'),('vi',2,'Xanh da trời'),('vi',3,'Đỏ'),('vi',4,'Đen'),('vi',5,'Nâu'),('vi',6,'S'),('vi',7,'M'),('vi',8,'L'),('vi',9,'XL'),('vi',10,'XXL');
/*!40000 ALTER TABLE `ec_product_attributes_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categories`
--

DROP TABLE IF EXISTS `ec_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_product_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) unsigned DEFAULT 0,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int(10) unsigned NOT NULL DEFAULT 0,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categories`
--

LOCK TABLES `ec_product_categories` WRITE;
/*!40000 ALTER TABLE `ec_product_categories` DISABLE KEYS */;
INSERT INTO `ec_product_categories` VALUES (1,'Television',0,NULL,'published',0,'product-categories/p-1.png',1,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(2,'Home Audio & Theaters',1,NULL,'published',0,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(3,'TV & Videos',1,NULL,'published',1,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(4,'Camera, Photos & Videos',1,NULL,'published',2,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(5,'Cellphones & Accessories',1,NULL,'published',3,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(6,'Headphones',1,NULL,'published',4,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(7,'Videos games',1,NULL,'published',5,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(8,'Wireless Speakers',1,NULL,'published',6,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(9,'Office Electronic',1,NULL,'published',7,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(10,'Mobile',0,NULL,'published',1,'product-categories/p-2.png',1,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(11,'Digital Cables',10,NULL,'published',0,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(12,'Audio & Video Cables',10,NULL,'published',1,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(13,'Batteries',10,NULL,'published',2,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(14,'Headphone',0,NULL,'published',2,'product-categories/p-3.png',1,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(15,'Computer & Tablets',14,NULL,'published',0,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(16,'Laptop',14,NULL,'published',1,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(17,'Monitors',14,NULL,'published',2,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(18,'Computer Components',14,NULL,'published',3,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(19,'Watches',0,NULL,'published',3,'product-categories/p-4.png',1,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(20,'Drive & Storages',19,NULL,'published',0,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(21,'Gaming Laptop',19,NULL,'published',1,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(22,'Security & Protection',19,NULL,'published',2,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(23,'Accessories',19,NULL,'published',3,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(24,'Game',0,NULL,'published',4,'product-categories/p-5.png',1,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(25,'Camera',0,NULL,'published',5,'product-categories/p-6.png',1,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(26,'Audio',0,NULL,'published',6,'product-categories/p-7.png',1,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(27,'Mobile & Tablet',0,NULL,'published',7,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(28,'Accessories',0,NULL,'published',8,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(29,'Home Audio & Theater',0,NULL,'published',9,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(30,'Tv & Smart Box',0,NULL,'published',10,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(31,'Printer',0,NULL,'published',11,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(32,'Computer',0,NULL,'published',12,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(33,'Fax Machine',0,NULL,'published',13,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45'),(34,'Mouse',0,NULL,'published',14,NULL,0,'2022-01-03 21:20:45','2022-01-03 21:20:45');
/*!40000 ALTER TABLE `ec_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categories_translations`
--

DROP TABLE IF EXISTS `ec_product_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_product_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_categories_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categories_translations`
--

LOCK TABLES `ec_product_categories_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_categories_translations` DISABLE KEYS */;
INSERT INTO `ec_product_categories_translations` VALUES ('vi',1,'Tivi',NULL),('vi',2,'Home Audio & Theaters',NULL),('vi',3,'TV & Videos',NULL),('vi',4,'Camera, Photos & Videos',NULL),('vi',5,'Cellphones & Accessories',NULL),('vi',6,'Headphones',NULL),('vi',7,'Videos games',NULL),('vi',8,'Wireless Speakers',NULL),('vi',9,'Office Electronic',NULL),('vi',10,'Di động',NULL),('vi',11,'Digital Cables',NULL),('vi',12,'Audio & Video Cables',NULL),('vi',13,'Batteries',NULL),('vi',14,'Tai nghe',NULL),('vi',15,'Computer & Tablets',NULL),('vi',16,'Laptop',NULL),('vi',17,'Monitors',NULL),('vi',18,'Computer Components',NULL),('vi',19,'Đồng hồ',NULL),('vi',20,'Drive & Storages',NULL),('vi',21,'Gaming Laptop',NULL),('vi',22,'Security & Protection',NULL),('vi',23,'Accessories',NULL),('vi',24,'Trò chơi',NULL),('vi',25,'Máy ảnh',NULL),('vi',26,'Âm thanh',NULL),('vi',27,'Di động & Máy tính bảng',NULL),('vi',28,'Phụ kiện',NULL),('vi',29,'Âm thanh & hình ảnh',NULL),('vi',30,'Tv & Smart Box',NULL),('vi',31,'Máy in',NULL),('vi',32,'Máy tính',NULL),('vi',33,'Máy Fax',NULL),('vi',34,'Chuột máy tính',NULL);
/*!40000 ALTER TABLE `ec_product_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_category_product`
--

DROP TABLE IF EXISTS `ec_product_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_product_category_product` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_category_product_category_id_index` (`category_id`),
  KEY `ec_product_category_product_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_category_product`
--

LOCK TABLES `ec_product_category_product` WRITE;
/*!40000 ALTER TABLE `ec_product_category_product` DISABLE KEYS */;
INSERT INTO `ec_product_category_product` VALUES (1,4,1),(2,10,2),(3,6,3),(4,1,4),(5,2,5),(6,8,6),(7,1,7),(8,3,8),(9,6,9),(10,8,10),(11,7,11),(12,11,12),(13,8,13),(14,10,14),(15,6,15),(16,8,16),(17,7,17),(18,14,18),(19,6,19),(20,14,20),(21,8,21),(22,11,22),(23,12,23),(24,11,24),(25,2,25),(26,2,26),(27,14,27),(28,6,28),(29,3,29),(30,13,30),(31,14,31);
/*!40000 ALTER TABLE `ec_product_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collection_products`
--

DROP TABLE IF EXISTS `ec_product_collection_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_product_collection_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_collection_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_collection_products_product_collection_id_index` (`product_collection_id`),
  KEY `ec_product_collection_products_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collection_products`
--

LOCK TABLES `ec_product_collection_products` WRITE;
/*!40000 ALTER TABLE `ec_product_collection_products` DISABLE KEYS */;
INSERT INTO `ec_product_collection_products` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,1,5),(6,1,6),(7,2,7),(8,2,8),(9,3,9),(10,1,10),(11,1,11),(12,3,12),(13,2,13),(14,2,14),(15,3,15),(16,1,16),(17,1,17),(18,3,18),(19,2,19),(20,2,20),(21,2,21),(22,3,22),(23,3,23),(24,3,24),(25,1,25),(26,2,26),(27,2,27),(28,1,28),(29,1,29),(30,1,30),(31,3,31);
/*!40000 ALTER TABLE `ec_product_collection_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collections`
--

DROP TABLE IF EXISTS `ec_product_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_product_collections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collections`
--

LOCK TABLES `ec_product_collections` WRITE;
/*!40000 ALTER TABLE `ec_product_collections` DISABLE KEYS */;
INSERT INTO `ec_product_collections` VALUES (1,'New Arrival','new-arrival',NULL,NULL,'published','2022-01-03 21:20:45','2022-01-03 21:20:45',0),(2,'Best Sellers','best-sellers',NULL,NULL,'published','2022-01-03 21:20:45','2022-01-03 21:20:45',0),(3,'Special Offer','special-offer',NULL,NULL,'published','2022-01-03 21:20:45','2022-01-03 21:20:45',0);
/*!40000 ALTER TABLE `ec_product_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collections_translations`
--

DROP TABLE IF EXISTS `ec_product_collections_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_product_collections_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_collections_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_collections_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collections_translations`
--

LOCK TABLES `ec_product_collections_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_collections_translations` DISABLE KEYS */;
INSERT INTO `ec_product_collections_translations` VALUES ('vi',1,'Hàng mới về',NULL),('vi',2,'Bán chạy nhất',NULL),('vi',3,'Khuyến mãi đặc biệt',NULL);
/*!40000 ALTER TABLE `ec_product_collections_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_cross_sale_relations`
--

DROP TABLE IF EXISTS `ec_product_cross_sale_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_product_cross_sale_relations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_product_id` int(10) unsigned NOT NULL,
  `to_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_cross_sale_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_cross_sale_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_cross_sale_relations`
--

LOCK TABLES `ec_product_cross_sale_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_cross_sale_relations` DISABLE KEYS */;
INSERT INTO `ec_product_cross_sale_relations` VALUES (1,1,26),(2,1,23),(3,1,13),(4,1,17),(5,2,27),(6,2,18),(7,2,24),(8,2,3),(9,3,29),(10,3,15),(11,3,13),(12,3,6),(13,4,23),(14,4,16),(15,4,10),(16,4,5),(17,5,8),(18,5,27),(19,5,29),(20,5,3),(21,6,12),(22,6,25),(23,6,3),(24,6,28),(25,7,23),(26,7,22),(27,7,20),(28,8,28),(29,8,15),(30,8,23),(31,8,9),(32,9,11),(33,9,25),(34,9,30),(35,9,27),(36,10,29),(37,10,14),(38,10,30),(39,10,11),(40,11,7),(41,11,4),(42,11,1),(43,11,2),(44,12,22),(45,12,27),(46,12,13),(47,13,4),(48,13,9),(49,13,6),(50,13,22),(51,14,27),(52,14,16),(53,14,23),(54,15,18),(55,15,6),(56,15,19),(57,15,20),(58,16,15),(59,16,11),(60,16,30),(61,17,2),(62,17,29),(63,17,20),(64,17,3),(65,18,15),(66,18,9),(67,18,23),(68,18,5),(69,19,26),(70,19,6),(71,19,15),(72,20,24),(73,20,17),(74,20,19),(75,20,29),(76,21,1),(77,21,15),(78,21,31),(79,21,24),(80,22,5),(81,22,27),(82,22,2),(83,23,31),(84,23,5),(85,23,4),(86,23,20),(87,24,21),(88,24,18),(89,24,5),(90,24,15),(91,25,13),(92,25,9),(93,25,4),(94,25,22),(95,26,1),(96,26,2),(97,26,9),(98,26,24),(99,27,17),(100,27,9),(101,27,13),(102,27,7),(103,28,20),(104,28,5),(105,28,11),(106,28,6),(107,29,11),(108,29,7),(109,29,22),(110,29,19),(111,30,27),(112,30,10),(113,30,22),(114,30,20),(115,31,15),(116,31,21),(117,31,17),(118,31,3);
/*!40000 ALTER TABLE `ec_product_cross_sale_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_label_products`
--

DROP TABLE IF EXISTS `ec_product_label_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_product_label_products` (
  `product_label_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_label_id`,`product_id`),
  KEY `ec_product_label_products_product_label_id_index` (`product_label_id`),
  KEY `ec_product_label_products_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_label_products`
--

LOCK TABLES `ec_product_label_products` WRITE;
/*!40000 ALTER TABLE `ec_product_label_products` DISABLE KEYS */;
INSERT INTO `ec_product_label_products` VALUES (1,3),(1,15),(1,18),(1,21),(2,9),(2,27),(2,30),(3,6),(3,12),(3,24);
/*!40000 ALTER TABLE `ec_product_label_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_labels`
--

DROP TABLE IF EXISTS `ec_product_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_product_labels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_labels`
--

LOCK TABLES `ec_product_labels` WRITE;
/*!40000 ALTER TABLE `ec_product_labels` DISABLE KEYS */;
INSERT INTO `ec_product_labels` VALUES (1,'Hot','#ec2434','published','2022-01-03 21:20:45','2022-01-03 21:20:45'),(2,'New','#00c9a7','published','2022-01-03 21:20:45','2022-01-03 21:20:45'),(3,'Sale','#fe9931','published','2022-01-03 21:20:45','2022-01-03 21:20:45');
/*!40000 ALTER TABLE `ec_product_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_labels_translations`
--

DROP TABLE IF EXISTS `ec_product_labels_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_product_labels_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_labels_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_labels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_labels_translations`
--

LOCK TABLES `ec_product_labels_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_labels_translations` DISABLE KEYS */;
INSERT INTO `ec_product_labels_translations` VALUES ('vi',1,'Nổi bật',NULL),('vi',2,'Mới',NULL),('vi',3,'Giảm giá',NULL);
/*!40000 ALTER TABLE `ec_product_labels_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_related_relations`
--

DROP TABLE IF EXISTS `ec_product_related_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_product_related_relations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_product_id` int(10) unsigned NOT NULL,
  `to_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_related_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_related_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_related_relations`
--

LOCK TABLES `ec_product_related_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_related_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_related_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tag_product`
--

DROP TABLE IF EXISTS `ec_product_tag_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_product_tag_product` (
  `product_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`tag_id`),
  KEY `ec_product_tag_product_product_id_index` (`product_id`),
  KEY `ec_product_tag_product_tag_id_index` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tag_product`
--

LOCK TABLES `ec_product_tag_product` WRITE;
/*!40000 ALTER TABLE `ec_product_tag_product` DISABLE KEYS */;
INSERT INTO `ec_product_tag_product` VALUES (1,2),(1,3),(1,5),(2,2),(2,3),(2,5),(3,2),(3,3),(3,6),(4,1),(4,3),(4,6),(5,4),(5,5),(5,6),(6,1),(6,5),(6,6),(7,2),(7,4),(7,5),(8,2),(8,3),(9,2),(9,6),(10,1),(10,6),(11,1),(11,3),(11,6),(12,4),(12,6),(13,1),(13,2),(13,5),(14,2),(14,4),(15,1),(15,2),(15,3),(16,2),(16,4),(17,2),(18,4),(18,5),(19,3),(19,5),(19,6),(20,1),(20,2),(20,6),(21,2),(21,3),(22,4),(22,6),(23,2),(23,4),(24,1),(24,2),(24,4),(25,3),(25,4),(25,5),(26,1),(26,6),(27,3),(27,4),(28,1),(28,2),(28,5),(29,2),(29,4),(30,1),(30,4),(30,6),(31,1),(31,2),(31,5);
/*!40000 ALTER TABLE `ec_product_tag_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tags`
--

DROP TABLE IF EXISTS `ec_product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_product_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tags`
--

LOCK TABLES `ec_product_tags` WRITE;
/*!40000 ALTER TABLE `ec_product_tags` DISABLE KEYS */;
INSERT INTO `ec_product_tags` VALUES (1,'Electronic',NULL,'published','2022-01-03 21:21:14','2022-01-03 21:21:14'),(2,'Mobile',NULL,'published','2022-01-03 21:21:14','2022-01-03 21:21:14'),(3,'Iphone',NULL,'published','2022-01-03 21:21:14','2022-01-03 21:21:14'),(4,'Printer',NULL,'published','2022-01-03 21:21:14','2022-01-03 21:21:14'),(5,'Office',NULL,'published','2022-01-03 21:21:14','2022-01-03 21:21:14'),(6,'IT',NULL,'published','2022-01-03 21:21:14','2022-01-03 21:21:14');
/*!40000 ALTER TABLE `ec_product_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tags_translations`
--

DROP TABLE IF EXISTS `ec_product_tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_product_tags_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_tags_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tags_translations`
--

LOCK TABLES `ec_product_tags_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_up_sale_relations`
--

DROP TABLE IF EXISTS `ec_product_up_sale_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_product_up_sale_relations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_product_id` int(10) unsigned NOT NULL,
  `to_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_up_sale_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_up_sale_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_up_sale_relations`
--

LOCK TABLES `ec_product_up_sale_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_up_sale_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_up_sale_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_variation_items`
--

DROP TABLE IF EXISTS `ec_product_variation_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_product_variation_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `variation_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variation_items`
--

LOCK TABLES `ec_product_variation_items` WRITE;
/*!40000 ALTER TABLE `ec_product_variation_items` DISABLE KEYS */;
INSERT INTO `ec_product_variation_items` VALUES (1,3,1),(2,10,1),(3,5,2),(4,10,2),(5,4,3),(6,9,3),(7,4,4),(8,7,4),(9,4,5),(10,9,5),(11,5,6),(12,7,6),(13,4,7),(14,10,7),(15,2,8),(16,8,8),(17,2,9),(18,7,9),(19,1,10),(20,7,10),(21,4,11),(22,6,11),(23,4,12),(24,10,12),(25,2,13),(26,8,13),(27,3,14),(28,10,14),(29,4,15),(30,7,15),(31,4,16),(32,9,16),(33,3,17),(34,6,17),(35,1,18),(36,6,18),(37,5,19),(38,6,19),(39,1,20),(40,8,20),(41,3,21),(42,9,21),(43,3,22),(44,7,22),(45,4,23),(46,9,23),(47,3,24),(48,7,24),(49,4,25),(50,9,25),(51,2,26),(52,6,26),(53,2,27),(54,7,27),(55,1,28),(56,9,28),(57,4,29),(58,7,29),(59,5,30),(60,6,30),(61,3,31),(62,6,31),(63,1,32),(64,6,32),(65,4,33),(66,10,33),(67,5,34),(68,9,34),(69,1,35),(70,9,35),(71,2,36),(72,10,36),(73,2,37),(74,6,37),(75,2,38),(76,8,38),(77,4,39),(78,9,39),(79,3,40),(80,6,40),(81,3,41),(82,7,41),(83,3,42),(84,8,42),(85,1,43),(86,10,43),(87,5,44),(88,6,44),(89,2,45),(90,10,45),(91,4,46),(92,9,46),(93,5,47),(94,10,47),(95,4,48),(96,8,48),(97,2,49),(98,8,49),(99,5,50),(100,7,50),(101,3,51),(102,7,51),(103,5,52),(104,8,52),(105,4,53),(106,8,53),(107,2,54),(108,7,54),(109,4,55),(110,6,55),(111,3,56),(112,6,56),(113,2,57),(114,10,57),(115,5,58),(116,6,58),(117,5,59),(118,8,59),(119,3,60),(120,8,60),(121,1,61),(122,10,61),(123,2,62),(124,9,62),(125,4,63),(126,7,63),(127,1,64),(128,7,64),(129,4,65),(130,10,65),(131,3,66),(132,10,66),(133,4,67),(134,7,67),(135,2,68),(136,8,68),(137,4,69),(138,6,69),(139,3,70),(140,8,70),(141,3,71),(142,10,71),(143,1,72),(144,7,72),(145,2,73),(146,6,73),(147,5,74),(148,8,74),(149,2,75),(150,9,75),(151,5,76),(152,8,76),(153,1,77),(154,8,77),(155,2,78),(156,8,78),(157,4,79),(158,8,79);
/*!40000 ALTER TABLE `ec_product_variation_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_variations`
--

DROP TABLE IF EXISTS `ec_product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_product_variations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned DEFAULT NULL,
  `configurable_product_id` int(10) unsigned NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variations`
--

LOCK TABLES `ec_product_variations` WRITE;
/*!40000 ALTER TABLE `ec_product_variations` DISABLE KEYS */;
INSERT INTO `ec_product_variations` VALUES (1,32,1,1),(2,33,1,0),(3,34,2,1),(4,35,2,0),(5,36,2,0),(6,37,3,1),(7,38,3,0),(8,39,4,1),(9,40,4,0),(10,41,5,1),(11,42,6,1),(12,43,6,0),(13,44,6,0),(14,45,7,1),(15,46,7,0),(16,47,8,1),(17,48,8,0),(18,49,9,1),(19,50,10,1),(20,51,10,0),(21,52,10,0),(22,53,11,1),(23,54,11,0),(24,55,11,0),(25,56,12,1),(26,57,13,1),(27,58,13,0),(28,59,13,0),(29,60,14,1),(30,61,14,0),(31,62,14,0),(32,63,14,0),(33,64,15,1),(34,65,16,1),(35,66,16,0),(36,67,16,0),(37,68,17,1),(38,69,17,0),(39,70,17,0),(40,71,18,1),(41,72,18,0),(42,73,19,1),(43,74,19,0),(44,75,19,0),(45,76,19,0),(46,77,20,1),(47,78,20,0),(48,79,20,0),(49,80,21,1),(50,81,22,1),(51,82,22,0),(52,83,22,0),(53,84,22,0),(54,85,22,0),(55,86,23,1),(56,87,23,0),(57,88,24,1),(58,89,24,0),(59,90,24,0),(60,91,24,0),(61,92,25,1),(62,93,26,1),(63,94,26,0),(64,95,26,0),(65,96,26,0),(66,97,27,1),(67,98,27,0),(68,99,27,0),(69,100,27,0),(70,101,28,1),(71,102,28,0),(72,103,28,0),(73,104,28,0),(74,105,28,0),(75,106,29,1),(76,107,30,1),(77,108,30,0),(78,109,31,1),(79,110,31,0);
/*!40000 ALTER TABLE `ec_product_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_with_attribute`
--

DROP TABLE IF EXISTS `ec_product_with_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_product_with_attribute` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_with_attribute`
--

LOCK TABLES `ec_product_with_attribute` WRITE;
/*!40000 ALTER TABLE `ec_product_with_attribute` DISABLE KEYS */;
INSERT INTO `ec_product_with_attribute` VALUES (1,5,1),(2,8,1),(3,5,2),(4,6,2),(5,1,3),(6,7,3),(7,1,4),(8,6,4),(9,4,5),(10,10,5),(11,5,6),(12,7,6),(13,2,7),(14,8,7),(15,1,8),(16,6,8),(17,3,9),(18,6,9),(19,2,10),(20,9,10),(21,4,11),(22,7,11),(23,5,12),(24,10,12),(25,1,13),(26,10,13),(27,3,14),(28,6,14),(29,1,15),(30,9,15),(31,3,16),(32,7,16),(33,1,17),(34,7,17),(35,5,18),(36,6,18),(37,2,19),(38,7,19),(39,3,20),(40,7,20),(41,1,21),(42,6,21),(43,1,22),(44,7,22),(45,2,23),(46,6,23),(47,3,24),(48,10,24),(49,4,25),(50,6,25),(51,2,26),(52,6,26),(53,1,27),(54,9,27),(55,2,28),(56,6,28),(57,5,29),(58,6,29),(59,2,30),(60,9,30),(61,5,31),(62,6,31);
/*!40000 ALTER TABLE `ec_product_with_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_with_attribute_set`
--

DROP TABLE IF EXISTS `ec_product_with_attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_product_with_attribute_set` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `order` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_with_attribute_set`
--

LOCK TABLES `ec_product_with_attribute_set` WRITE;
/*!40000 ALTER TABLE `ec_product_with_attribute_set` DISABLE KEYS */;
INSERT INTO `ec_product_with_attribute_set` VALUES (1,1,1,0),(2,2,1,0),(3,1,2,0),(4,2,2,0),(5,1,3,0),(6,2,3,0),(7,1,4,0),(8,2,4,0),(9,1,5,0),(10,2,5,0),(11,1,6,0),(12,2,6,0),(13,1,7,0),(14,2,7,0),(15,1,8,0),(16,2,8,0),(17,1,9,0),(18,2,9,0),(19,1,10,0),(20,2,10,0),(21,1,11,0),(22,2,11,0),(23,1,12,0),(24,2,12,0),(25,1,13,0),(26,2,13,0),(27,1,14,0),(28,2,14,0),(29,1,15,0),(30,2,15,0),(31,1,16,0),(32,2,16,0),(33,1,17,0),(34,2,17,0),(35,1,18,0),(36,2,18,0),(37,1,19,0),(38,2,19,0),(39,1,20,0),(40,2,20,0),(41,1,21,0),(42,2,21,0),(43,1,22,0),(44,2,22,0),(45,1,23,0),(46,2,23,0),(47,1,24,0),(48,2,24,0),(49,1,25,0),(50,2,25,0),(51,1,26,0),(52,2,26,0),(53,1,27,0),(54,2,27,0),(55,1,28,0),(56,2,28,0),(57,1,29,0),(58,2,29,0),(59,1,30,0),(60,2,30,0),(61,1,31,0),(62,2,31,0);
/*!40000 ALTER TABLE `ec_product_with_attribute_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_products`
--

DROP TABLE IF EXISTS `ec_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT 0,
  `quantity` int(10) unsigned DEFAULT NULL,
  `allow_checkout_when_out_of_stock` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `with_storehouse_management` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `is_featured` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `brand_id` int(10) unsigned DEFAULT NULL,
  `is_variation` tinyint(4) NOT NULL DEFAULT 0,
  `sale_type` tinyint(4) NOT NULL DEFAULT 0,
  `price` double unsigned DEFAULT NULL,
  `sale_price` double unsigned DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `length` double(8,2) DEFAULT NULL,
  `wide` double(8,2) DEFAULT NULL,
  `height` double(8,2) DEFAULT NULL,
  `weight` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tax_id` int(10) unsigned DEFAULT NULL,
  `views` bigint(20) NOT NULL DEFAULT 0,
  `stock_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'in_stock',
  `created_by_id` int(11) DEFAULT 0,
  `created_by_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products`
--

LOCK TABLES `ec_products` WRITE;
/*!40000 ALTER TABLE `ec_products` DISABLE KEYS */;
INSERT INTO `ec_products` VALUES (1,'Smart Home Speaker','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/1.jpg\",\"products\\/1-1.jpg\",\"products\\/1-2.jpg\",\"products\\/1-3.jpg\"]','HS-132-A0',0,18,0,1,1,7,0,0,406,NULL,NULL,NULL,12.00,15.00,14.00,555.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,8853,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(2,'Headphone Ultra Bass','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/2.jpg\",\"products\\/2-1.jpg\",\"products\\/2-2.jpg\",\"products\\/2-3.jpg\"]','HS-148-A0',0,20,0,1,1,1,0,0,368,NULL,NULL,NULL,10.00,12.00,16.00,734.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,186325,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(3,'Boxed - Bluetooth Headphone','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/3.jpg\",\"products\\/3-1.jpg\",\"products\\/3-2.jpg\",\"products\\/3-3.jpg\"]','HS-186-A0',0,15,0,1,1,4,0,0,309,NULL,NULL,NULL,20.00,16.00,19.00,882.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,122138,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(4,'Chikie - Bluetooth Speaker','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/4.jpg\",\"products\\/4-1.jpg\",\"products\\/4-2.jpg\",\"products\\/4-3.jpg\"]','HS-145-A0',0,16,0,1,1,5,0,0,83,63.08,NULL,NULL,11.00,18.00,19.00,629.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,179671,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(5,'Camera Hikvision HK-35VS8','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/5.jpg\",\"products\\/5-1.jpg\",\"products\\/5-2.jpg\",\"products\\/5-3.jpg\"]','HS-147-A0',0,15,0,1,1,3,0,0,44,NULL,NULL,NULL,20.00,13.00,13.00,729.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,119452,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(6,'Camera Samsung SS-24','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/6.jpg\",\"products\\/6-1.jpg\"]','HS-114-A0',0,16,0,1,1,5,0,0,53,NULL,NULL,NULL,18.00,19.00,10.00,580.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,180581,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(7,'Leather Watch Band','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/7.jpg\",\"products\\/7-1.jpg\"]','HS-190-A0',0,15,0,1,1,2,0,0,120,NULL,NULL,NULL,18.00,20.00,17.00,516.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,100545,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(8,'Apple iPhone 13 Plus','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/8.jpg\",\"products\\/8-1.jpg\"]','HS-195-A0',0,15,0,1,1,4,0,0,124,100.44,NULL,NULL,14.00,20.00,12.00,503.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,168923,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(9,'Macbook Pro 2015','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/9.jpg\",\"products\\/9-1.jpg\"]','HS-196-A0',0,14,0,1,1,5,0,0,115,NULL,NULL,NULL,16.00,11.00,16.00,801.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,86583,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(10,'Macbook Air 12 inch','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/10.jpg\",\"products\\/10-1.jpg\"]','HS-118-A0',0,16,0,1,1,6,0,0,374,NULL,NULL,NULL,16.00,14.00,19.00,778.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,158702,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(11,'Apple Watch Serial 7','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/11.jpg\",\"products\\/11-1.jpg\"]','HS-167-A0',0,20,0,1,1,5,0,0,125,NULL,NULL,NULL,15.00,18.00,10.00,774.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,28019,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(12,'Macbook Pro 13 inch','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/12.jpg\",\"products\\/12-1.jpg\"]','HS-153-A0',0,14,0,1,1,5,0,0,130,101.4,NULL,NULL,14.00,12.00,19.00,589.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,71010,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(13,'Apple Keyboard','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/13.jpg\",\"products\\/13-1.jpg\"]','HS-129-A0',0,12,0,1,1,2,0,0,125,NULL,NULL,NULL,16.00,19.00,13.00,510.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,5317,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(14,'MacSafe 80W','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/14.jpg\",\"products\\/14-1.jpg\"]','HS-111-A0',0,18,0,1,1,3,0,0,113,NULL,NULL,NULL,10.00,15.00,15.00,747.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,26817,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(15,'Hand playstation','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/15.jpg\",\"products\\/15-1.jpg\"]','HS-181-A0',0,10,0,1,1,2,0,0,113,NULL,NULL,NULL,15.00,17.00,19.00,615.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,134245,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(16,'Apple Airpods Serial 3','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/16.jpg\"]','HS-176-A0',0,15,0,1,1,6,0,0,112,97.44,NULL,NULL,19.00,16.00,20.00,782.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,154223,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(17,'Cool Smart Watches','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/17.jpg\"]','HS-120-A0',0,12,0,1,1,4,0,0,113,NULL,NULL,NULL,13.00,19.00,10.00,594.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,94757,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(18,'Black Smart Watches','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/18.jpg\",\"products\\/18-1.jpg\",\"products\\/18-2.jpg\"]','HS-101-A0',0,15,0,1,1,4,0,0,118,NULL,NULL,NULL,12.00,15.00,18.00,696.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,101022,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(19,'Leather Watch Band Serial 3','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/19.jpg\",\"products\\/19-1.jpg\"]','HS-163-A0',0,20,0,1,1,5,0,0,113,NULL,NULL,NULL,15.00,14.00,11.00,519.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,41006,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(20,'Macbook Pro 2015 13 inch','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/20.jpg\",\"products\\/20-1.jpg\"]','HS-188-A0',0,14,0,1,1,6,0,0,128,112.64,NULL,NULL,12.00,10.00,20.00,879.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,138792,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(21,'Historic Alarm Clock','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/21.jpg\",\"products\\/21-1.jpg\"]','HS-141-A0',0,10,0,1,1,2,0,0,119,NULL,NULL,NULL,12.00,14.00,11.00,663.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,65153,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(22,'Black Glasses','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/22.jpg\",\"products\\/22-1.jpg\"]','HS-129-A0',0,17,0,1,1,5,0,0,115,NULL,NULL,NULL,11.00,10.00,17.00,847.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,56654,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(23,'Phillips Mouse','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/23.jpg\",\"products\\/23-1.jpg\"]','HS-142-A0',0,19,0,1,1,4,0,0,121,NULL,NULL,NULL,14.00,12.00,12.00,793.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,166676,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(24,'Gaming Keyboard','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/24.jpg\",\"products\\/24-1.jpg\"]','HS-147-A0',0,19,0,1,1,5,0,0,111,96.57,NULL,NULL,11.00,13.00,10.00,699.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,4928,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(25,'Dual Camera 20MP','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/25.jpg\",\"products\\/25-1.jpg\"]','HS-192-A0',0,20,0,1,0,1,0,0,80.25,NULL,NULL,NULL,12.00,15.00,12.00,853.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,30390,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(26,'Smart Watches','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/26.jpg\",\"products\\/26-1.jpg\",\"products\\/26-2.jpg\"]','HS-104-A0',0,19,0,1,0,3,0,0,40.5,NULL,NULL,NULL,15.00,12.00,12.00,827.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,54682,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(27,'Beat Headphone','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/27.jpg\",\"products\\/27-1.jpg\"]','HS-124-A0',0,20,0,1,0,4,0,0,20,NULL,NULL,NULL,16.00,17.00,12.00,747.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,45739,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(28,'Red & Black Headphone','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/28.jpg\",\"products\\/28-1.jpg\"]','HS-194-A0',0,16,0,1,0,1,0,0,50,37,NULL,NULL,18.00,19.00,19.00,805.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,39741,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(29,'Audio Equipment','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/29.jpg\",\"products\\/29-1.jpg\"]','HS-154-A0',0,19,0,1,0,3,0,0,51,NULL,NULL,NULL,20.00,13.00,12.00,555.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,185126,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(30,'Smart Televisions','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/30.jpg\",\"products\\/30-1.jpg\"]','HS-156-A0',0,18,0,1,0,7,0,0,128,NULL,NULL,NULL,15.00,19.00,17.00,703.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,94180,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(31,'Samsung Smart TV','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/31.jpg\",\"products\\/31-1.jpg\"]','HS-168-A0',0,18,0,1,0,1,0,0,50,NULL,NULL,NULL,19.00,18.00,13.00,711.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',1,173800,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(32,'Smart Home Speaker',NULL,NULL,'published','[\"products\\/1.jpg\"]','HS-132-A0',0,18,0,1,0,7,1,0,406,NULL,NULL,NULL,12.00,15.00,14.00,555.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(33,'Smart Home Speaker',NULL,NULL,'published','[\"products\\/1-1.jpg\"]','HS-132-A0-A1',0,18,0,1,0,7,1,0,406,NULL,NULL,NULL,12.00,15.00,14.00,555.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(34,'Headphone Ultra Bass',NULL,NULL,'published','[\"products\\/2.jpg\"]','HS-148-A0',0,20,0,1,0,1,1,0,368,NULL,NULL,NULL,10.00,12.00,16.00,734.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(35,'Headphone Ultra Bass',NULL,NULL,'published','[\"products\\/2-1.jpg\"]','HS-148-A0-A1',0,20,0,1,0,1,1,0,368,NULL,NULL,NULL,10.00,12.00,16.00,734.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(36,'Headphone Ultra Bass',NULL,NULL,'published','[\"products\\/2-2.jpg\"]','HS-148-A0-A2',0,20,0,1,0,1,1,0,368,NULL,NULL,NULL,10.00,12.00,16.00,734.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(37,'Boxed - Bluetooth Headphone',NULL,NULL,'published','[\"products\\/3.jpg\"]','HS-186-A0',0,15,0,1,0,4,1,0,309,NULL,NULL,NULL,20.00,16.00,19.00,882.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(38,'Boxed - Bluetooth Headphone',NULL,NULL,'published','[\"products\\/3-1.jpg\"]','HS-186-A0-A1',0,15,0,1,0,4,1,0,309,NULL,NULL,NULL,20.00,16.00,19.00,882.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(39,'Chikie - Bluetooth Speaker',NULL,NULL,'published','[\"products\\/4.jpg\"]','HS-145-A0',0,16,0,1,0,5,1,0,83,63.08,NULL,NULL,11.00,18.00,19.00,629.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(40,'Chikie - Bluetooth Speaker',NULL,NULL,'published','[\"products\\/4-1.jpg\"]','HS-145-A0-A1',0,16,0,1,0,5,1,0,83,61.42,NULL,NULL,11.00,18.00,19.00,629.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(41,'Camera Hikvision HK-35VS8',NULL,NULL,'published','[\"products\\/5.jpg\"]','HS-147-A0',0,15,0,1,0,3,1,0,44,NULL,NULL,NULL,20.00,13.00,13.00,729.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(42,'Camera Samsung SS-24',NULL,NULL,'published','[\"products\\/6.jpg\"]','HS-114-A0',0,16,0,1,0,5,1,0,53,NULL,NULL,NULL,18.00,19.00,10.00,580.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(43,'Camera Samsung SS-24',NULL,NULL,'published','[\"products\\/6-1.jpg\"]','HS-114-A0-A1',0,16,0,1,0,5,1,0,53,NULL,NULL,NULL,18.00,19.00,10.00,580.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(44,'Camera Samsung SS-24',NULL,NULL,'published','[\"products\\/6.jpg\"]','HS-114-A0-A2',0,16,0,1,0,5,1,0,53,NULL,NULL,NULL,18.00,19.00,10.00,580.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(45,'Leather Watch Band',NULL,NULL,'published','[\"products\\/7.jpg\"]','HS-190-A0',0,15,0,1,0,2,1,0,120,NULL,NULL,NULL,18.00,20.00,17.00,516.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(46,'Leather Watch Band',NULL,NULL,'published','[\"products\\/7-1.jpg\"]','HS-190-A0-A1',0,15,0,1,0,2,1,0,120,NULL,NULL,NULL,18.00,20.00,17.00,516.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(47,'Apple iPhone 13 Plus',NULL,NULL,'published','[\"products\\/8.jpg\"]','HS-195-A0',0,15,0,1,0,4,1,0,124,100.44,NULL,NULL,14.00,20.00,12.00,503.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(48,'Apple iPhone 13 Plus',NULL,NULL,'published','[\"products\\/8-1.jpg\"]','HS-195-A0-A1',0,15,0,1,0,4,1,0,124,111.6,NULL,NULL,14.00,20.00,12.00,503.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(49,'Macbook Pro 2015',NULL,NULL,'published','[\"products\\/9.jpg\"]','HS-196-A0',0,14,0,1,0,5,1,0,115,NULL,NULL,NULL,16.00,11.00,16.00,801.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(50,'Macbook Air 12 inch',NULL,NULL,'published','[\"products\\/10.jpg\"]','HS-118-A0',0,16,0,1,0,6,1,0,374,NULL,NULL,NULL,16.00,14.00,19.00,778.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(51,'Macbook Air 12 inch',NULL,NULL,'published','[\"products\\/10-1.jpg\"]','HS-118-A0-A1',0,16,0,1,0,6,1,0,374,NULL,NULL,NULL,16.00,14.00,19.00,778.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(52,'Macbook Air 12 inch',NULL,NULL,'published','[\"products\\/10.jpg\"]','HS-118-A0-A2',0,16,0,1,0,6,1,0,374,NULL,NULL,NULL,16.00,14.00,19.00,778.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(53,'Apple Watch Serial 7',NULL,NULL,'published','[\"products\\/11.jpg\"]','HS-167-A0',0,20,0,1,0,5,1,0,125,NULL,NULL,NULL,15.00,18.00,10.00,774.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(54,'Apple Watch Serial 7',NULL,NULL,'published','[\"products\\/11-1.jpg\"]','HS-167-A0-A1',0,20,0,1,0,5,1,0,125,NULL,NULL,NULL,15.00,18.00,10.00,774.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(55,'Apple Watch Serial 7',NULL,NULL,'published','[\"products\\/11.jpg\"]','HS-167-A0-A2',0,20,0,1,0,5,1,0,125,NULL,NULL,NULL,15.00,18.00,10.00,774.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(56,'Macbook Pro 13 inch',NULL,NULL,'published','[\"products\\/12.jpg\"]','HS-153-A0',0,14,0,1,0,5,1,0,130,101.4,NULL,NULL,14.00,12.00,19.00,589.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(57,'Apple Keyboard',NULL,NULL,'published','[\"products\\/13.jpg\"]','HS-129-A0',0,12,0,1,0,2,1,0,125,NULL,NULL,NULL,16.00,19.00,13.00,510.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(58,'Apple Keyboard',NULL,NULL,'published','[\"products\\/13-1.jpg\"]','HS-129-A0-A1',0,12,0,1,0,2,1,0,125,NULL,NULL,NULL,16.00,19.00,13.00,510.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(59,'Apple Keyboard',NULL,NULL,'published','[\"products\\/13.jpg\"]','HS-129-A0-A2',0,12,0,1,0,2,1,0,125,NULL,NULL,NULL,16.00,19.00,13.00,510.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(60,'MacSafe 80W',NULL,NULL,'published','[\"products\\/14.jpg\"]','HS-111-A0',0,18,0,1,0,3,1,0,113,NULL,NULL,NULL,10.00,15.00,15.00,747.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(61,'MacSafe 80W',NULL,NULL,'published','[\"products\\/14-1.jpg\"]','HS-111-A0-A1',0,18,0,1,0,3,1,0,113,NULL,NULL,NULL,10.00,15.00,15.00,747.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(62,'MacSafe 80W',NULL,NULL,'published','[\"products\\/14.jpg\"]','HS-111-A0-A2',0,18,0,1,0,3,1,0,113,NULL,NULL,NULL,10.00,15.00,15.00,747.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(63,'MacSafe 80W',NULL,NULL,'published','[\"products\\/14.jpg\"]','HS-111-A0-A3',0,18,0,1,0,3,1,0,113,NULL,NULL,NULL,10.00,15.00,15.00,747.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(64,'Hand playstation',NULL,NULL,'published','[\"products\\/15.jpg\"]','HS-181-A0',0,10,0,1,0,2,1,0,113,NULL,NULL,NULL,15.00,17.00,19.00,615.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(65,'Apple Airpods Serial 3',NULL,NULL,'published','[\"products\\/16.jpg\"]','HS-176-A0',0,15,0,1,0,6,1,0,112,97.44,NULL,NULL,19.00,16.00,20.00,782.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(66,'Apple Airpods Serial 3',NULL,NULL,'published','[\"products\\/16.jpg\"]','HS-176-A0-A1',0,15,0,1,0,6,1,0,112,85.12,NULL,NULL,19.00,16.00,20.00,782.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(67,'Apple Airpods Serial 3',NULL,NULL,'published','[\"products\\/16.jpg\"]','HS-176-A0-A2',0,15,0,1,0,6,1,0,112,89.6,NULL,NULL,19.00,16.00,20.00,782.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(68,'Cool Smart Watches',NULL,NULL,'published','[\"products\\/17.jpg\"]','HS-120-A0',0,12,0,1,0,4,1,0,113,NULL,NULL,NULL,13.00,19.00,10.00,594.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(69,'Cool Smart Watches',NULL,NULL,'published','[\"products\\/17.jpg\"]','HS-120-A0-A1',0,12,0,1,0,4,1,0,113,NULL,NULL,NULL,13.00,19.00,10.00,594.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(70,'Cool Smart Watches',NULL,NULL,'published','[\"products\\/17.jpg\"]','HS-120-A0-A2',0,12,0,1,0,4,1,0,113,NULL,NULL,NULL,13.00,19.00,10.00,594.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(71,'Black Smart Watches',NULL,NULL,'published','[\"products\\/18.jpg\"]','HS-101-A0',0,15,0,1,0,4,1,0,118,NULL,NULL,NULL,12.00,15.00,18.00,696.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(72,'Black Smart Watches',NULL,NULL,'published','[\"products\\/18-1.jpg\"]','HS-101-A0-A1',0,15,0,1,0,4,1,0,118,NULL,NULL,NULL,12.00,15.00,18.00,696.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(73,'Leather Watch Band Serial 3',NULL,NULL,'published','[\"products\\/19.jpg\"]','HS-163-A0',0,20,0,1,0,5,1,0,113,NULL,NULL,NULL,15.00,14.00,11.00,519.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(74,'Leather Watch Band Serial 3',NULL,NULL,'published','[\"products\\/19-1.jpg\"]','HS-163-A0-A1',0,20,0,1,0,5,1,0,113,NULL,NULL,NULL,15.00,14.00,11.00,519.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(75,'Leather Watch Band Serial 3',NULL,NULL,'published','[\"products\\/19.jpg\"]','HS-163-A0-A2',0,20,0,1,0,5,1,0,113,NULL,NULL,NULL,15.00,14.00,11.00,519.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(76,'Leather Watch Band Serial 3',NULL,NULL,'published','[\"products\\/19.jpg\"]','HS-163-A0-A3',0,20,0,1,0,5,1,0,113,NULL,NULL,NULL,15.00,14.00,11.00,519.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(77,'Macbook Pro 2015 13 inch',NULL,NULL,'published','[\"products\\/20.jpg\"]','HS-188-A0',0,14,0,1,0,6,1,0,128,112.64,NULL,NULL,12.00,10.00,20.00,879.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(78,'Macbook Pro 2015 13 inch',NULL,NULL,'published','[\"products\\/20-1.jpg\"]','HS-188-A0-A1',0,14,0,1,0,6,1,0,128,106.24,NULL,NULL,12.00,10.00,20.00,879.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(79,'Macbook Pro 2015 13 inch',NULL,NULL,'published','[\"products\\/20.jpg\"]','HS-188-A0-A2',0,14,0,1,0,6,1,0,128,115.2,NULL,NULL,12.00,10.00,20.00,879.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(80,'Historic Alarm Clock',NULL,NULL,'published','[\"products\\/21.jpg\"]','HS-141-A0',0,10,0,1,0,2,1,0,119,NULL,NULL,NULL,12.00,14.00,11.00,663.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(81,'Black Glasses',NULL,NULL,'published','[\"products\\/22.jpg\"]','HS-129-A0',0,17,0,1,0,5,1,0,115,NULL,NULL,NULL,11.00,10.00,17.00,847.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(82,'Black Glasses',NULL,NULL,'published','[\"products\\/22-1.jpg\"]','HS-129-A0-A1',0,17,0,1,0,5,1,0,115,NULL,NULL,NULL,11.00,10.00,17.00,847.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(83,'Black Glasses',NULL,NULL,'published','[\"products\\/22.jpg\"]','HS-129-A0-A2',0,17,0,1,0,5,1,0,115,NULL,NULL,NULL,11.00,10.00,17.00,847.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(84,'Black Glasses',NULL,NULL,'published','[\"products\\/22.jpg\"]','HS-129-A0-A3',0,17,0,1,0,5,1,0,115,NULL,NULL,NULL,11.00,10.00,17.00,847.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(85,'Black Glasses',NULL,NULL,'published','[\"products\\/22.jpg\"]','HS-129-A0-A4',0,17,0,1,0,5,1,0,115,NULL,NULL,NULL,11.00,10.00,17.00,847.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(86,'Phillips Mouse',NULL,NULL,'published','[\"products\\/23.jpg\"]','HS-142-A0',0,19,0,1,0,4,1,0,121,NULL,NULL,NULL,14.00,12.00,12.00,793.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(87,'Phillips Mouse',NULL,NULL,'published','[\"products\\/23-1.jpg\"]','HS-142-A0-A1',0,19,0,1,0,4,1,0,121,NULL,NULL,NULL,14.00,12.00,12.00,793.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(88,'Gaming Keyboard',NULL,NULL,'published','[\"products\\/24.jpg\"]','HS-147-A0',0,19,0,1,0,5,1,0,111,96.57,NULL,NULL,11.00,13.00,10.00,699.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(89,'Gaming Keyboard',NULL,NULL,'published','[\"products\\/24-1.jpg\"]','HS-147-A0-A1',0,19,0,1,0,5,1,0,111,81.03,NULL,NULL,11.00,13.00,10.00,699.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(90,'Gaming Keyboard',NULL,NULL,'published','[\"products\\/24.jpg\"]','HS-147-A0-A2',0,19,0,1,0,5,1,0,111,81.03,NULL,NULL,11.00,13.00,10.00,699.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(91,'Gaming Keyboard',NULL,NULL,'published','[\"products\\/24.jpg\"]','HS-147-A0-A3',0,19,0,1,0,5,1,0,111,77.7,NULL,NULL,11.00,13.00,10.00,699.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(92,'Dual Camera 20MP',NULL,NULL,'published','[\"products\\/25.jpg\"]','HS-192-A0',0,20,0,1,0,1,1,0,80.25,NULL,NULL,NULL,12.00,15.00,12.00,853.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(93,'Smart Watches',NULL,NULL,'published','[\"products\\/26.jpg\"]','HS-104-A0',0,19,0,1,0,3,1,0,40.5,NULL,NULL,NULL,15.00,12.00,12.00,827.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(94,'Smart Watches',NULL,NULL,'published','[\"products\\/26-1.jpg\"]','HS-104-A0-A1',0,19,0,1,0,3,1,0,40.5,NULL,NULL,NULL,15.00,12.00,12.00,827.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(95,'Smart Watches',NULL,NULL,'published','[\"products\\/26-2.jpg\"]','HS-104-A0-A2',0,19,0,1,0,3,1,0,40.5,NULL,NULL,NULL,15.00,12.00,12.00,827.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(96,'Smart Watches',NULL,NULL,'published','[\"products\\/26.jpg\"]','HS-104-A0-A3',0,19,0,1,0,3,1,0,40.5,NULL,NULL,NULL,15.00,12.00,12.00,827.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(97,'Beat Headphone',NULL,NULL,'published','[\"products\\/27.jpg\"]','HS-124-A0',0,20,0,1,0,4,1,0,20,NULL,NULL,NULL,16.00,17.00,12.00,747.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(98,'Beat Headphone',NULL,NULL,'published','[\"products\\/27-1.jpg\"]','HS-124-A0-A1',0,20,0,1,0,4,1,0,20,NULL,NULL,NULL,16.00,17.00,12.00,747.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(99,'Beat Headphone',NULL,NULL,'published','[\"products\\/27.jpg\"]','HS-124-A0-A2',0,20,0,1,0,4,1,0,20,NULL,NULL,NULL,16.00,17.00,12.00,747.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(100,'Beat Headphone',NULL,NULL,'published','[\"products\\/27.jpg\"]','HS-124-A0-A3',0,20,0,1,0,4,1,0,20,NULL,NULL,NULL,16.00,17.00,12.00,747.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(101,'Red & Black Headphone',NULL,NULL,'published','[\"products\\/28.jpg\"]','HS-194-A0',0,16,0,1,0,1,1,0,50,37,NULL,NULL,18.00,19.00,19.00,805.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(102,'Red & Black Headphone',NULL,NULL,'published','[\"products\\/28-1.jpg\"]','HS-194-A0-A1',0,16,0,1,0,1,1,0,50,45,NULL,NULL,18.00,19.00,19.00,805.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(103,'Red & Black Headphone',NULL,NULL,'published','[\"products\\/28.jpg\"]','HS-194-A0-A2',0,16,0,1,0,1,1,0,50,36,NULL,NULL,18.00,19.00,19.00,805.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(104,'Red & Black Headphone',NULL,NULL,'published','[\"products\\/28.jpg\"]','HS-194-A0-A3',0,16,0,1,0,1,1,0,50,43.5,NULL,NULL,18.00,19.00,19.00,805.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(105,'Red & Black Headphone',NULL,NULL,'published','[\"products\\/28.jpg\"]','HS-194-A0-A4',0,16,0,1,0,1,1,0,50,38.5,NULL,NULL,18.00,19.00,19.00,805.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(106,'Audio Equipment',NULL,NULL,'published','[\"products\\/29.jpg\"]','HS-154-A0',0,19,0,1,0,3,1,0,51,NULL,NULL,NULL,20.00,13.00,12.00,555.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(107,'Smart Televisions',NULL,NULL,'published','[\"products\\/30.jpg\"]','HS-156-A0',0,18,0,1,0,7,1,0,128,NULL,NULL,NULL,15.00,19.00,17.00,703.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(108,'Smart Televisions',NULL,NULL,'published','[\"products\\/30-1.jpg\"]','HS-156-A0-A1',0,18,0,1,0,7,1,0,128,NULL,NULL,NULL,15.00,19.00,17.00,703.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(109,'Samsung Smart TV',NULL,NULL,'published','[\"products\\/31.jpg\"]','HS-168-A0',0,18,0,1,0,1,1,0,50,NULL,NULL,NULL,19.00,18.00,13.00,711.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL),(110,'Samsung Smart TV',NULL,NULL,'published','[\"products\\/31-1.jpg\"]','HS-168-A0-A1',0,18,0,1,0,1,1,0,50,NULL,NULL,NULL,19.00,18.00,13.00,711.00,'2022-01-03 21:21:13','2022-01-03 21:21:13',NULL,0,'in_stock',0,'Botble\\ACL\\Models\\User',NULL);
/*!40000 ALTER TABLE `ec_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_products_translations`
--

DROP TABLE IF EXISTS `ec_products_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_products_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_products_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products_translations`
--

LOCK TABLES `ec_products_translations` WRITE;
/*!40000 ALTER TABLE `ec_products_translations` DISABLE KEYS */;
INSERT INTO `ec_products_translations` VALUES ('vi',1,'Loa thông minh',NULL,NULL),('vi',2,'Tai nghe Ultra Bass',NULL,NULL),('vi',3,'Đóng hộp - Tai nghe Bluetooth',NULL,NULL),('vi',4,'Chikie - Loa Bluetooth',NULL,NULL),('vi',5,'Camera Hikvision HK-35VS8',NULL,NULL),('vi',6,'Camera Samsung SS-24',NULL,NULL),('vi',7,'Dây đeo đồng hồ bằng da',NULL,NULL),('vi',8,'Apple iPhone 13 Plus',NULL,NULL),('vi',9,'Macbook Pro 2015',NULL,NULL),('vi',10,'Macbook Air 12 inch',NULL,NULL),('vi',11,'Apple Watch Serial 7',NULL,NULL),('vi',12,'Macbook Pro 13 inch',NULL,NULL),('vi',13,'Bàn phím Apple',NULL,NULL),('vi',14,'MacSafe 80W',NULL,NULL),('vi',15,'Máy chơi game cầm tay',NULL,NULL),('vi',16,'Tai nghe Apple Airpods Serial 3',NULL,NULL),('vi',17,'Đồng hồ thông minh',NULL,NULL),('vi',18,'Đồng hồ thông minh màu đen',NULL,NULL),('vi',19,'Dây đeo đồng hồ dây da Serial 3',NULL,NULL),('vi',20,'Macbook Pro 2015 13 inch',NULL,NULL),('vi',21,'Đồng hồ báo thức cổ điển',NULL,NULL),('vi',22,'Kính đen',NULL,NULL),('vi',23,'Chuột máy tính Phillips',NULL,NULL),('vi',24,'Bàn phím Trò chơi',NULL,NULL),('vi',25,'Camera kép 20MP',NULL,NULL),('vi',26,'Đồng hồ thông minh',NULL,NULL),('vi',27,'Tai nghe Best',NULL,NULL),('vi',28,'Tai nghe Đỏ & Đen',NULL,NULL),('vi',29,'Thiết bị âm thanh',NULL,NULL),('vi',30,'Tivi thông minh',NULL,NULL),('vi',31,'Tivi thông minh Samsung',NULL,NULL),('vi',32,'Loa thông minh',NULL,NULL),('vi',33,'Loa thông minh',NULL,NULL),('vi',34,'Tai nghe Ultra Bass',NULL,NULL),('vi',35,'Tai nghe Ultra Bass',NULL,NULL),('vi',36,'Tai nghe Ultra Bass',NULL,NULL),('vi',37,'Đóng hộp - Tai nghe Bluetooth',NULL,NULL),('vi',38,'Đóng hộp - Tai nghe Bluetooth',NULL,NULL),('vi',39,'Chikie - Loa Bluetooth',NULL,NULL),('vi',40,'Chikie - Loa Bluetooth',NULL,NULL),('vi',41,'Camera Hikvision HK-35VS8',NULL,NULL),('vi',42,'Camera Samsung SS-24',NULL,NULL),('vi',43,'Camera Samsung SS-24',NULL,NULL),('vi',44,'Camera Samsung SS-24',NULL,NULL),('vi',45,'Dây đeo đồng hồ bằng da',NULL,NULL),('vi',46,'Dây đeo đồng hồ bằng da',NULL,NULL),('vi',47,'Apple iPhone 13 Plus',NULL,NULL),('vi',48,'Apple iPhone 13 Plus',NULL,NULL),('vi',49,'Macbook Pro 2015',NULL,NULL),('vi',50,'Macbook Air 12 inch',NULL,NULL),('vi',51,'Macbook Air 12 inch',NULL,NULL),('vi',52,'Macbook Air 12 inch',NULL,NULL),('vi',53,'Apple Watch Serial 7',NULL,NULL),('vi',54,'Apple Watch Serial 7',NULL,NULL),('vi',55,'Apple Watch Serial 7',NULL,NULL),('vi',56,'Macbook Pro 13 inch',NULL,NULL),('vi',57,'Bàn phím Apple',NULL,NULL),('vi',58,'Bàn phím Apple',NULL,NULL),('vi',59,'Bàn phím Apple',NULL,NULL),('vi',60,'MacSafe 80W',NULL,NULL),('vi',61,'MacSafe 80W',NULL,NULL),('vi',62,'MacSafe 80W',NULL,NULL),('vi',63,'MacSafe 80W',NULL,NULL),('vi',64,'Máy chơi game cầm tay',NULL,NULL),('vi',65,'Tai nghe Apple Airpods Serial 3',NULL,NULL),('vi',66,'Tai nghe Apple Airpods Serial 3',NULL,NULL),('vi',67,'Tai nghe Apple Airpods Serial 3',NULL,NULL),('vi',68,'Đồng hồ thông minh',NULL,NULL),('vi',69,'Đồng hồ thông minh',NULL,NULL),('vi',70,'Đồng hồ thông minh',NULL,NULL),('vi',71,'Đồng hồ thông minh màu đen',NULL,NULL),('vi',72,'Đồng hồ thông minh màu đen',NULL,NULL),('vi',73,'Dây đeo đồng hồ dây da Serial 3',NULL,NULL),('vi',74,'Dây đeo đồng hồ dây da Serial 3',NULL,NULL),('vi',75,'Dây đeo đồng hồ dây da Serial 3',NULL,NULL),('vi',76,'Dây đeo đồng hồ dây da Serial 3',NULL,NULL),('vi',77,'Macbook Pro 2015 13 inch',NULL,NULL),('vi',78,'Macbook Pro 2015 13 inch',NULL,NULL),('vi',79,'Macbook Pro 2015 13 inch',NULL,NULL),('vi',80,'Đồng hồ báo thức cổ điển',NULL,NULL),('vi',81,'Kính đen',NULL,NULL),('vi',82,'Kính đen',NULL,NULL),('vi',83,'Kính đen',NULL,NULL),('vi',84,'Kính đen',NULL,NULL),('vi',85,'Kính đen',NULL,NULL),('vi',86,'Chuột máy tính Phillips',NULL,NULL),('vi',87,'Chuột máy tính Phillips',NULL,NULL),('vi',88,'Bàn phím Trò chơi',NULL,NULL),('vi',89,'Bàn phím Trò chơi',NULL,NULL),('vi',90,'Bàn phím Trò chơi',NULL,NULL),('vi',91,'Bàn phím Trò chơi',NULL,NULL),('vi',92,'Camera kép 20MP',NULL,NULL),('vi',93,'Đồng hồ thông minh',NULL,NULL),('vi',94,'Đồng hồ thông minh',NULL,NULL),('vi',95,'Đồng hồ thông minh',NULL,NULL),('vi',96,'Đồng hồ thông minh',NULL,NULL),('vi',97,'Tai nghe Best',NULL,NULL),('vi',98,'Tai nghe Best',NULL,NULL),('vi',99,'Tai nghe Best',NULL,NULL),('vi',100,'Tai nghe Best',NULL,NULL),('vi',101,'Tai nghe Đỏ & Đen',NULL,NULL),('vi',102,'Tai nghe Đỏ & Đen',NULL,NULL),('vi',103,'Tai nghe Đỏ & Đen',NULL,NULL),('vi',104,'Tai nghe Đỏ & Đen',NULL,NULL),('vi',105,'Tai nghe Đỏ & Đen',NULL,NULL),('vi',106,'Thiết bị âm thanh',NULL,NULL),('vi',107,'Tivi thông minh',NULL,NULL),('vi',108,'Tivi thông minh',NULL,NULL),('vi',109,'Tivi thông minh Samsung',NULL,NULL),('vi',110,'Tivi thông minh Samsung',NULL,NULL);
/*!40000 ALTER TABLE `ec_products_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_reviews`
--

DROP TABLE IF EXISTS `ec_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `star` double(8,2) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_reviews`
--

LOCK TABLES `ec_reviews` WRITE;
/*!40000 ALTER TABLE `ec_reviews` DISABLE KEYS */;
INSERT INTO `ec_reviews` VALUES (1,1,12,2.00,'Best ecommerce CMS online store!','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/2.jpg\",\"products\\/6.jpg\"]'),(2,10,1,2.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','{\"0\":\"products\\/1.jpg\",\"2\":\"products\\/20.jpg\"}'),(3,7,24,4.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/3.jpg\",\"products\\/5.jpg\"]'),(4,11,22,2.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/7.jpg\"]'),(5,3,31,1.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/2.jpg\",\"products\\/6.jpg\"]'),(6,1,19,5.00,'Good app, good backup service and support. Good documentation.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/3.jpg\"]'),(7,6,25,4.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\"]'),(8,1,5,3.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/5.jpg\"]'),(9,7,4,1.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/6.jpg\"]'),(10,1,12,3.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/2.jpg\",\"products\\/5.jpg\"]'),(11,8,31,3.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\",\"products\\/5.jpg\"]'),(12,8,6,3.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\",\"products\\/5.jpg\",\"products\\/20.jpg\"]'),(13,6,18,1.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/7.jpg\"]'),(14,2,2,2.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\",\"products\\/7.jpg\"]'),(15,9,13,5.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/7.jpg\",\"products\\/11.jpg\"]'),(16,6,19,2.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/7.jpg\",\"products\\/18.jpg\"]'),(17,3,5,1.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/3.jpg\"]'),(18,4,31,2.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/5.jpg\"]'),(19,11,3,3.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/7.jpg\"]'),(20,3,22,2.00,'Best ecommerce CMS online store!','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/7.jpg\"]'),(21,9,28,4.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\",\"products\\/6.jpg\",\"products\\/29.jpg\"]'),(22,3,4,1.00,'Good app, good backup service and support. Good documentation.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','{\"0\":\"products\\/1.jpg\",\"2\":\"products\\/9.jpg\"}'),(23,2,2,5.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\"]'),(24,2,16,5.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/3.jpg\"]'),(25,9,18,5.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\",\"products\\/6.jpg\"]'),(26,1,19,5.00,'Good app, good backup service and support. Good documentation.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/3.jpg\",\"products\\/6.jpg\"]'),(27,1,16,4.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\",\"products\\/7.jpg\",\"products\\/9.jpg\"]'),(28,7,29,2.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/3.jpg\",\"products\\/5.jpg\",\"products\\/18.jpg\"]'),(29,4,13,4.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\"]'),(30,9,13,3.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/2.jpg\",\"products\\/5.jpg\"]'),(31,5,21,3.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\",\"products\\/6.jpg\"]'),(32,11,23,2.00,'Best ecommerce CMS online store!','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/3.jpg\",\"products\\/7.jpg\"]'),(33,7,11,5.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\",\"products\\/5.jpg\",\"products\\/29.jpg\"]'),(34,1,14,3.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\",\"products\\/5.jpg\"]'),(35,9,23,1.00,'Best ecommerce CMS online store!','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/6.jpg\"]'),(36,10,18,2.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/5.jpg\",\"products\\/25.jpg\"]'),(37,2,20,3.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/5.jpg\"]'),(38,2,27,1.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/3.jpg\",\"products\\/6.jpg\"]'),(39,1,3,4.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\",\"products\\/7.jpg\",\"products\\/14.jpg\"]'),(40,5,8,5.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/6.jpg\",\"products\\/9.jpg\"]'),(41,4,6,3.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\",\"products\\/6.jpg\"]'),(42,9,11,1.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/2.jpg\",\"products\\/6.jpg\",\"products\\/20.jpg\"]'),(43,4,30,4.00,'Best ecommerce CMS online store!','published','2022-01-03 21:21:14','2022-01-03 21:21:14','{\"0\":\"products\\/4.jpg\",\"2\":\"products\\/9.jpg\"}'),(44,6,1,3.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/3.jpg\",\"products\\/6.jpg\"]'),(45,7,11,4.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\",\"products\\/6.jpg\"]'),(46,4,13,4.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\",\"products\\/6.jpg\"]'),(47,3,2,3.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/2.jpg\"]'),(48,4,4,3.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/2.jpg\",\"products\\/7.jpg\"]'),(49,3,8,2.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/6.jpg\"]'),(50,8,31,2.00,'Clean & perfect source code','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/3.jpg\",\"products\\/6.jpg\"]'),(51,7,26,5.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/5.jpg\"]'),(52,10,17,1.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/7.jpg\",\"products\\/19.jpg\"]'),(53,8,2,2.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/3.jpg\"]'),(54,1,1,5.00,'Good app, good backup service and support. Good documentation.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\",\"products\\/6.jpg\"]'),(55,5,30,5.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/2.jpg\",\"products\\/7.jpg\"]'),(56,6,28,3.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/3.jpg\",\"products\\/7.jpg\",\"products\\/30.jpg\"]'),(57,6,27,3.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/3.jpg\"]'),(58,8,22,2.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\",\"products\\/5.jpg\"]'),(59,10,22,1.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2022-01-03 21:21:14','2022-01-03 21:21:14','{\"0\":\"products\\/1.jpg\",\"2\":\"products\\/24.jpg\"}'),(60,4,25,5.00,'Clean & perfect source code','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/7.jpg\",\"products\\/16.jpg\"]'),(61,9,27,1.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/2.jpg\"]'),(62,4,27,2.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\",\"products\\/7.jpg\"]'),(63,9,4,4.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\"]'),(64,4,19,2.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/7.jpg\"]'),(65,8,8,5.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\"]'),(66,11,6,5.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/6.jpg\",\"products\\/13.jpg\"]'),(67,11,11,5.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/3.jpg\",\"products\\/6.jpg\",\"products\\/12.jpg\"]'),(68,2,4,5.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/3.jpg\",\"products\\/5.jpg\",\"products\\/31.jpg\"]'),(69,4,11,3.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\"]'),(70,4,20,3.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/2.jpg\"]'),(71,5,23,3.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\",\"products\\/5.jpg\"]'),(72,10,20,3.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/2.jpg\",\"products\\/5.jpg\"]'),(73,8,17,2.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\",\"products\\/7.jpg\"]'),(74,11,6,2.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/3.jpg\",\"products\\/5.jpg\"]'),(75,4,27,2.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/7.jpg\"]'),(76,2,6,1.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\",\"products\\/5.jpg\",\"products\\/19.jpg\"]'),(77,7,12,2.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\",\"products\\/6.jpg\",\"products\\/12.jpg\"]'),(78,1,19,1.00,'Best ecommerce CMS online store!','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/3.jpg\",\"products\\/6.jpg\"]'),(79,11,22,4.00,'Clean & perfect source code','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/2.jpg\",\"products\\/7.jpg\"]'),(80,5,16,2.00,'Good app, good backup service and support. Good documentation.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\",\"products\\/6.jpg\"]'),(81,9,19,5.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\"]'),(82,9,17,1.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/2.jpg\",\"products\\/6.jpg\"]'),(83,9,18,5.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/3.jpg\",\"products\\/6.jpg\",\"products\\/14.jpg\"]'),(84,10,13,1.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/2.jpg\",\"products\\/7.jpg\"]'),(85,3,9,4.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/7.jpg\",\"products\\/21.jpg\"]'),(86,10,15,3.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/3.jpg\",\"products\\/7.jpg\",\"products\\/12.jpg\"]'),(87,10,2,5.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/3.jpg\",\"products\\/5.jpg\"]'),(88,7,31,1.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/3.jpg\",\"products\\/5.jpg\",\"products\\/16.jpg\"]'),(89,8,21,1.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/2.jpg\"]'),(90,7,6,5.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/6.jpg\",\"products\\/17.jpg\"]'),(91,3,29,3.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','{\"0\":\"products\\/4.jpg\",\"2\":\"products\\/17.jpg\"}'),(92,5,10,3.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\"]'),(93,11,8,3.00,'Good app, good backup service and support. Good documentation.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/2.jpg\"]'),(94,6,11,3.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/5.jpg\"]'),(95,7,10,5.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','{\"0\":\"products\\/3.jpg\",\"2\":\"products\\/13.jpg\"}'),(96,1,2,2.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\",\"products\\/6.jpg\"]'),(97,1,9,3.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/1.jpg\",\"products\\/5.jpg\",\"products\\/27.jpg\"]'),(98,2,28,2.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/3.jpg\",\"products\\/6.jpg\",\"products\\/30.jpg\"]'),(99,7,13,1.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2022-01-03 21:21:14','2022-01-03 21:21:14','[\"products\\/4.jpg\",\"products\\/6.jpg\"]'),(100,9,27,1.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2022-01-03 21:21:14','2022-01-03 21:21:14','{\"0\":\"products\\/1.jpg\",\"2\":\"products\\/27.jpg\"}');
/*!40000 ALTER TABLE `ec_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipment_histories`
--

DROP TABLE IF EXISTS `ec_shipment_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_shipment_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `shipment_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipment_histories`
--

LOCK TABLES `ec_shipment_histories` WRITE;
/*!40000 ALTER TABLE `ec_shipment_histories` DISABLE KEYS */;
INSERT INTO `ec_shipment_histories` VALUES (1,'create_from_order','Shipping was created from order %order_id%',0,1,1,'2022-03-15 07:06:38','2022-03-15 07:06:38'),(2,'update_status','Changed status of shipping to : Approved . Updated by: %user_name%',0,1,1,'2022-03-18 15:06:38','2022-03-20 07:06:38'),(3,'create_from_order','Shipping was created from order %order_id%',0,2,2,'2022-03-06 01:06:38','2022-03-06 01:06:38'),(4,'update_status','Changed status of shipping to : Approved . Updated by: %user_name%',0,2,2,'2022-03-18 17:06:38','2022-03-20 07:06:38'),(5,'create_from_order','Shipping was created from order %order_id%',0,3,3,'2022-03-18 19:06:38','2022-03-18 19:06:38'),(6,'update_status','Changed status of shipping to : Approved . Updated by: %user_name%',0,3,3,'2022-03-18 19:06:38','2022-03-20 07:06:38'),(7,'create_from_order','Shipping was created from order %order_id%',0,4,4,'2022-03-17 11:06:38','2022-03-17 11:06:38'),(8,'update_status','Changed status of shipping to : Approved . Updated by: %user_name%',0,4,4,'2022-03-18 21:06:38','2022-03-20 07:06:38'),(9,'create_from_order','Shipping was created from order %order_id%',0,5,5,'2022-03-06 23:06:38','2022-03-06 23:06:38'),(10,'update_status','Changed status of shipping to : Approved . Updated by: %user_name%',0,5,5,'2022-03-18 23:06:38','2022-03-20 07:06:38'),(11,'update_status','Changed status of shipping to : Delivered . Updated by: %user_name%',0,5,5,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(12,'create_from_order','Shipping was created from order %order_id%',0,6,6,'2022-03-14 01:06:38','2022-03-14 01:06:38'),(13,'update_status','Changed status of shipping to : Approved . Updated by: %user_name%',0,6,6,'2022-03-19 01:06:38','2022-03-20 07:06:38'),(14,'create_from_order','Shipping was created from order %order_id%',0,7,7,'2022-03-10 23:06:38','2022-03-10 23:06:38'),(15,'update_status','Changed status of shipping to : Approved . Updated by: %user_name%',0,7,7,'2022-03-19 03:06:38','2022-03-20 07:06:38'),(16,'update_status','Changed status of shipping to : Delivered . Updated by: %user_name%',0,7,7,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(17,'create_from_order','Shipping was created from order %order_id%',0,8,8,'2022-03-13 19:06:38','2022-03-13 19:06:38'),(18,'update_status','Changed status of shipping to : Approved . Updated by: %user_name%',0,8,8,'2022-03-19 05:06:38','2022-03-20 07:06:38'),(19,'update_status','Changed status of shipping to : Delivered . Updated by: %user_name%',0,8,8,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(20,'create_from_order','Shipping was created from order %order_id%',0,9,9,'2022-03-17 07:06:38','2022-03-17 07:06:38'),(21,'update_status','Changed status of shipping to : Approved . Updated by: %user_name%',0,9,9,'2022-03-19 07:06:38','2022-03-20 07:06:38'),(22,'update_status','Changed status of shipping to : Delivered . Updated by: %user_name%',0,9,9,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(23,'create_from_order','Shipping was created from order %order_id%',0,10,10,'2022-03-12 01:06:38','2022-03-12 01:06:38'),(24,'update_status','Changed status of shipping to : Approved . Updated by: %user_name%',0,10,10,'2022-03-19 09:06:38','2022-03-20 07:06:38'),(25,'update_cod_status','Updated COD status to Completed . Updated by: %user_name%',0,10,10,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(26,'update_status','Changed status of shipping to : Delivered . Updated by: %user_name%',0,10,10,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(27,'create_from_order','Shipping was created from order %order_id%',0,11,11,'2022-03-14 11:06:38','2022-03-14 11:06:38'),(28,'update_status','Changed status of shipping to : Approved . Updated by: %user_name%',0,11,11,'2022-03-19 11:06:38','2022-03-20 07:06:38'),(29,'update_status','Changed status of shipping to : Delivered . Updated by: %user_name%',0,11,11,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(30,'create_from_order','Shipping was created from order %order_id%',0,12,12,'2022-03-12 19:06:38','2022-03-12 19:06:38'),(31,'update_status','Changed status of shipping to : Approved . Updated by: %user_name%',0,12,12,'2022-03-19 13:06:38','2022-03-20 07:06:38'),(32,'create_from_order','Shipping was created from order %order_id%',0,13,13,'2022-03-16 07:06:38','2022-03-16 07:06:38'),(33,'update_status','Changed status of shipping to : Approved . Updated by: %user_name%',0,13,13,'2022-03-19 15:06:38','2022-03-20 07:06:38'),(34,'update_status','Changed status of shipping to : Delivered . Updated by: %user_name%',0,13,13,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(35,'create_from_order','Shipping was created from order %order_id%',0,14,14,'2022-03-15 15:06:38','2022-03-15 15:06:38'),(36,'update_status','Changed status of shipping to : Approved . Updated by: %user_name%',0,14,14,'2022-03-19 17:06:38','2022-03-20 07:06:38'),(37,'update_cod_status','Updated COD status to Completed . Updated by: %user_name%',0,14,14,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(38,'update_status','Changed status of shipping to : Delivered . Updated by: %user_name%',0,14,14,'2022-03-20 07:06:38','2022-03-20 07:06:38'),(39,'create_from_order','Shipping was created from order %order_id%',0,15,15,'2022-03-16 19:06:38','2022-03-16 19:06:38'),(40,'update_status','Changed status of shipping to : Approved . Updated by: %user_name%',0,15,15,'2022-03-19 19:06:38','2022-03-20 07:06:38'),(41,'create_from_order','Shipping was created from order %order_id%',0,16,16,'2022-03-19 11:06:38','2022-03-19 11:06:38'),(42,'update_status','Changed status of shipping to : Approved . Updated by: %user_name%',0,16,16,'2022-03-19 21:06:38','2022-03-20 07:06:38'),(43,'create_from_order','Shipping was created from order %order_id%',0,17,17,'2022-03-18 07:06:38','2022-03-18 07:06:38'),(44,'update_status','Changed status of shipping to : Approved . Updated by: %user_name%',0,17,17,'2022-03-19 23:06:38','2022-03-20 07:06:38'),(45,'create_from_order','Shipping was created from order %order_id%',0,18,18,'2022-03-18 01:06:39','2022-03-18 01:06:39'),(46,'update_status','Changed status of shipping to : Approved . Updated by: %user_name%',0,18,18,'2022-03-20 01:06:39','2022-03-20 07:06:39'),(47,'update_status','Changed status of shipping to : Delivered . Updated by: %user_name%',0,18,18,'2022-03-20 07:06:39','2022-03-20 07:06:39'),(48,'create_from_order','Shipping was created from order %order_id%',0,19,19,'2022-03-19 19:06:39','2022-03-19 19:06:39'),(49,'update_status','Changed status of shipping to : Approved . Updated by: %user_name%',0,19,19,'2022-03-20 03:06:39','2022-03-20 07:06:39'),(50,'create_from_order','Shipping was created from order %order_id%',0,20,20,'2022-03-20 03:06:39','2022-03-20 03:06:39'),(51,'update_status','Changed status of shipping to : Approved . Updated by: %user_name%',0,20,20,'2022-03-20 05:06:39','2022-03-20 07:06:39');
/*!40000 ALTER TABLE `ec_shipment_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipments`
--

DROP TABLE IF EXISTS `ec_shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_shipments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `weight` double(8,2) DEFAULT 0.00,
  `shipment_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cod_amount` decimal(15,2) DEFAULT 0.00,
  `cod_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cross_checking_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `price` decimal(15,2) DEFAULT 0.00,
  `store_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimate_date_shipped` datetime DEFAULT NULL,
  `date_shipped` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipments`
--

LOCK TABLES `ec_shipments` WRITE;
/*!40000 ALTER TABLE `ec_shipments` DISABLE KEYS */;
INSERT INTO `ec_shipments` VALUES (1,1,NULL,2889.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38','JJD0094237535','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-03-21 14:06:38',NULL),(2,2,NULL,4856.00,NULL,'','approved',735.70,'pending','pending',0.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38','JJD0082347602','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-03-27 14:06:38',NULL),(3,3,NULL,2992.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38','JJD0087959546','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-03-23 14:06:38',NULL),(4,4,NULL,3816.00,NULL,'','approved',624.80,'pending','pending',0.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38','JJD0098679943','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-03-26 14:06:38',NULL),(5,5,NULL,3837.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38','JJD0053865125','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-03-21 14:06:38','2022-03-20 14:06:38'),(6,6,NULL,4674.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38','JJD0011944970','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-03-26 14:06:38',NULL),(7,7,NULL,2324.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38','JJD0052905520','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-03-22 14:06:38','2022-03-20 14:06:38'),(8,8,NULL,4278.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38','JJD0047448386','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-03-29 14:06:38','2022-03-20 14:06:38'),(9,9,NULL,4632.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38','JJD0068299727','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-03-23 14:06:38','2022-03-20 14:06:38'),(10,10,NULL,2333.00,NULL,'','delivered',276.10,'completed','pending',0.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38','JJD0070209498','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-03-26 14:06:38','2022-03-20 14:06:38'),(11,11,NULL,2511.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38','JJD0043962070','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-03-25 14:06:38','2022-03-20 14:06:38'),(12,12,NULL,7170.00,NULL,'','approved',1965.50,'pending','pending',0.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38','JJD0020905772','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-03-23 14:06:38',NULL),(13,13,NULL,4554.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38','JJD0081754603','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-03-30 14:06:38','2022-03-20 14:06:38'),(14,14,NULL,3042.00,NULL,'','delivered',304.50,'completed','pending',0.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38','JJD0055731477','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-03-26 14:06:38','2022-03-20 14:06:38'),(15,15,NULL,5437.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38','JJD001375024','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-03-26 14:06:38',NULL),(16,16,NULL,2295.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38','JJD0089474808','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-03-28 14:06:38',NULL),(17,17,NULL,6405.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-03-20 07:06:38','2022-03-20 07:06:38','JJD0048849281','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-03-25 14:06:38',NULL),(18,18,NULL,2971.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-03-20 07:06:39','2022-03-20 07:06:39','JJD0087305080','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-03-27 14:06:39','2022-03-20 14:06:39'),(19,19,NULL,3947.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-03-20 07:06:39','2022-03-20 07:06:39','JJD0098234577','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-03-30 14:06:39',NULL),(20,20,NULL,3936.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-03-20 07:06:39','2022-03-20 07:06:39','JJD0067944993','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-03-30 14:06:39',NULL);
/*!40000 ALTER TABLE `ec_shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping`
--

DROP TABLE IF EXISTS `ec_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_shipping` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping`
--

LOCK TABLES `ec_shipping` WRITE;
/*!40000 ALTER TABLE `ec_shipping` DISABLE KEYS */;
INSERT INTO `ec_shipping` VALUES (1,'All',NULL,'2022-01-03 21:21:14','2022-01-03 21:21:14');
/*!40000 ALTER TABLE `ec_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping_rule_items`
--

DROP TABLE IF EXISTS `ec_shipping_rule_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_shipping_rule_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shipping_rule_id` int(10) unsigned NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_price` decimal(15,2) DEFAULT 0.00,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping_rule_items`
--

LOCK TABLES `ec_shipping_rule_items` WRITE;
/*!40000 ALTER TABLE `ec_shipping_rule_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_shipping_rule_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping_rules`
--

DROP TABLE IF EXISTS `ec_shipping_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_shipping_rules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_id` int(10) unsigned NOT NULL,
  `type` enum('base_on_price','base_on_weight') COLLATE utf8mb4_unicode_ci DEFAULT 'base_on_price',
  `from` decimal(15,2) DEFAULT 0.00,
  `to` decimal(15,2) DEFAULT 0.00,
  `price` decimal(15,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping_rules`
--

LOCK TABLES `ec_shipping_rules` WRITE;
/*!40000 ALTER TABLE `ec_shipping_rules` DISABLE KEYS */;
INSERT INTO `ec_shipping_rules` VALUES (1,'Free shipping',1,'base_on_price',0.00,NULL,0.00,'2022-01-03 21:21:14','2022-01-03 21:21:14'),(2,'Local Pickup',1,'base_on_price',0.00,NULL,20.00,'2022-01-03 21:21:14','2022-01-03 21:21:14'),(3,'Flat Rate',1,'base_on_price',0.00,NULL,25.00,'2022-01-03 21:21:14','2022-01-03 21:21:14');
/*!40000 ALTER TABLE `ec_shipping_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_store_locators`
--

DROP TABLE IF EXISTS `ec_store_locators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_store_locators` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT 0,
  `is_shipping_location` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_store_locators`
--

LOCK TABLES `ec_store_locators` WRITE;
/*!40000 ALTER TABLE `ec_store_locators` DISABLE KEYS */;
INSERT INTO `ec_store_locators` VALUES (1,'Shopwise','sales@botble.com','123-456-7890','123 Street, Old Trafford','US','New York','New York',1,1,'2022-01-03 21:21:19','2022-01-03 21:21:19');
/*!40000 ALTER TABLE `ec_store_locators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_taxes`
--

DROP TABLE IF EXISTS `ec_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_taxes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` double(8,6) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_taxes`
--

LOCK TABLES `ec_taxes` WRITE;
/*!40000 ALTER TABLE `ec_taxes` DISABLE KEYS */;
INSERT INTO `ec_taxes` VALUES (1,'VAT',10.000000,1,'published','2022-01-03 21:21:14','2022-01-03 21:21:14'),(2,'None',0.000000,2,'published','2022-01-03 21:21:14','2022-01-03 21:21:14');
/*!40000 ALTER TABLE `ec_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_wish_lists`
--

DROP TABLE IF EXISTS `ec_wish_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ec_wish_lists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_wish_lists`
--

LOCK TABLES `ec_wish_lists` WRITE;
/*!40000 ALTER TABLE `ec_wish_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_wish_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
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
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories`
--

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
INSERT INTO `faq_categories` VALUES (1,'Shipping',0,'published','2022-01-03 21:21:19','2022-01-03 21:21:19'),(2,'Payment',1,'published','2022-01-03 21:21:19','2022-01-03 21:21:19'),(3,'Order & Returns',2,'published','2022-01-03 21:21:19','2022-01-03 21:21:19');
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories_translations`
--

DROP TABLE IF EXISTS `faq_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` int(11) NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`faq_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories_translations`
--

LOCK TABLES `faq_categories_translations` WRITE;
/*!40000 ALTER TABLE `faq_categories_translations` DISABLE KEYS */;
INSERT INTO `faq_categories_translations` VALUES ('vi',1,'VẬN CHUYỂN'),('vi',2,'THANH TOÁN'),('vi',3,'ĐƠN HÀNG & HOÀN TRẢ');
/*!40000 ALTER TABLE `faq_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faqs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'What Shipping Methods Are Available?','Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.',1,'published','2022-01-03 21:21:19','2022-01-03 21:21:19'),(2,'Do You Ship Internationally?','Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.',1,'published','2022-01-03 21:21:19','2022-01-03 21:21:19'),(3,'How Long Will It Take To Get My Package?','Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.',1,'published','2022-01-03 21:21:19','2022-01-03 21:21:19'),(4,'What Payment Methods Are Accepted?','Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.',2,'published','2022-01-03 21:21:19','2022-01-03 21:21:19'),(5,'Is Buying On-Line Safe?','Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.',2,'published','2022-01-03 21:21:19','2022-01-03 21:21:19'),(6,'How do I place an Order?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb Odd Future seitan normcore. Master cleanse American Apparel gentrify flexitarian beard slow-carb next level. Raw denim polaroid paleo farm-to-table, put a bird on it lo-fi tattooed Wes Anderson Pinterest letterpress. Fingerstache McSweeney’s pour-over, letterpress Schlitz photo booth master cleanse bespoke hashtag chillwave gentrify.',3,'published','2022-01-03 21:21:19','2022-01-03 21:21:19'),(7,'How Can I Cancel Or Change My Order?','Plaid letterpress leggings craft beer meh ethical Pinterest. Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth.',3,'published','2022-01-03 21:21:19','2022-01-03 21:21:19'),(8,'Do I need an account to place an order?','Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY. Cray ugh 3 wolf moon fap, fashion axe irony butcher cornhole typewriter chambray VHS banjo street art.',3,'published','2022-01-03 21:21:19','2022-01-03 21:21:19'),(9,'How Do I Track My Order?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb @Odd Future seitan normcore. Master cleanse American Apparel gentrify flexitarian beard slow-carb next level.',3,'published','2022-01-03 21:21:19','2022-01-03 21:21:19'),(10,'How Can I Return a Product?','Kale chips Truffaut Williamsburg, hashtag fixie Pinterest raw denim c hambray drinking vinegar Carles street art Bushwick gastropub. Wolf Tumblr paleo church-key. Plaid food truck Echo Park YOLO bitters hella, direct trade Thundercats leggings quinoa before they sold out. You probably haven’t heard of them wayfarers authentic umami drinking vinegar Pinterest Cosby sweater, fingerstache fap High Life.',3,'published','2022-01-03 21:21:19','2022-01-03 21:21:19');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_translations`
--

DROP TABLE IF EXISTS `faqs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faqs_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` int(11) NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`faqs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs_translations`
--

LOCK TABLES `faqs_translations` WRITE;
/*!40000 ALTER TABLE `faqs_translations` DISABLE KEYS */;
INSERT INTO `faqs_translations` VALUES ('vi',1,'Có những phương thức vận chuyển nào?','Ex Portland Pitchfork irure ria mép. Eutra fap trước khi họ bán hết theo đúng nghĩa đen. Aliquip ugh quyền xe đạp thực sự mlkshk, rượu bia thủ công mực seitan. '),('vi',2,'Bạn có giao hàng quốc tế không?','Áo hoodie túi tote Tofu mixtape. Quần đùi jean đánh chữ Wolf quinoa, túi messenger hữu cơ freegan cray. '),('vi',3,'Mất bao lâu để nhận được gói hàng của tôi?','Bữa nửa buổi ăn sáng bằng bụng heo quay từ máy đánh chữ VHS, cà phê có nguồn gốc đơn Paleo, Wes Anderson. Khoan Pitchfork linh hoạt, theo nghĩa đen là đổ qua fap theo nghĩa đen. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray bền vững slow-carb raw denim Church-key fap chillwave Etsy. +1 bộ dụng cụ đánh máy, đậu phụ Banksy Vice của American Apparel. '),('vi',4,'Phương thức thanh toán nào được chấp nhận?','Fashion Axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Quầy ảnh Voluptate fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur ria mép. Twee chia gian hàng chụp ảnh xe bán đồ ăn sẵn, bữa tiệc trên mái áo hoodie swag keytar PBR DIY. '),('vi',5,'Mua trực tuyến có an toàn không?','Bữa tiệc nghệ thuật đích thực freegan semiotics jean shorts chia credit. Tiệc trên mái nhà Neutra Austin Brooklyn, Thundercats swag synth gian hàng ảnh 8-bit. Xà cạp letterpress kẻ sọc thủ công bia meh đạo đức Pinterest. '),('vi',6,'Làm cách nào để đặt hàng?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb Odd Định mức seitan trong tương lai. Master làm sạch American Apparel nhẹ nhàng làm sạch râu linh hoạt chậm carb cấp độ tiếp theo. Vải thô denim polaroid nhạt từ trang trại đến bàn, đặt một con chim trên đó hình xăm lo-fi Wes Anderson Pinterest letterpress. Bậc thầy gian hàng ảnh Schlitz của Fingerstache McSweeney đang làm sạch thẻ bắt đầu bằng hashtag theo yêu cầu riêng, chillwave gentrify. '),('vi',7,'Làm cách nào để tôi có thể hủy hoặc thay đổi đơn hàng của mình?','Xà cạp letterpress kẻ sọc thủ công bia meh đạo đức Pinterest. Bữa tiệc nghệ thuật đích thực freegan semiotics jean shorts chia tín. Tiệc trên mái nhà Neutra Austin ở Brooklyn, synth Thundercats có gian hàng ảnh 8-bit. '),('vi',8,'Tôi có cần tài khoản để đặt hàng không?','Thundercats làm lung lay gian hàng ảnh 8-bit. Xà cạp letterpress kẻ sọc thủ công bia meh đạo đức Pinterest. Twee chia ảnh gian hàng xe bán thức ăn làm sẵn, bữa tiệc trên mái áo hoodie swag keytar PBR DIY. Cray ugh 3 wolf moon fap, rìu thời trang mỉa mai người bán thịt máy đánh chữ chambray VHS banjo nghệ thuật đường phố. '),('vi',9,'Làm cách nào để theo dõi đơn hàng của tôi?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb @Odd Định mức seitan trong tương lai. Bậc thầy làm sạch American Apparel nhẹ nhàng làm sạch râu linh hoạt theo kiểu chậm carb cấp độ tiếp theo. '),('vi',10,'Làm cách nào để trả lại sản phẩm?','Kale chips Truffaut Williamsburg, fixie hashtag Pinterest raw denim c hambray uống giấm Carles street art Bushwick gastropub. Chìa khóa nhà thờ Wolf Tumblr. Xe tải thực phẩm kẻ sọc Echo Park YOLO cắn hella, giao dịch trực tiếp Thundercats legging quinoa trước khi bán hết. Có thể bạn chưa từng nghe nói về họ những người truyền bá vị umami đích thực uống giấm Pinterest Áo len Cosby, fingerstache fap High Life. ');
/*!40000 ALTER TABLE `faqs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
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
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int(10) unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','73c25068aaa2a5c206d48ac1fc60923f',1,'Botble\\SimpleSlider\\Models\\SimpleSlider'),(2,'vi','73c25068aaa2a5c206d48ac1fc60923f',2,'Botble\\SimpleSlider\\Models\\SimpleSlider'),(3,'en_US','36fd047718f0cefd0eee0a737827196a',1,'Botble\\Menu\\Models\\MenuLocation'),(4,'en_US','f4f1abb3930b5ac214123f1b7fe901ee',1,'Botble\\Menu\\Models\\Menu'),(5,'en_US','8e866caa342b7c491fdef187412568c0',2,'Botble\\Menu\\Models\\Menu'),(6,'en_US','430770c63500089634ba5841e5f3f605',3,'Botble\\Menu\\Models\\Menu'),(7,'en_US','1de3fdda9985358daaa082398f3f65f0',4,'Botble\\Menu\\Models\\Menu'),(8,'vi','d4d832ebc48f2698f26ff1a66ba25b55',2,'Botble\\Menu\\Models\\MenuLocation'),(9,'vi','f4f1abb3930b5ac214123f1b7fe901ee',5,'Botble\\Menu\\Models\\Menu'),(10,'vi','8e866caa342b7c491fdef187412568c0',6,'Botble\\Menu\\Models\\Menu'),(11,'vi','430770c63500089634ba5841e5f3f605',7,'Botble\\Menu\\Models\\Menu'),(12,'vi','1de3fdda9985358daaa082398f3f65f0',8,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta_backup`
--

DROP TABLE IF EXISTS `language_meta_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_meta_backup` (
  `lang_meta_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int(10) unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta_backup`
--

LOCK TABLES `language_meta_backup` WRITE;
/*!40000 ALTER TABLE `language_meta_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `language_meta_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `lang_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `lang_order` int(11) NOT NULL DEFAULT 0,
  `lang_is_rtl` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0),(2,'Tiếng Việt','vi','vi','vn',0,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_id` int(10) unsigned NOT NULL DEFAULT 0,
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'1',1,'image/png',3509,'brands/1.png','[]','2022-01-03 21:20:42','2022-01-03 21:20:42',NULL),(2,0,'2',1,'image/png',3505,'brands/2.png','[]','2022-01-03 21:20:43','2022-01-03 21:20:43',NULL),(3,0,'3',1,'image/png',2585,'brands/3.png','[]','2022-01-03 21:20:43','2022-01-03 21:20:43',NULL),(4,0,'4',1,'image/png',6427,'brands/4.png','[]','2022-01-03 21:20:43','2022-01-03 21:20:43',NULL),(5,0,'5',1,'image/png',3246,'brands/5.png','[]','2022-01-03 21:20:43','2022-01-03 21:20:43',NULL),(6,0,'6',1,'image/png',3276,'brands/6.png','[]','2022-01-03 21:20:43','2022-01-03 21:20:43',NULL),(7,0,'7',1,'image/png',3120,'brands/7.png','[]','2022-01-03 21:20:43','2022-01-03 21:20:43',NULL),(8,0,'p-1',2,'image/png',9577,'product-categories/p-1.png','[]','2022-01-03 21:20:43','2022-01-03 21:20:43',NULL),(9,0,'p-2',2,'image/png',5510,'product-categories/p-2.png','[]','2022-01-03 21:20:44','2022-01-03 21:20:44',NULL),(10,0,'p-3',2,'image/png',16215,'product-categories/p-3.png','[]','2022-01-03 21:20:44','2022-01-03 21:20:44',NULL),(11,0,'p-4',2,'image/png',7394,'product-categories/p-4.png','[]','2022-01-03 21:20:44','2022-01-03 21:20:44',NULL),(12,0,'p-5',2,'image/png',6714,'product-categories/p-5.png','[]','2022-01-03 21:20:44','2022-01-03 21:20:44',NULL),(13,0,'p-6',2,'image/png',9541,'product-categories/p-6.png','[]','2022-01-03 21:20:44','2022-01-03 21:20:44',NULL),(14,0,'p-7',2,'image/png',13677,'product-categories/p-7.png','[]','2022-01-03 21:20:44','2022-01-03 21:20:44',NULL),(15,0,'1',3,'image/jpeg',11752,'customers/1.jpg','[]','2022-01-03 21:20:45','2022-01-03 21:20:45',NULL),(16,0,'10',3,'image/jpeg',27814,'customers/10.jpg','[]','2022-01-03 21:20:45','2022-01-03 21:20:45',NULL),(17,0,'2',3,'image/jpeg',19005,'customers/2.jpg','[]','2022-01-03 21:20:45','2022-01-03 21:20:45',NULL),(18,0,'3',3,'image/jpeg',20400,'customers/3.jpg','[]','2022-01-03 21:20:45','2022-01-03 21:20:45',NULL),(19,0,'4',3,'image/jpeg',26819,'customers/4.jpg','[]','2022-01-03 21:20:46','2022-01-03 21:20:46',NULL),(20,0,'5',3,'image/jpeg',14367,'customers/5.jpg','[]','2022-01-03 21:20:46','2022-01-03 21:20:46',NULL),(21,0,'6',3,'image/jpeg',12367,'customers/6.jpg','[]','2022-01-03 21:20:46','2022-01-03 21:20:46',NULL),(22,0,'7',3,'image/jpeg',20652,'customers/7.jpg','[]','2022-01-03 21:20:46','2022-01-03 21:20:46',NULL),(23,0,'8',3,'image/jpeg',21164,'customers/8.jpg','[]','2022-01-03 21:20:46','2022-01-03 21:20:46',NULL),(24,0,'9',3,'image/jpeg',6084,'customers/9.jpg','[]','2022-01-03 21:20:46','2022-01-03 21:20:46',NULL),(25,0,'1-1',4,'image/jpeg',88437,'products/1-1.jpg','[]','2022-01-03 21:20:47','2022-01-03 21:20:47',NULL),(26,0,'1-2',4,'image/jpeg',122690,'products/1-2.jpg','[]','2022-01-03 21:20:48','2022-01-03 21:20:48',NULL),(27,0,'1-3',4,'image/jpeg',117296,'products/1-3.jpg','[]','2022-01-03 21:20:48','2022-01-03 21:20:48',NULL),(28,0,'1',4,'image/jpeg',139025,'products/1.jpg','[]','2022-01-03 21:20:48','2022-01-03 21:20:48',NULL),(29,0,'10-1',4,'image/jpeg',183491,'products/10-1.jpg','[]','2022-01-03 21:20:49','2022-01-03 21:20:49',NULL),(30,0,'10',4,'image/jpeg',150956,'products/10.jpg','[]','2022-01-03 21:20:49','2022-01-03 21:20:49',NULL),(31,0,'11-1',4,'image/jpeg',246200,'products/11-1.jpg','[]','2022-01-03 21:20:49','2022-01-03 21:20:49',NULL),(32,0,'11',4,'image/jpeg',279390,'products/11.jpg','[]','2022-01-03 21:20:50','2022-01-03 21:20:50',NULL),(33,0,'12-1',4,'image/jpeg',249712,'products/12-1.jpg','[]','2022-01-03 21:20:50','2022-01-03 21:20:50',NULL),(34,0,'12',4,'image/jpeg',172221,'products/12.jpg','[]','2022-01-03 21:20:50','2022-01-03 21:20:50',NULL),(35,0,'13-1',4,'image/jpeg',257021,'products/13-1.jpg','[]','2022-01-03 21:20:51','2022-01-03 21:20:51',NULL),(36,0,'13',4,'image/jpeg',232917,'products/13.jpg','[]','2022-01-03 21:20:51','2022-01-03 21:20:51',NULL),(37,0,'14-1',4,'image/jpeg',201773,'products/14-1.jpg','[]','2022-01-03 21:20:51','2022-01-03 21:20:51',NULL),(38,0,'14',4,'image/jpeg',287194,'products/14.jpg','[]','2022-01-03 21:20:52','2022-01-03 21:20:52',NULL),(39,0,'15-1',4,'image/jpeg',273720,'products/15-1.jpg','[]','2022-01-03 21:20:52','2022-01-03 21:20:52',NULL),(40,0,'15',4,'image/jpeg',114265,'products/15.jpg','[]','2022-01-03 21:20:52','2022-01-03 21:20:52',NULL),(41,0,'16',4,'image/jpeg',97174,'products/16.jpg','[]','2022-01-03 21:20:52','2022-01-03 21:20:52',NULL),(42,0,'17',4,'image/jpeg',70179,'products/17.jpg','[]','2022-01-03 21:20:53','2022-01-03 21:20:53',NULL),(43,0,'18-1',4,'image/jpeg',287835,'products/18-1.jpg','[]','2022-01-03 21:20:54','2022-01-03 21:20:54',NULL),(44,0,'18-2',4,'image/jpeg',454869,'products/18-2.jpg','[]','2022-01-03 21:20:55','2022-01-03 21:20:55',NULL),(45,0,'18',4,'image/jpeg',257331,'products/18.jpg','[]','2022-01-03 21:20:56','2022-01-03 21:20:56',NULL),(46,0,'19-1',4,'image/jpeg',144008,'products/19-1.jpg','[]','2022-01-03 21:20:56','2022-01-03 21:20:56',NULL),(47,0,'19',4,'image/jpeg',188821,'products/19.jpg','[]','2022-01-03 21:20:57','2022-01-03 21:20:57',NULL),(48,0,'2-1',4,'image/jpeg',138167,'products/2-1.jpg','[]','2022-01-03 21:20:57','2022-01-03 21:20:57',NULL),(49,0,'2-2',4,'image/jpeg',230552,'products/2-2.jpg','[]','2022-01-03 21:20:57','2022-01-03 21:20:57',NULL),(50,0,'2-3',4,'image/jpeg',179301,'products/2-3.jpg','[]','2022-01-03 21:20:58','2022-01-03 21:20:58',NULL),(51,0,'2',4,'image/jpeg',130048,'products/2.jpg','[]','2022-01-03 21:20:58','2022-01-03 21:20:58',NULL),(52,0,'20-1',4,'image/jpeg',249712,'products/20-1.jpg','[]','2022-01-03 21:20:58','2022-01-03 21:20:58',NULL),(53,0,'20',4,'image/jpeg',172221,'products/20.jpg','[]','2022-01-03 21:20:58','2022-01-03 21:20:58',NULL),(54,0,'21-1',4,'image/jpeg',260746,'products/21-1.jpg','[]','2022-01-03 21:20:59','2022-01-03 21:20:59',NULL),(55,0,'21',4,'image/jpeg',124244,'products/21.jpg','[]','2022-01-03 21:20:59','2022-01-03 21:20:59',NULL),(56,0,'22-1',4,'image/jpeg',268620,'products/22-1.jpg','[]','2022-01-03 21:21:00','2022-01-03 21:21:00',NULL),(57,0,'22',4,'image/jpeg',128692,'products/22.jpg','[]','2022-01-03 21:21:01','2022-01-03 21:21:01',NULL),(58,0,'23-1',4,'image/jpeg',105560,'products/23-1.jpg','[]','2022-01-03 21:21:01','2022-01-03 21:21:01',NULL),(59,0,'23',4,'image/jpeg',177362,'products/23.jpg','[]','2022-01-03 21:21:02','2022-01-03 21:21:02',NULL),(60,0,'24-1',4,'image/jpeg',239311,'products/24-1.jpg','[]','2022-01-03 21:21:03','2022-01-03 21:21:03',NULL),(61,0,'24',4,'image/jpeg',363853,'products/24.jpg','[]','2022-01-03 21:21:03','2022-01-03 21:21:03',NULL),(62,0,'25-1',4,'image/jpeg',17089,'products/25-1.jpg','[]','2022-01-03 21:21:04','2022-01-03 21:21:04',NULL),(63,0,'25',4,'image/jpeg',18069,'products/25.jpg','[]','2022-01-03 21:21:05','2022-01-03 21:21:05',NULL),(64,0,'26-1',4,'image/jpeg',13085,'products/26-1.jpg','[]','2022-01-03 21:21:05','2022-01-03 21:21:05',NULL),(65,0,'26-2',4,'image/jpeg',22667,'products/26-2.jpg','[]','2022-01-03 21:21:05','2022-01-03 21:21:05',NULL),(66,0,'26',4,'image/jpeg',13611,'products/26.jpg','[]','2022-01-03 21:21:05','2022-01-03 21:21:05',NULL),(67,0,'27-1',4,'image/jpeg',10286,'products/27-1.jpg','[]','2022-01-03 21:21:06','2022-01-03 21:21:06',NULL),(68,0,'27',4,'image/jpeg',12569,'products/27.jpg','[]','2022-01-03 21:21:06','2022-01-03 21:21:06',NULL),(69,0,'28-1',4,'image/jpeg',15654,'products/28-1.jpg','[]','2022-01-03 21:21:06','2022-01-03 21:21:06',NULL),(70,0,'28',4,'image/jpeg',18243,'products/28.jpg','[]','2022-01-03 21:21:06','2022-01-03 21:21:06',NULL),(71,0,'29-1',4,'image/jpeg',27890,'products/29-1.jpg','[]','2022-01-03 21:21:06','2022-01-03 21:21:06',NULL),(72,0,'29',4,'image/jpeg',27961,'products/29.jpg','[]','2022-01-03 21:21:06','2022-01-03 21:21:06',NULL),(73,0,'3-1',4,'image/jpeg',135741,'products/3-1.jpg','[]','2022-01-03 21:21:06','2022-01-03 21:21:06',NULL),(74,0,'3-2',4,'image/jpeg',123069,'products/3-2.jpg','[]','2022-01-03 21:21:06','2022-01-03 21:21:06',NULL),(75,0,'3-3',4,'image/jpeg',98645,'products/3-3.jpg','[]','2022-01-03 21:21:07','2022-01-03 21:21:07',NULL),(76,0,'3',4,'image/jpeg',201722,'products/3.jpg','[]','2022-01-03 21:21:07','2022-01-03 21:21:07',NULL),(77,0,'30-1',4,'image/jpeg',26283,'products/30-1.jpg','[]','2022-01-03 21:21:07','2022-01-03 21:21:07',NULL),(78,0,'30',4,'image/jpeg',27107,'products/30.jpg','[]','2022-01-03 21:21:07','2022-01-03 21:21:07',NULL),(79,0,'31-1',4,'image/jpeg',25924,'products/31-1.jpg','[]','2022-01-03 21:21:08','2022-01-03 21:21:08',NULL),(80,0,'31',4,'image/jpeg',18634,'products/31.jpg','[]','2022-01-03 21:21:08','2022-01-03 21:21:08',NULL),(81,0,'4-1',4,'image/jpeg',205312,'products/4-1.jpg','[]','2022-01-03 21:21:08','2022-01-03 21:21:08',NULL),(82,0,'4-2',4,'image/jpeg',223903,'products/4-2.jpg','[]','2022-01-03 21:21:08','2022-01-03 21:21:08',NULL),(83,0,'4-3',4,'image/jpeg',106593,'products/4-3.jpg','[]','2022-01-03 21:21:08','2022-01-03 21:21:08',NULL),(84,0,'4',4,'image/jpeg',456134,'products/4.jpg','[]','2022-01-03 21:21:09','2022-01-03 21:21:09',NULL),(85,0,'5-1',4,'image/jpeg',110014,'products/5-1.jpg','[]','2022-01-03 21:21:09','2022-01-03 21:21:09',NULL),(86,0,'5-2',4,'image/jpeg',104934,'products/5-2.jpg','[]','2022-01-03 21:21:09','2022-01-03 21:21:09',NULL),(87,0,'5-3',4,'image/jpeg',131628,'products/5-3.jpg','[]','2022-01-03 21:21:09','2022-01-03 21:21:09',NULL),(88,0,'5',4,'image/jpeg',214767,'products/5.jpg','[]','2022-01-03 21:21:10','2022-01-03 21:21:10',NULL),(89,0,'6-1',4,'image/jpeg',128041,'products/6-1.jpg','[]','2022-01-03 21:21:10','2022-01-03 21:21:10',NULL),(90,0,'6',4,'image/jpeg',148485,'products/6.jpg','[]','2022-01-03 21:21:10','2022-01-03 21:21:10',NULL),(91,0,'7-1',4,'image/jpeg',144008,'products/7-1.jpg','[]','2022-01-03 21:21:11','2022-01-03 21:21:11',NULL),(92,0,'7',4,'image/jpeg',188821,'products/7.jpg','[]','2022-01-03 21:21:11','2022-01-03 21:21:11',NULL),(93,0,'8-1',4,'image/jpeg',274272,'products/8-1.jpg','[]','2022-01-03 21:21:11','2022-01-03 21:21:11',NULL),(94,0,'8',4,'image/jpeg',217862,'products/8.jpg','[]','2022-01-03 21:21:11','2022-01-03 21:21:11',NULL),(95,0,'9-1',4,'image/jpeg',65624,'products/9-1.jpg','[]','2022-01-03 21:21:12','2022-01-03 21:21:12',NULL),(96,0,'9',4,'image/jpeg',159636,'products/9.jpg','[]','2022-01-03 21:21:12','2022-01-03 21:21:12',NULL),(97,0,'1',5,'image/jpeg',82629,'news/1.jpg','[]','2022-01-03 21:21:15','2022-01-03 21:21:15',NULL),(98,0,'10',5,'image/jpeg',342651,'news/10.jpg','[]','2022-01-03 21:21:15','2022-01-03 21:21:15',NULL),(99,0,'11',5,'image/jpeg',296740,'news/11.jpg','[]','2022-01-03 21:21:15','2022-01-03 21:21:15',NULL),(100,0,'2',5,'image/jpeg',119904,'news/2.jpg','[]','2022-01-03 21:21:16','2022-01-03 21:21:16',NULL),(101,0,'3',5,'image/jpeg',89543,'news/3.jpg','[]','2022-01-03 21:21:16','2022-01-03 21:21:16',NULL),(102,0,'4',5,'image/jpeg',51573,'news/4.jpg','[]','2022-01-03 21:21:16','2022-01-03 21:21:16',NULL),(103,0,'5',5,'image/jpeg',41164,'news/5.jpg','[]','2022-01-03 21:21:16','2022-01-03 21:21:16',NULL),(104,0,'6',5,'image/jpeg',80696,'news/6.jpg','[]','2022-01-03 21:21:16','2022-01-03 21:21:16',NULL),(105,0,'7',5,'image/jpeg',904027,'news/7.jpg','[]','2022-01-03 21:21:16','2022-01-03 21:21:16',NULL),(106,0,'8',5,'image/jpeg',351088,'news/8.jpg','[]','2022-01-03 21:21:17','2022-01-03 21:21:17',NULL),(107,0,'9',5,'image/jpeg',353751,'news/9.jpg','[]','2022-01-03 21:21:17','2022-01-03 21:21:17',NULL),(108,0,'1',6,'image/jpeg',2733,'testimonials/1.jpg','[]','2022-01-03 21:21:18','2022-01-03 21:21:18',NULL),(109,0,'2',6,'image/jpeg',2840,'testimonials/2.jpg','[]','2022-01-03 21:21:18','2022-01-03 21:21:18',NULL),(110,0,'3',6,'image/jpeg',3065,'testimonials/3.jpg','[]','2022-01-03 21:21:18','2022-01-03 21:21:18',NULL),(111,0,'4',6,'image/jpeg',2559,'testimonials/4.jpg','[]','2022-01-03 21:21:18','2022-01-03 21:21:18',NULL),(112,0,'1',7,'image/jpeg',98636,'sliders/1.jpg','[]','2022-01-03 21:21:18','2022-01-03 21:21:18',NULL),(113,0,'2',7,'image/jpeg',22560,'sliders/2.jpg','[]','2022-01-03 21:21:19','2022-01-03 21:21:19',NULL),(114,0,'3',7,'image/jpeg',21630,'sliders/3.jpg','[]','2022-01-03 21:21:19','2022-01-03 21:21:19',NULL),(115,0,'american-express',8,'image/png',3209,'general/american-express.png','[]','2022-01-03 21:21:20','2022-01-03 21:21:20',NULL),(116,0,'b-1',8,'image/jpeg',20539,'general/b-1.jpg','[]','2022-01-03 21:21:20','2022-01-03 21:21:20',NULL),(117,0,'b-2',8,'image/jpeg',18320,'general/b-2.jpg','[]','2022-01-03 21:21:20','2022-01-03 21:21:20',NULL),(118,0,'b-3',8,'image/jpeg',42872,'general/b-3.jpg','[]','2022-01-03 21:21:20','2022-01-03 21:21:20',NULL),(119,0,'discover',8,'image/png',2494,'general/discover.png','[]','2022-01-03 21:21:21','2022-01-03 21:21:21',NULL),(120,0,'favicon',8,'image/png',1803,'general/favicon.png','[]','2022-01-03 21:21:21','2022-01-03 21:21:21',NULL),(121,0,'logo-light',8,'image/png',3736,'general/logo-light.png','[]','2022-01-03 21:21:21','2022-01-03 21:21:21',NULL),(122,0,'logo',8,'image/png',3927,'general/logo.png','[]','2022-01-03 21:21:21','2022-01-03 21:21:21',NULL),(123,0,'master-card',8,'image/png',3407,'general/master-card.png','[]','2022-01-03 21:21:21','2022-01-03 21:21:21',NULL),(124,0,'newsletter',8,'image/jpeg',48929,'general/newsletter.jpg','[]','2022-01-03 21:21:22','2022-01-03 21:21:22',NULL),(125,0,'paypal',8,'image/png',2670,'general/paypal.png','[]','2022-01-03 21:21:22','2022-01-03 21:21:22',NULL),(126,0,'visa',8,'image/png',2841,'general/visa.png','[]','2022-01-03 21:21:22','2022-01-03 21:21:22',NULL);
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_folders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'brands','brands',0,'2022-01-03 21:20:42','2022-01-03 21:20:42',NULL),(2,0,'product-categories','product-categories',0,'2022-01-03 21:20:43','2022-01-03 21:20:43',NULL),(3,0,'customers','customers',0,'2022-01-03 21:20:45','2022-01-03 21:20:45',NULL),(4,0,'products','products',0,'2022-01-03 21:20:47','2022-01-03 21:20:47',NULL),(5,0,'news','news',0,'2022-01-03 21:21:15','2022-01-03 21:21:15',NULL),(6,0,'testimonials','testimonials',0,'2022-01-03 21:21:18','2022-01-03 21:21:18',NULL),(7,0,'sliders','sliders',0,'2022-01-03 21:21:18','2022-01-03 21:21:18',NULL),(8,0,'general','general',0,'2022-01-03 21:21:20','2022-01-03 21:21:20',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_locations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2022-01-03 21:21:20','2022-01-03 21:21:20'),(2,5,'main-menu','2022-01-03 21:21:20','2022-01-03 21:21:20');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_nodes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0,
  `reference_id` int(10) unsigned DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(2,1,0,NULL,NULL,'/products',NULL,0,'Products',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(3,1,0,NULL,NULL,'#',NULL,0,'Shop',NULL,'_self',1,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(4,1,3,1,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/television',NULL,0,'Product Category',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(5,1,3,1,'Botble\\Ecommerce\\Models\\Brand','/brands/fashion-live',NULL,0,'Brand',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(6,1,3,1,'Botble\\Ecommerce\\Models\\ProductTag','/product-tags/electronic',NULL,0,'Product Tag',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(7,1,3,NULL,NULL,'products/beat-headphone',NULL,0,'Product Single',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(8,1,0,3,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog',NULL,'_self',1,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(9,1,8,3,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog Left Sidebar',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(10,1,8,1,'Botble\\Blog\\Models\\Category','/news/ecommerce',NULL,0,'Blog Category',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(11,1,8,1,'Botble\\Blog\\Models\\Tag','/tags/general',NULL,0,'Blog Tag',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(12,1,8,NULL,NULL,'news/4-expert-tips-on-how-to-choose-the-right-mens-wallet',NULL,0,'Blog Single',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(13,1,0,5,'Botble\\Page\\Models\\Page','/faq',NULL,0,'FAQ',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(14,1,0,2,'Botble\\Page\\Models\\Page','/contact-us',NULL,0,'Contact',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(15,2,0,4,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About Us',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(16,2,0,5,'Botble\\Page\\Models\\Page','/faq',NULL,0,'FAQ',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(17,2,0,6,'Botble\\Page\\Models\\Page','/location',NULL,0,'Location',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(18,2,0,7,'Botble\\Page\\Models\\Page','/affiliates',NULL,0,'Affiliates',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(19,2,0,2,'Botble\\Page\\Models\\Page','/contact-us',NULL,0,'Contact',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(20,3,0,1,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/television',NULL,0,'Television',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(21,3,0,2,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/home-audio-theaters',NULL,0,'Mobile',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(22,3,0,3,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/tv-videos',NULL,0,'Headphone',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(23,3,0,4,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/camera-photos-videos',NULL,0,'Watches',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(24,3,0,5,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/cellphones-accessories',NULL,0,'Game',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(25,4,0,NULL,NULL,'/customer/overview',NULL,0,'My profile',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(26,4,0,NULL,NULL,'/wishlist',NULL,0,'Wishlist',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(27,4,0,NULL,NULL,'customer/orders',NULL,0,'Orders',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(28,4,0,NULL,NULL,'/orders/tracking',NULL,0,'Order tracking',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(29,5,0,NULL,NULL,'/',NULL,0,'Trang chủ',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(30,5,0,NULL,NULL,'/products',NULL,0,'Sản phẩm',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(31,5,0,NULL,NULL,'#',NULL,0,'Cửa hàng',NULL,'_self',1,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(32,5,31,1,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/television',NULL,0,'Danh mục sản phẩm',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(33,5,31,1,'Botble\\Ecommerce\\Models\\Brand','/brands/fashion-live',NULL,0,'Thương hiệu',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(34,5,31,1,'Botble\\Ecommerce\\Models\\ProductTag','/product-tags/electronic',NULL,0,'Tag sản phẩm',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(35,5,31,NULL,NULL,'products/beat-headphone',NULL,0,'Sản phẩm chi tiết',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(36,5,0,3,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Tin tức',NULL,'_self',1,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(37,5,36,3,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog Left Sidebar',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(38,5,36,5,'Botble\\Blog\\Models\\Category',NULL,NULL,0,'Danh mục',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(39,5,36,6,'Botble\\Blog\\Models\\Tag',NULL,NULL,0,'Tag bài viết',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(40,5,36,NULL,NULL,'news/vi/4-expert-tips-on-how-to-choose-the-right-mens-wallet',NULL,0,'Bài viết chi tiết',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(41,5,0,5,'Botble\\Page\\Models\\Page','/faq',NULL,0,'FAQ',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(42,5,0,2,'Botble\\Page\\Models\\Page','/contact-us',NULL,0,'Liên hệ',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(43,6,0,4,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'Về chúng tôi',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(44,6,0,5,'Botble\\Page\\Models\\Page','/faq',NULL,0,'Hỏi đáp',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(45,6,0,6,'Botble\\Page\\Models\\Page','/location',NULL,0,'Vị trí',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(46,6,0,7,'Botble\\Page\\Models\\Page','/affiliates',NULL,0,'Chi nhánh',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(47,6,0,2,'Botble\\Page\\Models\\Page','/contact-us',NULL,0,'Liên hệ',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(48,7,0,1,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/television',NULL,0,'Tivi',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(49,7,0,2,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/home-audio-theaters',NULL,0,'Di động',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(50,7,0,3,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/tv-videos',NULL,0,'Tai nghe',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(51,7,0,4,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/camera-photos-videos',NULL,0,'Đồng hồ',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(52,7,0,5,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/cellphones-accessories',NULL,0,'Trò chơi',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(53,8,0,NULL,NULL,'/customer/overview',NULL,0,'Tài khoản của tôi',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(54,8,0,NULL,NULL,'/wishlist',NULL,0,'Danh sách yêu thích',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(55,8,0,NULL,NULL,'customer/orders',NULL,0,'Đơn hàng',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20'),(56,8,0,NULL,NULL,'/orders/tracking',NULL,0,'Theo dõi đơn hàng',NULL,'_self',0,'2022-01-03 21:21:20','2022-01-03 21:21:20');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2022-01-03 21:21:20','2022-01-03 21:21:20'),(2,'Useful Links','useful-links','published','2022-01-03 21:21:20','2022-01-03 21:21:20'),(3,'Categories','categories','published','2022-01-03 21:21:20','2022-01-03 21:21:20'),(4,'My Account','my-account','published','2022-01-03 21:21:20','2022-01-03 21:21:20'),(5,'Menu chính','menu-chinh','published','2022-01-03 21:21:20','2022-01-03 21:21:20'),(6,'Liên kết hữu ích','lien-ket-huu-ich','published','2022-01-03 21:21:20','2022-01-03 21:21:20'),(7,'Danh mục','danh-muc','published','2022-01-03 21:21:20','2022-01-03 21:21:20'),(8,'Tài khoản','tai-khoan','published','2022-01-03 21:21:20','2022-01-03 21:21:20');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_boxes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_id` int(10) unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'icon','[\"flaticon-tv\"]',1,'Botble\\Ecommerce\\Models\\ProductCategory','2022-01-03 21:20:45','2022-01-03 21:20:45'),(2,'icon','[\"flaticon-responsive\"]',10,'Botble\\Ecommerce\\Models\\ProductCategory','2022-01-03 21:20:45','2022-01-03 21:20:45'),(3,'icon','[\"flaticon-headphones\"]',14,'Botble\\Ecommerce\\Models\\ProductCategory','2022-01-03 21:20:45','2022-01-03 21:20:45'),(4,'icon','[\"flaticon-watch\"]',19,'Botble\\Ecommerce\\Models\\ProductCategory','2022-01-03 21:20:45','2022-01-03 21:20:45'),(5,'icon','[\"flaticon-console\"]',24,'Botble\\Ecommerce\\Models\\ProductCategory','2022-01-03 21:20:45','2022-01-03 21:20:45'),(6,'icon','[\"flaticon-camera\"]',25,'Botble\\Ecommerce\\Models\\ProductCategory','2022-01-03 21:20:45','2022-01-03 21:20:45'),(7,'icon','[\"flaticon-music-system\"]',26,'Botble\\Ecommerce\\Models\\ProductCategory','2022-01-03 21:20:45','2022-01-03 21:20:45'),(8,'icon','[\"flaticon-responsive\"]',27,'Botble\\Ecommerce\\Models\\ProductCategory','2022-01-03 21:20:45','2022-01-03 21:20:45'),(9,'icon','[\"flaticon-plugins\"]',28,'Botble\\Ecommerce\\Models\\ProductCategory','2022-01-03 21:20:45','2022-01-03 21:20:45'),(10,'icon','[\"flaticon-music-system\"]',29,'Botble\\Ecommerce\\Models\\ProductCategory','2022-01-03 21:20:45','2022-01-03 21:20:45'),(11,'icon','[\"flaticon-monitor\"]',30,'Botble\\Ecommerce\\Models\\ProductCategory','2022-01-03 21:20:45','2022-01-03 21:20:45'),(12,'icon','[\"flaticon-printer\"]',31,'Botble\\Ecommerce\\Models\\ProductCategory','2022-01-03 21:20:45','2022-01-03 21:20:45'),(13,'icon','[\"flaticon-tv\"]',32,'Botble\\Ecommerce\\Models\\ProductCategory','2022-01-03 21:20:45','2022-01-03 21:20:45'),(14,'icon','[\"flaticon-fax\"]',33,'Botble\\Ecommerce\\Models\\ProductCategory','2022-01-03 21:20:45','2022-01-03 21:20:45'),(15,'icon','[\"flaticon-mouse\"]',34,'Botble\\Ecommerce\\Models\\ProductCategory','2022-01-03 21:20:45','2022-01-03 21:20:45'),(16,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',1,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(17,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',2,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(18,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',3,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(19,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',4,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(20,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',5,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(21,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',6,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(22,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',7,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(23,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',8,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(24,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',9,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(25,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',10,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(26,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',11,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(27,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',12,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(28,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',13,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(29,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',14,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(30,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',15,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(31,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',16,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(32,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',17,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(33,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',18,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(34,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',19,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(35,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',20,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(36,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',21,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(37,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',22,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(38,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',23,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(39,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',24,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(40,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',25,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(41,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',26,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(42,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',27,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(43,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',28,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(44,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',29,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(45,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',30,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(46,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',31,'Botble\\Ecommerce\\Models\\Product','2022-01-03 21:21:13','2022-01-03 21:21:13'),(47,'button_text','[\"Shop now\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-01-03 21:21:19','2022-01-03 21:21:19'),(48,'button_text','[\"Discover now\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-01-03 21:21:19','2022-01-03 21:21:19'),(49,'button_text','[\"Shop now\"]',3,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-01-03 21:21:19','2022-01-03 21:21:19'),(50,'button_text','[\"Mua ngay\"]',4,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-01-03 21:21:19','2022-01-03 21:21:19'),(51,'button_text','[\"Kh\\u00e1m ph\\u00e1 ngay\"]',5,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-01-03 21:21:19','2022-01-03 21:21:19'),(52,'button_text','[\"Mua ngay\"]',6,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-01-03 21:21:19','2022-01-03 21:21:19');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_04_09_032329_create_base_tables',1),(2,'2013_04_09_062329_create_revisions_table',1),(3,'2014_10_12_000000_create_users_table',1),(4,'2014_10_12_100000_create_password_resets_table',1),(5,'2016_06_10_230148_create_acl_tables',1),(6,'2016_06_14_230857_create_menus_table',1),(7,'2016_06_28_221418_create_pages_table',1),(8,'2016_10_05_074239_create_setting_table',1),(9,'2016_11_28_032840_create_dashboard_widget_tables',1),(10,'2016_12_16_084601_create_widgets_table',1),(11,'2017_05_09_070343_create_media_tables',1),(12,'2017_11_03_070450_create_slug_table',1),(13,'2019_01_05_053554_create_jobs_table',1),(14,'2019_05_03_000001_create_customer_columns',1),(15,'2019_05_03_000002_create_subscriptions_table',1),(16,'2019_05_03_000003_create_subscription_items_table',1),(17,'2019_08_19_000000_create_failed_jobs_table',1),(18,'2021_12_26_024330_update_theme_options_social_links',1),(19,'2020_11_18_150916_ads_create_ads_table',2),(20,'2021_12_02_035301_add_ads_translations_table',2),(21,'2015_06_29_025744_create_audit_history',3),(22,'2015_06_18_033822_create_blog_table',4),(23,'2021_02_16_092633_remove_default_value_for_author_type',4),(24,'2021_12_03_030600_create_blog_translations',4),(25,'2016_06_17_091537_create_contacts_table',5),(26,'2020_03_05_041139_create_ecommerce_tables',6),(27,'2020_09_22_135635_update_taxes_table',6),(28,'2020_09_29_101006_add_views_into_ec_products_table',6),(29,'2020_10_01_152311_make_column_image_in_product_attributes_table_nullable',6),(30,'2020_10_06_073439_improve_ecommerce_database',6),(31,'2020_11_01_040415_update_table_ec_order_addresses',6),(32,'2020_11_04_091510_make_column_phone_in_order_addresses_nullable',6),(33,'2020_11_30_015801_update_table_ec_product_categories',6),(34,'2021_01_01_044147_ecommerce_create_flash_sale_table',6),(35,'2021_01_17_082713_add_column_is_featured_to_product_collections_table',6),(36,'2021_01_18_024333_add_zip_code_into_table_customer_addresses',6),(37,'2021_02_18_073505_update_table_ec_reviews',6),(38,'2021_03_10_024419_add_column_confirmed_at_to_table_ec_customers',6),(39,'2021_03_10_025153_change_column_tax_amount',6),(40,'2021_03_20_033103_add_column_availability_to_table_ec_products',6),(41,'2021_04_28_074008_ecommerce_create_product_label_table',6),(42,'2021_05_31_173037_ecommerce_create_ec_products_translations',6),(43,'2021_06_28_153141_correct_slugs_data',6),(44,'2021_08_17_105016_remove_column_currency_id_in_some_tables',6),(45,'2021_08_30_142128_add_images_column_to_ec_reviews_table',6),(46,'2021_09_01_115151_remove_unused_fields_in_ec_products',6),(47,'2021_10_04_030050_add_column_created_by_to_table_ec_products',6),(48,'2021_10_05_122616_add_status_column_to_ec_customers_table',6),(49,'2021_11_03_025806_nullable_phone_number_in_ec_customer_addresses',6),(50,'2021_11_23_071403_correct_languages_for_product_variations',6),(51,'2021_11_28_031808_add_product_tags_translations',6),(52,'2021_12_01_031123_add_featured_image_to_ec_products',6),(53,'2022_01_01_033107_update_table_ec_shipments',6),(54,'2018_07_09_221238_create_faq_table',7),(55,'2021_12_03_082134_create_faq_translations',7),(56,'2016_10_03_032336_create_languages_table',8),(57,'2021_10_25_021023_fix-priority-load-for-language-advanced',9),(58,'2021_12_03_075608_create_page_translations',9),(59,'2017_10_24_154832_create_newsletter_table',10),(60,'2017_05_18_080441_create_payment_tables',11),(61,'2021_03_27_144913_add_customer_type_into_table_payments',11),(62,'2021_05_24_034720_make_column_currency_nullable',11),(63,'2021_08_09_161302_add_metadata_column_to_payments_table',11),(64,'2021_10_19_020859_update_metadata_field',11),(65,'2017_07_11_140018_create_simple_slider_table',12),(66,'2018_07_09_214610_create_testimonial_table',13),(67,'2021_12_03_083642_create_testimonials_translations',13),(68,'2016_10_07_193005_create_translations_table',14),(69,'2022_02_16_042457_improve_product_attribute_sets',15),(70,'2019_11_18_061011_create_country_table',16),(71,'2021_12_03_084118_create_location_translations',16),(72,'2021_12_03_094518_migrate_old_location_data',16),(73,'2021_12_10_034440_switch_plugin_location_to_use_language_advanced',16),(74,'2022_01_16_085908_improve_plugin_location',16);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletters` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage','<div>[simple-slider key=\"home-slider\"][/simple-slider]</div><div>[featured-product-categories title=\"Top Categories\" subtitle=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim Nullam nunc varius.\"][/featured-product-categories]</div><div>[flash-sale title=\"Best deals for you\"][/flash-sale]</div><div>[product-collections title=\"Exclusive Products\"][/product-collections]</div><div>[theme-ads key_1=\"IZ6WU8KUALYD\" key_2=\"ILSFJVYFGCPZ\" key_3=\"ZDOZUZZIU7FT\"][/theme-ads]</div><div>[trending-products title=\"Trending Products\"][[/trending-products]</div><div>[product-blocks featured_product_title=\"Featured Products\" top_rated_product_title=\"Top Rated Products\" on_sale_product_title=\"On Sale Products\"][/product-blocks]</div><div>[featured-brands title=\"Our Brands\"][/featured-brands]</div><div>[featured-news title=\"Visit Our Blog\" subtitle=\"Our Blog updated the newest trend of the world regularly\"][/featured-news]</div><div>[testimonials title=\"Our Client Say!\"][/testimonials]</div><div>[our-features icon1=\"flaticon-shipped\" title1=\"Free Delivery\" subtitle1=\"Free shipping on all US order or order above $200\" icon2=\"flaticon-money-back\" title2=\"30 Day Returns Guarantee\" subtitle2=\"Simply return it within 30 days for an exchange\" icon3=\"flaticon-support\" title3=\"27/4 Online Support\" subtitle3=\"Contact us 24 hours a day, 7 days a week\"][/our-features]</div><div>[newsletter-form title=\"Join Our Newsletter Now\" subtitle=\"Register now to get updates on promotions.\"][/newsletter-form]</div>',1,NULL,'homepage',0,NULL,'published','2022-01-03 21:21:19','2022-01-03 21:21:19'),(2,'Contact us','<p>[contact-form][/contact-form]</p>',1,NULL,'default',0,NULL,'published','2022-01-03 21:21:19','2022-01-03 21:21:19'),(3,'Blog','<p>---</p>',1,NULL,'blog-sidebar',0,NULL,'published','2022-01-03 21:21:19','2022-01-03 21:21:19'),(4,'About us','<p>ARE you doing out here? Run home this moment, and fetch me a pair of white kid gloves while she was now about two feet high: even then she heard a little queer, won\'t you?\' \'Not a bit,\' she thought of herself, \'I wish you would have called him a fish)--and rapped loudly at the top of it. She stretched herself up on tiptoe, and peeped over the verses on his flappers, \'--Mystery, ancient and modern, with Seaography: then Drawling--the Drawling-master was an old Crab took the cauldron of soup off.</p>',1,NULL,'default',0,NULL,'published','2022-01-03 21:21:19','2022-01-03 21:21:19'),(5,'FAQ','<div>[faqs][/faqs]</div>',1,NULL,'default',0,NULL,'published','2022-01-03 21:21:19','2022-01-03 21:21:19'),(6,'Location','<p>Mouse. \'Of course,\' the Dodo could not answer without a porpoise.\' \'Wouldn\'t it really?\' said Alice in a day or two: wouldn\'t it be of any one; so, when the White Rabbit, trotting slowly back to the Dormouse, and repeated her question. \'Why did they live at the time they were playing the Queen had only one who had not gone far before they saw the Mock Turtle. \'No, no! The adventures first,\' said the Queen to play croquet.\' The Frog-Footman repeated, in the direction it pointed to, without.</p>',1,NULL,'default',0,NULL,'published','2022-01-03 21:21:19','2022-01-03 21:21:19'),(7,'Affiliates','<p>He sent them word I had not a moment like a writing-desk?\' \'Come, we shall have somebody to talk about trouble!\' said the Footman. \'That\'s the most confusing thing I ask! It\'s always six o\'clock now.\' A bright idea came into her eyes; and once she remembered how small she was terribly frightened all the jurymen are back in a tone of delight, which changed into alarm in another minute the whole head appeared, and then a voice she had read several nice little histories about children who had.</p>',1,NULL,'default',0,NULL,'published','2022-01-03 21:21:19','2022-01-03 21:21:19'),(8,'Brands','<p>[all-brands][/all-brands]</p>',1,NULL,'default',0,NULL,'published','2022-01-03 21:21:19','2022-01-03 21:21:19'),(9,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,'default',0,NULL,'published','2022-01-03 21:21:19','2022-01-03 21:21:19');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
INSERT INTO `pages_translations` VALUES ('vi',1,'Trang chủ',NULL,'<div>[simple-slider key=\"slider-trang-chu\"][/simple-slider]</div><div>[featured-product-categories title=\"Danh mục nổi bật\" subtitle=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim Nullam nunc varius.\"][/featured-product-categories]</div><div>[flash-sale title=\"Khuyến mãi tốt nhất cho bạn\"][/flash-sale]</div><div>[product-collections title=\"Sản phẩm độc quyền\"][/product-collections]</div><div>[theme-ads key_1=\"IZ6WU8KUALYD\" key_2=\"ILSFJVYFGCPZ\" key_3=\"ZDOZUZZIU7FT\"][/theme-ads]</div><div>[trending-products title=\"Sản phẩm xu hướng\"][[/trending-products]</div><div>[product-blocks featured_product_title=\"Nổi bật\" top_rated_product_title=\"Xếp hạng cao nhất\" on_sale_product_title=\"Đang khuyến mãi\"][/product-blocks]</div><div>[featured-brands title=\"Thương hiệu\"][/featured-brands]</div><div>[featured-news title=\"Tin tức\" subtitle=\"Blog của chúng tôi cập nhật các xu hướng mới nhất của thế giới thường xuyên\"][/featured-news]</div><div>[testimonials title=\"Nhận xét từ khách hàng!\"][/testimonials]</div><div>[our-features icon1=\"flaticon-shipped\" title1=\"Miễn phí vận chuyển\" subtitle1=\"Giao hàng miễn phí cho tất cả các đơn đặt hàng tại Hoa Kỳ hoặc đơn hàng trên $200\" icon2=\"flaticon-money-back\" title2=\"Đảm bảo hoàn trả trong 30 ngày\" subtitle2=\"Chỉ cần trả lại nó trong vòng 30 ngày để đổi\" icon3=\"flaticon-support\" title3=\"Hỗ trợ trực tuyến 27/4\" subtitle3=\"Liên hệ với chúng tôi 24 giờ một ngày, 7 ngày một tuần\"][/our-features]</div><div>[newsletter-form title=\"Theo dõi bản tin ngay bây giờ\" subtitle=\"Đăng ký ngay để cập nhật các chương trình khuyến mãi.\"][/newsletter-form]</div>'),('vi',2,'Liên hệ',NULL,'<p>[contact-form][/contact-form]</p>'),('vi',3,'Tin tức',NULL,'<p>---</p>'),('vi',4,'Về chúng tôi',NULL,'<p>When she got up in a soothing tone: \'don\'t be angry about it. And yet I don\'t keep the same thing with you,\' said the Cat, and vanished again. Alice waited till she was looking up into a line along the passage into the court, arm-in-arm with the edge of the March Hare took the hookah out of the Mock Turtle, capering wildly about. \'Change lobsters again!\' yelled the Gryphon hastily. \'Go on with the end of the moment they saw the White Rabbit, jumping up and straightening itself out again, so.</p>'),('vi',5,'Câu hỏi thường gặp',NULL,'<div>[faqs][/faqs]</div>'),('vi',6,'Vị trí',NULL,'<p>Queen, and Alice could hardly hear the rattle of the court. \'What do you know why it\'s called a whiting?\' \'I never heard it before,\' said Alice,) and round goes the clock in a very deep well. Either the well was very deep, or she should chance to be told so. \'It\'s really dreadful,\' she muttered to herself, rather sharply; \'I advise you to leave it behind?\' She said the March Hare: she thought it would be the right way to hear her try and repeat \"\'TIS THE VOICE OF THE SLUGGARD,\"\' said the.</p>'),('vi',7,'Chi nhánh',NULL,'<p>Wonderland of long ago: and how she would have this cat removed!\' The Queen smiled and passed on. \'Who ARE you doing out here? Run home this moment, and fetch me a good deal: this fireplace is narrow, to be a great deal too flustered to tell them something more. \'You promised to tell me your history, you know,\' the Mock Turtle to the Gryphon. Alice did not dare to laugh; and, as she spoke--fancy CURTSEYING as you\'re falling through the glass, and she at once without waiting for turns.</p>'),('vi',8,'Thương hiệu',NULL,'<p>[all-brands][/all-brands]</p>'),('vi',9,'Chính sách cookie',NULL,'<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>');
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `charge_id` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` int(10) unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'USD',0,'2APTDTUHSV','mollie',NULL,1606.00,1,'completed','confirm',5,NULL,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38','Botble\\Ecommerce\\Models\\Customer',NULL),(2,'USD',0,'C2AIWIVJGY','cod',NULL,735.70,2,'pending','confirm',7,NULL,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38','Botble\\Ecommerce\\Models\\Customer',NULL),(3,'USD',0,'LZDDXHIKH4','paystack',NULL,483.90,3,'completed','confirm',2,NULL,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38','Botble\\Ecommerce\\Models\\Customer',NULL),(4,'USD',0,'8HXZZ1WVR4','cod',NULL,624.80,4,'pending','confirm',10,NULL,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38','Botble\\Ecommerce\\Models\\Customer',NULL),(5,'USD',0,'2EDICT1CJI','paypal',NULL,1542.80,5,'completed','confirm',1,NULL,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38','Botble\\Ecommerce\\Models\\Customer',NULL),(6,'USD',0,'I2JGOWBSRX','bank_transfer',NULL,956.90,6,'pending','confirm',11,NULL,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38','Botble\\Ecommerce\\Models\\Customer',NULL),(7,'USD',0,'L0JTAPUBT1','bank_transfer',NULL,660.00,7,'pending','confirm',3,NULL,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38','Botble\\Ecommerce\\Models\\Customer',NULL),(8,'USD',0,'4ZRFXVMTVC','paystack',NULL,430.50,8,'completed','confirm',2,NULL,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38','Botble\\Ecommerce\\Models\\Customer',NULL),(9,'USD',0,'RWKZ2QZ2TF','razorpay',NULL,1330.00,9,'completed','confirm',2,NULL,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38','Botble\\Ecommerce\\Models\\Customer',NULL),(10,'USD',0,'5LHFDAQ0VU','cod',NULL,276.10,10,'pending','confirm',4,NULL,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38','Botble\\Ecommerce\\Models\\Customer',NULL),(11,'USD',0,'BHAV2ACTNP','paypal',NULL,240.35,11,'completed','confirm',3,NULL,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38','Botble\\Ecommerce\\Models\\Customer',NULL),(12,'USD',0,'P0DYAKSRCQ','cod',NULL,1965.50,12,'pending','confirm',5,NULL,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38','Botble\\Ecommerce\\Models\\Customer',NULL),(13,'USD',0,'HOTVQZBXQV','stripe',NULL,1533.90,13,'completed','confirm',11,NULL,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38','Botble\\Ecommerce\\Models\\Customer',NULL),(14,'USD',0,'JDSVLIQCVA','cod',NULL,304.50,14,'pending','confirm',9,NULL,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38','Botble\\Ecommerce\\Models\\Customer',NULL),(15,'USD',0,'D0YK2XUATR','razorpay',NULL,608.55,15,'completed','confirm',6,NULL,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38','Botble\\Ecommerce\\Models\\Customer',NULL),(16,'USD',0,'ITV5GFHYC2','bank_transfer',NULL,284.50,16,'pending','confirm',10,NULL,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38','Botble\\Ecommerce\\Models\\Customer',NULL),(17,'USD',0,'ICLAB2LIUN','bank_transfer',NULL,1069.80,17,'pending','confirm',6,NULL,NULL,'2022-03-20 07:06:38','2022-03-20 07:06:38','Botble\\Ecommerce\\Models\\Customer',NULL),(18,'USD',0,'27GJFAOFXJ','mollie',NULL,426.70,18,'completed','confirm',6,NULL,NULL,'2022-03-20 07:06:39','2022-03-20 07:06:39','Botble\\Ecommerce\\Models\\Customer',NULL),(19,'USD',0,'Y7ZUNXAWY0','mollie',NULL,518.83,19,'completed','confirm',3,NULL,NULL,'2022-03-20 07:06:39','2022-03-20 07:06:39','Botble\\Ecommerce\\Models\\Customer',NULL),(20,'USD',0,'QYI2DYBBDZ','stripe',NULL,745.90,20,'completed','confirm',11,NULL,NULL,'2022-03-20 07:06:39','2022-03-20 07:06:39','Botble\\Ecommerce\\Models\\Customer',NULL);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (1,2,1),(2,4,1),(3,1,2),(4,4,2),(5,2,3),(6,4,3),(7,1,4),(8,3,4),(9,1,5),(10,4,5),(11,2,6),(12,3,6),(13,1,7),(14,4,7),(15,2,8),(16,3,8),(17,1,9),(18,3,9),(19,1,10),(20,4,10),(21,1,11),(22,3,11);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(10) unsigned NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,1,2),(7,2,2),(8,3,2),(9,4,2),(10,5,2),(11,1,3),(12,2,3),(13,3,3),(14,4,3),(15,5,3),(16,1,4),(17,2,4),(18,3,4),(19,4,4),(20,5,4),(21,1,5),(22,2,5),(23,3,5),(24,4,5),(25,5,5),(26,1,6),(27,2,6),(28,3,6),(29,4,6),(30,5,6),(31,1,7),(32,2,7),(33,3,7),(34,4,7),(35,5,7),(36,1,8),(37,2,8),(38,3,8),(39,4,8),(40,5,8),(41,1,9),(42,2,9),(43,3,9),(44,4,9),(45,5,9),(46,1,10),(47,2,10),(48,3,10),(49,4,10),(50,5,10),(51,1,11),(52,2,11),(53,3,11),(54,4,11),(55,5,11);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(10) unsigned NOT NULL DEFAULT 0,
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'4 Expert Tips On How To Choose The Right Men’s Wallet','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/1.jpg',2163,NULL,'2022-01-03 21:21:18','2022-01-03 21:21:18'),(2,'Sexy Clutches: How to Buy & Wear a Designer Clutch Bag','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/2.jpg',2330,NULL,'2022-01-03 21:21:18','2022-01-03 21:21:18'),(3,'The Top 2020 Handbag Trends to Know','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/3.jpg',2472,NULL,'2022-01-03 21:21:18','2022-01-03 21:21:18'),(4,'How to Match the Color of Your Handbag With an Outfit','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/4.jpg',1217,NULL,'2022-01-03 21:21:18','2022-01-03 21:21:18'),(5,'How to Care for Leather Bags','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/5.jpg',859,NULL,'2022-01-03 21:21:18','2022-01-03 21:21:18'),(6,'We\'re Crushing Hard on Summer\'s 10 Biggest Bag Trends','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/6.jpg',1040,NULL,'2022-01-03 21:21:18','2022-01-03 21:21:18'),(7,'Essential Qualities of Highly Successful Music','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/7.jpg',227,NULL,'2022-01-03 21:21:18','2022-01-03 21:21:18'),(8,'9 Things I Love About Shaving My Head','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/8.jpg',1301,NULL,'2022-01-03 21:21:18','2022-01-03 21:21:18'),(9,'Why Teamwork Really Makes The Dream Work','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/9.jpg',725,NULL,'2022-01-03 21:21:18','2022-01-03 21:21:18'),(10,'The World Caters to Average People','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/10.jpg',1185,NULL,'2022-01-03 21:21:18','2022-01-03 21:21:18'),(11,'The litigants on the screen are not actors','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',0,'news/11.jpg',1710,NULL,'2022-01-03 21:21:18','2022-01-03 21:21:18');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
INSERT INTO `posts_translations` VALUES ('vi',1,'4 Lời khuyên của Chuyên gia về Cách Chọn Ví Nam Phù hợp','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',2,'Sexy Clutches: Cách Mua & Đeo Túi Clutch Thiết kế','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',3,'Xu hướng túi xách hàng đầu năm 2020 cần biết','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',4,'Cách Phối Màu Túi Xách Của Bạn Với Trang Phục','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',5,'Cách Chăm sóc Túi Da','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',6,'Chúng tôi đang nghiền ngẫm 10 xu hướng túi lớn nhất của mùa hè','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',7,'Những phẩm chất cần thiết của âm nhạc thành công cao','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',8,'9 điều tôi thích khi cạo đầu','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',9,'Tại sao làm việc theo nhóm thực sự biến giấc mơ thành công','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',10,'Thế giới phục vụ cho những người trung bình','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',11,'Các đương sự trên màn hình không phải là diễn viên','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n');
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `created_by` int(10) unsigned NOT NULL,
  `updated_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'activated_plugins','[\"language\",\"language-advanced\",\"ads\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"ecommerce\",\"faq\",\"newsletter\",\"payment\",\"paystack\",\"razorpay\",\"simple-slider\",\"social-login\",\"sslcommerz\",\"testimonial\",\"translation\",\"mollie\",\"location\"]',NULL,NULL),(2,'payment_cod_status','1',NULL,NULL),(3,'payment_bank_transfer_status','1',NULL,NULL),(4,'language_hide_default','1',NULL,NULL),(5,'language_switcher_display','dropdown',NULL,NULL),(6,'language_display','all',NULL,NULL),(7,'language_hide_languages','[]',NULL,NULL),(8,'media_random_hash','ba362a7282ed7e9a37b747a1b63459b8',NULL,NULL),(9,'permalink-botble-blog-models-post','news',NULL,NULL),(10,'permalink-botble-blog-models-category','news',NULL,NULL),(11,'permalink-botble-blog-models-tag','tags',NULL,NULL),(12,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,NULL),(13,'payment_bank_transfer_description','Please send money to our bank account: ACB - 1990 404 19.',NULL,NULL),(14,'plugins_ecommerce_customer_new_order_status','0',NULL,NULL),(15,'plugins_ecommerce_admin_new_order_status','0',NULL,NULL),(19,'New York','Singapore',NULL,NULL),(24,'ecommerce_store_name','Shopwise',NULL,NULL),(25,'ecommerce_store_phone','123-456-7890',NULL,NULL),(26,'ecommerce_store_address','123 Street, Old Trafford',NULL,NULL),(27,'ecommerce_store_state','New York',NULL,NULL),(28,'ecommerce_store_city','New York',NULL,NULL),(29,'ecommerce_store_country','US',NULL,NULL),(30,'admin_logo','general/logo-light.png',NULL,NULL),(31,'admin_favicon','general/favicon.png',NULL,NULL),(32,'theme','shopwise',NULL,NULL),(33,'theme-shopwise-site_title','Shopwise - Laravel Ecommerce system',NULL,NULL),(34,'theme-shopwise-copyright','© 2022 Botble Technologies. All Rights Reserved.',NULL,NULL),(35,'theme-shopwise-favicon','general/favicon.png',NULL,NULL),(36,'theme-shopwise-logo','general/logo.png',NULL,NULL),(37,'theme-shopwise-logo_footer','general/logo-light.png',NULL,NULL),(38,'theme-shopwise-address','123 Street, Old Trafford, NewYork, USA',NULL,NULL),(39,'theme-shopwise-hotline','123-456-7890',NULL,NULL),(40,'theme-shopwise-email','info@sitename.com',NULL,NULL),(41,'theme-shopwise-payment_methods','[\"general\\/visa.png\",\"general\\/paypal.png\",\"general\\/master-card.png\",\"general\\/discover.png\",\"general\\/american-express.png\"]',NULL,NULL),(42,'theme-shopwise-newsletter_image','general/newsletter.jpg',NULL,NULL),(43,'theme-shopwise-homepage_id','1',NULL,NULL),(44,'theme-shopwise-blog_page_id','3',NULL,NULL),(45,'theme-shopwise-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,NULL),(46,'theme-shopwise-cookie_consent_learn_more_url','http://shopwise.test/cookie-policy',NULL,NULL),(47,'theme-shopwise-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(48,'theme-shopwise-about-us','If you are going to use of Lorem Ipsum need to be sure there isn\'t hidden of text',NULL,NULL),(49,'theme-shopwise-vi-primary_font','Roboto Condensed',NULL,NULL),(50,'theme-shopwise-vi-copyright','© 2021 Botble Technologies. Tất cả quyền đã được bảo hộ.',NULL,NULL),(51,'theme-shopwise-vi-cookie_consent_message','Trải nghiệm của bạn trên trang web này sẽ được cải thiện bằng cách cho phép cookie ',NULL,NULL),(52,'theme-shopwise-vi-cookie_consent_learn_more_url','http://shopwise.test/cookie-policy',NULL,NULL),(53,'theme-shopwise-vi-cookie_consent_learn_more_text','Chính sách cookie',NULL,NULL),(54,'theme-shopwise-vi-homepage_id','1',NULL,NULL),(55,'theme-shopwise-vi-blog_page_id','3',NULL,NULL),(56,'theme-shopwise-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"ion-social-facebook\"},{\"key\":\"social-url\",\"value\":\"\"},{\"key\":\"social-color\",\"value\":\"#3b5998\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"ion-social-twitter\"},{\"key\":\"social-url\",\"value\":\"\"},{\"key\":\"social-color\",\"value\":\"#00acee\"}],[{\"key\":\"social-name\",\"value\":\"Youtube\"},{\"key\":\"social-icon\",\"value\":\"ion-social-youtube\"},{\"key\":\"social-url\",\"value\":\"\"},{\"key\":\"social-color\",\"value\":\"#c4302b\"}],[{\"key\":\"social-name\",\"value\":\"Instagram\"},{\"key\":\"social-icon\",\"value\":\"ion-social-instagram\"},{\"key\":\"social-url\",\"value\":\"\"},{\"key\":\"social-color\",\"value\":\"#3f729b\"}]]',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_slider_items`
--

DROP TABLE IF EXISTS `simple_slider_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_slider_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `simple_slider_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_slider_items`
--

LOCK TABLES `simple_slider_items` WRITE;
/*!40000 ALTER TABLE `simple_slider_items` DISABLE KEYS */;
INSERT INTO `simple_slider_items` VALUES (1,1,'Woman Fashion','sliders/1.jpg',NULL,'Get up to 50% off Today Only!',1,'2022-01-03 21:21:19','2022-01-03 21:21:19'),(2,1,'Man Fashion','sliders/2.jpg',NULL,'50% off in all products',2,'2022-01-03 21:21:19','2022-01-03 21:21:19'),(3,1,'Summer Sale','sliders/3.jpg',NULL,'Taking your Viewing Experience to Next Level',3,'2022-01-03 21:21:19','2022-01-03 21:21:19'),(4,2,'Thời trang Nam','sliders/1.jpg',NULL,'Được giảm giá tới 50% Chỉ hôm nay!',1,'2022-01-03 21:21:19','2022-01-03 21:21:19'),(5,2,'Thời trang Nữ','sliders/2.jpg',NULL,'Khuyến mãi 50% tất cả sản phẩm',2,'2022-01-03 21:21:19','2022-01-03 21:21:19'),(6,2,'Khuyến mãi hè','sliders/3.jpg',NULL,'Nâng trải nghiệm xem của bạn lên cấp độ tiếp theo',3,'2022-01-03 21:21:19','2022-01-03 21:21:19');
/*!40000 ALTER TABLE `simple_slider_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_sliders`
--

DROP TABLE IF EXISTS `simple_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_sliders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_sliders`
--

LOCK TABLES `simple_sliders` WRITE;
/*!40000 ALTER TABLE `simple_sliders` DISABLE KEYS */;
INSERT INTO `simple_sliders` VALUES (1,'Home slider','home-slider',NULL,'published','2022-01-03 21:21:19','2022-01-03 21:21:19'),(2,'Slider trang chủ','slider-trang-chu',NULL,'published','2022-01-03 21:21:19','2022-01-03 21:21:19');
/*!40000 ALTER TABLE `simple_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slugs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int(10) unsigned NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'fashion-live',1,'Botble\\Ecommerce\\Models\\Brand','brands','2022-01-03 21:20:43','2022-01-03 21:20:43'),(2,'hand-crafted',2,'Botble\\Ecommerce\\Models\\Brand','brands','2022-01-03 21:20:43','2022-01-03 21:20:43'),(3,'mestonix',3,'Botble\\Ecommerce\\Models\\Brand','brands','2022-01-03 21:20:43','2022-01-03 21:20:43'),(4,'sunshine',4,'Botble\\Ecommerce\\Models\\Brand','brands','2022-01-03 21:20:43','2022-01-03 21:20:43'),(5,'pure',5,'Botble\\Ecommerce\\Models\\Brand','brands','2022-01-03 21:20:43','2022-01-03 21:20:43'),(6,'anfold',6,'Botble\\Ecommerce\\Models\\Brand','brands','2022-01-03 21:20:43','2022-01-03 21:20:43'),(7,'automotive',7,'Botble\\Ecommerce\\Models\\Brand','brands','2022-01-03 21:20:43','2022-01-03 21:20:43'),(8,'television',1,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(9,'home-audio-theaters',2,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(10,'tv-videos',3,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(11,'camera-photos-videos',4,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(12,'cellphones-accessories',5,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(13,'headphones',6,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(14,'videos-games',7,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(15,'wireless-speakers',8,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(16,'office-electronic',9,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(17,'mobile',10,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(18,'digital-cables',11,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(19,'audio-video-cables',12,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(20,'batteries',13,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(21,'headphone',14,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(22,'computer-tablets',15,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(23,'laptop',16,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(24,'monitors',17,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(25,'computer-components',18,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(26,'watches',19,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(27,'drive-storages',20,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(28,'gaming-laptop',21,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(29,'security-protection',22,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(30,'accessories',23,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(31,'game',24,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(32,'camera',25,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(33,'audio',26,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(34,'mobile-tablet',27,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(35,'accessories',28,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(36,'home-audio-theater',29,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(37,'tv-smart-box',30,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(38,'printer',31,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(39,'computer',32,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(40,'fax-machine',33,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(41,'mouse',34,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-01-03 21:20:45','2022-01-03 21:20:45'),(42,'smart-home-speaker',1,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(43,'headphone-ultra-bass',2,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(44,'boxed-bluetooth-headphone',3,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(45,'chikie-bluetooth-speaker',4,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(46,'camera-hikvision-hk-35vs8',5,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(47,'camera-samsung-ss-24',6,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(48,'leather-watch-band',7,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(49,'apple-iphone-13-plus',8,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(50,'macbook-pro-2015',9,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(51,'macbook-air-12-inch',10,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(52,'apple-watch-serial-7',11,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(53,'macbook-pro-13-inch',12,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(54,'apple-keyboard',13,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(55,'macsafe-80w',14,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(56,'hand-playstation',15,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(57,'apple-airpods-serial-3',16,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(58,'cool-smart-watches',17,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(59,'black-smart-watches',18,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(60,'leather-watch-band-serial-3',19,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(61,'macbook-pro-2015-13-inch',20,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(62,'historic-alarm-clock',21,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(63,'black-glasses',22,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(64,'phillips-mouse',23,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(65,'gaming-keyboard',24,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(66,'dual-camera-20mp',25,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(67,'smart-watches',26,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(68,'beat-headphone',27,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(69,'red-black-headphone',28,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(70,'audio-equipment',29,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(71,'smart-televisions',30,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(72,'samsung-smart-tv',31,'Botble\\Ecommerce\\Models\\Product','products','2022-01-03 21:21:13','2022-01-03 21:21:13'),(73,'electronic',1,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-01-03 21:21:14','2022-01-03 21:21:14'),(74,'mobile',2,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-01-03 21:21:14','2022-01-03 21:21:14'),(75,'iphone',3,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-01-03 21:21:14','2022-01-03 21:21:14'),(76,'printer',4,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-01-03 21:21:14','2022-01-03 21:21:14'),(77,'office',5,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-01-03 21:21:14','2022-01-03 21:21:14'),(78,'it',6,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-01-03 21:21:14','2022-01-03 21:21:14'),(79,'ecommerce',1,'Botble\\Blog\\Models\\Category','news','2022-01-03 21:21:18','2022-01-03 21:21:19'),(80,'fashion',2,'Botble\\Blog\\Models\\Category','news','2022-01-03 21:21:18','2022-01-03 21:21:19'),(81,'electronic',3,'Botble\\Blog\\Models\\Category','news','2022-01-03 21:21:18','2022-01-03 21:21:19'),(82,'commercial',4,'Botble\\Blog\\Models\\Category','news','2022-01-03 21:21:18','2022-01-03 21:21:19'),(83,'general',1,'Botble\\Blog\\Models\\Tag','tags','2022-01-03 21:21:18','2022-01-03 21:21:19'),(84,'design',2,'Botble\\Blog\\Models\\Tag','tags','2022-01-03 21:21:18','2022-01-03 21:21:19'),(85,'fashion',3,'Botble\\Blog\\Models\\Tag','tags','2022-01-03 21:21:18','2022-01-03 21:21:19'),(86,'branding',4,'Botble\\Blog\\Models\\Tag','tags','2022-01-03 21:21:18','2022-01-03 21:21:19'),(87,'modern',5,'Botble\\Blog\\Models\\Tag','tags','2022-01-03 21:21:18','2022-01-03 21:21:19'),(88,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',1,'Botble\\Blog\\Models\\Post','news','2022-01-03 21:21:18','2022-01-03 21:21:19'),(89,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',2,'Botble\\Blog\\Models\\Post','news','2022-01-03 21:21:18','2022-01-03 21:21:19'),(90,'the-top-2020-handbag-trends-to-know',3,'Botble\\Blog\\Models\\Post','news','2022-01-03 21:21:18','2022-01-03 21:21:19'),(91,'how-to-match-the-color-of-your-handbag-with-an-outfit',4,'Botble\\Blog\\Models\\Post','news','2022-01-03 21:21:18','2022-01-03 21:21:19'),(92,'how-to-care-for-leather-bags',5,'Botble\\Blog\\Models\\Post','news','2022-01-03 21:21:18','2022-01-03 21:21:19'),(93,'were-crushing-hard-on-summers-10-biggest-bag-trends',6,'Botble\\Blog\\Models\\Post','news','2022-01-03 21:21:18','2022-01-03 21:21:19'),(94,'essential-qualities-of-highly-successful-music',7,'Botble\\Blog\\Models\\Post','news','2022-01-03 21:21:18','2022-01-03 21:21:19'),(95,'9-things-i-love-about-shaving-my-head',8,'Botble\\Blog\\Models\\Post','news','2022-01-03 21:21:18','2022-01-03 21:21:19'),(96,'why-teamwork-really-makes-the-dream-work',9,'Botble\\Blog\\Models\\Post','news','2022-01-03 21:21:18','2022-01-03 21:21:19'),(97,'the-world-caters-to-average-people',10,'Botble\\Blog\\Models\\Post','news','2022-01-03 21:21:18','2022-01-03 21:21:19'),(98,'the-litigants-on-the-screen-are-not-actors',11,'Botble\\Blog\\Models\\Post','news','2022-01-03 21:21:18','2022-01-03 21:21:19'),(99,'homepage',1,'Botble\\Page\\Models\\Page','','2022-01-03 21:21:19','2022-01-03 21:21:19'),(100,'contact-us',2,'Botble\\Page\\Models\\Page','','2022-01-03 21:21:19','2022-01-03 21:21:19'),(101,'blog',3,'Botble\\Page\\Models\\Page','','2022-01-03 21:21:19','2022-01-03 21:21:19'),(102,'about-us',4,'Botble\\Page\\Models\\Page','','2022-01-03 21:21:19','2022-01-03 21:21:19'),(103,'faq',5,'Botble\\Page\\Models\\Page','','2022-01-03 21:21:19','2022-01-03 21:21:19'),(104,'location',6,'Botble\\Page\\Models\\Page','','2022-01-03 21:21:19','2022-01-03 21:21:19'),(105,'affiliates',7,'Botble\\Page\\Models\\Page','','2022-01-03 21:21:19','2022-01-03 21:21:19'),(106,'brands',8,'Botble\\Page\\Models\\Page','','2022-01-03 21:21:19','2022-01-03 21:21:19'),(107,'cookie-policy',9,'Botble\\Page\\Models\\Page','','2022-01-03 21:21:19','2022-01-03 21:21:19');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abbreviation` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_backup`
--

DROP TABLE IF EXISTS `states_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states_backup` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abbreviation` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_backup`
--

LOCK TABLES `states_backup` WRITE;
/*!40000 ALTER TABLE `states_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_translations`
--

DROP TABLE IF EXISTS `states_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `states_id` int(11) NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_translations`
--

LOCK TABLES `states_translations` WRITE;
/*!40000 ALTER TABLE `states_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_items`
--

DROP TABLE IF EXISTS `subscription_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) unsigned NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_product` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_items`
--

LOCK TABLES `subscription_items` WRITE;
/*!40000 ALTER TABLE `subscription_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'General',1,'Botble\\ACL\\Models\\User','','published','2022-01-03 21:21:18','2022-01-03 21:21:18'),(2,'Design',1,'Botble\\ACL\\Models\\User','','published','2022-01-03 21:21:18','2022-01-03 21:21:18'),(3,'Fashion',1,'Botble\\ACL\\Models\\User','','published','2022-01-03 21:21:18','2022-01-03 21:21:18'),(4,'Branding',1,'Botble\\ACL\\Models\\User','','published','2022-01-03 21:21:18','2022-01-03 21:21:18'),(5,'Modern',1,'Botble\\ACL\\Models\\User','','published','2022-01-03 21:21:18','2022-01-03 21:21:18');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
INSERT INTO `tags_translations` VALUES ('vi',1,'Chung',NULL),('vi',2,'Thiết kế',NULL),('vi',3,'Thời trang',NULL),('vi',4,'Thương hiệu',NULL),('vi',5,'Hiện đại',NULL);
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testimonials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Adam Williams','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','testimonials/1.jpg','CEO Of Microsoft','published','2022-01-03 21:21:18','2022-01-03 21:21:18'),(2,'Retha Deowalim','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','testimonials/2.jpg','CEO Of Apple','published','2022-01-03 21:21:18','2022-01-03 21:21:18'),(3,'Sam J. Wasim','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','testimonials/3.jpg','Pio Founder','published','2022-01-03 21:21:18','2022-01-03 21:21:18'),(4,'Usan Gulwarm','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','testimonials/4.jpg','CEO Of Facewarm','published','2022-01-03 21:21:18','2022-01-03 21:21:18');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials_translations`
--

DROP TABLE IF EXISTS `testimonials_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonials_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`testimonials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials_translations`
--

LOCK TABLES `testimonials_translations` WRITE;
/*!40000 ALTER TABLE `testimonials_translations` DISABLE KEYS */;
INSERT INTO `testimonials_translations` VALUES ('vi',1,'Adam Williams',NULL,'Giám đốc Microsoft'),('vi',2,'Retha Deowalim',NULL,'Giám đốc Apple'),('vi',3,'Sam J. Wasim',NULL,'Nhà sáng lập Pio'),('vi',4,'Usan Gulwarm',NULL,'Giám đốc Facewarm');
/*!40000 ALTER TABLE `testimonials_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4192 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_meta` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` int(10) unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT 0,
  `manage_supers` tinyint(1) NOT NULL DEFAULT 0,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_stripe_id_index` (`stripe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@botble.com',NULL,'$2y$10$Hkbdp.lY6Oyl1kzhjMWCTu7dw901W5nBW.mvIWCt3qjQLYSNfqsY6',NULL,'2022-01-03 21:21:19','2022-01-03 21:21:19','System','Admin','botble',NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'CustomMenuWidget','footer_sidebar','shopwise',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Useful Links\",\"menu_id\":\"useful-links\"}','2022-01-03 21:21:20','2022-01-03 21:21:20'),(2,'CustomMenuWidget','footer_sidebar','shopwise',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"Categories\",\"menu_id\":\"categories\"}','2022-01-03 21:21:20','2022-01-03 21:21:20'),(3,'CustomMenuWidget','footer_sidebar','shopwise',3,'{\"id\":\"CustomMenuWidget\",\"name\":\"My Account\",\"menu_id\":\"my-account\"}','2022-01-03 21:21:20','2022-01-03 21:21:20'),(4,'CustomMenuWidget','footer_sidebar','shopwise-vi',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Li\\u00ean k\\u1ebft h\\u1eefu \\u00edch\",\"menu_id\":\"lien-ket-huu-ich\"}','2022-01-03 21:21:20','2022-01-03 21:21:20'),(5,'CustomMenuWidget','footer_sidebar','shopwise-vi',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"Danh m\\u1ee5c\",\"menu_id\":\"danh-muc\"}','2022-01-03 21:21:20','2022-01-03 21:21:20'),(6,'CustomMenuWidget','footer_sidebar','shopwise-vi',3,'{\"id\":\"CustomMenuWidget\",\"name\":\"T\\u00e0i kho\\u1ea3n\",\"menu_id\":\"tai-khoan\"}','2022-01-03 21:21:20','2022-01-03 21:21:20');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-20 21:06:39
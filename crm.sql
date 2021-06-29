/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.4.18-MariaDB : Database - crm2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`crm2` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `crm2`;

/*Table structure for table `cities` */

DROP TABLE IF EXISTS `cities`;

CREATE TABLE `cities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cities` */

insert  into `cities`(`id`,`city`,`updated_at`,`created_at`) values 
(1,'Beograd',NULL,NULL),
(2,'Niš',NULL,NULL),
(3,'Novi Sad',NULL,NULL),
(4,'Kostolac','2021-05-11 17:13:18','2021-05-11 17:13:18'),
(22,'Lazarevac','2021-05-15 12:55:20','2021-05-15 12:55:20'),
(23,'Prokuplje','2021-05-15 12:56:26','2021-05-15 12:56:26');

/*Table structure for table `companies` */

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` bigint(20) unsigned DEFAULT NULL,
  `staff_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companies_city_id_foreign` (`city_id`),
  KEY `companies_staff_id_foreign` (`staff_id`),
  CONSTRAINT `companies_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `companies` */

insert  into `companies`(`id`,`company`,`address`,`address2`,`website_url`,`city_id`,`staff_id`,`created_at`,`updated_at`) values 
(6,'Delta Holding','Jurija Gagarina 82',NULL,'deltaholding.com',1,2,NULL,'2021-05-17 14:31:58'),
(19,'Delta Holding Unlimited','Jurija Gagarina 86',NULL,'deltaholding2.com',22,2,'2021-05-15 11:22:14','2021-05-16 10:52:42'),
(33,'Delta Holding Unlimited 10','Jurija Gagarina 90',NULL,'deltaholding9.com',2,2,'2021-05-16 11:22:42','2021-05-17 14:24:40'),
(34,'IDJ tunes','Ruzveltova 32',NULL,'idjtunes.com',23,2,'2021-05-16 12:12:24','2021-05-19 09:52:05'),
(35,'Erste Young','Airport City 32',NULL,'ersteyoung.com',1,5,'2021-05-16 12:39:48','2021-05-16 12:39:48'),
(36,'Hemofarm','Veselina Masleše 24',NULL,'hemofram@hemofarm.com',2,3,'2021-05-17 11:40:01','2021-05-19 09:49:10'),
(38,'IDJ tunes y','Veselina Masleše 24',NULL,'akterakter.com',22,2,'2021-05-21 08:43:20','2021-05-21 08:46:54');

/*Table structure for table `contacts` */

DROP TABLE IF EXISTS `contacts`;

CREATE TABLE `contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deal_size` double DEFAULT NULL,
  `follow_up_date` date DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stage_id` bigint(20) unsigned DEFAULT NULL,
  `staff_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contacts_stage_id_foreign` (`stage_id`),
  KEY `contacts_company_id_foreign` (`company_id`),
  KEY `contacts_staff_id_foreign` (`staff_id`),
  CONSTRAINT `contacts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `contacts_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `contacts_stage_id_foreign` FOREIGN KEY (`stage_id`) REFERENCES `stages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `contacts` */

insert  into `contacts`(`id`,`first_name`,`last_name`,`title`,`deal_size`,`follow_up_date`,`phone`,`email`,`contact_method`,`notes`,`stage_id`,`staff_id`,`company_id`,`created_at`,`updated_at`) values 
(1,'Janko','Kapikula','HR',99000,'2021-09-04','062/165-1422','jankokapikula@dh.com','phone',NULL,2,2,19,NULL,'2021-05-16 11:22:46'),
(2,'Sandra','Jovanovic','Zvezda',75000,'2021-07-24','065/143-5667','sandra@hotmail.com','email',NULL,1,2,34,'2021-05-16 12:12:30','2021-05-28 14:24:24'),
(3,'Ruđer','Bošković','IT consultant',85000,'2021-09-25','067/163-5543','rudjer@ey.rs','email',NULL,4,5,35,'2021-05-16 12:39:51','2021-05-16 12:39:51'),
(6,'Jovan','Jovanovic','HR',120000,'2021-05-18','063/145-1789','jovan@gmail.com','email',NULL,1,2,36,'2021-05-18 10:57:47','2021-05-21 08:42:38'),
(7,'Anabela','Karanovic','IT',123556,'2021-05-28','068/123-456','anabela@gmail.com','email',NULL,4,2,33,'2021-05-18 10:58:40','2021-05-19 09:47:56'),
(9,'Ivan','Pavlović','Biznis analitičar',36980,'2021-06-30','065/143-5667','ivan.pavlovic@gmail.com','phone',NULL,3,2,6,'2021-05-28 14:26:35','2021-05-28 14:26:35'),
(10,'asdasd','sfsdf','asdfasdf',90876,'2021-05-28','068/123-456','milos1998@hotmail.com','email',NULL,1,2,6,'2021-05-28 14:31:14','2021-05-28 14:31:14');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2016_06_01_000001_create_oauth_auth_codes_table',1),
(2,'2016_06_01_000002_create_oauth_access_tokens_table',1),
(3,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),
(4,'2016_06_01_000004_create_oauth_clients_table',1),
(5,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),
(6,'2021_03_22_211320_create_staff_table',1),
(7,'2021_03_22_212001_create_stages_table',1),
(8,'2021_03_22_213000_create_companies_table',1),
(9,'2021_03_22_213131_create_contacts_table',1),
(10,'2021_03_23_155447_adds_api_token_to_staff_table',1),
(11,'2021_05_11_154307_create_cities_table',1),
(12,'2021_05_11_161054_add_foreign_keys_to_companies',1),
(13,'2021_05_11_161716_add_foreign_key_to_contacts',1);

/*Table structure for table `oauth_access_tokens` */

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_access_tokens` */

/*Table structure for table `oauth_auth_codes` */

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_auth_codes` */

/*Table structure for table `oauth_clients` */

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_clients` */

/*Table structure for table `oauth_personal_access_clients` */

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_personal_access_clients` */

/*Table structure for table `oauth_refresh_tokens` */

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_refresh_tokens` */

/*Table structure for table `staff` */

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `manager_id` bigint(20) unsigned DEFAULT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `staff_email_unique` (`email`),
  UNIQUE KEY `staff_api_token_unique` (`api_token`),
  KEY `staff_manager_id_foreign` (`manager_id`),
  CONSTRAINT `staff_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `staff` */

insert  into `staff`(`id`,`created_at`,`updated_at`,`name`,`email`,`password`,`role`,`status`,`manager_id`,`api_token`) values 
(1,'0000-00-00','2021-05-28','Ivan Ivanović','ivan.ivanovic@gmail.com','ivan','manager',1,NULL,'3d75c83e6c34bc04da28023951bfa48ad8b463e08e5fb9520ffb8d0b6c193dab'),
(2,'0000-00-00','2021-05-28','Marko Marković','marko.markovic@gmail.com','marko','sales',1,1,'a9c36602ff24565402d6ca8a9e68a03c8c9f58214e28d93c506d91a36636ef6c'),
(4,'0000-00-00','2021-05-16','Jovana Jovanović','jovana.jovanovic@gmail.com','jovana','manager',1,NULL,'fc677c949c315f79724130abdf0bf879a044a4aa137f6d1ff058cb3a1529ae9b'),
(5,'0000-00-00','2021-05-16','Igor Igić','igor.igic@gmail.com','igor','sales',1,4,'2708f2a24a3f2a8beaeb86b26b073affac69fea3940944156a6df2f36d71e7dd'),
(6,'0000-00-00',NULL,'Katarina Kučić','katarina.kucic@gmail.com','katarina','sales',1,4,NULL),
(7,'2021-05-19','2021-05-19','Kevin Spejsi','kevin@kevin.org','kevin','sales',1,NULL,NULL),
(8,'2021-05-21','2021-05-21','Janko','Janković','janko','sales',1,NULL,'dc61284410bda593bc8f38fb9f5332ba1ef462a9ef88f8f0802ad92902b11c33'),
(9,'2021-05-21','2021-05-21','Slobodan Cvijovic','slobodan@gmail.com','slobodan','sales',1,NULL,NULL),
(18,'2021-05-21','2021-05-21','Milorad Mandić','milorad@gmail.com','milorad','sales',1,1,NULL);

/*Table structure for table `stages` */

DROP TABLE IF EXISTS `stages`;

CREATE TABLE `stages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `stages` */

insert  into `stages`(`id`,`stage`) values 
(1,'1. Prospect (10%)'),
(2,'2. Forecast (50%)'),
(3,'3. Forecast (80%)'),
(4,'4. Won/Closed (100%)');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

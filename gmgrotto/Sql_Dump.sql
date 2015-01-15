# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.38)
# Database: gmg
# Generation Time: 2015-01-15 03:22:02 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table char_attacks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `char_attacks`;

CREATE TABLE `char_attacks` (
  `attackId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `charId` int(11) NOT NULL,
  `attack_name` varchar(25) NOT NULL DEFAULT '',
  `attack_score` int(2) NOT NULL,
  PRIMARY KEY (`attackId`),
  KEY `charid` (`charId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `char_attacks` WRITE;
/*!40000 ALTER TABLE `char_attacks` DISABLE KEYS */;

INSERT INTO `char_attacks` (`attackId`, `charId`, `attack_name`, `attack_score`)
VALUES
	(1,3,'Punch',14),
	(2,3,'Bite',8),
	(3,4,'Blast',5);

/*!40000 ALTER TABLE `char_attacks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table char_comb
# ------------------------------------------------------------

DROP TABLE IF EXISTS `char_comb`;

CREATE TABLE `char_comb` (
  `charId` int(11) unsigned NOT NULL,
  `initiative` int(2) NOT NULL,
  `defense` int(2) NOT NULL,
  `gen_attack` int(2) NOT NULL,
  `melee` int(2) NOT NULL,
  `ranged` int(2) NOT NULL,
  `tough` int(2) NOT NULL,
  `fort` int(2) NOT NULL,
  `ref` int(2) NOT NULL,
  `will` int(2) NOT NULL,
  PRIMARY KEY (`charId`),
  CONSTRAINT `char_comb_ibfk_1` FOREIGN KEY (`charId`) REFERENCES `charList` (`charId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `char_comb` WRITE;
/*!40000 ALTER TABLE `char_comb` DISABLE KEYS */;

INSERT INTO `char_comb` (`charId`, `initiative`, `defense`, `gen_attack`, `melee`, `ranged`, `tough`, `fort`, `ref`, `will`)
VALUES
	(3,9,15,6,6,6,10,10,5,6),
	(4,14,18,5,5,8,5,6,11,6);

/*!40000 ALTER TABLE `char_comb` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table charList
# ------------------------------------------------------------

DROP TABLE IF EXISTS `charList`;

CREATE TABLE `charList` (
  `charId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `charName` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`charId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `charList` WRITE;
/*!40000 ALTER TABLE `charList` DISABLE KEYS */;

INSERT INTO `charList` (`charId`, `userId`, `charName`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(3,'2','Atlanta','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(4,'2','Traveller','','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `charList` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `files`;

CREATE TABLE `files` (
  `fileId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `file_ext` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;

INSERT INTO `files` (`fileId`, `userId`, `filename`, `file_ext`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(28,'2','She','jpg','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(38,'2','ScreenShot','png','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(39,'2','PowerPoint','pptx','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(40,'2','SuperStar','gif','','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`migration`, `batch`)
VALUES
	('2015_01_12_002131_table_setup',1),
	('2015_01_12_002600_create_session_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;

INSERT INTO `sessions` (`id`, `payload`, `last_activity`)
VALUES
	('86bddf5d1e61a8a7f7d5d348cc73a2bfee5fbb49','YTo2OntzOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NjoiX3Rva2VuIjtzOjQwOiJUam9LOVVXQVQyQWxaM2pZWmZrbjBJN3JIQk1MeWo2cTJ3ZHNacXVGIjtzOjM4OiJsb2dpbl84MmU1ZDJjNTZiZGQwODExMzE4ZjBjZjA3OGI3OGJmYyI7aToyO3M6MzoidWlkIjtpOjI7czo1OiJ1bmFtZSI7czozOiJ1c3MiO3M6OToiX3NmMl9tZXRhIjthOjM6e3M6MToidSI7aToxNDIxMjkxMjcyO3M6MToiYyI7aToxNDIxMjg2NTEzO3M6MToibCI7czoxOiIwIjt9fQ==',1421291272);

/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table textpad
# ------------------------------------------------------------

DROP TABLE IF EXISTS `textpad`;

CREATE TABLE `textpad` (
  `textId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastSave` text COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`textId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `email`, `username`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'testing@gmail.com','thisUser','$2y$10$pr.kbI26/hEpnuY9AczXb.I.Mefi6ryHpqQefBCNUgpxTSjiPSgmC','','2015-01-12 00:42:40','2015-01-12 00:42:40'),
	(2,'a@gmail.com','uss','$2y$10$6RMH.GK1L0nA/f3Eqf9JbePgbTA3S/R6KUyFibPlvqGcPY9IS14R6','GNcVabiUSeFdpWENMamSaqb97LpCzBKODxg51hWRXkp7gR8aSAR463UkOraW','2015-01-12 00:47:27','2015-01-14 00:38:34');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

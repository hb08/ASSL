# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.38)
# Database: gmg
# Generation Time: 2015-01-23 02:41:49 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table char_abilities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `char_abilities`;

CREATE TABLE `char_abilities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `char_id` int(11) unsigned DEFAULT NULL,
  `str_rank` int(11) DEFAULT NULL,
  `str_mod` int(11) DEFAULT NULL,
  `dex_rank` int(11) DEFAULT NULL,
  `dex_mod` int(11) DEFAULT NULL,
  `con_rank` int(11) DEFAULT NULL,
  `con_mod` int(11) DEFAULT NULL,
  `int_rank` int(11) DEFAULT NULL,
  `int_mod` int(11) DEFAULT NULL,
  `wis_rank` int(11) DEFAULT NULL,
  `wis_mod` int(11) DEFAULT NULL,
  `cha_rank` int(11) DEFAULT NULL,
  `cha_mod` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `char_id` (`char_id`),
  CONSTRAINT `char_abilities_ibfk_1` FOREIGN KEY (`char_id`) REFERENCES `charList` (`charId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

LOCK TABLES `char_abilities` WRITE;
/*!40000 ALTER TABLE `char_abilities` DISABLE KEYS */;

INSERT INTO `char_abilities` (`id`, `char_id`, `str_rank`, `str_mod`, `dex_rank`, `dex_mod`, `con_rank`, `con_mod`, `int_rank`, `int_mod`, `wis_rank`, `wis_mod`, `cha_rank`, `cha_mod`)
VALUES
	(24,35,16,3,12,1,18,4,18,4,10,0,18,4);

/*!40000 ALTER TABLE `char_abilities` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table char_attacks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `char_attacks`;

CREATE TABLE `char_attacks` (
  `attackId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `charId` int(11) unsigned NOT NULL,
  `attack_name` varchar(25) NOT NULL DEFAULT '',
  `attack_score` int(2) NOT NULL,
  PRIMARY KEY (`attackId`),
  KEY `charid` (`charId`),
  CONSTRAINT `char_attacks_ibfk_1` FOREIGN KEY (`charId`) REFERENCES `charList` (`charId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

LOCK TABLES `char_attacks` WRITE;
/*!40000 ALTER TABLE `char_attacks` DISABLE KEYS */;

INSERT INTO `char_attacks` (`attackId`, `charId`, `attack_name`, `attack_score`)
VALUES
	(27,35,'Knives',10);

/*!40000 ALTER TABLE `char_attacks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table char_basic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `char_basic`;

CREATE TABLE `char_basic` (
  `charId` int(11) unsigned NOT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `power_level` int(11) DEFAULT NULL,
  `power_points` int(11) DEFAULT NULL,
  `affiliation` varchar(11) DEFAULT NULL,
  `ff` tinyint(1) NOT NULL DEFAULT '0',
  `hero_total` int(11) DEFAULT NULL,
  `hero_current` int(11) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`charId`),
  CONSTRAINT `char_basic_ibfk_1` FOREIGN KEY (`charId`) REFERENCES `charList` (`charId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `char_basic` WRITE;
/*!40000 ALTER TABLE `char_basic` DISABLE KEYS */;

INSERT INTO `char_basic` (`charId`, `real_name`, `power_level`, `power_points`, `affiliation`, `ff`, `hero_total`, `hero_current`, `height`, `weight`, `age`)
VALUES
	(35,'Jack Brown',10,155,'Force Ops',0,5,0,'5\'11\"','180lbs',27);

/*!40000 ALTER TABLE `char_basic` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table char_comb
# ------------------------------------------------------------

DROP TABLE IF EXISTS `char_comb`;

CREATE TABLE `char_comb` (
  `charId` int(11) unsigned NOT NULL,
  `initiative` int(2) NOT NULL,
  `gen_attack` int(2) NOT NULL,
  `knockback` int(11) DEFAULT NULL,
  `tough` int(2) NOT NULL,
  `defense` int(2) NOT NULL,
  `grapple` int(11) DEFAULT NULL,
  `melee` int(2) NOT NULL,
  `ranged` int(2) NOT NULL,
  `will` int(2) NOT NULL,
  `fort` int(2) NOT NULL,
  `ref` int(2) NOT NULL,
  PRIMARY KEY (`charId`),
  CONSTRAINT `char_comb_ibfk_1` FOREIGN KEY (`charId`) REFERENCES `charList` (`charId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `char_comb` WRITE;
/*!40000 ALTER TABLE `char_comb` DISABLE KEYS */;

INSERT INTO `char_comb` (`charId`, `initiative`, `gen_attack`, `knockback`, `tough`, `defense`, `grapple`, `melee`, `ranged`, `will`, `fort`, `ref`)
VALUES
	(35,7,7,5,5,18,5,7,7,4,3,6);

/*!40000 ALTER TABLE `char_comb` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table char_drawbacks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `char_drawbacks`;

CREATE TABLE `char_drawbacks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `char_id` int(11) unsigned NOT NULL,
  `drawback` varchar(255) DEFAULT NULL,
  `db_cost` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `char_id` (`char_id`),
  CONSTRAINT `char_drawbacks_ibfk_1` FOREIGN KEY (`char_id`) REFERENCES `charList` (`charId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;



# Dump of table char_feats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `char_feats`;

CREATE TABLE `char_feats` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `char_id` int(11) unsigned NOT NULL,
  `feat_id` int(11) unsigned NOT NULL,
  `feat_ranks` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `feat_id` (`feat_id`),
  KEY `char_id` (`char_id`),
  CONSTRAINT `char_feats_ibfk_3` FOREIGN KEY (`char_id`) REFERENCES `charList` (`charId`) ON DELETE CASCADE,
  CONSTRAINT `char_feats_ibfk_2` FOREIGN KEY (`feat_id`) REFERENCES `featsList` (`feat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

LOCK TABLES `char_feats` WRITE;
/*!40000 ALTER TABLE `char_feats` DISABLE KEYS */;

INSERT INTO `char_feats` (`id`, `char_id`, `feat_id`, `feat_ranks`)
VALUES
	(49,35,2,1),
	(50,35,3,1),
	(51,35,5,1),
	(52,35,11,1),
	(53,35,12,1),
	(54,35,13,1);

/*!40000 ALTER TABLE `char_feats` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table char_powers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `char_powers`;

CREATE TABLE `char_powers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `char_id` int(11) unsigned NOT NULL,
  `power_id` int(11) unsigned NOT NULL,
  `power_ranks` int(10) unsigned NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `power_id` (`power_id`),
  KEY `char_id` (`char_id`),
  CONSTRAINT `char_powers_ibfk_2` FOREIGN KEY (`power_id`) REFERENCES `powersList` (`power_id`),
  CONSTRAINT `char_powers_ibfk_3` FOREIGN KEY (`char_id`) REFERENCES `charList` (`charId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

LOCK TABLES `char_powers` WRITE;
/*!40000 ALTER TABLE `char_powers` DISABLE KEYS */;

INSERT INTO `char_powers` (`id`, `char_id`, `power_id`, `power_ranks`, `notes`)
VALUES
	(34,35,3,4,'Linked To Death Touch'),
	(35,35,25,2,''),
	(36,35,4,8,'Linked to Death Touch');

/*!40000 ALTER TABLE `char_powers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table char_skills
# ------------------------------------------------------------

DROP TABLE IF EXISTS `char_skills`;

CREATE TABLE `char_skills` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `charId` int(11) unsigned NOT NULL,
  `skill_Id` int(11) unsigned NOT NULL,
  `skill_total` int(11) DEFAULT NULL,
  `skill_ranks` int(11) NOT NULL,
  `skill_abil` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `skill_Id` (`skill_Id`),
  KEY `charId` (`charId`),
  CONSTRAINT `char_skills_ibfk_1` FOREIGN KEY (`skill_Id`) REFERENCES `skillsList` (`skill_id`),
  CONSTRAINT `char_skills_ibfk_2` FOREIGN KEY (`charId`) REFERENCES `charList` (`charId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

LOCK TABLES `char_skills` WRITE;
/*!40000 ALTER TABLE `char_skills` DISABLE KEYS */;

INSERT INTO `char_skills` (`id`, `charId`, `skill_Id`, `skill_total`, `skill_ranks`, `skill_abil`)
VALUES
	(43,35,2,8,4,4),
	(44,35,10,3,2,1),
	(45,35,14,8,4,4),
	(46,35,15,7,3,4),
	(47,35,18,7,3,4),
	(48,35,26,8,4,4);

/*!40000 ALTER TABLE `char_skills` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `charList` WRITE;
/*!40000 ALTER TABLE `charList` DISABLE KEYS */;

INSERT INTO `charList` (`charId`, `userId`, `charName`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(35,'2','Jack-Of-Napes','','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `charList` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table featsList
# ------------------------------------------------------------

DROP TABLE IF EXISTS `featsList`;

CREATE TABLE `featsList` (
  `feat_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `feat_name` varchar(50) NOT NULL DEFAULT '',
  `multiple` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`feat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

LOCK TABLES `featsList` WRITE;
/*!40000 ALTER TABLE `featsList` DISABLE KEYS */;

INSERT INTO `featsList` (`feat_id`, `feat_name`, `multiple`)
VALUES
	(1,'Accurate Attack',0),
	(2,'All-Out Attack',0),
	(3,'Attack Focus',1),
	(4,'Attack Specialization',1),
	(5,'Blind-Fight',0),
	(6,'Chokehold',0),
	(7,'Critical Strike',0),
	(8,'Defensive Attack',0),
	(9,'Defensive Roll',1),
	(10,'Dodge Focus',1),
	(11,'Elusive Target',0),
	(12,'Evasion',1),
	(13,'Fast Overrun',0),
	(14,'Favored Environment',1),
	(15,'Favored Opponent',1),
	(16,'Grappling Finesse',0),
	(17,'Improved Aim',0),
	(18,'Improved Block',1),
	(19,'Improved Critical',1),
	(20,'Improved Defense',1),
	(21,'Improved Disarm',1),
	(22,'Improved Grab',0),
	(23,'Improved Grapple',0),
	(24,'Improved Initiative',1),
	(25,'Improved Overrun',0),
	(26,'Improved Pin',0),
	(27,'Improved Sunder',0),
	(28,'Improved Throw',0),
	(29,'Improved Trip',0),
	(30,'Move-By Action',0),
	(31,'Power Attack',0),
	(32,'Precise Shot',1),
	(33,'Prone Fighting',0),
	(34,'Quick Draw',1),
	(35,'Rage',1),
	(36,'Ranged Pin',0),
	(37,'Redirect',0),
	(38,'Set-Up',0),
	(39,'Sneak Attack',1),
	(40,'Stunning Attack',0),
	(41,'Takedown Attack',1),
	(42,'Throwing Mastery',1),
	(43,'Uncanny Dodge',1),
	(44,'Weapon Bind',0),
	(45,'Weapon Break',0),
	(46,'Beginner\'s Luck',0),
	(47,'Inspire',1),
	(48,'Leadership',0),
	(49,'Luck',1),
	(50,'Seize Initiative',0),
	(51,'Ultimate Effort',1),
	(52,'Ambidexterity',0),
	(53,'Assessment',0),
	(54,'Benefit',1),
	(55,'Diehard',0),
	(56,'Eidetic Memory',0),
	(57,'Endurance',1),
	(58,'Environmental Adaptation',0),
	(59,'Equipment',1),
	(60,'Fearless',0),
	(61,'Fearsome Presence',1),
	(62,'Instant Up',0),
	(63,'Interpose',0),
	(64,'Master Plan',0),
	(65,'Minions',1),
	(66,'Quick Change',1),
	(67,'Second Chance',1),
	(68,'Sidekick',1),
	(69,'Teamwork',1),
	(70,'Trance',0),
	(71,'Acrobatic Bluff',0),
	(72,'Animal Empathy',0),
	(73,'Artificer',0),
	(74,'Attractive',1),
	(75,'Connected',0),
	(76,'Contacts',0),
	(77,'Distract',1),
	(78,'Fascinate',1),
	(79,'Hide In Plain Sight',0),
	(80,'Improvised Tools',0),
	(81,'Inventor',0),
	(82,'Jack-Of-All-Trades',0),
	(83,'Ritualist',0),
	(84,'Skill Mastery',1),
	(85,'Startle',0),
	(86,'Taunt',0),
	(87,'Track',0),
	(88,'Well-Informed',0);

/*!40000 ALTER TABLE `featsList` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;

INSERT INTO `files` (`fileId`, `userId`, `filename`, `file_ext`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(79,'12','Radiate.txt','txt','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(80,'12','Res_Map','jpg','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(81,'12','Cos_Terabyte','png','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(82,'12','Res_Honesty','pdf','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(85,'2','Map','jpg','','0000-00-00 00:00:00','0000-00-00 00:00:00');

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


# Dump of table powersList
# ------------------------------------------------------------

DROP TABLE IF EXISTS `powersList`;

CREATE TABLE `powersList` (
  `power_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `power_name` varchar(50) NOT NULL DEFAULT '',
  `power_cost` int(11) NOT NULL,
  `no_rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`power_id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

LOCK TABLES `powersList` WRITE;
/*!40000 ALTER TABLE `powersList` DISABLE KEYS */;

INSERT INTO `powersList` (`power_id`, `power_name`, `power_cost`, `no_rank`)
VALUES
	(1,'Abosorption',4,0),
	(2,'Acid',3,0),
	(3,'Adrenal Surge',1,0),
	(4,'Age Shift',8,1),
	(5,'Air Control',2,0),
	(6,'Alternate Form',5,0),
	(7,'Animal Control',2,0),
	(8,'Animal Mimicry',9,0),
	(9,'Animate Objects',3,0),
	(10,'Astral Form',5,0),
	(11,'Blast',2,0),
	(12,'Blending: Partial',2,1),
	(13,'Blending: Total',4,1),
	(14,'Blur',4,1),
	(15,'Bouncing',2,0),
	(16,'Chi',1,0),
	(17,'Clairaudience',1,0),
	(18,'Clairvoyance',2,0),
	(19,'Cold Control',2,0),
	(20,'Color Control',2,0),
	(21,'Corrosion',3,0),
	(22,'Cosmic Energy Control',2,0),
	(23,'Darkness Control',2,0),
	(24,'Datalink',1,0),
	(25,'Death Touch',1,0),
	(26,'Device: Easy To Lose',3,0),
	(27,'Device: Hard To Lose',4,0),
	(28,'Dimensional Control',2,0),
	(29,'Dimensional Pocket',2,0),
	(30,'Disease',3,0),
	(31,'Disintegration',5,0),
	(32,'Displacement',4,1),
	(33,'Dream Control',3,0),
	(34,'Dream Travel',1,0),
	(35,'Duplication',2,0),
	(36,'Earth Control',2,0),
	(37,'Elasticity',1,0),
	(38,'Electrical Control',2,0),
	(39,'Empowerment',6,0),
	(40,'Energy Aura',4,0),
	(41,'Evolutionary Shift',10,1),
	(42,'Exorcism',2,0),
	(43,'Fire Control',2,0),
	(44,'Force Constructs',2,0),
	(45,'Force Field',1,0),
	(46,'Friction Control',3,0),
	(47,'Gadgets: Easy To Lose',6,0),
	(48,'Gadgets: Hard To Lose',7,0),
	(49,'Gestalt',1,0),
	(50,'Grafting',11,0),
	(51,'Gravity Control',2,0),
	(52,'Hellfire Control',2,0),
	(53,'Hypnosis',2,0),
	(54,'Ignite',3,0),
	(55,'Immortality',5,1),
	(56,'Immutable',10,1),
	(57,'Invisiblity: Partial',4,1),
	(58,'Invisibility: Full',8,1),
	(59,'Kinetic Control',2,0),
	(60,'Life Control',4,0),
	(61,'Light Control',2,0),
	(62,'Machine Animation',2,0),
	(63,'Magic',2,0),
	(64,'Magnetic Control',2,0),
	(65,'Mental Blast',4,0),
	(66,'Mental Duplication',3,0),
	(67,'Microwave Control',2,0),
	(68,'Mind Shield',1,0),
	(69,'Mind Switch',2,0),
	(70,'Mirror Image',4,1),
	(71,'Mutation',4,0),
	(72,'Nemesis',8,0),
	(73,'Object Mimicry',6,0),
	(74,'Pain',5,0),
	(75,'Petrification',3,0),
	(76,'Pheromones',4,0),
	(77,'Plant Control',2,0),
	(78,'Plant Mimicry',9,0),
	(79,'Plasma Control',2,0),
	(80,'Possession',3,0),
	(81,'Power Control',2,0),
	(82,'Power Reserve',2,0),
	(83,'Power Resistance',2,0),
	(84,'Prehinsile Hair',1,0),
	(85,'Radiation Control',2,0),
	(86,'Reflection Field',8,0),
	(87,'Reflex Memory',9,0),
	(88,'Sensory Link',2,0),
	(89,'Sensory Shield:  1 sense',1,0),
	(90,'Sensory Shield: All senses',2,0),
	(91,'Shape Matter',4,0),
	(92,'Shapeshift',8,0),
	(93,'Shield',1,0),
	(94,'Silence: Human Hearing',1,0),
	(95,'Silence: Invisible to Sonar',2,0),
	(96,'Sleep',3,0),
	(97,'Sonic Control',2,0),
	(98,'Spatial Control',2,0),
	(99,'Spinning',2,0),
	(100,'Spirit Control',2,0),
	(101,'Strike',1,0),
	(102,'Super-Speed',5,0),
	(103,'Super-Ventriloquism',1,0),
	(104,'Suspended Animation',2,0),
	(105,'Telekinesis',2,0),
	(106,'Telelocation',1,0),
	(107,'Telepathy',2,0),
	(108,'Thermal Control',2,0),
	(109,'Time Control',7,0),
	(110,'Time Stop',7,0),
	(111,'Transmit',1,0),
	(112,'Transmutation',5,0),
	(113,'Troubleseeker',2,0),
	(114,'Universal Translator',8,1),
	(115,'Vibration Control',2,0),
	(116,'Ward',1,0),
	(117,'Water Control',2,0),
	(118,'Weapon Summoning',2,0),
	(119,'Weather Control',2,0);

/*!40000 ALTER TABLE `powersList` ENABLE KEYS */;
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
	('26993f6fee5f2f243272f149c2759aa1ea64050a','YTo5OntzOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NjoiX3Rva2VuIjtzOjQwOiJJRDlXZm00NmZqbVVyN2tFMHFxZldaNWY1S3BMT0dMYzhhWkZpSDZwIjtzOjM4OiJsb2dpbl84MmU1ZDJjNTZiZGQwODExMzE4ZjBjZjA3OGI3OGJmYyI7aToyO3M6MzoidWlkIjtpOjI7czo1OiJ1bmFtZSI7czozOiJ1c3MiO3M6NToiZmVhdHMiO2E6ODg6e2k6MDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MTtzOjk6ImZlYXRfbmFtZSI7czoxNToiQWNjdXJhdGUgQXR0YWNrIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6MTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MjtzOjk6ImZlYXRfbmFtZSI7czoxNDoiQWxsLU91dCBBdHRhY2siO3M6ODoibXVsdGlwbGUiO2k6MDt9aToyO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTozO3M6OToiZmVhdF9uYW1lIjtzOjEyOiJBdHRhY2sgRm9jdXMiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTozO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo0O3M6OToiZmVhdF9uYW1lIjtzOjIxOiJBdHRhY2sgU3BlY2lhbGl6YXRpb24iO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo0O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo1O3M6OToiZmVhdF9uYW1lIjtzOjExOiJCbGluZC1GaWdodCI7czo4OiJtdWx0aXBsZSI7aTowO31pOjU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjY7czo5OiJmZWF0X25hbWUiO3M6OToiQ2hva2Vob2xkIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NztzOjk6ImZlYXRfbmFtZSI7czoxNToiQ3JpdGljYWwgU3RyaWtlIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NztPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6ODtzOjk6ImZlYXRfbmFtZSI7czoxNjoiRGVmZW5zaXZlIEF0dGFjayI7czo4OiJtdWx0aXBsZSI7aTowO31pOjg7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjk7czo5OiJmZWF0X25hbWUiO3M6MTQ6IkRlZmVuc2l2ZSBSb2xsIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6OTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MTA7czo5OiJmZWF0X25hbWUiO3M6MTE6IkRvZGdlIEZvY3VzIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6MTA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjExO3M6OToiZmVhdF9uYW1lIjtzOjE0OiJFbHVzaXZlIFRhcmdldCI7czo4OiJtdWx0aXBsZSI7aTowO31pOjExO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToxMjtzOjk6ImZlYXRfbmFtZSI7czo3OiJFdmFzaW9uIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6MTI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjEzO3M6OToiZmVhdF9uYW1lIjtzOjEyOiJGYXN0IE92ZXJydW4iO3M6ODoibXVsdGlwbGUiO2k6MDt9aToxMztPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MTQ7czo5OiJmZWF0X25hbWUiO3M6MTk6IkZhdm9yZWQgRW52aXJvbm1lbnQiO3M6ODoibXVsdGlwbGUiO2k6MTt9aToxNDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MTU7czo5OiJmZWF0X25hbWUiO3M6MTY6IkZhdm9yZWQgT3Bwb25lbnQiO3M6ODoibXVsdGlwbGUiO2k6MTt9aToxNTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MTY7czo5OiJmZWF0X25hbWUiO3M6MTc6IkdyYXBwbGluZyBGaW5lc3NlIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6MTY7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjE3O3M6OToiZmVhdF9uYW1lIjtzOjEyOiJJbXByb3ZlZCBBaW0iO3M6ODoibXVsdGlwbGUiO2k6MDt9aToxNztPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MTg7czo5OiJmZWF0X25hbWUiO3M6MTQ6IkltcHJvdmVkIEJsb2NrIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6MTg7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjE5O3M6OToiZmVhdF9uYW1lIjtzOjE3OiJJbXByb3ZlZCBDcml0aWNhbCI7czo4OiJtdWx0aXBsZSI7aToxO31pOjE5O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToyMDtzOjk6ImZlYXRfbmFtZSI7czoxNjoiSW1wcm92ZWQgRGVmZW5zZSI7czo4OiJtdWx0aXBsZSI7aToxO31pOjIwO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToyMTtzOjk6ImZlYXRfbmFtZSI7czoxNToiSW1wcm92ZWQgRGlzYXJtIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6MjE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjIyO3M6OToiZmVhdF9uYW1lIjtzOjEzOiJJbXByb3ZlZCBHcmFiIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6MjI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjIzO3M6OToiZmVhdF9uYW1lIjtzOjE2OiJJbXByb3ZlZCBHcmFwcGxlIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6MjM7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjI0O3M6OToiZmVhdF9uYW1lIjtzOjE5OiJJbXByb3ZlZCBJbml0aWF0aXZlIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6MjQ7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjI1O3M6OToiZmVhdF9uYW1lIjtzOjE2OiJJbXByb3ZlZCBPdmVycnVuIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6MjU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjI2O3M6OToiZmVhdF9uYW1lIjtzOjEyOiJJbXByb3ZlZCBQaW4iO3M6ODoibXVsdGlwbGUiO2k6MDt9aToyNjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6Mjc7czo5OiJmZWF0X25hbWUiO3M6MTU6IkltcHJvdmVkIFN1bmRlciI7czo4OiJtdWx0aXBsZSI7aTowO31pOjI3O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToyODtzOjk6ImZlYXRfbmFtZSI7czoxNDoiSW1wcm92ZWQgVGhyb3ciO3M6ODoibXVsdGlwbGUiO2k6MDt9aToyODtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6Mjk7czo5OiJmZWF0X25hbWUiO3M6MTM6IkltcHJvdmVkIFRyaXAiO3M6ODoibXVsdGlwbGUiO2k6MDt9aToyOTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MzA7czo5OiJmZWF0X25hbWUiO3M6MTQ6Ik1vdmUtQnkgQWN0aW9uIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6MzA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjMxO3M6OToiZmVhdF9uYW1lIjtzOjEyOiJQb3dlciBBdHRhY2siO3M6ODoibXVsdGlwbGUiO2k6MDt9aTozMTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MzI7czo5OiJmZWF0X25hbWUiO3M6MTI6IlByZWNpc2UgU2hvdCI7czo4OiJtdWx0aXBsZSI7aToxO31pOjMyO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTozMztzOjk6ImZlYXRfbmFtZSI7czoxNDoiUHJvbmUgRmlnaHRpbmciO3M6ODoibXVsdGlwbGUiO2k6MDt9aTozMztPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MzQ7czo5OiJmZWF0X25hbWUiO3M6MTA6IlF1aWNrIERyYXciO3M6ODoibXVsdGlwbGUiO2k6MTt9aTozNDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MzU7czo5OiJmZWF0X25hbWUiO3M6NDoiUmFnZSI7czo4OiJtdWx0aXBsZSI7aToxO31pOjM1O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTozNjtzOjk6ImZlYXRfbmFtZSI7czoxMDoiUmFuZ2VkIFBpbiI7czo4OiJtdWx0aXBsZSI7aTowO31pOjM2O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTozNztzOjk6ImZlYXRfbmFtZSI7czo4OiJSZWRpcmVjdCI7czo4OiJtdWx0aXBsZSI7aTowO31pOjM3O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTozODtzOjk6ImZlYXRfbmFtZSI7czo2OiJTZXQtVXAiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTozODtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6Mzk7czo5OiJmZWF0X25hbWUiO3M6MTI6IlNuZWFrIEF0dGFjayI7czo4OiJtdWx0aXBsZSI7aToxO31pOjM5O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo0MDtzOjk6ImZlYXRfbmFtZSI7czoxNToiU3R1bm5pbmcgQXR0YWNrIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NDA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjQxO3M6OToiZmVhdF9uYW1lIjtzOjE1OiJUYWtlZG93biBBdHRhY2siO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo0MTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NDI7czo5OiJmZWF0X25hbWUiO3M6MTY6IlRocm93aW5nIE1hc3RlcnkiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo0MjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NDM7czo5OiJmZWF0X25hbWUiO3M6MTM6IlVuY2FubnkgRG9kZ2UiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo0MztPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NDQ7czo5OiJmZWF0X25hbWUiO3M6MTE6IldlYXBvbiBCaW5kIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NDQ7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjQ1O3M6OToiZmVhdF9uYW1lIjtzOjEyOiJXZWFwb24gQnJlYWsiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo0NTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NDY7czo5OiJmZWF0X25hbWUiO3M6MTU6IkJlZ2lubmVyJ3MgTHVjayI7czo4OiJtdWx0aXBsZSI7aTowO31pOjQ2O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo0NztzOjk6ImZlYXRfbmFtZSI7czo3OiJJbnNwaXJlIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6NDc7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjQ4O3M6OToiZmVhdF9uYW1lIjtzOjEwOiJMZWFkZXJzaGlwIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NDg7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjQ5O3M6OToiZmVhdF9uYW1lIjtzOjQ6Ikx1Y2siO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo0OTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NTA7czo5OiJmZWF0X25hbWUiO3M6MTY6IlNlaXplIEluaXRpYXRpdmUiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo1MDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NTE7czo5OiJmZWF0X25hbWUiO3M6MTU6IlVsdGltYXRlIEVmZm9ydCI7czo4OiJtdWx0aXBsZSI7aToxO31pOjUxO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo1MjtzOjk6ImZlYXRfbmFtZSI7czoxMzoiQW1iaWRleHRlcml0eSI7czo4OiJtdWx0aXBsZSI7aTowO31pOjUyO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo1MztzOjk6ImZlYXRfbmFtZSI7czoxMDoiQXNzZXNzbWVudCI7czo4OiJtdWx0aXBsZSI7aTowO31pOjUzO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo1NDtzOjk6ImZlYXRfbmFtZSI7czo3OiJCZW5lZml0IjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6NTQ7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjU1O3M6OToiZmVhdF9uYW1lIjtzOjc6IkRpZWhhcmQiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo1NTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NTY7czo5OiJmZWF0X25hbWUiO3M6MTQ6IkVpZGV0aWMgTWVtb3J5IjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NTY7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjU3O3M6OToiZmVhdF9uYW1lIjtzOjk6IkVuZHVyYW5jZSI7czo4OiJtdWx0aXBsZSI7aToxO31pOjU3O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo1ODtzOjk6ImZlYXRfbmFtZSI7czoyNDoiRW52aXJvbm1lbnRhbCBBZGFwdGF0aW9uIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NTg7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjU5O3M6OToiZmVhdF9uYW1lIjtzOjk6IkVxdWlwbWVudCI7czo4OiJtdWx0aXBsZSI7aToxO31pOjU5O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo2MDtzOjk6ImZlYXRfbmFtZSI7czo4OiJGZWFybGVzcyI7czo4OiJtdWx0aXBsZSI7aTowO31pOjYwO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo2MTtzOjk6ImZlYXRfbmFtZSI7czoxNzoiRmVhcnNvbWUgUHJlc2VuY2UiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo2MTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NjI7czo5OiJmZWF0X25hbWUiO3M6MTA6Ikluc3RhbnQgVXAiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo2MjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NjM7czo5OiJmZWF0X25hbWUiO3M6OToiSW50ZXJwb3NlIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NjM7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjY0O3M6OToiZmVhdF9uYW1lIjtzOjExOiJNYXN0ZXIgUGxhbiI7czo4OiJtdWx0aXBsZSI7aTowO31pOjY0O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo2NTtzOjk6ImZlYXRfbmFtZSI7czo3OiJNaW5pb25zIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6NjU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjY2O3M6OToiZmVhdF9uYW1lIjtzOjEyOiJRdWljayBDaGFuZ2UiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo2NjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6Njc7czo5OiJmZWF0X25hbWUiO3M6MTM6IlNlY29uZCBDaGFuY2UiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo2NztPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6Njg7czo5OiJmZWF0X25hbWUiO3M6ODoiU2lkZWtpY2siO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo2ODtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6Njk7czo5OiJmZWF0X25hbWUiO3M6ODoiVGVhbXdvcmsiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo2OTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NzA7czo5OiJmZWF0X25hbWUiO3M6NjoiVHJhbmNlIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NzA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjcxO3M6OToiZmVhdF9uYW1lIjtzOjE1OiJBY3JvYmF0aWMgQmx1ZmYiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo3MTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NzI7czo5OiJmZWF0X25hbWUiO3M6MTQ6IkFuaW1hbCBFbXBhdGh5IjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NzI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjczO3M6OToiZmVhdF9uYW1lIjtzOjk6IkFydGlmaWNlciI7czo4OiJtdWx0aXBsZSI7aTowO31pOjczO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo3NDtzOjk6ImZlYXRfbmFtZSI7czoxMDoiQXR0cmFjdGl2ZSI7czo4OiJtdWx0aXBsZSI7aToxO31pOjc0O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo3NTtzOjk6ImZlYXRfbmFtZSI7czo5OiJDb25uZWN0ZWQiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo3NTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NzY7czo5OiJmZWF0X25hbWUiO3M6ODoiQ29udGFjdHMiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo3NjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6Nzc7czo5OiJmZWF0X25hbWUiO3M6ODoiRGlzdHJhY3QiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo3NztPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6Nzg7czo5OiJmZWF0X25hbWUiO3M6OToiRmFzY2luYXRlIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6Nzg7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjc5O3M6OToiZmVhdF9uYW1lIjtzOjE5OiJIaWRlIEluIFBsYWluIFNpZ2h0IjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6Nzk7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjgwO3M6OToiZmVhdF9uYW1lIjtzOjE2OiJJbXByb3Zpc2VkIFRvb2xzIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6ODA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjgxO3M6OToiZmVhdF9uYW1lIjtzOjg6IkludmVudG9yIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6ODE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjgyO3M6OToiZmVhdF9uYW1lIjtzOjE4OiJKYWNrLU9mLUFsbC1UcmFkZXMiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo4MjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6ODM7czo5OiJmZWF0X25hbWUiO3M6OToiUml0dWFsaXN0IjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6ODM7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjg0O3M6OToiZmVhdF9uYW1lIjtzOjEzOiJTa2lsbCBNYXN0ZXJ5IjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6ODQ7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjg1O3M6OToiZmVhdF9uYW1lIjtzOjc6IlN0YXJ0bGUiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo4NTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6ODY7czo5OiJmZWF0X25hbWUiO3M6NToiVGF1bnQiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo4NjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6ODc7czo5OiJmZWF0X25hbWUiO3M6NToiVHJhY2siO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo4NztPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6ODg7czo5OiJmZWF0X25hbWUiO3M6MTM6IldlbGwtSW5mb3JtZWQiO3M6ODoibXVsdGlwbGUiO2k6MDt9fXM6NjoicG93ZXJzIjthOjExOTp7aTowO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTtzOjEwOiJwb3dlcl9uYW1lIjtzOjExOiJBYm9zb3JwdGlvbiI7czoxMDoicG93ZXJfY29zdCI7aTo0O3M6Nzoibm9fcmFuayI7aTowO31pOjE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToyO3M6MTA6InBvd2VyX25hbWUiO3M6NDoiQWNpZCI7czoxMDoicG93ZXJfY29zdCI7aTozO3M6Nzoibm9fcmFuayI7aTowO31pOjI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTozO3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IkFkcmVuYWwgU3VyZ2UiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aTozO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NDtzOjEwOiJwb3dlcl9uYW1lIjtzOjk6IkFnZSBTaGlmdCI7czoxMDoicG93ZXJfY29zdCI7aTo4O3M6Nzoibm9fcmFuayI7aToxO31pOjQ7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo1O3M6MTA6InBvd2VyX25hbWUiO3M6MTE6IkFpciBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6NTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjY7czoxMDoicG93ZXJfbmFtZSI7czoxNDoiQWx0ZXJuYXRlIEZvcm0iO3M6MTA6InBvd2VyX2Nvc3QiO2k6NTtzOjc6Im5vX3JhbmsiO2k6MDt9aTo2O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NztzOjEwOiJwb3dlcl9uYW1lIjtzOjE0OiJBbmltYWwgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjc7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo4O3M6MTA6InBvd2VyX25hbWUiO3M6MTQ6IkFuaW1hbCBNaW1pY3J5IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjk7czo3OiJub19yYW5rIjtpOjA7fWk6ODtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjk7czoxMDoicG93ZXJfbmFtZSI7czoxNToiQW5pbWF0ZSBPYmplY3RzIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjM7czo3OiJub19yYW5rIjtpOjA7fWk6OTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEwO3M6MTA6InBvd2VyX25hbWUiO3M6MTE6IkFzdHJhbCBGb3JtIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjU7czo3OiJub19yYW5rIjtpOjA7fWk6MTA7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMTtzOjEwOiJwb3dlcl9uYW1lIjtzOjU6IkJsYXN0IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMjtzOjEwOiJwb3dlcl9uYW1lIjtzOjE3OiJCbGVuZGluZzogUGFydGlhbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aToxO31pOjEyO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTM7czoxMDoicG93ZXJfbmFtZSI7czoxNToiQmxlbmRpbmc6IFRvdGFsIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjQ7czo3OiJub19yYW5rIjtpOjE7fWk6MTM7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxNDtzOjEwOiJwb3dlcl9uYW1lIjtzOjQ6IkJsdXIiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NDtzOjc6Im5vX3JhbmsiO2k6MTt9aToxNDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjE1O3M6MTA6InBvd2VyX25hbWUiO3M6ODoiQm91bmNpbmciO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxNTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjE2O3M6MTA6InBvd2VyX25hbWUiO3M6MzoiQ2hpIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6MTY7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxNztzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJDbGFpcmF1ZGllbmNlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6MTc7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxODtzOjEwOiJwb3dlcl9uYW1lIjtzOjEyOiJDbGFpcnZveWFuY2UiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxODtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjE5O3M6MTA6InBvd2VyX25hbWUiO3M6MTI6IkNvbGQgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjE5O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MjA7czoxMDoicG93ZXJfbmFtZSI7czoxMzoiQ29sb3IgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjIwO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MjE7czoxMDoicG93ZXJfbmFtZSI7czo5OiJDb3Jyb3Npb24iO3M6MTA6InBvd2VyX2Nvc3QiO2k6MztzOjc6Im5vX3JhbmsiO2k6MDt9aToyMTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjIyO3M6MTA6InBvd2VyX25hbWUiO3M6MjE6IkNvc21pYyBFbmVyZ3kgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjIyO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MjM7czoxMDoicG93ZXJfbmFtZSI7czoxNjoiRGFya25lc3MgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjIzO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MjQ7czoxMDoicG93ZXJfbmFtZSI7czo4OiJEYXRhbGluayI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjI0O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MjU7czoxMDoicG93ZXJfbmFtZSI7czoxMToiRGVhdGggVG91Y2giO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aToyNTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjI2O3M6MTA6InBvd2VyX25hbWUiO3M6MjA6IkRldmljZTogRWFzeSBUbyBMb3NlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjM7czo3OiJub19yYW5rIjtpOjA7fWk6MjY7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToyNztzOjEwOiJwb3dlcl9uYW1lIjtzOjIwOiJEZXZpY2U6IEhhcmQgVG8gTG9zZSI7czoxMDoicG93ZXJfY29zdCI7aTo0O3M6Nzoibm9fcmFuayI7aTowO31pOjI3O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6Mjg7czoxMDoicG93ZXJfbmFtZSI7czoxOToiRGltZW5zaW9uYWwgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjI4O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6Mjk7czoxMDoicG93ZXJfbmFtZSI7czoxODoiRGltZW5zaW9uYWwgUG9ja2V0IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6Mjk7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTozMDtzOjEwOiJwb3dlcl9uYW1lIjtzOjc6IkRpc2Vhc2UiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MztzOjc6Im5vX3JhbmsiO2k6MDt9aTozMDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjMxO3M6MTA6InBvd2VyX25hbWUiO3M6MTQ6IkRpc2ludGVncmF0aW9uIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjU7czo3OiJub19yYW5rIjtpOjA7fWk6MzE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTozMjtzOjEwOiJwb3dlcl9uYW1lIjtzOjEyOiJEaXNwbGFjZW1lbnQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NDtzOjc6Im5vX3JhbmsiO2k6MTt9aTozMjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjMzO3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IkRyZWFtIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MztzOjc6Im5vX3JhbmsiO2k6MDt9aTozMztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjM0O3M6MTA6InBvd2VyX25hbWUiO3M6MTI6IkRyZWFtIFRyYXZlbCI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjM0O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MzU7czoxMDoicG93ZXJfbmFtZSI7czoxMToiRHVwbGljYXRpb24iO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTozNTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjM2O3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IkVhcnRoIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTozNjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjM3O3M6MTA6InBvd2VyX25hbWUiO3M6MTA6IkVsYXN0aWNpdHkiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aTozNztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjM4O3M6MTA6InBvd2VyX25hbWUiO3M6MTg6IkVsZWN0cmljYWwgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjM4O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6Mzk7czoxMDoicG93ZXJfbmFtZSI7czoxMToiRW1wb3dlcm1lbnQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NjtzOjc6Im5vX3JhbmsiO2k6MDt9aTozOTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjQwO3M6MTA6InBvd2VyX25hbWUiO3M6MTE6IkVuZXJneSBBdXJhIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjQ7czo3OiJub19yYW5rIjtpOjA7fWk6NDA7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo0MTtzOjEwOiJwb3dlcl9uYW1lIjtzOjE4OiJFdm9sdXRpb25hcnkgU2hpZnQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTA7czo3OiJub19yYW5rIjtpOjE7fWk6NDE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo0MjtzOjEwOiJwb3dlcl9uYW1lIjtzOjg6IkV4b3JjaXNtIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6NDI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo0MztzOjEwOiJwb3dlcl9uYW1lIjtzOjEyOiJGaXJlIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo0MztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjQ0O3M6MTA6InBvd2VyX25hbWUiO3M6MTY6IkZvcmNlIENvbnN0cnVjdHMiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo0NDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjQ1O3M6MTA6InBvd2VyX25hbWUiO3M6MTE6IkZvcmNlIEZpZWxkIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6NDU7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo0NjtzOjEwOiJwb3dlcl9uYW1lIjtzOjE2OiJGcmljdGlvbiBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjM7czo3OiJub19yYW5rIjtpOjA7fWk6NDY7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo0NztzOjEwOiJwb3dlcl9uYW1lIjtzOjIxOiJHYWRnZXRzOiBFYXN5IFRvIExvc2UiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo0NztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjQ4O3M6MTA6InBvd2VyX25hbWUiO3M6MjE6IkdhZGdldHM6IEhhcmQgVG8gTG9zZSI7czoxMDoicG93ZXJfY29zdCI7aTo3O3M6Nzoibm9fcmFuayI7aTowO31pOjQ4O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NDk7czoxMDoicG93ZXJfbmFtZSI7czo3OiJHZXN0YWx0IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6NDk7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo1MDtzOjEwOiJwb3dlcl9uYW1lIjtzOjg6IkdyYWZ0aW5nIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjExO3M6Nzoibm9fcmFuayI7aTowO31pOjUwO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NTE7czoxMDoicG93ZXJfbmFtZSI7czoxNToiR3Jhdml0eSBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6NTE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo1MjtzOjEwOiJwb3dlcl9uYW1lIjtzOjE2OiJIZWxsZmlyZSBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6NTI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo1MztzOjEwOiJwb3dlcl9uYW1lIjtzOjg6Ikh5cG5vc2lzIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6NTM7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo1NDtzOjEwOiJwb3dlcl9uYW1lIjtzOjY6Iklnbml0ZSI7czoxMDoicG93ZXJfY29zdCI7aTozO3M6Nzoibm9fcmFuayI7aTowO31pOjU0O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NTU7czoxMDoicG93ZXJfbmFtZSI7czoxMToiSW1tb3J0YWxpdHkiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NTtzOjc6Im5vX3JhbmsiO2k6MTt9aTo1NTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjU2O3M6MTA6InBvd2VyX25hbWUiO3M6OToiSW1tdXRhYmxlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjEwO3M6Nzoibm9fcmFuayI7aToxO31pOjU2O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NTc7czoxMDoicG93ZXJfbmFtZSI7czoyMDoiSW52aXNpYmxpdHk6IFBhcnRpYWwiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NDtzOjc6Im5vX3JhbmsiO2k6MTt9aTo1NztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjU4O3M6MTA6InBvd2VyX25hbWUiO3M6MTg6IkludmlzaWJpbGl0eTogRnVsbCI7czoxMDoicG93ZXJfY29zdCI7aTo4O3M6Nzoibm9fcmFuayI7aToxO31pOjU4O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NTk7czoxMDoicG93ZXJfbmFtZSI7czoxNToiS2luZXRpYyBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6NTk7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo2MDtzOjEwOiJwb3dlcl9uYW1lIjtzOjEyOiJMaWZlIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NDtzOjc6Im5vX3JhbmsiO2k6MDt9aTo2MDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjYxO3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IkxpZ2h0IENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo2MTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjYyO3M6MTA6InBvd2VyX25hbWUiO3M6MTc6Ik1hY2hpbmUgQW5pbWF0aW9uIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6NjI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo2MztzOjEwOiJwb3dlcl9uYW1lIjtzOjU6Ik1hZ2ljIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6NjM7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo2NDtzOjEwOiJwb3dlcl9uYW1lIjtzOjE2OiJNYWduZXRpYyBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6NjQ7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo2NTtzOjEwOiJwb3dlcl9uYW1lIjtzOjEyOiJNZW50YWwgQmxhc3QiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NDtzOjc6Im5vX3JhbmsiO2k6MDt9aTo2NTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjY2O3M6MTA6InBvd2VyX25hbWUiO3M6MTg6Ik1lbnRhbCBEdXBsaWNhdGlvbiI7czoxMDoicG93ZXJfY29zdCI7aTozO3M6Nzoibm9fcmFuayI7aTowO31pOjY2O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6Njc7czoxMDoicG93ZXJfbmFtZSI7czoxNzoiTWljcm93YXZlIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo2NztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjY4O3M6MTA6InBvd2VyX25hbWUiO3M6MTE6Ik1pbmQgU2hpZWxkIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6Njg7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo2OTtzOjEwOiJwb3dlcl9uYW1lIjtzOjExOiJNaW5kIFN3aXRjaCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjY5O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NzA7czoxMDoicG93ZXJfbmFtZSI7czoxMjoiTWlycm9yIEltYWdlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjQ7czo3OiJub19yYW5rIjtpOjE7fWk6NzA7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo3MTtzOjEwOiJwb3dlcl9uYW1lIjtzOjg6Ik11dGF0aW9uIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjQ7czo3OiJub19yYW5rIjtpOjA7fWk6NzE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo3MjtzOjEwOiJwb3dlcl9uYW1lIjtzOjc6Ik5lbWVzaXMiO3M6MTA6InBvd2VyX2Nvc3QiO2k6ODtzOjc6Im5vX3JhbmsiO2k6MDt9aTo3MjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjczO3M6MTA6InBvd2VyX25hbWUiO3M6MTQ6Ik9iamVjdCBNaW1pY3J5IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjY7czo3OiJub19yYW5rIjtpOjA7fWk6NzM7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo3NDtzOjEwOiJwb3dlcl9uYW1lIjtzOjQ6IlBhaW4iO3M6MTA6InBvd2VyX2Nvc3QiO2k6NTtzOjc6Im5vX3JhbmsiO2k6MDt9aTo3NDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjc1O3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IlBldHJpZmljYXRpb24iO3M6MTA6InBvd2VyX2Nvc3QiO2k6MztzOjc6Im5vX3JhbmsiO2k6MDt9aTo3NTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjc2O3M6MTA6InBvd2VyX25hbWUiO3M6MTA6IlBoZXJvbW9uZXMiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NDtzOjc6Im5vX3JhbmsiO2k6MDt9aTo3NjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjc3O3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IlBsYW50IENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo3NztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjc4O3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IlBsYW50IE1pbWljcnkiO3M6MTA6InBvd2VyX2Nvc3QiO2k6OTtzOjc6Im5vX3JhbmsiO2k6MDt9aTo3ODtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjc5O3M6MTA6InBvd2VyX25hbWUiO3M6MTQ6IlBsYXNtYSBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6Nzk7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo4MDtzOjEwOiJwb3dlcl9uYW1lIjtzOjEwOiJQb3NzZXNzaW9uIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjM7czo3OiJub19yYW5rIjtpOjA7fWk6ODA7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo4MTtzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJQb3dlciBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6ODE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo4MjtzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJQb3dlciBSZXNlcnZlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6ODI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo4MztzOjEwOiJwb3dlcl9uYW1lIjtzOjE2OiJQb3dlciBSZXNpc3RhbmNlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6ODM7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo4NDtzOjEwOiJwb3dlcl9uYW1lIjtzOjE1OiJQcmVoaW5zaWxlIEhhaXIiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aTo4NDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjg1O3M6MTA6InBvd2VyX25hbWUiO3M6MTc6IlJhZGlhdGlvbiBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6ODU7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo4NjtzOjEwOiJwb3dlcl9uYW1lIjtzOjE2OiJSZWZsZWN0aW9uIEZpZWxkIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjg7czo3OiJub19yYW5rIjtpOjA7fWk6ODY7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo4NztzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJSZWZsZXggTWVtb3J5IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjk7czo3OiJub19yYW5rIjtpOjA7fWk6ODc7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo4ODtzOjEwOiJwb3dlcl9uYW1lIjtzOjEyOiJTZW5zb3J5IExpbmsiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo4ODtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjg5O3M6MTA6InBvd2VyX25hbWUiO3M6MjQ6IlNlbnNvcnkgU2hpZWxkOiAgMSBzZW5zZSI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjg5O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6OTA7czoxMDoicG93ZXJfbmFtZSI7czoyNjoiU2Vuc29yeSBTaGllbGQ6IEFsbCBzZW5zZXMiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo5MDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjkxO3M6MTA6InBvd2VyX25hbWUiO3M6MTI6IlNoYXBlIE1hdHRlciI7czoxMDoicG93ZXJfY29zdCI7aTo0O3M6Nzoibm9fcmFuayI7aTowO31pOjkxO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6OTI7czoxMDoicG93ZXJfbmFtZSI7czoxMDoiU2hhcGVzaGlmdCI7czoxMDoicG93ZXJfY29zdCI7aTo4O3M6Nzoibm9fcmFuayI7aTowO31pOjkyO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6OTM7czoxMDoicG93ZXJfbmFtZSI7czo2OiJTaGllbGQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aTo5MztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjk0O3M6MTA6InBvd2VyX25hbWUiO3M6MjI6IlNpbGVuY2U6IEh1bWFuIEhlYXJpbmciO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aTo5NDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjk1O3M6MTA6InBvd2VyX25hbWUiO3M6Mjc6IlNpbGVuY2U6IEludmlzaWJsZSB0byBTb25hciI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjk1O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6OTY7czoxMDoicG93ZXJfbmFtZSI7czo1OiJTbGVlcCI7czoxMDoicG93ZXJfY29zdCI7aTozO3M6Nzoibm9fcmFuayI7aTowO31pOjk2O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6OTc7czoxMDoicG93ZXJfbmFtZSI7czoxMzoiU29uaWMgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjk3O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6OTg7czoxMDoicG93ZXJfbmFtZSI7czoxNToiU3BhdGlhbCBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6OTg7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo5OTtzOjEwOiJwb3dlcl9uYW1lIjtzOjg6IlNwaW5uaW5nIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6OTk7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMDA7czoxMDoicG93ZXJfbmFtZSI7czoxNDoiU3Bpcml0IENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMDA7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMDE7czoxMDoicG93ZXJfbmFtZSI7czo2OiJTdHJpa2UiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMDE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMDI7czoxMDoicG93ZXJfbmFtZSI7czoxMToiU3VwZXItU3BlZWQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NTtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMDI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMDM7czoxMDoicG93ZXJfbmFtZSI7czoxOToiU3VwZXItVmVudHJpbG9xdWlzbSI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjEwMztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEwNDtzOjEwOiJwb3dlcl9uYW1lIjtzOjE5OiJTdXNwZW5kZWQgQW5pbWF0aW9uIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTA0O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTA1O3M6MTA6InBvd2VyX25hbWUiO3M6MTE6IlRlbGVraW5lc2lzIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTA1O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTA2O3M6MTA6InBvd2VyX25hbWUiO3M6MTI6IlRlbGVsb2NhdGlvbiI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjEwNjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEwNztzOjEwOiJwb3dlcl9uYW1lIjtzOjk6IlRlbGVwYXRoeSI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjEwNztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEwODtzOjEwOiJwb3dlcl9uYW1lIjtzOjE1OiJUaGVybWFsIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMDg7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMDk7czoxMDoicG93ZXJfbmFtZSI7czoxMjoiVGltZSBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjc7czo3OiJub19yYW5rIjtpOjA7fWk6MTA5O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTEwO3M6MTA6InBvd2VyX25hbWUiO3M6OToiVGltZSBTdG9wIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjc7czo3OiJub19yYW5rIjtpOjA7fWk6MTEwO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTExO3M6MTA6InBvd2VyX25hbWUiO3M6ODoiVHJhbnNtaXQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMTE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMTI7czoxMDoicG93ZXJfbmFtZSI7czoxMzoiVHJhbnNtdXRhdGlvbiI7czoxMDoicG93ZXJfY29zdCI7aTo1O3M6Nzoibm9fcmFuayI7aTowO31pOjExMjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjExMztzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJUcm91Ymxlc2Vla2VyIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTEzO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTE0O3M6MTA6InBvd2VyX25hbWUiO3M6MjA6IlVuaXZlcnNhbCBUcmFuc2xhdG9yIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjg7czo3OiJub19yYW5rIjtpOjE7fWk6MTE0O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTE1O3M6MTA6InBvd2VyX25hbWUiO3M6MTc6IlZpYnJhdGlvbiBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTE1O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTE2O3M6MTA6InBvd2VyX25hbWUiO3M6NDoiV2FyZCI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjExNjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjExNztzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJXYXRlciBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTE3O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTE4O3M6MTA6InBvd2VyX25hbWUiO3M6MTY6IldlYXBvbiBTdW1tb25pbmciO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMTg7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMTk7czoxMDoicG93ZXJfbmFtZSI7czoxNToiV2VhdGhlciBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fX1zOjY6InNraWxscyI7YTo0Mjp7aTowO086ODoic3RkQ2xhc3MiOjI6e3M6ODoic2tpbGxfaWQiO2k6MTtzOjEwOiJza2lsbF9uYW1lIjtzOjEwOiJBY3JvYmF0aWNzIjt9aToxO086ODoic3RkQ2xhc3MiOjI6e3M6ODoic2tpbGxfaWQiO2k6MjtzOjEwOiJza2lsbF9uYW1lIjtzOjU6IkJsdWZmIjt9aToyO086ODoic3RkQ2xhc3MiOjI6e3M6ODoic2tpbGxfaWQiO2k6MztzOjEwOiJza2lsbF9uYW1lIjtzOjU6IkNsaW1iIjt9aTozO086ODoic3RkQ2xhc3MiOjI6e3M6ODoic2tpbGxfaWQiO2k6NDtzOjEwOiJza2lsbF9uYW1lIjtzOjk6IkNvbXB1dGVycyI7fWk6NDtPOjg6InN0ZENsYXNzIjoyOntzOjg6InNraWxsX2lkIjtpOjU7czoxMDoic2tpbGxfbmFtZSI7czoxMzoiQ29uY2VudHJhdGlvbiI7fWk6NTtPOjg6InN0ZENsYXNzIjoyOntzOjg6InNraWxsX2lkIjtpOjY7czoxMDoic2tpbGxfbmFtZSI7czo1OiJDcmFmdCI7fWk6NjtPOjg6InN0ZENsYXNzIjoyOntzOjg6InNraWxsX2lkIjtpOjc7czoxMDoic2tpbGxfbmFtZSI7czo5OiJEaXBsb21hY3kiO31pOjc7Tzo4OiJzdGRDbGFzcyI6Mjp7czo4OiJza2lsbF9pZCI7aTo4O3M6MTA6InNraWxsX25hbWUiO3M6MTQ6IkRpc2FibGUgRGV2aWNlIjt9aTo4O086ODoic3RkQ2xhc3MiOjI6e3M6ODoic2tpbGxfaWQiO2k6OTtzOjEwOiJza2lsbF9uYW1lIjtzOjg6IkRpc2d1aXNlIjt9aTo5O086ODoic3RkQ2xhc3MiOjI6e3M6ODoic2tpbGxfaWQiO2k6MTA7czoxMDoic2tpbGxfbmFtZSI7czo1OiJEcml2ZSI7fWk6MTA7Tzo4OiJzdGRDbGFzcyI6Mjp7czo4OiJza2lsbF9pZCI7aToxMTtzOjEwOiJza2lsbF9uYW1lIjtzOjEzOiJFc2NhcGUgQXJ0aXN0Ijt9aToxMTtPOjg6InN0ZENsYXNzIjoyOntzOjg6InNraWxsX2lkIjtpOjEyO3M6MTA6InNraWxsX25hbWUiO3M6MTg6IkdhdGhlciBJbmZvcm1hdGlvbiI7fWk6MTI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo4OiJza2lsbF9pZCI7aToxMztzOjEwOiJza2lsbF9uYW1lIjtzOjEzOiJIYW5kbGUgQW5pbWFsIjt9aToxMztPOjg6InN0ZENsYXNzIjoyOntzOjg6InNraWxsX2lkIjtpOjE0O3M6MTA6InNraWxsX25hbWUiO3M6MTA6IkludGltaWRhdGUiO31pOjE0O086ODoic3RkQ2xhc3MiOjI6e3M6ODoic2tpbGxfaWQiO2k6MTU7czoxMDoic2tpbGxfbmFtZSI7czoxMToiSW52ZXN0aWdhdGUiO31pOjE1O086ODoic3RkQ2xhc3MiOjI6e3M6ODoic2tpbGxfaWQiO2k6MTY7czoxMDoic2tpbGxfbmFtZSI7czoyMjoiS25vd2xlZGdlOiBBcmNhbmUgTG9yZSI7fWk6MTY7Tzo4OiJzdGRDbGFzcyI6Mjp7czo4OiJza2lsbF9pZCI7aToxNztzOjEwOiJza2lsbF9uYW1lIjtzOjE0OiJLbm93bGVkZ2U6IEFydCI7fWk6MTc7Tzo4OiJzdGRDbGFzcyI6Mjp7czo4OiJza2lsbF9pZCI7aToxODtzOjEwOiJza2lsbF9uYW1lIjtzOjMwOiJLbm93bGVkZ2U6IEJlaGF2aW9yYWwgU2NpZW5jZXMiO31pOjE4O086ODoic3RkQ2xhc3MiOjI6e3M6ODoic2tpbGxfaWQiO2k6MTk7czoxMDoic2tpbGxfbmFtZSI7czoxNzoiS25vd2xlZGdlOiBDaXZpY3MiO31pOjE5O086ODoic3RkQ2xhc3MiOjI6e3M6ODoic2tpbGxfaWQiO2k6MjA7czoxMDoic2tpbGxfbmFtZSI7czoyNToiS25vd2xlZGdlOiBDdXJyZW50IEV2ZW50cyI7fWk6MjA7Tzo4OiJzdGRDbGFzcyI6Mjp7czo4OiJza2lsbF9pZCI7aToyMTtzOjEwOiJza2lsbF9uYW1lIjtzOjI1OiJLbm93bGVkZ2U6IEVhcnRoIFNjaWVuY2VzIjt9aToyMTtPOjg6InN0ZENsYXNzIjoyOntzOjg6InNraWxsX2lkIjtpOjIyO3M6MTA6InNraWxsX25hbWUiO3M6MTg6Iktub3dsZWRnZTogSGlzdG9yeSI7fWk6MjI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo4OiJza2lsbF9pZCI7aToyMztzOjEwOiJza2lsbF9uYW1lIjtzOjI0OiJLbm93bGVkZ2U6IExpZmUgU2NpZW5jZXMiO31pOjIzO086ODoic3RkQ2xhc3MiOjI6e3M6ODoic2tpbGxfaWQiO2k6MjQ7czoxMDoic2tpbGxfbmFtZSI7czoyODoiS25vd2xlZGdlOiBQaHlzaWNhbCBTY2llbmNlcyI7fWk6MjQ7Tzo4OiJzdGRDbGFzcyI6Mjp7czo4OiJza2lsbF9pZCI7aToyNTtzOjEwOiJza2lsbF9uYW1lIjtzOjIyOiJLbm93bGVkZ2U6IFBvcCBDdWx0dXJlIjt9aToyNTtPOjg6InN0ZENsYXNzIjoyOntzOjg6InNraWxsX2lkIjtpOjI2O3M6MTA6InNraWxsX25hbWUiO3M6MjE6Iktub3dsZWRnZTogU3RyZWV0d2lzZSI7fWk6MjY7Tzo4OiJzdGRDbGFzcyI6Mjp7czo4OiJza2lsbF9pZCI7aToyNztzOjEwOiJza2lsbF9uYW1lIjtzOjE4OiJLbm93bGVkZ2U6IFRhY3RpY3MiO31pOjI3O086ODoic3RkQ2xhc3MiOjI6e3M6ODoic2tpbGxfaWQiO2k6Mjg7czoxMDoic2tpbGxfbmFtZSI7czoyMToiS25vd2xlZGdlOiBUZWNobm9sb2d5Ijt9aToyODtPOjg6InN0ZENsYXNzIjoyOntzOjg6InNraWxsX2lkIjtpOjI5O3M6MTA6InNraWxsX25hbWUiO3M6MzA6Iktub3dsZWRnZTogVGhlb2xvZ3kvUGhpbG9zb3BoeSI7fWk6Mjk7Tzo4OiJzdGRDbGFzcyI6Mjp7czo4OiJza2lsbF9pZCI7aTozMDtzOjEwOiJza2lsbF9uYW1lIjtzOjg6Ikxhbmd1YWdlIjt9aTozMDtPOjg6InN0ZENsYXNzIjoyOntzOjg6InNraWxsX2lkIjtpOjMxO3M6MTA6InNraWxsX25hbWUiO3M6ODoiTWVkaWNpbmUiO31pOjMxO086ODoic3RkQ2xhc3MiOjI6e3M6ODoic2tpbGxfaWQiO2k6MzI7czoxMDoic2tpbGxfbmFtZSI7czo2OiJOb3RpY2UiO31pOjMyO086ODoic3RkQ2xhc3MiOjI6e3M6ODoic2tpbGxfaWQiO2k6MzM7czoxMDoic2tpbGxfbmFtZSI7czo3OiJQZXJmb3JtIjt9aTozMztPOjg6InN0ZENsYXNzIjoyOntzOjg6InNraWxsX2lkIjtpOjM0O3M6MTA6InNraWxsX25hbWUiO3M6NToiUGlsb3QiO31pOjM0O086ODoic3RkQ2xhc3MiOjI6e3M6ODoic2tpbGxfaWQiO2k6MzU7czoxMDoic2tpbGxfbmFtZSI7czoxMDoiUHJvZmVzc2lvbiI7fWk6MzU7Tzo4OiJzdGRDbGFzcyI6Mjp7czo4OiJza2lsbF9pZCI7aTozNjtzOjEwOiJza2lsbF9uYW1lIjtzOjQ6IlJpZGUiO31pOjM2O086ODoic3RkQ2xhc3MiOjI6e3M6ODoic2tpbGxfaWQiO2k6Mzc7czoxMDoic2tpbGxfbmFtZSI7czo2OiJTZWFyY2giO31pOjM3O086ODoic3RkQ2xhc3MiOjI6e3M6ODoic2tpbGxfaWQiO2k6Mzg7czoxMDoic2tpbGxfbmFtZSI7czoxMjoiU2Vuc2UgTW90aXZlIjt9aTozODtPOjg6InN0ZENsYXNzIjoyOntzOjg6InNraWxsX2lkIjtpOjM5O3M6MTA6InNraWxsX25hbWUiO3M6MTU6IlNsZWlnaHQgT2YgSGFuZCI7fWk6Mzk7Tzo4OiJzdGRDbGFzcyI6Mjp7czo4OiJza2lsbF9pZCI7aTo0MDtzOjEwOiJza2lsbF9uYW1lIjtzOjc6IlN0ZWFsdGgiO31pOjQwO086ODoic3RkQ2xhc3MiOjI6e3M6ODoic2tpbGxfaWQiO2k6NDE7czoxMDoic2tpbGxfbmFtZSI7czo4OiJTdXJ2aXZhbCI7fWk6NDE7Tzo4OiJzdGRDbGFzcyI6Mjp7czo4OiJza2lsbF9pZCI7aTo0MjtzOjEwOiJza2lsbF9uYW1lIjtzOjQ6IlN3aW0iO319czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0MjE5ODA4NDI7czoxOiJjIjtpOjE0MjE5NDAwMDQ7czoxOiJsIjtzOjE6IjAiO319',1421980842);

/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table skillsList
# ------------------------------------------------------------

DROP TABLE IF EXISTS `skillsList`;

CREATE TABLE `skillsList` (
  `skill_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

LOCK TABLES `skillsList` WRITE;
/*!40000 ALTER TABLE `skillsList` DISABLE KEYS */;

INSERT INTO `skillsList` (`skill_id`, `skill_name`)
VALUES
	(1,'Acrobatics'),
	(2,'Bluff'),
	(3,'Climb'),
	(4,'Computers'),
	(5,'Concentration'),
	(6,'Craft'),
	(7,'Diplomacy'),
	(8,'Disable Device'),
	(9,'Disguise'),
	(10,'Drive'),
	(11,'Escape Artist'),
	(12,'Gather Information'),
	(13,'Handle Animal'),
	(14,'Intimidate'),
	(15,'Investigate'),
	(16,'Knowledge: Arcane Lore'),
	(17,'Knowledge: Art'),
	(18,'Knowledge: Behavioral Sciences'),
	(19,'Knowledge: Civics'),
	(20,'Knowledge: Current Events'),
	(21,'Knowledge: Earth Sciences'),
	(22,'Knowledge: History'),
	(23,'Knowledge: Life Sciences'),
	(24,'Knowledge: Physical Sciences'),
	(25,'Knowledge: Pop Culture'),
	(26,'Knowledge: Streetwise'),
	(27,'Knowledge: Tactics'),
	(28,'Knowledge: Technology'),
	(29,'Knowledge: Theology/Philosophy'),
	(30,'Language'),
	(31,'Medicine'),
	(32,'Notice'),
	(33,'Perform'),
	(34,'Pilot'),
	(35,'Profession'),
	(36,'Ride'),
	(37,'Search'),
	(38,'Sense Motive'),
	(39,'Sleight Of Hand'),
	(40,'Stealth'),
	(41,'Survival'),
	(42,'Swim');

/*!40000 ALTER TABLE `skillsList` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `email`, `username`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'testing@gmail.com','thisUser','$2y$10$pr.kbI26/hEpnuY9AczXb.I.Mefi6ryHpqQefBCNUgpxTSjiPSgmC','','2015-01-12 00:42:40','2015-01-12 00:42:40'),
	(2,'a@gmail.com','uss','$2y$10$6RMH.GK1L0nA/f3Eqf9JbePgbTA3S/R6KUyFibPlvqGcPY9IS14R6','GNcVabiUSeFdpWENMamSaqb97LpCzBKODxg51hWRXkp7gR8aSAR463UkOraW','2015-01-12 00:47:27','2015-01-14 00:38:34'),
	(12,'zz@email.com','ZZtop','$2y$10$Qoa5CZC.10mMBrr6GefyDOjJqqjpAJ36iKXqpXNHN1oW4WXoA6Q9W','','2015-01-16 20:03:24','2015-01-16 20:03:24');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

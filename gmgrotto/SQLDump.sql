# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.38)
# Database: gmg
# Generation Time: 2015-01-29 21:02:59 +0000
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `char_abilities` WRITE;
/*!40000 ALTER TABLE `char_abilities` DISABLE KEYS */;

INSERT INTO `char_abilities` (`id`, `char_id`, `str_rank`, `str_mod`, `dex_rank`, `dex_mod`, `con_rank`, `con_mod`, `int_rank`, `int_mod`, `wis_rank`, `wis_mod`, `cha_rank`, `cha_mod`)
VALUES
	(24,35,16,3,12,1,18,4,18,4,10,0,18,4),
	(25,36,18,4,16,3,16,3,10,0,10,0,16,3),
	(26,37,10,0,16,3,10,0,18,4,18,4,18,4),
	(47,62,14,2,18,4,14,2,14,2,18,4,20,5),
	(49,64,13,1,15,2,15,2,17,2,16,3,15,2);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `char_attacks` WRITE;
/*!40000 ALTER TABLE `char_attacks` DISABLE KEYS */;

INSERT INTO `char_attacks` (`attackId`, `charId`, `attack_name`, `attack_score`)
VALUES
	(27,35,'Knives',10),
	(28,36,'Blast',8),
	(29,37,'Sleep',6),
	(30,62,'Pistol',12);

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
	(35,'Jack Brown',10,155,'Force Ops',0,5,0,'5\'11\"','180lbs',27),
	(36,'Harry Rochester',7,85,'FenDogs',1,2,1,'6\'3\"','200lbs',23),
	(37,'Serena Mills',8,120,'Force Ops',0,0,0,'5\'2\"','90lbs',24),
	(62,'Donald Fargo',10,150,'None',0,2,0,'5\'11\"','179 lbs',27),
	(64,'Jackie Billings',10,154,'None',0,0,0,'5 feet','125 lbs',28);

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
	(35,7,7,5,5,18,5,7,7,4,3,6),
	(36,4,16,4,4,16,4,16,16,2,5,6),
	(37,7,4,0,0,14,0,4,4,6,4,6),
	(62,4,6,-3,7,13,8,6,6,12,6,8),
	(64,2,5,1,2,16,1,5,5,2,4,0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `char_drawbacks` WRITE;
/*!40000 ALTER TABLE `char_drawbacks` DISABLE KEYS */;

INSERT INTO `char_drawbacks` (`id`, `char_id`, `drawback`, `db_cost`)
VALUES
	(6,36,'Obvious Meta',2);

/*!40000 ALTER TABLE `char_drawbacks` ENABLE KEYS */;
UNLOCK TABLES;


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
  CONSTRAINT `char_feats_ibfk_2` FOREIGN KEY (`feat_id`) REFERENCES `featsList` (`feat_id`),
  CONSTRAINT `char_feats_ibfk_3` FOREIGN KEY (`char_id`) REFERENCES `charList` (`charId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `char_feats` WRITE;
/*!40000 ALTER TABLE `char_feats` DISABLE KEYS */;

INSERT INTO `char_feats` (`id`, `char_id`, `feat_id`, `feat_ranks`)
VALUES
	(49,35,2,1),
	(50,35,3,1),
	(51,35,5,1),
	(52,35,11,1),
	(53,35,12,1),
	(54,35,13,1),
	(55,36,1,1),
	(56,36,11,1),
	(57,36,14,1),
	(58,36,37,1),
	(59,36,86,1),
	(78,37,24,2),
	(79,37,11,1),
	(80,37,12,1),
	(81,37,5,1),
	(82,37,43,1),
	(83,37,56,1),
	(155,62,53,0),
	(156,62,4,3),
	(157,62,9,3),
	(158,62,59,2),
	(159,62,12,2),
	(160,62,78,1),
	(161,62,60,1),
	(162,62,61,1),
	(163,62,31,1),
	(164,62,39,3),
	(165,62,85,1),
	(176,64,3,1),
	(177,64,5,1),
	(178,64,10,1),
	(179,64,11,1),
	(180,64,12,1),
	(181,64,13,1),
	(182,64,14,1),
	(183,64,16,1),
	(184,64,17,1),
	(185,64,18,1),
	(186,64,19,2),
	(187,64,28,1),
	(188,64,29,1),
	(189,64,30,1),
	(190,64,31,1),
	(191,64,35,2),
	(192,64,36,1),
	(193,64,37,1),
	(194,64,38,1),
	(195,64,39,1),
	(196,64,40,1),
	(197,64,46,1),
	(198,64,48,1),
	(199,64,51,1),
	(200,64,52,1),
	(201,64,58,1),
	(202,64,62,1),
	(203,64,67,1),
	(204,64,69,1),
	(205,64,72,1),
	(206,64,85,1),
	(207,64,86,1),
	(208,64,88,1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `char_powers` WRITE;
/*!40000 ALTER TABLE `char_powers` DISABLE KEYS */;

INSERT INTO `char_powers` (`id`, `char_id`, `power_id`, `power_ranks`, `notes`)
VALUES
	(34,35,3,4,'Linked To Death Touch'),
	(35,35,25,2,''),
	(36,35,4,8,'Linked to Death Touch'),
	(37,36,11,7,''),
	(38,36,61,7,'FL: Permanent'),
	(48,37,10,2,''),
	(49,37,13,4,''),
	(50,37,96,6,''),
	(64,62,58,8,''),
	(65,62,106,10,''),
	(66,62,95,2,''),
	(73,64,3,1,''),
	(74,64,6,1,''),
	(75,64,12,1,''),
	(76,64,25,1,''),
	(77,64,40,1,''),
	(78,64,65,1,''),
	(79,64,69,1,''),
	(80,64,79,1,''),
	(81,64,80,1,''),
	(82,64,85,1,''),
	(83,64,95,1,''),
	(84,64,105,1,''),
	(85,64,117,1,'');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `char_skills` WRITE;
/*!40000 ALTER TABLE `char_skills` DISABLE KEYS */;

INSERT INTO `char_skills` (`id`, `charId`, `skill_Id`, `skill_total`, `skill_ranks`, `skill_abil`)
VALUES
	(43,35,2,8,4,4),
	(44,35,10,3,2,1),
	(45,35,14,8,4,4),
	(46,35,15,7,3,4),
	(47,35,18,7,3,4),
	(48,35,26,8,4,4),
	(49,36,1,5,2,3),
	(50,36,2,7,4,3),
	(51,36,25,2,2,0),
	(52,36,27,2,2,0),
	(53,36,32,2,2,0),
	(54,36,37,3,3,0),
	(55,36,38,7,4,3),
	(56,36,40,5,2,3),
	(93,37,2,8,4,4),
	(94,37,7,8,4,4),
	(95,37,8,7,4,3),
	(96,37,11,7,4,3),
	(97,37,12,8,4,4),
	(98,37,16,8,4,4),
	(99,37,18,12,8,4),
	(100,37,25,6,2,4),
	(101,37,26,8,4,4),
	(102,37,31,8,4,4),
	(103,37,38,8,4,4),
	(104,37,40,7,4,3),
	(234,62,12,11,6,5),
	(235,62,14,17,12,5),
	(236,62,15,8,6,2),
	(237,62,26,8,6,2),
	(238,62,32,12,8,4),
	(239,62,37,8,6,2),
	(240,62,38,14,10,4),
	(241,62,40,10,6,4),
	(258,64,1,6,4,2),
	(259,64,3,5,4,1),
	(260,64,5,11,8,3),
	(261,64,6,7,4,3),
	(262,64,8,7,4,3),
	(263,64,10,6,4,2),
	(264,64,11,6,4,2),
	(265,64,12,6,4,2),
	(266,64,14,6,4,2),
	(267,64,16,11,8,3),
	(268,64,18,7,4,3),
	(269,64,22,11,8,3),
	(270,64,26,7,4,3),
	(271,64,29,7,4,3),
	(272,64,30,8,8,0),
	(273,64,31,7,4,3),
	(274,64,33,6,4,2),
	(275,64,35,7,4,3),
	(276,64,36,6,4,2),
	(277,64,37,7,4,3),
	(278,64,39,6,4,2),
	(279,64,40,6,4,2),
	(280,64,41,7,4,3),
	(281,64,42,5,4,1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `charList` WRITE;
/*!40000 ALTER TABLE `charList` DISABLE KEYS */;

INSERT INTO `charList` (`charId`, `userId`, `charName`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(35,'2','Blade','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(36,'2','Icon','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(37,'2','Serenity','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(62,'2','Dark Avenger','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(64,'2','Dabbler','','0000-00-00 00:00:00','0000-00-00 00:00:00');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
	('4a2903e77808a153b931a2fe0e7ae1015daae2e1','YToxNDp7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoibVA1SDBxN1VTZ1FTQnFzUEpMUDloQXJJZlgwekJ0NHVpbzRyUFJkMSI7czozODoibG9naW5fODJlNWQyYzU2YmRkMDgxMTMxOGYwY2YwNzhiNzhiZmMiO2k6MjtzOjM6InVpZCI7aToyO3M6NToidW5hbWUiO3M6MzoidXNzIjtzOjU6ImZlYXRzIjthOjg4OntpOjA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjE7czo5OiJmZWF0X25hbWUiO3M6MTU6IkFjY3VyYXRlIEF0dGFjayI7czo4OiJtdWx0aXBsZSI7aTowO31pOjE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjI7czo5OiJmZWF0X25hbWUiO3M6MTQ6IkFsbC1PdXQgQXR0YWNrIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6MjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MztzOjk6ImZlYXRfbmFtZSI7czoxMjoiQXR0YWNrIEZvY3VzIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6MztPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NDtzOjk6ImZlYXRfbmFtZSI7czoyMToiQXR0YWNrIFNwZWNpYWxpemF0aW9uIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6NDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NTtzOjk6ImZlYXRfbmFtZSI7czoxMToiQmxpbmQtRmlnaHQiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo1O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo2O3M6OToiZmVhdF9uYW1lIjtzOjk6IkNob2tlaG9sZCI7czo4OiJtdWx0aXBsZSI7aTowO31pOjY7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjc7czo5OiJmZWF0X25hbWUiO3M6MTU6IkNyaXRpY2FsIFN0cmlrZSI7czo4OiJtdWx0aXBsZSI7aTowO31pOjc7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjg7czo5OiJmZWF0X25hbWUiO3M6MTY6IkRlZmVuc2l2ZSBBdHRhY2siO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo4O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo5O3M6OToiZmVhdF9uYW1lIjtzOjE0OiJEZWZlbnNpdmUgUm9sbCI7czo4OiJtdWx0aXBsZSI7aToxO31pOjk7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjEwO3M6OToiZmVhdF9uYW1lIjtzOjExOiJEb2RnZSBGb2N1cyI7czo4OiJtdWx0aXBsZSI7aToxO31pOjEwO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToxMTtzOjk6ImZlYXRfbmFtZSI7czoxNDoiRWx1c2l2ZSBUYXJnZXQiO3M6ODoibXVsdGlwbGUiO2k6MDt9aToxMTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MTI7czo5OiJmZWF0X25hbWUiO3M6NzoiRXZhc2lvbiI7czo4OiJtdWx0aXBsZSI7aToxO31pOjEyO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToxMztzOjk6ImZlYXRfbmFtZSI7czoxMjoiRmFzdCBPdmVycnVuIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6MTM7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjE0O3M6OToiZmVhdF9uYW1lIjtzOjE5OiJGYXZvcmVkIEVudmlyb25tZW50IjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6MTQ7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjE1O3M6OToiZmVhdF9uYW1lIjtzOjE2OiJGYXZvcmVkIE9wcG9uZW50IjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6MTU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjE2O3M6OToiZmVhdF9uYW1lIjtzOjE3OiJHcmFwcGxpbmcgRmluZXNzZSI7czo4OiJtdWx0aXBsZSI7aTowO31pOjE2O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToxNztzOjk6ImZlYXRfbmFtZSI7czoxMjoiSW1wcm92ZWQgQWltIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6MTc7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjE4O3M6OToiZmVhdF9uYW1lIjtzOjE0OiJJbXByb3ZlZCBCbG9jayI7czo4OiJtdWx0aXBsZSI7aToxO31pOjE4O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToxOTtzOjk6ImZlYXRfbmFtZSI7czoxNzoiSW1wcm92ZWQgQ3JpdGljYWwiO3M6ODoibXVsdGlwbGUiO2k6MTt9aToxOTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MjA7czo5OiJmZWF0X25hbWUiO3M6MTY6IkltcHJvdmVkIERlZmVuc2UiO3M6ODoibXVsdGlwbGUiO2k6MTt9aToyMDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MjE7czo5OiJmZWF0X25hbWUiO3M6MTU6IkltcHJvdmVkIERpc2FybSI7czo4OiJtdWx0aXBsZSI7aToxO31pOjIxO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToyMjtzOjk6ImZlYXRfbmFtZSI7czoxMzoiSW1wcm92ZWQgR3JhYiI7czo4OiJtdWx0aXBsZSI7aTowO31pOjIyO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToyMztzOjk6ImZlYXRfbmFtZSI7czoxNjoiSW1wcm92ZWQgR3JhcHBsZSI7czo4OiJtdWx0aXBsZSI7aTowO31pOjIzO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToyNDtzOjk6ImZlYXRfbmFtZSI7czoxOToiSW1wcm92ZWQgSW5pdGlhdGl2ZSI7czo4OiJtdWx0aXBsZSI7aToxO31pOjI0O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToyNTtzOjk6ImZlYXRfbmFtZSI7czoxNjoiSW1wcm92ZWQgT3ZlcnJ1biI7czo4OiJtdWx0aXBsZSI7aTowO31pOjI1O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToyNjtzOjk6ImZlYXRfbmFtZSI7czoxMjoiSW1wcm92ZWQgUGluIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6MjY7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjI3O3M6OToiZmVhdF9uYW1lIjtzOjE1OiJJbXByb3ZlZCBTdW5kZXIiO3M6ODoibXVsdGlwbGUiO2k6MDt9aToyNztPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6Mjg7czo5OiJmZWF0X25hbWUiO3M6MTQ6IkltcHJvdmVkIFRocm93IjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6Mjg7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjI5O3M6OToiZmVhdF9uYW1lIjtzOjEzOiJJbXByb3ZlZCBUcmlwIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6Mjk7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjMwO3M6OToiZmVhdF9uYW1lIjtzOjE0OiJNb3ZlLUJ5IEFjdGlvbiI7czo4OiJtdWx0aXBsZSI7aTowO31pOjMwO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTozMTtzOjk6ImZlYXRfbmFtZSI7czoxMjoiUG93ZXIgQXR0YWNrIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6MzE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjMyO3M6OToiZmVhdF9uYW1lIjtzOjEyOiJQcmVjaXNlIFNob3QiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTozMjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MzM7czo5OiJmZWF0X25hbWUiO3M6MTQ6IlByb25lIEZpZ2h0aW5nIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6MzM7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjM0O3M6OToiZmVhdF9uYW1lIjtzOjEwOiJRdWljayBEcmF3IjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6MzQ7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjM1O3M6OToiZmVhdF9uYW1lIjtzOjQ6IlJhZ2UiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTozNTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MzY7czo5OiJmZWF0X25hbWUiO3M6MTA6IlJhbmdlZCBQaW4iO3M6ODoibXVsdGlwbGUiO2k6MDt9aTozNjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6Mzc7czo5OiJmZWF0X25hbWUiO3M6ODoiUmVkaXJlY3QiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTozNztPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6Mzg7czo5OiJmZWF0X25hbWUiO3M6NjoiU2V0LVVwIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6Mzg7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjM5O3M6OToiZmVhdF9uYW1lIjtzOjEyOiJTbmVhayBBdHRhY2siO3M6ODoibXVsdGlwbGUiO2k6MTt9aTozOTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NDA7czo5OiJmZWF0X25hbWUiO3M6MTU6IlN0dW5uaW5nIEF0dGFjayI7czo4OiJtdWx0aXBsZSI7aTowO31pOjQwO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo0MTtzOjk6ImZlYXRfbmFtZSI7czoxNToiVGFrZWRvd24gQXR0YWNrIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6NDE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjQyO3M6OToiZmVhdF9uYW1lIjtzOjE2OiJUaHJvd2luZyBNYXN0ZXJ5IjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6NDI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjQzO3M6OToiZmVhdF9uYW1lIjtzOjEzOiJVbmNhbm55IERvZGdlIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6NDM7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjQ0O3M6OToiZmVhdF9uYW1lIjtzOjExOiJXZWFwb24gQmluZCI7czo4OiJtdWx0aXBsZSI7aTowO31pOjQ0O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo0NTtzOjk6ImZlYXRfbmFtZSI7czoxMjoiV2VhcG9uIEJyZWFrIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NDU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjQ2O3M6OToiZmVhdF9uYW1lIjtzOjE1OiJCZWdpbm5lcidzIEx1Y2siO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo0NjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NDc7czo5OiJmZWF0X25hbWUiO3M6NzoiSW5zcGlyZSI7czo4OiJtdWx0aXBsZSI7aToxO31pOjQ3O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo0ODtzOjk6ImZlYXRfbmFtZSI7czoxMDoiTGVhZGVyc2hpcCI7czo4OiJtdWx0aXBsZSI7aTowO31pOjQ4O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo0OTtzOjk6ImZlYXRfbmFtZSI7czo0OiJMdWNrIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6NDk7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjUwO3M6OToiZmVhdF9uYW1lIjtzOjE2OiJTZWl6ZSBJbml0aWF0aXZlIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NTA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjUxO3M6OToiZmVhdF9uYW1lIjtzOjE1OiJVbHRpbWF0ZSBFZmZvcnQiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo1MTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NTI7czo5OiJmZWF0X25hbWUiO3M6MTM6IkFtYmlkZXh0ZXJpdHkiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo1MjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NTM7czo5OiJmZWF0X25hbWUiO3M6MTA6IkFzc2Vzc21lbnQiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo1MztPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NTQ7czo5OiJmZWF0X25hbWUiO3M6NzoiQmVuZWZpdCI7czo4OiJtdWx0aXBsZSI7aToxO31pOjU0O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo1NTtzOjk6ImZlYXRfbmFtZSI7czo3OiJEaWVoYXJkIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NTU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjU2O3M6OToiZmVhdF9uYW1lIjtzOjE0OiJFaWRldGljIE1lbW9yeSI7czo4OiJtdWx0aXBsZSI7aTowO31pOjU2O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo1NztzOjk6ImZlYXRfbmFtZSI7czo5OiJFbmR1cmFuY2UiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo1NztPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NTg7czo5OiJmZWF0X25hbWUiO3M6MjQ6IkVudmlyb25tZW50YWwgQWRhcHRhdGlvbiI7czo4OiJtdWx0aXBsZSI7aTowO31pOjU4O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo1OTtzOjk6ImZlYXRfbmFtZSI7czo5OiJFcXVpcG1lbnQiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo1OTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NjA7czo5OiJmZWF0X25hbWUiO3M6ODoiRmVhcmxlc3MiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo2MDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NjE7czo5OiJmZWF0X25hbWUiO3M6MTc6IkZlYXJzb21lIFByZXNlbmNlIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6NjE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjYyO3M6OToiZmVhdF9uYW1lIjtzOjEwOiJJbnN0YW50IFVwIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NjI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjYzO3M6OToiZmVhdF9uYW1lIjtzOjk6IkludGVycG9zZSI7czo4OiJtdWx0aXBsZSI7aTowO31pOjYzO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo2NDtzOjk6ImZlYXRfbmFtZSI7czoxMToiTWFzdGVyIFBsYW4iO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo2NDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NjU7czo5OiJmZWF0X25hbWUiO3M6NzoiTWluaW9ucyI7czo4OiJtdWx0aXBsZSI7aToxO31pOjY1O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo2NjtzOjk6ImZlYXRfbmFtZSI7czoxMjoiUXVpY2sgQ2hhbmdlIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6NjY7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjY3O3M6OToiZmVhdF9uYW1lIjtzOjEzOiJTZWNvbmQgQ2hhbmNlIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6Njc7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjY4O3M6OToiZmVhdF9uYW1lIjtzOjg6IlNpZGVraWNrIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6Njg7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjY5O3M6OToiZmVhdF9uYW1lIjtzOjg6IlRlYW13b3JrIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6Njk7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjcwO3M6OToiZmVhdF9uYW1lIjtzOjY6IlRyYW5jZSI7czo4OiJtdWx0aXBsZSI7aTowO31pOjcwO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo3MTtzOjk6ImZlYXRfbmFtZSI7czoxNToiQWNyb2JhdGljIEJsdWZmIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NzE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjcyO3M6OToiZmVhdF9uYW1lIjtzOjE0OiJBbmltYWwgRW1wYXRoeSI7czo4OiJtdWx0aXBsZSI7aTowO31pOjcyO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo3MztzOjk6ImZlYXRfbmFtZSI7czo5OiJBcnRpZmljZXIiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo3MztPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NzQ7czo5OiJmZWF0X25hbWUiO3M6MTA6IkF0dHJhY3RpdmUiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo3NDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NzU7czo5OiJmZWF0X25hbWUiO3M6OToiQ29ubmVjdGVkIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NzU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjc2O3M6OToiZmVhdF9uYW1lIjtzOjg6IkNvbnRhY3RzIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NzY7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjc3O3M6OToiZmVhdF9uYW1lIjtzOjg6IkRpc3RyYWN0IjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6Nzc7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjc4O3M6OToiZmVhdF9uYW1lIjtzOjk6IkZhc2NpbmF0ZSI7czo4OiJtdWx0aXBsZSI7aToxO31pOjc4O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo3OTtzOjk6ImZlYXRfbmFtZSI7czoxOToiSGlkZSBJbiBQbGFpbiBTaWdodCI7czo4OiJtdWx0aXBsZSI7aTowO31pOjc5O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo4MDtzOjk6ImZlYXRfbmFtZSI7czoxNjoiSW1wcm92aXNlZCBUb29scyI7czo4OiJtdWx0aXBsZSI7aTowO31pOjgwO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo4MTtzOjk6ImZlYXRfbmFtZSI7czo4OiJJbnZlbnRvciI7czo4OiJtdWx0aXBsZSI7aTowO31pOjgxO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo4MjtzOjk6ImZlYXRfbmFtZSI7czoxODoiSmFjay1PZi1BbGwtVHJhZGVzIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6ODI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjgzO3M6OToiZmVhdF9uYW1lIjtzOjk6IlJpdHVhbGlzdCI7czo4OiJtdWx0aXBsZSI7aTowO31pOjgzO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo4NDtzOjk6ImZlYXRfbmFtZSI7czoxMzoiU2tpbGwgTWFzdGVyeSI7czo4OiJtdWx0aXBsZSI7aToxO31pOjg0O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo4NTtzOjk6ImZlYXRfbmFtZSI7czo3OiJTdGFydGxlIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6ODU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjg2O3M6OToiZmVhdF9uYW1lIjtzOjU6IlRhdW50IjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6ODY7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjg3O3M6OToiZmVhdF9uYW1lIjtzOjU6IlRyYWNrIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6ODc7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjg4O3M6OToiZmVhdF9uYW1lIjtzOjEzOiJXZWxsLUluZm9ybWVkIjtzOjg6Im11bHRpcGxlIjtpOjA7fX1zOjY6InBvd2VycyI7YToxMTk6e2k6MDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjE7czoxMDoicG93ZXJfbmFtZSI7czoxMToiQWJvc29ycHRpb24iO3M6MTA6InBvd2VyX2Nvc3QiO2k6NDtzOjc6Im5vX3JhbmsiO2k6MDt9aToxO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MjtzOjEwOiJwb3dlcl9uYW1lIjtzOjQ6IkFjaWQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MztzOjc6Im5vX3JhbmsiO2k6MDt9aToyO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MztzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJBZHJlbmFsIFN1cmdlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6MztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjQ7czoxMDoicG93ZXJfbmFtZSI7czo5OiJBZ2UgU2hpZnQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6ODtzOjc6Im5vX3JhbmsiO2k6MTt9aTo0O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NTtzOjEwOiJwb3dlcl9uYW1lIjtzOjExOiJBaXIgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjU7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo2O3M6MTA6InBvd2VyX25hbWUiO3M6MTQ6IkFsdGVybmF0ZSBGb3JtIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjU7czo3OiJub19yYW5rIjtpOjA7fWk6NjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjc7czoxMDoicG93ZXJfbmFtZSI7czoxNDoiQW5pbWFsIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo3O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6ODtzOjEwOiJwb3dlcl9uYW1lIjtzOjE0OiJBbmltYWwgTWltaWNyeSI7czoxMDoicG93ZXJfY29zdCI7aTo5O3M6Nzoibm9fcmFuayI7aTowO31pOjg7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo5O3M6MTA6InBvd2VyX25hbWUiO3M6MTU6IkFuaW1hdGUgT2JqZWN0cyI7czoxMDoicG93ZXJfY29zdCI7aTozO3M6Nzoibm9fcmFuayI7aTowO31pOjk7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMDtzOjEwOiJwb3dlcl9uYW1lIjtzOjExOiJBc3RyYWwgRm9ybSI7czoxMDoicG93ZXJfY29zdCI7aTo1O3M6Nzoibm9fcmFuayI7aTowO31pOjEwO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTE7czoxMDoicG93ZXJfbmFtZSI7czo1OiJCbGFzdCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjExO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTI7czoxMDoicG93ZXJfbmFtZSI7czoxNzoiQmxlbmRpbmc6IFBhcnRpYWwiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MTt9aToxMjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEzO3M6MTA6InBvd2VyX25hbWUiO3M6MTU6IkJsZW5kaW5nOiBUb3RhbCI7czoxMDoicG93ZXJfY29zdCI7aTo0O3M6Nzoibm9fcmFuayI7aToxO31pOjEzO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTQ7czoxMDoicG93ZXJfbmFtZSI7czo0OiJCbHVyIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjQ7czo3OiJub19yYW5rIjtpOjE7fWk6MTQ7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxNTtzOjEwOiJwb3dlcl9uYW1lIjtzOjg6IkJvdW5jaW5nIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTU7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxNjtzOjEwOiJwb3dlcl9uYW1lIjtzOjM6IkNoaSI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjE2O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTc7czoxMDoicG93ZXJfbmFtZSI7czoxMzoiQ2xhaXJhdWRpZW5jZSI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjE3O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTg7czoxMDoicG93ZXJfbmFtZSI7czoxMjoiQ2xhaXJ2b3lhbmNlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTg7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxOTtzOjEwOiJwb3dlcl9uYW1lIjtzOjEyOiJDb2xkIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxOTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjIwO3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IkNvbG9yIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToyMDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjIxO3M6MTA6InBvd2VyX25hbWUiO3M6OToiQ29ycm9zaW9uIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjM7czo3OiJub19yYW5rIjtpOjA7fWk6MjE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToyMjtzOjEwOiJwb3dlcl9uYW1lIjtzOjIxOiJDb3NtaWMgRW5lcmd5IENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToyMjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjIzO3M6MTA6InBvd2VyX25hbWUiO3M6MTY6IkRhcmtuZXNzIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToyMztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjI0O3M6MTA6InBvd2VyX25hbWUiO3M6ODoiRGF0YWxpbmsiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aToyNDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjI1O3M6MTA6InBvd2VyX25hbWUiO3M6MTE6IkRlYXRoIFRvdWNoIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6MjU7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToyNjtzOjEwOiJwb3dlcl9uYW1lIjtzOjIwOiJEZXZpY2U6IEVhc3kgVG8gTG9zZSI7czoxMDoicG93ZXJfY29zdCI7aTozO3M6Nzoibm9fcmFuayI7aTowO31pOjI2O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6Mjc7czoxMDoicG93ZXJfbmFtZSI7czoyMDoiRGV2aWNlOiBIYXJkIFRvIExvc2UiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NDtzOjc6Im5vX3JhbmsiO2k6MDt9aToyNztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjI4O3M6MTA6InBvd2VyX25hbWUiO3M6MTk6IkRpbWVuc2lvbmFsIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToyODtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjI5O3M6MTA6InBvd2VyX25hbWUiO3M6MTg6IkRpbWVuc2lvbmFsIFBvY2tldCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjI5O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MzA7czoxMDoicG93ZXJfbmFtZSI7czo3OiJEaXNlYXNlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjM7czo3OiJub19yYW5rIjtpOjA7fWk6MzA7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTozMTtzOjEwOiJwb3dlcl9uYW1lIjtzOjE0OiJEaXNpbnRlZ3JhdGlvbiI7czoxMDoicG93ZXJfY29zdCI7aTo1O3M6Nzoibm9fcmFuayI7aTowO31pOjMxO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MzI7czoxMDoicG93ZXJfbmFtZSI7czoxMjoiRGlzcGxhY2VtZW50IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjQ7czo3OiJub19yYW5rIjtpOjE7fWk6MzI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTozMztzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJEcmVhbSBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjM7czo3OiJub19yYW5rIjtpOjA7fWk6MzM7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTozNDtzOjEwOiJwb3dlcl9uYW1lIjtzOjEyOiJEcmVhbSBUcmF2ZWwiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aTozNDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjM1O3M6MTA6InBvd2VyX25hbWUiO3M6MTE6IkR1cGxpY2F0aW9uIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MzU7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTozNjtzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJFYXJ0aCBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MzY7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTozNztzOjEwOiJwb3dlcl9uYW1lIjtzOjEwOiJFbGFzdGljaXR5IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6Mzc7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTozODtzOjEwOiJwb3dlcl9uYW1lIjtzOjE4OiJFbGVjdHJpY2FsIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTozODtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjM5O3M6MTA6InBvd2VyX25hbWUiO3M6MTE6IkVtcG93ZXJtZW50IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjY7czo3OiJub19yYW5rIjtpOjA7fWk6Mzk7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo0MDtzOjEwOiJwb3dlcl9uYW1lIjtzOjExOiJFbmVyZ3kgQXVyYSI7czoxMDoicG93ZXJfY29zdCI7aTo0O3M6Nzoibm9fcmFuayI7aTowO31pOjQwO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NDE7czoxMDoicG93ZXJfbmFtZSI7czoxODoiRXZvbHV0aW9uYXJ5IFNoaWZ0IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjEwO3M6Nzoibm9fcmFuayI7aToxO31pOjQxO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NDI7czoxMDoicG93ZXJfbmFtZSI7czo4OiJFeG9yY2lzbSI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjQyO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NDM7czoxMDoicG93ZXJfbmFtZSI7czoxMjoiRmlyZSBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6NDM7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo0NDtzOjEwOiJwb3dlcl9uYW1lIjtzOjE2OiJGb3JjZSBDb25zdHJ1Y3RzIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6NDQ7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo0NTtzOjEwOiJwb3dlcl9uYW1lIjtzOjExOiJGb3JjZSBGaWVsZCI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjQ1O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NDY7czoxMDoicG93ZXJfbmFtZSI7czoxNjoiRnJpY3Rpb24gQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aTozO3M6Nzoibm9fcmFuayI7aTowO31pOjQ2O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NDc7czoxMDoicG93ZXJfbmFtZSI7czoyMToiR2FkZ2V0czogRWFzeSBUbyBMb3NlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjY7czo3OiJub19yYW5rIjtpOjA7fWk6NDc7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo0ODtzOjEwOiJwb3dlcl9uYW1lIjtzOjIxOiJHYWRnZXRzOiBIYXJkIFRvIExvc2UiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NztzOjc6Im5vX3JhbmsiO2k6MDt9aTo0ODtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjQ5O3M6MTA6InBvd2VyX25hbWUiO3M6NzoiR2VzdGFsdCI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjQ5O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NTA7czoxMDoicG93ZXJfbmFtZSI7czo4OiJHcmFmdGluZyI7czoxMDoicG93ZXJfY29zdCI7aToxMTtzOjc6Im5vX3JhbmsiO2k6MDt9aTo1MDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjUxO3M6MTA6InBvd2VyX25hbWUiO3M6MTU6IkdyYXZpdHkgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjUxO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NTI7czoxMDoicG93ZXJfbmFtZSI7czoxNjoiSGVsbGZpcmUgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjUyO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NTM7czoxMDoicG93ZXJfbmFtZSI7czo4OiJIeXBub3NpcyI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjUzO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NTQ7czoxMDoicG93ZXJfbmFtZSI7czo2OiJJZ25pdGUiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MztzOjc6Im5vX3JhbmsiO2k6MDt9aTo1NDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjU1O3M6MTA6InBvd2VyX25hbWUiO3M6MTE6IkltbW9ydGFsaXR5IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjU7czo3OiJub19yYW5rIjtpOjE7fWk6NTU7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo1NjtzOjEwOiJwb3dlcl9uYW1lIjtzOjk6IkltbXV0YWJsZSI7czoxMDoicG93ZXJfY29zdCI7aToxMDtzOjc6Im5vX3JhbmsiO2k6MTt9aTo1NjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjU3O3M6MTA6InBvd2VyX25hbWUiO3M6MjA6IkludmlzaWJsaXR5OiBQYXJ0aWFsIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjQ7czo3OiJub19yYW5rIjtpOjE7fWk6NTc7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo1ODtzOjEwOiJwb3dlcl9uYW1lIjtzOjE4OiJJbnZpc2liaWxpdHk6IEZ1bGwiO3M6MTA6InBvd2VyX2Nvc3QiO2k6ODtzOjc6Im5vX3JhbmsiO2k6MTt9aTo1ODtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjU5O3M6MTA6InBvd2VyX25hbWUiO3M6MTU6IktpbmV0aWMgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjU5O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NjA7czoxMDoicG93ZXJfbmFtZSI7czoxMjoiTGlmZSBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjQ7czo3OiJub19yYW5rIjtpOjA7fWk6NjA7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo2MTtzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJMaWdodCBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6NjE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo2MjtzOjEwOiJwb3dlcl9uYW1lIjtzOjE3OiJNYWNoaW5lIEFuaW1hdGlvbiI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjYyO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NjM7czoxMDoicG93ZXJfbmFtZSI7czo1OiJNYWdpYyI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjYzO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NjQ7czoxMDoicG93ZXJfbmFtZSI7czoxNjoiTWFnbmV0aWMgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjY0O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NjU7czoxMDoicG93ZXJfbmFtZSI7czoxMjoiTWVudGFsIEJsYXN0IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjQ7czo3OiJub19yYW5rIjtpOjA7fWk6NjU7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo2NjtzOjEwOiJwb3dlcl9uYW1lIjtzOjE4OiJNZW50YWwgRHVwbGljYXRpb24iO3M6MTA6InBvd2VyX2Nvc3QiO2k6MztzOjc6Im5vX3JhbmsiO2k6MDt9aTo2NjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjY3O3M6MTA6InBvd2VyX25hbWUiO3M6MTc6Ik1pY3Jvd2F2ZSBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6Njc7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo2ODtzOjEwOiJwb3dlcl9uYW1lIjtzOjExOiJNaW5kIFNoaWVsZCI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjY4O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6Njk7czoxMDoicG93ZXJfbmFtZSI7czoxMToiTWluZCBTd2l0Y2giO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo2OTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjcwO3M6MTA6InBvd2VyX25hbWUiO3M6MTI6Ik1pcnJvciBJbWFnZSI7czoxMDoicG93ZXJfY29zdCI7aTo0O3M6Nzoibm9fcmFuayI7aToxO31pOjcwO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NzE7czoxMDoicG93ZXJfbmFtZSI7czo4OiJNdXRhdGlvbiI7czoxMDoicG93ZXJfY29zdCI7aTo0O3M6Nzoibm9fcmFuayI7aTowO31pOjcxO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NzI7czoxMDoicG93ZXJfbmFtZSI7czo3OiJOZW1lc2lzIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjg7czo3OiJub19yYW5rIjtpOjA7fWk6NzI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo3MztzOjEwOiJwb3dlcl9uYW1lIjtzOjE0OiJPYmplY3QgTWltaWNyeSI7czoxMDoicG93ZXJfY29zdCI7aTo2O3M6Nzoibm9fcmFuayI7aTowO31pOjczO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NzQ7czoxMDoicG93ZXJfbmFtZSI7czo0OiJQYWluIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjU7czo3OiJub19yYW5rIjtpOjA7fWk6NzQ7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo3NTtzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJQZXRyaWZpY2F0aW9uIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjM7czo3OiJub19yYW5rIjtpOjA7fWk6NzU7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo3NjtzOjEwOiJwb3dlcl9uYW1lIjtzOjEwOiJQaGVyb21vbmVzIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjQ7czo3OiJub19yYW5rIjtpOjA7fWk6NzY7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo3NztzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJQbGFudCBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6Nzc7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo3ODtzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJQbGFudCBNaW1pY3J5IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjk7czo3OiJub19yYW5rIjtpOjA7fWk6Nzg7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo3OTtzOjEwOiJwb3dlcl9uYW1lIjtzOjE0OiJQbGFzbWEgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjc5O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6ODA7czoxMDoicG93ZXJfbmFtZSI7czoxMDoiUG9zc2Vzc2lvbiI7czoxMDoicG93ZXJfY29zdCI7aTozO3M6Nzoibm9fcmFuayI7aTowO31pOjgwO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6ODE7czoxMDoicG93ZXJfbmFtZSI7czoxMzoiUG93ZXIgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjgxO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6ODI7czoxMDoicG93ZXJfbmFtZSI7czoxMzoiUG93ZXIgUmVzZXJ2ZSI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjgyO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6ODM7czoxMDoicG93ZXJfbmFtZSI7czoxNjoiUG93ZXIgUmVzaXN0YW5jZSI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjgzO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6ODQ7czoxMDoicG93ZXJfbmFtZSI7czoxNToiUHJlaGluc2lsZSBIYWlyIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6ODQ7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo4NTtzOjEwOiJwb3dlcl9uYW1lIjtzOjE3OiJSYWRpYXRpb24gQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjg1O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6ODY7czoxMDoicG93ZXJfbmFtZSI7czoxNjoiUmVmbGVjdGlvbiBGaWVsZCI7czoxMDoicG93ZXJfY29zdCI7aTo4O3M6Nzoibm9fcmFuayI7aTowO31pOjg2O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6ODc7czoxMDoicG93ZXJfbmFtZSI7czoxMzoiUmVmbGV4IE1lbW9yeSI7czoxMDoicG93ZXJfY29zdCI7aTo5O3M6Nzoibm9fcmFuayI7aTowO31pOjg3O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6ODg7czoxMDoicG93ZXJfbmFtZSI7czoxMjoiU2Vuc29yeSBMaW5rIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6ODg7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo4OTtzOjEwOiJwb3dlcl9uYW1lIjtzOjI0OiJTZW5zb3J5IFNoaWVsZDogIDEgc2Vuc2UiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aTo4OTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjkwO3M6MTA6InBvd2VyX25hbWUiO3M6MjY6IlNlbnNvcnkgU2hpZWxkOiBBbGwgc2Vuc2VzIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6OTA7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo5MTtzOjEwOiJwb3dlcl9uYW1lIjtzOjEyOiJTaGFwZSBNYXR0ZXIiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NDtzOjc6Im5vX3JhbmsiO2k6MDt9aTo5MTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjkyO3M6MTA6InBvd2VyX25hbWUiO3M6MTA6IlNoYXBlc2hpZnQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6ODtzOjc6Im5vX3JhbmsiO2k6MDt9aTo5MjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjkzO3M6MTA6InBvd2VyX25hbWUiO3M6NjoiU2hpZWxkIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6OTM7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo5NDtzOjEwOiJwb3dlcl9uYW1lIjtzOjIyOiJTaWxlbmNlOiBIdW1hbiBIZWFyaW5nIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6OTQ7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo5NTtzOjEwOiJwb3dlcl9uYW1lIjtzOjI3OiJTaWxlbmNlOiBJbnZpc2libGUgdG8gU29uYXIiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo5NTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjk2O3M6MTA6InBvd2VyX25hbWUiO3M6NToiU2xlZXAiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MztzOjc6Im5vX3JhbmsiO2k6MDt9aTo5NjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjk3O3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IlNvbmljIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo5NztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjk4O3M6MTA6InBvd2VyX25hbWUiO3M6MTU6IlNwYXRpYWwgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjk4O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6OTk7czoxMDoicG93ZXJfbmFtZSI7czo4OiJTcGlubmluZyI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjk5O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTAwO3M6MTA6InBvd2VyX25hbWUiO3M6MTQ6IlNwaXJpdCBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTAwO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTAxO3M6MTA6InBvd2VyX25hbWUiO3M6NjoiU3RyaWtlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6MTAxO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTAyO3M6MTA6InBvd2VyX25hbWUiO3M6MTE6IlN1cGVyLVNwZWVkIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjU7czo3OiJub19yYW5rIjtpOjA7fWk6MTAyO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTAzO3M6MTA6InBvd2VyX25hbWUiO3M6MTk6IlN1cGVyLVZlbnRyaWxvcXVpc20iO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMDM7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMDQ7czoxMDoicG93ZXJfbmFtZSI7czoxOToiU3VzcGVuZGVkIEFuaW1hdGlvbiI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjEwNDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEwNTtzOjEwOiJwb3dlcl9uYW1lIjtzOjExOiJUZWxla2luZXNpcyI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjEwNTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEwNjtzOjEwOiJwb3dlcl9uYW1lIjtzOjEyOiJUZWxlbG9jYXRpb24iO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMDY7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMDc7czoxMDoicG93ZXJfbmFtZSI7czo5OiJUZWxlcGF0aHkiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMDc7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMDg7czoxMDoicG93ZXJfbmFtZSI7czoxNToiVGhlcm1hbCBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTA4O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTA5O3M6MTA6InBvd2VyX25hbWUiO3M6MTI6IlRpbWUgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aTo3O3M6Nzoibm9fcmFuayI7aTowO31pOjEwOTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjExMDtzOjEwOiJwb3dlcl9uYW1lIjtzOjk6IlRpbWUgU3RvcCI7czoxMDoicG93ZXJfY29zdCI7aTo3O3M6Nzoibm9fcmFuayI7aTowO31pOjExMDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjExMTtzOjEwOiJwb3dlcl9uYW1lIjtzOjg6IlRyYW5zbWl0IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6MTExO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTEyO3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IlRyYW5zbXV0YXRpb24iO3M6MTA6InBvd2VyX2Nvc3QiO2k6NTtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMTI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMTM7czoxMDoicG93ZXJfbmFtZSI7czoxMzoiVHJvdWJsZXNlZWtlciI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjExMztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjExNDtzOjEwOiJwb3dlcl9uYW1lIjtzOjIwOiJVbml2ZXJzYWwgVHJhbnNsYXRvciI7czoxMDoicG93ZXJfY29zdCI7aTo4O3M6Nzoibm9fcmFuayI7aToxO31pOjExNDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjExNTtzOjEwOiJwb3dlcl9uYW1lIjtzOjE3OiJWaWJyYXRpb24gQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjExNTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjExNjtzOjEwOiJwb3dlcl9uYW1lIjtzOjQ6IldhcmQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMTY7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMTc7czoxMDoicG93ZXJfbmFtZSI7czoxMzoiV2F0ZXIgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjExNztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjExODtzOjEwOiJwb3dlcl9uYW1lIjtzOjE2OiJXZWFwb24gU3VtbW9uaW5nIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTE4O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTE5O3M6MTA6InBvd2VyX25hbWUiO3M6MTU6IldlYXRoZXIgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO319czo2OiJza2lsbHMiO2E6NDI6e2k6MDtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjE7czoxMDoic2tpbGxfbmFtZSI7czoxMDoiQWNyb2JhdGljcyI7czo5OiJza2lsbF9tb2QiO3M6MzoiZGV4Ijt9aToxO086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MjtzOjEwOiJza2lsbF9uYW1lIjtzOjU6IkJsdWZmIjtzOjk6InNraWxsX21vZCI7czozOiJjaGEiO31pOjI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aTozO3M6MTA6InNraWxsX25hbWUiO3M6NToiQ2xpbWIiO3M6OToic2tpbGxfbW9kIjtzOjM6InN0ciI7fWk6MztPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjQ7czoxMDoic2tpbGxfbmFtZSI7czo5OiJDb21wdXRlcnMiO3M6OToic2tpbGxfbW9kIjtzOjM6ImludCI7fWk6NDtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjU7czoxMDoic2tpbGxfbmFtZSI7czoxMzoiQ29uY2VudHJhdGlvbiI7czo5OiJza2lsbF9tb2QiO3M6Mzoid2lzIjt9aTo1O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6NjtzOjEwOiJza2lsbF9uYW1lIjtzOjU6IkNyYWZ0IjtzOjk6InNraWxsX21vZCI7czozOiJpbnQiO31pOjY7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aTo3O3M6MTA6InNraWxsX25hbWUiO3M6OToiRGlwbG9tYWN5IjtzOjk6InNraWxsX21vZCI7czozOiJjaGEiO31pOjc7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aTo4O3M6MTA6InNraWxsX25hbWUiO3M6MTQ6IkRpc2FibGUgRGV2aWNlIjtzOjk6InNraWxsX21vZCI7czozOiJpbnQiO31pOjg7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aTo5O3M6MTA6InNraWxsX25hbWUiO3M6ODoiRGlzZ3Vpc2UiO3M6OToic2tpbGxfbW9kIjtzOjM6ImNoYSI7fWk6OTtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjEwO3M6MTA6InNraWxsX25hbWUiO3M6NToiRHJpdmUiO3M6OToic2tpbGxfbW9kIjtzOjM6ImRleCI7fWk6MTA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aToxMTtzOjEwOiJza2lsbF9uYW1lIjtzOjEzOiJFc2NhcGUgQXJ0aXN0IjtzOjk6InNraWxsX21vZCI7czozOiJkZXgiO31pOjExO086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MTI7czoxMDoic2tpbGxfbmFtZSI7czoxODoiR2F0aGVyIEluZm9ybWF0aW9uIjtzOjk6InNraWxsX21vZCI7czozOiJjaGEiO31pOjEyO086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MTM7czoxMDoic2tpbGxfbmFtZSI7czoxMzoiSGFuZGxlIEFuaW1hbCI7czo5OiJza2lsbF9tb2QiO3M6MzoiY2hhIjt9aToxMztPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjE0O3M6MTA6InNraWxsX25hbWUiO3M6MTA6IkludGltaWRhdGUiO3M6OToic2tpbGxfbW9kIjtzOjM6ImNoYSI7fWk6MTQ7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aToxNTtzOjEwOiJza2lsbF9uYW1lIjtzOjExOiJJbnZlc3RpZ2F0ZSI7czo5OiJza2lsbF9tb2QiO3M6MzoiaW50Ijt9aToxNTtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjE2O3M6MTA6InNraWxsX25hbWUiO3M6MjI6Iktub3dsZWRnZTogQXJjYW5lIExvcmUiO3M6OToic2tpbGxfbW9kIjtzOjM6ImludCI7fWk6MTY7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aToxNztzOjEwOiJza2lsbF9uYW1lIjtzOjE0OiJLbm93bGVkZ2U6IEFydCI7czo5OiJza2lsbF9tb2QiO3M6MzoiaW50Ijt9aToxNztPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjE4O3M6MTA6InNraWxsX25hbWUiO3M6MzA6Iktub3dsZWRnZTogQmVoYXZpb3JhbCBTY2llbmNlcyI7czo5OiJza2lsbF9tb2QiO3M6MzoiaW50Ijt9aToxODtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjE5O3M6MTA6InNraWxsX25hbWUiO3M6MTc6Iktub3dsZWRnZTogQ2l2aWNzIjtzOjk6InNraWxsX21vZCI7czozOiJpbnQiO31pOjE5O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MjA7czoxMDoic2tpbGxfbmFtZSI7czoyNToiS25vd2xlZGdlOiBDdXJyZW50IEV2ZW50cyI7czo5OiJza2lsbF9tb2QiO3M6MzoiaW50Ijt9aToyMDtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjIxO3M6MTA6InNraWxsX25hbWUiO3M6MjU6Iktub3dsZWRnZTogRWFydGggU2NpZW5jZXMiO3M6OToic2tpbGxfbW9kIjtzOjM6ImludCI7fWk6MjE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aToyMjtzOjEwOiJza2lsbF9uYW1lIjtzOjE4OiJLbm93bGVkZ2U6IEhpc3RvcnkiO3M6OToic2tpbGxfbW9kIjtzOjM6ImludCI7fWk6MjI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aToyMztzOjEwOiJza2lsbF9uYW1lIjtzOjI0OiJLbm93bGVkZ2U6IExpZmUgU2NpZW5jZXMiO3M6OToic2tpbGxfbW9kIjtzOjM6ImludCI7fWk6MjM7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aToyNDtzOjEwOiJza2lsbF9uYW1lIjtzOjI4OiJLbm93bGVkZ2U6IFBoeXNpY2FsIFNjaWVuY2VzIjtzOjk6InNraWxsX21vZCI7czozOiJpbnQiO31pOjI0O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MjU7czoxMDoic2tpbGxfbmFtZSI7czoyMjoiS25vd2xlZGdlOiBQb3AgQ3VsdHVyZSI7czo5OiJza2lsbF9tb2QiO3M6MzoiaW50Ijt9aToyNTtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjI2O3M6MTA6InNraWxsX25hbWUiO3M6MjE6Iktub3dsZWRnZTogU3RyZWV0d2lzZSI7czo5OiJza2lsbF9tb2QiO3M6MzoiaW50Ijt9aToyNjtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjI3O3M6MTA6InNraWxsX25hbWUiO3M6MTg6Iktub3dsZWRnZTogVGFjdGljcyI7czo5OiJza2lsbF9tb2QiO3M6MzoiaW50Ijt9aToyNztPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjI4O3M6MTA6InNraWxsX25hbWUiO3M6MjE6Iktub3dsZWRnZTogVGVjaG5vbG9neSI7czo5OiJza2lsbF9tb2QiO3M6MzoiaW50Ijt9aToyODtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjI5O3M6MTA6InNraWxsX25hbWUiO3M6MzA6Iktub3dsZWRnZTogVGhlb2xvZ3kvUGhpbG9zb3BoeSI7czo5OiJza2lsbF9tb2QiO3M6MzoiaW50Ijt9aToyOTtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjMwO3M6MTA6InNraWxsX25hbWUiO3M6ODoiTGFuZ3VhZ2UiO3M6OToic2tpbGxfbW9kIjtzOjE6Ii0iO31pOjMwO086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MzE7czoxMDoic2tpbGxfbmFtZSI7czo4OiJNZWRpY2luZSI7czo5OiJza2lsbF9tb2QiO3M6Mzoid2lzIjt9aTozMTtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjMyO3M6MTA6InNraWxsX25hbWUiO3M6NjoiTm90aWNlIjtzOjk6InNraWxsX21vZCI7czozOiJ3aXMiO31pOjMyO086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MzM7czoxMDoic2tpbGxfbmFtZSI7czo3OiJQZXJmb3JtIjtzOjk6InNraWxsX21vZCI7czozOiJjaGEiO31pOjMzO086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MzQ7czoxMDoic2tpbGxfbmFtZSI7czo1OiJQaWxvdCI7czo5OiJza2lsbF9tb2QiO3M6MzoiZGV4Ijt9aTozNDtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjM1O3M6MTA6InNraWxsX25hbWUiO3M6MTA6IlByb2Zlc3Npb24iO3M6OToic2tpbGxfbW9kIjtzOjM6IndpcyI7fWk6MzU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aTozNjtzOjEwOiJza2lsbF9uYW1lIjtzOjQ6IlJpZGUiO3M6OToic2tpbGxfbW9kIjtzOjM6ImRleCI7fWk6MzY7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aTozNztzOjEwOiJza2lsbF9uYW1lIjtzOjY6IlNlYXJjaCI7czo5OiJza2lsbF9tb2QiO3M6MzoiaW50Ijt9aTozNztPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjM4O3M6MTA6InNraWxsX25hbWUiO3M6MTI6IlNlbnNlIE1vdGl2ZSI7czo5OiJza2lsbF9tb2QiO3M6Mzoid2lzIjt9aTozODtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjM5O3M6MTA6InNraWxsX25hbWUiO3M6MTU6IlNsZWlnaHQgT2YgSGFuZCI7czo5OiJza2lsbF9tb2QiO3M6MzoiZGV4Ijt9aTozOTtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjQwO3M6MTA6InNraWxsX25hbWUiO3M6NzoiU3RlYWx0aCI7czo5OiJza2lsbF9tb2QiO3M6MzoiZGV4Ijt9aTo0MDtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjQxO3M6MTA6InNraWxsX25hbWUiO3M6ODoiU3Vydml2YWwiO3M6OToic2tpbGxfbW9kIjtzOjM6IndpcyI7fWk6NDE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aTo0MjtzOjEwOiJza2lsbF9uYW1lIjtzOjQ6IlN3aW0iO3M6OToic2tpbGxfbW9kIjtzOjM6InN0ciI7fX1zOjU6InNhdmVzIjthOjU6e2k6MDtPOjg6InN0ZENsYXNzIjo1OntzOjg6ImNoYXJOYW1lIjtzOjU6IkJsYWRlIjtzOjU6InRvdWdoIjtpOjU7czo0OiJ3aWxsIjtpOjQ7czo0OiJmb3J0IjtpOjM7czozOiJyZWYiO2k6Njt9aToxO086ODoic3RkQ2xhc3MiOjU6e3M6ODoiY2hhck5hbWUiO3M6NzoiRGFiYmxlciI7czo1OiJ0b3VnaCI7aToyO3M6NDoid2lsbCI7aToyO3M6NDoiZm9ydCI7aTo0O3M6MzoicmVmIjtpOjA7fWk6MjtPOjg6InN0ZENsYXNzIjo1OntzOjg6ImNoYXJOYW1lIjtzOjEyOiJEYXJrIEF2ZW5nZXIiO3M6NToidG91Z2giO2k6NztzOjQ6IndpbGwiO2k6MTI7czo0OiJmb3J0IjtpOjY7czozOiJyZWYiO2k6ODt9aTozO086ODoic3RkQ2xhc3MiOjU6e3M6ODoiY2hhck5hbWUiO3M6NDoiSWNvbiI7czo1OiJ0b3VnaCI7aTo0O3M6NDoid2lsbCI7aToyO3M6NDoiZm9ydCI7aTo1O3M6MzoicmVmIjtpOjY7fWk6NDtPOjg6InN0ZENsYXNzIjo1OntzOjg6ImNoYXJOYW1lIjtzOjg6IlNlcmVuaXR5IjtzOjU6InRvdWdoIjtpOjA7czo0OiJ3aWxsIjtpOjY7czo0OiJmb3J0IjtpOjQ7czozOiJyZWYiO2k6Njt9fXM6MTE6InNraWxsU2VsZWN0IjthOjU4OntpOjA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo1OiJCbGFkZSI7czoxMDoic2tpbGxfbmFtZSI7czo1OiJCbHVmZiI7czoxMToic2tpbGxfdG90YWwiO2k6ODt9aToxO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NToiQmxhZGUiO3M6MTA6InNraWxsX25hbWUiO3M6NToiRHJpdmUiO3M6MTE6InNraWxsX3RvdGFsIjtpOjM7fWk6MjtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjU6IkJsYWRlIjtzOjEwOiJza2lsbF9uYW1lIjtzOjEwOiJJbnRpbWlkYXRlIjtzOjExOiJza2lsbF90b3RhbCI7aTo4O31pOjM7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo1OiJCbGFkZSI7czoxMDoic2tpbGxfbmFtZSI7czoxMToiSW52ZXN0aWdhdGUiO3M6MTE6InNraWxsX3RvdGFsIjtpOjc7fWk6NDtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjU6IkJsYWRlIjtzOjEwOiJza2lsbF9uYW1lIjtzOjMwOiJLbm93bGVkZ2U6IEJlaGF2aW9yYWwgU2NpZW5jZXMiO3M6MTE6InNraWxsX3RvdGFsIjtpOjc7fWk6NTtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjU6IkJsYWRlIjtzOjEwOiJza2lsbF9uYW1lIjtzOjIxOiJLbm93bGVkZ2U6IFN0cmVldHdpc2UiO3M6MTE6InNraWxsX3RvdGFsIjtpOjg7fWk6NjtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjc6IkRhYmJsZXIiO3M6MTA6InNraWxsX25hbWUiO3M6MTA6IkFjcm9iYXRpY3MiO3M6MTE6InNraWxsX3RvdGFsIjtpOjY7fWk6NztPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjc6IkRhYmJsZXIiO3M6MTA6InNraWxsX25hbWUiO3M6NToiQ2xpbWIiO3M6MTE6InNraWxsX3RvdGFsIjtpOjU7fWk6ODtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjc6IkRhYmJsZXIiO3M6MTA6InNraWxsX25hbWUiO3M6MTM6IkNvbmNlbnRyYXRpb24iO3M6MTE6InNraWxsX3RvdGFsIjtpOjExO31pOjk7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo3OiJEYWJibGVyIjtzOjEwOiJza2lsbF9uYW1lIjtzOjU6IkNyYWZ0IjtzOjExOiJza2lsbF90b3RhbCI7aTo3O31pOjEwO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NzoiRGFiYmxlciI7czoxMDoic2tpbGxfbmFtZSI7czoxNDoiRGlzYWJsZSBEZXZpY2UiO3M6MTE6InNraWxsX3RvdGFsIjtpOjc7fWk6MTE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo3OiJEYWJibGVyIjtzOjEwOiJza2lsbF9uYW1lIjtzOjU6IkRyaXZlIjtzOjExOiJza2lsbF90b3RhbCI7aTo2O31pOjEyO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NzoiRGFiYmxlciI7czoxMDoic2tpbGxfbmFtZSI7czoxMzoiRXNjYXBlIEFydGlzdCI7czoxMToic2tpbGxfdG90YWwiO2k6Njt9aToxMztPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjc6IkRhYmJsZXIiO3M6MTA6InNraWxsX25hbWUiO3M6MTg6IkdhdGhlciBJbmZvcm1hdGlvbiI7czoxMToic2tpbGxfdG90YWwiO2k6Njt9aToxNDtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjc6IkRhYmJsZXIiO3M6MTA6InNraWxsX25hbWUiO3M6MTA6IkludGltaWRhdGUiO3M6MTE6InNraWxsX3RvdGFsIjtpOjY7fWk6MTU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo3OiJEYWJibGVyIjtzOjEwOiJza2lsbF9uYW1lIjtzOjIyOiJLbm93bGVkZ2U6IEFyY2FuZSBMb3JlIjtzOjExOiJza2lsbF90b3RhbCI7aToxMTt9aToxNjtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjc6IkRhYmJsZXIiO3M6MTA6InNraWxsX25hbWUiO3M6MzA6Iktub3dsZWRnZTogQmVoYXZpb3JhbCBTY2llbmNlcyI7czoxMToic2tpbGxfdG90YWwiO2k6Nzt9aToxNztPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjc6IkRhYmJsZXIiO3M6MTA6InNraWxsX25hbWUiO3M6MTg6Iktub3dsZWRnZTogSGlzdG9yeSI7czoxMToic2tpbGxfdG90YWwiO2k6MTE7fWk6MTg7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo3OiJEYWJibGVyIjtzOjEwOiJza2lsbF9uYW1lIjtzOjIxOiJLbm93bGVkZ2U6IFN0cmVldHdpc2UiO3M6MTE6InNraWxsX3RvdGFsIjtpOjc7fWk6MTk7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo3OiJEYWJibGVyIjtzOjEwOiJza2lsbF9uYW1lIjtzOjMwOiJLbm93bGVkZ2U6IFRoZW9sb2d5L1BoaWxvc29waHkiO3M6MTE6InNraWxsX3RvdGFsIjtpOjc7fWk6MjA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo3OiJEYWJibGVyIjtzOjEwOiJza2lsbF9uYW1lIjtzOjg6Ikxhbmd1YWdlIjtzOjExOiJza2lsbF90b3RhbCI7aTo4O31pOjIxO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NzoiRGFiYmxlciI7czoxMDoic2tpbGxfbmFtZSI7czo4OiJNZWRpY2luZSI7czoxMToic2tpbGxfdG90YWwiO2k6Nzt9aToyMjtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjc6IkRhYmJsZXIiO3M6MTA6InNraWxsX25hbWUiO3M6NzoiUGVyZm9ybSI7czoxMToic2tpbGxfdG90YWwiO2k6Njt9aToyMztPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjc6IkRhYmJsZXIiO3M6MTA6InNraWxsX25hbWUiO3M6MTA6IlByb2Zlc3Npb24iO3M6MTE6InNraWxsX3RvdGFsIjtpOjc7fWk6MjQ7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo3OiJEYWJibGVyIjtzOjEwOiJza2lsbF9uYW1lIjtzOjQ6IlJpZGUiO3M6MTE6InNraWxsX3RvdGFsIjtpOjY7fWk6MjU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo3OiJEYWJibGVyIjtzOjEwOiJza2lsbF9uYW1lIjtzOjY6IlNlYXJjaCI7czoxMToic2tpbGxfdG90YWwiO2k6Nzt9aToyNjtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjc6IkRhYmJsZXIiO3M6MTA6InNraWxsX25hbWUiO3M6MTU6IlNsZWlnaHQgT2YgSGFuZCI7czoxMToic2tpbGxfdG90YWwiO2k6Njt9aToyNztPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjc6IkRhYmJsZXIiO3M6MTA6InNraWxsX25hbWUiO3M6NzoiU3RlYWx0aCI7czoxMToic2tpbGxfdG90YWwiO2k6Njt9aToyODtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjc6IkRhYmJsZXIiO3M6MTA6InNraWxsX25hbWUiO3M6ODoiU3Vydml2YWwiO3M6MTE6InNraWxsX3RvdGFsIjtpOjc7fWk6Mjk7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo3OiJEYWJibGVyIjtzOjEwOiJza2lsbF9uYW1lIjtzOjQ6IlN3aW0iO3M6MTE6InNraWxsX3RvdGFsIjtpOjU7fWk6MzA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czoxMjoiRGFyayBBdmVuZ2VyIjtzOjEwOiJza2lsbF9uYW1lIjtzOjE4OiJHYXRoZXIgSW5mb3JtYXRpb24iO3M6MTE6InNraWxsX3RvdGFsIjtpOjExO31pOjMxO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6MTI6IkRhcmsgQXZlbmdlciI7czoxMDoic2tpbGxfbmFtZSI7czoxMDoiSW50aW1pZGF0ZSI7czoxMToic2tpbGxfdG90YWwiO2k6MTc7fWk6MzI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czoxMjoiRGFyayBBdmVuZ2VyIjtzOjEwOiJza2lsbF9uYW1lIjtzOjExOiJJbnZlc3RpZ2F0ZSI7czoxMToic2tpbGxfdG90YWwiO2k6ODt9aTozMztPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjEyOiJEYXJrIEF2ZW5nZXIiO3M6MTA6InNraWxsX25hbWUiO3M6MjE6Iktub3dsZWRnZTogU3RyZWV0d2lzZSI7czoxMToic2tpbGxfdG90YWwiO2k6ODt9aTozNDtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjEyOiJEYXJrIEF2ZW5nZXIiO3M6MTA6InNraWxsX25hbWUiO3M6NjoiTm90aWNlIjtzOjExOiJza2lsbF90b3RhbCI7aToxMjt9aTozNTtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjEyOiJEYXJrIEF2ZW5nZXIiO3M6MTA6InNraWxsX25hbWUiO3M6NjoiU2VhcmNoIjtzOjExOiJza2lsbF90b3RhbCI7aTo4O31pOjM2O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6MTI6IkRhcmsgQXZlbmdlciI7czoxMDoic2tpbGxfbmFtZSI7czoxMjoiU2Vuc2UgTW90aXZlIjtzOjExOiJza2lsbF90b3RhbCI7aToxNDt9aTozNztPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjEyOiJEYXJrIEF2ZW5nZXIiO3M6MTA6InNraWxsX25hbWUiO3M6NzoiU3RlYWx0aCI7czoxMToic2tpbGxfdG90YWwiO2k6MTA7fWk6Mzg7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo0OiJJY29uIjtzOjEwOiJza2lsbF9uYW1lIjtzOjEwOiJBY3JvYmF0aWNzIjtzOjExOiJza2lsbF90b3RhbCI7aTo1O31pOjM5O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NDoiSWNvbiI7czoxMDoic2tpbGxfbmFtZSI7czo1OiJCbHVmZiI7czoxMToic2tpbGxfdG90YWwiO2k6Nzt9aTo0MDtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjQ6Ikljb24iO3M6MTA6InNraWxsX25hbWUiO3M6MjI6Iktub3dsZWRnZTogUG9wIEN1bHR1cmUiO3M6MTE6InNraWxsX3RvdGFsIjtpOjI7fWk6NDE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo0OiJJY29uIjtzOjEwOiJza2lsbF9uYW1lIjtzOjE4OiJLbm93bGVkZ2U6IFRhY3RpY3MiO3M6MTE6InNraWxsX3RvdGFsIjtpOjI7fWk6NDI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo0OiJJY29uIjtzOjEwOiJza2lsbF9uYW1lIjtzOjY6Ik5vdGljZSI7czoxMToic2tpbGxfdG90YWwiO2k6Mjt9aTo0MztPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjQ6Ikljb24iO3M6MTA6InNraWxsX25hbWUiO3M6NjoiU2VhcmNoIjtzOjExOiJza2lsbF90b3RhbCI7aTozO31pOjQ0O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NDoiSWNvbiI7czoxMDoic2tpbGxfbmFtZSI7czoxMjoiU2Vuc2UgTW90aXZlIjtzOjExOiJza2lsbF90b3RhbCI7aTo3O31pOjQ1O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NDoiSWNvbiI7czoxMDoic2tpbGxfbmFtZSI7czo3OiJTdGVhbHRoIjtzOjExOiJza2lsbF90b3RhbCI7aTo1O31pOjQ2O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6ODoiU2VyZW5pdHkiO3M6MTA6InNraWxsX25hbWUiO3M6NToiQmx1ZmYiO3M6MTE6InNraWxsX3RvdGFsIjtpOjg7fWk6NDc7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo4OiJTZXJlbml0eSI7czoxMDoic2tpbGxfbmFtZSI7czo5OiJEaXBsb21hY3kiO3M6MTE6InNraWxsX3RvdGFsIjtpOjg7fWk6NDg7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo4OiJTZXJlbml0eSI7czoxMDoic2tpbGxfbmFtZSI7czoxNDoiRGlzYWJsZSBEZXZpY2UiO3M6MTE6InNraWxsX3RvdGFsIjtpOjc7fWk6NDk7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo4OiJTZXJlbml0eSI7czoxMDoic2tpbGxfbmFtZSI7czoxMzoiRXNjYXBlIEFydGlzdCI7czoxMToic2tpbGxfdG90YWwiO2k6Nzt9aTo1MDtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjg6IlNlcmVuaXR5IjtzOjEwOiJza2lsbF9uYW1lIjtzOjE4OiJHYXRoZXIgSW5mb3JtYXRpb24iO3M6MTE6InNraWxsX3RvdGFsIjtpOjg7fWk6NTE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo4OiJTZXJlbml0eSI7czoxMDoic2tpbGxfbmFtZSI7czoyMjoiS25vd2xlZGdlOiBBcmNhbmUgTG9yZSI7czoxMToic2tpbGxfdG90YWwiO2k6ODt9aTo1MjtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjg6IlNlcmVuaXR5IjtzOjEwOiJza2lsbF9uYW1lIjtzOjMwOiJLbm93bGVkZ2U6IEJlaGF2aW9yYWwgU2NpZW5jZXMiO3M6MTE6InNraWxsX3RvdGFsIjtpOjEyO31pOjUzO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6ODoiU2VyZW5pdHkiO3M6MTA6InNraWxsX25hbWUiO3M6MjI6Iktub3dsZWRnZTogUG9wIEN1bHR1cmUiO3M6MTE6InNraWxsX3RvdGFsIjtpOjY7fWk6NTQ7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo4OiJTZXJlbml0eSI7czoxMDoic2tpbGxfbmFtZSI7czoyMToiS25vd2xlZGdlOiBTdHJlZXR3aXNlIjtzOjExOiJza2lsbF90b3RhbCI7aTo4O31pOjU1O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6ODoiU2VyZW5pdHkiO3M6MTA6InNraWxsX25hbWUiO3M6ODoiTWVkaWNpbmUiO3M6MTE6InNraWxsX3RvdGFsIjtpOjg7fWk6NTY7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo4OiJTZXJlbml0eSI7czoxMDoic2tpbGxfbmFtZSI7czoxMjoiU2Vuc2UgTW90aXZlIjtzOjExOiJza2lsbF90b3RhbCI7aTo4O31pOjU3O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6ODoiU2VyZW5pdHkiO3M6MTA6InNraWxsX25hbWUiO3M6NzoiU3RlYWx0aCI7czoxMToic2tpbGxfdG90YWwiO2k6Nzt9fXM6NToibmFtZXMiO2E6NTp7aTowO3M6NToiQmxhZGUiO2k6MTtzOjQ6Ikljb24iO2k6MjtzOjg6IlNlcmVuaXR5IjtpOjM7czoxMjoiRGFyayBBdmVuZ2VyIjtpOjQ7czo3OiJEYWJibGVyIjt9czoxMjoicG93ZXJzU2VsZWN0IjthOjI0OntpOjA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo1OiJCbGFkZSI7czoxMDoicG93ZXJfbmFtZSI7czoxMzoiQWRyZW5hbCBTdXJnZSI7czoxMToicG93ZXJfcmFua3MiO2k6NDt9aToxO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NToiQmxhZGUiO3M6MTA6InBvd2VyX25hbWUiO3M6MTE6IkRlYXRoIFRvdWNoIjtzOjExOiJwb3dlcl9yYW5rcyI7aToyO31pOjI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo1OiJCbGFkZSI7czoxMDoicG93ZXJfbmFtZSI7czo5OiJBZ2UgU2hpZnQiO3M6MTE6InBvd2VyX3JhbmtzIjtpOjg7fWk6MztPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjc6IkRhYmJsZXIiO3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IkFkcmVuYWwgU3VyZ2UiO3M6MTE6InBvd2VyX3JhbmtzIjtpOjE7fWk6NDtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjc6IkRhYmJsZXIiO3M6MTA6InBvd2VyX25hbWUiO3M6MTQ6IkFsdGVybmF0ZSBGb3JtIjtzOjExOiJwb3dlcl9yYW5rcyI7aToxO31pOjU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo3OiJEYWJibGVyIjtzOjEwOiJwb3dlcl9uYW1lIjtzOjE3OiJCbGVuZGluZzogUGFydGlhbCI7czoxMToicG93ZXJfcmFua3MiO2k6MTt9aTo2O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NzoiRGFiYmxlciI7czoxMDoicG93ZXJfbmFtZSI7czoxMToiRGVhdGggVG91Y2giO3M6MTE6InBvd2VyX3JhbmtzIjtpOjE7fWk6NztPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjc6IkRhYmJsZXIiO3M6MTA6InBvd2VyX25hbWUiO3M6MTE6IkVuZXJneSBBdXJhIjtzOjExOiJwb3dlcl9yYW5rcyI7aToxO31pOjg7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo3OiJEYWJibGVyIjtzOjEwOiJwb3dlcl9uYW1lIjtzOjEyOiJNZW50YWwgQmxhc3QiO3M6MTE6InBvd2VyX3JhbmtzIjtpOjE7fWk6OTtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjc6IkRhYmJsZXIiO3M6MTA6InBvd2VyX25hbWUiO3M6MTE6Ik1pbmQgU3dpdGNoIjtzOjExOiJwb3dlcl9yYW5rcyI7aToxO31pOjEwO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NzoiRGFiYmxlciI7czoxMDoicG93ZXJfbmFtZSI7czoxNDoiUGxhc21hIENvbnRyb2wiO3M6MTE6InBvd2VyX3JhbmtzIjtpOjE7fWk6MTE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo3OiJEYWJibGVyIjtzOjEwOiJwb3dlcl9uYW1lIjtzOjEwOiJQb3NzZXNzaW9uIjtzOjExOiJwb3dlcl9yYW5rcyI7aToxO31pOjEyO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NzoiRGFiYmxlciI7czoxMDoicG93ZXJfbmFtZSI7czoxNzoiUmFkaWF0aW9uIENvbnRyb2wiO3M6MTE6InBvd2VyX3JhbmtzIjtpOjE7fWk6MTM7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo3OiJEYWJibGVyIjtzOjEwOiJwb3dlcl9uYW1lIjtzOjI3OiJTaWxlbmNlOiBJbnZpc2libGUgdG8gU29uYXIiO3M6MTE6InBvd2VyX3JhbmtzIjtpOjE7fWk6MTQ7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo3OiJEYWJibGVyIjtzOjEwOiJwb3dlcl9uYW1lIjtzOjExOiJUZWxla2luZXNpcyI7czoxMToicG93ZXJfcmFua3MiO2k6MTt9aToxNTtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjc6IkRhYmJsZXIiO3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IldhdGVyIENvbnRyb2wiO3M6MTE6InBvd2VyX3JhbmtzIjtpOjE7fWk6MTY7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czoxMjoiRGFyayBBdmVuZ2VyIjtzOjEwOiJwb3dlcl9uYW1lIjtzOjE4OiJJbnZpc2liaWxpdHk6IEZ1bGwiO3M6MTE6InBvd2VyX3JhbmtzIjtpOjg7fWk6MTc7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czoxMjoiRGFyayBBdmVuZ2VyIjtzOjEwOiJwb3dlcl9uYW1lIjtzOjEyOiJUZWxlbG9jYXRpb24iO3M6MTE6InBvd2VyX3JhbmtzIjtpOjEwO31pOjE4O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6MTI6IkRhcmsgQXZlbmdlciI7czoxMDoicG93ZXJfbmFtZSI7czoyNzoiU2lsZW5jZTogSW52aXNpYmxlIHRvIFNvbmFyIjtzOjExOiJwb3dlcl9yYW5rcyI7aToyO31pOjE5O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NDoiSWNvbiI7czoxMDoicG93ZXJfbmFtZSI7czo1OiJCbGFzdCI7czoxMToicG93ZXJfcmFua3MiO2k6Nzt9aToyMDtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjQ6Ikljb24iO3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IkxpZ2h0IENvbnRyb2wiO3M6MTE6InBvd2VyX3JhbmtzIjtpOjc7fWk6MjE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo4OiJTZXJlbml0eSI7czoxMDoicG93ZXJfbmFtZSI7czoxMToiQXN0cmFsIEZvcm0iO3M6MTE6InBvd2VyX3JhbmtzIjtpOjI7fWk6MjI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo4OiJTZXJlbml0eSI7czoxMDoicG93ZXJfbmFtZSI7czoxNToiQmxlbmRpbmc6IFRvdGFsIjtzOjExOiJwb3dlcl9yYW5rcyI7aTo0O31pOjIzO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6ODoiU2VyZW5pdHkiO3M6MTA6InBvd2VyX25hbWUiO3M6NToiU2xlZXAiO3M6MTE6InBvd2VyX3JhbmtzIjtpOjY7fX1zOjQ6InNpemUiO3M6MDoiIjtzOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQyMjU2NTMyNztzOjE6ImMiO2k6MTQyMjU0NjcyNDtzOjE6ImwiO3M6MToiMCI7fX0=',1422565327);

/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table skillsList
# ------------------------------------------------------------

DROP TABLE IF EXISTS `skillsList`;

CREATE TABLE `skillsList` (
  `skill_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(50) DEFAULT NULL,
  `skill_mod` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `skillsList` WRITE;
/*!40000 ALTER TABLE `skillsList` DISABLE KEYS */;

INSERT INTO `skillsList` (`skill_id`, `skill_name`, `skill_mod`)
VALUES
	(1,'Acrobatics','dex'),
	(2,'Bluff','cha'),
	(3,'Climb','str'),
	(4,'Computers','int'),
	(5,'Concentration','wis'),
	(6,'Craft','int'),
	(7,'Diplomacy','cha'),
	(8,'Disable Device','int'),
	(9,'Disguise','cha'),
	(10,'Drive','dex'),
	(11,'Escape Artist','dex'),
	(12,'Gather Information','cha'),
	(13,'Handle Animal','cha'),
	(14,'Intimidate','cha'),
	(15,'Investigate','int'),
	(16,'Knowledge: Arcane Lore','int'),
	(17,'Knowledge: Art','int'),
	(18,'Knowledge: Behavioral Sciences','int'),
	(19,'Knowledge: Civics','int'),
	(20,'Knowledge: Current Events','int'),
	(21,'Knowledge: Earth Sciences','int'),
	(22,'Knowledge: History','int'),
	(23,'Knowledge: Life Sciences','int'),
	(24,'Knowledge: Physical Sciences','int'),
	(25,'Knowledge: Pop Culture','int'),
	(26,'Knowledge: Streetwise','int'),
	(27,'Knowledge: Tactics','int'),
	(28,'Knowledge: Technology','int'),
	(29,'Knowledge: Theology/Philosophy','int'),
	(30,'Language','-'),
	(31,'Medicine','wis'),
	(32,'Notice','wis'),
	(33,'Perform','cha'),
	(34,'Pilot','dex'),
	(35,'Profession','wis'),
	(36,'Ride','dex'),
	(37,'Search','int'),
	(38,'Sense Motive','wis'),
	(39,'Sleight Of Hand','dex'),
	(40,'Stealth','dex'),
	(41,'Survival','wis'),
	(42,'Swim','str');

/*!40000 ALTER TABLE `skillsList` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table scratchpad
# ------------------------------------------------------------

DROP TABLE IF EXISTS `scratchpad`;

CREATE TABLE `scratchpad` (
  `textId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`textId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `scratchpad` WRITE;
/*!40000 ALTER TABLE `scratchpad` DISABLE KEYS */;

INSERT INTO `scratchpad` (`textId`, `userId`, `notes`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(2,'2','','','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `scratchpad` ENABLE KEYS */;
UNLOCK TABLES;


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

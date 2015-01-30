# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.38)
# Database: gmg
# Generation Time: 2015-01-30 04:47:02 +0000
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
	(51,66,17,3,21,5,13,1,14,1,12,1,18,4),
	(56,71,13,1,11,0,14,2,12,2,12,1,12,1),
	(58,73,12,1,14,2,12,1,11,1,14,2,12,1);

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
	(66,'Joey Blanco',10,151,'None',0,0,0,'6 feet','206 lbs',31),
	(71,'Bobby',5,75,'None',0,0,0,'6 feet','140 lbs',27),
	(73,'Charles',4,73,'None',0,0,0,'7 feet','127 lbs',36);

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
	(66,5,6,3,2,11,3,6,6,5,2,5),
	(71,0,3,1,2,10,1,3,3,3,4,3),
	(73,2,2,1,1,12,1,2,2,1,5,0);

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
	(248,66,2,1),
	(249,66,8,1),
	(250,66,9,2),
	(251,66,10,1),
	(252,66,14,1),
	(253,66,20,1),
	(254,66,21,1),
	(255,66,25,1),
	(256,66,26,1),
	(257,66,29,1),
	(258,66,31,1),
	(259,66,32,3),
	(260,66,33,1),
	(261,66,36,1),
	(262,66,37,1),
	(263,66,43,1),
	(264,66,44,1),
	(265,66,45,1),
	(266,66,47,1),
	(267,66,53,1),
	(268,66,62,1),
	(269,66,67,1),
	(270,66,71,1),
	(271,66,72,1),
	(272,66,73,1),
	(273,66,83,1),
	(274,66,87,1),
	(341,71,5,1),
	(342,71,10,1),
	(343,71,12,1),
	(344,71,20,1),
	(345,71,21,1),
	(346,71,26,1),
	(347,71,40,1),
	(348,71,49,1),
	(349,71,53,1),
	(350,71,57,1),
	(351,71,65,1),
	(352,71,67,1),
	(371,73,10,2),
	(372,73,29,1),
	(373,73,37,1),
	(374,73,41,2),
	(375,73,50,1),
	(376,73,55,1),
	(377,73,71,1),
	(378,73,74,1);

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
	(101,66,11,1,''),
	(102,66,35,1,''),
	(103,66,50,1,''),
	(104,66,71,1,''),
	(105,66,110,1,''),
	(106,66,127,1,''),
	(107,66,137,1,''),
	(141,71,53,2,''),
	(142,71,79,1,''),
	(143,71,107,1,''),
	(144,71,140,1,''),
	(145,71,151,1,''),
	(146,71,153,1,''),
	(158,73,5,1,''),
	(159,73,21,1,''),
	(160,73,34,1,''),
	(161,73,38,1,''),
	(162,73,105,1,''),
	(163,73,145,1,'');

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
	(317,66,1,9,4,5),
	(318,66,2,8,4,4),
	(319,66,4,6,4,2),
	(320,66,5,9,8,1),
	(321,66,8,6,4,2),
	(322,66,11,9,4,5),
	(323,66,12,8,4,4),
	(324,66,14,8,4,4),
	(325,66,15,10,8,2),
	(326,66,16,6,4,2),
	(327,66,20,10,8,2),
	(328,66,25,6,4,2),
	(329,66,28,6,4,2),
	(330,66,31,5,4,1),
	(331,66,32,5,4,1),
	(332,66,33,12,8,4),
	(333,66,35,9,8,1),
	(334,66,36,17,12,5),
	(335,66,37,6,4,2),
	(336,66,39,9,4,5),
	(408,71,10,4,4,0),
	(409,71,12,9,8,1),
	(410,71,14,5,4,1),
	(411,71,17,5,4,1),
	(412,71,19,5,4,1),
	(413,71,20,5,4,1),
	(414,71,23,9,8,1),
	(415,71,24,5,4,1),
	(416,71,27,9,8,1),
	(417,71,33,5,4,1),
	(418,71,34,4,4,0),
	(419,71,36,4,4,0),
	(420,71,38,9,8,1),
	(440,73,1,6,4,2),
	(441,73,4,4,4,0),
	(442,73,5,6,4,2),
	(443,73,7,5,4,1),
	(444,73,12,5,4,1),
	(445,73,19,4,4,0),
	(446,73,20,12,12,0),
	(447,73,21,4,4,0),
	(448,73,25,4,4,0),
	(449,73,27,4,4,0),
	(450,73,28,4,4,0),
	(451,73,29,4,4,0),
	(452,73,31,6,4,2),
	(453,73,33,9,8,1),
	(454,73,34,6,4,2),
	(455,73,39,6,4,2);

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
	(66,'2','Judgement','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(71,'17','Billy','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(73,'17','Charlie','','0000-00-00 00:00:00','0000-00-00 00:00:00');

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
	(85,'2','Map','jpg','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(87,'2','Terabyte\'s Outfit','jpg','','0000-00-00 00:00:00','0000-00-00 00:00:00');

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
	(119,'Weather Control',2,0),
	(120,'Additional Limbs',1,0),
	(121,'Anatomic Separation',2,0),
	(122,'Burrowing',1,0),
	(123,'Communication',1,0),
	(124,'Comprehend',1,0),
	(125,'Concealment',2,0),
	(126,'Confuse',1,0),
	(127,'Create Object',2,0),
	(128,'Damage',1,0),
	(129,'Density',3,0),
	(130,'Elongation',1,0),
	(131,'Emotion Control',2,0),
	(132,'Fatigue',2,0),
	(133,'Flight',2,0),
	(134,'Growth',3,0),
	(135,'Healing',2,0),
	(136,'Immovable',1,0),
	(137,'Insubstantial',5,0),
	(138,'Leaping',1,0),
	(139,'Luck Control',3,0),
	(140,'Mind Control',2,0),
	(141,'Mind Reading',0,1),
	(142,'Move Object',2,0),
	(143,'Nauseate',2,0),
	(144,'Paralyze',2,0),
	(145,'Probability Control',4,0),
	(146,'Protection',1,0),
	(147,'Quickness',1,0),
	(148,'Regeneration',1,0),
	(149,'Shrinking',1,0),
	(150,'Snare',2,0),
	(151,'Space Travel',1,0),
	(152,'Speed',1,0),
	(153,'Stun',2,0),
	(154,'Suffocate',2,0),
	(155,'Super-Movement',2,0),
	(156,'Super-Senses',1,0),
	(157,'Super-Strength',2,0),
	(158,'Swimming',1,0),
	(159,'Teleport',2,0),
	(160,'Trip',1,0);

/*!40000 ALTER TABLE `powersList` ENABLE KEYS */;
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
	(2,'2','All Chars get -2 reflex for drinking before work.','','0000-00-00 00:00:00','0000-00-00 00:00:00'),
	(3,'17','All Chars get -2 Reflex for drinking before work!','','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `scratchpad` ENABLE KEYS */;
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
	('83077d20b7c53dee976f4f90eeeee0a06c803bac','YTozOntzOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NjoiX3Rva2VuIjtzOjQwOiJ0RzlCeUhHUG5PWDNtMmttM0JleU5paTR0OUFGcFJ1TFpLb2Z0UE5PIjtzOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQyMjU4ODYyOTtzOjE6ImMiO2k6MTQyMjU4NDQ0MjtzOjE6ImwiO3M6MToiMCI7fX0=',1422588629),
	('db6641669c7e054a2b75e7ee4ded25d8fe6db7c7','YToxNzp7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoic0VvWTc0QzMzQUIzekx6OUpIUnlPYlAwZHNlOTRiQW03ejQzVkdwQiI7czozODoibG9naW5fODJlNWQyYzU2YmRkMDgxMTMxOGYwY2YwNzhiNzhiZmMiO2k6MTc7czozOiJ1aWQiO2k6MTc7czo1OiJ1bmFtZSI7czo5OiJQZXJzb25OZXciO3M6NToiZmVhdHMiO2E6ODg6e2k6MDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MTtzOjk6ImZlYXRfbmFtZSI7czoxNToiQWNjdXJhdGUgQXR0YWNrIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6MTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NzE7czo5OiJmZWF0X25hbWUiO3M6MTU6IkFjcm9iYXRpYyBCbHVmZiI7czo4OiJtdWx0aXBsZSI7aTowO31pOjI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjI7czo5OiJmZWF0X25hbWUiO3M6MTQ6IkFsbC1PdXQgQXR0YWNrIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6MztPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NTI7czo5OiJmZWF0X25hbWUiO3M6MTM6IkFtYmlkZXh0ZXJpdHkiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo0O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo3MjtzOjk6ImZlYXRfbmFtZSI7czoxNDoiQW5pbWFsIEVtcGF0aHkiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo1O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo3MztzOjk6ImZlYXRfbmFtZSI7czo5OiJBcnRpZmljZXIiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo2O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo1MztzOjk6ImZlYXRfbmFtZSI7czoxMDoiQXNzZXNzbWVudCI7czo4OiJtdWx0aXBsZSI7aTowO31pOjc7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjM7czo5OiJmZWF0X25hbWUiO3M6MTI6IkF0dGFjayBGb2N1cyI7czo4OiJtdWx0aXBsZSI7aToxO31pOjg7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjQ7czo5OiJmZWF0X25hbWUiO3M6MjE6IkF0dGFjayBTcGVjaWFsaXphdGlvbiI7czo4OiJtdWx0aXBsZSI7aToxO31pOjk7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjc0O3M6OToiZmVhdF9uYW1lIjtzOjEwOiJBdHRyYWN0aXZlIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6MTA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjQ2O3M6OToiZmVhdF9uYW1lIjtzOjE1OiJCZWdpbm5lcidzIEx1Y2siO3M6ODoibXVsdGlwbGUiO2k6MDt9aToxMTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NTQ7czo5OiJmZWF0X25hbWUiO3M6NzoiQmVuZWZpdCI7czo4OiJtdWx0aXBsZSI7aToxO31pOjEyO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo1O3M6OToiZmVhdF9uYW1lIjtzOjExOiJCbGluZC1GaWdodCI7czo4OiJtdWx0aXBsZSI7aTowO31pOjEzO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo2O3M6OToiZmVhdF9uYW1lIjtzOjk6IkNob2tlaG9sZCI7czo4OiJtdWx0aXBsZSI7aTowO31pOjE0O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo3NTtzOjk6ImZlYXRfbmFtZSI7czo5OiJDb25uZWN0ZWQiO3M6ODoibXVsdGlwbGUiO2k6MDt9aToxNTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NzY7czo5OiJmZWF0X25hbWUiO3M6ODoiQ29udGFjdHMiO3M6ODoibXVsdGlwbGUiO2k6MDt9aToxNjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NztzOjk6ImZlYXRfbmFtZSI7czoxNToiQ3JpdGljYWwgU3RyaWtlIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6MTc7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjg7czo5OiJmZWF0X25hbWUiO3M6MTY6IkRlZmVuc2l2ZSBBdHRhY2siO3M6ODoibXVsdGlwbGUiO2k6MDt9aToxODtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6OTtzOjk6ImZlYXRfbmFtZSI7czoxNDoiRGVmZW5zaXZlIFJvbGwiO3M6ODoibXVsdGlwbGUiO2k6MTt9aToxOTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NTU7czo5OiJmZWF0X25hbWUiO3M6NzoiRGllaGFyZCI7czo4OiJtdWx0aXBsZSI7aTowO31pOjIwO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo3NztzOjk6ImZlYXRfbmFtZSI7czo4OiJEaXN0cmFjdCI7czo4OiJtdWx0aXBsZSI7aToxO31pOjIxO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToxMDtzOjk6ImZlYXRfbmFtZSI7czoxMToiRG9kZ2UgRm9jdXMiO3M6ODoibXVsdGlwbGUiO2k6MTt9aToyMjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NTY7czo5OiJmZWF0X25hbWUiO3M6MTQ6IkVpZGV0aWMgTWVtb3J5IjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6MjM7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjExO3M6OToiZmVhdF9uYW1lIjtzOjE0OiJFbHVzaXZlIFRhcmdldCI7czo4OiJtdWx0aXBsZSI7aTowO31pOjI0O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo1NztzOjk6ImZlYXRfbmFtZSI7czo5OiJFbmR1cmFuY2UiO3M6ODoibXVsdGlwbGUiO2k6MTt9aToyNTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NTg7czo5OiJmZWF0X25hbWUiO3M6MjQ6IkVudmlyb25tZW50YWwgQWRhcHRhdGlvbiI7czo4OiJtdWx0aXBsZSI7aTowO31pOjI2O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo1OTtzOjk6ImZlYXRfbmFtZSI7czo5OiJFcXVpcG1lbnQiO3M6ODoibXVsdGlwbGUiO2k6MTt9aToyNztPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MTI7czo5OiJmZWF0X25hbWUiO3M6NzoiRXZhc2lvbiI7czo4OiJtdWx0aXBsZSI7aToxO31pOjI4O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo3ODtzOjk6ImZlYXRfbmFtZSI7czo5OiJGYXNjaW5hdGUiO3M6ODoibXVsdGlwbGUiO2k6MTt9aToyOTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MTM7czo5OiJmZWF0X25hbWUiO3M6MTI6IkZhc3QgT3ZlcnJ1biI7czo4OiJtdWx0aXBsZSI7aTowO31pOjMwO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToxNDtzOjk6ImZlYXRfbmFtZSI7czoxOToiRmF2b3JlZCBFbnZpcm9ubWVudCI7czo4OiJtdWx0aXBsZSI7aToxO31pOjMxO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToxNTtzOjk6ImZlYXRfbmFtZSI7czoxNjoiRmF2b3JlZCBPcHBvbmVudCI7czo4OiJtdWx0aXBsZSI7aToxO31pOjMyO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo2MDtzOjk6ImZlYXRfbmFtZSI7czo4OiJGZWFybGVzcyI7czo4OiJtdWx0aXBsZSI7aTowO31pOjMzO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo2MTtzOjk6ImZlYXRfbmFtZSI7czoxNzoiRmVhcnNvbWUgUHJlc2VuY2UiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTozNDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MTY7czo5OiJmZWF0X25hbWUiO3M6MTc6IkdyYXBwbGluZyBGaW5lc3NlIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6MzU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjc5O3M6OToiZmVhdF9uYW1lIjtzOjE5OiJIaWRlIEluIFBsYWluIFNpZ2h0IjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6MzY7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjE3O3M6OToiZmVhdF9uYW1lIjtzOjEyOiJJbXByb3ZlZCBBaW0iO3M6ODoibXVsdGlwbGUiO2k6MDt9aTozNztPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MTg7czo5OiJmZWF0X25hbWUiO3M6MTQ6IkltcHJvdmVkIEJsb2NrIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6Mzg7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjE5O3M6OToiZmVhdF9uYW1lIjtzOjE3OiJJbXByb3ZlZCBDcml0aWNhbCI7czo4OiJtdWx0aXBsZSI7aToxO31pOjM5O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToyMDtzOjk6ImZlYXRfbmFtZSI7czoxNjoiSW1wcm92ZWQgRGVmZW5zZSI7czo4OiJtdWx0aXBsZSI7aToxO31pOjQwO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToyMTtzOjk6ImZlYXRfbmFtZSI7czoxNToiSW1wcm92ZWQgRGlzYXJtIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6NDE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjIyO3M6OToiZmVhdF9uYW1lIjtzOjEzOiJJbXByb3ZlZCBHcmFiIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NDI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjIzO3M6OToiZmVhdF9uYW1lIjtzOjE2OiJJbXByb3ZlZCBHcmFwcGxlIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NDM7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjI0O3M6OToiZmVhdF9uYW1lIjtzOjE5OiJJbXByb3ZlZCBJbml0aWF0aXZlIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6NDQ7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjI1O3M6OToiZmVhdF9uYW1lIjtzOjE2OiJJbXByb3ZlZCBPdmVycnVuIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NDU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjI2O3M6OToiZmVhdF9uYW1lIjtzOjEyOiJJbXByb3ZlZCBQaW4iO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo0NjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6Mjc7czo5OiJmZWF0X25hbWUiO3M6MTU6IkltcHJvdmVkIFN1bmRlciI7czo4OiJtdWx0aXBsZSI7aTowO31pOjQ3O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToyODtzOjk6ImZlYXRfbmFtZSI7czoxNDoiSW1wcm92ZWQgVGhyb3ciO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo0ODtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6Mjk7czo5OiJmZWF0X25hbWUiO3M6MTM6IkltcHJvdmVkIFRyaXAiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo0OTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6ODA7czo5OiJmZWF0X25hbWUiO3M6MTY6IkltcHJvdmlzZWQgVG9vbHMiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo1MDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NDc7czo5OiJmZWF0X25hbWUiO3M6NzoiSW5zcGlyZSI7czo4OiJtdWx0aXBsZSI7aToxO31pOjUxO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo2MjtzOjk6ImZlYXRfbmFtZSI7czoxMDoiSW5zdGFudCBVcCI7czo4OiJtdWx0aXBsZSI7aTowO31pOjUyO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo2MztzOjk6ImZlYXRfbmFtZSI7czo5OiJJbnRlcnBvc2UiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo1MztPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6ODE7czo5OiJmZWF0X25hbWUiO3M6ODoiSW52ZW50b3IiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo1NDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6ODI7czo5OiJmZWF0X25hbWUiO3M6MTg6IkphY2stT2YtQWxsLVRyYWRlcyI7czo4OiJtdWx0aXBsZSI7aTowO31pOjU1O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo0ODtzOjk6ImZlYXRfbmFtZSI7czoxMDoiTGVhZGVyc2hpcCI7czo4OiJtdWx0aXBsZSI7aTowO31pOjU2O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo0OTtzOjk6ImZlYXRfbmFtZSI7czo0OiJMdWNrIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6NTc7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjY0O3M6OToiZmVhdF9uYW1lIjtzOjExOiJNYXN0ZXIgUGxhbiI7czo4OiJtdWx0aXBsZSI7aTowO31pOjU4O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo2NTtzOjk6ImZlYXRfbmFtZSI7czo3OiJNaW5pb25zIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6NTk7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjMwO3M6OToiZmVhdF9uYW1lIjtzOjE0OiJNb3ZlLUJ5IEFjdGlvbiI7czo4OiJtdWx0aXBsZSI7aTowO31pOjYwO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTozMTtzOjk6ImZlYXRfbmFtZSI7czoxMjoiUG93ZXIgQXR0YWNrIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NjE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjMyO3M6OToiZmVhdF9uYW1lIjtzOjEyOiJQcmVjaXNlIFNob3QiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo2MjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MzM7czo5OiJmZWF0X25hbWUiO3M6MTQ6IlByb25lIEZpZ2h0aW5nIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NjM7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjY2O3M6OToiZmVhdF9uYW1lIjtzOjEyOiJRdWljayBDaGFuZ2UiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo2NDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MzQ7czo5OiJmZWF0X25hbWUiO3M6MTA6IlF1aWNrIERyYXciO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo2NTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MzU7czo5OiJmZWF0X25hbWUiO3M6NDoiUmFnZSI7czo4OiJtdWx0aXBsZSI7aToxO31pOjY2O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTozNjtzOjk6ImZlYXRfbmFtZSI7czoxMDoiUmFuZ2VkIFBpbiI7czo4OiJtdWx0aXBsZSI7aTowO31pOjY3O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTozNztzOjk6ImZlYXRfbmFtZSI7czo4OiJSZWRpcmVjdCI7czo4OiJtdWx0aXBsZSI7aTowO31pOjY4O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo4MztzOjk6ImZlYXRfbmFtZSI7czo5OiJSaXR1YWxpc3QiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo2OTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6Njc7czo5OiJmZWF0X25hbWUiO3M6MTM6IlNlY29uZCBDaGFuY2UiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo3MDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NTA7czo5OiJmZWF0X25hbWUiO3M6MTY6IlNlaXplIEluaXRpYXRpdmUiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo3MTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6Mzg7czo5OiJmZWF0X25hbWUiO3M6NjoiU2V0LVVwIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NzI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjY4O3M6OToiZmVhdF9uYW1lIjtzOjg6IlNpZGVraWNrIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6NzM7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjg0O3M6OToiZmVhdF9uYW1lIjtzOjEzOiJTa2lsbCBNYXN0ZXJ5IjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6NzQ7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjM5O3M6OToiZmVhdF9uYW1lIjtzOjEyOiJTbmVhayBBdHRhY2siO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo3NTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6ODU7czo5OiJmZWF0X25hbWUiO3M6NzoiU3RhcnRsZSI7czo4OiJtdWx0aXBsZSI7aTowO31pOjc2O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo0MDtzOjk6ImZlYXRfbmFtZSI7czoxNToiU3R1bm5pbmcgQXR0YWNrIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6Nzc7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjQxO3M6OToiZmVhdF9uYW1lIjtzOjE1OiJUYWtlZG93biBBdHRhY2siO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo3ODtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6ODY7czo5OiJmZWF0X25hbWUiO3M6NToiVGF1bnQiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo3OTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6Njk7czo5OiJmZWF0X25hbWUiO3M6ODoiVGVhbXdvcmsiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo4MDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NDI7czo5OiJmZWF0X25hbWUiO3M6MTY6IlRocm93aW5nIE1hc3RlcnkiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo4MTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6ODc7czo5OiJmZWF0X25hbWUiO3M6NToiVHJhY2siO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo4MjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NzA7czo5OiJmZWF0X25hbWUiO3M6NjoiVHJhbmNlIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6ODM7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjUxO3M6OToiZmVhdF9uYW1lIjtzOjE1OiJVbHRpbWF0ZSBFZmZvcnQiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo4NDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NDM7czo5OiJmZWF0X25hbWUiO3M6MTM6IlVuY2FubnkgRG9kZ2UiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo4NTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NDQ7czo5OiJmZWF0X25hbWUiO3M6MTE6IldlYXBvbiBCaW5kIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6ODY7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjQ1O3M6OToiZmVhdF9uYW1lIjtzOjEyOiJXZWFwb24gQnJlYWsiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo4NztPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6ODg7czo5OiJmZWF0X25hbWUiO3M6MTM6IldlbGwtSW5mb3JtZWQiO3M6ODoibXVsdGlwbGUiO2k6MDt9fXM6NjoicG93ZXJzIjthOjE2MDp7aTowO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTtzOjEwOiJwb3dlcl9uYW1lIjtzOjExOiJBYm9zb3JwdGlvbiI7czoxMDoicG93ZXJfY29zdCI7aTo0O3M6Nzoibm9fcmFuayI7aTowO31pOjE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToyO3M6MTA6InBvd2VyX25hbWUiO3M6NDoiQWNpZCI7czoxMDoicG93ZXJfY29zdCI7aTozO3M6Nzoibm9fcmFuayI7aTowO31pOjI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMjA7czoxMDoicG93ZXJfbmFtZSI7czoxNjoiQWRkaXRpb25hbCBMaW1icyI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjM7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTozO3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IkFkcmVuYWwgU3VyZ2UiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aTo0O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NDtzOjEwOiJwb3dlcl9uYW1lIjtzOjk6IkFnZSBTaGlmdCI7czoxMDoicG93ZXJfY29zdCI7aTo4O3M6Nzoibm9fcmFuayI7aToxO31pOjU7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo1O3M6MTA6InBvd2VyX25hbWUiO3M6MTE6IkFpciBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6NjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjY7czoxMDoicG93ZXJfbmFtZSI7czoxNDoiQWx0ZXJuYXRlIEZvcm0iO3M6MTA6InBvd2VyX2Nvc3QiO2k6NTtzOjc6Im5vX3JhbmsiO2k6MDt9aTo3O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTIxO3M6MTA6InBvd2VyX25hbWUiO3M6MTk6IkFuYXRvbWljIFNlcGFyYXRpb24iO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo4O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NztzOjEwOiJwb3dlcl9uYW1lIjtzOjE0OiJBbmltYWwgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjk7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo4O3M6MTA6InBvd2VyX25hbWUiO3M6MTQ6IkFuaW1hbCBNaW1pY3J5IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjk7czo3OiJub19yYW5rIjtpOjA7fWk6MTA7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo5O3M6MTA6InBvd2VyX25hbWUiO3M6MTU6IkFuaW1hdGUgT2JqZWN0cyI7czoxMDoicG93ZXJfY29zdCI7aTozO3M6Nzoibm9fcmFuayI7aTowO31pOjExO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTA7czoxMDoicG93ZXJfbmFtZSI7czoxMToiQXN0cmFsIEZvcm0iO3M6MTA6InBvd2VyX2Nvc3QiO2k6NTtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjExO3M6MTA6InBvd2VyX25hbWUiO3M6NToiQmxhc3QiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEyO3M6MTA6InBvd2VyX25hbWUiO3M6MTc6IkJsZW5kaW5nOiBQYXJ0aWFsIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjE7fWk6MTQ7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMztzOjEwOiJwb3dlcl9uYW1lIjtzOjE1OiJCbGVuZGluZzogVG90YWwiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NDtzOjc6Im5vX3JhbmsiO2k6MTt9aToxNTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjE0O3M6MTA6InBvd2VyX25hbWUiO3M6NDoiQmx1ciI7czoxMDoicG93ZXJfY29zdCI7aTo0O3M6Nzoibm9fcmFuayI7aToxO31pOjE2O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTU7czoxMDoicG93ZXJfbmFtZSI7czo4OiJCb3VuY2luZyI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjE3O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTIyO3M6MTA6InBvd2VyX25hbWUiO3M6OToiQnVycm93aW5nIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6MTg7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxNjtzOjEwOiJwb3dlcl9uYW1lIjtzOjM6IkNoaSI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjE5O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTc7czoxMDoicG93ZXJfbmFtZSI7czoxMzoiQ2xhaXJhdWRpZW5jZSI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjIwO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTg7czoxMDoicG93ZXJfbmFtZSI7czoxMjoiQ2xhaXJ2b3lhbmNlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MjE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxOTtzOjEwOiJwb3dlcl9uYW1lIjtzOjEyOiJDb2xkIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToyMjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjIwO3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IkNvbG9yIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToyMztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEyMztzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJDb21tdW5pY2F0aW9uIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6MjQ7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMjQ7czoxMDoicG93ZXJfbmFtZSI7czoxMDoiQ29tcHJlaGVuZCI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjI1O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTI1O3M6MTA6InBvd2VyX25hbWUiO3M6MTE6IkNvbmNlYWxtZW50IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MjY7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMjY7czoxMDoicG93ZXJfbmFtZSI7czo3OiJDb25mdXNlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6Mjc7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToyMTtzOjEwOiJwb3dlcl9uYW1lIjtzOjk6IkNvcnJvc2lvbiI7czoxMDoicG93ZXJfY29zdCI7aTozO3M6Nzoibm9fcmFuayI7aTowO31pOjI4O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MjI7czoxMDoicG93ZXJfbmFtZSI7czoyMToiQ29zbWljIEVuZXJneSBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6Mjk7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMjc7czoxMDoicG93ZXJfbmFtZSI7czoxMzoiQ3JlYXRlIE9iamVjdCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjMwO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTI4O3M6MTA6InBvd2VyX25hbWUiO3M6NjoiRGFtYWdlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6MzE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToyMztzOjEwOiJwb3dlcl9uYW1lIjtzOjE2OiJEYXJrbmVzcyBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MzI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToyNDtzOjEwOiJwb3dlcl9uYW1lIjtzOjg6IkRhdGFsaW5rIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6MzM7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToyNTtzOjEwOiJwb3dlcl9uYW1lIjtzOjExOiJEZWF0aCBUb3VjaCI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjM0O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTI5O3M6MTA6InBvd2VyX25hbWUiO3M6NzoiRGVuc2l0eSI7czoxMDoicG93ZXJfY29zdCI7aTozO3M6Nzoibm9fcmFuayI7aTowO31pOjM1O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MjY7czoxMDoicG93ZXJfbmFtZSI7czoyMDoiRGV2aWNlOiBFYXN5IFRvIExvc2UiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MztzOjc6Im5vX3JhbmsiO2k6MDt9aTozNjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjI3O3M6MTA6InBvd2VyX25hbWUiO3M6MjA6IkRldmljZTogSGFyZCBUbyBMb3NlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjQ7czo3OiJub19yYW5rIjtpOjA7fWk6Mzc7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToyODtzOjEwOiJwb3dlcl9uYW1lIjtzOjE5OiJEaW1lbnNpb25hbCBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6Mzg7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToyOTtzOjEwOiJwb3dlcl9uYW1lIjtzOjE4OiJEaW1lbnNpb25hbCBQb2NrZXQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTozOTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjMwO3M6MTA6InBvd2VyX25hbWUiO3M6NzoiRGlzZWFzZSI7czoxMDoicG93ZXJfY29zdCI7aTozO3M6Nzoibm9fcmFuayI7aTowO31pOjQwO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MzE7czoxMDoicG93ZXJfbmFtZSI7czoxNDoiRGlzaW50ZWdyYXRpb24iO3M6MTA6InBvd2VyX2Nvc3QiO2k6NTtzOjc6Im5vX3JhbmsiO2k6MDt9aTo0MTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjMyO3M6MTA6InBvd2VyX25hbWUiO3M6MTI6IkRpc3BsYWNlbWVudCI7czoxMDoicG93ZXJfY29zdCI7aTo0O3M6Nzoibm9fcmFuayI7aToxO31pOjQyO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MzM7czoxMDoicG93ZXJfbmFtZSI7czoxMzoiRHJlYW0gQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aTozO3M6Nzoibm9fcmFuayI7aTowO31pOjQzO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MzQ7czoxMDoicG93ZXJfbmFtZSI7czoxMjoiRHJlYW0gVHJhdmVsIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6NDQ7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTozNTtzOjEwOiJwb3dlcl9uYW1lIjtzOjExOiJEdXBsaWNhdGlvbiI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjQ1O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MzY7czoxMDoicG93ZXJfbmFtZSI7czoxMzoiRWFydGggQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjQ2O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6Mzc7czoxMDoicG93ZXJfbmFtZSI7czoxMDoiRWxhc3RpY2l0eSI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjQ3O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6Mzg7czoxMDoicG93ZXJfbmFtZSI7czoxODoiRWxlY3RyaWNhbCBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6NDg7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMzA7czoxMDoicG93ZXJfbmFtZSI7czoxMDoiRWxvbmdhdGlvbiI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjQ5O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTMxO3M6MTA6InBvd2VyX25hbWUiO3M6MTU6IkVtb3Rpb24gQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjUwO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6Mzk7czoxMDoicG93ZXJfbmFtZSI7czoxMToiRW1wb3dlcm1lbnQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo1MTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjQwO3M6MTA6InBvd2VyX25hbWUiO3M6MTE6IkVuZXJneSBBdXJhIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjQ7czo3OiJub19yYW5rIjtpOjA7fWk6NTI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo0MTtzOjEwOiJwb3dlcl9uYW1lIjtzOjE4OiJFdm9sdXRpb25hcnkgU2hpZnQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTA7czo3OiJub19yYW5rIjtpOjE7fWk6NTM7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo0MjtzOjEwOiJwb3dlcl9uYW1lIjtzOjg6IkV4b3JjaXNtIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6NTQ7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMzI7czoxMDoicG93ZXJfbmFtZSI7czo3OiJGYXRpZ3VlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6NTU7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo0MztzOjEwOiJwb3dlcl9uYW1lIjtzOjEyOiJGaXJlIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo1NjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEzMztzOjEwOiJwb3dlcl9uYW1lIjtzOjY6IkZsaWdodCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjU3O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NDQ7czoxMDoicG93ZXJfbmFtZSI7czoxNjoiRm9yY2UgQ29uc3RydWN0cyI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjU4O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NDU7czoxMDoicG93ZXJfbmFtZSI7czoxMToiRm9yY2UgRmllbGQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aTo1OTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjQ2O3M6MTA6InBvd2VyX25hbWUiO3M6MTY6IkZyaWN0aW9uIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MztzOjc6Im5vX3JhbmsiO2k6MDt9aTo2MDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjQ3O3M6MTA6InBvd2VyX25hbWUiO3M6MjE6IkdhZGdldHM6IEVhc3kgVG8gTG9zZSI7czoxMDoicG93ZXJfY29zdCI7aTo2O3M6Nzoibm9fcmFuayI7aTowO31pOjYxO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NDg7czoxMDoicG93ZXJfbmFtZSI7czoyMToiR2FkZ2V0czogSGFyZCBUbyBMb3NlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjc7czo3OiJub19yYW5rIjtpOjA7fWk6NjI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo0OTtzOjEwOiJwb3dlcl9uYW1lIjtzOjc6Ikdlc3RhbHQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aTo2MztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjUwO3M6MTA6InBvd2VyX25hbWUiO3M6ODoiR3JhZnRpbmciO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTE7czo3OiJub19yYW5rIjtpOjA7fWk6NjQ7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo1MTtzOjEwOiJwb3dlcl9uYW1lIjtzOjE1OiJHcmF2aXR5IENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo2NTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEzNDtzOjEwOiJwb3dlcl9uYW1lIjtzOjY6Ikdyb3d0aCI7czoxMDoicG93ZXJfY29zdCI7aTozO3M6Nzoibm9fcmFuayI7aTowO31pOjY2O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTM1O3M6MTA6InBvd2VyX25hbWUiO3M6NzoiSGVhbGluZyI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjY3O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NTI7czoxMDoicG93ZXJfbmFtZSI7czoxNjoiSGVsbGZpcmUgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjY4O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NTM7czoxMDoicG93ZXJfbmFtZSI7czo4OiJIeXBub3NpcyI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjY5O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NTQ7czoxMDoicG93ZXJfbmFtZSI7czo2OiJJZ25pdGUiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MztzOjc6Im5vX3JhbmsiO2k6MDt9aTo3MDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjU1O3M6MTA6InBvd2VyX25hbWUiO3M6MTE6IkltbW9ydGFsaXR5IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjU7czo3OiJub19yYW5rIjtpOjE7fWk6NzE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMzY7czoxMDoicG93ZXJfbmFtZSI7czo5OiJJbW1vdmFibGUiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aTo3MjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjU2O3M6MTA6InBvd2VyX25hbWUiO3M6OToiSW1tdXRhYmxlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjEwO3M6Nzoibm9fcmFuayI7aToxO31pOjczO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTM3O3M6MTA6InBvd2VyX25hbWUiO3M6MTM6Ikluc3Vic3RhbnRpYWwiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NTtzOjc6Im5vX3JhbmsiO2k6MDt9aTo3NDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjU4O3M6MTA6InBvd2VyX25hbWUiO3M6MTg6IkludmlzaWJpbGl0eTogRnVsbCI7czoxMDoicG93ZXJfY29zdCI7aTo4O3M6Nzoibm9fcmFuayI7aToxO31pOjc1O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NTc7czoxMDoicG93ZXJfbmFtZSI7czoyMDoiSW52aXNpYmxpdHk6IFBhcnRpYWwiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NDtzOjc6Im5vX3JhbmsiO2k6MTt9aTo3NjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjU5O3M6MTA6InBvd2VyX25hbWUiO3M6MTU6IktpbmV0aWMgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjc3O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTM4O3M6MTA6InBvd2VyX25hbWUiO3M6NzoiTGVhcGluZyI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjc4O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NjA7czoxMDoicG93ZXJfbmFtZSI7czoxMjoiTGlmZSBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjQ7czo3OiJub19yYW5rIjtpOjA7fWk6Nzk7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo2MTtzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJMaWdodCBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6ODA7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMzk7czoxMDoicG93ZXJfbmFtZSI7czoxMjoiTHVjayBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjM7czo3OiJub19yYW5rIjtpOjA7fWk6ODE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo2MjtzOjEwOiJwb3dlcl9uYW1lIjtzOjE3OiJNYWNoaW5lIEFuaW1hdGlvbiI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjgyO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NjM7czoxMDoicG93ZXJfbmFtZSI7czo1OiJNYWdpYyI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjgzO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NjQ7czoxMDoicG93ZXJfbmFtZSI7czoxNjoiTWFnbmV0aWMgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjg0O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NjU7czoxMDoicG93ZXJfbmFtZSI7czoxMjoiTWVudGFsIEJsYXN0IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjQ7czo3OiJub19yYW5rIjtpOjA7fWk6ODU7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo2NjtzOjEwOiJwb3dlcl9uYW1lIjtzOjE4OiJNZW50YWwgRHVwbGljYXRpb24iO3M6MTA6InBvd2VyX2Nvc3QiO2k6MztzOjc6Im5vX3JhbmsiO2k6MDt9aTo4NjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjY3O3M6MTA6InBvd2VyX25hbWUiO3M6MTc6Ik1pY3Jvd2F2ZSBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6ODc7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxNDA7czoxMDoicG93ZXJfbmFtZSI7czoxMjoiTWluZCBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6ODg7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxNDE7czoxMDoicG93ZXJfbmFtZSI7czoxMjoiTWluZCBSZWFkaW5nIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjA7czo3OiJub19yYW5rIjtpOjE7fWk6ODk7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo2ODtzOjEwOiJwb3dlcl9uYW1lIjtzOjExOiJNaW5kIFNoaWVsZCI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjkwO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6Njk7czoxMDoicG93ZXJfbmFtZSI7czoxMToiTWluZCBTd2l0Y2giO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo5MTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjcwO3M6MTA6InBvd2VyX25hbWUiO3M6MTI6Ik1pcnJvciBJbWFnZSI7czoxMDoicG93ZXJfY29zdCI7aTo0O3M6Nzoibm9fcmFuayI7aToxO31pOjkyO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTQyO3M6MTA6InBvd2VyX25hbWUiO3M6MTE6Ik1vdmUgT2JqZWN0IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6OTM7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo3MTtzOjEwOiJwb3dlcl9uYW1lIjtzOjg6Ik11dGF0aW9uIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjQ7czo3OiJub19yYW5rIjtpOjA7fWk6OTQ7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxNDM7czoxMDoicG93ZXJfbmFtZSI7czo4OiJOYXVzZWF0ZSI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjk1O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NzI7czoxMDoicG93ZXJfbmFtZSI7czo3OiJOZW1lc2lzIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjg7czo3OiJub19yYW5rIjtpOjA7fWk6OTY7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo3MztzOjEwOiJwb3dlcl9uYW1lIjtzOjE0OiJPYmplY3QgTWltaWNyeSI7czoxMDoicG93ZXJfY29zdCI7aTo2O3M6Nzoibm9fcmFuayI7aTowO31pOjk3O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NzQ7czoxMDoicG93ZXJfbmFtZSI7czo0OiJQYWluIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjU7czo3OiJub19yYW5rIjtpOjA7fWk6OTg7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxNDQ7czoxMDoicG93ZXJfbmFtZSI7czo4OiJQYXJhbHl6ZSI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjk5O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NzU7czoxMDoicG93ZXJfbmFtZSI7czoxMzoiUGV0cmlmaWNhdGlvbiI7czoxMDoicG93ZXJfY29zdCI7aTozO3M6Nzoibm9fcmFuayI7aTowO31pOjEwMDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjc2O3M6MTA6InBvd2VyX25hbWUiO3M6MTA6IlBoZXJvbW9uZXMiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NDtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMDE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo3NztzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJQbGFudCBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTAyO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6Nzg7czoxMDoicG93ZXJfbmFtZSI7czoxMzoiUGxhbnQgTWltaWNyeSI7czoxMDoicG93ZXJfY29zdCI7aTo5O3M6Nzoibm9fcmFuayI7aTowO31pOjEwMztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjc5O3M6MTA6InBvd2VyX25hbWUiO3M6MTQ6IlBsYXNtYSBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTA0O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6ODA7czoxMDoicG93ZXJfbmFtZSI7czoxMDoiUG9zc2Vzc2lvbiI7czoxMDoicG93ZXJfY29zdCI7aTozO3M6Nzoibm9fcmFuayI7aTowO31pOjEwNTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjgxO3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IlBvd2VyIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMDY7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo4MjtzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJQb3dlciBSZXNlcnZlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTA3O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6ODM7czoxMDoicG93ZXJfbmFtZSI7czoxNjoiUG93ZXIgUmVzaXN0YW5jZSI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjEwODtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjg0O3M6MTA6InBvd2VyX25hbWUiO3M6MTU6IlByZWhpbnNpbGUgSGFpciI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjEwOTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjE0NTtzOjEwOiJwb3dlcl9uYW1lIjtzOjE5OiJQcm9iYWJpbGl0eSBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjQ7czo3OiJub19yYW5rIjtpOjA7fWk6MTEwO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTQ2O3M6MTA6InBvd2VyX25hbWUiO3M6MTA6IlByb3RlY3Rpb24iO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMTE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxNDc7czoxMDoicG93ZXJfbmFtZSI7czo5OiJRdWlja25lc3MiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMTI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo4NTtzOjEwOiJwb3dlcl9uYW1lIjtzOjE3OiJSYWRpYXRpb24gQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjExMztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjg2O3M6MTA6InBvd2VyX25hbWUiO3M6MTY6IlJlZmxlY3Rpb24gRmllbGQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6ODtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMTQ7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo4NztzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJSZWZsZXggTWVtb3J5IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjk7czo3OiJub19yYW5rIjtpOjA7fWk6MTE1O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTQ4O3M6MTA6InBvd2VyX25hbWUiO3M6MTI6IlJlZ2VuZXJhdGlvbiI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjExNjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjg4O3M6MTA6InBvd2VyX25hbWUiO3M6MTI6IlNlbnNvcnkgTGluayI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjExNztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjg5O3M6MTA6InBvd2VyX25hbWUiO3M6MjQ6IlNlbnNvcnkgU2hpZWxkOiAgMSBzZW5zZSI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjExODtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjkwO3M6MTA6InBvd2VyX25hbWUiO3M6MjY6IlNlbnNvcnkgU2hpZWxkOiBBbGwgc2Vuc2VzIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTE5O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6OTE7czoxMDoicG93ZXJfbmFtZSI7czoxMjoiU2hhcGUgTWF0dGVyIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjQ7czo3OiJub19yYW5rIjtpOjA7fWk6MTIwO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6OTI7czoxMDoicG93ZXJfbmFtZSI7czoxMDoiU2hhcGVzaGlmdCI7czoxMDoicG93ZXJfY29zdCI7aTo4O3M6Nzoibm9fcmFuayI7aTowO31pOjEyMTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjkzO3M6MTA6InBvd2VyX25hbWUiO3M6NjoiU2hpZWxkIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6MTIyO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTQ5O3M6MTA6InBvd2VyX25hbWUiO3M6OToiU2hyaW5raW5nIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6MTIzO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6OTQ7czoxMDoicG93ZXJfbmFtZSI7czoyMjoiU2lsZW5jZTogSHVtYW4gSGVhcmluZyI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjEyNDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjk1O3M6MTA6InBvd2VyX25hbWUiO3M6Mjc6IlNpbGVuY2U6IEludmlzaWJsZSB0byBTb25hciI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjEyNTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjk2O3M6MTA6InBvd2VyX25hbWUiO3M6NToiU2xlZXAiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MztzOjc6Im5vX3JhbmsiO2k6MDt9aToxMjY7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxNTA7czoxMDoicG93ZXJfbmFtZSI7czo1OiJTbmFyZSI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjEyNztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjk3O3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IlNvbmljIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMjg7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxNTE7czoxMDoicG93ZXJfbmFtZSI7czoxMjoiU3BhY2UgVHJhdmVsIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6MTI5O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6OTg7czoxMDoicG93ZXJfbmFtZSI7czoxNToiU3BhdGlhbCBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTMwO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTUyO3M6MTA6InBvd2VyX25hbWUiO3M6NToiU3BlZWQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMzE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo5OTtzOjEwOiJwb3dlcl9uYW1lIjtzOjg6IlNwaW5uaW5nIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTMyO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTAwO3M6MTA6InBvd2VyX25hbWUiO3M6MTQ6IlNwaXJpdCBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTMzO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTAxO3M6MTA6InBvd2VyX25hbWUiO3M6NjoiU3RyaWtlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6MTM0O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTUzO3M6MTA6InBvd2VyX25hbWUiO3M6NDoiU3R1biI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjEzNTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjE1NDtzOjEwOiJwb3dlcl9uYW1lIjtzOjk6IlN1ZmZvY2F0ZSI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjEzNjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjE1NTtzOjEwOiJwb3dlcl9uYW1lIjtzOjE0OiJTdXBlci1Nb3ZlbWVudCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjEzNztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjE1NjtzOjEwOiJwb3dlcl9uYW1lIjtzOjEyOiJTdXBlci1TZW5zZXMiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMzg7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMDI7czoxMDoicG93ZXJfbmFtZSI7czoxMToiU3VwZXItU3BlZWQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NTtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMzk7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxNTc7czoxMDoicG93ZXJfbmFtZSI7czoxNDoiU3VwZXItU3RyZW5ndGgiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxNDA7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMDM7czoxMDoicG93ZXJfbmFtZSI7czoxOToiU3VwZXItVmVudHJpbG9xdWlzbSI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjE0MTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEwNDtzOjEwOiJwb3dlcl9uYW1lIjtzOjE5OiJTdXNwZW5kZWQgQW5pbWF0aW9uIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTQyO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTU4O3M6MTA6InBvd2VyX25hbWUiO3M6ODoiU3dpbW1pbmciO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aToxNDM7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMDU7czoxMDoicG93ZXJfbmFtZSI7czoxMToiVGVsZWtpbmVzaXMiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxNDQ7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMDY7czoxMDoicG93ZXJfbmFtZSI7czoxMjoiVGVsZWxvY2F0aW9uIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6MTQ1O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTA3O3M6MTA6InBvd2VyX25hbWUiO3M6OToiVGVsZXBhdGh5IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTQ2O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTU5O3M6MTA6InBvd2VyX25hbWUiO3M6ODoiVGVsZXBvcnQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxNDc7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMDg7czoxMDoicG93ZXJfbmFtZSI7czoxNToiVGhlcm1hbCBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTQ4O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTA5O3M6MTA6InBvd2VyX25hbWUiO3M6MTI6IlRpbWUgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aTo3O3M6Nzoibm9fcmFuayI7aTowO31pOjE0OTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjExMDtzOjEwOiJwb3dlcl9uYW1lIjtzOjk6IlRpbWUgU3RvcCI7czoxMDoicG93ZXJfY29zdCI7aTo3O3M6Nzoibm9fcmFuayI7aTowO31pOjE1MDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjExMTtzOjEwOiJwb3dlcl9uYW1lIjtzOjg6IlRyYW5zbWl0IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6MTUxO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTEyO3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IlRyYW5zbXV0YXRpb24iO3M6MTA6InBvd2VyX2Nvc3QiO2k6NTtzOjc6Im5vX3JhbmsiO2k6MDt9aToxNTI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxNjA7czoxMDoicG93ZXJfbmFtZSI7czo0OiJUcmlwIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6MTUzO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTEzO3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IlRyb3VibGVzZWVrZXIiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxNTQ7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMTQ7czoxMDoicG93ZXJfbmFtZSI7czoyMDoiVW5pdmVyc2FsIFRyYW5zbGF0b3IiO3M6MTA6InBvd2VyX2Nvc3QiO2k6ODtzOjc6Im5vX3JhbmsiO2k6MTt9aToxNTU7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMTU7czoxMDoicG93ZXJfbmFtZSI7czoxNzoiVmlicmF0aW9uIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxNTY7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMTY7czoxMDoicG93ZXJfbmFtZSI7czo0OiJXYXJkIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6MTU3O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTE3O3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IldhdGVyIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxNTg7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMTg7czoxMDoicG93ZXJfbmFtZSI7czoxNjoiV2VhcG9uIFN1bW1vbmluZyI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjE1OTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjExOTtzOjEwOiJwb3dlcl9uYW1lIjtzOjE1OiJXZWF0aGVyIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9fXM6Njoic2tpbGxzIjthOjQyOntpOjA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aToxO3M6MTA6InNraWxsX25hbWUiO3M6MTA6IkFjcm9iYXRpY3MiO3M6OToic2tpbGxfbW9kIjtzOjM6ImRleCI7fWk6MTtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjI7czoxMDoic2tpbGxfbmFtZSI7czo1OiJCbHVmZiI7czo5OiJza2lsbF9tb2QiO3M6MzoiY2hhIjt9aToyO086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MztzOjEwOiJza2lsbF9uYW1lIjtzOjU6IkNsaW1iIjtzOjk6InNraWxsX21vZCI7czozOiJzdHIiO31pOjM7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aTo0O3M6MTA6InNraWxsX25hbWUiO3M6OToiQ29tcHV0ZXJzIjtzOjk6InNraWxsX21vZCI7czozOiJpbnQiO31pOjQ7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aTo1O3M6MTA6InNraWxsX25hbWUiO3M6MTM6IkNvbmNlbnRyYXRpb24iO3M6OToic2tpbGxfbW9kIjtzOjM6IndpcyI7fWk6NTtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjY7czoxMDoic2tpbGxfbmFtZSI7czo1OiJDcmFmdCI7czo5OiJza2lsbF9tb2QiO3M6MzoiaW50Ijt9aTo2O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6NztzOjEwOiJza2lsbF9uYW1lIjtzOjk6IkRpcGxvbWFjeSI7czo5OiJza2lsbF9tb2QiO3M6MzoiY2hhIjt9aTo3O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6ODtzOjEwOiJza2lsbF9uYW1lIjtzOjE0OiJEaXNhYmxlIERldmljZSI7czo5OiJza2lsbF9tb2QiO3M6MzoiaW50Ijt9aTo4O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6OTtzOjEwOiJza2lsbF9uYW1lIjtzOjg6IkRpc2d1aXNlIjtzOjk6InNraWxsX21vZCI7czozOiJjaGEiO31pOjk7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aToxMDtzOjEwOiJza2lsbF9uYW1lIjtzOjU6IkRyaXZlIjtzOjk6InNraWxsX21vZCI7czozOiJkZXgiO31pOjEwO086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MTE7czoxMDoic2tpbGxfbmFtZSI7czoxMzoiRXNjYXBlIEFydGlzdCI7czo5OiJza2lsbF9tb2QiO3M6MzoiZGV4Ijt9aToxMTtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjEyO3M6MTA6InNraWxsX25hbWUiO3M6MTg6IkdhdGhlciBJbmZvcm1hdGlvbiI7czo5OiJza2lsbF9tb2QiO3M6MzoiY2hhIjt9aToxMjtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjEzO3M6MTA6InNraWxsX25hbWUiO3M6MTM6IkhhbmRsZSBBbmltYWwiO3M6OToic2tpbGxfbW9kIjtzOjM6ImNoYSI7fWk6MTM7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aToxNDtzOjEwOiJza2lsbF9uYW1lIjtzOjEwOiJJbnRpbWlkYXRlIjtzOjk6InNraWxsX21vZCI7czozOiJjaGEiO31pOjE0O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MTU7czoxMDoic2tpbGxfbmFtZSI7czoxMToiSW52ZXN0aWdhdGUiO3M6OToic2tpbGxfbW9kIjtzOjM6ImludCI7fWk6MTU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aToxNjtzOjEwOiJza2lsbF9uYW1lIjtzOjIyOiJLbm93bGVkZ2U6IEFyY2FuZSBMb3JlIjtzOjk6InNraWxsX21vZCI7czozOiJpbnQiO31pOjE2O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MTc7czoxMDoic2tpbGxfbmFtZSI7czoxNDoiS25vd2xlZGdlOiBBcnQiO3M6OToic2tpbGxfbW9kIjtzOjM6ImludCI7fWk6MTc7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aToxODtzOjEwOiJza2lsbF9uYW1lIjtzOjMwOiJLbm93bGVkZ2U6IEJlaGF2aW9yYWwgU2NpZW5jZXMiO3M6OToic2tpbGxfbW9kIjtzOjM6ImludCI7fWk6MTg7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aToxOTtzOjEwOiJza2lsbF9uYW1lIjtzOjE3OiJLbm93bGVkZ2U6IENpdmljcyI7czo5OiJza2lsbF9tb2QiO3M6MzoiaW50Ijt9aToxOTtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjIwO3M6MTA6InNraWxsX25hbWUiO3M6MjU6Iktub3dsZWRnZTogQ3VycmVudCBFdmVudHMiO3M6OToic2tpbGxfbW9kIjtzOjM6ImludCI7fWk6MjA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aToyMTtzOjEwOiJza2lsbF9uYW1lIjtzOjI1OiJLbm93bGVkZ2U6IEVhcnRoIFNjaWVuY2VzIjtzOjk6InNraWxsX21vZCI7czozOiJpbnQiO31pOjIxO086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MjI7czoxMDoic2tpbGxfbmFtZSI7czoxODoiS25vd2xlZGdlOiBIaXN0b3J5IjtzOjk6InNraWxsX21vZCI7czozOiJpbnQiO31pOjIyO086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MjM7czoxMDoic2tpbGxfbmFtZSI7czoyNDoiS25vd2xlZGdlOiBMaWZlIFNjaWVuY2VzIjtzOjk6InNraWxsX21vZCI7czozOiJpbnQiO31pOjIzO086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MjQ7czoxMDoic2tpbGxfbmFtZSI7czoyODoiS25vd2xlZGdlOiBQaHlzaWNhbCBTY2llbmNlcyI7czo5OiJza2lsbF9tb2QiO3M6MzoiaW50Ijt9aToyNDtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjI1O3M6MTA6InNraWxsX25hbWUiO3M6MjI6Iktub3dsZWRnZTogUG9wIEN1bHR1cmUiO3M6OToic2tpbGxfbW9kIjtzOjM6ImludCI7fWk6MjU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aToyNjtzOjEwOiJza2lsbF9uYW1lIjtzOjIxOiJLbm93bGVkZ2U6IFN0cmVldHdpc2UiO3M6OToic2tpbGxfbW9kIjtzOjM6ImludCI7fWk6MjY7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aToyNztzOjEwOiJza2lsbF9uYW1lIjtzOjE4OiJLbm93bGVkZ2U6IFRhY3RpY3MiO3M6OToic2tpbGxfbW9kIjtzOjM6ImludCI7fWk6Mjc7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aToyODtzOjEwOiJza2lsbF9uYW1lIjtzOjIxOiJLbm93bGVkZ2U6IFRlY2hub2xvZ3kiO3M6OToic2tpbGxfbW9kIjtzOjM6ImludCI7fWk6Mjg7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aToyOTtzOjEwOiJza2lsbF9uYW1lIjtzOjMwOiJLbm93bGVkZ2U6IFRoZW9sb2d5L1BoaWxvc29waHkiO3M6OToic2tpbGxfbW9kIjtzOjM6ImludCI7fWk6Mjk7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aTozMDtzOjEwOiJza2lsbF9uYW1lIjtzOjg6Ikxhbmd1YWdlIjtzOjk6InNraWxsX21vZCI7czoxOiItIjt9aTozMDtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjMxO3M6MTA6InNraWxsX25hbWUiO3M6ODoiTWVkaWNpbmUiO3M6OToic2tpbGxfbW9kIjtzOjM6IndpcyI7fWk6MzE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aTozMjtzOjEwOiJza2lsbF9uYW1lIjtzOjY6Ik5vdGljZSI7czo5OiJza2lsbF9tb2QiO3M6Mzoid2lzIjt9aTozMjtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjMzO3M6MTA6InNraWxsX25hbWUiO3M6NzoiUGVyZm9ybSI7czo5OiJza2lsbF9tb2QiO3M6MzoiY2hhIjt9aTozMztPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjM0O3M6MTA6InNraWxsX25hbWUiO3M6NToiUGlsb3QiO3M6OToic2tpbGxfbW9kIjtzOjM6ImRleCI7fWk6MzQ7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aTozNTtzOjEwOiJza2lsbF9uYW1lIjtzOjEwOiJQcm9mZXNzaW9uIjtzOjk6InNraWxsX21vZCI7czozOiJ3aXMiO31pOjM1O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MzY7czoxMDoic2tpbGxfbmFtZSI7czo0OiJSaWRlIjtzOjk6InNraWxsX21vZCI7czozOiJkZXgiO31pOjM2O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6Mzc7czoxMDoic2tpbGxfbmFtZSI7czo2OiJTZWFyY2giO3M6OToic2tpbGxfbW9kIjtzOjM6ImludCI7fWk6Mzc7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aTozODtzOjEwOiJza2lsbF9uYW1lIjtzOjEyOiJTZW5zZSBNb3RpdmUiO3M6OToic2tpbGxfbW9kIjtzOjM6IndpcyI7fWk6Mzg7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aTozOTtzOjEwOiJza2lsbF9uYW1lIjtzOjE1OiJTbGVpZ2h0IE9mIEhhbmQiO3M6OToic2tpbGxfbW9kIjtzOjM6ImRleCI7fWk6Mzk7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aTo0MDtzOjEwOiJza2lsbF9uYW1lIjtzOjc6IlN0ZWFsdGgiO3M6OToic2tpbGxfbW9kIjtzOjM6ImRleCI7fWk6NDA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aTo0MTtzOjEwOiJza2lsbF9uYW1lIjtzOjg6IlN1cnZpdmFsIjtzOjk6InNraWxsX21vZCI7czozOiJ3aXMiO31pOjQxO086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6NDI7czoxMDoic2tpbGxfbmFtZSI7czo0OiJTd2ltIjtzOjk6InNraWxsX21vZCI7czozOiJzdHIiO319czo3OiJleHRQYXRoIjtzOjE5OiJQZXJzb25OZXdfSW1hZ2UucG5nIjtzOjQ6InNpemUiO3M6MDoiIjtzOjg6Im9sZElucHV0IjthOjM6e3M6MTA6ImVuZW15TmFtZXMiO2E6Mjp7czo1OiJCaWxseSI7czo3OiJFbmVteSBBIjtzOjc6IkNoYXJsaWUiO3M6NzoiRW5lbXkgQiI7fXM6MTM6ImRlZmVuc2VTY29yZXMiO2E6Mjp7czo1OiJCaWxseSI7czoyOiIxNSI7czo3OiJDaGFybGllIjtzOjI6IjE2Ijt9czoxNToidG91Z2huZXNzU2NvcmVzIjthOjI6e3M6NToiQmlsbHkiO3M6MToiNSI7czo3OiJDaGFybGllIjtzOjE6IjQiO319czo3OiJjb21iUmVzIjtzOjU5NjoiPHAgY2xhc3M9J2JvbGQgdGV4dC1jZW50ZXInPlJvdW5kPC9wPjxwPkJpbGx5IHVzZWQgcmFuZ2VkIGFnYWluc3QgRW5lbXkgQSBhbmQgZmFpbHMuPHNwYW4+IEF0dGFjazogRW5lbXkgQSAgQXR0YWNrIFJvbGw6IDcgfCAgVlMgIHwgRGVmZW5zZSBSZXN1bHRzOiAxNTwvc3Bhbj48L3A+PGhyLz48cD5DaGFybGllIHVzZWQgcmFuZ2VkIGFnYWluc3QgRW5lbXkgQiBhbmQgZmFpbHMuPHNwYW4+IEF0dGFjazogRW5lbXkgQiAgQXR0YWNrIFJvbGw6IDcgfCAgVlMgIHwgRGVmZW5zZSBSZXN1bHRzOiAxNjwvc3Bhbj48L3A+PGhyLz48cCBjbGFzcz0nYm9sZCB0ZXh0LWNlbnRlcic+Um91bmQ8L3A+PHA+QmlsbHkgdXNlZCBtZWxlZSBhZ2FpbnN0IEVuZW15IEEgYW5kIGZhaWxzLjxzcGFuPiBBdHRhY2s6IEVuZW15IEEgIEF0dGFjayBSb2xsOiA0IHwgIFZTICB8IERlZmVuc2UgUmVzdWx0czogMTU8L3NwYW4+PC9wPjxoci8+PHA+Q2hhcmxpZSB1c2VkIG1lbGVlIGFnYWluc3QgRW5lbXkgQiBhbmQgZmFpbHMuPHNwYW4+IEF0dGFjazogRW5lbXkgQiAgQXR0YWNrIFJvbGw6IDUgfCAgVlMgIHwgRGVmZW5zZSBSZXN1bHRzOiAxNjwvc3Bhbj48L3A+PGhyLz4iO3M6NToic2F2ZXMiO2E6Mjp7aTowO086ODoic3RkQ2xhc3MiOjU6e3M6ODoiY2hhck5hbWUiO3M6NToiQmlsbHkiO3M6NToidG91Z2giO2k6MjtzOjQ6IndpbGwiO2k6MztzOjQ6ImZvcnQiO2k6NDtzOjM6InJlZiI7aTozO31pOjE7Tzo4OiJzdGRDbGFzcyI6NTp7czo4OiJjaGFyTmFtZSI7czo3OiJDaGFybGllIjtzOjU6InRvdWdoIjtpOjE7czo0OiJ3aWxsIjtpOjE7czo0OiJmb3J0IjtpOjU7czozOiJyZWYiO2k6MDt9fXM6MTE6InNraWxsU2VsZWN0IjthOjI5OntpOjA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo1OiJCaWxseSI7czoxMDoic2tpbGxfbmFtZSI7czo1OiJEcml2ZSI7czoxMToic2tpbGxfdG90YWwiO2k6NDt9aToxO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NToiQmlsbHkiO3M6MTA6InNraWxsX25hbWUiO3M6MTg6IkdhdGhlciBJbmZvcm1hdGlvbiI7czoxMToic2tpbGxfdG90YWwiO2k6OTt9aToyO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NToiQmlsbHkiO3M6MTA6InNraWxsX25hbWUiO3M6MTA6IkludGltaWRhdGUiO3M6MTE6InNraWxsX3RvdGFsIjtpOjU7fWk6MztPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjU6IkJpbGx5IjtzOjEwOiJza2lsbF9uYW1lIjtzOjE0OiJLbm93bGVkZ2U6IEFydCI7czoxMToic2tpbGxfdG90YWwiO2k6NTt9aTo0O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NToiQmlsbHkiO3M6MTA6InNraWxsX25hbWUiO3M6MTc6Iktub3dsZWRnZTogQ2l2aWNzIjtzOjExOiJza2lsbF90b3RhbCI7aTo1O31pOjU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo1OiJCaWxseSI7czoxMDoic2tpbGxfbmFtZSI7czoyNToiS25vd2xlZGdlOiBDdXJyZW50IEV2ZW50cyI7czoxMToic2tpbGxfdG90YWwiO2k6NTt9aTo2O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NToiQmlsbHkiO3M6MTA6InNraWxsX25hbWUiO3M6MjQ6Iktub3dsZWRnZTogTGlmZSBTY2llbmNlcyI7czoxMToic2tpbGxfdG90YWwiO2k6OTt9aTo3O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NToiQmlsbHkiO3M6MTA6InNraWxsX25hbWUiO3M6Mjg6Iktub3dsZWRnZTogUGh5c2ljYWwgU2NpZW5jZXMiO3M6MTE6InNraWxsX3RvdGFsIjtpOjU7fWk6ODtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjU6IkJpbGx5IjtzOjEwOiJza2lsbF9uYW1lIjtzOjE4OiJLbm93bGVkZ2U6IFRhY3RpY3MiO3M6MTE6InNraWxsX3RvdGFsIjtpOjk7fWk6OTtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjU6IkJpbGx5IjtzOjEwOiJza2lsbF9uYW1lIjtzOjc6IlBlcmZvcm0iO3M6MTE6InNraWxsX3RvdGFsIjtpOjU7fWk6MTA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo1OiJCaWxseSI7czoxMDoic2tpbGxfbmFtZSI7czo1OiJQaWxvdCI7czoxMToic2tpbGxfdG90YWwiO2k6NDt9aToxMTtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjU6IkJpbGx5IjtzOjEwOiJza2lsbF9uYW1lIjtzOjQ6IlJpZGUiO3M6MTE6InNraWxsX3RvdGFsIjtpOjQ7fWk6MTI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo1OiJCaWxseSI7czoxMDoic2tpbGxfbmFtZSI7czoxMjoiU2Vuc2UgTW90aXZlIjtzOjExOiJza2lsbF90b3RhbCI7aTo5O31pOjEzO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NzoiQ2hhcmxpZSI7czoxMDoic2tpbGxfbmFtZSI7czoxMDoiQWNyb2JhdGljcyI7czoxMToic2tpbGxfdG90YWwiO2k6Njt9aToxNDtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjc6IkNoYXJsaWUiO3M6MTA6InNraWxsX25hbWUiO3M6OToiQ29tcHV0ZXJzIjtzOjExOiJza2lsbF90b3RhbCI7aTo0O31pOjE1O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NzoiQ2hhcmxpZSI7czoxMDoic2tpbGxfbmFtZSI7czoxMzoiQ29uY2VudHJhdGlvbiI7czoxMToic2tpbGxfdG90YWwiO2k6Njt9aToxNjtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjc6IkNoYXJsaWUiO3M6MTA6InNraWxsX25hbWUiO3M6OToiRGlwbG9tYWN5IjtzOjExOiJza2lsbF90b3RhbCI7aTo1O31pOjE3O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NzoiQ2hhcmxpZSI7czoxMDoic2tpbGxfbmFtZSI7czoxODoiR2F0aGVyIEluZm9ybWF0aW9uIjtzOjExOiJza2lsbF90b3RhbCI7aTo1O31pOjE4O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NzoiQ2hhcmxpZSI7czoxMDoic2tpbGxfbmFtZSI7czoxNzoiS25vd2xlZGdlOiBDaXZpY3MiO3M6MTE6InNraWxsX3RvdGFsIjtpOjQ7fWk6MTk7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo3OiJDaGFybGllIjtzOjEwOiJza2lsbF9uYW1lIjtzOjI1OiJLbm93bGVkZ2U6IEN1cnJlbnQgRXZlbnRzIjtzOjExOiJza2lsbF90b3RhbCI7aToxMjt9aToyMDtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjc6IkNoYXJsaWUiO3M6MTA6InNraWxsX25hbWUiO3M6MjU6Iktub3dsZWRnZTogRWFydGggU2NpZW5jZXMiO3M6MTE6InNraWxsX3RvdGFsIjtpOjQ7fWk6MjE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo3OiJDaGFybGllIjtzOjEwOiJza2lsbF9uYW1lIjtzOjIyOiJLbm93bGVkZ2U6IFBvcCBDdWx0dXJlIjtzOjExOiJza2lsbF90b3RhbCI7aTo0O31pOjIyO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NzoiQ2hhcmxpZSI7czoxMDoic2tpbGxfbmFtZSI7czoxODoiS25vd2xlZGdlOiBUYWN0aWNzIjtzOjExOiJza2lsbF90b3RhbCI7aTo0O31pOjIzO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NzoiQ2hhcmxpZSI7czoxMDoic2tpbGxfbmFtZSI7czoyMToiS25vd2xlZGdlOiBUZWNobm9sb2d5IjtzOjExOiJza2lsbF90b3RhbCI7aTo0O31pOjI0O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NzoiQ2hhcmxpZSI7czoxMDoic2tpbGxfbmFtZSI7czozMDoiS25vd2xlZGdlOiBUaGVvbG9neS9QaGlsb3NvcGh5IjtzOjExOiJza2lsbF90b3RhbCI7aTo0O31pOjI1O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NzoiQ2hhcmxpZSI7czoxMDoic2tpbGxfbmFtZSI7czo4OiJNZWRpY2luZSI7czoxMToic2tpbGxfdG90YWwiO2k6Njt9aToyNjtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjc6IkNoYXJsaWUiO3M6MTA6InNraWxsX25hbWUiO3M6NzoiUGVyZm9ybSI7czoxMToic2tpbGxfdG90YWwiO2k6OTt9aToyNztPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjc6IkNoYXJsaWUiO3M6MTA6InNraWxsX25hbWUiO3M6NToiUGlsb3QiO3M6MTE6InNraWxsX3RvdGFsIjtpOjY7fWk6Mjg7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo3OiJDaGFybGllIjtzOjEwOiJza2lsbF9uYW1lIjtzOjE1OiJTbGVpZ2h0IE9mIEhhbmQiO3M6MTE6InNraWxsX3RvdGFsIjtpOjY7fX1zOjU6Im5hbWVzIjthOjI6e2k6MDtzOjU6IkJpbGx5IjtpOjE7czo3OiJDaGFybGllIjt9czoxMjoicG93ZXJzU2VsZWN0IjthOjEyOntpOjA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo1OiJCaWxseSI7czoxMDoicG93ZXJfbmFtZSI7czo4OiJIeXBub3NpcyI7czoxMToicG93ZXJfcmFua3MiO2k6Mjt9aToxO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NToiQmlsbHkiO3M6MTA6InBvd2VyX25hbWUiO3M6MTI6Ik1pbmQgQ29udHJvbCI7czoxMToicG93ZXJfcmFua3MiO2k6MTt9aToyO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NToiQmlsbHkiO3M6MTA6InBvd2VyX25hbWUiO3M6MTQ6IlBsYXNtYSBDb250cm9sIjtzOjExOiJwb3dlcl9yYW5rcyI7aToxO31pOjM7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo1OiJCaWxseSI7czoxMDoicG93ZXJfbmFtZSI7czoxMjoiU3BhY2UgVHJhdmVsIjtzOjExOiJwb3dlcl9yYW5rcyI7aToxO31pOjQ7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo1OiJCaWxseSI7czoxMDoicG93ZXJfbmFtZSI7czo0OiJTdHVuIjtzOjExOiJwb3dlcl9yYW5rcyI7aToxO31pOjU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo1OiJCaWxseSI7czoxMDoicG93ZXJfbmFtZSI7czo5OiJUZWxlcGF0aHkiO3M6MTE6InBvd2VyX3JhbmtzIjtpOjE7fWk6NjtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjc6IkNoYXJsaWUiO3M6MTA6InBvd2VyX25hbWUiO3M6MTE6IkFpciBDb250cm9sIjtzOjExOiJwb3dlcl9yYW5rcyI7aToxO31pOjc7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo3OiJDaGFybGllIjtzOjEwOiJwb3dlcl9uYW1lIjtzOjk6IkNvcnJvc2lvbiI7czoxMToicG93ZXJfcmFua3MiO2k6MTt9aTo4O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NzoiQ2hhcmxpZSI7czoxMDoicG93ZXJfbmFtZSI7czoxMjoiRHJlYW0gVHJhdmVsIjtzOjExOiJwb3dlcl9yYW5rcyI7aToxO31pOjk7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo3OiJDaGFybGllIjtzOjEwOiJwb3dlcl9uYW1lIjtzOjE4OiJFbGVjdHJpY2FsIENvbnRyb2wiO3M6MTE6InBvd2VyX3JhbmtzIjtpOjE7fWk6MTA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo3OiJDaGFybGllIjtzOjEwOiJwb3dlcl9uYW1lIjtzOjE5OiJQcm9iYWJpbGl0eSBDb250cm9sIjtzOjExOiJwb3dlcl9yYW5rcyI7aToxO31pOjExO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NzoiQ2hhcmxpZSI7czoxMDoicG93ZXJfbmFtZSI7czoxMToiVGVsZWtpbmVzaXMiO3M6MTE6InBvd2VyX3JhbmtzIjtpOjE7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQyMjU5MDk2NjtzOjE6ImMiO2k6MTQyMjU4ODcyODtzOjE6ImwiO3M6MToiMCI7fX0=',1422590966),
	('f1e3c2cb909aee7de09b9c6e970bbb9c3c90793c','YToxODp7czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiSEFtbjl6ZHpLMTF2V0tuVVNGbGtnQThCQjByaDNHZmFQZnZHRkRJdCI7czozODoibG9naW5fODJlNWQyYzU2YmRkMDgxMTMxOGYwY2YwNzhiNzhiZmMiO2k6MjtzOjM6InVpZCI7aToyO3M6NToidW5hbWUiO3M6MzoidXNzIjtzOjU6ImZlYXRzIjthOjg4OntpOjA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjE7czo5OiJmZWF0X25hbWUiO3M6MTU6IkFjY3VyYXRlIEF0dGFjayI7czo4OiJtdWx0aXBsZSI7aTowO31pOjE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjcxO3M6OToiZmVhdF9uYW1lIjtzOjE1OiJBY3JvYmF0aWMgQmx1ZmYiO3M6ODoibXVsdGlwbGUiO2k6MDt9aToyO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToyO3M6OToiZmVhdF9uYW1lIjtzOjE0OiJBbGwtT3V0IEF0dGFjayI7czo4OiJtdWx0aXBsZSI7aTowO31pOjM7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjUyO3M6OToiZmVhdF9uYW1lIjtzOjEzOiJBbWJpZGV4dGVyaXR5IjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NzI7czo5OiJmZWF0X25hbWUiO3M6MTQ6IkFuaW1hbCBFbXBhdGh5IjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NzM7czo5OiJmZWF0X25hbWUiO3M6OToiQXJ0aWZpY2VyIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NTM7czo5OiJmZWF0X25hbWUiO3M6MTA6IkFzc2Vzc21lbnQiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo3O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTozO3M6OToiZmVhdF9uYW1lIjtzOjEyOiJBdHRhY2sgRm9jdXMiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo4O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo0O3M6OToiZmVhdF9uYW1lIjtzOjIxOiJBdHRhY2sgU3BlY2lhbGl6YXRpb24iO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo5O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo3NDtzOjk6ImZlYXRfbmFtZSI7czoxMDoiQXR0cmFjdGl2ZSI7czo4OiJtdWx0aXBsZSI7aToxO31pOjEwO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo0NjtzOjk6ImZlYXRfbmFtZSI7czoxNToiQmVnaW5uZXIncyBMdWNrIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6MTE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjU0O3M6OToiZmVhdF9uYW1lIjtzOjc6IkJlbmVmaXQiO3M6ODoibXVsdGlwbGUiO2k6MTt9aToxMjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NTtzOjk6ImZlYXRfbmFtZSI7czoxMToiQmxpbmQtRmlnaHQiO3M6ODoibXVsdGlwbGUiO2k6MDt9aToxMztPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NjtzOjk6ImZlYXRfbmFtZSI7czo5OiJDaG9rZWhvbGQiO3M6ODoibXVsdGlwbGUiO2k6MDt9aToxNDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NzU7czo5OiJmZWF0X25hbWUiO3M6OToiQ29ubmVjdGVkIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6MTU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjc2O3M6OToiZmVhdF9uYW1lIjtzOjg6IkNvbnRhY3RzIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6MTY7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjc7czo5OiJmZWF0X25hbWUiO3M6MTU6IkNyaXRpY2FsIFN0cmlrZSI7czo4OiJtdWx0aXBsZSI7aTowO31pOjE3O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo4O3M6OToiZmVhdF9uYW1lIjtzOjE2OiJEZWZlbnNpdmUgQXR0YWNrIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6MTg7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjk7czo5OiJmZWF0X25hbWUiO3M6MTQ6IkRlZmVuc2l2ZSBSb2xsIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6MTk7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjU1O3M6OToiZmVhdF9uYW1lIjtzOjc6IkRpZWhhcmQiO3M6ODoibXVsdGlwbGUiO2k6MDt9aToyMDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6Nzc7czo5OiJmZWF0X25hbWUiO3M6ODoiRGlzdHJhY3QiO3M6ODoibXVsdGlwbGUiO2k6MTt9aToyMTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MTA7czo5OiJmZWF0X25hbWUiO3M6MTE6IkRvZGdlIEZvY3VzIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6MjI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjU2O3M6OToiZmVhdF9uYW1lIjtzOjE0OiJFaWRldGljIE1lbW9yeSI7czo4OiJtdWx0aXBsZSI7aTowO31pOjIzO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToxMTtzOjk6ImZlYXRfbmFtZSI7czoxNDoiRWx1c2l2ZSBUYXJnZXQiO3M6ODoibXVsdGlwbGUiO2k6MDt9aToyNDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NTc7czo5OiJmZWF0X25hbWUiO3M6OToiRW5kdXJhbmNlIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6MjU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjU4O3M6OToiZmVhdF9uYW1lIjtzOjI0OiJFbnZpcm9ubWVudGFsIEFkYXB0YXRpb24iO3M6ODoibXVsdGlwbGUiO2k6MDt9aToyNjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NTk7czo5OiJmZWF0X25hbWUiO3M6OToiRXF1aXBtZW50IjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6Mjc7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjEyO3M6OToiZmVhdF9uYW1lIjtzOjc6IkV2YXNpb24iO3M6ODoibXVsdGlwbGUiO2k6MTt9aToyODtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6Nzg7czo5OiJmZWF0X25hbWUiO3M6OToiRmFzY2luYXRlIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6Mjk7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjEzO3M6OToiZmVhdF9uYW1lIjtzOjEyOiJGYXN0IE92ZXJydW4iO3M6ODoibXVsdGlwbGUiO2k6MDt9aTozMDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MTQ7czo5OiJmZWF0X25hbWUiO3M6MTk6IkZhdm9yZWQgRW52aXJvbm1lbnQiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTozMTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MTU7czo5OiJmZWF0X25hbWUiO3M6MTY6IkZhdm9yZWQgT3Bwb25lbnQiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTozMjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NjA7czo5OiJmZWF0X25hbWUiO3M6ODoiRmVhcmxlc3MiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTozMztPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NjE7czo5OiJmZWF0X25hbWUiO3M6MTc6IkZlYXJzb21lIFByZXNlbmNlIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6MzQ7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjE2O3M6OToiZmVhdF9uYW1lIjtzOjE3OiJHcmFwcGxpbmcgRmluZXNzZSI7czo4OiJtdWx0aXBsZSI7aTowO31pOjM1O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo3OTtzOjk6ImZlYXRfbmFtZSI7czoxOToiSGlkZSBJbiBQbGFpbiBTaWdodCI7czo4OiJtdWx0aXBsZSI7aTowO31pOjM2O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToxNztzOjk6ImZlYXRfbmFtZSI7czoxMjoiSW1wcm92ZWQgQWltIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6Mzc7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjE4O3M6OToiZmVhdF9uYW1lIjtzOjE0OiJJbXByb3ZlZCBCbG9jayI7czo4OiJtdWx0aXBsZSI7aToxO31pOjM4O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToxOTtzOjk6ImZlYXRfbmFtZSI7czoxNzoiSW1wcm92ZWQgQ3JpdGljYWwiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTozOTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MjA7czo5OiJmZWF0X25hbWUiO3M6MTY6IkltcHJvdmVkIERlZmVuc2UiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo0MDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MjE7czo5OiJmZWF0X25hbWUiO3M6MTU6IkltcHJvdmVkIERpc2FybSI7czo4OiJtdWx0aXBsZSI7aToxO31pOjQxO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToyMjtzOjk6ImZlYXRfbmFtZSI7czoxMzoiSW1wcm92ZWQgR3JhYiI7czo4OiJtdWx0aXBsZSI7aTowO31pOjQyO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToyMztzOjk6ImZlYXRfbmFtZSI7czoxNjoiSW1wcm92ZWQgR3JhcHBsZSI7czo4OiJtdWx0aXBsZSI7aTowO31pOjQzO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToyNDtzOjk6ImZlYXRfbmFtZSI7czoxOToiSW1wcm92ZWQgSW5pdGlhdGl2ZSI7czo4OiJtdWx0aXBsZSI7aToxO31pOjQ0O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToyNTtzOjk6ImZlYXRfbmFtZSI7czoxNjoiSW1wcm92ZWQgT3ZlcnJ1biI7czo4OiJtdWx0aXBsZSI7aTowO31pOjQ1O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aToyNjtzOjk6ImZlYXRfbmFtZSI7czoxMjoiSW1wcm92ZWQgUGluIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NDY7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjI3O3M6OToiZmVhdF9uYW1lIjtzOjE1OiJJbXByb3ZlZCBTdW5kZXIiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo0NztPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6Mjg7czo5OiJmZWF0X25hbWUiO3M6MTQ6IkltcHJvdmVkIFRocm93IjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NDg7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjI5O3M6OToiZmVhdF9uYW1lIjtzOjEzOiJJbXByb3ZlZCBUcmlwIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NDk7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjgwO3M6OToiZmVhdF9uYW1lIjtzOjE2OiJJbXByb3Zpc2VkIFRvb2xzIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NTA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjQ3O3M6OToiZmVhdF9uYW1lIjtzOjc6Ikluc3BpcmUiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo1MTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NjI7czo5OiJmZWF0X25hbWUiO3M6MTA6Ikluc3RhbnQgVXAiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo1MjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NjM7czo5OiJmZWF0X25hbWUiO3M6OToiSW50ZXJwb3NlIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NTM7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjgxO3M6OToiZmVhdF9uYW1lIjtzOjg6IkludmVudG9yIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NTQ7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjgyO3M6OToiZmVhdF9uYW1lIjtzOjE4OiJKYWNrLU9mLUFsbC1UcmFkZXMiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo1NTtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NDg7czo5OiJmZWF0X25hbWUiO3M6MTA6IkxlYWRlcnNoaXAiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo1NjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NDk7czo5OiJmZWF0X25hbWUiO3M6NDoiTHVjayI7czo4OiJtdWx0aXBsZSI7aToxO31pOjU3O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo2NDtzOjk6ImZlYXRfbmFtZSI7czoxMToiTWFzdGVyIFBsYW4iO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo1ODtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NjU7czo5OiJmZWF0X25hbWUiO3M6NzoiTWluaW9ucyI7czo4OiJtdWx0aXBsZSI7aToxO31pOjU5O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTozMDtzOjk6ImZlYXRfbmFtZSI7czoxNDoiTW92ZS1CeSBBY3Rpb24iO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo2MDtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MzE7czo5OiJmZWF0X25hbWUiO3M6MTI6IlBvd2VyIEF0dGFjayI7czo4OiJtdWx0aXBsZSI7aTowO31pOjYxO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTozMjtzOjk6ImZlYXRfbmFtZSI7czoxMjoiUHJlY2lzZSBTaG90IjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6NjI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjMzO3M6OToiZmVhdF9uYW1lIjtzOjE0OiJQcm9uZSBGaWdodGluZyI7czo4OiJtdWx0aXBsZSI7aTowO31pOjYzO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo2NjtzOjk6ImZlYXRfbmFtZSI7czoxMjoiUXVpY2sgQ2hhbmdlIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6NjQ7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjM0O3M6OToiZmVhdF9uYW1lIjtzOjEwOiJRdWljayBEcmF3IjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6NjU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjM1O3M6OToiZmVhdF9uYW1lIjtzOjQ6IlJhZ2UiO3M6ODoibXVsdGlwbGUiO2k6MTt9aTo2NjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6MzY7czo5OiJmZWF0X25hbWUiO3M6MTA6IlJhbmdlZCBQaW4iO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo2NztPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6Mzc7czo5OiJmZWF0X25hbWUiO3M6ODoiUmVkaXJlY3QiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo2ODtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6ODM7czo5OiJmZWF0X25hbWUiO3M6OToiUml0dWFsaXN0IjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6Njk7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjY3O3M6OToiZmVhdF9uYW1lIjtzOjEzOiJTZWNvbmQgQ2hhbmNlIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6NzA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjUwO3M6OToiZmVhdF9uYW1lIjtzOjE2OiJTZWl6ZSBJbml0aWF0aXZlIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6NzE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjM4O3M6OToiZmVhdF9uYW1lIjtzOjY6IlNldC1VcCI7czo4OiJtdWx0aXBsZSI7aTowO31pOjcyO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo2ODtzOjk6ImZlYXRfbmFtZSI7czo4OiJTaWRla2ljayI7czo4OiJtdWx0aXBsZSI7aToxO31pOjczO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo4NDtzOjk6ImZlYXRfbmFtZSI7czoxMzoiU2tpbGwgTWFzdGVyeSI7czo4OiJtdWx0aXBsZSI7aToxO31pOjc0O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTozOTtzOjk6ImZlYXRfbmFtZSI7czoxMjoiU25lYWsgQXR0YWNrIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6NzU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjg1O3M6OToiZmVhdF9uYW1lIjtzOjc6IlN0YXJ0bGUiO3M6ODoibXVsdGlwbGUiO2k6MDt9aTo3NjtPOjg6InN0ZENsYXNzIjozOntzOjc6ImZlYXRfaWQiO2k6NDA7czo5OiJmZWF0X25hbWUiO3M6MTU6IlN0dW5uaW5nIEF0dGFjayI7czo4OiJtdWx0aXBsZSI7aTowO31pOjc3O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo0MTtzOjk6ImZlYXRfbmFtZSI7czoxNToiVGFrZWRvd24gQXR0YWNrIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6Nzg7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjg2O3M6OToiZmVhdF9uYW1lIjtzOjU6IlRhdW50IjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6Nzk7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjY5O3M6OToiZmVhdF9uYW1lIjtzOjg6IlRlYW13b3JrIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6ODA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjQyO3M6OToiZmVhdF9uYW1lIjtzOjE2OiJUaHJvd2luZyBNYXN0ZXJ5IjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6ODE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjg3O3M6OToiZmVhdF9uYW1lIjtzOjU6IlRyYWNrIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6ODI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjcwO3M6OToiZmVhdF9uYW1lIjtzOjY6IlRyYW5jZSI7czo4OiJtdWx0aXBsZSI7aTowO31pOjgzO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo1MTtzOjk6ImZlYXRfbmFtZSI7czoxNToiVWx0aW1hdGUgRWZmb3J0IjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6ODQ7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjQzO3M6OToiZmVhdF9uYW1lIjtzOjEzOiJVbmNhbm55IERvZGdlIjtzOjg6Im11bHRpcGxlIjtpOjE7fWk6ODU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjQ0O3M6OToiZmVhdF9uYW1lIjtzOjExOiJXZWFwb24gQmluZCI7czo4OiJtdWx0aXBsZSI7aTowO31pOjg2O086ODoic3RkQ2xhc3MiOjM6e3M6NzoiZmVhdF9pZCI7aTo0NTtzOjk6ImZlYXRfbmFtZSI7czoxMjoiV2VhcG9uIEJyZWFrIjtzOjg6Im11bHRpcGxlIjtpOjA7fWk6ODc7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJmZWF0X2lkIjtpOjg4O3M6OToiZmVhdF9uYW1lIjtzOjEzOiJXZWxsLUluZm9ybWVkIjtzOjg6Im11bHRpcGxlIjtpOjA7fX1zOjY6InBvd2VycyI7YToxNjA6e2k6MDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjE7czoxMDoicG93ZXJfbmFtZSI7czoxMToiQWJvc29ycHRpb24iO3M6MTA6InBvd2VyX2Nvc3QiO2k6NDtzOjc6Im5vX3JhbmsiO2k6MDt9aToxO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MjtzOjEwOiJwb3dlcl9uYW1lIjtzOjQ6IkFjaWQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MztzOjc6Im5vX3JhbmsiO2k6MDt9aToyO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTIwO3M6MTA6InBvd2VyX25hbWUiO3M6MTY6IkFkZGl0aW9uYWwgTGltYnMiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aTozO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MztzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJBZHJlbmFsIFN1cmdlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6NDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjQ7czoxMDoicG93ZXJfbmFtZSI7czo5OiJBZ2UgU2hpZnQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6ODtzOjc6Im5vX3JhbmsiO2k6MTt9aTo1O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NTtzOjEwOiJwb3dlcl9uYW1lIjtzOjExOiJBaXIgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjY7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo2O3M6MTA6InBvd2VyX25hbWUiO3M6MTQ6IkFsdGVybmF0ZSBGb3JtIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjU7czo3OiJub19yYW5rIjtpOjA7fWk6NztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEyMTtzOjEwOiJwb3dlcl9uYW1lIjtzOjE5OiJBbmF0b21pYyBTZXBhcmF0aW9uIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6ODtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjc7czoxMDoicG93ZXJfbmFtZSI7czoxNDoiQW5pbWFsIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo5O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6ODtzOjEwOiJwb3dlcl9uYW1lIjtzOjE0OiJBbmltYWwgTWltaWNyeSI7czoxMDoicG93ZXJfY29zdCI7aTo5O3M6Nzoibm9fcmFuayI7aTowO31pOjEwO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6OTtzOjEwOiJwb3dlcl9uYW1lIjtzOjE1OiJBbmltYXRlIE9iamVjdHMiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MztzOjc6Im5vX3JhbmsiO2k6MDt9aToxMTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEwO3M6MTA6InBvd2VyX25hbWUiO3M6MTE6IkFzdHJhbCBGb3JtIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjU7czo3OiJub19yYW5rIjtpOjA7fWk6MTI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMTtzOjEwOiJwb3dlcl9uYW1lIjtzOjU6IkJsYXN0IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTM7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMjtzOjEwOiJwb3dlcl9uYW1lIjtzOjE3OiJCbGVuZGluZzogUGFydGlhbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aToxO31pOjE0O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTM7czoxMDoicG93ZXJfbmFtZSI7czoxNToiQmxlbmRpbmc6IFRvdGFsIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjQ7czo3OiJub19yYW5rIjtpOjE7fWk6MTU7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxNDtzOjEwOiJwb3dlcl9uYW1lIjtzOjQ6IkJsdXIiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NDtzOjc6Im5vX3JhbmsiO2k6MTt9aToxNjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjE1O3M6MTA6InBvd2VyX25hbWUiO3M6ODoiQm91bmNpbmciO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxNztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEyMjtzOjEwOiJwb3dlcl9uYW1lIjtzOjk6IkJ1cnJvd2luZyI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjE4O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTY7czoxMDoicG93ZXJfbmFtZSI7czozOiJDaGkiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aToxOTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjE3O3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IkNsYWlyYXVkaWVuY2UiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aToyMDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjE4O3M6MTA6InBvd2VyX25hbWUiO3M6MTI6IkNsYWlydm95YW5jZSI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjIxO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTk7czoxMDoicG93ZXJfbmFtZSI7czoxMjoiQ29sZCBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MjI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToyMDtzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJDb2xvciBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MjM7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMjM7czoxMDoicG93ZXJfbmFtZSI7czoxMzoiQ29tbXVuaWNhdGlvbiI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjI0O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTI0O3M6MTA6InBvd2VyX25hbWUiO3M6MTA6IkNvbXByZWhlbmQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aToyNTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEyNTtzOjEwOiJwb3dlcl9uYW1lIjtzOjExOiJDb25jZWFsbWVudCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjI2O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTI2O3M6MTA6InBvd2VyX25hbWUiO3M6NzoiQ29uZnVzZSI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjI3O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MjE7czoxMDoicG93ZXJfbmFtZSI7czo5OiJDb3Jyb3Npb24iO3M6MTA6InBvd2VyX2Nvc3QiO2k6MztzOjc6Im5vX3JhbmsiO2k6MDt9aToyODtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjIyO3M6MTA6InBvd2VyX25hbWUiO3M6MjE6IkNvc21pYyBFbmVyZ3kgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjI5O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTI3O3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IkNyZWF0ZSBPYmplY3QiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTozMDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEyODtzOjEwOiJwb3dlcl9uYW1lIjtzOjY6IkRhbWFnZSI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjMxO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MjM7czoxMDoicG93ZXJfbmFtZSI7czoxNjoiRGFya25lc3MgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjMyO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MjQ7czoxMDoicG93ZXJfbmFtZSI7czo4OiJEYXRhbGluayI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjMzO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MjU7czoxMDoicG93ZXJfbmFtZSI7czoxMToiRGVhdGggVG91Y2giO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aTozNDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEyOTtzOjEwOiJwb3dlcl9uYW1lIjtzOjc6IkRlbnNpdHkiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MztzOjc6Im5vX3JhbmsiO2k6MDt9aTozNTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjI2O3M6MTA6InBvd2VyX25hbWUiO3M6MjA6IkRldmljZTogRWFzeSBUbyBMb3NlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjM7czo3OiJub19yYW5rIjtpOjA7fWk6MzY7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToyNztzOjEwOiJwb3dlcl9uYW1lIjtzOjIwOiJEZXZpY2U6IEhhcmQgVG8gTG9zZSI7czoxMDoicG93ZXJfY29zdCI7aTo0O3M6Nzoibm9fcmFuayI7aTowO31pOjM3O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6Mjg7czoxMDoicG93ZXJfbmFtZSI7czoxOToiRGltZW5zaW9uYWwgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjM4O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6Mjk7czoxMDoicG93ZXJfbmFtZSI7czoxODoiRGltZW5zaW9uYWwgUG9ja2V0IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6Mzk7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTozMDtzOjEwOiJwb3dlcl9uYW1lIjtzOjc6IkRpc2Vhc2UiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MztzOjc6Im5vX3JhbmsiO2k6MDt9aTo0MDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjMxO3M6MTA6InBvd2VyX25hbWUiO3M6MTQ6IkRpc2ludGVncmF0aW9uIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjU7czo3OiJub19yYW5rIjtpOjA7fWk6NDE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTozMjtzOjEwOiJwb3dlcl9uYW1lIjtzOjEyOiJEaXNwbGFjZW1lbnQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NDtzOjc6Im5vX3JhbmsiO2k6MTt9aTo0MjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjMzO3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IkRyZWFtIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MztzOjc6Im5vX3JhbmsiO2k6MDt9aTo0MztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjM0O3M6MTA6InBvd2VyX25hbWUiO3M6MTI6IkRyZWFtIFRyYXZlbCI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjQ0O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MzU7czoxMDoicG93ZXJfbmFtZSI7czoxMToiRHVwbGljYXRpb24iO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo0NTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjM2O3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IkVhcnRoIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo0NjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjM3O3M6MTA6InBvd2VyX25hbWUiO3M6MTA6IkVsYXN0aWNpdHkiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aTo0NztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjM4O3M6MTA6InBvd2VyX25hbWUiO3M6MTg6IkVsZWN0cmljYWwgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjQ4O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTMwO3M6MTA6InBvd2VyX25hbWUiO3M6MTA6IkVsb25nYXRpb24iO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aTo0OTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEzMTtzOjEwOiJwb3dlcl9uYW1lIjtzOjE1OiJFbW90aW9uIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo1MDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjM5O3M6MTA6InBvd2VyX25hbWUiO3M6MTE6IkVtcG93ZXJtZW50IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjY7czo3OiJub19yYW5rIjtpOjA7fWk6NTE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo0MDtzOjEwOiJwb3dlcl9uYW1lIjtzOjExOiJFbmVyZ3kgQXVyYSI7czoxMDoicG93ZXJfY29zdCI7aTo0O3M6Nzoibm9fcmFuayI7aTowO31pOjUyO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NDE7czoxMDoicG93ZXJfbmFtZSI7czoxODoiRXZvbHV0aW9uYXJ5IFNoaWZ0IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjEwO3M6Nzoibm9fcmFuayI7aToxO31pOjUzO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NDI7czoxMDoicG93ZXJfbmFtZSI7czo4OiJFeG9yY2lzbSI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjU0O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTMyO3M6MTA6InBvd2VyX25hbWUiO3M6NzoiRmF0aWd1ZSI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjU1O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NDM7czoxMDoicG93ZXJfbmFtZSI7czoxMjoiRmlyZSBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6NTY7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMzM7czoxMDoicG93ZXJfbmFtZSI7czo2OiJGbGlnaHQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo1NztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjQ0O3M6MTA6InBvd2VyX25hbWUiO3M6MTY6IkZvcmNlIENvbnN0cnVjdHMiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo1ODtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjQ1O3M6MTA6InBvd2VyX25hbWUiO3M6MTE6IkZvcmNlIEZpZWxkIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6NTk7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo0NjtzOjEwOiJwb3dlcl9uYW1lIjtzOjE2OiJGcmljdGlvbiBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjM7czo3OiJub19yYW5rIjtpOjA7fWk6NjA7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo0NztzOjEwOiJwb3dlcl9uYW1lIjtzOjIxOiJHYWRnZXRzOiBFYXN5IFRvIExvc2UiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo2MTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjQ4O3M6MTA6InBvd2VyX25hbWUiO3M6MjE6IkdhZGdldHM6IEhhcmQgVG8gTG9zZSI7czoxMDoicG93ZXJfY29zdCI7aTo3O3M6Nzoibm9fcmFuayI7aTowO31pOjYyO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NDk7czoxMDoicG93ZXJfbmFtZSI7czo3OiJHZXN0YWx0IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6NjM7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo1MDtzOjEwOiJwb3dlcl9uYW1lIjtzOjg6IkdyYWZ0aW5nIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjExO3M6Nzoibm9fcmFuayI7aTowO31pOjY0O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NTE7czoxMDoicG93ZXJfbmFtZSI7czoxNToiR3Jhdml0eSBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6NjU7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMzQ7czoxMDoicG93ZXJfbmFtZSI7czo2OiJHcm93dGgiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MztzOjc6Im5vX3JhbmsiO2k6MDt9aTo2NjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEzNTtzOjEwOiJwb3dlcl9uYW1lIjtzOjc6IkhlYWxpbmciO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo2NztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjUyO3M6MTA6InBvd2VyX25hbWUiO3M6MTY6IkhlbGxmaXJlIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo2ODtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjUzO3M6MTA6InBvd2VyX25hbWUiO3M6ODoiSHlwbm9zaXMiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo2OTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjU0O3M6MTA6InBvd2VyX25hbWUiO3M6NjoiSWduaXRlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjM7czo3OiJub19yYW5rIjtpOjA7fWk6NzA7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo1NTtzOjEwOiJwb3dlcl9uYW1lIjtzOjExOiJJbW1vcnRhbGl0eSI7czoxMDoicG93ZXJfY29zdCI7aTo1O3M6Nzoibm9fcmFuayI7aToxO31pOjcxO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTM2O3M6MTA6InBvd2VyX25hbWUiO3M6OToiSW1tb3ZhYmxlIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6NzI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo1NjtzOjEwOiJwb3dlcl9uYW1lIjtzOjk6IkltbXV0YWJsZSI7czoxMDoicG93ZXJfY29zdCI7aToxMDtzOjc6Im5vX3JhbmsiO2k6MTt9aTo3MztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEzNztzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJJbnN1YnN0YW50aWFsIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjU7czo3OiJub19yYW5rIjtpOjA7fWk6NzQ7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo1ODtzOjEwOiJwb3dlcl9uYW1lIjtzOjE4OiJJbnZpc2liaWxpdHk6IEZ1bGwiO3M6MTA6InBvd2VyX2Nvc3QiO2k6ODtzOjc6Im5vX3JhbmsiO2k6MTt9aTo3NTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjU3O3M6MTA6InBvd2VyX25hbWUiO3M6MjA6IkludmlzaWJsaXR5OiBQYXJ0aWFsIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjQ7czo3OiJub19yYW5rIjtpOjE7fWk6NzY7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo1OTtzOjEwOiJwb3dlcl9uYW1lIjtzOjE1OiJLaW5ldGljIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo3NztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEzODtzOjEwOiJwb3dlcl9uYW1lIjtzOjc6IkxlYXBpbmciO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aTo3ODtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjYwO3M6MTA6InBvd2VyX25hbWUiO3M6MTI6IkxpZmUgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aTo0O3M6Nzoibm9fcmFuayI7aTowO31pOjc5O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NjE7czoxMDoicG93ZXJfbmFtZSI7czoxMzoiTGlnaHQgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjgwO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTM5O3M6MTA6InBvd2VyX25hbWUiO3M6MTI6Ikx1Y2sgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aTozO3M6Nzoibm9fcmFuayI7aTowO31pOjgxO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NjI7czoxMDoicG93ZXJfbmFtZSI7czoxNzoiTWFjaGluZSBBbmltYXRpb24iO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo4MjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjYzO3M6MTA6InBvd2VyX25hbWUiO3M6NToiTWFnaWMiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo4MztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjY0O3M6MTA6InBvd2VyX25hbWUiO3M6MTY6Ik1hZ25ldGljIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo4NDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjY1O3M6MTA6InBvd2VyX25hbWUiO3M6MTI6Ik1lbnRhbCBCbGFzdCI7czoxMDoicG93ZXJfY29zdCI7aTo0O3M6Nzoibm9fcmFuayI7aTowO31pOjg1O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NjY7czoxMDoicG93ZXJfbmFtZSI7czoxODoiTWVudGFsIER1cGxpY2F0aW9uIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjM7czo3OiJub19yYW5rIjtpOjA7fWk6ODY7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo2NztzOjEwOiJwb3dlcl9uYW1lIjtzOjE3OiJNaWNyb3dhdmUgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjg3O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTQwO3M6MTA6InBvd2VyX25hbWUiO3M6MTI6Ik1pbmQgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjg4O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTQxO3M6MTA6InBvd2VyX25hbWUiO3M6MTI6Ik1pbmQgUmVhZGluZyI7czoxMDoicG93ZXJfY29zdCI7aTowO3M6Nzoibm9fcmFuayI7aToxO31pOjg5O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6Njg7czoxMDoicG93ZXJfbmFtZSI7czoxMToiTWluZCBTaGllbGQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aTo5MDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjY5O3M6MTA6InBvd2VyX25hbWUiO3M6MTE6Ik1pbmQgU3dpdGNoIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6OTE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo3MDtzOjEwOiJwb3dlcl9uYW1lIjtzOjEyOiJNaXJyb3IgSW1hZ2UiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NDtzOjc6Im5vX3JhbmsiO2k6MTt9aTo5MjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjE0MjtzOjEwOiJwb3dlcl9uYW1lIjtzOjExOiJNb3ZlIE9iamVjdCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjkzO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NzE7czoxMDoicG93ZXJfbmFtZSI7czo4OiJNdXRhdGlvbiI7czoxMDoicG93ZXJfY29zdCI7aTo0O3M6Nzoibm9fcmFuayI7aTowO31pOjk0O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTQzO3M6MTA6InBvd2VyX25hbWUiO3M6ODoiTmF1c2VhdGUiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo5NTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjcyO3M6MTA6InBvd2VyX25hbWUiO3M6NzoiTmVtZXNpcyI7czoxMDoicG93ZXJfY29zdCI7aTo4O3M6Nzoibm9fcmFuayI7aTowO31pOjk2O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6NzM7czoxMDoicG93ZXJfbmFtZSI7czoxNDoiT2JqZWN0IE1pbWljcnkiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo5NztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjc0O3M6MTA6InBvd2VyX25hbWUiO3M6NDoiUGFpbiI7czoxMDoicG93ZXJfY29zdCI7aTo1O3M6Nzoibm9fcmFuayI7aTowO31pOjk4O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTQ0O3M6MTA6InBvd2VyX25hbWUiO3M6ODoiUGFyYWx5emUiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aTo5OTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjc1O3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IlBldHJpZmljYXRpb24iO3M6MTA6InBvd2VyX2Nvc3QiO2k6MztzOjc6Im5vX3JhbmsiO2k6MDt9aToxMDA7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo3NjtzOjEwOiJwb3dlcl9uYW1lIjtzOjEwOiJQaGVyb21vbmVzIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjQ7czo3OiJub19yYW5rIjtpOjA7fWk6MTAxO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6Nzc7czoxMDoicG93ZXJfbmFtZSI7czoxMzoiUGxhbnQgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjEwMjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjc4O3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IlBsYW50IE1pbWljcnkiO3M6MTA6InBvd2VyX2Nvc3QiO2k6OTtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMDM7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo3OTtzOjEwOiJwb3dlcl9uYW1lIjtzOjE0OiJQbGFzbWEgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjEwNDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjgwO3M6MTA6InBvd2VyX25hbWUiO3M6MTA6IlBvc3Nlc3Npb24iO3M6MTA6InBvd2VyX2Nvc3QiO2k6MztzOjc6Im5vX3JhbmsiO2k6MDt9aToxMDU7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo4MTtzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJQb3dlciBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTA2O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6ODI7czoxMDoicG93ZXJfbmFtZSI7czoxMzoiUG93ZXIgUmVzZXJ2ZSI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjEwNztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjgzO3M6MTA6InBvd2VyX25hbWUiO3M6MTY6IlBvd2VyIFJlc2lzdGFuY2UiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMDg7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo4NDtzOjEwOiJwb3dlcl9uYW1lIjtzOjE1OiJQcmVoaW5zaWxlIEhhaXIiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMDk7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxNDU7czoxMDoicG93ZXJfbmFtZSI7czoxOToiUHJvYmFiaWxpdHkgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aTo0O3M6Nzoibm9fcmFuayI7aTowO31pOjExMDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjE0NjtzOjEwOiJwb3dlcl9uYW1lIjtzOjEwOiJQcm90ZWN0aW9uIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6MTExO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTQ3O3M6MTA6InBvd2VyX25hbWUiO3M6OToiUXVpY2tuZXNzIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6MTEyO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6ODU7czoxMDoicG93ZXJfbmFtZSI7czoxNzoiUmFkaWF0aW9uIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMTM7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo4NjtzOjEwOiJwb3dlcl9uYW1lIjtzOjE2OiJSZWZsZWN0aW9uIEZpZWxkIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjg7czo3OiJub19yYW5rIjtpOjA7fWk6MTE0O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6ODc7czoxMDoicG93ZXJfbmFtZSI7czoxMzoiUmVmbGV4IE1lbW9yeSI7czoxMDoicG93ZXJfY29zdCI7aTo5O3M6Nzoibm9fcmFuayI7aTowO31pOjExNTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjE0ODtzOjEwOiJwb3dlcl9uYW1lIjtzOjEyOiJSZWdlbmVyYXRpb24iO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMTY7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo4ODtzOjEwOiJwb3dlcl9uYW1lIjtzOjEyOiJTZW5zb3J5IExpbmsiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMTc7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo4OTtzOjEwOiJwb3dlcl9uYW1lIjtzOjI0OiJTZW5zb3J5IFNoaWVsZDogIDEgc2Vuc2UiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMTg7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo5MDtzOjEwOiJwb3dlcl9uYW1lIjtzOjI2OiJTZW5zb3J5IFNoaWVsZDogQWxsIHNlbnNlcyI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjExOTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjkxO3M6MTA6InBvd2VyX25hbWUiO3M6MTI6IlNoYXBlIE1hdHRlciI7czoxMDoicG93ZXJfY29zdCI7aTo0O3M6Nzoibm9fcmFuayI7aTowO31pOjEyMDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjkyO3M6MTA6InBvd2VyX25hbWUiO3M6MTA6IlNoYXBlc2hpZnQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6ODtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMjE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo5MztzOjEwOiJwb3dlcl9uYW1lIjtzOjY6IlNoaWVsZCI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjEyMjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjE0OTtzOjEwOiJwb3dlcl9uYW1lIjtzOjk6IlNocmlua2luZyI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjEyMztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjk0O3M6MTA6InBvd2VyX25hbWUiO3M6MjI6IlNpbGVuY2U6IEh1bWFuIEhlYXJpbmciO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMjQ7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo5NTtzOjEwOiJwb3dlcl9uYW1lIjtzOjI3OiJTaWxlbmNlOiBJbnZpc2libGUgdG8gU29uYXIiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMjU7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo5NjtzOjEwOiJwb3dlcl9uYW1lIjtzOjU6IlNsZWVwIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjM7czo3OiJub19yYW5rIjtpOjA7fWk6MTI2O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTUwO3M6MTA6InBvd2VyX25hbWUiO3M6NToiU25hcmUiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMjc7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aTo5NztzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJTb25pYyBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTI4O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTUxO3M6MTA6InBvd2VyX25hbWUiO3M6MTI6IlNwYWNlIFRyYXZlbCI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjEyOTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjk4O3M6MTA6InBvd2VyX25hbWUiO3M6MTU6IlNwYXRpYWwgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjEzMDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjE1MjtzOjEwOiJwb3dlcl9uYW1lIjtzOjU6IlNwZWVkIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6MTMxO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6OTk7czoxMDoicG93ZXJfbmFtZSI7czo4OiJTcGlubmluZyI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjEzMjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEwMDtzOjEwOiJwb3dlcl9uYW1lIjtzOjE0OiJTcGlyaXQgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjEzMztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEwMTtzOjEwOiJwb3dlcl9uYW1lIjtzOjY6IlN0cmlrZSI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjEzNDtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjE1MztzOjEwOiJwb3dlcl9uYW1lIjtzOjQ6IlN0dW4iO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMzU7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxNTQ7czoxMDoicG93ZXJfbmFtZSI7czo5OiJTdWZmb2NhdGUiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMzY7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxNTU7czoxMDoicG93ZXJfbmFtZSI7czoxNDoiU3VwZXItTW92ZW1lbnQiO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxMzc7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxNTY7czoxMDoicG93ZXJfbmFtZSI7czoxMjoiU3VwZXItU2Vuc2VzIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6MTM4O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTAyO3M6MTA6InBvd2VyX25hbWUiO3M6MTE6IlN1cGVyLVNwZWVkIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjU7czo3OiJub19yYW5rIjtpOjA7fWk6MTM5O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTU3O3M6MTA6InBvd2VyX25hbWUiO3M6MTQ6IlN1cGVyLVN0cmVuZ3RoIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTQwO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTAzO3M6MTA6InBvd2VyX25hbWUiO3M6MTk6IlN1cGVyLVZlbnRyaWxvcXVpc20iO3M6MTA6InBvd2VyX2Nvc3QiO2k6MTtzOjc6Im5vX3JhbmsiO2k6MDt9aToxNDE7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMDQ7czoxMDoicG93ZXJfbmFtZSI7czoxOToiU3VzcGVuZGVkIEFuaW1hdGlvbiI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjE0MjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjE1ODtzOjEwOiJwb3dlcl9uYW1lIjtzOjg6IlN3aW1taW5nIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjE7czo3OiJub19yYW5rIjtpOjA7fWk6MTQzO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTA1O3M6MTA6InBvd2VyX25hbWUiO3M6MTE6IlRlbGVraW5lc2lzIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTQ0O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTA2O3M6MTA6InBvd2VyX25hbWUiO3M6MTI6IlRlbGVsb2NhdGlvbiI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjE0NTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEwNztzOjEwOiJwb3dlcl9uYW1lIjtzOjk6IlRlbGVwYXRoeSI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjE0NjtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjE1OTtzOjEwOiJwb3dlcl9uYW1lIjtzOjg6IlRlbGVwb3J0IjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTQ3O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTA4O3M6MTA6InBvd2VyX25hbWUiO3M6MTU6IlRoZXJtYWwgQ29udHJvbCI7czoxMDoicG93ZXJfY29zdCI7aToyO3M6Nzoibm9fcmFuayI7aTowO31pOjE0ODtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjEwOTtzOjEwOiJwb3dlcl9uYW1lIjtzOjEyOiJUaW1lIENvbnRyb2wiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NztzOjc6Im5vX3JhbmsiO2k6MDt9aToxNDk7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMTA7czoxMDoicG93ZXJfbmFtZSI7czo5OiJUaW1lIFN0b3AiO3M6MTA6InBvd2VyX2Nvc3QiO2k6NztzOjc6Im5vX3JhbmsiO2k6MDt9aToxNTA7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMTE7czoxMDoicG93ZXJfbmFtZSI7czo4OiJUcmFuc21pdCI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjE1MTtPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjExMjtzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJUcmFuc211dGF0aW9uIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjU7czo3OiJub19yYW5rIjtpOjA7fWk6MTUyO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTYwO3M6MTA6InBvd2VyX25hbWUiO3M6NDoiVHJpcCI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjE1MztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjExMztzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJUcm91Ymxlc2Vla2VyIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTU0O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTE0O3M6MTA6InBvd2VyX25hbWUiO3M6MjA6IlVuaXZlcnNhbCBUcmFuc2xhdG9yIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjg7czo3OiJub19yYW5rIjtpOjE7fWk6MTU1O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTE1O3M6MTA6InBvd2VyX25hbWUiO3M6MTc6IlZpYnJhdGlvbiBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTU2O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTE2O3M6MTA6InBvd2VyX25hbWUiO3M6NDoiV2FyZCI7czoxMDoicG93ZXJfY29zdCI7aToxO3M6Nzoibm9fcmFuayI7aTowO31pOjE1NztPOjg6InN0ZENsYXNzIjo0OntzOjg6InBvd2VyX2lkIjtpOjExNztzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJXYXRlciBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fWk6MTU4O086ODoic3RkQ2xhc3MiOjQ6e3M6ODoicG93ZXJfaWQiO2k6MTE4O3M6MTA6InBvd2VyX25hbWUiO3M6MTY6IldlYXBvbiBTdW1tb25pbmciO3M6MTA6InBvd2VyX2Nvc3QiO2k6MjtzOjc6Im5vX3JhbmsiO2k6MDt9aToxNTk7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJwb3dlcl9pZCI7aToxMTk7czoxMDoicG93ZXJfbmFtZSI7czoxNToiV2VhdGhlciBDb250cm9sIjtzOjEwOiJwb3dlcl9jb3N0IjtpOjI7czo3OiJub19yYW5rIjtpOjA7fX1zOjY6InNraWxscyI7YTo0Mjp7aTowO086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MTtzOjEwOiJza2lsbF9uYW1lIjtzOjEwOiJBY3JvYmF0aWNzIjtzOjk6InNraWxsX21vZCI7czozOiJkZXgiO31pOjE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aToyO3M6MTA6InNraWxsX25hbWUiO3M6NToiQmx1ZmYiO3M6OToic2tpbGxfbW9kIjtzOjM6ImNoYSI7fWk6MjtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjM7czoxMDoic2tpbGxfbmFtZSI7czo1OiJDbGltYiI7czo5OiJza2lsbF9tb2QiO3M6Mzoic3RyIjt9aTozO086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6NDtzOjEwOiJza2lsbF9uYW1lIjtzOjk6IkNvbXB1dGVycyI7czo5OiJza2lsbF9tb2QiO3M6MzoiaW50Ijt9aTo0O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6NTtzOjEwOiJza2lsbF9uYW1lIjtzOjEzOiJDb25jZW50cmF0aW9uIjtzOjk6InNraWxsX21vZCI7czozOiJ3aXMiO31pOjU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aTo2O3M6MTA6InNraWxsX25hbWUiO3M6NToiQ3JhZnQiO3M6OToic2tpbGxfbW9kIjtzOjM6ImludCI7fWk6NjtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjc7czoxMDoic2tpbGxfbmFtZSI7czo5OiJEaXBsb21hY3kiO3M6OToic2tpbGxfbW9kIjtzOjM6ImNoYSI7fWk6NztPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjg7czoxMDoic2tpbGxfbmFtZSI7czoxNDoiRGlzYWJsZSBEZXZpY2UiO3M6OToic2tpbGxfbW9kIjtzOjM6ImludCI7fWk6ODtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjk7czoxMDoic2tpbGxfbmFtZSI7czo4OiJEaXNndWlzZSI7czo5OiJza2lsbF9tb2QiO3M6MzoiY2hhIjt9aTo5O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MTA7czoxMDoic2tpbGxfbmFtZSI7czo1OiJEcml2ZSI7czo5OiJza2lsbF9tb2QiO3M6MzoiZGV4Ijt9aToxMDtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjExO3M6MTA6InNraWxsX25hbWUiO3M6MTM6IkVzY2FwZSBBcnRpc3QiO3M6OToic2tpbGxfbW9kIjtzOjM6ImRleCI7fWk6MTE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aToxMjtzOjEwOiJza2lsbF9uYW1lIjtzOjE4OiJHYXRoZXIgSW5mb3JtYXRpb24iO3M6OToic2tpbGxfbW9kIjtzOjM6ImNoYSI7fWk6MTI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aToxMztzOjEwOiJza2lsbF9uYW1lIjtzOjEzOiJIYW5kbGUgQW5pbWFsIjtzOjk6InNraWxsX21vZCI7czozOiJjaGEiO31pOjEzO086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MTQ7czoxMDoic2tpbGxfbmFtZSI7czoxMDoiSW50aW1pZGF0ZSI7czo5OiJza2lsbF9tb2QiO3M6MzoiY2hhIjt9aToxNDtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjE1O3M6MTA6InNraWxsX25hbWUiO3M6MTE6IkludmVzdGlnYXRlIjtzOjk6InNraWxsX21vZCI7czozOiJpbnQiO31pOjE1O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MTY7czoxMDoic2tpbGxfbmFtZSI7czoyMjoiS25vd2xlZGdlOiBBcmNhbmUgTG9yZSI7czo5OiJza2lsbF9tb2QiO3M6MzoiaW50Ijt9aToxNjtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjE3O3M6MTA6InNraWxsX25hbWUiO3M6MTQ6Iktub3dsZWRnZTogQXJ0IjtzOjk6InNraWxsX21vZCI7czozOiJpbnQiO31pOjE3O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MTg7czoxMDoic2tpbGxfbmFtZSI7czozMDoiS25vd2xlZGdlOiBCZWhhdmlvcmFsIFNjaWVuY2VzIjtzOjk6InNraWxsX21vZCI7czozOiJpbnQiO31pOjE4O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MTk7czoxMDoic2tpbGxfbmFtZSI7czoxNzoiS25vd2xlZGdlOiBDaXZpY3MiO3M6OToic2tpbGxfbW9kIjtzOjM6ImludCI7fWk6MTk7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aToyMDtzOjEwOiJza2lsbF9uYW1lIjtzOjI1OiJLbm93bGVkZ2U6IEN1cnJlbnQgRXZlbnRzIjtzOjk6InNraWxsX21vZCI7czozOiJpbnQiO31pOjIwO086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MjE7czoxMDoic2tpbGxfbmFtZSI7czoyNToiS25vd2xlZGdlOiBFYXJ0aCBTY2llbmNlcyI7czo5OiJza2lsbF9tb2QiO3M6MzoiaW50Ijt9aToyMTtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjIyO3M6MTA6InNraWxsX25hbWUiO3M6MTg6Iktub3dsZWRnZTogSGlzdG9yeSI7czo5OiJza2lsbF9tb2QiO3M6MzoiaW50Ijt9aToyMjtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjIzO3M6MTA6InNraWxsX25hbWUiO3M6MjQ6Iktub3dsZWRnZTogTGlmZSBTY2llbmNlcyI7czo5OiJza2lsbF9tb2QiO3M6MzoiaW50Ijt9aToyMztPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjI0O3M6MTA6InNraWxsX25hbWUiO3M6Mjg6Iktub3dsZWRnZTogUGh5c2ljYWwgU2NpZW5jZXMiO3M6OToic2tpbGxfbW9kIjtzOjM6ImludCI7fWk6MjQ7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aToyNTtzOjEwOiJza2lsbF9uYW1lIjtzOjIyOiJLbm93bGVkZ2U6IFBvcCBDdWx0dXJlIjtzOjk6InNraWxsX21vZCI7czozOiJpbnQiO31pOjI1O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MjY7czoxMDoic2tpbGxfbmFtZSI7czoyMToiS25vd2xlZGdlOiBTdHJlZXR3aXNlIjtzOjk6InNraWxsX21vZCI7czozOiJpbnQiO31pOjI2O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6Mjc7czoxMDoic2tpbGxfbmFtZSI7czoxODoiS25vd2xlZGdlOiBUYWN0aWNzIjtzOjk6InNraWxsX21vZCI7czozOiJpbnQiO31pOjI3O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6Mjg7czoxMDoic2tpbGxfbmFtZSI7czoyMToiS25vd2xlZGdlOiBUZWNobm9sb2d5IjtzOjk6InNraWxsX21vZCI7czozOiJpbnQiO31pOjI4O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6Mjk7czoxMDoic2tpbGxfbmFtZSI7czozMDoiS25vd2xlZGdlOiBUaGVvbG9neS9QaGlsb3NvcGh5IjtzOjk6InNraWxsX21vZCI7czozOiJpbnQiO31pOjI5O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MzA7czoxMDoic2tpbGxfbmFtZSI7czo4OiJMYW5ndWFnZSI7czo5OiJza2lsbF9tb2QiO3M6MToiLSI7fWk6MzA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aTozMTtzOjEwOiJza2lsbF9uYW1lIjtzOjg6Ik1lZGljaW5lIjtzOjk6InNraWxsX21vZCI7czozOiJ3aXMiO31pOjMxO086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MzI7czoxMDoic2tpbGxfbmFtZSI7czo2OiJOb3RpY2UiO3M6OToic2tpbGxfbW9kIjtzOjM6IndpcyI7fWk6MzI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aTozMztzOjEwOiJza2lsbF9uYW1lIjtzOjc6IlBlcmZvcm0iO3M6OToic2tpbGxfbW9kIjtzOjM6ImNoYSI7fWk6MzM7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJza2lsbF9pZCI7aTozNDtzOjEwOiJza2lsbF9uYW1lIjtzOjU6IlBpbG90IjtzOjk6InNraWxsX21vZCI7czozOiJkZXgiO31pOjM0O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6MzU7czoxMDoic2tpbGxfbmFtZSI7czoxMDoiUHJvZmVzc2lvbiI7czo5OiJza2lsbF9tb2QiO3M6Mzoid2lzIjt9aTozNTtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjM2O3M6MTA6InNraWxsX25hbWUiO3M6NDoiUmlkZSI7czo5OiJza2lsbF9tb2QiO3M6MzoiZGV4Ijt9aTozNjtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjM3O3M6MTA6InNraWxsX25hbWUiO3M6NjoiU2VhcmNoIjtzOjk6InNraWxsX21vZCI7czozOiJpbnQiO31pOjM3O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6Mzg7czoxMDoic2tpbGxfbmFtZSI7czoxMjoiU2Vuc2UgTW90aXZlIjtzOjk6InNraWxsX21vZCI7czozOiJ3aXMiO31pOjM4O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6Mzk7czoxMDoic2tpbGxfbmFtZSI7czoxNToiU2xlaWdodCBPZiBIYW5kIjtzOjk6InNraWxsX21vZCI7czozOiJkZXgiO31pOjM5O086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6NDA7czoxMDoic2tpbGxfbmFtZSI7czo3OiJTdGVhbHRoIjtzOjk6InNraWxsX21vZCI7czozOiJkZXgiO31pOjQwO086ODoic3RkQ2xhc3MiOjM6e3M6ODoic2tpbGxfaWQiO2k6NDE7czoxMDoic2tpbGxfbmFtZSI7czo4OiJTdXJ2aXZhbCI7czo5OiJza2lsbF9tb2QiO3M6Mzoid2lzIjt9aTo0MTtPOjg6InN0ZENsYXNzIjozOntzOjg6InNraWxsX2lkIjtpOjQyO3M6MTA6InNraWxsX25hbWUiO3M6NDoiU3dpbSI7czo5OiJza2lsbF9tb2QiO3M6Mzoic3RyIjt9fXM6ODoib2xkSW5wdXQiO2E6Mzp7czoxMDoiZW5lbXlOYW1lcyI7YTo1OntzOjU6IkJsYWRlIjtzOjU6IlBpbmNoIjtzOjQ6Ikljb24iO3M6MTA6IlppcHBlcmhlYWQiO3M6ODoiU2VyZW5pdHkiO3M6NDoiR2xvYiI7czoxMjoiRGFyayBBdmVuZ2VyIjtzOjU6IlNob3ZlIjtzOjk6Ikp1ZGdlbWVudCI7czo1OiJDbG9tcCI7fXM6MTM6ImRlZmVuc2VTY29yZXMiO2E6NTp7czo1OiJCbGFkZSI7czoyOiIxNSI7czo0OiJJY29uIjtzOjI6IjE0IjtzOjg6IlNlcmVuaXR5IjtzOjI6IjE3IjtzOjEyOiJEYXJrIEF2ZW5nZXIiO3M6MjoiMTYiO3M6OToiSnVkZ2VtZW50IjtzOjI6IjE3Ijt9czoxNToidG91Z2huZXNzU2NvcmVzIjthOjU6e3M6NToiQmxhZGUiO3M6MToiMyI7czo0OiJJY29uIjtzOjE6IjMiO3M6ODoiU2VyZW5pdHkiO3M6MToiNSI7czoxMjoiRGFyayBBdmVuZ2VyIjtzOjE6IjQiO3M6OToiSnVkZ2VtZW50IjtzOjE6IjIiO319czo1OiJzYXZlcyI7YTo1OntpOjA7Tzo4OiJzdGRDbGFzcyI6NTp7czo4OiJjaGFyTmFtZSI7czo1OiJCbGFkZSI7czo1OiJ0b3VnaCI7aTo1O3M6NDoid2lsbCI7aTo0O3M6NDoiZm9ydCI7aTozO3M6MzoicmVmIjtpOjY7fWk6MTtPOjg6InN0ZENsYXNzIjo1OntzOjg6ImNoYXJOYW1lIjtzOjEyOiJEYXJrIEF2ZW5nZXIiO3M6NToidG91Z2giO2k6NztzOjQ6IndpbGwiO2k6MTI7czo0OiJmb3J0IjtpOjY7czozOiJyZWYiO2k6ODt9aToyO086ODoic3RkQ2xhc3MiOjU6e3M6ODoiY2hhck5hbWUiO3M6NDoiSWNvbiI7czo1OiJ0b3VnaCI7aTo0O3M6NDoid2lsbCI7aToyO3M6NDoiZm9ydCI7aTo1O3M6MzoicmVmIjtpOjY7fWk6MztPOjg6InN0ZENsYXNzIjo1OntzOjg6ImNoYXJOYW1lIjtzOjk6Ikp1ZGdlbWVudCI7czo1OiJ0b3VnaCI7aToyO3M6NDoid2lsbCI7aTo1O3M6NDoiZm9ydCI7aToyO3M6MzoicmVmIjtpOjU7fWk6NDtPOjg6InN0ZENsYXNzIjo1OntzOjg6ImNoYXJOYW1lIjtzOjg6IlNlcmVuaXR5IjtzOjU6InRvdWdoIjtpOjA7czo0OiJ3aWxsIjtpOjY7czo0OiJmb3J0IjtpOjQ7czozOiJyZWYiO2k6Njt9fXM6MTE6InNraWxsU2VsZWN0IjthOjU0OntpOjA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo1OiJCbGFkZSI7czoxMDoic2tpbGxfbmFtZSI7czo1OiJCbHVmZiI7czoxMToic2tpbGxfdG90YWwiO2k6ODt9aToxO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NToiQmxhZGUiO3M6MTA6InNraWxsX25hbWUiO3M6NToiRHJpdmUiO3M6MTE6InNraWxsX3RvdGFsIjtpOjM7fWk6MjtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjU6IkJsYWRlIjtzOjEwOiJza2lsbF9uYW1lIjtzOjEwOiJJbnRpbWlkYXRlIjtzOjExOiJza2lsbF90b3RhbCI7aTo4O31pOjM7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo1OiJCbGFkZSI7czoxMDoic2tpbGxfbmFtZSI7czoxMToiSW52ZXN0aWdhdGUiO3M6MTE6InNraWxsX3RvdGFsIjtpOjc7fWk6NDtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjU6IkJsYWRlIjtzOjEwOiJza2lsbF9uYW1lIjtzOjMwOiJLbm93bGVkZ2U6IEJlaGF2aW9yYWwgU2NpZW5jZXMiO3M6MTE6InNraWxsX3RvdGFsIjtpOjc7fWk6NTtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjU6IkJsYWRlIjtzOjEwOiJza2lsbF9uYW1lIjtzOjIxOiJLbm93bGVkZ2U6IFN0cmVldHdpc2UiO3M6MTE6InNraWxsX3RvdGFsIjtpOjg7fWk6NjtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjEyOiJEYXJrIEF2ZW5nZXIiO3M6MTA6InNraWxsX25hbWUiO3M6MTg6IkdhdGhlciBJbmZvcm1hdGlvbiI7czoxMToic2tpbGxfdG90YWwiO2k6MTE7fWk6NztPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjEyOiJEYXJrIEF2ZW5nZXIiO3M6MTA6InNraWxsX25hbWUiO3M6MTA6IkludGltaWRhdGUiO3M6MTE6InNraWxsX3RvdGFsIjtpOjE3O31pOjg7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czoxMjoiRGFyayBBdmVuZ2VyIjtzOjEwOiJza2lsbF9uYW1lIjtzOjExOiJJbnZlc3RpZ2F0ZSI7czoxMToic2tpbGxfdG90YWwiO2k6ODt9aTo5O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6MTI6IkRhcmsgQXZlbmdlciI7czoxMDoic2tpbGxfbmFtZSI7czoyMToiS25vd2xlZGdlOiBTdHJlZXR3aXNlIjtzOjExOiJza2lsbF90b3RhbCI7aTo4O31pOjEwO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6MTI6IkRhcmsgQXZlbmdlciI7czoxMDoic2tpbGxfbmFtZSI7czo2OiJOb3RpY2UiO3M6MTE6InNraWxsX3RvdGFsIjtpOjEyO31pOjExO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6MTI6IkRhcmsgQXZlbmdlciI7czoxMDoic2tpbGxfbmFtZSI7czo2OiJTZWFyY2giO3M6MTE6InNraWxsX3RvdGFsIjtpOjg7fWk6MTI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czoxMjoiRGFyayBBdmVuZ2VyIjtzOjEwOiJza2lsbF9uYW1lIjtzOjEyOiJTZW5zZSBNb3RpdmUiO3M6MTE6InNraWxsX3RvdGFsIjtpOjE0O31pOjEzO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6MTI6IkRhcmsgQXZlbmdlciI7czoxMDoic2tpbGxfbmFtZSI7czo3OiJTdGVhbHRoIjtzOjExOiJza2lsbF90b3RhbCI7aToxMDt9aToxNDtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjQ6Ikljb24iO3M6MTA6InNraWxsX25hbWUiO3M6MTA6IkFjcm9iYXRpY3MiO3M6MTE6InNraWxsX3RvdGFsIjtpOjU7fWk6MTU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo0OiJJY29uIjtzOjEwOiJza2lsbF9uYW1lIjtzOjU6IkJsdWZmIjtzOjExOiJza2lsbF90b3RhbCI7aTo3O31pOjE2O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NDoiSWNvbiI7czoxMDoic2tpbGxfbmFtZSI7czoyMjoiS25vd2xlZGdlOiBQb3AgQ3VsdHVyZSI7czoxMToic2tpbGxfdG90YWwiO2k6Mjt9aToxNztPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjQ6Ikljb24iO3M6MTA6InNraWxsX25hbWUiO3M6MTg6Iktub3dsZWRnZTogVGFjdGljcyI7czoxMToic2tpbGxfdG90YWwiO2k6Mjt9aToxODtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjQ6Ikljb24iO3M6MTA6InNraWxsX25hbWUiO3M6NjoiTm90aWNlIjtzOjExOiJza2lsbF90b3RhbCI7aToyO31pOjE5O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6NDoiSWNvbiI7czoxMDoic2tpbGxfbmFtZSI7czo2OiJTZWFyY2giO3M6MTE6InNraWxsX3RvdGFsIjtpOjM7fWk6MjA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo0OiJJY29uIjtzOjEwOiJza2lsbF9uYW1lIjtzOjEyOiJTZW5zZSBNb3RpdmUiO3M6MTE6InNraWxsX3RvdGFsIjtpOjc7fWk6MjE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo0OiJJY29uIjtzOjEwOiJza2lsbF9uYW1lIjtzOjc6IlN0ZWFsdGgiO3M6MTE6InNraWxsX3RvdGFsIjtpOjU7fWk6MjI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo5OiJKdWRnZW1lbnQiO3M6MTA6InNraWxsX25hbWUiO3M6MTA6IkFjcm9iYXRpY3MiO3M6MTE6InNraWxsX3RvdGFsIjtpOjk7fWk6MjM7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo5OiJKdWRnZW1lbnQiO3M6MTA6InNraWxsX25hbWUiO3M6NToiQmx1ZmYiO3M6MTE6InNraWxsX3RvdGFsIjtpOjg7fWk6MjQ7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo5OiJKdWRnZW1lbnQiO3M6MTA6InNraWxsX25hbWUiO3M6OToiQ29tcHV0ZXJzIjtzOjExOiJza2lsbF90b3RhbCI7aTo2O31pOjI1O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6OToiSnVkZ2VtZW50IjtzOjEwOiJza2lsbF9uYW1lIjtzOjEzOiJDb25jZW50cmF0aW9uIjtzOjExOiJza2lsbF90b3RhbCI7aTo5O31pOjI2O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6OToiSnVkZ2VtZW50IjtzOjEwOiJza2lsbF9uYW1lIjtzOjE0OiJEaXNhYmxlIERldmljZSI7czoxMToic2tpbGxfdG90YWwiO2k6Njt9aToyNztPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjk6Ikp1ZGdlbWVudCI7czoxMDoic2tpbGxfbmFtZSI7czoxMzoiRXNjYXBlIEFydGlzdCI7czoxMToic2tpbGxfdG90YWwiO2k6OTt9aToyODtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjk6Ikp1ZGdlbWVudCI7czoxMDoic2tpbGxfbmFtZSI7czoxODoiR2F0aGVyIEluZm9ybWF0aW9uIjtzOjExOiJza2lsbF90b3RhbCI7aTo4O31pOjI5O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6OToiSnVkZ2VtZW50IjtzOjEwOiJza2lsbF9uYW1lIjtzOjEwOiJJbnRpbWlkYXRlIjtzOjExOiJza2lsbF90b3RhbCI7aTo4O31pOjMwO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6OToiSnVkZ2VtZW50IjtzOjEwOiJza2lsbF9uYW1lIjtzOjExOiJJbnZlc3RpZ2F0ZSI7czoxMToic2tpbGxfdG90YWwiO2k6MTA7fWk6MzE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo5OiJKdWRnZW1lbnQiO3M6MTA6InNraWxsX25hbWUiO3M6MjI6Iktub3dsZWRnZTogQXJjYW5lIExvcmUiO3M6MTE6InNraWxsX3RvdGFsIjtpOjY7fWk6MzI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo5OiJKdWRnZW1lbnQiO3M6MTA6InNraWxsX25hbWUiO3M6MjU6Iktub3dsZWRnZTogQ3VycmVudCBFdmVudHMiO3M6MTE6InNraWxsX3RvdGFsIjtpOjEwO31pOjMzO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6OToiSnVkZ2VtZW50IjtzOjEwOiJza2lsbF9uYW1lIjtzOjIyOiJLbm93bGVkZ2U6IFBvcCBDdWx0dXJlIjtzOjExOiJza2lsbF90b3RhbCI7aTo2O31pOjM0O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6OToiSnVkZ2VtZW50IjtzOjEwOiJza2lsbF9uYW1lIjtzOjIxOiJLbm93bGVkZ2U6IFRlY2hub2xvZ3kiO3M6MTE6InNraWxsX3RvdGFsIjtpOjY7fWk6MzU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo5OiJKdWRnZW1lbnQiO3M6MTA6InNraWxsX25hbWUiO3M6ODoiTWVkaWNpbmUiO3M6MTE6InNraWxsX3RvdGFsIjtpOjU7fWk6MzY7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo5OiJKdWRnZW1lbnQiO3M6MTA6InNraWxsX25hbWUiO3M6NjoiTm90aWNlIjtzOjExOiJza2lsbF90b3RhbCI7aTo1O31pOjM3O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6OToiSnVkZ2VtZW50IjtzOjEwOiJza2lsbF9uYW1lIjtzOjc6IlBlcmZvcm0iO3M6MTE6InNraWxsX3RvdGFsIjtpOjEyO31pOjM4O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6OToiSnVkZ2VtZW50IjtzOjEwOiJza2lsbF9uYW1lIjtzOjEwOiJQcm9mZXNzaW9uIjtzOjExOiJza2lsbF90b3RhbCI7aTo5O31pOjM5O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6OToiSnVkZ2VtZW50IjtzOjEwOiJza2lsbF9uYW1lIjtzOjQ6IlJpZGUiO3M6MTE6InNraWxsX3RvdGFsIjtpOjE3O31pOjQwO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6OToiSnVkZ2VtZW50IjtzOjEwOiJza2lsbF9uYW1lIjtzOjY6IlNlYXJjaCI7czoxMToic2tpbGxfdG90YWwiO2k6Njt9aTo0MTtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjk6Ikp1ZGdlbWVudCI7czoxMDoic2tpbGxfbmFtZSI7czoxNToiU2xlaWdodCBPZiBIYW5kIjtzOjExOiJza2lsbF90b3RhbCI7aTo5O31pOjQyO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6ODoiU2VyZW5pdHkiO3M6MTA6InNraWxsX25hbWUiO3M6NToiQmx1ZmYiO3M6MTE6InNraWxsX3RvdGFsIjtpOjg7fWk6NDM7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo4OiJTZXJlbml0eSI7czoxMDoic2tpbGxfbmFtZSI7czo5OiJEaXBsb21hY3kiO3M6MTE6InNraWxsX3RvdGFsIjtpOjg7fWk6NDQ7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo4OiJTZXJlbml0eSI7czoxMDoic2tpbGxfbmFtZSI7czoxNDoiRGlzYWJsZSBEZXZpY2UiO3M6MTE6InNraWxsX3RvdGFsIjtpOjc7fWk6NDU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo4OiJTZXJlbml0eSI7czoxMDoic2tpbGxfbmFtZSI7czoxMzoiRXNjYXBlIEFydGlzdCI7czoxMToic2tpbGxfdG90YWwiO2k6Nzt9aTo0NjtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjg6IlNlcmVuaXR5IjtzOjEwOiJza2lsbF9uYW1lIjtzOjE4OiJHYXRoZXIgSW5mb3JtYXRpb24iO3M6MTE6InNraWxsX3RvdGFsIjtpOjg7fWk6NDc7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo4OiJTZXJlbml0eSI7czoxMDoic2tpbGxfbmFtZSI7czoyMjoiS25vd2xlZGdlOiBBcmNhbmUgTG9yZSI7czoxMToic2tpbGxfdG90YWwiO2k6ODt9aTo0ODtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjg6IlNlcmVuaXR5IjtzOjEwOiJza2lsbF9uYW1lIjtzOjMwOiJLbm93bGVkZ2U6IEJlaGF2aW9yYWwgU2NpZW5jZXMiO3M6MTE6InNraWxsX3RvdGFsIjtpOjEyO31pOjQ5O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6ODoiU2VyZW5pdHkiO3M6MTA6InNraWxsX25hbWUiO3M6MjI6Iktub3dsZWRnZTogUG9wIEN1bHR1cmUiO3M6MTE6InNraWxsX3RvdGFsIjtpOjY7fWk6NTA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo4OiJTZXJlbml0eSI7czoxMDoic2tpbGxfbmFtZSI7czoyMToiS25vd2xlZGdlOiBTdHJlZXR3aXNlIjtzOjExOiJza2lsbF90b3RhbCI7aTo4O31pOjUxO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6ODoiU2VyZW5pdHkiO3M6MTA6InNraWxsX25hbWUiO3M6ODoiTWVkaWNpbmUiO3M6MTE6InNraWxsX3RvdGFsIjtpOjg7fWk6NTI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo4OiJTZXJlbml0eSI7czoxMDoic2tpbGxfbmFtZSI7czoxMjoiU2Vuc2UgTW90aXZlIjtzOjExOiJza2lsbF90b3RhbCI7aTo4O31pOjUzO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6ODoiU2VyZW5pdHkiO3M6MTA6InNraWxsX25hbWUiO3M6NzoiU3RlYWx0aCI7czoxMToic2tpbGxfdG90YWwiO2k6Nzt9fXM6NToibmFtZXMiO2E6NTp7aTowO3M6NToiQmxhZGUiO2k6MTtzOjQ6Ikljb24iO2k6MjtzOjg6IlNlcmVuaXR5IjtpOjM7czoxMjoiRGFyayBBdmVuZ2VyIjtpOjQ7czo5OiJKdWRnZW1lbnQiO31zOjEyOiJwb3dlcnNTZWxlY3QiO2E6MTg6e2k6MDtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjU6IkJsYWRlIjtzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJBZHJlbmFsIFN1cmdlIjtzOjExOiJwb3dlcl9yYW5rcyI7aTo0O31pOjE7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo1OiJCbGFkZSI7czoxMDoicG93ZXJfbmFtZSI7czo5OiJBZ2UgU2hpZnQiO3M6MTE6InBvd2VyX3JhbmtzIjtpOjg7fWk6MjtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjU6IkJsYWRlIjtzOjEwOiJwb3dlcl9uYW1lIjtzOjExOiJEZWF0aCBUb3VjaCI7czoxMToicG93ZXJfcmFua3MiO2k6Mjt9aTozO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6MTI6IkRhcmsgQXZlbmdlciI7czoxMDoicG93ZXJfbmFtZSI7czoxODoiSW52aXNpYmlsaXR5OiBGdWxsIjtzOjExOiJwb3dlcl9yYW5rcyI7aTo4O31pOjQ7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czoxMjoiRGFyayBBdmVuZ2VyIjtzOjEwOiJwb3dlcl9uYW1lIjtzOjI3OiJTaWxlbmNlOiBJbnZpc2libGUgdG8gU29uYXIiO3M6MTE6InBvd2VyX3JhbmtzIjtpOjI7fWk6NTtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjEyOiJEYXJrIEF2ZW5nZXIiO3M6MTA6InBvd2VyX25hbWUiO3M6MTI6IlRlbGVsb2NhdGlvbiI7czoxMToicG93ZXJfcmFua3MiO2k6MTA7fWk6NjtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjQ6Ikljb24iO3M6MTA6InBvd2VyX25hbWUiO3M6NToiQmxhc3QiO3M6MTE6InBvd2VyX3JhbmtzIjtpOjc7fWk6NztPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjQ6Ikljb24iO3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IkxpZ2h0IENvbnRyb2wiO3M6MTE6InBvd2VyX3JhbmtzIjtpOjc7fWk6ODtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjk6Ikp1ZGdlbWVudCI7czoxMDoicG93ZXJfbmFtZSI7czo1OiJCbGFzdCI7czoxMToicG93ZXJfcmFua3MiO2k6MTt9aTo5O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6OToiSnVkZ2VtZW50IjtzOjEwOiJwb3dlcl9uYW1lIjtzOjEzOiJDcmVhdGUgT2JqZWN0IjtzOjExOiJwb3dlcl9yYW5rcyI7aToxO31pOjEwO086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6OToiSnVkZ2VtZW50IjtzOjEwOiJwb3dlcl9uYW1lIjtzOjExOiJEdXBsaWNhdGlvbiI7czoxMToicG93ZXJfcmFua3MiO2k6MTt9aToxMTtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjk6Ikp1ZGdlbWVudCI7czoxMDoicG93ZXJfbmFtZSI7czo4OiJHcmFmdGluZyI7czoxMToicG93ZXJfcmFua3MiO2k6MTt9aToxMjtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjk6Ikp1ZGdlbWVudCI7czoxMDoicG93ZXJfbmFtZSI7czoxMzoiSW5zdWJzdGFudGlhbCI7czoxMToicG93ZXJfcmFua3MiO2k6MTt9aToxMztPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjk6Ikp1ZGdlbWVudCI7czoxMDoicG93ZXJfbmFtZSI7czo4OiJNdXRhdGlvbiI7czoxMToicG93ZXJfcmFua3MiO2k6MTt9aToxNDtPOjg6InN0ZENsYXNzIjozOntzOjg6ImNoYXJOYW1lIjtzOjk6Ikp1ZGdlbWVudCI7czoxMDoicG93ZXJfbmFtZSI7czo5OiJUaW1lIFN0b3AiO3M6MTE6InBvd2VyX3JhbmtzIjtpOjE7fWk6MTU7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo4OiJTZXJlbml0eSI7czoxMDoicG93ZXJfbmFtZSI7czoxMToiQXN0cmFsIEZvcm0iO3M6MTE6InBvd2VyX3JhbmtzIjtpOjI7fWk6MTY7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJjaGFyTmFtZSI7czo4OiJTZXJlbml0eSI7czoxMDoicG93ZXJfbmFtZSI7czoxNToiQmxlbmRpbmc6IFRvdGFsIjtzOjExOiJwb3dlcl9yYW5rcyI7aTo0O31pOjE3O086ODoic3RkQ2xhc3MiOjM6e3M6ODoiY2hhck5hbWUiO3M6ODoiU2VyZW5pdHkiO3M6MTA6InBvd2VyX25hbWUiO3M6NToiU2xlZXAiO3M6MTE6InBvd2VyX3JhbmtzIjtpOjY7fX1zOjM6ImdlbiI7czo0OiJvcGVuIjtzOjQ6InNpemUiO3M6NDoiZnVsbCI7czo3OiJkZXRhaWxzIjthOjY6e3M6NDoiYWJpbCI7YTo2OntzOjM6InN0ciI7aToxMztzOjM6ImRleCI7aToxMTtzOjM6ImNvbiI7aToxMjtzOjM6ImludCI7aToxMTtzOjM6IndpcyI7aToxNDtzOjM6ImNoYSI7aToxMzt9czo5OiJjb21iL3NhdmUiO2E6NTp7czoxMDoiZ2VuX2F0dGFjayI7aToyO3M6NzoiZGVmZW5zZSI7aToxNDtzOjQ6IndpbGwiO2k6MztzOjQ6ImZvcnQiO2k6NTtzOjM6InJlZiI7aToyO31zOjY6InNraWxscyI7YToxNDp7czoxMDoiQWNyb2JhdGljcyI7aTo0O3M6NToiQ2xpbWIiO2k6NDtzOjE0OiJEaXNhYmxlIERldmljZSI7aTo0O3M6MTM6IkhhbmRsZSBBbmltYWwiO2k6NDtzOjExOiJJbnZlc3RpZ2F0ZSI7aTo0O3M6MzA6Iktub3dsZWRnZTogQmVoYXZpb3JhbCBTY2llbmNlcyI7aTo0O3M6MTg6Iktub3dsZWRnZTogSGlzdG9yeSI7aTo0O3M6MjQ6Iktub3dsZWRnZTogTGlmZSBTY2llbmNlcyI7aTo4O3M6MjI6Iktub3dsZWRnZTogUG9wIEN1bHR1cmUiO2k6NDtzOjE4OiJLbm93bGVkZ2U6IFRhY3RpY3MiO2k6NDtzOjY6IlNlYXJjaCI7aTo0O3M6MTI6IlNlbnNlIE1vdGl2ZSI7aTo0O3M6ODoiU3Vydml2YWwiO2k6NDtzOjQ6IlN3aW0iO2k6NDt9czo1OiJmZWF0cyI7YToxNzp7czoxNToiQWNjdXJhdGUgQXR0YWNrIjtpOjE7czoxNjoiSW1wcm92ZWQgR3JhcHBsZSI7aToxO3M6MTk6IkltcHJvdmVkIEluaXRpYXRpdmUiO2k6MTtzOjE2OiJJbXByb3ZlZCBPdmVycnVuIjtpOjE7czoxMDoiUXVpY2sgRHJhdyI7aToxO3M6NDoiUmFnZSI7aToxO3M6MTY6IlRocm93aW5nIE1hc3RlcnkiO2k6MTtzOjE1OiJCZWdpbm5lcidzIEx1Y2siO2k6MTtzOjc6IkRpZWhhcmQiO2k6MTtzOjExOiJNYXN0ZXIgUGxhbiI7aToxO3M6NzoiTWluaW9ucyI7aToxO3M6NjoiVHJhbmNlIjtpOjE7czoxNDoiQW5pbWFsIEVtcGF0aHkiO2k6MTtzOjg6IkNvbnRhY3RzIjtpOjE7czo5OiJGYXNjaW5hdGUiO2k6MTtzOjEzOiJTa2lsbCBNYXN0ZXJ5IjtpOjE7czo3OiJTdGFydGxlIjtpOjE7fXM6NjoicG93ZXJzIjthOjc6e3M6MzoiQ2hpIjtpOjI7czoxMjoiQ2xhaXJ2b3lhbmNlIjtpOjE7czoyMDoiSW52aXNpYmxpdHk6IFBhcnRpYWwiO2k6MTtzOjEyOiJTaGFwZSBNYXR0ZXIiO2k6MTtzOjIyOiJTaWxlbmNlOiBIdW1hbiBIZWFyaW5nIjtpOjE7czo4OiJUcmFuc21pdCI7aToxO3M6OToiU3VmZm9jYXRlIjtpOjE7fXM6NjoiYmFzaWNzIjthOjc6e3M6MTE6InBvd2VyX2xldmVsIjtzOjE6IjUiO3M6MTI6InBvd2VyX3BvaW50cyI7aTo4NDtzOjY6ImhlaWdodCI7czo2OiI0IGZlZXQiO3M6Njoid2VpZ2h0IjtzOjc6IjI2MiBsYnMiO3M6MzoiYWdlIjtpOjIwO3M6NDoiaW5pdCI7ZDo0O3M6NToidG91Z2giO2Q6MTt9fXM6ODoiY2hhclNob3ciO2E6MTA6e3M6MjoiaWQiO3M6MjoiNjYiO3M6ODoiY29kZU5hbWUiO3M6OToiSnVkZ2VtZW50IjtzOjk6ImFiaWxpdGllcyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6MTQ6e3M6MjoiaWQiO2k6NTE7czo3OiJjaGFyX2lkIjtpOjY2O3M6ODoic3RyX3JhbmsiO2k6MTc7czo3OiJzdHJfbW9kIjtpOjM7czo4OiJkZXhfcmFuayI7aToyMTtzOjc6ImRleF9tb2QiO2k6NTtzOjg6ImNvbl9yYW5rIjtpOjEzO3M6NzoiY29uX21vZCI7aToxO3M6ODoiaW50X3JhbmsiO2k6MTQ7czo3OiJpbnRfbW9kIjtpOjE7czo4OiJ3aXNfcmFuayI7aToxMjtzOjc6Indpc19tb2QiO2k6MTtzOjg6ImNoYV9yYW5rIjtpOjE4O3M6NzoiY2hhX21vZCI7aTo0O319czo3OiJhdHRhY2tzIjthOjA6e31zOjU6ImJhc2ljIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjoxMTp7czo2OiJjaGFySWQiO2k6NjY7czo5OiJyZWFsX25hbWUiO3M6MTE6IkpvZXkgQmxhbmNvIjtzOjExOiJwb3dlcl9sZXZlbCI7aToxMDtzOjEyOiJwb3dlcl9wb2ludHMiO2k6MTUxO3M6MTE6ImFmZmlsaWF0aW9uIjtzOjQ6Ik5vbmUiO3M6MjoiZmYiO2k6MDtzOjEwOiJoZXJvX3RvdGFsIjtpOjA7czoxMjoiaGVyb19jdXJyZW50IjtpOjA7czo2OiJoZWlnaHQiO3M6NjoiNiBmZWV0IjtzOjY6IndlaWdodCI7czo3OiIyMDYgbGJzIjtzOjM6ImFnZSI7aTozMTt9fXM6NjoiY29tYmF0IjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjoxMjp7czo2OiJjaGFySWQiO2k6NjY7czoxMDoiaW5pdGlhdGl2ZSI7aTo1O3M6MTA6Imdlbl9hdHRhY2siO2k6NjtzOjk6Imtub2NrYmFjayI7aTozO3M6NToidG91Z2giO2k6MjtzOjc6ImRlZmVuc2UiO2k6MTE7czo3OiJncmFwcGxlIjtpOjM7czo1OiJtZWxlZSI7aTo2O3M6NjoicmFuZ2VkIjtpOjY7czo0OiJ3aWxsIjtpOjU7czo0OiJmb3J0IjtpOjI7czozOiJyZWYiO2k6NTt9fXM6OToiZHJhd2JhY2tzIjthOjA6e31zOjU6ImZlYXRzIjthOjI3OntpOjA7Tzo4OiJzdGRDbGFzcyI6Mjp7czo5OiJmZWF0X25hbWUiO3M6MTQ6IkFsbC1PdXQgQXR0YWNrIjtzOjEwOiJmZWF0X3JhbmtzIjtpOjE7fWk6MTtPOjg6InN0ZENsYXNzIjoyOntzOjk6ImZlYXRfbmFtZSI7czoxNjoiRGVmZW5zaXZlIEF0dGFjayI7czoxMDoiZmVhdF9yYW5rcyI7aToxO31pOjI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo5OiJmZWF0X25hbWUiO3M6MTQ6IkRlZmVuc2l2ZSBSb2xsIjtzOjEwOiJmZWF0X3JhbmtzIjtpOjI7fWk6MztPOjg6InN0ZENsYXNzIjoyOntzOjk6ImZlYXRfbmFtZSI7czoxMToiRG9kZ2UgRm9jdXMiO3M6MTA6ImZlYXRfcmFua3MiO2k6MTt9aTo0O086ODoic3RkQ2xhc3MiOjI6e3M6OToiZmVhdF9uYW1lIjtzOjE5OiJGYXZvcmVkIEVudmlyb25tZW50IjtzOjEwOiJmZWF0X3JhbmtzIjtpOjE7fWk6NTtPOjg6InN0ZENsYXNzIjoyOntzOjk6ImZlYXRfbmFtZSI7czoxNjoiSW1wcm92ZWQgRGVmZW5zZSI7czoxMDoiZmVhdF9yYW5rcyI7aToxO31pOjY7Tzo4OiJzdGRDbGFzcyI6Mjp7czo5OiJmZWF0X25hbWUiO3M6MTU6IkltcHJvdmVkIERpc2FybSI7czoxMDoiZmVhdF9yYW5rcyI7aToxO31pOjc7Tzo4OiJzdGRDbGFzcyI6Mjp7czo5OiJmZWF0X25hbWUiO3M6MTY6IkltcHJvdmVkIE92ZXJydW4iO3M6MTA6ImZlYXRfcmFua3MiO2k6MTt9aTo4O086ODoic3RkQ2xhc3MiOjI6e3M6OToiZmVhdF9uYW1lIjtzOjEyOiJJbXByb3ZlZCBQaW4iO3M6MTA6ImZlYXRfcmFua3MiO2k6MTt9aTo5O086ODoic3RkQ2xhc3MiOjI6e3M6OToiZmVhdF9uYW1lIjtzOjEzOiJJbXByb3ZlZCBUcmlwIjtzOjEwOiJmZWF0X3JhbmtzIjtpOjE7fWk6MTA7Tzo4OiJzdGRDbGFzcyI6Mjp7czo5OiJmZWF0X25hbWUiO3M6MTI6IlBvd2VyIEF0dGFjayI7czoxMDoiZmVhdF9yYW5rcyI7aToxO31pOjExO086ODoic3RkQ2xhc3MiOjI6e3M6OToiZmVhdF9uYW1lIjtzOjEyOiJQcmVjaXNlIFNob3QiO3M6MTA6ImZlYXRfcmFua3MiO2k6Mzt9aToxMjtPOjg6InN0ZENsYXNzIjoyOntzOjk6ImZlYXRfbmFtZSI7czoxNDoiUHJvbmUgRmlnaHRpbmciO3M6MTA6ImZlYXRfcmFua3MiO2k6MTt9aToxMztPOjg6InN0ZENsYXNzIjoyOntzOjk6ImZlYXRfbmFtZSI7czoxMDoiUmFuZ2VkIFBpbiI7czoxMDoiZmVhdF9yYW5rcyI7aToxO31pOjE0O086ODoic3RkQ2xhc3MiOjI6e3M6OToiZmVhdF9uYW1lIjtzOjg6IlJlZGlyZWN0IjtzOjEwOiJmZWF0X3JhbmtzIjtpOjE7fWk6MTU7Tzo4OiJzdGRDbGFzcyI6Mjp7czo5OiJmZWF0X25hbWUiO3M6MTM6IlVuY2FubnkgRG9kZ2UiO3M6MTA6ImZlYXRfcmFua3MiO2k6MTt9aToxNjtPOjg6InN0ZENsYXNzIjoyOntzOjk6ImZlYXRfbmFtZSI7czoxMToiV2VhcG9uIEJpbmQiO3M6MTA6ImZlYXRfcmFua3MiO2k6MTt9aToxNztPOjg6InN0ZENsYXNzIjoyOntzOjk6ImZlYXRfbmFtZSI7czoxMjoiV2VhcG9uIEJyZWFrIjtzOjEwOiJmZWF0X3JhbmtzIjtpOjE7fWk6MTg7Tzo4OiJzdGRDbGFzcyI6Mjp7czo5OiJmZWF0X25hbWUiO3M6NzoiSW5zcGlyZSI7czoxMDoiZmVhdF9yYW5rcyI7aToxO31pOjE5O086ODoic3RkQ2xhc3MiOjI6e3M6OToiZmVhdF9uYW1lIjtzOjEwOiJBc3Nlc3NtZW50IjtzOjEwOiJmZWF0X3JhbmtzIjtpOjE7fWk6MjA7Tzo4OiJzdGRDbGFzcyI6Mjp7czo5OiJmZWF0X25hbWUiO3M6MTA6Ikluc3RhbnQgVXAiO3M6MTA6ImZlYXRfcmFua3MiO2k6MTt9aToyMTtPOjg6InN0ZENsYXNzIjoyOntzOjk6ImZlYXRfbmFtZSI7czoxMzoiU2Vjb25kIENoYW5jZSI7czoxMDoiZmVhdF9yYW5rcyI7aToxO31pOjIyO086ODoic3RkQ2xhc3MiOjI6e3M6OToiZmVhdF9uYW1lIjtzOjE1OiJBY3JvYmF0aWMgQmx1ZmYiO3M6MTA6ImZlYXRfcmFua3MiO2k6MTt9aToyMztPOjg6InN0ZENsYXNzIjoyOntzOjk6ImZlYXRfbmFtZSI7czoxNDoiQW5pbWFsIEVtcGF0aHkiO3M6MTA6ImZlYXRfcmFua3MiO2k6MTt9aToyNDtPOjg6InN0ZENsYXNzIjoyOntzOjk6ImZlYXRfbmFtZSI7czo5OiJBcnRpZmljZXIiO3M6MTA6ImZlYXRfcmFua3MiO2k6MTt9aToyNTtPOjg6InN0ZENsYXNzIjoyOntzOjk6ImZlYXRfbmFtZSI7czo5OiJSaXR1YWxpc3QiO3M6MTA6ImZlYXRfcmFua3MiO2k6MTt9aToyNjtPOjg6InN0ZENsYXNzIjoyOntzOjk6ImZlYXRfbmFtZSI7czo1OiJUcmFjayI7czoxMDoiZmVhdF9yYW5rcyI7aToxO319czo2OiJwb3dlcnMiO2E6Nzp7aTowO086ODoic3RkQ2xhc3MiOjM6e3M6MTA6InBvd2VyX25hbWUiO3M6NToiQmxhc3QiO3M6MTE6InBvd2VyX3JhbmtzIjtpOjE7czo1OiJub3RlcyI7czowOiIiO31pOjE7Tzo4OiJzdGRDbGFzcyI6Mzp7czoxMDoicG93ZXJfbmFtZSI7czoxMToiRHVwbGljYXRpb24iO3M6MTE6InBvd2VyX3JhbmtzIjtpOjE7czo1OiJub3RlcyI7czowOiIiO31pOjI7Tzo4OiJzdGRDbGFzcyI6Mzp7czoxMDoicG93ZXJfbmFtZSI7czo4OiJHcmFmdGluZyI7czoxMToicG93ZXJfcmFua3MiO2k6MTtzOjU6Im5vdGVzIjtzOjA6IiI7fWk6MztPOjg6InN0ZENsYXNzIjozOntzOjEwOiJwb3dlcl9uYW1lIjtzOjg6Ik11dGF0aW9uIjtzOjExOiJwb3dlcl9yYW5rcyI7aToxO3M6NToibm90ZXMiO3M6MDoiIjt9aTo0O086ODoic3RkQ2xhc3MiOjM6e3M6MTA6InBvd2VyX25hbWUiO3M6OToiVGltZSBTdG9wIjtzOjExOiJwb3dlcl9yYW5rcyI7aToxO3M6NToibm90ZXMiO3M6MDoiIjt9aTo1O086ODoic3RkQ2xhc3MiOjM6e3M6MTA6InBvd2VyX25hbWUiO3M6MTM6IkNyZWF0ZSBPYmplY3QiO3M6MTE6InBvd2VyX3JhbmtzIjtpOjE7czo1OiJub3RlcyI7czowOiIiO31pOjY7Tzo4OiJzdGRDbGFzcyI6Mzp7czoxMDoicG93ZXJfbmFtZSI7czoxMzoiSW5zdWJzdGFudGlhbCI7czoxMToicG93ZXJfcmFua3MiO2k6MTtzOjU6Im5vdGVzIjtzOjA6IiI7fX1zOjY6InNraWxscyI7YToyMDp7aTowO086ODoic3RkQ2xhc3MiOjQ6e3M6MTA6InNraWxsX25hbWUiO3M6MTA6IkFjcm9iYXRpY3MiO3M6MTE6InNraWxsX3RvdGFsIjtpOjk7czoxMToic2tpbGxfcmFua3MiO2k6NDtzOjEwOiJza2lsbF9hYmlsIjtpOjU7fWk6MTtPOjg6InN0ZENsYXNzIjo0OntzOjEwOiJza2lsbF9uYW1lIjtzOjU6IkJsdWZmIjtzOjExOiJza2lsbF90b3RhbCI7aTo4O3M6MTE6InNraWxsX3JhbmtzIjtpOjQ7czoxMDoic2tpbGxfYWJpbCI7aTo0O31pOjI7Tzo4OiJzdGRDbGFzcyI6NDp7czoxMDoic2tpbGxfbmFtZSI7czo5OiJDb21wdXRlcnMiO3M6MTE6InNraWxsX3RvdGFsIjtpOjY7czoxMToic2tpbGxfcmFua3MiO2k6NDtzOjEwOiJza2lsbF9hYmlsIjtpOjI7fWk6MztPOjg6InN0ZENsYXNzIjo0OntzOjEwOiJza2lsbF9uYW1lIjtzOjEzOiJDb25jZW50cmF0aW9uIjtzOjExOiJza2lsbF90b3RhbCI7aTo5O3M6MTE6InNraWxsX3JhbmtzIjtpOjg7czoxMDoic2tpbGxfYWJpbCI7aToxO31pOjQ7Tzo4OiJzdGRDbGFzcyI6NDp7czoxMDoic2tpbGxfbmFtZSI7czoxNDoiRGlzYWJsZSBEZXZpY2UiO3M6MTE6InNraWxsX3RvdGFsIjtpOjY7czoxMToic2tpbGxfcmFua3MiO2k6NDtzOjEwOiJza2lsbF9hYmlsIjtpOjI7fWk6NTtPOjg6InN0ZENsYXNzIjo0OntzOjEwOiJza2lsbF9uYW1lIjtzOjEzOiJFc2NhcGUgQXJ0aXN0IjtzOjExOiJza2lsbF90b3RhbCI7aTo5O3M6MTE6InNraWxsX3JhbmtzIjtpOjQ7czoxMDoic2tpbGxfYWJpbCI7aTo1O31pOjY7Tzo4OiJzdGRDbGFzcyI6NDp7czoxMDoic2tpbGxfbmFtZSI7czoxODoiR2F0aGVyIEluZm9ybWF0aW9uIjtzOjExOiJza2lsbF90b3RhbCI7aTo4O3M6MTE6InNraWxsX3JhbmtzIjtpOjQ7czoxMDoic2tpbGxfYWJpbCI7aTo0O31pOjc7Tzo4OiJzdGRDbGFzcyI6NDp7czoxMDoic2tpbGxfbmFtZSI7czoxMDoiSW50aW1pZGF0ZSI7czoxMToic2tpbGxfdG90YWwiO2k6ODtzOjExOiJza2lsbF9yYW5rcyI7aTo0O3M6MTA6InNraWxsX2FiaWwiO2k6NDt9aTo4O086ODoic3RkQ2xhc3MiOjQ6e3M6MTA6InNraWxsX25hbWUiO3M6MTE6IkludmVzdGlnYXRlIjtzOjExOiJza2lsbF90b3RhbCI7aToxMDtzOjExOiJza2lsbF9yYW5rcyI7aTo4O3M6MTA6InNraWxsX2FiaWwiO2k6Mjt9aTo5O086ODoic3RkQ2xhc3MiOjQ6e3M6MTA6InNraWxsX25hbWUiO3M6MjI6Iktub3dsZWRnZTogQXJjYW5lIExvcmUiO3M6MTE6InNraWxsX3RvdGFsIjtpOjY7czoxMToic2tpbGxfcmFua3MiO2k6NDtzOjE',1422584289);

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
	(12,'zz@email.com','ZZtop','$2y$10$Qoa5CZC.10mMBrr6GefyDOjJqqjpAJ36iKXqpXNHN1oW4WXoA6Q9W','','2015-01-16 20:03:24','2015-01-16 20:03:24'),
	(13,'use@r.gom','new','$2y$10$11.U1LA0AtAGnLU4PlbiqOHXS0pRrnFs.vjFfX0sFB4VyxmENKu8W','','2015-01-30 01:45:02','2015-01-30 01:45:02'),
	(17,'person@email.com','PersonNew','$2y$10$SC3UMMJ5juuDDrfj/deBDOFgZ9t/UzrTPQeB46//h/M7qZTFkxElq','','2015-01-30 03:38:05','2015-01-30 03:38:05');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

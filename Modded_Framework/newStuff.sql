SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS `DT_DB` DEFAULT CHARACTER SET utf8mb4;
USE `DT_DB`;

CREATE TABLE IF NOT EXISTS `players` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(64) NOT NULL,
	`pid` varchar(17) NOT NULL,
	`cash` int NOT NULL DEFAULT 0,
	`bank` int NOT NULL DEFAULT 30000,
	`dojLevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
	`copLevel` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
	`medLevel` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
	`copDepartment` enum('0','1','2','3','4') NOT NULL DEFAULT '0',
	`medDepartment` enum('0','1','2') NOT NULL DEFAULT '0',
	`licenses` text NOT NULL DEFAULT '[]',
	`civGear` text NOT NULL DEFAULT '[]',
	`copGear` text NOT NULL DEFAULT '[]',
	`medGear` text NOT NULL DEFAULT '[]',
	`stats` varchar(64) NOT NULL DEFAULT '[100,100,100,5000,[0,0,0,0,0,0]]', /*[hunger,thirst,battery,blood,[head,torso,arm_l,arm_r,leg_l,leg_r]]*/
	`jailStats` text NOT NULL DEFAULT '[false,"",0,""]',
	`position` varchar(64) NOT NULL DEFAULT '[]',
	`phoneNumber` varchar(12) NOT NULL,
	`phoneSettings` varchar(150) NOT NULL, /*[background_path,ringtone_sound,volume]*/
	`phoneContacts` varchar(900) NOT NULL DEFAULT '[]', /*[[number,name,notes]]*/
	`skills` varchar(100) NOT NULL DEFAULT '[0,0,0,0,0]',
	PRIMARY KEY (`id`),
	UNIQUE KEY `pid` (`pid`),
	UNIQUE KEY `phoneNumber` (`phoneNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `vehicles` (
	`plate` varchar(7) NOT NULL,
	`faction` varchar(6) NOT NULL,
	`classname` varchar(64) NOT NULL,
	`type` varchar(10) NOT NULL,
	`pid` varchar(17) NOT NULL,
	`active` tinyint(1) NOT NULL DEFAULT 1,
	`customisation` varchar(256) NOT NULL DEFAULT '[]', /*[colour,rvmat,plate,tint,wheel colour,spoiler]*/
	`fuel` double NOT NULL DEFAULT 1,
	`damage` varchar(256) NOT NULL DEFAULT '[]',
	`impounded` tinyint(1) NOT NULL DEFAULT 0,
	PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `houses` (
	`id` int NOT NULL AUTO_INCREMENT,
	`pid` varchar(17) NOT NULL,
	`pos` varchar(64) DEFAULT NULL,
	`type` tinyint(1) NOT NULL DEFAULT 0,
	`furniture` text NOT NULL DEFAULT '[]', /*[[id,class,pos,gear,dir],[]]*/
	`shared` varchar(400) NOT NULL DEFAULT '[]',
	`alarm` varchar(17) NOT NULL DEFAULT '[false,false]',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `shops` (
	`id` int NOT NULL AUTO_INCREMENT,
	`pid` varchar(17) DEFAULT NULL,
	`name` varchar(64) NOT NULL,
	`pos` varchar(64) DEFAULT NULL,
	`items` text NOT NULL DEFAULT '[]', /*[[item,price,quantity]]*/
	`funds` int NOT NULL DEFAULT 0,
	`transaction_log` text NOT NULL DEFAULT '[]',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `companies` (
	`pid` varchar(17) NOT NULL,
	`name` varchar(48) NOT NULL,
	`description` varchar(256)  NOT NULL DEFAULT '',
	`tasks` varchar(256) NOT NULL DEFAULT '',
	`bank` int NOT NULL DEFAULT 0,
	`employees` text,
	PRIMARY KEY (`name`),
	UNIQUE KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pd_db_arrests` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(64) NOT NULL,
	`crimes` text NOT NULL,
	`officer` varchar(64) NOT NULL,
	`time` int NOT NULL,
	`bail` int NOT NULL,
	`notes` varchar(256) NOT NULL DEFAULT '',
	`insertTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`),
	KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pd_db_tickets` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(64) NOT NULL,
	`crimes` text NOT NULL,
	`officer` varchar(64) NOT NULL,
	`cost` int(7) NOT NULL,
	`insertTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pd_db_warrants` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(64) NOT NULL,
	`crimes` text NOT NULL,
	`officer` varchar(64) NOT NULL,
	`notes` text NOT NULL,
	`type` tinyint(1) DEFAULT 0,
	`approved` varchar(64) DEFAULT '',
	`active` tinyint(1) DEFAULT 1,
	`completedBy` varchar(64) DEFAULT '',
	`insertTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`),
	KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `logs` (
	`id` int NOT NULL AUTO_INCREMENT,
	`pid` varchar(17) NOT NULL,
	`name` varchar(32) NOT NULL,
	`action` varchar(255) DEFAULT NULL,
	`insertTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `routine_logs` (
	`id` int NOT NULL AUTO_INCREMENT,
	`pid` varchar(17) NOT NULL,
	`name` varchar(32) NOT NULL,
	`action` varchar(255) DEFAULT NULL,
	`insertTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `persis_vars` (
	`serverID` int NOT NULL AUTO_INCREMENT,
	`threat` varchar(10) NOT NULL DEFAULT 'Green',
	`mayor` varchar(32) NOT NULL DEFAULT '',
	`tax` varchar(30) NOT NULL DEFAULT '[0,0,0]',
	`bank` int NOT NULL DEFAULT 0,
	`announcement` varchar (140) NOT NULL DEFAULT '',
	PRIMARY KEY (`serverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
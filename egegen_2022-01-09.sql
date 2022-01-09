# ************************************************************
# Sequel Ace SQL dump
# Version 20021
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 8.0.27)
# Database: egegen
# Generation Time: 2022-01-09 09:37:46 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table default_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_settings`;

CREATE TABLE `default_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `enum` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `default_settings` WRITE;
/*!40000 ALTER TABLE `default_settings` DISABLE KEYS */;

INSERT INTO `default_settings` (`id`, `enum`, `value`)
VALUES
	(1,'DEFAULT_NEW_ID','1'),
	(2,'DEFAULT_PAGE_ID','1');

/*!40000 ALTER TABLE `default_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `name` varchar(100) NOT NULL,
  `slug` text NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;

INSERT INTO `menus` (`id`, `parent_id`, `status`, `name`, `slug`, `updated_at`, `created_at`)
VALUES
	(1,0,'1','Yazılar','yazilar',NULL,'2022-01-08 19:01:58'),
	(2,0,'1','Gezilecek Yerler','gezilecek-yerler',NULL,'2022-01-08 19:02:30'),
	(3,0,'1','Galeri','galeri',NULL,'2022-01-08 19:01:58'),
	(5,1,'1','İzmir Hakkında','izmir-hakkinda',NULL,'2022-01-08 19:01:58'),
	(6,0,'1','İletişim','iletisim',NULL,'2022-01-09 00:40:53'),
	(7,1,'1','Gezilecek Yerler','gezilecek-yerler',NULL,'2022-01-09 12:13:41'),
	(8,1,'1','Deneme Duyuru 1','haberler/deneme-duyuru-1',NULL,'2022-01-09 12:15:04'),
	(9,1,'1','Deneme Duyuru 2','haberler/deneme-duyuru-2',NULL,'2022-01-09 12:15:04');

/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int NOT NULL,
  `batch` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`)
VALUES
	(76,'2022-01-07-133730','App\\Database\\Migrations\\AddMenus','default','App',1641680143,1),
	(77,'2022-01-07-133735','App\\Database\\Migrations\\AddNews','default','App',1641680143,1),
	(78,'2022-01-07-134330','App\\Database\\Migrations\\AddSliders','default','App',1641680143,1),
	(79,'2022-01-07-134752','App\\Database\\Migrations\\AddPages','default','App',1641680143,1),
	(80,'2022-01-08-213548','App\\Database\\Migrations\\AddDefaultSetting','default','App',1641680143,1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table news
# ------------------------------------------------------------

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` text NOT NULL,
  `slug` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;

INSERT INTO `news` (`id`, `status`, `title`, `content`, `image`, `slug`, `updated_at`, `created_at`)
VALUES
	(1,'1','Deneme Duyuru 1','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nWhy do we use it?\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\n\n','https://izmir.ktb.gov.tr/Resim/68383,konakjpg.png?0','deneme-duyuru-1',NULL,'2022-01-08 20:25:33'),
	(3,'1','Deneme Duyuru 2','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nWhy do we use it?\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\n\n','https://izmir.ktb.gov.tr/Resim/68383,konakjpg.png?0','deneme-duyuru-2',NULL,'2022-01-08 20:25:34'),
	(4,'1','Deneme Duyuru 3','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nWhy do we use it?\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\n\n','https://izmir.ktb.gov.tr/Resim/68383,konakjpg.png?0','deneme-duyuru-3',NULL,'2022-01-08 20:25:35'),
	(5,'1','Deneme Duyuru 4','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nWhy do we use it?\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\n\n','https://izmir.ktb.gov.tr/Resim/68383,konakjpg.png?0','deneme-duyuru-4',NULL,'2022-01-08 20:25:36'),
	(6,'1','Deneme Duyuru 5','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nWhy do we use it?\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\n\n','https://izmir.ktb.gov.tr/Resim/68383,konakjpg.png?0','deneme-duyuru-5',NULL,'2022-01-08 20:25:37');

/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `slug` text NOT NULL,
  `static_page` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;

INSERT INTO `pages` (`id`, `status`, `title`, `content`, `slug`, `static_page`, `updated_at`, `created_at`)
VALUES
	(1,'1','İzmir Hakkında','İzmir, Türkiye\'nin İstanbul ve Ankara\'dan sonra üçüncü büyük metropolü ve fuarlar merkezi, ticaret ile bütünleşmiş çağdaş bir liman kentidir. İzmir\'in batısında denizi, plajları ve termal merkezleriyle Çeşme Yarımadası uzanır. Antik çağların en ünlü kentleri arasında yer alan Efes, Roma’nın imparatorluk devrinde dünyanın en büyük kentlerinden biriydi. Tüm İyonya kültürünün zenginliklerini bünyesinde barındıran Efes, yoğun sanatsal etkinliklerle de adını duyuruyordu. Bu maksatla da bu şehre \"Güzel İzmir\", \"Eski İzmir\" ve \"la Perle de l\'Ionie\" (İyonya\'nın İncisi) deniyordu. Tarihten beri bu tanımlarla yıllar sonra şehrin sıfatı hâline gelmiştir. İzmir, yatlar ve gemilerle çevrilmiş uzun ve dar bir körfezin başında yer almaktadır. Ilıman bir iklime sahip olup, yazın denizden gelen taze bir serinlik güneşin sıcaklığını alıp götürmektedir. Sahil boyunca palmiye, hurma ağaçları ve geniş caddeler bulunmaktadır.','izmir-hakkinda',NULL,NULL,'2022-01-08 19:56:02'),
	(2,'1','Gezilecek Yerler','İzmir, Türkiye\'nin İstanbul ve Ankara\'dan sonra üçüncü büyük metropolü ve fuarlar merkezi, ticaret ile bütünleşmiş çağdaş bir liman kentidir. İzmir\'in batısında denizi, plajları ve termal merkezleriyle Çeşme Yarımadası uzanır. Antik çağların en ünlü kentleri arasında yer alan Efes, Roma’nın imparatorluk devrinde dünyanın en büyük kentlerinden biriydi. Tüm İyonya kültürünün zenginliklerini bünyesinde barındıran Efes, yoğun sanatsal etkinliklerle de adını duyuruyordu. Bu maksatla da bu şehre \"Güzel İzmir\", \"Eski İzmir\" ve \"la Perle de l\'Ionie\" (İyonya\'nın İncisi) deniyordu. Tarihten beri bu tanımlarla yıllar sonra şehrin sıfatı hâline gelmiştir. İzmir, yatlar ve gemilerle çevrilmiş uzun ve dar bir körfezin başında yer almaktadır. Ilıman bir iklime sahip olup, yazın denizden gelen taze bir serinlik güneşin sıcaklığını alıp götürmektedir. Sahil boyunca palmiye, hurma ağaçları ve geniş caddeler bulunmaktadır.','gezilecek-yerler',NULL,NULL,'2022-01-08 19:56:02'),
	(3,'1','Galeri','','galeri','gallery.php',NULL,'2022-01-09 00:43:42'),
	(4,'1','İletişim','','iletisim','contact.php',NULL,'2022-01-09 00:43:51');

/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sliders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sliders`;

CREATE TABLE `sliders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `image` text NOT NULL,
  `slug` text NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;

INSERT INTO `sliders` (`id`, `status`, `image`, `slug`, `updated_at`, `created_at`)
VALUES
	(1,'1','https://wowslider.com/sliders/demo-77/data1/images/road220058.jpg','',NULL,'2022-01-08 19:35:08'),
	(2,'1','https://wowslider.com/sliders/demo-77/data1/images/tuscany428041.jpg','',NULL,'2022-01-08 19:35:08');

/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

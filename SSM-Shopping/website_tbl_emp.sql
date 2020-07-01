CREATE DATABASE  IF NOT EXISTS `website` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `website`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: website
-- ------------------------------------------------------
-- Server version	5.7.29-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_emp`
--

DROP TABLE IF EXISTS `tbl_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_emp` (
  `emp_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(22) NOT NULL DEFAULT '',
  `emp_email` varchar(256) NOT NULL DEFAULT '',
  `gender` char(2) NOT NULL DEFAULT '',
  `department_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_emp`
--

LOCK TABLES `tbl_emp` WRITE;
/*!40000 ALTER TABLE `tbl_emp` DISABLE KEYS */;
INSERT INTO `tbl_emp` VALUES (2,'name_a8041','a8041@qq.com','F',1),(3,'name_cc24f','cc24f@qq.com','F',3),(4,'name_0d1ba','0d1ba@qq.com','M',4),(5,'name_389b0','389b0@qq.com','F',5),(6,'name_80384','80384@qq.com','M',6),(7,'name_58625','58625@qq.com','F',1),(8,'name_2cf81','2cf81@qq.com','M',2),(9,'name_819e4','819e4@qq.com','F',3),(10,'name_d0e7b','d0e7b@qq.com','M',4),(11,'name_ecb75','ecb75@qq.com','F',5),(12,'name_b50c0','b50c0@qq.com','M',6),(13,'name_8bbff','8bbff@qq.com','F',1),(14,'name_d4254','d4254@qq.com','M',2),(15,'name_e442d','e442d@qq.com','F',3),(16,'name_ed613','ed613@qq.com','M',4),(17,'name_fdf42','fdf42@qq.com','F',5),(18,'name_991c8','991c8@qq.com','M',6),(19,'name_46f13','46f13@qq.com','F',1),(20,'name_7e006','7e006@qq.com','M',2),(21,'name_b1bff','b1bff@qq.com','F',3),(22,'name_a8b96','a8b96@qq.com','M',4),(23,'name_e9b1f','e9b1f@qq.com','F',5),(24,'name_975ea','975ea@qq.com','M',6),(25,'name_0e4e2','0e4e2@qq.com','F',1),(26,'name_abc83','abc83@qq.com','M',2),(27,'name_3ba22','3ba22@qq.com','F',3),(28,'name_81f71','81f71@qq.com','M',4),(29,'name_5fdbf','5fdbf@qq.com','F',5),(30,'name_c44cc','c44cc@qq.com','M',6),(31,'name_44736','44736@qq.com','F',1),(32,'name_bb6fc','bb6fc@qq.com','M',2),(33,'name_28bae','28bae@qq.com','F',3),(34,'name_2f785','2f785@qq.com','M',4),(35,'name_ef7bc','ef7bc@qq.com','F',5),(36,'name_e67b5','e67b5@qq.com','M',6),(37,'name_87933','87933@qq.com','F',1),(38,'name_42771','42771@qq.com','M',2),(39,'name_23593','23593@qq.com','F',3),(40,'name_5973d','5973d@qq.com','M',4),(41,'name_cda37','cda37@qq.com','F',5),(42,'name_bc940','bc940@qq.com','M',6),(43,'name_67e8c','67e8c@qq.com','F',1),(44,'name_cbda4','cbda4@qq.com','M',2),(45,'name_57c5c','57c5c@qq.com','F',3),(46,'name_659e4','659e4@qq.com','M',4),(47,'name_85494','85494@qq.com','F',5),(48,'name_9d760','9d760@qq.com','M',6),(49,'name_0e372','0e372@qq.com','F',1),(50,'name_21e5d','21e5d@qq.com','M',2),(51,'name_0f543','0f543@qq.com','F',3),(52,'name_88606','88606@qq.com','M',4),(53,'name_a680a','a680a@qq.com','F',5),(54,'name_9ee20','9ee20@qq.com','M',6),(55,'name_8b054','8b054@qq.com','F',1),(56,'name_9c335','9c335@qq.com','M',2),(57,'name_eab28','eab28@qq.com','F',3),(58,'name_9d37d','9d37d@qq.com','M',4),(59,'name_dd59f','dd59f@qq.com','F',5),(60,'name_20f08','20f08@qq.com','M',6),(61,'name_48fc8','48fc8@qq.com','F',1),(62,'name_f7975','f7975@qq.com','M',2),(63,'name_78f30','78f30@qq.com','F',3),(64,'name_2d754','2d754@qq.com','M',4),(65,'name_61043','61043@qq.com','F',5),(66,'name_98176','98176@qq.com','M',6),(67,'name_cf4c3','cf4c3@qq.com','F',1),(68,'name_ad42d','ad42d@qq.com','M',2),(69,'name_81c14','81c14@qq.com','F',3),(70,'name_54043','54043@qq.com','M',4),(71,'name_70e84','70e84@qq.com','F',5),(72,'name_c238e','c238e@qq.com','M',6),(73,'name_99745','99745@qq.com','F',1),(74,'name_9242f','9242f@qq.com','M',2),(75,'name_67c0e','67c0e@qq.com','F',3),(76,'name_4a8eb','4a8eb@qq.com','M',4),(77,'name_0be3c','0be3c@qq.com','F',5),(78,'name_cb41b','cb41b@qq.com','M',6),(79,'name_2635b','2635b@qq.com','F',1),(80,'name_49e04','49e04@qq.com','M',2),(81,'name_86b4d','86b4d@qq.com','F',3),(82,'name_3200a','3200a@qq.com','M',4),(83,'name_a73af','a73af@qq.com','F',5),(84,'name_be4ba','be4ba@qq.com','M',6),(85,'name_c51a7','c51a7@qq.com','F',1),(86,'name_e05cd','e05cd@qq.com','M',2),(87,'name_a4da6','a4da6@qq.com','F',3),(88,'name_da19e','da19e@qq.com','M',4),(89,'name_55b28','55b28@qq.com','F',5),(90,'name_e2496','e2496@qq.com','M',6),(91,'name_863e8','863e8@qq.com','F',1),(92,'name_b3532','b3532@qq.com','M',2),(93,'name_a7516','a7516@qq.com','F',3),(94,'name_4b58f','4b58f@qq.com','M',4),(95,'name_361f1','361f1@qq.com','F',5),(96,'name_b645a','b645a@qq.com','M',6),(97,'name_930a5','930a5@qq.com','F',1),(98,'name_24963','24963@qq.com','M',2),(99,'name_702ce','702ce@qq.com','F',3),(100,'name_6ad37','6ad37@qq.com','M',4),(101,'name_0af22','0af22@qq.com','F',5),(102,'name_07f7d','07f7d@qq.com','M',6),(103,'name_cfd9e','cfd9e@qq.com','F',1),(104,'name_ab00e','ab00e@qq.com','M',2),(105,'name_5c6b8','5c6b8@qq.com','F',3),(106,'name_ff1fe','ff1fe@qq.com','M',4),(107,'name_e9dc9','e9dc9@qq.com','F',5),(108,'name_1be25','1be25@qq.com','M',6),(109,'name_980f1','980f1@qq.com','F',1),(110,'name_ed3bd','ed3bd@qq.com','M',2),(111,'name_13530','13530@qq.com','F',3),(112,'name_e3e27','e3e27@qq.com','M',4),(113,'name_9fe57','9fe57@qq.com','F',5),(114,'name_bf76f','bf76f@qq.com','M',6),(115,'name_f2c2a','f2c2a@qq.com','F',1),(116,'name_eca77','eca77@qq.com','M',2),(117,'name_bf51c','bf51c@qq.com','F',3),(118,'name_6ff96','6ff96@qq.com','M',4),(119,'name_28b91','28b91@qq.com','F',5),(120,'name_cb3b3','cb3b3@qq.com','M',6),(121,'name_c33ba','c33ba@qq.com','F',1),(122,'name_cc16b','cc16b@qq.com','M',2),(123,'name_36b7e','36b7e@qq.com','F',3),(124,'name_0356f','0356f@qq.com','M',4),(125,'name_eac15','eac15@qq.com','F',5),(126,'name_02c63','02c63@qq.com','M',6),(127,'name_575d0','575d0@qq.com','F',1),(128,'name_f65d0','f65d0@qq.com','M',2),(129,'name_bfc1b','bfc1b@qq.com','F',3),(130,'name_8ae40','8ae40@qq.com','M',4),(131,'name_931eb','931eb@qq.com','F',5),(132,'name_8d11c','8d11c@qq.com','M',6),(133,'name_87c73','87c73@qq.com','F',1),(134,'name_426d5','426d5@qq.com','M',2),(135,'name_bf7e8','bf7e8@qq.com','F',3),(136,'name_8e3f5','8e3f5@qq.com','M',4),(137,'name_be064','be064@qq.com','F',5),(138,'name_8c4f6','8c4f6@qq.com','M',6),(139,'name_b8c82','b8c82@qq.com','F',1),(140,'name_91d15','91d15@qq.com','M',2),(141,'name_39006','39006@qq.com','F',3),(142,'name_07eb9','07eb9@qq.com','M',4),(143,'name_cac5e','cac5e@qq.com','F',5),(144,'name_344e9','344e9@qq.com','M',6),(145,'name_b0f6a','b0f6a@qq.com','F',1),(146,'name_12ca8','12ca8@qq.com','M',2),(147,'name_3a7da','3a7da@qq.com','F',3),(148,'name_c7773','c7773@qq.com','M',4),(149,'name_c6d2a','c6d2a@qq.com','F',5),(150,'name_87e1f','87e1f@qq.com','M',6),(151,'name_9ab99','9ab99@qq.com','F',1),(152,'name_b875a','b875a@qq.com','M',2),(153,'name_02c26','02c26@qq.com','F',3),(154,'name_cf8d9','cf8d9@qq.com','M',4),(155,'name_1e0f7','1e0f7@qq.com','F',5),(156,'name_7ca73','7ca73@qq.com','M',6),(157,'name_4c263','4c263@qq.com','F',1),(158,'name_3680e','3680e@qq.com','M',2),(159,'name_e6b9b','e6b9b@qq.com','F',3),(160,'name_bb86a','bb86a@qq.com','M',4),(161,'name_31704','31704@qq.com','F',5),(162,'name_7e5ab','7e5ab@qq.com','M',6),(163,'name_e609d','e609d@qq.com','F',1),(164,'name_9b8b0','9b8b0@qq.com','M',2),(165,'name_5d515','5d515@qq.com','F',3),(166,'name_a098f','a098f@qq.com','M',4),(167,'name_07750','07750@qq.com','F',5),(168,'name_7dcc7','7dcc7@qq.com','M',6),(169,'name_62088','62088@qq.com','F',1),(170,'name_e25b7','e25b7@qq.com','M',2),(171,'name_03402','03402@qq.com','F',3),(172,'name_9e7f4','9e7f4@qq.com','M',4),(173,'name_46a3b','46a3b@qq.com','F',5),(174,'name_7780a','7780a@qq.com','M',6),(175,'name_5319e','5319e@qq.com','F',1),(176,'name_879c9','879c9@qq.com','M',2),(177,'name_aad79','aad79@qq.com','F',3),(178,'name_57661','57661@qq.com','M',4),(179,'name_3fb8d','3fb8d@qq.com','F',5),(180,'name_167ac','167ac@qq.com','M',6),(181,'name_7db9a','7db9a@qq.com','F',1),(182,'name_f76d4','f76d4@qq.com','M',2),(183,'name_6a3e8','6a3e8@qq.com','F',3),(184,'name_bfb30','bfb30@qq.com','M',4),(185,'name_408a8','408a8@qq.com','F',5),(186,'name_da6f0','da6f0@qq.com','M',6),(187,'name_cccab','cccab@qq.com','F',1),(188,'name_d5d3e','d5d3e@qq.com','M',2),(189,'name_e4781','e4781@qq.com','F',3),(190,'name_e4e4f','e4e4f@qq.com','M',4),(191,'name_d3b94','d3b94@qq.com','F',5),(192,'name_49677','49677@qq.com','M',6),(193,'name_fd599','fd599@qq.com','F',1),(194,'name_b3536','b3536@qq.com','M',2),(195,'name_6eec1','6eec1@qq.com','F',3),(196,'name_7092b','7092b@qq.com','M',4),(197,'name_5976a','5976a@qq.com','F',5),(198,'name_65d2d','65d2d@qq.com','M',6),(199,'name_78826','78826@qq.com','F',1),(200,'name_635d3','635d3@qq.com','M',2),(201,'安抚','1234@qwe.com','F',1);
/*!40000 ALTER TABLE `tbl_emp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-19 15:04:50

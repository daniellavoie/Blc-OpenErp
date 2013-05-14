CREATE DATABASE  IF NOT EXISTS `dfbroadleaf` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dfbroadleaf`;
-- MySQL dump 10.13  Distrib 5.5.24, for osx10.5 (i386)
--
-- Host: localhost    Database: dfbroadleaf
-- ------------------------------------------------------
-- Server version	5.5.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `BLC_ADDITIONAL_OFFER_INFO`
--

DROP TABLE IF EXISTS `BLC_ADDITIONAL_OFFER_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADDITIONAL_OFFER_INFO` (
  `BLC_ORDER_ORDER_ID` bigint(20) NOT NULL,
  `OFFER_INFO_ID` bigint(20) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`BLC_ORDER_ORDER_ID`,`OFFER_ID`),
  KEY `FK3BFDBD63D5F3FAF4` (`OFFER_ID`),
  KEY `FK3BFDBD63B5D9C34D` (`OFFER_INFO_ID`),
  KEY `FK3BFDBD631891FF79` (`BLC_ORDER_ORDER_ID`),
  CONSTRAINT `FK3BFDBD631891FF79` FOREIGN KEY (`BLC_ORDER_ORDER_ID`) REFERENCES `BLC_ORDER` (`ORDER_ID`),
  CONSTRAINT `FK3BFDBD63B5D9C34D` FOREIGN KEY (`OFFER_INFO_ID`) REFERENCES `BLC_OFFER_INFO` (`OFFER_INFO_ID`),
  CONSTRAINT `FK3BFDBD63D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_ADDITIONAL_OFFER_INFO`
--

LOCK TABLES `BLC_ADDITIONAL_OFFER_INFO` WRITE;
/*!40000 ALTER TABLE `BLC_ADDITIONAL_OFFER_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ADDITIONAL_OFFER_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_ADDRESS`
--

DROP TABLE IF EXISTS `BLC_ADDRESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADDRESS` (
  `ADDRESS_ID` bigint(20) NOT NULL,
  `ADDRESS_LINE1` varchar(255) NOT NULL,
  `ADDRESS_LINE2` varchar(255) DEFAULT NULL,
  `CITY` varchar(255) NOT NULL,
  `COMPANY_NAME` varchar(255) DEFAULT NULL,
  `COUNTY` varchar(255) DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `FAX` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `IS_ACTIVE` bit(1) DEFAULT NULL,
  `IS_BUSINESS` bit(1) DEFAULT NULL,
  `IS_DEFAULT` bit(1) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `POSTAL_CODE` varchar(255) NOT NULL,
  `PRIMARY_PHONE` varchar(255) DEFAULT NULL,
  `SECONDARY_PHONE` varchar(255) DEFAULT NULL,
  `STANDARDIZED` bit(1) DEFAULT NULL,
  `TOKENIZED_ADDRESS` varchar(255) DEFAULT NULL,
  `VERIFICATION_LEVEL` varchar(255) DEFAULT NULL,
  `ZIP_FOUR` varchar(255) DEFAULT NULL,
  `COUNTRY` varchar(255) NOT NULL,
  `STATE_PROV_REGION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ADDRESS_ID`),
  KEY `ADDRESS_STATE_INDEX` (`STATE_PROV_REGION`),
  KEY `ADDRESS_COUNTRY_INDEX` (`COUNTRY`),
  KEY `FK299F86CE337C4D50` (`STATE_PROV_REGION`),
  KEY `FK299F86CEA46E16CF` (`COUNTRY`),
  CONSTRAINT `FK299F86CEA46E16CF` FOREIGN KEY (`COUNTRY`) REFERENCES `BLC_COUNTRY` (`ABBREVIATION`),
  CONSTRAINT `FK299F86CE337C4D50` FOREIGN KEY (`STATE_PROV_REGION`) REFERENCES `BLC_STATE` (`ABBREVIATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_ADDRESS`
--

LOCK TABLES `BLC_ADDRESS` WRITE;
/*!40000 ALTER TABLE `BLC_ADDRESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ADDRESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_ADMIN_PASSWORD_TOKEN`
--

DROP TABLE IF EXISTS `BLC_ADMIN_PASSWORD_TOKEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADMIN_PASSWORD_TOKEN` (
  `PASSWORD_TOKEN` varchar(255) NOT NULL,
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `TOKEN_USED_DATE` datetime DEFAULT NULL,
  `TOKEN_USED_FLAG` bit(1) NOT NULL,
  PRIMARY KEY (`PASSWORD_TOKEN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_ADMIN_PASSWORD_TOKEN`
--

LOCK TABLES `BLC_ADMIN_PASSWORD_TOKEN` WRITE;
/*!40000 ALTER TABLE `BLC_ADMIN_PASSWORD_TOKEN` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ADMIN_PASSWORD_TOKEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_ADMIN_PERMISSION_ENTITY`
--

DROP TABLE IF EXISTS `BLC_ADMIN_PERMISSION_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADMIN_PERMISSION_ENTITY` (
  `ADMIN_PERMISSION_ENTITY_ID` bigint(20) NOT NULL,
  `CEILING_ENTITY` varchar(255) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ENTITY_ID`),
  KEY `FK23C09E3DE88B7D38` (`ADMIN_PERMISSION_ID`),
  CONSTRAINT `FK23C09E3DE88B7D38` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `BLC_ADMIN_PERMISSION` (`ADMIN_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_ADMIN_PERMISSION_ENTITY`
--

LOCK TABLES `BLC_ADMIN_PERMISSION_ENTITY` WRITE;
/*!40000 ALTER TABLE `BLC_ADMIN_PERMISSION_ENTITY` DISABLE KEYS */;
INSERT INTO `BLC_ADMIN_PERMISSION_ENTITY` VALUES (1,'org.broadleafcommerce.core.catalog.domain.Category',2),(2,'org.broadleafcommerce.core.catalog.domain.Category',3),(3,'org.broadleafcommerce.core.catalog.domain.Product',3),(4,'org.broadleafcommerce.core.catalog.domain.Category',4),(5,'org.broadleafcommerce.core.catalog.domain.Product',4),(6,'org.broadleafcommerce.core.catalog.domain.Category',5),(7,'org.broadleafcommerce.core.catalog.domain.Product',5),(8,'org.broadleafcommerce.core.catalog.domain.Product',6),(9,'org.broadleafcommerce.core.catalog.domain.ProductAttribute',6),(10,'org.broadleafcommerce.core.catalog.domain.Product',7),(11,'org.broadleafcommerce.core.catalog.domain.Category',7),(12,'org.broadleafcommerce.core.catalog.domain.ProductAttribute',7),(13,'org.broadleafcommerce.core.catalog.domain.Product',8),(14,'org.broadleafcommerce.core.catalog.domain.Category',8),(15,'org.broadleafcommerce.core.catalog.domain.ProductAttribute',8),(16,'org.broadleafcommerce.core.catalog.domain.Product',9),(17,'org.broadleafcommerce.core.catalog.domain.Category',9),(18,'org.broadleafcommerce.core.catalog.domain.ProductAttribute',9),(19,'org.broadleafcommerce.core.offer.domain.Offer',10),(20,'org.broadleafcommerce.core.offer.domain.OfferItemCriteria',10),(21,'org.broadleafcommerce.core.offer.domain.Offer',11),(22,'org.broadleafcommerce.core.offer.domain.OfferItemCriteria',11),(23,'org.broadleafcommerce.core.offer.domain.Offer',12),(24,'org.broadleafcommerce.core.offer.domain.OfferItemCriteria',12),(25,'org.broadleafcommerce.core.offer.domain.Offer',13),(26,'org.broadleafcommerce.core.offer.domain.OfferItemCriteria',13),(27,'org.broadleafcommerce.profile.core.domain.Customer',13),(28,'org.broadleafcommerce.core.order.domain.FulfillmentGroup',13),(29,'org.broadleafcommerce.core.order.domain.OrderItem',13),(30,'org.broadleafcommerce.core.order.domain.Order',13),(31,'org.broadleafcommerce.core.order.domain.Order',14),(32,'org.broadleafcommerce.core.order.domain.OrderItem',14),(33,'org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice',14),(34,'org.broadleafcommerce.core.offer.domain.FulfillmentGroupAdjustment',14),(35,'org.broadleafcommerce.core.order.domain.FulfillmentGroup',14),(36,'org.broadleafcommerce.core.offer.domain.OfferCode',14),(37,'org.broadleafcommerce.core.offer.domain.OrderAdjustment',14),(38,'org.broadleafcommerce.core.offer.domain.OrderItemAdjustment',14),(39,'org.broadleafcommerce.core.payment.domain.PaymentInfo',14),(40,'org.broadleafcommerce.core.order.domain.Order',15),(41,'org.broadleafcommerce.core.order.domain.OrderItem',15),(42,'org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice',15),(43,'org.broadleafcommerce.core.offer.domain.FulfillmentGroupAdjustment',15),(44,'org.broadleafcommerce.core.order.domain.FulfillmentGroup',15),(45,'org.broadleafcommerce.core.offer.domain.OfferCode',15),(46,'org.broadleafcommerce.core.offer.domain.OrderAdjustment',15),(47,'org.broadleafcommerce.core.offer.domain.OrderItemAdjustment',15),(48,'org.broadleafcommerce.core.payment.domain.PaymentInfo',15),(49,'org.broadleafcommerce.core.order.domain.Order',16),(50,'org.broadleafcommerce.core.order.domain.OrderItem',16),(51,'org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice',16),(52,'org.broadleafcommerce.core.offer.domain.FulfillmentGroupAdjustment',16),(53,'org.broadleafcommerce.core.order.domain.FulfillmentGroup',16),(54,'org.broadleafcommerce.core.offer.domain.OfferCode',16),(55,'org.broadleafcommerce.core.offer.domain.OrderAdjustment',16),(56,'org.broadleafcommerce.core.offer.domain.OrderItemAdjustment',16),(57,'org.broadleafcommerce.core.payment.domain.PaymentInfo',16),(58,'org.broadleafcommerce.core.order.domain.Order',17),(59,'org.broadleafcommerce.core.order.domain.OrderItem',17),(60,'org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice',17),(61,'org.broadleafcommerce.core.offer.domain.FulfillmentGroupAdjustment',17),(62,'org.broadleafcommerce.core.order.domain.FulfillmentGroup',17),(63,'org.broadleafcommerce.core.offer.domain.OfferCode',17),(64,'org.broadleafcommerce.core.offer.domain.OrderAdjustment',17),(65,'org.broadleafcommerce.core.offer.domain.OrderItemAdjustment',17),(66,'org.broadleafcommerce.core.payment.domain.PaymentInfo',17),(67,'org.broadleafcommerce.profile.core.domain.Country',17),(68,'org.broadleafcommerce.profile.core.domain.State',17),(69,'org.broadleafcommerce.profile.core.domain.Customer',18),(70,'org.broadleafcommerce.profile.core.domain.Customer',19),(71,'org.broadleafcommerce.profile.core.domain.Customer',20),(72,'org.broadleafcommerce.profile.core.domain.Customer',21),(73,'org.broadleafcommerce.profile.core.domain.ChallengeQuestion',21),(74,'org.broadleafcommerce.cms.page.domain.Page',22),(75,'org.broadleafcommerce.cms.page.domain.PageTemplate',22),(76,'org.broadleafcommerce.cms.page.domain.Page',23),(77,'org.broadleafcommerce.cms.page.domain.PageTemplate',23),(78,'org.broadleafcommerce.cms.page.domain.Page',24),(79,'org.broadleafcommerce.cms.page.domain.PageTemplate',24),(80,'org.broadleafcommerce.cms.page.domain.Page',25),(81,'org.broadleafcommerce.cms.page.domain.PageTemplate',25),(82,'org.broadleafcommerce.common.locale.domain.Locale',25),(83,'org.broadleafcommerce.cms.file.domain.StaticAsset',26),(84,'org.broadleafcommerce.cms.file.domain.StaticAssetFolder',26),(85,'org.broadleafcommerce.cms.file.domain.StaticAsset',27),(86,'org.broadleafcommerce.cms.file.domain.StaticAssetFolder',27),(87,'org.broadleafcommerce.cms.file.domain.StaticAsset',28),(88,'org.broadleafcommerce.cms.file.domain.StaticAssetFolder',28),(89,'org.broadleafcommerce.cms.file.domain.StaticAsset',29),(90,'org.broadleafcommerce.cms.file.domain.StaticAssetFolder',29),(91,'org.broadleafcommerce.common.locale.domain.Locale',29),(92,'org.broadleafcommerce.cms.structure.domain.StructuredContent',30),(93,'org.broadleafcommerce.cms.structure.domain.StructuredContentType',30),(94,'org.broadleafcommerce.cms.structure.domain.StructuredContent',31),(95,'org.broadleafcommerce.cms.structure.domain.StructuredContentType',31),(96,'org.broadleafcommerce.cms.structure.domain.StructuredContent',32),(97,'org.broadleafcommerce.cms.structure.domain.StructuredContentType',32),(98,'org.broadleafcommerce.cms.structure.domain.StructuredContent',33),(99,'org.broadleafcommerce.cms.structure.domain.StructuredContentType',33),(100,'org.broadleafcommerce.common.locale.domain.Locale',33),(101,'org.broadleafcommerce.openadmin.server.domain.SandBoxItem',34),(102,'org.broadleafcommerce.openadmin.server.domain.SandBoxItem',35),(103,'org.broadleafcommerce.openadmin.server.security.domain.AdminUser',36),(104,'org.broadleafcommerce.openadmin.server.security.domain.AdminRole',36),(105,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission',36),(106,'org.broadleafcommerce.openadmin.server.security.domain.AdminUser',37),(107,'org.broadleafcommerce.openadmin.server.security.domain.AdminRole',37),(108,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission',37),(109,'org.broadleafcommerce.openadmin.server.security.domain.AdminUser',38),(110,'org.broadleafcommerce.openadmin.server.security.domain.AdminRole',38),(111,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission',38),(112,'org.broadleafcommerce.openadmin.server.security.domain.AdminUser',39),(113,'org.broadleafcommerce.openadmin.server.security.domain.AdminRole',39),(114,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission',39),(115,'org.broadleafcommerce.profile.core.domain.Customer',33),(116,'org.broadleafcommerce.core.order.domain.OrderItem',33),(117,'org.broadleafcommerce.common.RequestDTOImpl',33),(118,'org.broadleafcommerce.common.TimeDTO',33),(119,'org.broadleafcommerce.core.catalog.domain.Product',33),(120,'org.broadleafcommerce.cms.structure.domain.StructuredContentItemCriteria',30),(121,'org.broadleafcommerce.cms.structure.domain.StructuredContentItemCriteria',31),(122,'org.broadleafcommerce.cms.structure.domain.StructuredContentItemCriteria',32),(123,'org.broadleafcommerce.cms.structure.domain.StructuredContentItemCriteria',33),(124,'org.broadleafcommerce.cms.structure.domain.StructuredContentFieldTemplate',30),(125,'org.broadleafcommerce.cms.structure.domain.StructuredContentFieldTemplate',31),(126,'org.broadleafcommerce.cms.structure.domain.StructuredContentFieldTemplate',32),(127,'org.broadleafcommerce.cms.structure.domain.StructuredContentFieldTemplate',33),(128,'org.broadleafcommerce.cms.file.domain.StaticAsset',5),(129,'org.broadleafcommerce.cms.file.domain.StaticAsset',9),(130,'org.broadleafcommerce.core.catalog.domain.Category',40),(131,'org.broadleafcommerce.core.catalog.domain.Product',40),(132,'org.broadleafcommerce.core.catalog.domain.Category',41),(133,'org.broadleafcommerce.core.catalog.domain.Product',41),(134,'org.broadleafcommerce.core.catalog.domain.ProductAttribute',41),(135,'org.broadleafcommerce.core.offer.domain.Offer',42),(136,'org.broadleafcommerce.core.offer.domain.OfferItemCriteria',42),(137,'org.broadleafcommerce.profile.core.domain.Customer',42),(138,'org.broadleafcommerce.core.order.domain.FulfillmentGroup',42),(139,'org.broadleafcommerce.core.order.domain.OrderItem',42),(140,'org.broadleafcommerce.core.order.domain.Order',42),(141,'org.broadleafcommerce.core.order.domain.Order',43),(142,'org.broadleafcommerce.core.order.domain.OrderItem',43),(143,'org.broadleafcommerce.core.order.domain.DiscreteOrderItemFeePrice',43),(144,'org.broadleafcommerce.core.offer.domain.FulfillmentGroupAdjustment',43),(145,'org.broadleafcommerce.core.order.domain.FulfillmentGroup',43),(146,'org.broadleafcommerce.core.offer.domain.OfferCode',43),(147,'org.broadleafcommerce.core.offer.domain.OrderAdjustment',43),(148,'org.broadleafcommerce.core.offer.domain.OrderItemAdjustment',43),(149,'org.broadleafcommerce.core.payment.domain.PaymentInfo',43),(150,'org.broadleafcommerce.profile.core.domain.Country',43),(151,'org.broadleafcommerce.profile.core.domain.State',43),(152,'org.broadleafcommerce.profile.core.domain.Customer',44),(153,'org.broadleafcommerce.profile.core.domain.ChallengeQuestion',44),(154,'org.broadleafcommerce.cms.page.domain.Page',45),(155,'org.broadleafcommerce.cms.page.domain.PageTemplate',45),(156,'org.broadleafcommerce.common.locale.domain.Locale',45),(157,'org.broadleafcommerce.cms.file.domain.StaticAsset',46),(158,'org.broadleafcommerce.cms.file.domain.StaticAssetFolder',46),(159,'org.broadleafcommerce.common.locale.domain.Locale',46),(160,'org.broadleafcommerce.cms.structure.domain.StructuredContent',47),(161,'org.broadleafcommerce.cms.structure.domain.StructuredContentType',47),(162,'org.broadleafcommerce.common.locale.domain.Locale',47),(165,'org.broadleafcommerce.openadmin.server.security.domain.AdminUser',48),(166,'org.broadleafcommerce.openadmin.server.security.domain.AdminRole',48),(167,'org.broadleafcommerce.openadmin.server.security.domain.AdminPermission',48),(168,'org.broadleafcommerce.profile.core.domain.Customer',47),(169,'org.broadleafcommerce.core.order.domain.OrderItem',47),(170,'org.broadleafcommerce.common.RequestDTOImpl',47),(171,'org.broadleafcommerce.common.TimeDTO',47),(172,'org.broadleafcommerce.core.catalog.domain.Product',47),(173,'org.broadleafcommerce.cms.structure.domain.StructuredContentItemCriteria',47),(174,'org.broadleafcommerce.cms.structure.domain.StructuredContentFieldTemplate',47),(175,'org.broadleafcommerce.cms.file.domain.StaticAsset',40),(176,'org.broadleafcommerce.cms.file.domain.StaticAsset',41),(177,'org.broadleafcommerce.cms.url.domain.URLHandler',49),(178,'org.broadleafcommerce.cms.url.domain.URLHandler',50),(179,'org.broadleafcommerce.cms.url.domain.URLHandler',51),(180,'org.broadleafcommerce.cms.url.domain.URLHandler',52),(181,'org.broadleafcommerce.common.locale.domain.Locale',49),(182,'org.broadleafcommerce.common.locale.domain.Locale',50),(183,'org.broadleafcommerce.common.locale.domain.Locale',51),(184,'org.broadleafcommerce.common.locale.domain.Locale',52),(185,'org.broadleafcommerce.cms.url.domain.URLHandler',53),(186,'org.broadleafcommerce.common.locale.domain.Locale',53),(187,'org.broadleafcommerce.cms.page.domain.PageItemCriteria',22),(188,'org.broadleafcommerce.cms.page.domain.PageItemCriteria',23),(189,'org.broadleafcommerce.cms.page.domain.PageItemCriteria',24),(190,'org.broadleafcommerce.cms.page.domain.PageItemCriteria',25),(191,'org.broadleafcommerce.cms.page.domain.PageItemCriteria',45),(192,'org.broadleafcommerce.core.search.redirect.domain.SearchRedirect',54),(193,'org.broadleafcommerce.core.search.redirect.domain.SearchRedirect',55),(194,'org.broadleafcommerce.core.search.redirect.domain.SearchRedirect',56),(195,'org.broadleafcommerce.core.search.redirect.domain.SearchRedirect',57),(196,'org.broadleafcommerce.core.search.redirect.domain.SearchRedirect',58),(197,'org.broadleafcommerce.core.search.domain.SearchFacet',59),(198,'org.broadleafcommerce.core.search.domain.SearchFacet',60),(199,'org.broadleafcommerce.core.search.domain.SearchFacet',61),(200,'org.broadleafcommerce.core.search.domain.SearchFacet',62),(201,'org.broadleafcommerce.core.search.domain.SearchFacet',63),(202,'org.broadleafcommerce.core.search.domain.Field',59),(203,'org.broadleafcommerce.core.search.domain.Field',60),(204,'org.broadleafcommerce.core.search.domain.Field',61),(205,'org.broadleafcommerce.core.search.domain.Field',62),(206,'org.broadleafcommerce.core.search.domain.Field',63),(207,'org.broadleafcommerce.core.search.domain.CategorySearchFacet',59),(208,'org.broadleafcommerce.core.search.domain.CategorySearchFacet',60),(209,'org.broadleafcommerce.core.search.domain.CategorySearchFacet',61),(210,'org.broadleafcommerce.core.search.domain.CategorySearchFacet',62),(211,'org.broadleafcommerce.core.search.domain.CategorySearchFacet',63),(212,'org.broadleafcommerce.core.search.domain.SearchFacetRange',59),(213,'org.broadleafcommerce.core.search.domain.SearchFacetRange',60),(214,'org.broadleafcommerce.core.search.domain.SearchFacetRange',61),(215,'org.broadleafcommerce.core.search.domain.SearchFacetRange',62),(216,'org.broadleafcommerce.core.search.domain.SearchFacetRange',63),(217,'org.broadleafcommerce.core.search.domain.CategoryExcludedSearchFacet',59),(218,'org.broadleafcommerce.core.search.domain.CategoryExcludedSearchFacet',60),(219,'org.broadleafcommerce.core.search.domain.CategoryExcludedSearchFacet',61),(220,'org.broadleafcommerce.core.search.domain.CategoryExcludedSearchFacet',62),(221,'org.broadleafcommerce.core.search.domain.CategoryExcludedSearchFacet',63),(222,'org.broadleafcommerce.profile.core.domain.CustomerAttribute',19),(223,'org.broadleafcommerce.profile.core.domain.CustomerAttribute',21),(224,'org.broadleafcommerce.profile.core.domain.CustomerAttribute',44);
/*!40000 ALTER TABLE `BLC_ADMIN_PERMISSION_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_ADMIN_ROLE`
--

DROP TABLE IF EXISTS `BLC_ADMIN_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADMIN_ROLE` (
  `ADMIN_ROLE_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ADMIN_ROLE_ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_ADMIN_ROLE`
--

LOCK TABLES `BLC_ADMIN_ROLE` WRITE;
/*!40000 ALTER TABLE `BLC_ADMIN_ROLE` DISABLE KEYS */;
INSERT INTO `BLC_ADMIN_ROLE` VALUES (1,'Admin Master Access','ROLE_ADMIN'),(2,'Merchandiser','ROLE_MERCHANDISE_MANAGER'),(3,'Promotion Manager','ROLE_PROMOTION_MANAGER'),(4,'CSR','ROLE_CUSTOMER_SERVICE_REP'),(5,'CMS Editor','ROLE_CONTENT_EDITOR'),(6,'CMS Approver','ROLE_CONTENT_APPROVER');
/*!40000 ALTER TABLE `BLC_ADMIN_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_ADMIN_ROLE_PERMISSION_XREF`
--

DROP TABLE IF EXISTS `BLC_ADMIN_ROLE_PERMISSION_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADMIN_ROLE_PERMISSION_XREF` (
  `ADMIN_ROLE_ID` bigint(20) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ID`,`ADMIN_ROLE_ID`),
  KEY `FK4A819D985F43AAD8` (`ADMIN_ROLE_ID`),
  KEY `FK4A819D98E88B7D38` (`ADMIN_PERMISSION_ID`),
  CONSTRAINT `FK4A819D98E88B7D38` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `BLC_ADMIN_PERMISSION` (`ADMIN_PERMISSION_ID`),
  CONSTRAINT `FK4A819D985F43AAD8` FOREIGN KEY (`ADMIN_ROLE_ID`) REFERENCES `BLC_ADMIN_ROLE` (`ADMIN_ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_ADMIN_ROLE_PERMISSION_XREF`
--

LOCK TABLES `BLC_ADMIN_ROLE_PERMISSION_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_ADMIN_ROLE_PERMISSION_XREF` DISABLE KEYS */;
INSERT INTO `BLC_ADMIN_ROLE_PERMISSION_XREF` VALUES (1,1),(1,34),(1,35),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,53),(1,58),(1,63),(2,1),(2,40),(2,41),(3,1),(3,42),(4,1),(4,43),(4,44),(5,1),(5,34),(5,45),(5,46),(5,47),(5,48),(6,1),(6,34),(6,35),(6,45),(6,46),(6,47),(6,48);
/*!40000 ALTER TABLE `BLC_ADMIN_ROLE_PERMISSION_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_ADMIN_SECTION`
--

DROP TABLE IF EXISTS `BLC_ADMIN_SECTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADMIN_SECTION` (
  `ADMIN_SECTION_ID` bigint(20) NOT NULL,
  `DISPLAY_CONTROLLER` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `SECTION_KEY` varchar(255) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `USE_DEFAULT_HANDLER` bit(1) NOT NULL,
  `ADMIN_MODULE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_SECTION_ID`),
  UNIQUE KEY `SECTION_KEY` (`SECTION_KEY`),
  KEY `ADMINSECTION_MODULE_INDEX` (`ADMIN_MODULE_ID`),
  KEY `ADMINSECTION_NAME_INDEX` (`NAME`),
  KEY `FK7EA7D92FB1A18498` (`ADMIN_MODULE_ID`),
  CONSTRAINT `FK7EA7D92FB1A18498` FOREIGN KEY (`ADMIN_MODULE_ID`) REFERENCES `BLC_ADMIN_MODULE` (`ADMIN_MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_ADMIN_SECTION`
--

LOCK TABLES `BLC_ADMIN_SECTION` WRITE;
/*!40000 ALTER TABLE `BLC_ADMIN_SECTION` DISABLE KEYS */;
INSERT INTO `BLC_ADMIN_SECTION` VALUES (1,NULL,'Category','Category','/category','',1),(2,NULL,'Product','Product','/product','',1),(3,NULL,'Product Options','ProductOptions','/product-options','',1),(4,NULL,'Offer','Offer','/offer','',1),(5,NULL,'Pages','Pages','/pages','',2),(6,NULL,'Assets','Assets','/assets','',2),(7,NULL,'Structured Content','StructuredContent','/structured-content','',2),(8,NULL,'Redirect URL','RedirectURL','/redirect-url','',2),(9,NULL,'Order','Order','/order','',3),(10,NULL,'Customer','Customer','/customer','',3),(11,NULL,'User Management','UserManagement','/user-management','',4),(12,NULL,'Role Management','RoleManagement','/role-management','',4),(13,NULL,'Permission Management','PermissionManagement','/permission-management','',4);
/*!40000 ALTER TABLE `BLC_ADMIN_SECTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_ADMIN_SEC_PERM_XREF`
--

DROP TABLE IF EXISTS `BLC_ADMIN_SEC_PERM_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADMIN_SEC_PERM_XREF` (
  `ADMIN_SECTION_ID` bigint(20) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  KEY `FK5E832966E88B7D38` (`ADMIN_PERMISSION_ID`),
  KEY `FK5E8329663AF7F0FC` (`ADMIN_SECTION_ID`),
  CONSTRAINT `FK5E8329663AF7F0FC` FOREIGN KEY (`ADMIN_SECTION_ID`) REFERENCES `BLC_ADMIN_SECTION` (`ADMIN_SECTION_ID`),
  CONSTRAINT `FK5E832966E88B7D38` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `BLC_ADMIN_PERMISSION` (`ADMIN_PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_ADMIN_SEC_PERM_XREF`
--

LOCK TABLES `BLC_ADMIN_SEC_PERM_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_ADMIN_SEC_PERM_XREF` DISABLE KEYS */;
INSERT INTO `BLC_ADMIN_SEC_PERM_XREF` VALUES (1,2),(1,3),(1,4),(1,5),(2,6),(2,7),(2,8),(2,9),(3,6),(3,7),(3,8),(3,9),(4,10),(4,11),(4,12),(4,13),(5,22),(5,23),(5,24),(5,25),(6,26),(6,27),(6,28),(6,29),(7,30),(7,31),(7,32),(7,33),(8,49),(8,50),(8,51),(8,52),(9,14),(9,15),(9,16),(9,17),(10,18),(10,19),(10,20),(10,21),(11,36),(11,37),(11,38),(11,39),(12,36),(12,37),(12,38),(12,39),(13,36),(13,37),(13,38),(13,39);
/*!40000 ALTER TABLE `BLC_ADMIN_SEC_PERM_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_ADMIN_USER_PERMISSION_XREF`
--

DROP TABLE IF EXISTS `BLC_ADMIN_USER_PERMISSION_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADMIN_USER_PERMISSION_XREF` (
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ID`,`ADMIN_USER_ID`),
  KEY `FKF0B3BEED46EBC38` (`ADMIN_USER_ID`),
  KEY `FKF0B3BEEDE88B7D38` (`ADMIN_PERMISSION_ID`),
  CONSTRAINT `FKF0B3BEEDE88B7D38` FOREIGN KEY (`ADMIN_PERMISSION_ID`) REFERENCES `BLC_ADMIN_PERMISSION` (`ADMIN_PERMISSION_ID`),
  CONSTRAINT `FKF0B3BEED46EBC38` FOREIGN KEY (`ADMIN_USER_ID`) REFERENCES `BLC_ADMIN_USER` (`ADMIN_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_ADMIN_USER_PERMISSION_XREF`
--

LOCK TABLES `BLC_ADMIN_USER_PERMISSION_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_ADMIN_USER_PERMISSION_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ADMIN_USER_PERMISSION_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_ADMIN_USER_ROLE_XREF`
--

DROP TABLE IF EXISTS `BLC_ADMIN_USER_ROLE_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADMIN_USER_ROLE_XREF` (
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `ADMIN_ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_ROLE_ID`,`ADMIN_USER_ID`),
  KEY `FKFFD33A265F43AAD8` (`ADMIN_ROLE_ID`),
  KEY `FKFFD33A2646EBC38` (`ADMIN_USER_ID`),
  CONSTRAINT `FKFFD33A2646EBC38` FOREIGN KEY (`ADMIN_USER_ID`) REFERENCES `BLC_ADMIN_USER` (`ADMIN_USER_ID`),
  CONSTRAINT `FKFFD33A265F43AAD8` FOREIGN KEY (`ADMIN_ROLE_ID`) REFERENCES `BLC_ADMIN_ROLE` (`ADMIN_ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_ADMIN_USER_ROLE_XREF`
--

LOCK TABLES `BLC_ADMIN_USER_ROLE_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_ADMIN_USER_ROLE_XREF` DISABLE KEYS */;
INSERT INTO `BLC_ADMIN_USER_ROLE_XREF` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6);
/*!40000 ALTER TABLE `BLC_ADMIN_USER_ROLE_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_ADMIN_USER_SANDBOX`
--

DROP TABLE IF EXISTS `BLC_ADMIN_USER_SANDBOX`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ADMIN_USER_SANDBOX` (
  `SANDBOX_ID` bigint(20) DEFAULT NULL,
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADMIN_USER_ID`),
  KEY `FKD0A97E0946EBC38` (`ADMIN_USER_ID`),
  KEY `FKD0A97E09579FE59D` (`SANDBOX_ID`),
  CONSTRAINT `FKD0A97E09579FE59D` FOREIGN KEY (`SANDBOX_ID`) REFERENCES `BLC_SANDBOX` (`SANDBOX_ID`),
  CONSTRAINT `FKD0A97E0946EBC38` FOREIGN KEY (`ADMIN_USER_ID`) REFERENCES `BLC_ADMIN_USER` (`ADMIN_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_ADMIN_USER_SANDBOX`
--

LOCK TABLES `BLC_ADMIN_USER_SANDBOX` WRITE;
/*!40000 ALTER TABLE `BLC_ADMIN_USER_SANDBOX` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ADMIN_USER_SANDBOX` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_AMOUNT_ITEM`
--

DROP TABLE IF EXISTS `BLC_AMOUNT_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_AMOUNT_ITEM` (
  `AMOUNT_ITEM_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `QUANTITY` bigint(20) NOT NULL,
  `SHORT_DESCRIPTION` varchar(255) DEFAULT NULL,
  `SYSTEM_ID` varchar(255) DEFAULT NULL,
  `UNIT_PRICE` decimal(19,5) NOT NULL,
  `PAYMENT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AMOUNT_ITEM_ID`),
  KEY `SHORT_DESCRIPTION_INDEX` (`SHORT_DESCRIPTION`),
  KEY `AMOUNTITEM_PAYMENTINFO_INDEX` (`PAYMENT_ID`),
  KEY `FKB98530944BC71D98` (`PAYMENT_ID`),
  CONSTRAINT `FKB98530944BC71D98` FOREIGN KEY (`PAYMENT_ID`) REFERENCES `BLC_ORDER_PAYMENT` (`PAYMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_AMOUNT_ITEM`
--

LOCK TABLES `BLC_AMOUNT_ITEM` WRITE;
/*!40000 ALTER TABLE `BLC_AMOUNT_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_AMOUNT_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_ASSET_DESC_MAP`
--

DROP TABLE IF EXISTS `BLC_ASSET_DESC_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ASSET_DESC_MAP` (
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  `STATIC_ASSET_DESC_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`STATIC_ASSET_ID`,`MAP_KEY`),
  KEY `FKE886BAE367F70B63` (`STATIC_ASSET_ID`),
  KEY `FKE886BAE3E2BA0C9D` (`STATIC_ASSET_DESC_ID`),
  CONSTRAINT `FKE886BAE3E2BA0C9D` FOREIGN KEY (`STATIC_ASSET_DESC_ID`) REFERENCES `BLC_STATIC_ASSET_DESC` (`STATIC_ASSET_DESC_ID`),
  CONSTRAINT `FKE886BAE367F70B63` FOREIGN KEY (`STATIC_ASSET_ID`) REFERENCES `BLC_STATIC_ASSET` (`STATIC_ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_ASSET_DESC_MAP`
--

LOCK TABLES `BLC_ASSET_DESC_MAP` WRITE;
/*!40000 ALTER TABLE `BLC_ASSET_DESC_MAP` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ASSET_DESC_MAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_BUNDLE_ORDER_ITEM`
--

DROP TABLE IF EXISTS `BLC_BUNDLE_ORDER_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_BUNDLE_ORDER_ITEM` (
  `BASE_RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `BASE_SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `PRODUCT_BUNDLE_ID` bigint(20) DEFAULT NULL,
  `SKU_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `FK489703DB9AF166DF` (`ORDER_ITEM_ID`),
  KEY `FK489703DBB78C9977` (`SKU_ID`),
  KEY `FK489703DBCCF29B96` (`PRODUCT_BUNDLE_ID`),
  CONSTRAINT `FK489703DBCCF29B96` FOREIGN KEY (`PRODUCT_BUNDLE_ID`) REFERENCES `BLC_PRODUCT_BUNDLE` (`PRODUCT_ID`),
  CONSTRAINT `FK489703DB9AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_ORDER_ITEM` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK489703DBB78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `BLC_SKU` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_BUNDLE_ORDER_ITEM`
--

LOCK TABLES `BLC_BUNDLE_ORDER_ITEM` WRITE;
/*!40000 ALTER TABLE `BLC_BUNDLE_ORDER_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_BUNDLE_ORDER_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_BUND_ITEM_FEE_PRICE`
--

DROP TABLE IF EXISTS `BLC_BUND_ITEM_FEE_PRICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_BUND_ITEM_FEE_PRICE` (
  `BUND_ITEM_FEE_PRICE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `IS_TAXABLE` bit(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REPORTING_CODE` varchar(255) DEFAULT NULL,
  `BUND_ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`BUND_ITEM_FEE_PRICE_ID`),
  KEY `FK14267A943FC68307` (`BUND_ORDER_ITEM_ID`),
  CONSTRAINT `FK14267A943FC68307` FOREIGN KEY (`BUND_ORDER_ITEM_ID`) REFERENCES `BLC_BUNDLE_ORDER_ITEM` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_BUND_ITEM_FEE_PRICE`
--

LOCK TABLES `BLC_BUND_ITEM_FEE_PRICE` WRITE;
/*!40000 ALTER TABLE `BLC_BUND_ITEM_FEE_PRICE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_BUND_ITEM_FEE_PRICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CANDIDATE_FG_OFFER`
--

DROP TABLE IF EXISTS `BLC_CANDIDATE_FG_OFFER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CANDIDATE_FG_OFFER` (
  `CANDIDATE_FG_OFFER_ID` bigint(20) NOT NULL,
  `DISCOUNTED_PRICE` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CANDIDATE_FG_OFFER_ID`),
  KEY `CANDIDATE_FG_INDEX` (`FULFILLMENT_GROUP_ID`),
  KEY `CANDIDATE_FGOFFER_INDEX` (`OFFER_ID`),
  KEY `FKCE78560D5F3FAF4` (`OFFER_ID`),
  KEY `FKCE785605028DC55` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FKCE785605028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `BLC_FULFILLMENT_GROUP` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FKCE78560D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CANDIDATE_FG_OFFER`
--

LOCK TABLES `BLC_CANDIDATE_FG_OFFER` WRITE;
/*!40000 ALTER TABLE `BLC_CANDIDATE_FG_OFFER` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CANDIDATE_FG_OFFER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CANDIDATE_ITEM_OFFER`
--

DROP TABLE IF EXISTS `BLC_CANDIDATE_ITEM_OFFER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CANDIDATE_ITEM_OFFER` (
  `CANDIDATE_ITEM_OFFER_ID` bigint(20) NOT NULL,
  `DISCOUNTED_PRICE` decimal(19,5) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CANDIDATE_ITEM_OFFER_ID`),
  KEY `CANDIDATE_ITEMOFFER_INDEX` (`OFFER_ID`),
  KEY `CANDIDATE_ITEM_INDEX` (`ORDER_ITEM_ID`),
  KEY `FK9EEE9B29AF166DF` (`ORDER_ITEM_ID`),
  KEY `FK9EEE9B2D5F3FAF4` (`OFFER_ID`),
  CONSTRAINT `FK9EEE9B2D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`),
  CONSTRAINT `FK9EEE9B29AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_ORDER_ITEM` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CANDIDATE_ITEM_OFFER`
--

LOCK TABLES `BLC_CANDIDATE_ITEM_OFFER` WRITE;
/*!40000 ALTER TABLE `BLC_CANDIDATE_ITEM_OFFER` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CANDIDATE_ITEM_OFFER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CANDIDATE_ORDER_OFFER`
--

DROP TABLE IF EXISTS `BLC_CANDIDATE_ORDER_OFFER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CANDIDATE_ORDER_OFFER` (
  `CANDIDATE_ORDER_OFFER_ID` bigint(20) NOT NULL,
  `DISCOUNTED_PRICE` decimal(19,5) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CANDIDATE_ORDER_OFFER_ID`),
  KEY `CANDIDATE_ORDEROFFER_INDEX` (`OFFER_ID`),
  KEY `CANDIDATE_ORDER_INDEX` (`ORDER_ID`),
  KEY `FK61852289D5F3FAF4` (`OFFER_ID`),
  KEY `FK6185228989FE8A02` (`ORDER_ID`),
  CONSTRAINT `FK6185228989FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `BLC_ORDER` (`ORDER_ID`),
  CONSTRAINT `FK61852289D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CANDIDATE_ORDER_OFFER`
--

LOCK TABLES `BLC_CANDIDATE_ORDER_OFFER` WRITE;
/*!40000 ALTER TABLE `BLC_CANDIDATE_ORDER_OFFER` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CANDIDATE_ORDER_OFFER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CATEGORY`
--

DROP TABLE IF EXISTS `BLC_CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CATEGORY` (
  `CATEGORY_ID` bigint(20) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `DISPLAY_TEMPLATE` varchar(255) DEFAULT NULL,
  `FULFILLMENT_TYPE` varchar(255) DEFAULT NULL,
  `INVENTORY_TYPE` varchar(255) DEFAULT NULL,
  `LONG_DESCRIPTION` longtext,
  `NAME` varchar(255) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `URL_KEY` varchar(255) DEFAULT NULL,
  `DEFAULT_PARENT_CATEGORY_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`),
  KEY `CATEGORY_NAME_INDEX` (`NAME`),
  KEY `CATEGORY_URLKEY_INDEX` (`URL_KEY`),
  KEY `CATEGORY_PARENT_INDEX` (`DEFAULT_PARENT_CATEGORY_ID`),
  KEY `FK55F82D44B177E6` (`DEFAULT_PARENT_CATEGORY_ID`),
  CONSTRAINT `FK55F82D44B177E6` FOREIGN KEY (`DEFAULT_PARENT_CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CATEGORY`
--

LOCK TABLES `BLC_CATEGORY` WRITE;
/*!40000 ALTER TABLE `BLC_CATEGORY` DISABLE KEYS */;
INSERT INTO `BLC_CATEGORY` VALUES (1,NULL,'2013-05-11 11:42:21',NULL,'Root',NULL,NULL,NULL,NULL,'Root',NULL,NULL,NULL),(2,NULL,'2013-05-11 11:42:21',NULL,'Primary Nav',NULL,NULL,NULL,NULL,'Primary Nav',NULL,NULL,1),(2001,NULL,'2013-05-11 11:42:21','N','Home','layout/home',NULL,NULL,NULL,'Home','/',NULL,2),(2002,NULL,'2013-05-11 11:42:21','N','Hot Sauces',NULL,NULL,NULL,NULL,'Hot Sauces','/hot-sauces',NULL,2),(2003,NULL,'2013-05-11 11:42:21','N','Merchandise',NULL,NULL,NULL,NULL,'Merchandise','/merchandise',NULL,2),(2004,NULL,'2013-05-11 11:42:21','N','Clearance',NULL,NULL,NULL,NULL,'Clearance','/clearance',NULL,2),(2005,NULL,'2013-05-11 11:42:21','N','New to Hot Sauce?',NULL,NULL,NULL,NULL,'New to Hot Sauce?','/new-to-hot-sauce',NULL,2),(2006,NULL,'2013-05-11 11:42:21','N','FAQs',NULL,NULL,NULL,NULL,'FAQs','/faq',NULL,2);
/*!40000 ALTER TABLE `BLC_CATEGORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CATEGORY_ATTRIBUTE`
--

DROP TABLE IF EXISTS `BLC_CATEGORY_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CATEGORY_ATTRIBUTE` (
  `CATEGORY_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `SEARCHABLE` bit(1) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CATEGORY_ATTRIBUTE_ID`),
  KEY `CATEGORYATTRIBUTE_INDEX` (`CATEGORY_ID`),
  KEY `CATEGORYATTRIBUTE_NAME_INDEX` (`NAME`),
  KEY `FK4E441D4115D1A13D` (`CATEGORY_ID`),
  CONSTRAINT `FK4E441D4115D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CATEGORY_ATTRIBUTE`
--

LOCK TABLES `BLC_CATEGORY_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `BLC_CATEGORY_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CATEGORY_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CATEGORY_IMAGE`
--

DROP TABLE IF EXISTS `BLC_CATEGORY_IMAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CATEGORY_IMAGE` (
  `CATEGORY_ID` bigint(20) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `NAME` varchar(5) NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`,`NAME`),
  KEY `FK27CF3E8015D1A13D` (`CATEGORY_ID`),
  CONSTRAINT `FK27CF3E8015D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CATEGORY_IMAGE`
--

LOCK TABLES `BLC_CATEGORY_IMAGE` WRITE;
/*!40000 ALTER TABLE `BLC_CATEGORY_IMAGE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CATEGORY_IMAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CATEGORY_MEDIA_MAP`
--

DROP TABLE IF EXISTS `BLC_CATEGORY_MEDIA_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CATEGORY_MEDIA_MAP` (
  `BLC_CATEGORY_CATEGORY_ID` bigint(20) NOT NULL,
  `MEDIA_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_CATEGORY_CATEGORY_ID`,`MAP_KEY`),
  KEY `FKCD24B106D786CEA2` (`BLC_CATEGORY_CATEGORY_ID`),
  KEY `FKCD24B10619D1156C` (`MEDIA_ID`),
  CONSTRAINT `FKCD24B10619D1156C` FOREIGN KEY (`MEDIA_ID`) REFERENCES `BLC_MEDIA` (`MEDIA_ID`),
  CONSTRAINT `FKCD24B106D786CEA2` FOREIGN KEY (`BLC_CATEGORY_CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CATEGORY_MEDIA_MAP`
--

LOCK TABLES `BLC_CATEGORY_MEDIA_MAP` WRITE;
/*!40000 ALTER TABLE `BLC_CATEGORY_MEDIA_MAP` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CATEGORY_MEDIA_MAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CATEGORY_PRODUCT_XREF`
--

DROP TABLE IF EXISTS `BLC_CATEGORY_PRODUCT_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CATEGORY_PRODUCT_XREF` (
  `DISPLAY_ORDER` bigint(20) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) NOT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`,`PRODUCT_ID`),
  KEY `FK635EB1A615D1A13D` (`CATEGORY_ID`),
  KEY `FK635EB1A65F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FK635EB1A65F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`),
  CONSTRAINT `FK635EB1A615D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CATEGORY_PRODUCT_XREF`
--

LOCK TABLES `BLC_CATEGORY_PRODUCT_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_CATEGORY_PRODUCT_XREF` DISABLE KEYS */;
INSERT INTO `BLC_CATEGORY_PRODUCT_XREF` VALUES (1,2001,3),(2,2001,6),(3,2001,9),(4,2001,12),(1,2002,1),(2,2002,2),(3,2002,3),(4,2002,4),(5,2002,5),(6,2002,6),(7,2002,7),(8,2002,8),(9,2002,9),(10,2002,10),(11,2002,11),(12,2002,12),(13,2002,13),(14,2002,14),(15,2002,15),(16,2002,16),(17,2002,17),(18,2002,18),(19,2002,19),(1,2003,100),(2,2003,200),(3,2003,300),(4,2003,400),(5,2003,500),(6,2003,600),(1,2004,7),(2,2004,8),(3,2004,10),(4,2004,11),(5,2004,18);
/*!40000 ALTER TABLE `BLC_CATEGORY_PRODUCT_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CATEGORY_XREF`
--

DROP TABLE IF EXISTS `BLC_CATEGORY_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CATEGORY_XREF` (
  `DISPLAY_ORDER` bigint(20) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) NOT NULL,
  `SUB_CATEGORY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`,`SUB_CATEGORY_ID`),
  KEY `FKE8897336D6D45DBE` (`SUB_CATEGORY_ID`),
  KEY `FKE889733615D1A13D` (`CATEGORY_ID`),
  CONSTRAINT `FKE889733615D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`),
  CONSTRAINT `FKE8897336D6D45DBE` FOREIGN KEY (`SUB_CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CATEGORY_XREF`
--

LOCK TABLES `BLC_CATEGORY_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_CATEGORY_XREF` DISABLE KEYS */;
INSERT INTO `BLC_CATEGORY_XREF` VALUES (1,1,2),(1,2,2001),(2,2,2002),(3,2,2003),(4,2,2004),(5,2,2005),(6,2,2006);
/*!40000 ALTER TABLE `BLC_CATEGORY_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CAT_SEARCH_FACET_EXCL_XREF`
--

DROP TABLE IF EXISTS `BLC_CAT_SEARCH_FACET_EXCL_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CAT_SEARCH_FACET_EXCL_XREF` (
  `CAT_EXCL_SEARCH_FACET_ID` bigint(20) NOT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `SEARCH_FACET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CAT_EXCL_SEARCH_FACET_ID`),
  KEY `FK8361EF4EB96B1C93` (`SEARCH_FACET_ID`),
  KEY `FK8361EF4E15D1A13D` (`CATEGORY_ID`),
  CONSTRAINT `FK8361EF4E15D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`),
  CONSTRAINT `FK8361EF4EB96B1C93` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `BLC_SEARCH_FACET` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CAT_SEARCH_FACET_EXCL_XREF`
--

LOCK TABLES `BLC_CAT_SEARCH_FACET_EXCL_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_CAT_SEARCH_FACET_EXCL_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CAT_SEARCH_FACET_EXCL_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CAT_SEARCH_FACET_XREF`
--

DROP TABLE IF EXISTS `BLC_CAT_SEARCH_FACET_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CAT_SEARCH_FACET_XREF` (
  `CATEGORY_SEARCH_FACET_ID` bigint(20) NOT NULL,
  `SEQUENCE` bigint(20) NOT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `SEARCH_FACET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_SEARCH_FACET_ID`),
  KEY `FK32210EEBB96B1C93` (`SEARCH_FACET_ID`),
  KEY `FK32210EEB15D1A13D` (`CATEGORY_ID`),
  CONSTRAINT `FK32210EEB15D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`),
  CONSTRAINT `FK32210EEBB96B1C93` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `BLC_SEARCH_FACET` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CAT_SEARCH_FACET_XREF`
--

LOCK TABLES `BLC_CAT_SEARCH_FACET_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_CAT_SEARCH_FACET_XREF` DISABLE KEYS */;
INSERT INTO `BLC_CAT_SEARCH_FACET_XREF` VALUES (1,1,2002,1),(2,2,2002,2),(3,3,1,3);
/*!40000 ALTER TABLE `BLC_CAT_SEARCH_FACET_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CHALLENGE_QUESTION`
--

DROP TABLE IF EXISTS `BLC_CHALLENGE_QUESTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CHALLENGE_QUESTION` (
  `QUESTION_ID` bigint(20) NOT NULL,
  `QUESTION` varchar(255) NOT NULL,
  PRIMARY KEY (`QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CHALLENGE_QUESTION`
--

LOCK TABLES `BLC_CHALLENGE_QUESTION` WRITE;
/*!40000 ALTER TABLE `BLC_CHALLENGE_QUESTION` DISABLE KEYS */;
INSERT INTO `BLC_CHALLENGE_QUESTION` VALUES (1,'What is your favorite sports team?'),(2,'What was your high school name?'),(3,'What was your childhood nickname?'),(4,'What street did you live on in third grade?'),(5,'What is your oldest sibling\'s middle name?'),(6,'What school did you attend for sixth grade?'),(7,'Where does your nearest sibling live?'),(8,'What is your youngest brother\'s birthday?'),(9,'In what city or town was your first job?');
/*!40000 ALTER TABLE `BLC_CHALLENGE_QUESTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CODE_TYPES`
--

DROP TABLE IF EXISTS `BLC_CODE_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CODE_TYPES` (
  `CODE_ID` bigint(20) NOT NULL,
  `CODE_TYPE` varchar(255) NOT NULL,
  `CODE_DESC` varchar(255) DEFAULT NULL,
  `CODE_KEY` varchar(255) NOT NULL,
  `MODIFIABLE` char(1) DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CODE_TYPES`
--

LOCK TABLES `BLC_CODE_TYPES` WRITE;
/*!40000 ALTER TABLE `BLC_CODE_TYPES` DISABLE KEYS */;
INSERT INTO `BLC_CODE_TYPES` VALUES (1,'CATEGORY_MEDIA','Large Category Media','large','N'),(2,'CATEGORY_MEDIA','Small Category Media','small','N'),(3,'PRODUCT_MEDIA','Large Product Media','large','N'),(4,'PRODUCT_MEDIA','Small Product Media','small','N');
/*!40000 ALTER TABLE `BLC_CODE_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CONTENT_DETAILS`
--

DROP TABLE IF EXISTS `BLC_CONTENT_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CONTENT_DETAILS` (
  `CONTENT_HASH` varchar(255) DEFAULT NULL,
  `XML_CONTENT` longtext,
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKE7944136158B8591` (`ID`),
  CONSTRAINT `FKE7944136158B8591` FOREIGN KEY (`ID`) REFERENCES `BLC_CONTENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CONTENT_DETAILS`
--

LOCK TABLES `BLC_CONTENT_DETAILS` WRITE;
/*!40000 ALTER TABLE `BLC_CONTENT_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CONTENT_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_COUNTRY`
--

DROP TABLE IF EXISTS `BLC_COUNTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_COUNTRY` (
  `ABBREVIATION` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ABBREVIATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_COUNTRY`
--

LOCK TABLES `BLC_COUNTRY` WRITE;
/*!40000 ALTER TABLE `BLC_COUNTRY` DISABLE KEYS */;
INSERT INTO `BLC_COUNTRY` VALUES ('CA','Canada'),('MX','Mexico'),('US','United States');
/*!40000 ALTER TABLE `BLC_COUNTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CURRENCY`
--

DROP TABLE IF EXISTS `BLC_CURRENCY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CURRENCY` (
  `CURRENCY_CODE` varchar(255) NOT NULL,
  `DEFAULT_FLAG` bit(1) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CURRENCY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CURRENCY`
--

LOCK TABLES `BLC_CURRENCY` WRITE;
/*!40000 ALTER TABLE `BLC_CURRENCY` DISABLE KEYS */;
INSERT INTO `BLC_CURRENCY` VALUES ('USD','','US Dollar');
/*!40000 ALTER TABLE `BLC_CURRENCY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CUSTOMER`
--

DROP TABLE IF EXISTS `BLC_CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CUSTOMER` (
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `CHALLENGE_ANSWER` varchar(255) DEFAULT NULL,
  `DEACTIVATED` bit(1) DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PASSWORD_CHANGE_REQUIRED` bit(1) DEFAULT NULL,
  `RECEIVE_EMAIL` bit(1) DEFAULT NULL,
  `IS_REGISTERED` bit(1) DEFAULT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL,
  `CHALLENGE_QUESTION_ID` bigint(20) DEFAULT NULL,
  `LOCALE_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`),
  UNIQUE KEY `USER_NAME` (`USER_NAME`),
  KEY `CUSTOMER_CHALLENGE_INDEX` (`CHALLENGE_QUESTION_ID`),
  KEY `CUSTOMER_EMAIL_INDEX` (`EMAIL_ADDRESS`),
  KEY `FK7716F024A1E1C128` (`LOCALE_CODE`),
  KEY `FK7716F0241422B204` (`CHALLENGE_QUESTION_ID`),
  CONSTRAINT `FK7716F0241422B204` FOREIGN KEY (`CHALLENGE_QUESTION_ID`) REFERENCES `BLC_CHALLENGE_QUESTION` (`QUESTION_ID`),
  CONSTRAINT `FK7716F024A1E1C128` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `BLC_LOCALE` (`LOCALE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CUSTOMER`
--

LOCK TABLES `BLC_CUSTOMER` WRITE;
/*!40000 ALTER TABLE `BLC_CUSTOMER` DISABLE KEYS */;
INSERT INTO `BLC_CUSTOMER` VALUES (100,100,'2013-05-11 11:44:14',NULL,NULL,NULL,'\0','Jonnyfarago@live.ca','Jonny','Farago','testing','\0','','','Jonnyfarago@live.ca',NULL,NULL);
/*!40000 ALTER TABLE `BLC_CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CUSTOMER_ADDRESS`
--

DROP TABLE IF EXISTS `BLC_CUSTOMER_ADDRESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CUSTOMER_ADDRESS` (
  `CUSTOMER_ADDRESS_ID` bigint(20) NOT NULL,
  `ADDRESS_NAME` varchar(255) DEFAULT NULL,
  `ADDRESS_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ADDRESS_ID`),
  UNIQUE KEY `CUSTOMER_ID` (`CUSTOMER_ID`,`ADDRESS_NAME`),
  KEY `CUSTOMERADDRESS_ADDRESS_INDEX` (`ADDRESS_ID`),
  KEY `FK75B95AB9C13085DD` (`ADDRESS_ID`),
  KEY `FK75B95AB97470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FK75B95AB97470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `BLC_CUSTOMER` (`CUSTOMER_ID`),
  CONSTRAINT `FK75B95AB9C13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `BLC_ADDRESS` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CUSTOMER_ADDRESS`
--

LOCK TABLES `BLC_CUSTOMER_ADDRESS` WRITE;
/*!40000 ALTER TABLE `BLC_CUSTOMER_ADDRESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CUSTOMER_ADDRESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CUSTOMER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `BLC_CUSTOMER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CUSTOMER_ATTRIBUTE` (
  `CUSTOMER_ATTR_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ATTR_ID`),
  KEY `FKB974C8217470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FKB974C8217470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `BLC_CUSTOMER` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CUSTOMER_ATTRIBUTE`
--

LOCK TABLES `BLC_CUSTOMER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `BLC_CUSTOMER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CUSTOMER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CUSTOMER_OFFER_XREF`
--

DROP TABLE IF EXISTS `BLC_CUSTOMER_OFFER_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CUSTOMER_OFFER_XREF` (
  `CUSTOMER_OFFER_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_OFFER_ID`),
  KEY `CUSTOFFER_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `CUSTOFFER_OFFER_INDEX` (`OFFER_ID`),
  KEY `FK685E8039D5F3FAF4` (`OFFER_ID`),
  KEY `FK685E80397470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FK685E80397470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `BLC_CUSTOMER` (`CUSTOMER_ID`),
  CONSTRAINT `FK685E8039D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CUSTOMER_OFFER_XREF`
--

LOCK TABLES `BLC_CUSTOMER_OFFER_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_CUSTOMER_OFFER_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CUSTOMER_OFFER_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CUSTOMER_PASSWORD_TOKEN`
--

DROP TABLE IF EXISTS `BLC_CUSTOMER_PASSWORD_TOKEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CUSTOMER_PASSWORD_TOKEN` (
  `PASSWORD_TOKEN` varchar(255) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `TOKEN_USED_DATE` datetime DEFAULT NULL,
  `TOKEN_USED_FLAG` bit(1) NOT NULL,
  PRIMARY KEY (`PASSWORD_TOKEN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CUSTOMER_PASSWORD_TOKEN`
--

LOCK TABLES `BLC_CUSTOMER_PASSWORD_TOKEN` WRITE;
/*!40000 ALTER TABLE `BLC_CUSTOMER_PASSWORD_TOKEN` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CUSTOMER_PASSWORD_TOKEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CUSTOMER_PAYMENT`
--

DROP TABLE IF EXISTS `BLC_CUSTOMER_PAYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CUSTOMER_PAYMENT` (
  `CUSTOMER_PAYMENT_ID` bigint(20) NOT NULL,
  `PAYMENT_TOKEN` varchar(255) DEFAULT NULL,
  `ADDRESS_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_PAYMENT_ID`),
  UNIQUE KEY `CUSTOMER_ID` (`CUSTOMER_ID`,`PAYMENT_TOKEN`),
  KEY `CUSTOMERPAYMENT_ADDRESS_INDEX` (`ADDRESS_ID`),
  KEY `FK8B3DF0CBC13085DD` (`ADDRESS_ID`),
  KEY `FK8B3DF0CB7470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FK8B3DF0CB7470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `BLC_CUSTOMER` (`CUSTOMER_ID`),
  CONSTRAINT `FK8B3DF0CBC13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `BLC_ADDRESS` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CUSTOMER_PAYMENT`
--

LOCK TABLES `BLC_CUSTOMER_PAYMENT` WRITE;
/*!40000 ALTER TABLE `BLC_CUSTOMER_PAYMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CUSTOMER_PAYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CUSTOMER_PAYMENT_FIELDS`
--

DROP TABLE IF EXISTS `BLC_CUSTOMER_PAYMENT_FIELDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CUSTOMER_PAYMENT_FIELDS` (
  `CUSTOMER_PAYMENT_ID` bigint(20) NOT NULL,
  `FIELD_VALUE` varchar(255) DEFAULT NULL,
  `FIELD_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CUSTOMER_PAYMENT_ID`,`FIELD_NAME`),
  KEY `FK5CCB14ADCA0B98E0` (`CUSTOMER_PAYMENT_ID`),
  CONSTRAINT `FK5CCB14ADCA0B98E0` FOREIGN KEY (`CUSTOMER_PAYMENT_ID`) REFERENCES `BLC_CUSTOMER_PAYMENT` (`CUSTOMER_PAYMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CUSTOMER_PAYMENT_FIELDS`
--

LOCK TABLES `BLC_CUSTOMER_PAYMENT_FIELDS` WRITE;
/*!40000 ALTER TABLE `BLC_CUSTOMER_PAYMENT_FIELDS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CUSTOMER_PAYMENT_FIELDS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CUSTOMER_PHONE`
--

DROP TABLE IF EXISTS `BLC_CUSTOMER_PHONE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CUSTOMER_PHONE` (
  `CUSTOMER_PHONE_ID` bigint(20) NOT NULL,
  `PHONE_NAME` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `PHONE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_PHONE_ID`),
  UNIQUE KEY `CUSTOMER_ID` (`CUSTOMER_ID`,`PHONE_NAME`),
  KEY `CUSTPHONE_PHONE_INDEX` (`PHONE_ID`),
  KEY `FK3D28ED73D894CB5D` (`PHONE_ID`),
  KEY `FK3D28ED737470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FK3D28ED737470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `BLC_CUSTOMER` (`CUSTOMER_ID`),
  CONSTRAINT `FK3D28ED73D894CB5D` FOREIGN KEY (`PHONE_ID`) REFERENCES `BLC_PHONE` (`PHONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CUSTOMER_PHONE`
--

LOCK TABLES `BLC_CUSTOMER_PHONE` WRITE;
/*!40000 ALTER TABLE `BLC_CUSTOMER_PHONE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_CUSTOMER_PHONE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_CUSTOMER_ROLE`
--

DROP TABLE IF EXISTS `BLC_CUSTOMER_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_CUSTOMER_ROLE` (
  `CUSTOMER_ROLE_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ROLE_ID`),
  KEY `CUSTROLE_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `CUSTROLE_ROLE_INDEX` (`ROLE_ID`),
  KEY `FK548EB7B1B8587B7` (`ROLE_ID`),
  KEY `FK548EB7B17470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FK548EB7B17470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `BLC_CUSTOMER` (`CUSTOMER_ID`),
  CONSTRAINT `FK548EB7B1B8587B7` FOREIGN KEY (`ROLE_ID`) REFERENCES `BLC_ROLE` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_CUSTOMER_ROLE`
--

LOCK TABLES `BLC_CUSTOMER_ROLE` WRITE;
/*!40000 ALTER TABLE `BLC_CUSTOMER_ROLE` DISABLE KEYS */;
INSERT INTO `BLC_CUSTOMER_ROLE` VALUES (1,100,1);
/*!40000 ALTER TABLE `BLC_CUSTOMER_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_DATA_DRVN_ENUM_VAL`
--

DROP TABLE IF EXISTS `BLC_DATA_DRVN_ENUM_VAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_DATA_DRVN_ENUM_VAL` (
  `ENUM_VAL_ID` bigint(20) NOT NULL,
  `DISPLAY` varchar(255) DEFAULT NULL,
  `HIDDEN` bit(1) DEFAULT NULL,
  `ENUM_KEY` varchar(255) DEFAULT NULL,
  `ENUM_TYPE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ENUM_VAL_ID`),
  KEY `HIDDEN_INDEX` (`HIDDEN`),
  KEY `ENUM_VAL_KEY_INDEX` (`ENUM_KEY`),
  KEY `FKB2D5700DA60E0554` (`ENUM_TYPE`),
  CONSTRAINT `FKB2D5700DA60E0554` FOREIGN KEY (`ENUM_TYPE`) REFERENCES `BLC_DATA_DRVN_ENUM` (`ENUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_DATA_DRVN_ENUM_VAL`
--

LOCK TABLES `BLC_DATA_DRVN_ENUM_VAL` WRITE;
/*!40000 ALTER TABLE `BLC_DATA_DRVN_ENUM_VAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_DATA_DRVN_ENUM_VAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_DISCRETE_ORDER_ITEM`
--

DROP TABLE IF EXISTS `BLC_DISCRETE_ORDER_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_DISCRETE_ORDER_ITEM` (
  `BASE_RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `BASE_SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `BUNDLE_ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  `SKU_BUNDLE_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `DISCRETE_SKU_INDEX` (`SKU_ID`),
  KEY `DISCRETE_PRODUCT_INDEX` (`PRODUCT_ID`),
  KEY `FKBC3A8A849AF166DF` (`ORDER_ITEM_ID`),
  KEY `FKBC3A8A841285903B` (`SKU_BUNDLE_ITEM_ID`),
  KEY `FKBC3A8A84B78C9977` (`SKU_ID`),
  KEY `FKBC3A8A845F11A0B7` (`PRODUCT_ID`),
  KEY `FKBC3A8A845CDFCA80` (`BUNDLE_ORDER_ITEM_ID`),
  CONSTRAINT `FKBC3A8A845CDFCA80` FOREIGN KEY (`BUNDLE_ORDER_ITEM_ID`) REFERENCES `BLC_BUNDLE_ORDER_ITEM` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKBC3A8A841285903B` FOREIGN KEY (`SKU_BUNDLE_ITEM_ID`) REFERENCES `BLC_SKU_BUNDLE_ITEM` (`SKU_BUNDLE_ITEM_ID`),
  CONSTRAINT `FKBC3A8A845F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`),
  CONSTRAINT `FKBC3A8A849AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_ORDER_ITEM` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKBC3A8A84B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `BLC_SKU` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_DISCRETE_ORDER_ITEM`
--

LOCK TABLES `BLC_DISCRETE_ORDER_ITEM` WRITE;
/*!40000 ALTER TABLE `BLC_DISCRETE_ORDER_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_DISCRETE_ORDER_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_DISC_ITEM_FEE_PRICE`
--

DROP TABLE IF EXISTS `BLC_DISC_ITEM_FEE_PRICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_DISC_ITEM_FEE_PRICE` (
  `DISC_ITEM_FEE_PRICE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REPORTING_CODE` varchar(255) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`DISC_ITEM_FEE_PRICE_ID`),
  KEY `FK2A641CC8B76B9466` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK2A641CC8B76B9466` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_DISCRETE_ORDER_ITEM` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_DISC_ITEM_FEE_PRICE`
--

LOCK TABLES `BLC_DISC_ITEM_FEE_PRICE` WRITE;
/*!40000 ALTER TABLE `BLC_DISC_ITEM_FEE_PRICE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_DISC_ITEM_FEE_PRICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_DYN_DISCRETE_ORDER_ITEM`
--

DROP TABLE IF EXISTS `BLC_DYN_DISCRETE_ORDER_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_DYN_DISCRETE_ORDER_ITEM` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `FK209DEE9EB76B9466` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK209DEE9EB76B9466` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_DISCRETE_ORDER_ITEM` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_DYN_DISCRETE_ORDER_ITEM`
--

LOCK TABLES `BLC_DYN_DISCRETE_ORDER_ITEM` WRITE;
/*!40000 ALTER TABLE `BLC_DYN_DISCRETE_ORDER_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_DYN_DISCRETE_ORDER_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_EMAIL_TRACKING_CLICKS`
--

DROP TABLE IF EXISTS `BLC_EMAIL_TRACKING_CLICKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_EMAIL_TRACKING_CLICKS` (
  `CLICK_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` varchar(255) DEFAULT NULL,
  `DATE_CLICKED` datetime NOT NULL,
  `DESTINATION_URI` varchar(255) DEFAULT NULL,
  `QUERY_STRING` varchar(255) DEFAULT NULL,
  `EMAIL_TRACKING_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CLICK_ID`),
  KEY `TRACKINGCLICKS_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `TRACKINGCLICKS_TRACKING_INDEX` (`EMAIL_TRACKING_ID`),
  KEY `FKFDF9F52AFA1E5D61` (`EMAIL_TRACKING_ID`),
  CONSTRAINT `FKFDF9F52AFA1E5D61` FOREIGN KEY (`EMAIL_TRACKING_ID`) REFERENCES `BLC_EMAIL_TRACKING` (`EMAIL_TRACKING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_EMAIL_TRACKING_CLICKS`
--

LOCK TABLES `BLC_EMAIL_TRACKING_CLICKS` WRITE;
/*!40000 ALTER TABLE `BLC_EMAIL_TRACKING_CLICKS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_EMAIL_TRACKING_CLICKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_EMAIL_TRACKING_OPENS`
--

DROP TABLE IF EXISTS `BLC_EMAIL_TRACKING_OPENS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_EMAIL_TRACKING_OPENS` (
  `OPEN_ID` bigint(20) NOT NULL,
  `DATE_OPENED` datetime DEFAULT NULL,
  `USER_AGENT` varchar(255) DEFAULT NULL,
  `EMAIL_TRACKING_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`OPEN_ID`),
  KEY `TRACKINGOPEN_TRACKING` (`EMAIL_TRACKING_ID`),
  KEY `FKA5C3722AFA1E5D61` (`EMAIL_TRACKING_ID`),
  CONSTRAINT `FKA5C3722AFA1E5D61` FOREIGN KEY (`EMAIL_TRACKING_ID`) REFERENCES `BLC_EMAIL_TRACKING` (`EMAIL_TRACKING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_EMAIL_TRACKING_OPENS`
--

LOCK TABLES `BLC_EMAIL_TRACKING_OPENS` WRITE;
/*!40000 ALTER TABLE `BLC_EMAIL_TRACKING_OPENS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_EMAIL_TRACKING_OPENS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_FG_ADJUSTMENT`
--

DROP TABLE IF EXISTS `BLC_FG_ADJUSTMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FG_ADJUSTMENT` (
  `FG_ADJUSTMENT_ID` bigint(20) NOT NULL,
  `ADJUSTMENT_REASON` varchar(255) NOT NULL,
  `ADJUSTMENT_VALUE` decimal(19,5) NOT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FG_ADJUSTMENT_ID`),
  KEY `FGADJUSTMENT_OFFER_INDEX` (`OFFER_ID`),
  KEY `FGADJUSTMENT_INDEX` (`FULFILLMENT_GROUP_ID`),
  KEY `FK468C8F25D5F3FAF4` (`OFFER_ID`),
  KEY `FK468C8F255028DC55` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FK468C8F255028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `BLC_FULFILLMENT_GROUP` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FK468C8F25D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_FG_ADJUSTMENT`
--

LOCK TABLES `BLC_FG_ADJUSTMENT` WRITE;
/*!40000 ALTER TABLE `BLC_FG_ADJUSTMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FG_ADJUSTMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_FG_FEE_TAX_XREF`
--

DROP TABLE IF EXISTS `BLC_FG_FEE_TAX_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FG_FEE_TAX_XREF` (
  `FULFILLMENT_GROUP_FEE_ID` bigint(20) NOT NULL,
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  UNIQUE KEY `TAX_DETAIL_ID` (`TAX_DETAIL_ID`),
  KEY `FK25426DC0598F6D02` (`FULFILLMENT_GROUP_FEE_ID`),
  KEY `FK25426DC071448C19` (`TAX_DETAIL_ID`),
  CONSTRAINT `FK25426DC071448C19` FOREIGN KEY (`TAX_DETAIL_ID`) REFERENCES `BLC_TAX_DETAIL` (`TAX_DETAIL_ID`),
  CONSTRAINT `FK25426DC0598F6D02` FOREIGN KEY (`FULFILLMENT_GROUP_FEE_ID`) REFERENCES `BLC_FULFILLMENT_GROUP_FEE` (`FULFILLMENT_GROUP_FEE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_FG_FEE_TAX_XREF`
--

LOCK TABLES `BLC_FG_FEE_TAX_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_FG_FEE_TAX_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FG_FEE_TAX_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_FG_FG_TAX_XREF`
--

DROP TABLE IF EXISTS `BLC_FG_FG_TAX_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FG_FG_TAX_XREF` (
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  UNIQUE KEY `TAX_DETAIL_ID` (`TAX_DETAIL_ID`),
  KEY `FK61BEA45571448C19` (`TAX_DETAIL_ID`),
  KEY `FK61BEA4555028DC55` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FK61BEA4555028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `BLC_FULFILLMENT_GROUP` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FK61BEA45571448C19` FOREIGN KEY (`TAX_DETAIL_ID`) REFERENCES `BLC_TAX_DETAIL` (`TAX_DETAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_FG_FG_TAX_XREF`
--

LOCK TABLES `BLC_FG_FG_TAX_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_FG_FG_TAX_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FG_FG_TAX_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_FG_ITEM_TAX_XREF`
--

DROP TABLE IF EXISTS `BLC_FG_ITEM_TAX_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FG_ITEM_TAX_XREF` (
  `FULFILLMENT_GROUP_ITEM_ID` bigint(20) NOT NULL,
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  UNIQUE KEY `TAX_DETAIL_ID` (`TAX_DETAIL_ID`),
  KEY `FKDD3E8443E3BBB4D2` (`FULFILLMENT_GROUP_ITEM_ID`),
  KEY `FKDD3E844371448C19` (`TAX_DETAIL_ID`),
  CONSTRAINT `FKDD3E844371448C19` FOREIGN KEY (`TAX_DETAIL_ID`) REFERENCES `BLC_TAX_DETAIL` (`TAX_DETAIL_ID`),
  CONSTRAINT `FKDD3E8443E3BBB4D2` FOREIGN KEY (`FULFILLMENT_GROUP_ITEM_ID`) REFERENCES `BLC_FULFILLMENT_GROUP_ITEM` (`FULFILLMENT_GROUP_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_FG_ITEM_TAX_XREF`
--

LOCK TABLES `BLC_FG_ITEM_TAX_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_FG_ITEM_TAX_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FG_ITEM_TAX_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_FIELD`
--

DROP TABLE IF EXISTS `BLC_FIELD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FIELD` (
  `FIELD_ID` bigint(20) NOT NULL,
  `ABBREVIATION` varchar(255) DEFAULT NULL,
  `ENTITY_TYPE` varchar(255) NOT NULL,
  `FACET_FIELD_TYPE` varchar(255) DEFAULT NULL,
  `PROPERTY_NAME` varchar(255) NOT NULL,
  `SEARCHABLE` bit(1) DEFAULT NULL,
  `TRANSLATABLE` bit(1) DEFAULT NULL,
  PRIMARY KEY (`FIELD_ID`),
  UNIQUE KEY `ABBREVIATION` (`ABBREVIATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_FIELD`
--

LOCK TABLES `BLC_FIELD` WRITE;
/*!40000 ALTER TABLE `BLC_FIELD` DISABLE KEYS */;
INSERT INTO `BLC_FIELD` VALUES (1,'mfg','PRODUCT','s','manufacturer','',NULL),(2,'heatRange','PRODUCT','i','productAttributes.heatRange','\0',NULL),(3,'price','PRODUCT','p','defaultSku.retailPrice','\0',NULL),(4,'name','PRODUCT','s','defaultSku.name','','\0'),(5,'model','PRODUCT','s','model','',NULL),(6,'desc','PRODUCT',NULL,'defaultSku.description','','\0'),(7,'ldesc','PRODUCT',NULL,'defaultSku.longDescription','','\0');
/*!40000 ALTER TABLE `BLC_FIELD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_FIELD_SEARCH_TYPES`
--

DROP TABLE IF EXISTS `BLC_FIELD_SEARCH_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FIELD_SEARCH_TYPES` (
  `FIELD_ID` bigint(20) NOT NULL,
  `SEARCHABLE_FIELD_TYPE` varchar(255) DEFAULT NULL,
  KEY `FKF52D130D3C3907C4` (`FIELD_ID`),
  CONSTRAINT `FKF52D130D3C3907C4` FOREIGN KEY (`FIELD_ID`) REFERENCES `BLC_FIELD` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_FIELD_SEARCH_TYPES`
--

LOCK TABLES `BLC_FIELD_SEARCH_TYPES` WRITE;
/*!40000 ALTER TABLE `BLC_FIELD_SEARCH_TYPES` DISABLE KEYS */;
INSERT INTO `BLC_FIELD_SEARCH_TYPES` VALUES (1,'t'),(4,'t'),(5,'t'),(6,'t'),(7,'t');
/*!40000 ALTER TABLE `BLC_FIELD_SEARCH_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_FLD_DEF`
--

DROP TABLE IF EXISTS `BLC_FLD_DEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FLD_DEF` (
  `FLD_DEF_ID` bigint(20) NOT NULL,
  `ALLOW_MULTIPLES` bit(1) DEFAULT NULL,
  `COLUMN_WIDTH` varchar(255) DEFAULT NULL,
  `FLD_ORDER` int(11) DEFAULT NULL,
  `FLD_TYPE` varchar(255) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,
  `HIDDEN_FLAG` bit(1) DEFAULT NULL,
  `MAX_LENGTH` int(11) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `SECURITY_LEVEL` varchar(255) DEFAULT NULL,
  `TEXT_AREA_FLAG` bit(1) DEFAULT NULL,
  `VLDTN_ERROR_MSSG_KEY` varchar(255) DEFAULT NULL,
  `VLDTN_REGEX` varchar(255) DEFAULT NULL,
  `FLD_ENUM_ID` bigint(20) DEFAULT NULL,
  `FLD_GROUP_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FLD_DEF_ID`),
  KEY `FK3FCB575EFD2EA299` (`FLD_ENUM_ID`),
  KEY `FK3FCB575E6A79BDB5` (`FLD_GROUP_ID`),
  CONSTRAINT `FK3FCB575E6A79BDB5` FOREIGN KEY (`FLD_GROUP_ID`) REFERENCES `BLC_FLD_GROUP` (`FLD_GROUP_ID`),
  CONSTRAINT `FK3FCB575EFD2EA299` FOREIGN KEY (`FLD_ENUM_ID`) REFERENCES `BLC_FLD_ENUM` (`FLD_ENUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_FLD_DEF`
--

LOCK TABLES `BLC_FLD_DEF` WRITE;
/*!40000 ALTER TABLE `BLC_FLD_DEF` DISABLE KEYS */;
INSERT INTO `BLC_FLD_DEF` VALUES (2,'\0','*',1,'HTML','Body','\0',NULL,'body',NULL,'\0',NULL,NULL,NULL,1),(3,'\0','*',0,'STRING','Title','\0',NULL,'title',NULL,'\0',NULL,NULL,NULL,1),(7,'\0','*',0,'STRING','Image URL','\0',150,'imageUrl',NULL,'\0',NULL,NULL,NULL,4),(8,'\0','*',1,'STRING','Target URL','\0',150,'targetUrl',NULL,'\0',NULL,NULL,NULL,4),(9,'\0','*',0,'STRING','Message Text','\0',150,'messageText',NULL,'\0',NULL,NULL,NULL,6),(10,'\0','*',0,'HTML','HTML Content','\0',NULL,'htmlContent',NULL,'\0',NULL,NULL,NULL,5);
/*!40000 ALTER TABLE `BLC_FLD_DEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_FLD_ENUM`
--

DROP TABLE IF EXISTS `BLC_FLD_ENUM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FLD_ENUM` (
  `FLD_ENUM_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FLD_ENUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_FLD_ENUM`
--

LOCK TABLES `BLC_FLD_ENUM` WRITE;
/*!40000 ALTER TABLE `BLC_FLD_ENUM` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FLD_ENUM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_FLD_ENUM_ITEM`
--

DROP TABLE IF EXISTS `BLC_FLD_ENUM_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FLD_ENUM_ITEM` (
  `FLD_ENUM_ITEM_ID` bigint(20) NOT NULL,
  `FLD_ORDER` int(11) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `FLD_ENUM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FLD_ENUM_ITEM_ID`),
  KEY `FK83A6A84AFD2EA299` (`FLD_ENUM_ID`),
  CONSTRAINT `FK83A6A84AFD2EA299` FOREIGN KEY (`FLD_ENUM_ID`) REFERENCES `BLC_FLD_ENUM` (`FLD_ENUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_FLD_ENUM_ITEM`
--

LOCK TABLES `BLC_FLD_ENUM_ITEM` WRITE;
/*!40000 ALTER TABLE `BLC_FLD_ENUM_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FLD_ENUM_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_FLD_GROUP`
--

DROP TABLE IF EXISTS `BLC_FLD_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FLD_GROUP` (
  `FLD_GROUP_ID` bigint(20) NOT NULL,
  `INIT_COLLAPSED_FLAG` bit(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FLD_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_FLD_GROUP`
--

LOCK TABLES `BLC_FLD_GROUP` WRITE;
/*!40000 ALTER TABLE `BLC_FLD_GROUP` DISABLE KEYS */;
INSERT INTO `BLC_FLD_GROUP` VALUES (1,'\0','Content'),(4,'\0','Ad Fields'),(5,'\0','HTML Fields'),(6,'\0','Message Fields');
/*!40000 ALTER TABLE `BLC_FLD_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_FULFILLMENT_GROUP`
--

DROP TABLE IF EXISTS `BLC_FULFILLMENT_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FULFILLMENT_GROUP` (
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  `DELIVERY_INSTRUCTION` varchar(255) DEFAULT NULL,
  `SHIPPING_PRICE_TAXABLE` bit(1) DEFAULT NULL,
  `MERCHANDISE_TOTAL` decimal(19,5) DEFAULT NULL,
  `METHOD` varchar(255) DEFAULT NULL,
  `IS_PRIMARY` bit(1) DEFAULT NULL,
  `REFERENCE_NUMBER` varchar(255) DEFAULT NULL,
  `RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `SERVICE` varchar(255) DEFAULT NULL,
  `PRICE` decimal(19,5) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `TOTAL` decimal(19,5) DEFAULT NULL,
  `TOTAL_FEE_TAX` decimal(19,5) DEFAULT NULL,
  `TOTAL_FG_TAX` decimal(19,5) DEFAULT NULL,
  `TOTAL_ITEM_TAX` decimal(19,5) DEFAULT NULL,
  `TOTAL_TAX` decimal(19,5) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) NOT NULL,
  `PERSONAL_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `PHONE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_GROUP_ID`),
  KEY `FG_PHONE_INDEX` (`PHONE_ID`),
  KEY `FG_MESSAGE_INDEX` (`PERSONAL_MESSAGE_ID`),
  KEY `FG_SERVICE_INDEX` (`SERVICE`),
  KEY `FG_METHOD_INDEX` (`METHOD`),
  KEY `FG_ADDRESS_INDEX` (`ADDRESS_ID`),
  KEY `FG_PRIMARY_INDEX` (`IS_PRIMARY`),
  KEY `FG_REFERENCE_INDEX` (`REFERENCE_NUMBER`),
  KEY `FG_STATUS_INDEX` (`STATUS`),
  KEY `FG_ORDER_INDEX` (`ORDER_ID`),
  KEY `FKC5B9EF1877F565E1` (`PERSONAL_MESSAGE_ID`),
  KEY `FKC5B9EF18D894CB5D` (`PHONE_ID`),
  KEY `FKC5B9EF18C13085DD` (`ADDRESS_ID`),
  KEY `FKC5B9EF1889FE8A02` (`ORDER_ID`),
  KEY `FKC5B9EF1881F34C7F` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKC5B9EF1881F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `BLC_FULFILLMENT_OPTION` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKC5B9EF1877F565E1` FOREIGN KEY (`PERSONAL_MESSAGE_ID`) REFERENCES `BLC_PERSONAL_MESSAGE` (`PERSONAL_MESSAGE_ID`),
  CONSTRAINT `FKC5B9EF1889FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `BLC_ORDER` (`ORDER_ID`),
  CONSTRAINT `FKC5B9EF18C13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `BLC_ADDRESS` (`ADDRESS_ID`),
  CONSTRAINT `FKC5B9EF18D894CB5D` FOREIGN KEY (`PHONE_ID`) REFERENCES `BLC_PHONE` (`PHONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_FULFILLMENT_GROUP`
--

LOCK TABLES `BLC_FULFILLMENT_GROUP` WRITE;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_FULFILLMENT_GROUP_FEE`
--

DROP TABLE IF EXISTS `BLC_FULFILLMENT_GROUP_FEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FULFILLMENT_GROUP_FEE` (
  `FULFILLMENT_GROUP_FEE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `FEE_TAXABLE_FLAG` bit(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REPORTING_CODE` varchar(255) DEFAULT NULL,
  `TOTAL_FEE_TAX` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_GROUP_FEE_ID`),
  KEY `FK6AA8E1BF5028DC55` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FK6AA8E1BF5028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `BLC_FULFILLMENT_GROUP` (`FULFILLMENT_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_FULFILLMENT_GROUP_FEE`
--

LOCK TABLES `BLC_FULFILLMENT_GROUP_FEE` WRITE;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_GROUP_FEE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_GROUP_FEE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_FULFILLMENT_GROUP_ITEM`
--

DROP TABLE IF EXISTS `BLC_FULFILLMENT_GROUP_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FULFILLMENT_GROUP_ITEM` (
  `FULFILLMENT_GROUP_ITEM_ID` bigint(20) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `TOTAL_ITEM_TAX` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_GROUP_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_GROUP_ITEM_ID`),
  KEY `FGITEM_STATUS_INDEX` (`STATUS`),
  KEY `FGITEM_FG_INDEX` (`FULFILLMENT_GROUP_ID`),
  KEY `FKEA74EBDA9AF166DF` (`ORDER_ITEM_ID`),
  KEY `FKEA74EBDA5028DC55` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FKEA74EBDA5028DC55` FOREIGN KEY (`FULFILLMENT_GROUP_ID`) REFERENCES `BLC_FULFILLMENT_GROUP` (`FULFILLMENT_GROUP_ID`),
  CONSTRAINT `FKEA74EBDA9AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_ORDER_ITEM` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_FULFILLMENT_GROUP_ITEM`
--

LOCK TABLES `BLC_FULFILLMENT_GROUP_ITEM` WRITE;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_GROUP_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_GROUP_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_FULFILLMENT_OPTION`
--

DROP TABLE IF EXISTS `BLC_FULFILLMENT_OPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FULFILLMENT_OPTION` (
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  `FULFILLMENT_TYPE` varchar(255) NOT NULL,
  `LONG_DESCRIPTION` longtext,
  `NAME` varchar(255) DEFAULT NULL,
  `USE_FLAT_RATES` bit(1) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_FULFILLMENT_OPTION`
--

LOCK TABLES `BLC_FULFILLMENT_OPTION` WRITE;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_OPTION` DISABLE KEYS */;
INSERT INTO `BLC_FULFILLMENT_OPTION` VALUES (1,'PHYSICAL','2 - 7 Days','First Class','\0'),(2,'PHYSICAL','2 - 5 Days','Priority','\0'),(3,'PHYSICAL','1 - 2 Days','Express','\0');
/*!40000 ALTER TABLE `BLC_FULFILLMENT_OPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_FULFILLMENT_OPTION_FIXED`
--

DROP TABLE IF EXISTS `BLC_FULFILLMENT_OPTION_FIXED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FULFILLMENT_OPTION_FIXED` (
  `PRICE` decimal(19,5) NOT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`),
  KEY `FK4083603181F34C7F` (`FULFILLMENT_OPTION_ID`),
  KEY `FK408360313E2FC4F9` (`CURRENCY_CODE`),
  CONSTRAINT `FK408360313E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `BLC_CURRENCY` (`CURRENCY_CODE`),
  CONSTRAINT `FK4083603181F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `BLC_FULFILLMENT_OPTION` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_FULFILLMENT_OPTION_FIXED`
--

LOCK TABLES `BLC_FULFILLMENT_OPTION_FIXED` WRITE;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_OPTION_FIXED` DISABLE KEYS */;
INSERT INTO `BLC_FULFILLMENT_OPTION_FIXED` VALUES (5.00000,1,NULL),(10.00000,2,NULL),(20.00000,3,NULL);
/*!40000 ALTER TABLE `BLC_FULFILLMENT_OPTION_FIXED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_FULFILLMENT_OPT_BANDED_PRC`
--

DROP TABLE IF EXISTS `BLC_FULFILLMENT_OPT_BANDED_PRC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FULFILLMENT_OPT_BANDED_PRC` (
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`),
  KEY `FKB1FD71E981F34C7F` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKB1FD71E981F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `BLC_FULFILLMENT_OPTION` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_FULFILLMENT_OPT_BANDED_PRC`
--

LOCK TABLES `BLC_FULFILLMENT_OPT_BANDED_PRC` WRITE;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_OPT_BANDED_PRC` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_OPT_BANDED_PRC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_FULFILLMENT_OPT_BANDED_WGT`
--

DROP TABLE IF EXISTS `BLC_FULFILLMENT_OPT_BANDED_WGT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FULFILLMENT_OPT_BANDED_WGT` (
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FULFILLMENT_OPTION_ID`),
  KEY `FKB1FD8AEC81F34C7F` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKB1FD8AEC81F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `BLC_FULFILLMENT_OPTION` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_FULFILLMENT_OPT_BANDED_WGT`
--

LOCK TABLES `BLC_FULFILLMENT_OPT_BANDED_WGT` WRITE;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_OPT_BANDED_WGT` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_OPT_BANDED_WGT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_FULFILLMENT_PRICE_BAND`
--

DROP TABLE IF EXISTS `BLC_FULFILLMENT_PRICE_BAND`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FULFILLMENT_PRICE_BAND` (
  `FULFILLMENT_PRICE_BAND_ID` bigint(20) NOT NULL,
  `RESULT_AMOUNT` decimal(19,5) NOT NULL,
  `RESULT_AMOUNT_TYPE` varchar(255) NOT NULL,
  `RETAIL_PRICE_MINIMUM_AMOUNT` decimal(19,5) NOT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_PRICE_BAND_ID`),
  KEY `FK46C9EA726CDF59CA` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FK46C9EA726CDF59CA` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `BLC_FULFILLMENT_OPT_BANDED_PRC` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_FULFILLMENT_PRICE_BAND`
--

LOCK TABLES `BLC_FULFILLMENT_PRICE_BAND` WRITE;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_PRICE_BAND` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_PRICE_BAND` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_FULFILLMENT_WEIGHT_BAND`
--

DROP TABLE IF EXISTS `BLC_FULFILLMENT_WEIGHT_BAND`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_FULFILLMENT_WEIGHT_BAND` (
  `FULFILLMENT_WEIGHT_BAND_ID` bigint(20) NOT NULL,
  `RESULT_AMOUNT` decimal(19,5) NOT NULL,
  `RESULT_AMOUNT_TYPE` varchar(255) NOT NULL,
  `MINIMUM_WEIGHT` decimal(19,5) DEFAULT NULL,
  `WEIGHT_UNIT_OF_MEASURE` varchar(255) DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FULFILLMENT_WEIGHT_BAND_ID`),
  KEY `FK6A048D95A0B429C3` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FK6A048D95A0B429C3` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `BLC_FULFILLMENT_OPT_BANDED_WGT` (`FULFILLMENT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_FULFILLMENT_WEIGHT_BAND`
--

LOCK TABLES `BLC_FULFILLMENT_WEIGHT_BAND` WRITE;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_WEIGHT_BAND` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_FULFILLMENT_WEIGHT_BAND` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_GIFTWRAP_ORDER_ITEM`
--

DROP TABLE IF EXISTS `BLC_GIFTWRAP_ORDER_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_GIFTWRAP_ORDER_ITEM` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `FKE1BE1563B76B9466` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKE1BE1563B76B9466` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_DISCRETE_ORDER_ITEM` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_GIFTWRAP_ORDER_ITEM`
--

LOCK TABLES `BLC_GIFTWRAP_ORDER_ITEM` WRITE;
/*!40000 ALTER TABLE `BLC_GIFTWRAP_ORDER_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_GIFTWRAP_ORDER_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_ID_GENERATION`
--

DROP TABLE IF EXISTS `BLC_ID_GENERATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ID_GENERATION` (
  `ID_TYPE` varchar(255) NOT NULL,
  `BATCH_SIZE` bigint(20) NOT NULL,
  `BATCH_START` bigint(20) NOT NULL,
  `ID_MIN` bigint(20) DEFAULT NULL,
  `ID_MAX` bigint(20) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_ID_GENERATION`
--

LOCK TABLES `BLC_ID_GENERATION` WRITE;
/*!40000 ALTER TABLE `BLC_ID_GENERATION` DISABLE KEYS */;
INSERT INTO `BLC_ID_GENERATION` VALUES ('org.broadleafcommerce.profile.core.domain.Customer',100,200,NULL,NULL,2);
/*!40000 ALTER TABLE `BLC_ID_GENERATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_IMG_STATIC_ASSET`
--

DROP TABLE IF EXISTS `BLC_IMG_STATIC_ASSET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_IMG_STATIC_ASSET` (
  `HEIGHT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`STATIC_ASSET_ID`),
  KEY `FKCC4B772167F70B63` (`STATIC_ASSET_ID`),
  CONSTRAINT `FKCC4B772167F70B63` FOREIGN KEY (`STATIC_ASSET_ID`) REFERENCES `BLC_STATIC_ASSET` (`STATIC_ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_IMG_STATIC_ASSET`
--

LOCK TABLES `BLC_IMG_STATIC_ASSET` WRITE;
/*!40000 ALTER TABLE `BLC_IMG_STATIC_ASSET` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_IMG_STATIC_ASSET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_LOCALE`
--

DROP TABLE IF EXISTS `BLC_LOCALE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_LOCALE` (
  `LOCALE_CODE` varchar(255) NOT NULL,
  `DEFAULT_FLAG` bit(1) DEFAULT NULL,
  `FRIENDLY_NAME` varchar(255) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`LOCALE_CODE`),
  KEY `FK56C7DC203E2FC4F9` (`CURRENCY_CODE`),
  CONSTRAINT `FK56C7DC203E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `BLC_CURRENCY` (`CURRENCY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_LOCALE`
--

LOCK TABLES `BLC_LOCALE` WRITE;
/*!40000 ALTER TABLE `BLC_LOCALE` DISABLE KEYS */;
INSERT INTO `BLC_LOCALE` VALUES ('en','\0','English','USD'),('en_US','','English','USD');
/*!40000 ALTER TABLE `BLC_LOCALE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_OFFER_CODE`
--

DROP TABLE IF EXISTS `BLC_OFFER_CODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_OFFER_CODE` (
  `OFFER_CODE_ID` bigint(20) NOT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `MAX_USES` int(11) DEFAULT NULL,
  `OFFER_CODE` varchar(255) NOT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `USES` int(11) DEFAULT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`OFFER_CODE_ID`),
  KEY `OFFERCODE_OFFER_INDEX` (`OFFER_ID`),
  KEY `OFFERCODE_CODE_INDEX` (`OFFER_CODE`),
  KEY `FK76B8C8D6D5F3FAF4` (`OFFER_ID`),
  CONSTRAINT `FK76B8C8D6D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_OFFER_CODE`
--

LOCK TABLES `BLC_OFFER_CODE` WRITE;
/*!40000 ALTER TABLE `BLC_OFFER_CODE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_OFFER_CODE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_OFFER_INFO`
--

DROP TABLE IF EXISTS `BLC_OFFER_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_OFFER_INFO` (
  `OFFER_INFO_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`OFFER_INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_OFFER_INFO`
--

LOCK TABLES `BLC_OFFER_INFO` WRITE;
/*!40000 ALTER TABLE `BLC_OFFER_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_OFFER_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_OFFER_INFO_FIELDS`
--

DROP TABLE IF EXISTS `BLC_OFFER_INFO_FIELDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_OFFER_INFO_FIELDS` (
  `OFFER_INFO_FIELDS_ID` bigint(20) NOT NULL,
  `FIELD_VALUE` varchar(255) DEFAULT NULL,
  `FIELD_NAME` varchar(150) NOT NULL,
  PRIMARY KEY (`OFFER_INFO_FIELDS_ID`,`FIELD_NAME`),
  KEY `FKA901886183AE7237` (`OFFER_INFO_FIELDS_ID`),
  CONSTRAINT `FKA901886183AE7237` FOREIGN KEY (`OFFER_INFO_FIELDS_ID`) REFERENCES `BLC_OFFER_INFO` (`OFFER_INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_OFFER_INFO_FIELDS`
--

LOCK TABLES `BLC_OFFER_INFO_FIELDS` WRITE;
/*!40000 ALTER TABLE `BLC_OFFER_INFO_FIELDS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_OFFER_INFO_FIELDS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_OFFER_ITEM_CRITERIA`
--

DROP TABLE IF EXISTS `BLC_OFFER_ITEM_CRITERIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_OFFER_ITEM_CRITERIA` (
  `OFFER_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_MATCH_RULE` longtext,
  `QUANTITY` int(11) NOT NULL,
  PRIMARY KEY (`OFFER_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_OFFER_ITEM_CRITERIA`
--

LOCK TABLES `BLC_OFFER_ITEM_CRITERIA` WRITE;
/*!40000 ALTER TABLE `BLC_OFFER_ITEM_CRITERIA` DISABLE KEYS */;
INSERT INTO `BLC_OFFER_ITEM_CRITERIA` VALUES (1,'MVEL.eval(\"toUpperCase()\",discreteOrderItem.category.name)==MVEL.eval(\"toUpperCase()\",\"merchandise\")',1);
/*!40000 ALTER TABLE `BLC_OFFER_ITEM_CRITERIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_OFFER_RULE`
--

DROP TABLE IF EXISTS `BLC_OFFER_RULE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_OFFER_RULE` (
  `OFFER_RULE_ID` bigint(20) NOT NULL,
  `MATCH_RULE` longtext,
  PRIMARY KEY (`OFFER_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_OFFER_RULE`
--

LOCK TABLES `BLC_OFFER_RULE` WRITE;
/*!40000 ALTER TABLE `BLC_OFFER_RULE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_OFFER_RULE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_OFFER_RULE_MAP`
--

DROP TABLE IF EXISTS `BLC_OFFER_RULE_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_OFFER_RULE_MAP` (
  `BLC_OFFER_OFFER_ID` bigint(20) NOT NULL,
  `OFFER_RULE_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_OFFER_OFFER_ID`,`MAP_KEY`),
  KEY `FKCA468FE245C66D1D` (`BLC_OFFER_OFFER_ID`),
  KEY `FKCA468FE2C11A218D` (`OFFER_RULE_ID`),
  CONSTRAINT `FKCA468FE2C11A218D` FOREIGN KEY (`OFFER_RULE_ID`) REFERENCES `BLC_OFFER_RULE` (`OFFER_RULE_ID`),
  CONSTRAINT `FKCA468FE245C66D1D` FOREIGN KEY (`BLC_OFFER_OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_OFFER_RULE_MAP`
--

LOCK TABLES `BLC_OFFER_RULE_MAP` WRITE;
/*!40000 ALTER TABLE `BLC_OFFER_RULE_MAP` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_OFFER_RULE_MAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_ORDER`
--

DROP TABLE IF EXISTS `BLC_ORDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER` (
  `ORDER_ID` bigint(20) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `ORDER_NUMBER` varchar(255) DEFAULT NULL,
  `ORDER_STATUS` varchar(255) DEFAULT NULL,
  `ORDER_SUBTOTAL` decimal(19,5) DEFAULT NULL,
  `SUBMIT_DATE` datetime DEFAULT NULL,
  `ORDER_TOTAL` decimal(19,5) DEFAULT NULL,
  `TOTAL_SHIPPING` decimal(19,5) DEFAULT NULL,
  `TOTAL_TAX` decimal(19,5) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `LOCALE_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `ORDER_NAME_INDEX` (`NAME`),
  KEY `ORDER_STATUS_INDEX` (`ORDER_STATUS`),
  KEY `ORDER_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `ORDER_EMAIL_INDEX` (`EMAIL_ADDRESS`),
  KEY `ORDER_NUMBER_INDEX` (`ORDER_NUMBER`),
  KEY `FK8F5B64A8A1E1C128` (`LOCALE_CODE`),
  KEY `FK8F5B64A87470F437` (`CUSTOMER_ID`),
  KEY `FK8F5B64A83E2FC4F9` (`CURRENCY_CODE`),
  CONSTRAINT `FK8F5B64A83E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `BLC_CURRENCY` (`CURRENCY_CODE`),
  CONSTRAINT `FK8F5B64A87470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `BLC_CUSTOMER` (`CUSTOMER_ID`),
  CONSTRAINT `FK8F5B64A8A1E1C128` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `BLC_LOCALE` (`LOCALE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_ORDER`
--

LOCK TABLES `BLC_ORDER` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ORDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_ORDER_ADJUSTMENT`
--

DROP TABLE IF EXISTS `BLC_ORDER_ADJUSTMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER_ADJUSTMENT` (
  `ORDER_ADJUSTMENT_ID` bigint(20) NOT NULL,
  `ADJUSTMENT_REASON` varchar(255) NOT NULL,
  `ADJUSTMENT_VALUE` decimal(19,5) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ADJUSTMENT_ID`),
  KEY `ORDERADJUST_OFFER_INDEX` (`OFFER_ID`),
  KEY `ORDERADJUST_ORDER_INDEX` (`ORDER_ID`),
  KEY `FK1E92D164D5F3FAF4` (`OFFER_ID`),
  KEY `FK1E92D16489FE8A02` (`ORDER_ID`),
  CONSTRAINT `FK1E92D16489FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `BLC_ORDER` (`ORDER_ID`),
  CONSTRAINT `FK1E92D164D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_ORDER_ADJUSTMENT`
--

LOCK TABLES `BLC_ORDER_ADJUSTMENT` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER_ADJUSTMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ORDER_ADJUSTMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_ORDER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `BLC_ORDER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER_ATTRIBUTE` (
  `ORDER_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `ORDER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ATTRIBUTE_ID`),
  KEY `FKB3A467A589FE8A02` (`ORDER_ID`),
  CONSTRAINT `FKB3A467A589FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `BLC_ORDER` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_ORDER_ATTRIBUTE`
--

LOCK TABLES `BLC_ORDER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ORDER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_ORDER_ITEM`
--

DROP TABLE IF EXISTS `BLC_ORDER_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER_ITEM` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `ITEM_TAXABLE_FLAG` bit(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `ORDER_ITEM_TYPE` varchar(255) DEFAULT NULL,
  `PRICE` decimal(19,5) DEFAULT NULL,
  `QUANTITY` int(11) NOT NULL,
  `RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `SPLIT_PARENT_ITEM_ID` bigint(20) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `GIFT_WRAP_ITEM_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `PERSONAL_MESSAGE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`),
  KEY `ORDERITEM_GIFT_INDEX` (`GIFT_WRAP_ITEM_ID`),
  KEY `ORDERITEM_MESSAGE_INDEX` (`PERSONAL_MESSAGE_ID`),
  KEY `ORDERITEM_ORDER_INDEX` (`ORDER_ID`),
  KEY `ORDERITEM_TYPE_INDEX` (`ORDER_ITEM_TYPE`),
  KEY `ORDERITEM_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `FK9A2E704A77F565E1` (`PERSONAL_MESSAGE_ID`),
  KEY `FK9A2E704A15D1A13D` (`CATEGORY_ID`),
  KEY `FK9A2E704A89FE8A02` (`ORDER_ID`),
  KEY `FK9A2E704AFD2F1F10` (`GIFT_WRAP_ITEM_ID`),
  CONSTRAINT `FK9A2E704AFD2F1F10` FOREIGN KEY (`GIFT_WRAP_ITEM_ID`) REFERENCES `BLC_GIFTWRAP_ORDER_ITEM` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK9A2E704A15D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`),
  CONSTRAINT `FK9A2E704A77F565E1` FOREIGN KEY (`PERSONAL_MESSAGE_ID`) REFERENCES `BLC_PERSONAL_MESSAGE` (`PERSONAL_MESSAGE_ID`),
  CONSTRAINT `FK9A2E704A89FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `BLC_ORDER` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_ORDER_ITEM`
--

LOCK TABLES `BLC_ORDER_ITEM` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ORDER_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_ORDER_ITEM_ADD_ATTR`
--

DROP TABLE IF EXISTS `BLC_ORDER_ITEM_ADD_ATTR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER_ITEM_ADD_ATTR` (
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ID`,`NAME`),
  KEY `FKA466AB44B76B9466` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKA466AB44B76B9466` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_DISCRETE_ORDER_ITEM` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_ORDER_ITEM_ADD_ATTR`
--

LOCK TABLES `BLC_ORDER_ITEM_ADD_ATTR` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER_ITEM_ADD_ATTR` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ORDER_ITEM_ADD_ATTR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_ORDER_ITEM_ADJUSTMENT`
--

DROP TABLE IF EXISTS `BLC_ORDER_ITEM_ADJUSTMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER_ITEM_ADJUSTMENT` (
  `ORDER_ITEM_ADJUSTMENT_ID` bigint(20) NOT NULL,
  `APPLIED_TO_SALE_PRICE` bit(1) DEFAULT NULL,
  `ADJUSTMENT_REASON` varchar(255) NOT NULL,
  `ADJUSTMENT_VALUE` decimal(19,5) NOT NULL,
  `OFFER_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ITEM_ADJUSTMENT_ID`),
  KEY `OIADJUST_OFFER_INDEX` (`OFFER_ID`),
  KEY `OIADJUST_ITEM_INDEX` (`ORDER_ITEM_ID`),
  KEY `FKA2658C829AF166DF` (`ORDER_ITEM_ID`),
  KEY `FKA2658C82D5F3FAF4` (`OFFER_ID`),
  CONSTRAINT `FKA2658C82D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`),
  CONSTRAINT `FKA2658C829AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_ORDER_ITEM` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_ORDER_ITEM_ADJUSTMENT`
--

LOCK TABLES `BLC_ORDER_ITEM_ADJUSTMENT` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER_ITEM_ADJUSTMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ORDER_ITEM_ADJUSTMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_ORDER_ITEM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `BLC_ORDER_ITEM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER_ITEM_ATTRIBUTE` (
  `ORDER_ITEM_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ATTRIBUTE_ID`),
  KEY `FK9F1ED0C79AF166DF` (`ORDER_ITEM_ID`),
  CONSTRAINT `FK9F1ED0C79AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_ORDER_ITEM` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_ORDER_ITEM_ATTRIBUTE`
--

LOCK TABLES `BLC_ORDER_ITEM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER_ITEM_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ORDER_ITEM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_ORDER_MULTISHIP_OPTION`
--

DROP TABLE IF EXISTS `BLC_ORDER_MULTISHIP_OPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER_MULTISHIP_OPTION` (
  `ORDER_MULTISHIP_OPTION_ID` bigint(20) NOT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `ORDER_ITEM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_MULTISHIP_OPTION_ID`),
  KEY `MULTISHIP_OPTION_ORDER_INDEX` (`ORDER_ID`),
  KEY `FKB3D3F7D69AF166DF` (`ORDER_ITEM_ID`),
  KEY `FKB3D3F7D6C13085DD` (`ADDRESS_ID`),
  KEY `FKB3D3F7D689FE8A02` (`ORDER_ID`),
  KEY `FKB3D3F7D681F34C7F` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKB3D3F7D681F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `BLC_FULFILLMENT_OPTION` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKB3D3F7D689FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `BLC_ORDER` (`ORDER_ID`),
  CONSTRAINT `FKB3D3F7D69AF166DF` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `BLC_ORDER_ITEM` (`ORDER_ITEM_ID`),
  CONSTRAINT `FKB3D3F7D6C13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `BLC_ADDRESS` (`ADDRESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_ORDER_MULTISHIP_OPTION`
--

LOCK TABLES `BLC_ORDER_MULTISHIP_OPTION` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER_MULTISHIP_OPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ORDER_MULTISHIP_OPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_ORDER_OFFER_CODE_XREF`
--

DROP TABLE IF EXISTS `BLC_ORDER_OFFER_CODE_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER_OFFER_CODE_XREF` (
  `ORDER_ID` bigint(20) NOT NULL,
  `OFFER_CODE_ID` bigint(20) NOT NULL,
  KEY `FKFDF0E8533BB10F6D` (`OFFER_CODE_ID`),
  KEY `FKFDF0E85389FE8A02` (`ORDER_ID`),
  CONSTRAINT `FKFDF0E85389FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `BLC_ORDER` (`ORDER_ID`),
  CONSTRAINT `FKFDF0E8533BB10F6D` FOREIGN KEY (`OFFER_CODE_ID`) REFERENCES `BLC_OFFER_CODE` (`OFFER_CODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_ORDER_OFFER_CODE_XREF`
--

LOCK TABLES `BLC_ORDER_OFFER_CODE_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER_OFFER_CODE_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ORDER_OFFER_CODE_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_ORDER_PAYMENT`
--

DROP TABLE IF EXISTS `BLC_ORDER_PAYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_ORDER_PAYMENT` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `CUSTOMER_IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REFERENCE_NUMBER` varchar(255) DEFAULT NULL,
  `PAYMENT_TYPE` varchar(255) NOT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) NOT NULL,
  `PHONE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `ORDERPAYMENT_ADDRESS_INDEX` (`ADDRESS_ID`),
  KEY `ORDERPAYMENT_PHONE_INDEX` (`PHONE_ID`),
  KEY `ORDERPAYMENT_TYPE_INDEX` (`PAYMENT_TYPE`),
  KEY `ORDERPAYMENT_REFERENCE_INDEX` (`REFERENCE_NUMBER`),
  KEY `ORDERPAYMENT_ORDER_INDEX` (`ORDER_ID`),
  KEY `FK9517A14FD894CB5D` (`PHONE_ID`),
  KEY `FK9517A14FC13085DD` (`ADDRESS_ID`),
  KEY `FK9517A14F89FE8A02` (`ORDER_ID`),
  CONSTRAINT `FK9517A14F89FE8A02` FOREIGN KEY (`ORDER_ID`) REFERENCES `BLC_ORDER` (`ORDER_ID`),
  CONSTRAINT `FK9517A14FC13085DD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `BLC_ADDRESS` (`ADDRESS_ID`),
  CONSTRAINT `FK9517A14FD894CB5D` FOREIGN KEY (`PHONE_ID`) REFERENCES `BLC_PHONE` (`PHONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_ORDER_PAYMENT`
--

LOCK TABLES `BLC_ORDER_PAYMENT` WRITE;
/*!40000 ALTER TABLE `BLC_ORDER_PAYMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_ORDER_PAYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PAGE`
--

DROP TABLE IF EXISTS `BLC_PAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PAGE` (
  `PAGE_ID` bigint(20) NOT NULL,
  `ARCHIVED_FLAG` bit(1) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `DELETED_FLAG` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `FULL_URL` varchar(255) DEFAULT NULL,
  `LOCKED_FLAG` bit(1) DEFAULT NULL,
  `OFFLINE_FLAG` bit(1) DEFAULT NULL,
  `ORIG_PAGE_ID` bigint(20) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `ORIG_SANDBOX_ID` bigint(20) DEFAULT NULL,
  `PAGE_TMPLT_ID` bigint(20) DEFAULT NULL,
  `SANDBOX_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAGE_ID`),
  KEY `PAGE_ARCHVD_FLG_INDX` (`ARCHIVED_FLAG`),
  KEY `ORIG_PAGE_ID_INDX` (`ORIG_PAGE_ID`),
  KEY `PAGE_FULL_URL_INDEX` (`FULL_URL`),
  KEY `PAGE_DLTD_FLG_INDX` (`DELETED_FLAG`),
  KEY `PAGE_LCKD_FLG_INDX` (`LOCKED_FLAG`),
  KEY `FKF41BEDD524568C27` (`CREATED_BY`),
  KEY `FKF41BEDD5579FE59D` (`SANDBOX_ID`),
  KEY `FKF41BEDD5F9C4A5B` (`ORIG_SANDBOX_ID`),
  KEY `FKF41BEDD5D49D3961` (`PAGE_TMPLT_ID`),
  KEY `FKF41BEDD5C1167574` (`UPDATED_BY`),
  CONSTRAINT `FKF41BEDD5C1167574` FOREIGN KEY (`UPDATED_BY`) REFERENCES `BLC_ADMIN_USER` (`ADMIN_USER_ID`),
  CONSTRAINT `FKF41BEDD524568C27` FOREIGN KEY (`CREATED_BY`) REFERENCES `BLC_ADMIN_USER` (`ADMIN_USER_ID`),
  CONSTRAINT `FKF41BEDD5579FE59D` FOREIGN KEY (`SANDBOX_ID`) REFERENCES `BLC_SANDBOX` (`SANDBOX_ID`),
  CONSTRAINT `FKF41BEDD5D49D3961` FOREIGN KEY (`PAGE_TMPLT_ID`) REFERENCES `BLC_PAGE_TMPLT` (`PAGE_TMPLT_ID`),
  CONSTRAINT `FKF41BEDD5F9C4A5B` FOREIGN KEY (`ORIG_SANDBOX_ID`) REFERENCES `BLC_SANDBOX` (`SANDBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PAGE`
--

LOCK TABLES `BLC_PAGE` WRITE;
/*!40000 ALTER TABLE `BLC_PAGE` DISABLE KEYS */;
INSERT INTO `BLC_PAGE` VALUES (1,'\0',NULL,NULL,'\0','About Us','/about_us',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(2,'\0',NULL,NULL,'\0','FAQ','/faq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(3,'\0',NULL,NULL,'\0','New to Hot Sauce','/new-to-hot-sauce',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `BLC_PAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PAGE_FLD`
--

DROP TABLE IF EXISTS `BLC_PAGE_FLD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PAGE_FLD` (
  `PAGE_FLD_ID` bigint(20) NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `FLD_KEY` varchar(255) DEFAULT NULL,
  `LOB_VALUE` longtext,
  `VALUE` varchar(255) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `PAGE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAGE_FLD_ID`),
  KEY `FK86433AD424568C27` (`CREATED_BY`),
  KEY `FK86433AD4883C2667` (`PAGE_ID`),
  KEY `FK86433AD4C1167574` (`UPDATED_BY`),
  CONSTRAINT `FK86433AD4C1167574` FOREIGN KEY (`UPDATED_BY`) REFERENCES `BLC_ADMIN_USER` (`ADMIN_USER_ID`),
  CONSTRAINT `FK86433AD424568C27` FOREIGN KEY (`CREATED_BY`) REFERENCES `BLC_ADMIN_USER` (`ADMIN_USER_ID`),
  CONSTRAINT `FK86433AD4883C2667` FOREIGN KEY (`PAGE_ID`) REFERENCES `BLC_PAGE` (`PAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PAGE_FLD`
--

LOCK TABLES `BLC_PAGE_FLD` WRITE;
/*!40000 ALTER TABLE `BLC_PAGE_FLD` DISABLE KEYS */;
INSERT INTO `BLC_PAGE_FLD` VALUES (1,NULL,NULL,'body',NULL,'test content',NULL,NULL,1),(2,NULL,NULL,'title',NULL,'',NULL,NULL,1),(3,NULL,NULL,'body',NULL,'<h2 style=\"text-align:center;\">This is an example of a content-managed page.</h2><h4 style=\"text-align:center;\"><a href=\"http://www.broadleafcommerce.com/features/content\">Click Here</a> to see more about Content Management in Broadleaf.</h4>',NULL,NULL,2),(4,NULL,NULL,'body',NULL,'<h2 style=\"text-align:center;\">This is an example of a content-managed page.</h2>',NULL,NULL,3);
/*!40000 ALTER TABLE `BLC_PAGE_FLD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PAGE_FLD_MAP`
--

DROP TABLE IF EXISTS `BLC_PAGE_FLD_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PAGE_FLD_MAP` (
  `PAGE_ID` bigint(20) NOT NULL,
  `PAGE_FLD_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`PAGE_ID`,`MAP_KEY`),
  KEY `FKE9EE09515AEDD08A` (`PAGE_FLD_ID`),
  KEY `FKE9EE0951883C2667` (`PAGE_ID`),
  CONSTRAINT `FKE9EE0951883C2667` FOREIGN KEY (`PAGE_ID`) REFERENCES `BLC_PAGE` (`PAGE_ID`),
  CONSTRAINT `FKE9EE09515AEDD08A` FOREIGN KEY (`PAGE_FLD_ID`) REFERENCES `BLC_PAGE_FLD` (`PAGE_FLD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PAGE_FLD_MAP`
--

LOCK TABLES `BLC_PAGE_FLD_MAP` WRITE;
/*!40000 ALTER TABLE `BLC_PAGE_FLD_MAP` DISABLE KEYS */;
INSERT INTO `BLC_PAGE_FLD_MAP` VALUES (1,1,'body'),(1,2,'title'),(2,3,'body'),(3,4,'body');
/*!40000 ALTER TABLE `BLC_PAGE_FLD_MAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PAGE_ITEM_CRITERIA`
--

DROP TABLE IF EXISTS `BLC_PAGE_ITEM_CRITERIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PAGE_ITEM_CRITERIA` (
  `PAGE_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_MATCH_RULE` longtext,
  `QUANTITY` int(11) NOT NULL,
  PRIMARY KEY (`PAGE_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PAGE_ITEM_CRITERIA`
--

LOCK TABLES `BLC_PAGE_ITEM_CRITERIA` WRITE;
/*!40000 ALTER TABLE `BLC_PAGE_ITEM_CRITERIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_PAGE_ITEM_CRITERIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PAGE_RULE`
--

DROP TABLE IF EXISTS `BLC_PAGE_RULE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PAGE_RULE` (
  `PAGE_RULE_ID` bigint(20) NOT NULL,
  `MATCH_RULE` longtext,
  PRIMARY KEY (`PAGE_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PAGE_RULE`
--

LOCK TABLES `BLC_PAGE_RULE` WRITE;
/*!40000 ALTER TABLE `BLC_PAGE_RULE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_PAGE_RULE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PAGE_RULE_MAP`
--

DROP TABLE IF EXISTS `BLC_PAGE_RULE_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PAGE_RULE_MAP` (
  `BLC_PAGE_PAGE_ID` bigint(20) NOT NULL,
  `PAGE_RULE_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_PAGE_PAGE_ID`,`MAP_KEY`),
  KEY `FK1ABA0CA336D91846` (`PAGE_RULE_ID`),
  KEY `FK1ABA0CA3C38455DD` (`BLC_PAGE_PAGE_ID`),
  CONSTRAINT `FK1ABA0CA3C38455DD` FOREIGN KEY (`BLC_PAGE_PAGE_ID`) REFERENCES `BLC_PAGE` (`PAGE_ID`),
  CONSTRAINT `FK1ABA0CA336D91846` FOREIGN KEY (`PAGE_RULE_ID`) REFERENCES `BLC_PAGE_RULE` (`PAGE_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PAGE_RULE_MAP`
--

LOCK TABLES `BLC_PAGE_RULE_MAP` WRITE;
/*!40000 ALTER TABLE `BLC_PAGE_RULE_MAP` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_PAGE_RULE_MAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PAGE_TMPLT`
--

DROP TABLE IF EXISTS `BLC_PAGE_TMPLT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PAGE_TMPLT` (
  `PAGE_TMPLT_ID` bigint(20) NOT NULL,
  `TMPLT_DESCR` varchar(255) DEFAULT NULL,
  `TMPLT_NAME` varchar(255) DEFAULT NULL,
  `TMPLT_PATH` varchar(255) DEFAULT NULL,
  `LOCALE_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PAGE_TMPLT_ID`),
  KEY `FK325C9D5A1E1C128` (`LOCALE_CODE`),
  CONSTRAINT `FK325C9D5A1E1C128` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `BLC_LOCALE` (`LOCALE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PAGE_TMPLT`
--

LOCK TABLES `BLC_PAGE_TMPLT` WRITE;
/*!40000 ALTER TABLE `BLC_PAGE_TMPLT` DISABLE KEYS */;
INSERT INTO `BLC_PAGE_TMPLT` VALUES (1,'This template provides a basic layout with header and footer surrounding the content and title.','Basic Template','/content/default','en');
/*!40000 ALTER TABLE `BLC_PAGE_TMPLT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PAYINFO_ADDITIONAL_FIELDS`
--

DROP TABLE IF EXISTS `BLC_PAYINFO_ADDITIONAL_FIELDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PAYINFO_ADDITIONAL_FIELDS` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `FIELD_VALUE` varchar(255) DEFAULT NULL,
  `FIELD_NAME` varchar(150) NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`,`FIELD_NAME`),
  KEY `FKF9378B824BC71D98` (`PAYMENT_ID`),
  CONSTRAINT `FKF9378B824BC71D98` FOREIGN KEY (`PAYMENT_ID`) REFERENCES `BLC_ORDER_PAYMENT` (`PAYMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PAYINFO_ADDITIONAL_FIELDS`
--

LOCK TABLES `BLC_PAYINFO_ADDITIONAL_FIELDS` WRITE;
/*!40000 ALTER TABLE `BLC_PAYINFO_ADDITIONAL_FIELDS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_PAYINFO_ADDITIONAL_FIELDS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PAYMENT_ADDITIONAL_FIELDS`
--

DROP TABLE IF EXISTS `BLC_PAYMENT_ADDITIONAL_FIELDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PAYMENT_ADDITIONAL_FIELDS` (
  `PAYMENT_RESPONSE_ITEM_ID` bigint(20) NOT NULL,
  `FIELD_VALUE` varchar(255) DEFAULT NULL,
  `FIELD_NAME` varchar(150) NOT NULL,
  PRIMARY KEY (`PAYMENT_RESPONSE_ITEM_ID`,`FIELD_NAME`),
  KEY `FKE3507032D956B1CC` (`PAYMENT_RESPONSE_ITEM_ID`),
  CONSTRAINT `FKE3507032D956B1CC` FOREIGN KEY (`PAYMENT_RESPONSE_ITEM_ID`) REFERENCES `BLC_PAYMENT_RESPONSE_ITEM` (`PAYMENT_RESPONSE_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PAYMENT_ADDITIONAL_FIELDS`
--

LOCK TABLES `BLC_PAYMENT_ADDITIONAL_FIELDS` WRITE;
/*!40000 ALTER TABLE `BLC_PAYMENT_ADDITIONAL_FIELDS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_PAYMENT_ADDITIONAL_FIELDS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PAYMENT_LOG`
--

DROP TABLE IF EXISTS `BLC_PAYMENT_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PAYMENT_LOG` (
  `PAYMENT_LOG_ID` bigint(20) NOT NULL,
  `AMOUNT_PAID` decimal(19,5) DEFAULT NULL,
  `EXCEPTION_MESSAGE` varchar(255) DEFAULT NULL,
  `LOG_TYPE` varchar(255) NOT NULL,
  `ORDER_PAYMENT_ID` bigint(20) DEFAULT NULL,
  `PAYMENT_INFO_REFERENCE_NUMBER` varchar(255) DEFAULT NULL,
  `TRANSACTION_SUCCESS` bit(1) DEFAULT NULL,
  `TRANSACTION_TIMESTAMP` datetime NOT NULL,
  `TRANSACTION_TYPE` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAYMENT_LOG_ID`),
  KEY `PAYMENTLOG_ORDERPAYMENT_INDEX` (`ORDER_PAYMENT_ID`),
  KEY `PAYMENTLOG_TRANTYPE_INDEX` (`TRANSACTION_TYPE`),
  KEY `PAYMENTLOG_LOGTYPE_INDEX` (`LOG_TYPE`),
  KEY `PAYMENTLOG_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `PAYMENTLOG_USER_INDEX` (`USER_NAME`),
  KEY `PAYMENTLOG_REFERENCE_INDEX` (`PAYMENT_INFO_REFERENCE_NUMBER`),
  KEY `FKA43703457470F437` (`CUSTOMER_ID`),
  KEY `FKA43703453E2FC4F9` (`CURRENCY_CODE`),
  CONSTRAINT `FKA43703453E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `BLC_CURRENCY` (`CURRENCY_CODE`),
  CONSTRAINT `FKA43703457470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `BLC_CUSTOMER` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PAYMENT_LOG`
--

LOCK TABLES `BLC_PAYMENT_LOG` WRITE;
/*!40000 ALTER TABLE `BLC_PAYMENT_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_PAYMENT_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PAYMENT_RESPONSE_ITEM`
--

DROP TABLE IF EXISTS `BLC_PAYMENT_RESPONSE_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PAYMENT_RESPONSE_ITEM` (
  `PAYMENT_RESPONSE_ITEM_ID` bigint(20) NOT NULL,
  `AMOUNT_PAID` decimal(19,5) DEFAULT NULL,
  `AUTHORIZATION_CODE` varchar(255) DEFAULT NULL,
  `AVS_CODE` varchar(255) DEFAULT NULL,
  `IMPLEMENTOR_RESPONSE_CODE` varchar(255) DEFAULT NULL,
  `IMPLEMENTOR_RESPONSE_TEXT` varchar(255) DEFAULT NULL,
  `MIDDLEWARE_RESPONSE_CODE` varchar(255) DEFAULT NULL,
  `MIDDLEWARE_RESPONSE_TEXT` varchar(255) DEFAULT NULL,
  `ORDER_PAYMENT_ID` bigint(20) DEFAULT NULL,
  `PAYMENT_INFO_REFERENCE_NUMBER` varchar(255) DEFAULT NULL,
  `PROCESSOR_RESPONSE_CODE` varchar(255) DEFAULT NULL,
  `PROCESSOR_RESPONSE_TEXT` varchar(255) DEFAULT NULL,
  `REFERENCE_NUMBER` varchar(255) DEFAULT NULL,
  `REMAINING_BALANCE` decimal(19,5) DEFAULT NULL,
  `TRANSACTION_ID` varchar(255) DEFAULT NULL,
  `TRANSACTION_SUCCESS` bit(1) DEFAULT NULL,
  `TRANSACTION_TIMESTAMP` datetime NOT NULL,
  `TRANSACTION_TYPE` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAYMENT_RESPONSE_ITEM_ID`),
  KEY `PAYRESPONSE_REFERENCE_INDEX` (`PAYMENT_INFO_REFERENCE_NUMBER`,`REFERENCE_NUMBER`),
  KEY `PAYRESPONSE_ORDERPAYMENT_INDEX` (`ORDER_PAYMENT_ID`),
  KEY `PAYRESPONSE_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `PAYRESPONSE_TRANTYPE_INDEX` (`TRANSACTION_TYPE`),
  KEY `FK807B8F327470F437` (`CUSTOMER_ID`),
  KEY `FK807B8F323E2FC4F9` (`CURRENCY_CODE`),
  CONSTRAINT `FK807B8F323E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `BLC_CURRENCY` (`CURRENCY_CODE`),
  CONSTRAINT `FK807B8F327470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `BLC_CUSTOMER` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PAYMENT_RESPONSE_ITEM`
--

LOCK TABLES `BLC_PAYMENT_RESPONSE_ITEM` WRITE;
/*!40000 ALTER TABLE `BLC_PAYMENT_RESPONSE_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_PAYMENT_RESPONSE_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PERSONAL_MESSAGE`
--

DROP TABLE IF EXISTS `BLC_PERSONAL_MESSAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PERSONAL_MESSAGE` (
  `PERSONAL_MESSAGE_ID` bigint(20) NOT NULL,
  `MESSAGE` varchar(255) DEFAULT NULL,
  `MESSAGE_FROM` varchar(255) DEFAULT NULL,
  `MESSAGE_TO` varchar(255) DEFAULT NULL,
  `OCCASION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PERSONAL_MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PERSONAL_MESSAGE`
--

LOCK TABLES `BLC_PERSONAL_MESSAGE` WRITE;
/*!40000 ALTER TABLE `BLC_PERSONAL_MESSAGE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_PERSONAL_MESSAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PGTMPLT_FLDGRP_XREF`
--

DROP TABLE IF EXISTS `BLC_PGTMPLT_FLDGRP_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PGTMPLT_FLDGRP_XREF` (
  `PAGE_TMPLT_ID` bigint(20) NOT NULL,
  `FLD_GROUP_ID` bigint(20) NOT NULL,
  `GROUP_ORDER` int(11) NOT NULL,
  PRIMARY KEY (`PAGE_TMPLT_ID`,`GROUP_ORDER`),
  KEY `FK99D625F6D49D3961` (`PAGE_TMPLT_ID`),
  KEY `FK99D625F66A79BDB5` (`FLD_GROUP_ID`),
  CONSTRAINT `FK99D625F66A79BDB5` FOREIGN KEY (`FLD_GROUP_ID`) REFERENCES `BLC_FLD_GROUP` (`FLD_GROUP_ID`),
  CONSTRAINT `FK99D625F6D49D3961` FOREIGN KEY (`PAGE_TMPLT_ID`) REFERENCES `BLC_PAGE_TMPLT` (`PAGE_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PGTMPLT_FLDGRP_XREF`
--

LOCK TABLES `BLC_PGTMPLT_FLDGRP_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_PGTMPLT_FLDGRP_XREF` DISABLE KEYS */;
INSERT INTO `BLC_PGTMPLT_FLDGRP_XREF` VALUES (1,1,0);
/*!40000 ALTER TABLE `BLC_PGTMPLT_FLDGRP_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PHONE`
--

DROP TABLE IF EXISTS `BLC_PHONE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PHONE` (
  `PHONE_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` bit(1) DEFAULT NULL,
  `IS_DEFAULT` bit(1) DEFAULT NULL,
  `PHONE_NUMBER` varchar(255) NOT NULL,
  PRIMARY KEY (`PHONE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PHONE`
--

LOCK TABLES `BLC_PHONE` WRITE;
/*!40000 ALTER TABLE `BLC_PHONE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_PHONE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PRODUCT`
--

DROP TABLE IF EXISTS `BLC_PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PRODUCT` (
  `PRODUCT_ID` bigint(20) NOT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `CAN_SELL_WITHOUT_OPTIONS` bit(1) DEFAULT NULL,
  `DISPLAY_TEMPLATE` varchar(255) DEFAULT NULL,
  `IS_FEATURED_PRODUCT` bit(1) NOT NULL,
  `MANUFACTURE` varchar(255) DEFAULT NULL,
  `MODEL` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `URL_KEY` varchar(255) DEFAULT NULL,
  `DEFAULT_CATEGORY_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  KEY `PRODUCT_CATEGORY_INDEX` (`DEFAULT_CATEGORY_ID`),
  KEY `FK5B95B7C9DF057C3F` (`DEFAULT_CATEGORY_ID`),
  CONSTRAINT `FK5B95B7C9DF057C3F` FOREIGN KEY (`DEFAULT_CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PRODUCT`
--

LOCK TABLES `BLC_PRODUCT` WRITE;
/*!40000 ALTER TABLE `BLC_PRODUCT` DISABLE KEYS */;
INSERT INTO `BLC_PRODUCT` VALUES (1,NULL,NULL,NULL,'','Blair\'s',NULL,'/hot-sauces/sudden_death_sauce',NULL,2002),(2,NULL,NULL,NULL,'\0','Blair\'s',NULL,'/hot-sauces/sweet_death_sauce',NULL,2002),(3,NULL,NULL,NULL,'\0','Salsa Express',NULL,'/hot-sauces/hoppin_hot_sauce',NULL,2002),(4,NULL,NULL,NULL,'\0','Spice Exchange',NULL,'/hot-sauces/day_of_the_dead_chipotle_hot_sauce',NULL,2002),(5,NULL,NULL,NULL,'\0','Spice Exchange',NULL,'/hot-sauces/day_of_the_dead_habanero_hot_sauce',NULL,2002),(6,NULL,NULL,NULL,'\0','Spice Exchange',NULL,'/hot-sauces/day_of_the_dead_scotch_bonnet_sauce',NULL,2002),(7,NULL,NULL,NULL,'\0','Garden Row',NULL,'/hot-sauces/green_ghost',NULL,2002),(8,NULL,NULL,NULL,'\0','D. L. Jardine\'s',NULL,'/hot-sauces/blazin_saddle_hot_habanero_pepper_sauce',NULL,2002),(9,NULL,NULL,NULL,'','Figueroa Brothers',NULL,'/hot-sauces/armageddon_hot_sauce_to_end_all',NULL,2002),(10,NULL,NULL,NULL,'\0','Figueroa Brothers',NULL,'/hot-sauces/dr_chilemeisters_insane_hot_sauce',NULL,2002),(11,NULL,NULL,NULL,'\0','Brazos Legends',NULL,'/hot-sauces/bull_snort_cowboy_cayenne_pepper_hot_sauce',NULL,2002),(12,NULL,NULL,NULL,'\0','Garden Row',NULL,'/hot-sauces/cafe_louisiane_sweet_cajun_blackening_sauce',NULL,2002),(13,NULL,NULL,NULL,'','Brazos Legends',NULL,'/hot-sauces/bull_snort_smokin_toncils_hot_sauce',NULL,2002),(14,NULL,NULL,NULL,'\0','Dave\'s Gourmet',NULL,'/hot-sauces/cool_cayenne_pepper_hot_sauce',NULL,2002),(15,NULL,NULL,NULL,'\0','Dave\'s Gourmet',NULL,'/hot-sauces/roasted_garlic_hot_sauce',NULL,2002),(16,NULL,NULL,NULL,'\0','Dave\'s Gourmet',NULL,'/hot-sauces/scotch_bonnet_hot_sauce',NULL,2002),(17,NULL,NULL,NULL,'\0','Dave\'s Gourmet',NULL,'/hot-sauces/insanity_sauce',NULL,2002),(18,NULL,NULL,NULL,'\0','Dave\'s Gourmet',NULL,'/hot-sauces/hurtin_jalepeno_hot_sauce',NULL,2002),(19,NULL,NULL,NULL,'\0','Dave\'s Gourmet',NULL,'/hot-sauces/roasted_red_pepper_chipotle_hot_sauce',NULL,2002),(100,NULL,NULL,NULL,'\0','The Heat Clinic',NULL,'/merchandise/hawt_like_a_habanero_mens',NULL,2003),(200,NULL,NULL,NULL,'\0','The Heat Clinic',NULL,'/merchandise/hawt_like_a_habanero_womens',NULL,2003),(300,NULL,NULL,NULL,'\0','The Heat Clinic',NULL,'/merchandise/heat_clinic_hand-drawn_mens',NULL,2003),(400,NULL,NULL,NULL,'\0','The Heat Clinic',NULL,'/merchandise/heat_clinic_hand-drawn_womens',NULL,2003),(500,NULL,NULL,NULL,'\0','The Heat Clinic',NULL,'/merchandise/heat_clinic_mascot_mens',NULL,2003),(600,NULL,NULL,NULL,'\0','The Heat Clinic',NULL,'/merchandise/heat_clinic_mascot_womens',NULL,2003);
/*!40000 ALTER TABLE `BLC_PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PRODUCT_ATTRIBUTE`
--

DROP TABLE IF EXISTS `BLC_PRODUCT_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PRODUCT_ATTRIBUTE` (
  `PRODUCT_ATTRIBUTE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `SEARCHABLE` bit(1) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PRODUCT_ATTRIBUTE_ID`),
  KEY `PRODUCTATTRIBUTE_INDEX` (`PRODUCT_ID`),
  KEY `PRODUCTATTRIBUTE_NAME_INDEX` (`NAME`),
  KEY `FK56CE05865F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FK56CE05865F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PRODUCT_ATTRIBUTE`
--

LOCK TABLES `BLC_PRODUCT_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `BLC_PRODUCT_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `BLC_PRODUCT_ATTRIBUTE` VALUES (1,'heatRange',NULL,'4',1),(2,'heatRange',NULL,'1',2),(3,'heatRange',NULL,'2',3),(4,'heatRange',NULL,'2',4),(5,'heatRange',NULL,'4',5),(6,'heatRange',NULL,'4',6),(7,'heatRange',NULL,'3',7),(8,'heatRange',NULL,'4',8),(9,'heatRange',NULL,'5',9),(10,'heatRange',NULL,'5',10),(11,'heatRange',NULL,'2',11),(12,'heatRange',NULL,'1',12),(13,'heatRange',NULL,'2',13),(14,'heatRange',NULL,'2',14),(15,'heatRange',NULL,'1',15),(16,'heatRange',NULL,'3',16),(17,'heatRange',NULL,'5',17),(18,'heatRange',NULL,'3',18),(19,'heatRange',NULL,'1',19);
/*!40000 ALTER TABLE `BLC_PRODUCT_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PRODUCT_BUNDLE`
--

DROP TABLE IF EXISTS `BLC_PRODUCT_BUNDLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PRODUCT_BUNDLE` (
  `AUTO_BUNDLE` bit(1) DEFAULT NULL,
  `BUNDLE_PROMOTABLE` bit(1) DEFAULT NULL,
  `ITEMS_PROMOTABLE` bit(1) DEFAULT NULL,
  `PRICING_MODEL` varchar(255) DEFAULT NULL,
  `BUNDLE_PRIORITY` int(11) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  KEY `FK8CC5B85F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FK8CC5B85F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PRODUCT_BUNDLE`
--

LOCK TABLES `BLC_PRODUCT_BUNDLE` WRITE;
/*!40000 ALTER TABLE `BLC_PRODUCT_BUNDLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_PRODUCT_BUNDLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PRODUCT_CROSS_SALE`
--

DROP TABLE IF EXISTS `BLC_PRODUCT_CROSS_SALE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PRODUCT_CROSS_SALE` (
  `CROSS_SALE_PRODUCT_ID` bigint(20) NOT NULL,
  `PROMOTION_MESSAGE` varchar(255) DEFAULT NULL,
  `SEQUENCE` bigint(20) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `RELATED_SALE_PRODUCT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CROSS_SALE_PRODUCT_ID`),
  KEY `CROSSSALE_INDEX` (`PRODUCT_ID`),
  KEY `CROSSSALE_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `CROSSSALE_RELATED_INDEX` (`RELATED_SALE_PRODUCT_ID`),
  KEY `FK8324FB3C62D84F9B` (`RELATED_SALE_PRODUCT_ID`),
  KEY `FK8324FB3C15D1A13D` (`CATEGORY_ID`),
  KEY `FK8324FB3C5F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FK8324FB3C5F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`),
  CONSTRAINT `FK8324FB3C15D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`),
  CONSTRAINT `FK8324FB3C62D84F9B` FOREIGN KEY (`RELATED_SALE_PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PRODUCT_CROSS_SALE`
--

LOCK TABLES `BLC_PRODUCT_CROSS_SALE` WRITE;
/*!40000 ALTER TABLE `BLC_PRODUCT_CROSS_SALE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_PRODUCT_CROSS_SALE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PRODUCT_FEATURED`
--

DROP TABLE IF EXISTS `BLC_PRODUCT_FEATURED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PRODUCT_FEATURED` (
  `FEATURED_PRODUCT_ID` bigint(20) NOT NULL,
  `PROMOTION_MESSAGE` varchar(255) DEFAULT NULL,
  `SEQUENCE` bigint(20) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`FEATURED_PRODUCT_ID`),
  KEY `PRODFEATURED_PRODUCT_INDEX` (`PRODUCT_ID`),
  KEY `PRODFEATURED_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `FK4C49FFE415D1A13D` (`CATEGORY_ID`),
  KEY `FK4C49FFE45F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FK4C49FFE45F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`),
  CONSTRAINT `FK4C49FFE415D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PRODUCT_FEATURED`
--

LOCK TABLES `BLC_PRODUCT_FEATURED` WRITE;
/*!40000 ALTER TABLE `BLC_PRODUCT_FEATURED` DISABLE KEYS */;
INSERT INTO `BLC_PRODUCT_FEATURED` VALUES (1,NULL,1,1,18),(2,NULL,2,1,15),(3,NULL,3,1,200),(4,NULL,4,1,100),(5,NULL,1,2003,4),(8,NULL,4,2002,500),(9,NULL,4,2002,200),(10,NULL,4,2002,300);
/*!40000 ALTER TABLE `BLC_PRODUCT_FEATURED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PRODUCT_OPTION`
--

DROP TABLE IF EXISTS `BLC_PRODUCT_OPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PRODUCT_OPTION` (
  `PRODUCT_OPTION_ID` bigint(20) NOT NULL,
  `ATTRIBUTE_NAME` varchar(255) DEFAULT NULL,
  `DISPLAY_ORDER` int(11) DEFAULT NULL,
  `LABEL` varchar(255) DEFAULT NULL,
  `REQUIRED` bit(1) DEFAULT NULL,
  `OPTION_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PRODUCT_OPTION`
--

LOCK TABLES `BLC_PRODUCT_OPTION` WRITE;
/*!40000 ALTER TABLE `BLC_PRODUCT_OPTION` DISABLE KEYS */;
INSERT INTO `BLC_PRODUCT_OPTION` VALUES (1,'COLOR',NULL,'Shirt Color','','COLOR'),(2,'SIZE',NULL,'Shirt Size','','SIZE');
/*!40000 ALTER TABLE `BLC_PRODUCT_OPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PRODUCT_OPTION_VALUE`
--

DROP TABLE IF EXISTS `BLC_PRODUCT_OPTION_VALUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PRODUCT_OPTION_VALUE` (
  `PRODUCT_OPTION_VALUE_ID` bigint(20) NOT NULL,
  `ATTRIBUTE_VALUE` varchar(255) DEFAULT NULL,
  `DISPLAY_ORDER` bigint(20) DEFAULT NULL,
  `PRICE_ADJUSTMENT` decimal(19,5) DEFAULT NULL,
  `PRODUCT_OPTION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_VALUE_ID`),
  KEY `FK6DEEEDBD92EA8136` (`PRODUCT_OPTION_ID`),
  CONSTRAINT `FK6DEEEDBD92EA8136` FOREIGN KEY (`PRODUCT_OPTION_ID`) REFERENCES `BLC_PRODUCT_OPTION` (`PRODUCT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PRODUCT_OPTION_VALUE`
--

LOCK TABLES `BLC_PRODUCT_OPTION_VALUE` WRITE;
/*!40000 ALTER TABLE `BLC_PRODUCT_OPTION_VALUE` DISABLE KEYS */;
INSERT INTO `BLC_PRODUCT_OPTION_VALUE` VALUES (1,'Black',1,NULL,1),(2,'Red',2,NULL,1),(3,'Silver',3,NULL,1),(11,'S',1,NULL,2),(12,'M',2,NULL,2),(13,'L',3,NULL,2),(14,'XL',4,NULL,2);
/*!40000 ALTER TABLE `BLC_PRODUCT_OPTION_VALUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PRODUCT_OPTION_XREF`
--

DROP TABLE IF EXISTS `BLC_PRODUCT_OPTION_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PRODUCT_OPTION_XREF` (
  `PRODUCT_OPTION_ID` bigint(20) NOT NULL,
  `PRODUCT_ID` bigint(20) NOT NULL,
  KEY `FKDA42AB2F92EA8136` (`PRODUCT_OPTION_ID`),
  KEY `FKDA42AB2F5F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FKDA42AB2F5F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`),
  CONSTRAINT `FKDA42AB2F92EA8136` FOREIGN KEY (`PRODUCT_OPTION_ID`) REFERENCES `BLC_PRODUCT_OPTION` (`PRODUCT_OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PRODUCT_OPTION_XREF`
--

LOCK TABLES `BLC_PRODUCT_OPTION_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_PRODUCT_OPTION_XREF` DISABLE KEYS */;
INSERT INTO `BLC_PRODUCT_OPTION_XREF` VALUES (1,100),(1,200),(1,300),(1,400),(1,500),(1,600),(2,100),(2,200),(2,300),(2,400),(2,500),(2,600);
/*!40000 ALTER TABLE `BLC_PRODUCT_OPTION_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PRODUCT_SKU_XREF`
--

DROP TABLE IF EXISTS `BLC_PRODUCT_SKU_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PRODUCT_SKU_XREF` (
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_ID`),
  KEY `FKF2DBF6D3B78C9977` (`SKU_ID`),
  KEY `FKF2DBF6D35F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FKF2DBF6D35F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`),
  CONSTRAINT `FKF2DBF6D3B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `BLC_SKU` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PRODUCT_SKU_XREF`
--

LOCK TABLES `BLC_PRODUCT_SKU_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_PRODUCT_SKU_XREF` DISABLE KEYS */;
INSERT INTO `BLC_PRODUCT_SKU_XREF` VALUES (100,111),(100,112),(100,113),(100,114),(100,121),(100,122),(100,123),(100,124),(100,131),(100,132),(100,133),(100,134),(200,211),(200,212),(200,213),(200,214),(200,221),(200,222),(200,223),(200,224),(200,231),(200,232),(200,233),(200,234),(300,311),(300,312),(300,313),(300,314),(300,321),(300,322),(300,323),(300,324),(300,331),(300,332),(300,333),(300,334),(400,411),(400,412),(400,413),(400,414),(400,421),(400,422),(400,423),(400,424),(400,431),(400,432),(400,433),(400,434),(500,511),(500,512),(500,513),(500,514),(500,521),(500,522),(500,523),(500,524),(500,531),(500,532),(500,533),(500,534),(600,611),(600,612),(600,613),(600,614),(600,621),(600,622),(600,623),(600,624),(600,631),(600,632),(600,633),(600,634);
/*!40000 ALTER TABLE `BLC_PRODUCT_SKU_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_PRODUCT_UP_SALE`
--

DROP TABLE IF EXISTS `BLC_PRODUCT_UP_SALE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_PRODUCT_UP_SALE` (
  `UP_SALE_PRODUCT_ID` bigint(20) NOT NULL,
  `PROMOTION_MESSAGE` varchar(255) DEFAULT NULL,
  `SEQUENCE` bigint(20) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `RELATED_SALE_PRODUCT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`UP_SALE_PRODUCT_ID`),
  KEY `UPSALE_RELATED_INDEX` (`RELATED_SALE_PRODUCT_ID`),
  KEY `UPSALE_PRODUCT_INDEX` (`PRODUCT_ID`),
  KEY `UPSALE_CATEGORY_INDEX` (`CATEGORY_ID`),
  KEY `FKF69054F562D84F9B` (`RELATED_SALE_PRODUCT_ID`),
  KEY `FKF69054F515D1A13D` (`CATEGORY_ID`),
  KEY `FKF69054F55F11A0B7` (`PRODUCT_ID`),
  CONSTRAINT `FKF69054F55F11A0B7` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`),
  CONSTRAINT `FKF69054F515D1A13D` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `BLC_CATEGORY` (`CATEGORY_ID`),
  CONSTRAINT `FKF69054F562D84F9B` FOREIGN KEY (`RELATED_SALE_PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_PRODUCT_UP_SALE`
--

LOCK TABLES `BLC_PRODUCT_UP_SALE` WRITE;
/*!40000 ALTER TABLE `BLC_PRODUCT_UP_SALE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_PRODUCT_UP_SALE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_QUAL_CRIT_OFFER_XREF`
--

DROP TABLE IF EXISTS `BLC_QUAL_CRIT_OFFER_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_QUAL_CRIT_OFFER_XREF` (
  `OFFER_ID` bigint(20) NOT NULL,
  `OFFER_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`OFFER_ID`,`OFFER_ITEM_CRITERIA_ID`),
  UNIQUE KEY `OFFER_ITEM_CRITERIA_ID` (`OFFER_ITEM_CRITERIA_ID`),
  KEY `FKD592E919D5F3FAF4` (`OFFER_ID`),
  KEY `FKD592E9193615A91A` (`OFFER_ITEM_CRITERIA_ID`),
  CONSTRAINT `FKD592E9193615A91A` FOREIGN KEY (`OFFER_ITEM_CRITERIA_ID`) REFERENCES `BLC_OFFER_ITEM_CRITERIA` (`OFFER_ITEM_CRITERIA_ID`),
  CONSTRAINT `FKD592E919D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_QUAL_CRIT_OFFER_XREF`
--

LOCK TABLES `BLC_QUAL_CRIT_OFFER_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_QUAL_CRIT_OFFER_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_QUAL_CRIT_OFFER_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_QUAL_CRIT_PAGE_XREF`
--

DROP TABLE IF EXISTS `BLC_QUAL_CRIT_PAGE_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_QUAL_CRIT_PAGE_XREF` (
  `PAGE_ID` bigint(20) NOT NULL DEFAULT '0',
  `PAGE_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PAGE_ID`,`PAGE_ITEM_CRITERIA_ID`),
  UNIQUE KEY `PAGE_ITEM_CRITERIA_ID` (`PAGE_ITEM_CRITERIA_ID`),
  KEY `FK874BE590378418CD` (`PAGE_ITEM_CRITERIA_ID`),
  KEY `FK874BE590883C2667` (`PAGE_ID`),
  CONSTRAINT `FK874BE590883C2667` FOREIGN KEY (`PAGE_ID`) REFERENCES `BLC_PAGE` (`PAGE_ID`),
  CONSTRAINT `FK874BE590378418CD` FOREIGN KEY (`PAGE_ITEM_CRITERIA_ID`) REFERENCES `BLC_PAGE_ITEM_CRITERIA` (`PAGE_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_QUAL_CRIT_PAGE_XREF`
--

LOCK TABLES `BLC_QUAL_CRIT_PAGE_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_QUAL_CRIT_PAGE_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_QUAL_CRIT_PAGE_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_QUAL_CRIT_SC_XREF`
--

DROP TABLE IF EXISTS `BLC_QUAL_CRIT_SC_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_QUAL_CRIT_SC_XREF` (
  `SC_ID` bigint(20) NOT NULL,
  `SC_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SC_ID`,`SC_ITEM_CRITERIA_ID`),
  UNIQUE KEY `SC_ITEM_CRITERIA_ID` (`SC_ITEM_CRITERIA_ID`),
  KEY `FKC4A353AF85C77F2B` (`SC_ITEM_CRITERIA_ID`),
  KEY `FKC4A353AF13D95585` (`SC_ID`),
  CONSTRAINT `FKC4A353AF13D95585` FOREIGN KEY (`SC_ID`) REFERENCES `BLC_SC` (`SC_ID`),
  CONSTRAINT `FKC4A353AF85C77F2B` FOREIGN KEY (`SC_ITEM_CRITERIA_ID`) REFERENCES `BLC_SC_ITEM_CRITERIA` (`SC_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_QUAL_CRIT_SC_XREF`
--

LOCK TABLES `BLC_QUAL_CRIT_SC_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_QUAL_CRIT_SC_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_QUAL_CRIT_SC_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_RATING_DETAIL`
--

DROP TABLE IF EXISTS `BLC_RATING_DETAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_RATING_DETAIL` (
  `RATING_DETAIL_ID` bigint(20) NOT NULL,
  `RATING` double NOT NULL,
  `RATING_SUBMITTED_DATE` datetime NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `RATING_SUMMARY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`RATING_DETAIL_ID`),
  KEY `RATING_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `FKC9D04ADD4E76BF4` (`RATING_SUMMARY_ID`),
  KEY `FKC9D04AD7470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FKC9D04AD7470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `BLC_CUSTOMER` (`CUSTOMER_ID`),
  CONSTRAINT `FKC9D04ADD4E76BF4` FOREIGN KEY (`RATING_SUMMARY_ID`) REFERENCES `BLC_RATING_SUMMARY` (`RATING_SUMMARY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_RATING_DETAIL`
--

LOCK TABLES `BLC_RATING_DETAIL` WRITE;
/*!40000 ALTER TABLE `BLC_RATING_DETAIL` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_RATING_DETAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_REVIEW_DETAIL`
--

DROP TABLE IF EXISTS `BLC_REVIEW_DETAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_REVIEW_DETAIL` (
  `REVIEW_DETAIL_ID` bigint(20) NOT NULL,
  `HELPFUL_COUNT` int(11) NOT NULL,
  `NOT_HELPFUL_COUNT` int(11) NOT NULL,
  `REVIEW_SUBMITTED_DATE` datetime NOT NULL,
  `REVIEW_STATUS` varchar(255) NOT NULL,
  `REVIEW_TEXT` varchar(255) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `RATING_DETAIL_ID` bigint(20) DEFAULT NULL,
  `RATING_SUMMARY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`REVIEW_DETAIL_ID`),
  KEY `REVIEWDETAIL_SUMMARY_INDEX` (`RATING_SUMMARY_ID`),
  KEY `REVIEWDETAIL_RATING_INDEX` (`RATING_DETAIL_ID`),
  KEY `REVIEWDETAIL_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `REVIEWDETAIL_STATUS_INDEX` (`REVIEW_STATUS`),
  KEY `FK9CD7E692D4E76BF4` (`RATING_SUMMARY_ID`),
  KEY `FK9CD7E6927470F437` (`CUSTOMER_ID`),
  KEY `FK9CD7E69245DC39E0` (`RATING_DETAIL_ID`),
  CONSTRAINT `FK9CD7E69245DC39E0` FOREIGN KEY (`RATING_DETAIL_ID`) REFERENCES `BLC_RATING_DETAIL` (`RATING_DETAIL_ID`),
  CONSTRAINT `FK9CD7E6927470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `BLC_CUSTOMER` (`CUSTOMER_ID`),
  CONSTRAINT `FK9CD7E692D4E76BF4` FOREIGN KEY (`RATING_SUMMARY_ID`) REFERENCES `BLC_RATING_SUMMARY` (`RATING_SUMMARY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_REVIEW_DETAIL`
--

LOCK TABLES `BLC_REVIEW_DETAIL` WRITE;
/*!40000 ALTER TABLE `BLC_REVIEW_DETAIL` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_REVIEW_DETAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_REVIEW_FEEDBACK`
--

DROP TABLE IF EXISTS `BLC_REVIEW_FEEDBACK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_REVIEW_FEEDBACK` (
  `REVIEW_FEEDBACK_ID` bigint(20) NOT NULL,
  `IS_HELPFUL` bit(1) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `REVIEW_DETAIL_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`REVIEW_FEEDBACK_ID`),
  KEY `REVIEWFEED_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `REVIEWFEED_DETAIL_INDEX` (`REVIEW_DETAIL_ID`),
  KEY `FK7CC92986AE4769D6` (`REVIEW_DETAIL_ID`),
  KEY `FK7CC929867470F437` (`CUSTOMER_ID`),
  CONSTRAINT `FK7CC929867470F437` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `BLC_CUSTOMER` (`CUSTOMER_ID`),
  CONSTRAINT `FK7CC92986AE4769D6` FOREIGN KEY (`REVIEW_DETAIL_ID`) REFERENCES `BLC_REVIEW_DETAIL` (`REVIEW_DETAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_REVIEW_FEEDBACK`
--

LOCK TABLES `BLC_REVIEW_FEEDBACK` WRITE;
/*!40000 ALTER TABLE `BLC_REVIEW_FEEDBACK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_REVIEW_FEEDBACK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SANDBOX_ACTION`
--

DROP TABLE IF EXISTS `BLC_SANDBOX_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SANDBOX_ACTION` (
  `SANDBOX_ACTION_ID` bigint(20) NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `ACTION_COMMENT` varchar(255) DEFAULT NULL,
  `ACTION_TYPE` varchar(255) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SANDBOX_ACTION_ID`),
  KEY `FK3657DE9424568C27` (`CREATED_BY`),
  KEY `FK3657DE94C1167574` (`UPDATED_BY`),
  CONSTRAINT `FK3657DE94C1167574` FOREIGN KEY (`UPDATED_BY`) REFERENCES `BLC_ADMIN_USER` (`ADMIN_USER_ID`),
  CONSTRAINT `FK3657DE9424568C27` FOREIGN KEY (`CREATED_BY`) REFERENCES `BLC_ADMIN_USER` (`ADMIN_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SANDBOX_ACTION`
--

LOCK TABLES `BLC_SANDBOX_ACTION` WRITE;
/*!40000 ALTER TABLE `BLC_SANDBOX_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SANDBOX_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SANDBOX_ITEM`
--

DROP TABLE IF EXISTS `BLC_SANDBOX_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SANDBOX_ITEM` (
  `SANDBOX_ITEM_ID` bigint(20) NOT NULL,
  `ARCHIVED_FLAG` char(1) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `GRP_DESCRIPTION` varchar(255) DEFAULT NULL,
  `ORIGINAL_ITEM_ID` bigint(20) DEFAULT NULL,
  `ORIG_SANDBOX_ID` bigint(20) DEFAULT NULL,
  `SANDBOX_ID` bigint(20) DEFAULT NULL,
  `SANDBOX_ITEM_TYPE` varchar(255) DEFAULT NULL,
  `SANDBOX_OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `TEMPORARY_ITEM_ID` bigint(20) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SANDBOX_ITEM_ID`),
  KEY `ARCHIVED_FLAG_INDEX` (`ARCHIVED_FLAG`),
  KEY `SANDBOX_ITEM_TYPE_INDEX` (`SANDBOX_ITEM_TYPE`),
  KEY `SB_ORIG_ITEM_ID_INDEX` (`ORIGINAL_ITEM_ID`),
  KEY `TEMP_ITEM_INDEX` (`TEMPORARY_ITEM_ID`),
  KEY `SANDBOX_ID_INDEX` (`SANDBOX_ID`),
  KEY `ORIG_SANDBOX_ID_INDEX` (`ORIG_SANDBOX_ID`),
  KEY `FK48435EF124568C27` (`CREATED_BY`),
  KEY `FK48435EF1C1167574` (`UPDATED_BY`),
  CONSTRAINT `FK48435EF1C1167574` FOREIGN KEY (`UPDATED_BY`) REFERENCES `BLC_ADMIN_USER` (`ADMIN_USER_ID`),
  CONSTRAINT `FK48435EF124568C27` FOREIGN KEY (`CREATED_BY`) REFERENCES `BLC_ADMIN_USER` (`ADMIN_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SANDBOX_ITEM`
--

LOCK TABLES `BLC_SANDBOX_ITEM` WRITE;
/*!40000 ALTER TABLE `BLC_SANDBOX_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SANDBOX_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SC`
--

DROP TABLE IF EXISTS `BLC_SC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SC` (
  `SC_ID` bigint(20) NOT NULL,
  `ARCHIVED_FLAG` bit(1) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `CONTENT_NAME` varchar(255) NOT NULL,
  `DELETED_FLAG` bit(1) DEFAULT NULL,
  `LOCKED_FLAG` bit(1) DEFAULT NULL,
  `OFFLINE_FLAG` bit(1) DEFAULT NULL,
  `ORIG_ITEM_ID` bigint(20) DEFAULT NULL,
  `PRIORITY` int(11) NOT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `LOCALE_CODE` varchar(255) NOT NULL,
  `ORIG_SANDBOX_ID` bigint(20) DEFAULT NULL,
  `SANDBOX_ID` bigint(20) DEFAULT NULL,
  `SC_TYPE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SC_ID`),
  KEY `SC_ORIG_ITEM_ID_INDEX` (`ORIG_ITEM_ID`),
  KEY `SC_LCKD_FLG_INDX` (`LOCKED_FLAG`),
  KEY `SC_DLTD_FLG_INDX` (`DELETED_FLAG`),
  KEY `CONTENT_NAME_INDEX` (`CONTENT_NAME`),
  KEY `SC_OFFLN_FLG_INDX` (`OFFLINE_FLAG`),
  KEY `SC_ARCHVD_FLG_INDX` (`ARCHIVED_FLAG`),
  KEY `FK74EEB71624568C27` (`CREATED_BY`),
  KEY `FK74EEB71671EBFA46` (`SC_TYPE_ID`),
  KEY `FK74EEB716A1E1C128` (`LOCALE_CODE`),
  KEY `FK74EEB716579FE59D` (`SANDBOX_ID`),
  KEY `FK74EEB716F9C4A5B` (`ORIG_SANDBOX_ID`),
  KEY `FK74EEB716C1167574` (`UPDATED_BY`),
  CONSTRAINT `FK74EEB716C1167574` FOREIGN KEY (`UPDATED_BY`) REFERENCES `BLC_ADMIN_USER` (`ADMIN_USER_ID`),
  CONSTRAINT `FK74EEB71624568C27` FOREIGN KEY (`CREATED_BY`) REFERENCES `BLC_ADMIN_USER` (`ADMIN_USER_ID`),
  CONSTRAINT `FK74EEB716579FE59D` FOREIGN KEY (`SANDBOX_ID`) REFERENCES `BLC_SANDBOX` (`SANDBOX_ID`),
  CONSTRAINT `FK74EEB71671EBFA46` FOREIGN KEY (`SC_TYPE_ID`) REFERENCES `BLC_SC_TYPE` (`SC_TYPE_ID`),
  CONSTRAINT `FK74EEB716A1E1C128` FOREIGN KEY (`LOCALE_CODE`) REFERENCES `BLC_LOCALE` (`LOCALE_CODE`),
  CONSTRAINT `FK74EEB716F9C4A5B` FOREIGN KEY (`ORIG_SANDBOX_ID`) REFERENCES `BLC_SANDBOX` (`SANDBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SC`
--

LOCK TABLES `BLC_SC` WRITE;
/*!40000 ALTER TABLE `BLC_SC` DISABLE KEYS */;
INSERT INTO `BLC_SC` VALUES (100,'\0','2013-05-11 11:42:21','2013-05-11 11:42:21','Buy One Get One - Twice the Burn','\0',NULL,'\0',NULL,5,1,1,'en',NULL,NULL,1),(101,'\0','2013-05-11 11:42:21','2013-05-11 11:42:21','Shirt Special - 20% off all shirts','\0',NULL,'\0',NULL,1,1,1,'en',NULL,NULL,1),(102,'\0','2013-05-11 11:42:21','2013-05-11 11:42:21','Member Special - $10 off next order over $50','\0',NULL,'\0',NULL,5,1,1,'en',NULL,NULL,1),(110,'\0','2013-05-11 11:42:21','2013-05-11 11:42:21','Home Page Snippet - Aficionado','\0',NULL,'\0',NULL,5,1,1,'en',NULL,NULL,2),(130,'\0','2013-05-11 11:42:21','2013-05-11 11:42:21','Home Page Featured Products Title','\0',NULL,'\0',NULL,5,1,1,'en',NULL,NULL,3),(140,'\0','2013-05-11 11:42:21','2013-05-11 11:42:21','RHS - The Essentials Collection','\0',NULL,'\0',NULL,5,1,1,'en',NULL,NULL,4);
/*!40000 ALTER TABLE `BLC_SC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SC_FLD`
--

DROP TABLE IF EXISTS `BLC_SC_FLD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SC_FLD` (
  `SC_FLD_ID` bigint(20) NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `FLD_KEY` varchar(255) DEFAULT NULL,
  `LOB_VALUE` longtext,
  `VALUE` varchar(255) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `SC_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SC_FLD_ID`),
  KEY `FK621D7B9524568C27` (`CREATED_BY`),
  KEY `FK621D7B95C1167574` (`UPDATED_BY`),
  KEY `FK621D7B9513D95585` (`SC_ID`),
  CONSTRAINT `FK621D7B9513D95585` FOREIGN KEY (`SC_ID`) REFERENCES `BLC_SC` (`SC_ID`),
  CONSTRAINT `FK621D7B9524568C27` FOREIGN KEY (`CREATED_BY`) REFERENCES `BLC_ADMIN_USER` (`ADMIN_USER_ID`),
  CONSTRAINT `FK621D7B95C1167574` FOREIGN KEY (`UPDATED_BY`) REFERENCES `BLC_ADMIN_USER` (`ADMIN_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SC_FLD`
--

LOCK TABLES `BLC_SC_FLD` WRITE;
/*!40000 ALTER TABLE `BLC_SC_FLD` DISABLE KEYS */;
INSERT INTO `BLC_SC_FLD` VALUES (1,'2013-05-11 11:42:21',NULL,'imageUrl',NULL,'/img/banners/buy-one-get-one-home-banner.jpg',1,NULL,100),(2,'2013-05-11 11:42:21',NULL,'targetUrl',NULL,'/hot-sauces',1,NULL,100),(3,'2013-05-11 11:42:21',NULL,'imageUrl',NULL,'/img/banners/shirt-special.jpg',1,NULL,101),(4,'2013-05-11 11:42:21',NULL,'targetUrl',NULL,'/merchandise',1,NULL,101),(5,'2013-05-11 11:42:21',NULL,'imageUrl',NULL,'/img/banners/member-special.jpg',1,NULL,102),(6,'2013-05-11 11:42:21',NULL,'targetUrl',NULL,'/register',1,NULL,102),(9,'2013-05-11 11:42:21',NULL,'htmlContent',NULL,'<h2>HOT SAUCE AFICIONADO?</h2> Click to join our Heat Clinic Frequent Care Program. The place to get all the deals on burn treatment.',1,NULL,110),(11,'2013-05-11 11:42:21',NULL,'messageText',NULL,'The Heat Clinic\'s Top Selling Sauces',1,NULL,130),(12,'2013-05-11 11:42:21',NULL,'imageUrl',NULL,'/img/rhs-ad.jpg',1,NULL,140),(13,'2013-05-11 11:42:21',NULL,'targetUrl',NULL,'/hot-sauces',1,NULL,140);
/*!40000 ALTER TABLE `BLC_SC_FLD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SC_FLDGRP_XREF`
--

DROP TABLE IF EXISTS `BLC_SC_FLDGRP_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SC_FLDGRP_XREF` (
  `SC_FLD_TMPLT_ID` bigint(20) NOT NULL,
  `FLD_GROUP_ID` bigint(20) NOT NULL,
  `GROUP_ORDER` int(11) NOT NULL,
  PRIMARY KEY (`SC_FLD_TMPLT_ID`,`GROUP_ORDER`),
  KEY `FK71612AEAF6B0BA84` (`SC_FLD_TMPLT_ID`),
  KEY `FK71612AEA6A79BDB5` (`FLD_GROUP_ID`),
  CONSTRAINT `FK71612AEA6A79BDB5` FOREIGN KEY (`FLD_GROUP_ID`) REFERENCES `BLC_FLD_GROUP` (`FLD_GROUP_ID`),
  CONSTRAINT `FK71612AEAF6B0BA84` FOREIGN KEY (`SC_FLD_TMPLT_ID`) REFERENCES `BLC_SC_FLD_TMPLT` (`SC_FLD_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SC_FLDGRP_XREF`
--

LOCK TABLES `BLC_SC_FLDGRP_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_SC_FLDGRP_XREF` DISABLE KEYS */;
INSERT INTO `BLC_SC_FLDGRP_XREF` VALUES (1,4,0),(2,5,0),(3,6,0);
/*!40000 ALTER TABLE `BLC_SC_FLDGRP_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SC_FLD_MAP`
--

DROP TABLE IF EXISTS `BLC_SC_FLD_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SC_FLD_MAP` (
  `SC_ID` bigint(20) NOT NULL,
  `SC_FLD_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`SC_ID`,`MAP_KEY`),
  KEY `FKD9480192DD6FD28A` (`SC_FLD_ID`),
  KEY `FKD948019213D95585` (`SC_ID`),
  CONSTRAINT `FKD948019213D95585` FOREIGN KEY (`SC_ID`) REFERENCES `BLC_SC` (`SC_ID`),
  CONSTRAINT `FKD9480192DD6FD28A` FOREIGN KEY (`SC_FLD_ID`) REFERENCES `BLC_SC_FLD` (`SC_FLD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SC_FLD_MAP`
--

LOCK TABLES `BLC_SC_FLD_MAP` WRITE;
/*!40000 ALTER TABLE `BLC_SC_FLD_MAP` DISABLE KEYS */;
INSERT INTO `BLC_SC_FLD_MAP` VALUES (100,1,'imageUrl'),(100,2,'targetUrl'),(101,3,'imageUrl'),(101,4,'targetUrl'),(102,5,'imageUrl'),(102,6,'targetUrl'),(110,9,'htmlContent'),(130,11,'messageText'),(140,12,'imageUrl'),(140,13,'targetUrl');
/*!40000 ALTER TABLE `BLC_SC_FLD_MAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SC_FLD_TMPLT`
--

DROP TABLE IF EXISTS `BLC_SC_FLD_TMPLT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SC_FLD_TMPLT` (
  `SC_FLD_TMPLT_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SC_FLD_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SC_FLD_TMPLT`
--

LOCK TABLES `BLC_SC_FLD_TMPLT` WRITE;
/*!40000 ALTER TABLE `BLC_SC_FLD_TMPLT` DISABLE KEYS */;
INSERT INTO `BLC_SC_FLD_TMPLT` VALUES (1,'Ad Template'),(2,'HTML Template'),(3,'Message Template');
/*!40000 ALTER TABLE `BLC_SC_FLD_TMPLT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SC_ITEM_CRITERIA`
--

DROP TABLE IF EXISTS `BLC_SC_ITEM_CRITERIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SC_ITEM_CRITERIA` (
  `SC_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  `ORDER_ITEM_MATCH_RULE` longtext,
  `QUANTITY` int(11) NOT NULL,
  PRIMARY KEY (`SC_ITEM_CRITERIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SC_ITEM_CRITERIA`
--

LOCK TABLES `BLC_SC_ITEM_CRITERIA` WRITE;
/*!40000 ALTER TABLE `BLC_SC_ITEM_CRITERIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SC_ITEM_CRITERIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SC_RULE`
--

DROP TABLE IF EXISTS `BLC_SC_RULE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SC_RULE` (
  `SC_RULE_ID` bigint(20) NOT NULL,
  `MATCH_RULE` longtext,
  PRIMARY KEY (`SC_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SC_RULE`
--

LOCK TABLES `BLC_SC_RULE` WRITE;
/*!40000 ALTER TABLE `BLC_SC_RULE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SC_RULE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SC_RULE_MAP`
--

DROP TABLE IF EXISTS `BLC_SC_RULE_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SC_RULE_MAP` (
  `BLC_SC_SC_ID` bigint(20) NOT NULL,
  `SC_RULE_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_SC_SC_ID`,`MAP_KEY`),
  KEY `FK169F1C8256E51A06` (`SC_RULE_ID`),
  KEY `FK169F1C82156E72FC` (`BLC_SC_SC_ID`),
  CONSTRAINT `FK169F1C82156E72FC` FOREIGN KEY (`BLC_SC_SC_ID`) REFERENCES `BLC_SC` (`SC_ID`),
  CONSTRAINT `FK169F1C8256E51A06` FOREIGN KEY (`SC_RULE_ID`) REFERENCES `BLC_SC_RULE` (`SC_RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SC_RULE_MAP`
--

LOCK TABLES `BLC_SC_RULE_MAP` WRITE;
/*!40000 ALTER TABLE `BLC_SC_RULE_MAP` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SC_RULE_MAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SC_TYPE`
--

DROP TABLE IF EXISTS `BLC_SC_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SC_TYPE` (
  `SC_TYPE_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `SC_FLD_TMPLT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SC_TYPE_ID`),
  KEY `FKE19886C3F6B0BA84` (`SC_FLD_TMPLT_ID`),
  CONSTRAINT `FKE19886C3F6B0BA84` FOREIGN KEY (`SC_FLD_TMPLT_ID`) REFERENCES `BLC_SC_FLD_TMPLT` (`SC_FLD_TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SC_TYPE`
--

LOCK TABLES `BLC_SC_TYPE` WRITE;
/*!40000 ALTER TABLE `BLC_SC_TYPE` DISABLE KEYS */;
INSERT INTO `BLC_SC_TYPE` VALUES (1,NULL,'Homepage Banner Ad',1),(2,NULL,'Homepage Middle Promo Snippet',2),(3,NULL,'Homepage Featured Products Title',3),(4,NULL,'Right Hand Side Banner Ad',1);
/*!40000 ALTER TABLE `BLC_SC_TYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SEARCH_FACET`
--

DROP TABLE IF EXISTS `BLC_SEARCH_FACET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SEARCH_FACET` (
  `SEARCH_FACET_ID` bigint(20) NOT NULL,
  `MULTISELECT` bit(1) DEFAULT NULL,
  `LABEL` varchar(255) DEFAULT NULL,
  `REQUIRES_ALL_DEPENDENT` bit(1) DEFAULT NULL,
  `SEARCH_DISPLAY_PRIORITY` int(11) DEFAULT NULL,
  `SHOW_ON_SEARCH` bit(1) DEFAULT NULL,
  `FIELD_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SEARCH_FACET_ID`),
  KEY `FK4FFCC9863C3907C4` (`FIELD_ID`),
  CONSTRAINT `FK4FFCC9863C3907C4` FOREIGN KEY (`FIELD_ID`) REFERENCES `BLC_FIELD` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SEARCH_FACET`
--

LOCK TABLES `BLC_SEARCH_FACET` WRITE;
/*!40000 ALTER TABLE `BLC_SEARCH_FACET` DISABLE KEYS */;
INSERT INTO `BLC_SEARCH_FACET` VALUES (1,'','Manufacturer',NULL,0,'\0',1),(2,'','Heat Range',NULL,0,'\0',2),(3,'','Price',NULL,1,'',3);
/*!40000 ALTER TABLE `BLC_SEARCH_FACET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SEARCH_FACET_RANGE`
--

DROP TABLE IF EXISTS `BLC_SEARCH_FACET_RANGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SEARCH_FACET_RANGE` (
  `SEARCH_FACET_RANGE_ID` bigint(20) NOT NULL,
  `MAX_VALUE` decimal(19,5) DEFAULT NULL,
  `MIN_VALUE` decimal(19,5) NOT NULL,
  `SEARCH_FACET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SEARCH_FACET_RANGE_ID`),
  KEY `SEARCH_FACET_INDEX` (`SEARCH_FACET_ID`),
  KEY `FK7EC3B124B96B1C93` (`SEARCH_FACET_ID`),
  CONSTRAINT `FK7EC3B124B96B1C93` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `BLC_SEARCH_FACET` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SEARCH_FACET_RANGE`
--

LOCK TABLES `BLC_SEARCH_FACET_RANGE` WRITE;
/*!40000 ALTER TABLE `BLC_SEARCH_FACET_RANGE` DISABLE KEYS */;
INSERT INTO `BLC_SEARCH_FACET_RANGE` VALUES (1,5.00000,0.00000,3),(2,10.00000,5.00000,3),(3,15.00000,10.00000,3),(4,NULL,15.00000,3);
/*!40000 ALTER TABLE `BLC_SEARCH_FACET_RANGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SEARCH_FACET_XREF`
--

DROP TABLE IF EXISTS `BLC_SEARCH_FACET_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SEARCH_FACET_XREF` (
  `ID` bigint(20) NOT NULL,
  `REQUIRED_FACET_ID` bigint(20) NOT NULL,
  `SEARCH_FACET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK35A63034B96B1C93` (`SEARCH_FACET_ID`),
  KEY `FK35A63034DA7E1C7C` (`REQUIRED_FACET_ID`),
  CONSTRAINT `FK35A63034DA7E1C7C` FOREIGN KEY (`REQUIRED_FACET_ID`) REFERENCES `BLC_SEARCH_FACET` (`SEARCH_FACET_ID`),
  CONSTRAINT `FK35A63034B96B1C93` FOREIGN KEY (`SEARCH_FACET_ID`) REFERENCES `BLC_SEARCH_FACET` (`SEARCH_FACET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SEARCH_FACET_XREF`
--

LOCK TABLES `BLC_SEARCH_FACET_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_SEARCH_FACET_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SEARCH_FACET_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SITE`
--

DROP TABLE IF EXISTS `BLC_SITE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SITE` (
  `SITE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `SITE_IDENTIFIER_TYPE` varchar(255) DEFAULT NULL,
  `SITE_IDENTIFIER_VALUE` varchar(255) DEFAULT NULL,
  `PRODUCTION_SANDBOX_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SITE_ID`),
  KEY `FKF41D6A8D64EBCCE3` (`PRODUCTION_SANDBOX_ID`),
  CONSTRAINT `FKF41D6A8D64EBCCE3` FOREIGN KEY (`PRODUCTION_SANDBOX_ID`) REFERENCES `BLC_SANDBOX` (`SANDBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SITE`
--

LOCK TABLES `BLC_SITE` WRITE;
/*!40000 ALTER TABLE `BLC_SITE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SITE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SITE_SANDBOX`
--

DROP TABLE IF EXISTS `BLC_SITE_SANDBOX`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SITE_SANDBOX` (
  `SITE_ID` bigint(20) DEFAULT NULL,
  `SANDBOX_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SANDBOX_ID`),
  KEY `FKAD4F7EF5579FE59D` (`SANDBOX_ID`),
  KEY `FKAD4F7EF5843A8B63` (`SITE_ID`),
  CONSTRAINT `FKAD4F7EF5843A8B63` FOREIGN KEY (`SITE_ID`) REFERENCES `BLC_SITE` (`SITE_ID`),
  CONSTRAINT `FKAD4F7EF5579FE59D` FOREIGN KEY (`SANDBOX_ID`) REFERENCES `BLC_SANDBOX` (`SANDBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SITE_SANDBOX`
--

LOCK TABLES `BLC_SITE_SANDBOX` WRITE;
/*!40000 ALTER TABLE `BLC_SITE_SANDBOX` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SITE_SANDBOX` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SKU`
--

DROP TABLE IF EXISTS `BLC_SKU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SKU` (
  `SKU_ID` bigint(20) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `AVAILABLE_FLAG` char(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `CONTAINER_SHAPE` varchar(255) DEFAULT NULL,
  `DEPTH` decimal(19,2) DEFAULT NULL,
  `DIMENSION_UNIT_OF_MEASURE` varchar(255) DEFAULT NULL,
  `GIRTH` decimal(19,2) DEFAULT NULL,
  `HEIGHT` decimal(19,2) DEFAULT NULL,
  `CONTAINER_SIZE` varchar(255) DEFAULT NULL,
  `WIDTH` decimal(19,2) DEFAULT NULL,
  `DISCOUNTABLE_FLAG` char(1) DEFAULT NULL,
  `FULFILLMENT_TYPE` varchar(255) DEFAULT NULL,
  `INVENTORY_TYPE` varchar(255) DEFAULT NULL,
  `IS_MACHINE_SORTABLE` bit(1) DEFAULT NULL,
  `LONG_DESCRIPTION` longtext,
  `NAME` varchar(255) DEFAULT NULL,
  `RETAIL_PRICE` decimal(19,5) DEFAULT NULL,
  `SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `TAXABLE_FLAG` char(1) DEFAULT NULL,
  `WEIGHT` decimal(19,2) DEFAULT NULL,
  `WEIGHT_UNIT_OF_MEASURE` varchar(255) DEFAULT NULL,
  `DEFAULT_PRODUCT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SKU_ID`),
  KEY `SKU_ACTIVE_INDEX` (`ACTIVE_END_DATE`),
  KEY `SKU_NAME_INDEX` (`NAME`),
  KEY `SKU_AVAILABLE_INDEX` (`AVAILABLE_FLAG`),
  KEY `SKU_TAXABLE_INDEX` (`TAXABLE_FLAG`),
  KEY `SKU_DISCOUNTABLE_INDEX` (`DISCOUNTABLE_FLAG`),
  KEY `FK28E82CF77E555D75` (`DEFAULT_PRODUCT_ID`),
  CONSTRAINT `FK28E82CF77E555D75` FOREIGN KEY (`DEFAULT_PRODUCT_ID`) REFERENCES `BLC_PRODUCT` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SKU`
--

LOCK TABLES `BLC_SKU` WRITE;
/*!40000 ALTER TABLE `BLC_SKU` DISABLE KEYS */;
INSERT INTO `BLC_SKU` VALUES (1,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'BASIC',NULL,'As my Chilipals know, I am never one to be satisfied. Hence, the creation of Sudden Death. When you need to go beyond... Sudden Death will deliver! ','Sudden Death Sauce',10.99000,NULL,'Y',NULL,NULL,1),(2,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,'BASIC',NULL,'The perfect topper for chicken, fish, burgers or pizza. A great blend of Habanero, Mango, Passion Fruit and more make this Death Sauce an amazing tropical treat.','Sweet Death Sauce',10.99000,NULL,'Y',NULL,NULL,2),(3,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'Tangy, ripe cayenne peppes flow together with garlic, onion, tomato paste and a hint of cane sugar to make this a smooth sauce with a bite.  Wonderful on eggs, poultry, pork, or fish, this sauce blends to make rich marinades and soups.','Hoppin\' Hot Sauce',4.99000,NULL,'Y',NULL,NULL,3),(4,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'When any pepper is dried and smoked, it is referred to as a Chipotle. Usually with a wrinkled, drak brown appearance, the Chipotle delivers a smokey, sweet flavor which is generally used for adding a smokey, roasted flavor to salsas, stews and marinades.','Day of the Dead Chipotle Hot Sauce',6.99000,NULL,'Y',NULL,NULL,4),(5,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'If you want hot, this is the chile to choose. Native to the Carribean, Yucatan and Northern Coast of South America, the Habanero presents itself in a variety of colors ranging from light green to a bright red. The Habanero\'s bold heat, unique flavor and aroma has made it the favorite of chile lovers.','Day of the Dead Habanero Hot Sauce',6.99000,NULL,'Y',NULL,NULL,5),(6,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'Often mistaken for the Habanero, the Scotch Bonnet has a deeply inverted tip as opposed to the pointed end of the Habanero. Ranging in many colors from green to yellow-orange, the Scotch Bonnet is a staple in West Indies and Barbados style pepper sauces.','Day of the Dead Scotch Bonnet Hot Sauce',6.99000,NULL,'Y',NULL,NULL,6),(7,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'Made with Naga Bhut Jolokia, the World\'s Hottest pepper.','Green Ghost',11.99000,NULL,'Y',NULL,NULL,7),(8,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'You bet your boots, this hot sauce earned its name from folks that appreciate an outstanding hot sauce. What you\'ll find here is a truly original zesty flavor, not an overpowering pungency that is found in those ordinary Tabasco pepper sauces - even though the pepper used in this product was tested at 285,000 Scoville units. So, saddle up for a ride to remember. To make sure we brought you only the finest Habanero pepper sauce, we went to the foothills of the Mayan mountains in Belize, Central America. This product is prepared entirely by hand using only fresh vegetables and all natural ingredients.','Blazin\' Saddle XXX Hot Habanero Pepper Sauce',4.99000,NULL,'Y',NULL,NULL,8),(9,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'All Hell is breaking loose, fire &amp; brimstone rain down? prepare to meet your maker.','Armageddon The Hot Sauce To End All',12.99000,NULL,'Y',NULL,NULL,9),(10,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'Here is the Prescription for those who enjoy intolerable heat. Dr. Chilemeister\'s sick and evil deadly brew should be used with caution. Pain can become addictive!','Dr. Chilemeister\'s Insane Hot Sauce',12.99000,NULL,'Y',NULL,NULL,10),(11,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'Been there, roped that. Hotter than a buckin\' mare in heat! Sprinkle on meat entrees, seafood and vegetables. Use as additive in barbecue sauce or any food that needs a spicy flavor. Start with a few drops and work up to the desired flavor.','Bull Snort Cowboy Cayenne Pepper Hot Sauce',3.99000,NULL,'Y',NULL,NULL,11),(12,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'One of the more unusual sauces we sell. The original was an old style Cajun sauce and this is it\'s updated blackening version. It\'s sweet but you get a great hit of cinnamon and cloves with a nice kick of cayenne heat. Use on all foods to give that Cajun flair!','Cafe Louisiane Sweet Cajun Blackening Sauce',4.99000,NULL,'Y',NULL,NULL,12),(13,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'Everything is bigger in Texas, even the burn of a Bull Snortin\' Hot Sauce! shower on that Texas sized steak they call the Ole 96er or your plane Jane vegetables. If you are a fan on making BBQ sauce from scratch like I am, you can use Bull Snort Smokin\' Tonsils Hot Sauce as an additive. Red hot habaneros and cayenne peppers give this tonsil tingler it\'s famous flavor and red hot heat. Bull Snort Smokin\' Tonsils Hot Sauce\'ll have your bowels buckin\' with just a drop!','Bull Snort Smokin\' Toncils Hot Sauce',3.99000,NULL,'Y',NULL,NULL,13),(14,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Cool Cayenne Pepper Hot Sauce',5.99000,NULL,'Y',NULL,NULL,14),(15,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Roasted Garlic Hot Sauce',5.99000,NULL,'Y',NULL,NULL,15),(16,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Scotch Bonnet Hot Sauce',5.99000,NULL,'Y',NULL,NULL,16),(17,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Insanity Sauce',5.99000,4.99000,'Y',NULL,NULL,17),(18,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Hurtin\' Jalepeno Hot Sauce',5.99000,4.49000,'Y',NULL,NULL,18),(19,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'This sauce gets its great flavor from aged peppers and cane vinegar. It will enhance the flavor of most any meal.','Roasted Red Pepper & Chipotle Hot Sauce',5.99000,4.09000,'Y',NULL,NULL,19),(100,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'Men\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Men\'s)',14.99000,NULL,'Y',NULL,NULL,100),(111,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(112,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(113,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(114,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL),(121,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(122,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(123,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(124,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL),(131,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(132,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(133,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(134,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL),(200,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'Women\'s Habanero collection standard short sleeve screen-printed tee shirt in soft 30 singles cotton in regular fit.','Hawt Like a Habanero Shirt (Women\'s)',14.99000,NULL,'Y',NULL,NULL,200),(211,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(212,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(213,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(214,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL),(221,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(222,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(223,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(224,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL),(231,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(232,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(233,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(234,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL),(300,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'This hand-drawn logo shirt for men features a regular fit in three different colors','Heat Clinic Hand-Drawn (Men\'s)',15.99000,NULL,'Y',NULL,NULL,300),(311,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(312,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(313,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(314,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL),(321,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(322,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(323,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(324,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL),(331,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(332,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(333,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(334,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL),(400,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'This hand-drawn logo shirt for women features a regular fit in three different colors','Heat Clinic Hand-Drawn (Women\'s)',15.99000,NULL,'Y',NULL,NULL,400),(411,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(412,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(413,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(414,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL),(421,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(422,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(423,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(424,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL),(431,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(432,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(433,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(434,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL),(500,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Men\'s)',15.99000,NULL,'Y',NULL,NULL,500),(511,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(512,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(513,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(514,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL),(521,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(522,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(523,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(524,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL),(531,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(532,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(533,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(534,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL),(600,NULL,'2013-05-11 11:42:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,'Don\'t you just love our mascot? Get your very own shirt today!','Heat Clinic Mascot (Women\'s)',15.99000,NULL,'Y',NULL,NULL,600),(611,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(612,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(613,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(614,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL),(621,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(622,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(623,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(624,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL),(631,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(632,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(633,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(634,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,16.99000,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `BLC_SKU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SKU_ATTRIBUTE`
--

DROP TABLE IF EXISTS `BLC_SKU_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SKU_ATTRIBUTE` (
  `SKU_ATTR_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `SEARCHABLE` bit(1) DEFAULT NULL,
  `VALUE` varchar(255) NOT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_ATTR_ID`),
  KEY `SKUATTR_NAME_INDEX` (`NAME`),
  KEY `SKUATTR_SKU_INDEX` (`SKU_ID`),
  KEY `FK6C6A5934B78C9977` (`SKU_ID`),
  CONSTRAINT `FK6C6A5934B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `BLC_SKU` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SKU_ATTRIBUTE`
--

LOCK TABLES `BLC_SKU_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `BLC_SKU_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SKU_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SKU_BUNDLE_ITEM`
--

DROP TABLE IF EXISTS `BLC_SKU_BUNDLE_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SKU_BUNDLE_ITEM` (
  `SKU_BUNDLE_ITEM_ID` bigint(20) NOT NULL,
  `ITEM_SALE_PRICE` decimal(19,5) DEFAULT NULL,
  `QUANTITY` int(11) NOT NULL,
  `PRODUCT_BUNDLE_ID` bigint(20) NOT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_BUNDLE_ITEM_ID`),
  KEY `FKD55968B78C9977` (`SKU_ID`),
  KEY `FKD55968CCF29B96` (`PRODUCT_BUNDLE_ID`),
  CONSTRAINT `FKD55968CCF29B96` FOREIGN KEY (`PRODUCT_BUNDLE_ID`) REFERENCES `BLC_PRODUCT_BUNDLE` (`PRODUCT_ID`),
  CONSTRAINT `FKD55968B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `BLC_SKU` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SKU_BUNDLE_ITEM`
--

LOCK TABLES `BLC_SKU_BUNDLE_ITEM` WRITE;
/*!40000 ALTER TABLE `BLC_SKU_BUNDLE_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SKU_BUNDLE_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SKU_FEE`
--

DROP TABLE IF EXISTS `BLC_SKU_FEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SKU_FEE` (
  `SKU_FEE_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `EXPRESSION` longtext,
  `FEE_TYPE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `TAXABLE` bit(1) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SKU_FEE_ID`),
  KEY `FKEEB7181E3E2FC4F9` (`CURRENCY_CODE`),
  CONSTRAINT `FKEEB7181E3E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `BLC_CURRENCY` (`CURRENCY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SKU_FEE`
--

LOCK TABLES `BLC_SKU_FEE` WRITE;
/*!40000 ALTER TABLE `BLC_SKU_FEE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SKU_FEE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SKU_FEE_XREF`
--

DROP TABLE IF EXISTS `BLC_SKU_FEE_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SKU_FEE_XREF` (
  `SKU_FEE_ID` bigint(20) NOT NULL,
  `SKU_ID` bigint(20) NOT NULL,
  KEY `FKD88D409CB78C9977` (`SKU_ID`),
  KEY `FKD88D409CCF4C9A82` (`SKU_FEE_ID`),
  CONSTRAINT `FKD88D409CCF4C9A82` FOREIGN KEY (`SKU_FEE_ID`) REFERENCES `BLC_SKU_FEE` (`SKU_FEE_ID`),
  CONSTRAINT `FKD88D409CB78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `BLC_SKU` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SKU_FEE_XREF`
--

LOCK TABLES `BLC_SKU_FEE_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_SKU_FEE_XREF` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SKU_FEE_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SKU_FULFILLMENT_EXCLUDED`
--

DROP TABLE IF EXISTS `BLC_SKU_FULFILLMENT_EXCLUDED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SKU_FULFILLMENT_EXCLUDED` (
  `SKU_ID` bigint(20) NOT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  KEY `FK84162D73B78C9977` (`SKU_ID`),
  KEY `FK84162D7381F34C7F` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FK84162D7381F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `BLC_FULFILLMENT_OPTION` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FK84162D73B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `BLC_SKU` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SKU_FULFILLMENT_EXCLUDED`
--

LOCK TABLES `BLC_SKU_FULFILLMENT_EXCLUDED` WRITE;
/*!40000 ALTER TABLE `BLC_SKU_FULFILLMENT_EXCLUDED` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SKU_FULFILLMENT_EXCLUDED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SKU_FULFILLMENT_FLAT_RATES`
--

DROP TABLE IF EXISTS `BLC_SKU_FULFILLMENT_FLAT_RATES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SKU_FULFILLMENT_FLAT_RATES` (
  `SKU_ID` bigint(20) NOT NULL,
  `RATE` decimal(19,5) DEFAULT NULL,
  `FULFILLMENT_OPTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SKU_ID`,`FULFILLMENT_OPTION_ID`),
  KEY `FKC1988C96B78C9977` (`SKU_ID`),
  KEY `FKC1988C9681F34C7F` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKC1988C9681F34C7F` FOREIGN KEY (`FULFILLMENT_OPTION_ID`) REFERENCES `BLC_FULFILLMENT_OPTION` (`FULFILLMENT_OPTION_ID`),
  CONSTRAINT `FKC1988C96B78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `BLC_SKU` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SKU_FULFILLMENT_FLAT_RATES`
--

LOCK TABLES `BLC_SKU_FULFILLMENT_FLAT_RATES` WRITE;
/*!40000 ALTER TABLE `BLC_SKU_FULFILLMENT_FLAT_RATES` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SKU_FULFILLMENT_FLAT_RATES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SKU_MEDIA_MAP`
--

DROP TABLE IF EXISTS `BLC_SKU_MEDIA_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SKU_MEDIA_MAP` (
  `BLC_SKU_SKU_ID` bigint(20) NOT NULL,
  `MEDIA_ID` bigint(20) NOT NULL,
  `MAP_KEY` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_SKU_SKU_ID`,`MAP_KEY`),
  KEY `FKEB4AECF9D93D857F` (`BLC_SKU_SKU_ID`),
  KEY `FKEB4AECF919D1156C` (`MEDIA_ID`),
  CONSTRAINT `FKEB4AECF919D1156C` FOREIGN KEY (`MEDIA_ID`) REFERENCES `BLC_MEDIA` (`MEDIA_ID`),
  CONSTRAINT `FKEB4AECF9D93D857F` FOREIGN KEY (`BLC_SKU_SKU_ID`) REFERENCES `BLC_SKU` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SKU_MEDIA_MAP`
--

LOCK TABLES `BLC_SKU_MEDIA_MAP` WRITE;
/*!40000 ALTER TABLE `BLC_SKU_MEDIA_MAP` DISABLE KEYS */;
INSERT INTO `BLC_SKU_MEDIA_MAP` VALUES (1,101,'primary'),(1,102,'alt1'),(2,201,'primary'),(2,202,'alt1'),(2,203,'alt2'),(2,204,'alt3'),(2,205,'alt4'),(2,206,'alt5'),(3,301,'primary'),(3,302,'alt1'),(4,401,'primary'),(4,402,'alt1'),(5,501,'primary'),(5,502,'alt1'),(6,601,'primary'),(6,602,'alt1'),(7,701,'primary'),(7,702,'alt1'),(8,801,'primary'),(8,802,'alt1'),(9,901,'primary'),(9,902,'alt1'),(10,1001,'primary'),(10,1002,'alt1'),(11,1101,'primary'),(11,1102,'alt1'),(12,1201,'primary'),(12,1202,'alt1'),(13,1301,'primary'),(13,1302,'alt1'),(14,1401,'primary'),(14,1402,'alt1'),(15,1501,'primary'),(15,1502,'alt1'),(16,1601,'primary'),(16,1602,'alt1'),(17,1701,'primary'),(17,1702,'alt1'),(18,1801,'primary'),(18,1802,'alt1'),(19,1901,'primary'),(19,1902,'alt1'),(100,10001,'primary'),(100,10002,'alt1'),(100,10003,'alt2'),(200,20001,'alt1'),(200,20002,'primary'),(200,20003,'alt2'),(300,30001,'alt1'),(300,30002,'alt2'),(300,30003,'primary'),(400,40001,'alt1'),(400,40002,'primary'),(400,40003,'alt2'),(500,50001,'alt1'),(500,50002,'alt2'),(500,50003,'primary'),(600,60001,'primary'),(600,60002,'alt1'),(600,60003,'alt2');
/*!40000 ALTER TABLE `BLC_SKU_MEDIA_MAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SKU_OPTION_VALUE_XREF`
--

DROP TABLE IF EXISTS `BLC_SKU_OPTION_VALUE_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SKU_OPTION_VALUE_XREF` (
  `SKU_ID` bigint(20) NOT NULL,
  `PRODUCT_OPTION_VALUE_ID` bigint(20) NOT NULL,
  KEY `FK7B61DC0BB78C9977` (`SKU_ID`),
  KEY `FK7B61DC0BB0C16A73` (`PRODUCT_OPTION_VALUE_ID`),
  CONSTRAINT `FK7B61DC0BB0C16A73` FOREIGN KEY (`PRODUCT_OPTION_VALUE_ID`) REFERENCES `BLC_PRODUCT_OPTION_VALUE` (`PRODUCT_OPTION_VALUE_ID`),
  CONSTRAINT `FK7B61DC0BB78C9977` FOREIGN KEY (`SKU_ID`) REFERENCES `BLC_SKU` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SKU_OPTION_VALUE_XREF`
--

LOCK TABLES `BLC_SKU_OPTION_VALUE_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_SKU_OPTION_VALUE_XREF` DISABLE KEYS */;
INSERT INTO `BLC_SKU_OPTION_VALUE_XREF` VALUES (111,1),(111,11),(112,1),(112,12),(113,1),(113,13),(114,1),(114,14),(121,2),(121,11),(122,2),(122,12),(123,2),(123,13),(124,2),(124,14),(131,3),(131,11),(132,3),(132,12),(133,3),(133,13),(134,3),(134,14),(211,1),(211,11),(212,1),(212,12),(213,1),(213,13),(214,1),(214,14),(221,2),(221,11),(222,2),(222,12),(223,2),(223,13),(224,2),(224,14),(231,3),(231,11),(232,3),(232,12),(233,3),(233,13),(234,3),(234,14),(311,1),(311,11),(312,1),(312,12),(313,1),(313,13),(314,1),(314,14),(321,2),(321,11),(322,2),(322,12),(323,2),(323,13),(324,2),(324,14),(331,3),(331,11),(332,3),(332,12),(333,3),(333,13),(334,3),(334,14),(411,1),(411,11),(412,1),(412,12),(413,1),(413,13),(414,1),(414,14),(421,2),(421,11),(422,2),(422,12),(423,2),(423,13),(424,2),(424,14),(431,3),(431,11),(432,3),(432,12),(433,3),(433,13),(434,3),(434,14),(511,1),(511,11),(512,1),(512,12),(513,1),(513,13),(514,1),(514,14),(521,2),(521,11),(522,2),(522,12),(523,2),(523,13),(524,2),(524,14),(531,3),(531,11),(532,3),(532,12),(533,3),(533,13),(534,3),(534,14),(611,1),(611,11),(612,1),(612,12),(613,1),(613,13),(614,1),(614,14),(621,2),(621,11),(622,2),(622,12),(623,2),(623,13),(624,2),(624,14),(631,3),(631,11),(632,3),(632,12),(633,3),(633,13),(634,3),(634,14);
/*!40000 ALTER TABLE `BLC_SKU_OPTION_VALUE_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_STATE`
--

DROP TABLE IF EXISTS `BLC_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_STATE` (
  `ABBREVIATION` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `COUNTRY` varchar(255) NOT NULL,
  PRIMARY KEY (`ABBREVIATION`),
  KEY `STATE_NAME_INDEX` (`NAME`),
  KEY `FK8F94A1EBA46E16CF` (`COUNTRY`),
  CONSTRAINT `FK8F94A1EBA46E16CF` FOREIGN KEY (`COUNTRY`) REFERENCES `BLC_COUNTRY` (`ABBREVIATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_STATE`
--

LOCK TABLES `BLC_STATE` WRITE;
/*!40000 ALTER TABLE `BLC_STATE` DISABLE KEYS */;
INSERT INTO `BLC_STATE` VALUES ('AK','ALASKA','US'),('AL','ALABAMA','US'),('AR','ARKANSAS','US'),('AS','AMERICAN SAMOA','US'),('AZ','ARIZONA','US'),('CA','CALIFORNIA','US'),('CO','COLORADO','US'),('CT','CONNECTICUT','US'),('DC','DISTRICT OF COLUMBIA','US'),('DE','DELAWARE','US'),('FL','FLORIDA','US'),('FM','FEDERATED STATES OF MICRONESIA','US'),('GA','GEORGIA','US'),('GU','GUAM','US'),('HI','HAWAII','US'),('IA','IOWA','US'),('ID','IDAHO','US'),('IL','ILLINOIS','US'),('IN','INDIANA','US'),('KS','KANSAS','US'),('KY','KENTUCKY','US'),('LA','LOUISIANA','US'),('MA','MASSACHUSETTS','US'),('MD','MARYLAND','US'),('ME','MAINE','US'),('MH','MARSHALL ISLANDS','US'),('MI','MICHIGAN','US'),('MN','MINNESOTA','US'),('MO','MISSOURI','US'),('MP','NORTHERN MARIANA ISLANDS','US'),('MS','MISSISSIPPI','US'),('MT','MONTANA','US'),('NC','NORTH CAROLINA','US'),('ND','NORTH DAKOTA','US'),('NE','NEBRASKA','US'),('NH','NEW HAMPSHIRE','US'),('NJ','NEW JERSEY','US'),('NM','NEW MEXICO','US'),('NV','NEVADA','US'),('NY','NEW YORK','US'),('OH','OHIO','US'),('OK','OKLAHOMA','US'),('OR','OREGON','US'),('PA','PENNSYLVANIA','US'),('PR','PUERTO RICO','US'),('PW','PALAU','US'),('RI','RHODE ISLAND','US'),('SC','SOUTH CAROLINA','US'),('SD','SOUTH DAKOTA','US'),('TN','TENNESSEE','US'),('TX','TEXAS','US'),('UT','UTAH','US'),('VA','VIRGINIA','US'),('VI','VIRGIN ISLANDS','US'),('VT','VERMONT','US'),('WA','WASHINGTON','US'),('WI','WISCONSIN','US'),('WV','WEST VIRGINIA','US'),('WY','WYOMING','US');
/*!40000 ALTER TABLE `BLC_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_STATIC_ASSET`
--

DROP TABLE IF EXISTS `BLC_STATIC_ASSET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_STATIC_ASSET` (
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  `ARCHIVED_FLAG` bit(1) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `DELETED_FLAG` bit(1) DEFAULT NULL,
  `FILE_EXTENSION` varchar(255) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `FULL_URL` varchar(255) NOT NULL,
  `LOCKED_FLAG` bit(1) DEFAULT NULL,
  `MIME_TYPE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `ORIG_ASSET_ID` bigint(20) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `ORIG_SANDBOX_ID` bigint(20) DEFAULT NULL,
  `SANDBOX_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`STATIC_ASSET_ID`),
  KEY `ORIG_ASSET_ID_INDX` (`ORIG_ASSET_ID`),
  KEY `ASST_DLTD_FLG_INDX` (`DELETED_FLAG`),
  KEY `ASST_LCKD_FLG_INDX` (`LOCKED_FLAG`),
  KEY `ASST_ARCHVD_FLG_INDX` (`ARCHIVED_FLAG`),
  KEY `ASST_FULL_URL_INDX` (`FULL_URL`),
  KEY `FK9875FB0524568C27` (`CREATED_BY`),
  KEY `FK9875FB05579FE59D` (`SANDBOX_ID`),
  KEY `FK9875FB05F9C4A5B` (`ORIG_SANDBOX_ID`),
  KEY `FK9875FB05C1167574` (`UPDATED_BY`),
  CONSTRAINT `FK9875FB05C1167574` FOREIGN KEY (`UPDATED_BY`) REFERENCES `BLC_ADMIN_USER` (`ADMIN_USER_ID`),
  CONSTRAINT `FK9875FB0524568C27` FOREIGN KEY (`CREATED_BY`) REFERENCES `BLC_ADMIN_USER` (`ADMIN_USER_ID`),
  CONSTRAINT `FK9875FB05579FE59D` FOREIGN KEY (`SANDBOX_ID`) REFERENCES `BLC_SANDBOX` (`SANDBOX_ID`),
  CONSTRAINT `FK9875FB05F9C4A5B` FOREIGN KEY (`ORIG_SANDBOX_ID`) REFERENCES `BLC_SANDBOX` (`SANDBOX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_STATIC_ASSET`
--

LOCK TABLES `BLC_STATIC_ASSET` WRITE;
/*!40000 ALTER TABLE `BLC_STATIC_ASSET` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_STATIC_ASSET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_STATIC_ASSET_DESC`
--

DROP TABLE IF EXISTS `BLC_STATIC_ASSET_DESC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_STATIC_ASSET_DESC` (
  `STATIC_ASSET_DESC_ID` bigint(20) NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_UPDATED` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `LONG_DESCRIPTION` varchar(255) DEFAULT NULL,
  `CREATED_BY` bigint(20) DEFAULT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`STATIC_ASSET_DESC_ID`),
  KEY `FKC6F1CF8B24568C27` (`CREATED_BY`),
  KEY `FKC6F1CF8BC1167574` (`UPDATED_BY`),
  CONSTRAINT `FKC6F1CF8BC1167574` FOREIGN KEY (`UPDATED_BY`) REFERENCES `BLC_ADMIN_USER` (`ADMIN_USER_ID`),
  CONSTRAINT `FKC6F1CF8B24568C27` FOREIGN KEY (`CREATED_BY`) REFERENCES `BLC_ADMIN_USER` (`ADMIN_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_STATIC_ASSET_DESC`
--

LOCK TABLES `BLC_STATIC_ASSET_DESC` WRITE;
/*!40000 ALTER TABLE `BLC_STATIC_ASSET_DESC` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_STATIC_ASSET_DESC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_SYSTEM_PROPERTY`
--

DROP TABLE IF EXISTS `BLC_SYSTEM_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_SYSTEM_PROPERTY` (
  `BLC_SYSTEM_PROPERTY_ID` bigint(20) NOT NULL,
  `PROPERTY_NAME` varchar(255) NOT NULL,
  `PROPERTY_VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`BLC_SYSTEM_PROPERTY_ID`),
  UNIQUE KEY `PROPERTY_NAME` (`PROPERTY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_SYSTEM_PROPERTY`
--

LOCK TABLES `BLC_SYSTEM_PROPERTY` WRITE;
/*!40000 ALTER TABLE `BLC_SYSTEM_PROPERTY` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_SYSTEM_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_TAR_CRIT_OFFER_XREF`
--

DROP TABLE IF EXISTS `BLC_TAR_CRIT_OFFER_XREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_TAR_CRIT_OFFER_XREF` (
  `OFFER_ID` bigint(20) NOT NULL DEFAULT '0',
  `OFFER_ITEM_CRITERIA_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`OFFER_ID`,`OFFER_ITEM_CRITERIA_ID`),
  UNIQUE KEY `OFFER_ITEM_CRITERIA_ID` (`OFFER_ITEM_CRITERIA_ID`),
  KEY `FK125F5803D5F3FAF4` (`OFFER_ID`),
  KEY `FK125F58033615A91A` (`OFFER_ITEM_CRITERIA_ID`),
  CONSTRAINT `FK125F58033615A91A` FOREIGN KEY (`OFFER_ITEM_CRITERIA_ID`) REFERENCES `BLC_OFFER_ITEM_CRITERIA` (`OFFER_ITEM_CRITERIA_ID`),
  CONSTRAINT `FK125F5803D5F3FAF4` FOREIGN KEY (`OFFER_ID`) REFERENCES `BLC_OFFER` (`OFFER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_TAR_CRIT_OFFER_XREF`
--

LOCK TABLES `BLC_TAR_CRIT_OFFER_XREF` WRITE;
/*!40000 ALTER TABLE `BLC_TAR_CRIT_OFFER_XREF` DISABLE KEYS */;
INSERT INTO `BLC_TAR_CRIT_OFFER_XREF` VALUES (1,1);
/*!40000 ALTER TABLE `BLC_TAR_CRIT_OFFER_XREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_TAX_DETAIL`
--

DROP TABLE IF EXISTS `BLC_TAX_DETAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_TAX_DETAIL` (
  `TAX_DETAIL_ID` bigint(20) NOT NULL,
  `AMOUNT` decimal(19,5) DEFAULT NULL,
  `RATE` decimal(19,5) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TAX_DETAIL_ID`),
  KEY `FKEABE4A4B3E2FC4F9` (`CURRENCY_CODE`),
  CONSTRAINT `FKEABE4A4B3E2FC4F9` FOREIGN KEY (`CURRENCY_CODE`) REFERENCES `BLC_CURRENCY` (`CURRENCY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_TAX_DETAIL`
--

LOCK TABLES `BLC_TAX_DETAIL` WRITE;
/*!40000 ALTER TABLE `BLC_TAX_DETAIL` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_TAX_DETAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_URL_HANDLER`
--

DROP TABLE IF EXISTS `BLC_URL_HANDLER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_URL_HANDLER` (
  `URL_HANDLER_ID` bigint(20) NOT NULL,
  `INCOMING_URL` varchar(255) NOT NULL,
  `NEW_URL` varchar(255) NOT NULL,
  `URL_REDIRECT_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`URL_HANDLER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_URL_HANDLER`
--

LOCK TABLES `BLC_URL_HANDLER` WRITE;
/*!40000 ALTER TABLE `BLC_URL_HANDLER` DISABLE KEYS */;
INSERT INTO `BLC_URL_HANDLER` VALUES (1,'/googlePerm','http://www.google.com','REDIRECT_PERM'),(2,'/googleTemp','http://www.google.com','REDIRECT_TEMP'),(3,'/insanity','/hot-sauces/insanity_sauce','FORWARD'),(4,'/jalepeno','/hot-sauces/hurtin_jalepeno_hot_sauce','REDIRECT_TEMP');
/*!40000 ALTER TABLE `BLC_URL_HANDLER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLC_UserConnection`
--

DROP TABLE IF EXISTS `BLC_UserConnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLC_UserConnection` (
  `providerId` varchar(255) NOT NULL,
  `providerUserId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `expireTime` bigint(20) DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `profileUrl` varchar(255) DEFAULT NULL,
  `rank` int(11) NOT NULL,
  `refreshToken` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`providerId`,`providerUserId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLC_UserConnection`
--

LOCK TABLES `BLC_UserConnection` WRITE;
/*!40000 ALTER TABLE `BLC_UserConnection` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLC_UserConnection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SANDBOX_ITEM_ACTION`
--

DROP TABLE IF EXISTS `SANDBOX_ITEM_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SANDBOX_ITEM_ACTION` (
  `SANDBOX_ACTION_ID` bigint(20) NOT NULL,
  `SANDBOX_ITEM_ID` bigint(20) NOT NULL,
  KEY `FKB270D74A9797A024` (`SANDBOX_ACTION_ID`),
  KEY `FKB270D74AFE239304` (`SANDBOX_ITEM_ID`),
  CONSTRAINT `FKB270D74AFE239304` FOREIGN KEY (`SANDBOX_ITEM_ID`) REFERENCES `BLC_SANDBOX_ITEM` (`SANDBOX_ITEM_ID`),
  CONSTRAINT `FKB270D74A9797A024` FOREIGN KEY (`SANDBOX_ACTION_ID`) REFERENCES `BLC_SANDBOX_ACTION` (`SANDBOX_ACTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SANDBOX_ITEM_ACTION`
--

LOCK TABLES `SANDBOX_ITEM_ACTION` WRITE;
/*!40000 ALTER TABLE `SANDBOX_ITEM_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `SANDBOX_ITEM_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQUENCE_GENERATOR`
--

DROP TABLE IF EXISTS `SEQUENCE_GENERATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQUENCE_GENERATOR` (
  `ID_NAME` varchar(255) NOT NULL,
  `ID_VAL` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQUENCE_GENERATOR`
--

LOCK TABLES `SEQUENCE_GENERATOR` WRITE;
/*!40000 ALTER TABLE `SEQUENCE_GENERATOR` DISABLE KEYS */;
INSERT INTO `SEQUENCE_GENERATOR` VALUES ('AddressId',3),('AdminPermissionImpl',100),('AdminRoleImpl',100),('AdminUserImpl',100),('CategoryExcludedSearchFacetImpl',100),('CategoryImpl',10000),('CategoryProductImpl',500),('CategorySearchFacetImpl',100),('CodeTypeId',100),('CrossSaleProductImpl',5),('CustomerId',1),('CustomerRoleImpl',101),('EmailTrackingImpl',101),('FeaturedProductImpl',100),('FieldDefinitionImpl',1000),('FieldEnumerationImpl',1000),('FieldEnumerationItemImpl',1000),('FieldGroupImpl',1000),('FieldImpl',100),('FulfillmentGroupId',3),('FulfillmentGroupItemId',1),('MediaId',100000),('OfferCodeImpl',10),('OfferImpl',500),('OfferItemCriteriaImpl',10),('OrderId',2),('OrderItemId',9),('PageFieldImpl',1000),('PageImpl',1000),('PersonalMessageId',1),('PhoneId',1),('ProductAttributeImpl',1000),('ProductImpl',1000),('ProductOptionImpl',100),('ProductOptionValueImpl',100),('RatingDetailImpl',10),('RatingSummaryImpl',10),('ReviewDetailImpl',10),('SandBoxImpl',100),('SearchFacetImpl',100),('SearchFacetRangeImpl',100),('SearchInterceptImpl',1),('SkuImpl',10000),('StructuredContentFieldImpl',1000),('StructuredContentImpl',1000),('StructuredContentRuleImpl',1000),('UpSaleProductImpl',5),('URLHandlerImpl',100);
/*!40000 ALTER TABLE `SEQUENCE_GENERATOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_admin_module`
--

DROP TABLE IF EXISTS `blc_admin_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_admin_module` (
  `ADMIN_MODULE_ID` bigint(20) NOT NULL,
  `DISPLAY_ORDER` int(11) DEFAULT NULL,
  `ICON` varchar(255) DEFAULT NULL,
  `MODULE_KEY` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ADMIN_MODULE_ID`),
  KEY `ADMINMODULE_NAME_INDEX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_admin_module`
--

LOCK TABLES `blc_admin_module` WRITE;
/*!40000 ALTER TABLE `blc_admin_module` DISABLE KEYS */;
INSERT INTO `blc_admin_module` VALUES (1,1,'icon-barcode','BLCMerchandising','Catalog'),(2,2,'icon-file','BLCContentManagement','Content Management'),(3,3,'icon-heart','BLCCustomerCare','Customer Care'),(4,4,'icon-user','BLCOpenAdmin','User Administration');
/*!40000 ALTER TABLE `blc_admin_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_admin_permission`
--

DROP TABLE IF EXISTS `blc_admin_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_admin_permission` (
  `ADMIN_PERMISSION_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PERMISSION_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`ADMIN_PERMISSION_ID`),
  KEY `ADMINPERM_TYPE_INDEX` (`PERMISSION_TYPE`),
  KEY `ADMINPERM_NAME_INDEX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_admin_permission`
--

LOCK TABLES `blc_admin_permission` WRITE;
/*!40000 ALTER TABLE `blc_admin_permission` DISABLE KEYS */;
INSERT INTO `blc_admin_permission` VALUES (1,'Default Permission','PERMISSION_OTHER_DEFAULT','OTHER'),(2,'Create Category','PERMISSION_CREATE_CATEGORY','CREATE'),(3,'Update Category','PERMISSION_UPDATE_CATEGORY','UPDATE'),(4,'Delete Category','PERMISSION_DELETE_CATEGORY','DELETE'),(5,'Read Category','PERMISSION_READ_CATEGORY','READ'),(6,'Create Product','PERMISSION_CREATE_PRODUCT','CREATE'),(7,'Update Product','PERMISSION_UPDATE_PRODUCT','UPDATE'),(8,'Delete Product','PERMISSION_DELETE_PRODUCT','DELETE'),(9,'Read Product','PERMISSION_READ_PRODUCT','READ'),(10,'Create Promotion','PERMISSION_CREATE_PROMOTION','CREATE'),(11,'Update Promotion','PERMISSION_UPDATE_PROMOTION','UPDATE'),(12,'Delete Promotion','PERMISSION_DELETE_PROMOTION','DELETE'),(13,'Read Promotion','PERMISSION_READ_PROMOTION','READ'),(14,'Create Order','PERMISSION_CREATE_ORDER','CREATE'),(15,'Update Order','PERMISSION_UPDATE_ORDER','UPDATE'),(16,'Delete Order','PERMISSION_DELETE_ORDER','DELETE'),(17,'Read Order','PERMISSION_READ_ORDER','READ'),(18,'Create Customer','PERMISSION_CREATE_CUSTOMER','CREATE'),(19,'Update Customer','PERMISSION_UPDATE_CUSTOMER','UPDATE'),(20,'Delete Customer','PERMISSION_DELETE_CUSTOMER','DELETE'),(21,'Read Customer','PERMISSION_READ_CUSTOMER','READ'),(22,'Create Page','PERMISSION_CREATE_PAGE','CREATE'),(23,'Update Page','PERMISSION_UPDATE_PAGE','UPDATE'),(24,'Delete Page','PERMISSION_DELETE_PAGE','DELETE'),(25,'Read Page','PERMISSION_READ_PAGE','READ'),(26,'Create Asset','PERMISSION_CREATE_ASSET','CREATE'),(27,'Update Asset','PERMISSION_UPDATE_ASSET','UPDATE'),(28,'Delete Asset','PERMISSION_DELETE_ASSET','DELETE'),(29,'Read Asset','PERMISSION_READ_ASSET','READ'),(30,'Create Structured Content','PERMISSION_CREATE_STRUCTURED_CONTENT','CREATE'),(31,'Update Structured Content','PERMISSION_UPDATE_STRUCTURED_CONTENT','UPDATE'),(32,'Delete Structured Content','PERMISSION_DELETE_STRUCTURED_CONTENT','DELETE'),(33,'Read Structured Content','PERMISSION_READ_STRUCTURED_CONTENT','READ'),(34,'User SandBox','PERMISSION_ALL_USER_SANDBOX','ALL'),(35,'Approver SandBox','PERMISSION_ALL_APPROVER_SANDBOX','ALL'),(36,'Create Admin User','PERMISSION_CREATE_ADMIN_USER','CREATE'),(37,'Update Admin User','PERMISSION_UPDATE_ADMIN_USER','UPDATE'),(38,'Delete Admin User','PERMISSION_DELETE_ADMIN_USER','DELETE'),(39,'Read Admin User','PERMISSION_READ_ADMIN_USER','READ'),(40,'All Category','PERMISSION_ALL_CATEGORY','ALL'),(41,'All Product','PERMISSION_ALL_PRODUCT','ALL'),(42,'All Promotion','PERMISSION_ALL_PROMOTION','ALL'),(43,'All Order','PERMISSION_ALL_ORDER','ALL'),(44,'All Customer','PERMISSION_ALL_CUSTOMER','ALL'),(45,'All Page','PERMISSION_ALL_PAGE','ALL'),(46,'All Asset','PERMISSION_ALL_ASSET','ALL'),(47,'All Structured Content','PERMISSION_ALL_STRUCTURED_CONTENT','ALL'),(48,'All Admin User','PERMISSION_ALL_ADMIN_USER','ALL'),(49,'Create URLHandler','PERMISSION_CREATE_URLHANDLER','CREATE'),(50,'Update URLHandler','PERMISSION_UPDATE_URLHANDLER','UPDATE'),(51,'Delete URLHandler','PERMISSION_DELETE_URLHANDLER','DELETE'),(52,'Read URLHandler','PERMISSION_READ_URLHANDLER','READ'),(53,'All URLHandler','PERMISSION_ALL_URLHANDLER','ALL'),(54,'Create SearchRedirect','PERMISSION_CREATE_SEARCHREDIRECT','CREATE'),(55,'Update SearchRedirect','PERMISSION_UPDATE_SEARCHREDIRECT','UPDATE'),(56,'Delete SearchRedirect','PERMISSION_DELETE_SEARCHREDIRECT','DELETE'),(57,'Read SearchRedirect','PERMISSION_READ_SEARCHREDIRECT','READ'),(58,'All SearchRedirect','PERMISSION_ALL_SEARCHREDIRECT','ALL'),(59,'Create SearchFacet','PERMISSION_CREATE_SEARCHFACET','CREATE'),(60,'Update SearchFacet','PERMISSION_UPDATE_SEARCHFACET','UPDATE'),(61,'Delete SearchFacet','PERMISSION_DELETE_SEARCHFACET','DELETE'),(62,'Read SearchFacet','PERMISSION_READ_SEARCHFACET','READ'),(63,'All SearchFacet','PERMISSION_ALL_SEARCHFACET','ALL');
/*!40000 ALTER TABLE `blc_admin_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_admin_user`
--

DROP TABLE IF EXISTS `blc_admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_admin_user` (
  `ADMIN_USER_ID` bigint(20) NOT NULL,
  `ACTIVE_STATUS_FLAG` bit(1) DEFAULT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `LOGIN` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `PHONE_NUMBER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ADMIN_USER_ID`),
  KEY `ADMINPERM_EMAIL_INDEX` (`EMAIL`),
  KEY `ADMINUSER_NAME_INDEX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_admin_user`
--

LOCK TABLES `blc_admin_user` WRITE;
/*!40000 ALTER TABLE `blc_admin_user` DISABLE KEYS */;
INSERT INTO `blc_admin_user` VALUES (1,'','admin@yourdomain.com','admin','Administrator','admin',NULL),(2,'','merchandise@yourdomain.com','merchandise','Merchandise Manager','admin',NULL),(3,'','promo@yourdomain.com','promo','Promotion Manager','admin',NULL),(4,'','csr@yourdomain.com','csr','CSR','admin',NULL),(5,'','cms_edit@yourdomain.com','cmsEditor','CMS Editor','admin',NULL),(6,'','cms_approver@yourdomain.com','cmsApprover','CMS Approver','admin',NULL);
/*!40000 ALTER TABLE `blc_admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_bank_account_payment`
--

DROP TABLE IF EXISTS `blc_bank_account_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_bank_account_payment` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `ACCOUNT_NUMBER` varchar(255) NOT NULL,
  `REFERENCE_NUMBER` varchar(255) NOT NULL,
  `ROUTING_NUMBER` varchar(255) NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `BANKACCOUNT_INDEX` (`REFERENCE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_bank_account_payment`
--

LOCK TABLES `blc_bank_account_payment` WRITE;
/*!40000 ALTER TABLE `blc_bank_account_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_bank_account_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_content`
--

DROP TABLE IF EXISTS `blc_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_content` (
  `ID` int(11) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `APPROVED_BY` varchar(255) DEFAULT NULL,
  `APPROVED_DATE` datetime DEFAULT NULL,
  `BROWSER_TITLE` varchar(255) DEFAULT NULL,
  `CONTENT_DATE` datetime DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) DEFAULT NULL,
  `DEPLOYED` bit(1) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `DISPLAY_RULE` varchar(255) DEFAULT NULL,
  `KEYWORDS` varchar(255) DEFAULT NULL,
  `LANGUAGE_CODE` varchar(255) DEFAULT NULL,
  `LAST_MODIFIED_BY` varchar(255) DEFAULT NULL,
  `LAST_MODIFIED_DATE` datetime DEFAULT NULL,
  `META_DESCRIPTION` varchar(255) DEFAULT NULL,
  `NOTE` varchar(255) DEFAULT NULL,
  `ONLINE_STATE` bit(1) DEFAULT NULL,
  `PARENT_CONTENT_ID` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `REJECTED_BY` varchar(255) DEFAULT NULL,
  `REJECTED_DATE` datetime DEFAULT NULL,
  `RENDER_TEMPLATE` varchar(255) DEFAULT NULL,
  `SANDBOX` varchar(255) DEFAULT NULL,
  `SUBMITTED_BY` varchar(255) DEFAULT NULL,
  `SUBMITTED_DATE` datetime DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `URL_TITLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CONTENT_INDEX` (`SANDBOX`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_content`
--

LOCK TABLES `blc_content` WRITE;
/*!40000 ALTER TABLE `blc_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_credit_card_payment`
--

DROP TABLE IF EXISTS `blc_credit_card_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_credit_card_payment` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `EXPIRATION_MONTH` int(11) NOT NULL,
  `EXPIRATION_YEAR` int(11) NOT NULL,
  `NAME_ON_CARD` varchar(255) NOT NULL,
  `PAN` varchar(255) NOT NULL,
  `REFERENCE_NUMBER` varchar(255) NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `CREDITCARD_INDEX` (`REFERENCE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_credit_card_payment`
--

LOCK TABLES `blc_credit_card_payment` WRITE;
/*!40000 ALTER TABLE `blc_credit_card_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_credit_card_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_data_drvn_enum`
--

DROP TABLE IF EXISTS `blc_data_drvn_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_data_drvn_enum` (
  `ENUM_ID` bigint(20) NOT NULL,
  `ENUM_KEY` varchar(255) DEFAULT NULL,
  `MODIFIABLE` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ENUM_ID`),
  KEY `ENUM_KEY_INDEX` (`ENUM_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_data_drvn_enum`
--

LOCK TABLES `blc_data_drvn_enum` WRITE;
/*!40000 ALTER TABLE `blc_data_drvn_enum` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_data_drvn_enum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_email_tracking`
--

DROP TABLE IF EXISTS `blc_email_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_email_tracking` (
  `EMAIL_TRACKING_ID` bigint(20) NOT NULL,
  `DATE_SENT` datetime DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EMAIL_TRACKING_ID`),
  KEY `EMAILTRACKING_INDEX` (`EMAIL_ADDRESS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_email_tracking`
--

LOCK TABLES `blc_email_tracking` WRITE;
/*!40000 ALTER TABLE `blc_email_tracking` DISABLE KEYS */;
INSERT INTO `blc_email_tracking` VALUES (1,'2013-05-11 11:44:14','Jonnyfarago@live.ca',NULL);
/*!40000 ALTER TABLE `blc_email_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_gift_card_payment`
--

DROP TABLE IF EXISTS `blc_gift_card_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_gift_card_payment` (
  `PAYMENT_ID` bigint(20) NOT NULL,
  `PAN` varchar(255) NOT NULL,
  `PIN` varchar(255) DEFAULT NULL,
  `REFERENCE_NUMBER` varchar(255) NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `GIFTCARD_INDEX` (`REFERENCE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_gift_card_payment`
--

LOCK TABLES `blc_gift_card_payment` WRITE;
/*!40000 ALTER TABLE `blc_gift_card_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_gift_card_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_media`
--

DROP TABLE IF EXISTS `blc_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_media` (
  `MEDIA_ID` bigint(20) NOT NULL,
  `ALT_TEXT` varchar(255) DEFAULT NULL,
  `TAGS` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `URL` varchar(255) NOT NULL,
  PRIMARY KEY (`MEDIA_ID`),
  KEY `MEDIA_URL_INDEX` (`URL`),
  KEY `MEDIA_TITLE_INDEX` (`TITLE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_media`
--

LOCK TABLES `blc_media` WRITE;
/*!40000 ALTER TABLE `blc_media` DISABLE KEYS */;
INSERT INTO `blc_media` VALUES (101,'primary',NULL,'Sudden Death Sauce Bottle','/img/sauces/Sudden-Death-Sauce-Bottle.jpg'),(102,'alt1',NULL,'Sudden Death Sauce Close-up','/img/sauces/Sudden-Death-Sauce-Close.jpg'),(201,'primary',NULL,'Sweet Death Sauce Bottle','/img/sauces/Sweet-Death-Sauce-Bottle.jpg'),(202,'alt1',NULL,'Sweet Death Sauce Close-up','/img/sauces/Sweet-Death-Sauce-Close.jpg'),(203,'alt2',NULL,'Sweet Death Sauce Close-up','/img/sauces/Sweet-Death-Sauce-Skull.jpg'),(204,'alt3',NULL,'Sweet Death Sauce Close-up','/img/sauces/Sweet-Death-Sauce-Tile.jpg'),(205,'alt4',NULL,'Sweet Death Sauce Close-up','/img/sauces/Sweet-Death-Sauce-Grass.jpg'),(206,'alt5',NULL,'Sweet Death Sauce Close-up','/img/sauces/Sweet-Death-Sauce-Logo.jpg'),(301,'primary',NULL,'Hoppin Hot Sauce Bottle','/img/sauces/Hoppin-Hot-Sauce-Bottle.jpg'),(302,'alt1',NULL,'Hoppin Hot Sauce Close-up','/img/sauces/Hoppin-Hot-Sauce-Close.jpg'),(401,'primary',NULL,'Day of the Dead Chipotle Hot Sauce Bottle','/img/sauces/Day-of-the-Dead-Chipotle-Hot-Sauce-Bottle.jpg'),(402,'alt1',NULL,'Day of the Dead Chipotle Hot Sauce Close-up','/img/sauces/Day-of-the-Dead-Chipotle-Hot-Sauce-Close.jpg'),(501,'primary',NULL,'Day of the Dead Habanero Hot Sauce Bottle','/img/sauces/Day-of-the-Dead-Habanero-Hot-Sauce-Bottle.jpg'),(502,'alt1',NULL,'Day of the Dead Habanero Hot Sauce Close-up','/img/sauces/Day-of-the-Dead-Habanero-Hot-Sauce-Close.jpg'),(601,'primary',NULL,'Day of the Dead Scotch Bonnet Hot Sauce Bottle','/img/sauces/Day-of-the-Dead-Scotch-Bonnet-Hot-Sauce-Bottle.jpg'),(602,'alt1',NULL,'Day of the Dead Scotch Bonnet Hot Sauce Close-up','/img/sauces/Day-of-the-Dead-Scotch-Bonnet-Hot-Sauce-Close.jpg'),(701,'primary',NULL,'Green Ghost Bottle','/img/sauces/Green-Ghost-Bottle.jpg'),(702,'alt1',NULL,'Green Ghost Close-up','/img/sauces/Green-Ghost-Close.jpg'),(801,'primary',NULL,'Blazin Saddle XXX Hot Habanero Pepper Sauce Bottle','/img/sauces/Blazin-Saddle-XXX-Hot-Habanero-Pepper-Sauce-Bottle.jpg'),(802,'alt1',NULL,'Blazin Saddle XXX Hot Habanero Pepper Sauce Close-up','/img/sauces/Blazin-Saddle-XXX-Hot-Habanero-Pepper-Sauce-Close.jpg'),(901,'primary',NULL,'Armageddon The Hot Sauce To End All Bottle','/img/sauces/Armageddon-The-Hot-Sauce-To-End-All-Bottle.jpg'),(902,'alt1',NULL,'Armageddon The Hot Sauce To End All Close-up','/img/sauces/Armageddon-The-Hot-Sauce-To-End-All-Close.jpg'),(1001,'primary',NULL,'Dr. Chilemeisters Insane Hot Sauce Bottle','/img/sauces/Dr.-Chilemeisters-Insane-Hot-Sauce-Bottle.jpg'),(1002,'alt1',NULL,'Dr. Chilemeisters Insane Hot Sauce Close-up','/img/sauces/Dr.-Chilemeisters-Insane-Hot-Sauce-Close.jpg'),(1101,'primary',NULL,'Bull Snort Cowboy Cayenne Pepper Hot Sauce Bottle','/img/sauces/Bull-Snort-Cowboy-Cayenne-Pepper-Hot-Sauce-Bottle.jpg'),(1102,'alt1',NULL,'Bull Snort Cowboy Cayenne Pepper Hot Sauce Close-up','/img/sauces/Bull-Snort-Cowboy-Cayenne-Pepper-Hot-Sauce-Close.jpg'),(1201,'primary',NULL,'Cafe Louisiane Sweet Cajun Blackening Sauce Bottle','/img/sauces/Cafe-Louisiane-Sweet-Cajun-Blackening-Sauce-Bottle.jpg'),(1202,'alt1',NULL,'Cafe Louisiane Sweet Cajun Blackening Sauce Close-up','/img/sauces/Cafe-Louisiane-Sweet-Cajun-Blackening-Sauce-Close.jpg'),(1301,'primary',NULL,'Bull Snort Smokin Toncils Hot Sauce Bottle','/img/sauces/Bull-Snort-Smokin-Toncils-Hot-Sauce-Bottle.jpg'),(1302,'alt1',NULL,'Bull Snort Smokin Toncils Hot Sauce Close-up','/img/sauces/Bull-Snort-Smokin-Toncils-Hot-Sauce-Close.jpg'),(1401,'primary',NULL,'Cool Cayenne Pepper Hot Sauce Bottle','/img/sauces/Cool-Cayenne-Pepper-Hot-Sauce-Bottle.jpg'),(1402,'alt1',NULL,'Cool Cayenne Pepper Hot Sauce Close-up','/img/sauces/Cool-Cayenne-Pepper-Hot-Sauce-Close.jpg'),(1501,'primary',NULL,'Roasted Garlic Hot Sauce Bottle','/img/sauces/Roasted-Garlic-Hot-Sauce-Bottle.jpg'),(1502,'alt1',NULL,'Roasted Garlic Hot Sauce Close-up','/img/sauces/Roasted-Garlic-Hot-Sauce-Close.jpg'),(1601,'primary',NULL,'Scotch Bonnet Hot Sauce Bottle','/img/sauces/Scotch-Bonnet-Hot-Sauce-Bottle.jpg'),(1602,'alt1',NULL,'Scotch Bonnet Hot Sauce Close-up','/img/sauces/Scotch-Bonnet-Hot-Sauce-Close.jpg'),(1701,'primary',NULL,'Insanity Sauce Bottle','/img/sauces/Insanity-Sauce-Bottle.jpg'),(1702,'alt1',NULL,'Insanity Sauce Close-up','/img/sauces/Insanity-Sauce-Close.jpg'),(1801,'primary',NULL,'Hurtin Jalepeno Hot Sauce Bottle','/img/sauces/Hurtin-Jalepeno-Hot-Sauce-Bottle.jpg'),(1802,'alt1',NULL,'Hurtin Jalepeno Hot Sauce Close-up','/img/sauces/Hurtin-Jalepeno-Hot-Sauce-Close.jpg'),(1901,'primary',NULL,'Roasted Red Pepper and Chipotle Hot Sauce Bottle','/img/sauces/Roasted-Red-Pepper-and-Chipotle-Hot-Sauce-Bottle.jpg'),(1902,'alt1',NULL,'Roasted Red Pepper and Chipotle Hot Sauce Close-up','/img/sauces/Roasted-Red-Pepper-and-Chipotle-Hot-Sauce-Close.jpg'),(10001,'primary','Black','Hawt Like a Habanero Men\'s Black','/img/merch/habanero_mens_black.jpg'),(10002,'primary','Red','Hawt Like a Habanero Men\'s Red','/img/merch/habanero_mens_red.jpg'),(10003,'primary','Silver','Hawt Like a Habanero Men\'s Silver','/img/merch/habanero_mens_silver.jpg'),(20001,'primary','Black','Hawt Like a Habanero Women\'s Black','/img/merch/habanero_womens_black.jpg'),(20002,'primary','Red','Hawt Like a Habanero Women\'s Red','/img/merch/habanero_womens_red.jpg'),(20003,'primary','Silver','Hawt Like a Habanero Women\'s Silver','/img/merch/habanero_womens_silver.jpg'),(30001,'primary',NULL,'Heat Clinic Hand-Drawn Men\'s Black','/img/merch/heat_clinic_handdrawn_mens_black.jpg'),(30002,'primary',NULL,'Heat Clinic Hand-Drawn Men\'s Red','/img/merch/heat_clinic_handdrawn_mens_red.jpg'),(30003,'primary',NULL,'Heat Clinic Hand-Drawn Men\'s Silver','/img/merch/heat_clinic_handdrawn_mens_silver.jpg'),(40001,'primary',NULL,'Heat Clinic Hand-Drawn Women\'s Black','/img/merch/heat_clinic_handdrawn_womens_black.jpg'),(40002,'primary',NULL,'Heat Clinic Hand-Drawn Women\'s Red','/img/merch/heat_clinic_handdrawn_womens_red.jpg'),(40003,'primary',NULL,'Heat Clinic Hand-Drawn Women\'s Silver','/img/merch/heat_clinic_handdrawn_womens_silver.jpg'),(50001,'primary',NULL,'Heat Clinic Mascot Men\'s Black','/img/merch/heat_clinic_mascot_mens_black.jpg'),(50002,'primary',NULL,'Heat Clinic Mascot Men\'s Red','/img/merch/heat_clinic_mascot_mens_red.jpg'),(50003,'primary',NULL,'Heat Clinic Mascot Men\'s Silver','/img/merch/heat_clinic_mascot_mens_silver.jpg'),(60001,'primary',NULL,'Heat Clinic Mascot Women\'s Black','/img/merch/heat_clinic_mascot_womens_black.jpg'),(60002,'primary',NULL,'Heat Clinic Mascot Women\'s Red','/img/merch/heat_clinic_mascot_womens_red.jpg'),(60003,'primary',NULL,'Heat Clinic Mascot Women\'s Silver','/img/merch/heat_clinic_mascot_womens_silver.jpg');
/*!40000 ALTER TABLE `blc_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_offer`
--

DROP TABLE IF EXISTS `blc_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_offer` (
  `OFFER_ID` bigint(20) NOT NULL,
  `APPLIES_WHEN_RULES` longtext,
  `APPLIES_TO_RULES` longtext,
  `APPLY_OFFER_TO_MARKED_ITEMS` bit(1) DEFAULT NULL,
  `APPLY_TO_SALE_PRICE` bit(1) DEFAULT NULL,
  `ARCHIVED` char(1) DEFAULT NULL,
  `COMBINABLE_WITH_OTHER_OFFERS` bit(1) DEFAULT NULL,
  `OFFER_DELIVERY_TYPE` varchar(255) NOT NULL,
  `OFFER_DESCRIPTION` varchar(255) DEFAULT NULL,
  `OFFER_DISCOUNT_TYPE` varchar(255) DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `MAX_USES_PER_CUSTOMER` bigint(20) DEFAULT NULL,
  `MAX_USES` int(11) DEFAULT NULL,
  `OFFER_NAME` varchar(255) NOT NULL,
  `OFFER_ITEM_QUALIFIER_RULE` varchar(255) DEFAULT NULL,
  `OFFER_ITEM_TARGET_RULE` varchar(255) DEFAULT NULL,
  `OFFER_PRIORITY` int(11) DEFAULT NULL,
  `QUALIFYING_ITEM_MIN_TOTAL` decimal(19,5) DEFAULT NULL,
  `STACKABLE` bit(1) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `TARGET_SYSTEM` varchar(255) DEFAULT NULL,
  `TOTALITARIAN_OFFER` bit(1) DEFAULT NULL,
  `USE_NEW_FORMAT` bit(1) DEFAULT NULL,
  `OFFER_TYPE` varchar(255) NOT NULL,
  `USES` int(11) DEFAULT NULL,
  `OFFER_VALUE` decimal(19,5) NOT NULL,
  PRIMARY KEY (`OFFER_ID`),
  KEY `OFFER_DELIVERY_INDEX` (`OFFER_DELIVERY_TYPE`),
  KEY `OFFER_DISCOUNT_INDEX` (`OFFER_DISCOUNT_TYPE`),
  KEY `OFFER_TYPE_INDEX` (`OFFER_TYPE`),
  KEY `OFFER_NAME_INDEX` (`OFFER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_offer`
--

LOCK TABLES `blc_offer` WRITE;
/*!40000 ALTER TABLE `blc_offer` DISABLE KEYS */;
INSERT INTO `blc_offer` VALUES (1,NULL,NULL,'\0','\0',NULL,'','AUTOMATIC',NULL,'PERCENT_OFF','2020-01-01 00:00:00',NULL,0,'Shirts Special',NULL,NULL,10,NULL,'','2013-05-11 00:00:00',NULL,NULL,NULL,'ORDER_ITEM',0,20.00000);
/*!40000 ALTER TABLE `blc_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_offer_audit`
--

DROP TABLE IF EXISTS `blc_offer_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_offer_audit` (
  `OFFER_AUDIT_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) DEFAULT NULL,
  `OFFER_ID` bigint(20) DEFAULT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `REDEEMED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`OFFER_AUDIT_ID`),
  KEY `OFFERAUDIT_OFFER_INDEX` (`OFFER_ID`),
  KEY `OFFERAUDIT_CUSTOMER_INDEX` (`CUSTOMER_ID`),
  KEY `OFFERAUDIT_ORDER_INDEX` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_offer_audit`
--

LOCK TABLES `blc_offer_audit` WRITE;
/*!40000 ALTER TABLE `blc_offer_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_offer_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_rating_summary`
--

DROP TABLE IF EXISTS `blc_rating_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_rating_summary` (
  `RATING_SUMMARY_ID` bigint(20) NOT NULL,
  `AVERAGE_RATING` double NOT NULL,
  `ITEM_ID` varchar(255) NOT NULL,
  `RATING_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`RATING_SUMMARY_ID`),
  KEY `RATINGSUMM_TYPE_INDEX` (`RATING_TYPE`),
  KEY `RATINGSUMM_ITEM_INDEX` (`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_rating_summary`
--

LOCK TABLES `blc_rating_summary` WRITE;
/*!40000 ALTER TABLE `blc_rating_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_rating_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_role`
--

DROP TABLE IF EXISTS `blc_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_role` (
  `ROLE_ID` bigint(20) NOT NULL,
  `ROLE_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ROLE_ID`),
  KEY `ROLE_NAME_INDEX` (`ROLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_role`
--

LOCK TABLES `blc_role` WRITE;
/*!40000 ALTER TABLE `blc_role` DISABLE KEYS */;
INSERT INTO `blc_role` VALUES (1,'ROLE_USER');
/*!40000 ALTER TABLE `blc_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sandbox`
--

DROP TABLE IF EXISTS `blc_sandbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sandbox` (
  `SANDBOX_ID` bigint(20) NOT NULL,
  `AUTHOR` bigint(20) DEFAULT NULL,
  `SANDBOX_NAME` varchar(255) DEFAULT NULL,
  `SANDBOX_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SANDBOX_ID`),
  KEY `SANDBOX_NAME_INDEX` (`SANDBOX_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sandbox`
--

LOCK TABLES `blc_sandbox` WRITE;
/*!40000 ALTER TABLE `blc_sandbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sandbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_search_intercept`
--

DROP TABLE IF EXISTS `blc_search_intercept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_search_intercept` (
  `SEARCH_REDIRECT_ID` bigint(20) NOT NULL,
  `ACTIVE_END_DATE` datetime DEFAULT NULL,
  `ACTIVE_START_DATE` datetime DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `SEARCH_TERM` varchar(255) NOT NULL,
  `URL` varchar(255) NOT NULL,
  PRIMARY KEY (`SEARCH_REDIRECT_ID`),
  KEY `SEARCH_ACTIVE_INDEX` (`ACTIVE_END_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_search_intercept`
--

LOCK TABLES `blc_search_intercept` WRITE;
/*!40000 ALTER TABLE `blc_search_intercept` DISABLE KEYS */;
INSERT INTO `blc_search_intercept` VALUES (1,NULL,NULL,1,'insanity','/hot-sauces/insanity_sauce'),(2,'1999-10-15 21:28:36','1992-10-15 14:28:36',-10,'new york','/search?q=pace picante');
/*!40000 ALTER TABLE `blc_search_intercept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_search_synonym`
--

DROP TABLE IF EXISTS `blc_search_synonym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_search_synonym` (
  `SEARCH_SYNONYM_ID` bigint(20) NOT NULL,
  `SYNONYMS` varchar(255) DEFAULT NULL,
  `TERM` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SEARCH_SYNONYM_ID`),
  KEY `SEARCHSYNONYM_TERM_INDEX` (`TERM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_search_synonym`
--

LOCK TABLES `blc_search_synonym` WRITE;
/*!40000 ALTER TABLE `blc_search_synonym` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_search_synonym` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_shipping_rate`
--

DROP TABLE IF EXISTS `blc_shipping_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_shipping_rate` (
  `ID` bigint(20) NOT NULL,
  `BAND_RESULT_PCT` int(11) NOT NULL,
  `BAND_RESULT_QTY` decimal(19,2) NOT NULL,
  `BAND_UNIT_QTY` decimal(19,2) NOT NULL,
  `FEE_BAND` int(11) NOT NULL,
  `FEE_SUB_TYPE` varchar(255) DEFAULT NULL,
  `FEE_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SHIPPINGRATE_FEE_INDEX` (`FEE_TYPE`),
  KEY `SHIPPINGRATE_FEESUB_INDEX` (`FEE_SUB_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_shipping_rate`
--

LOCK TABLES `blc_shipping_rate` WRITE;
/*!40000 ALTER TABLE `blc_shipping_rate` DISABLE KEYS */;
INSERT INTO `blc_shipping_rate` VALUES (1,0,8.50,29.99,1,'ALL','SHIPPING'),(2,0,10.50,39.99,2,'ALL','EXPEDITED'),(3,0,30.00,999999.00,1,'ALL','SHIPPING'),(4,0,50.00,999999.00,2,'ALL','EXPEDITED');
/*!40000 ALTER TABLE `blc_shipping_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_sku_availability`
--

DROP TABLE IF EXISTS `blc_sku_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_sku_availability` (
  `SKU_AVAILABILITY_ID` bigint(20) NOT NULL,
  `AVAILABILITY_DATE` datetime DEFAULT NULL,
  `AVAILABILITY_STATUS` varchar(255) DEFAULT NULL,
  `LOCATION_ID` bigint(20) DEFAULT NULL,
  `QTY_ON_HAND` int(11) DEFAULT NULL,
  `RESERVE_QTY` int(11) DEFAULT NULL,
  `SKU_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SKU_AVAILABILITY_ID`),
  KEY `SKUAVAIL_STATUS_INDEX` (`AVAILABILITY_STATUS`),
  KEY `SKUAVAIL_LOCATION_INDEX` (`LOCATION_ID`),
  KEY `SKUAVAIL_SKU_INDEX` (`SKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_sku_availability`
--

LOCK TABLES `blc_sku_availability` WRITE;
/*!40000 ALTER TABLE `blc_sku_availability` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_sku_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_static_asset_strg`
--

DROP TABLE IF EXISTS `blc_static_asset_strg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_static_asset_strg` (
  `STATIC_ASSET_STRG_ID` bigint(20) NOT NULL,
  `FILE_DATA` longblob,
  `STATIC_ASSET_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`STATIC_ASSET_STRG_ID`),
  KEY `STATIC_ASSET_ID_INDEX` (`STATIC_ASSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_static_asset_strg`
--

LOCK TABLES `blc_static_asset_strg` WRITE;
/*!40000 ALTER TABLE `blc_static_asset_strg` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_static_asset_strg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_store`
--

DROP TABLE IF EXISTS `blc_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_store` (
  `STORE_ID` varchar(255) NOT NULL,
  `ADDRESS_1` varchar(255) DEFAULT NULL,
  `ADDRESS_2` varchar(255) DEFAULT NULL,
  `STORE_CITY` varchar(255) DEFAULT NULL,
  `STORE_COUNTRY` varchar(255) DEFAULT NULL,
  `LATITUDE` double DEFAULT NULL,
  `LONGITUDE` double DEFAULT NULL,
  `STORE_NAME` varchar(255) DEFAULT NULL,
  `STORE_PHONE` varchar(255) DEFAULT NULL,
  `STORE_STATE` varchar(255) DEFAULT NULL,
  `STORE_ZIP` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`STORE_ID`),
  KEY `STORE_STATE_INDEX` (`STORE_STATE`),
  KEY `STORE_COUNTRY_INDEX` (`STORE_COUNTRY`),
  KEY `STORE_ZIP_INDEX` (`STORE_ZIP`),
  KEY `STORE_LONGITUDE_INDEX` (`LONGITUDE`),
  KEY `STORE_LATITUDE_INDEX` (`LATITUDE`),
  KEY `STORE_NAME_INDEX` (`STORE_NAME`),
  KEY `STORE_CITY_INDEX` (`STORE_CITY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_store`
--

LOCK TABLES `blc_store` WRITE;
/*!40000 ALTER TABLE `blc_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_target_content`
--

DROP TABLE IF EXISTS `blc_target_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_target_content` (
  `TARGET_CONTENT_ID` bigint(20) NOT NULL,
  `CONTENT` varchar(255) DEFAULT NULL,
  `CONTENT_NAME` varchar(255) NOT NULL,
  `CONTENT_TYPE` varchar(255) NOT NULL,
  `OFFLINE_DATE` datetime DEFAULT NULL,
  `ONLINE_DATE` datetime DEFAULT NULL,
  `PRIORITY` int(11) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TARGET_CONTENT_ID`),
  KEY `TARGETCONTENT_TYPE_INDEX` (`CONTENT_TYPE`),
  KEY `TARGETCONTENT_NAME_INDEX` (`CONTENT_NAME`),
  KEY `TARGETCONTENT_URL_INDEX` (`URL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_target_content`
--

LOCK TABLES `blc_target_content` WRITE;
/*!40000 ALTER TABLE `blc_target_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_target_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blc_zip_code`
--

DROP TABLE IF EXISTS `blc_zip_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blc_zip_code` (
  `ZIP_CODE_ID` varchar(255) NOT NULL,
  `ZIP_CITY` varchar(255) DEFAULT NULL,
  `ZIP_LATITUDE` double DEFAULT NULL,
  `ZIP_LONGITUDE` double DEFAULT NULL,
  `ZIP_STATE` varchar(255) DEFAULT NULL,
  `ZIPCODE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ZIP_CODE_ID`),
  KEY `ZIPCODE_STATE_INDEX` (`ZIP_STATE`),
  KEY `ZIPCODE_LONGITUDE_INDEX` (`ZIP_LONGITUDE`),
  KEY `ZIPCODE_CITY_INDEX` (`ZIP_CITY`),
  KEY `ZIPCODE_ZIP_INDEX` (`ZIPCODE`),
  KEY `ZIPCODE_LATITUDE_INDEX` (`ZIP_LATITUDE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blc_zip_code`
--

LOCK TABLES `blc_zip_code` WRITE;
/*!40000 ALTER TABLE `blc_zip_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `blc_zip_code` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-11 11:46:10

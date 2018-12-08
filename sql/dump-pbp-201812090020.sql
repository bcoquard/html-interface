-- MySQL dump 10.16  Distrib 10.3.9-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: pbp
-- ------------------------------------------------------
-- Server version	5.7.23

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
-- Table structure for table `a_conseiller_client`
--

DROP TABLE IF EXISTS `a_conseiller_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_conseiller_client` (
  `id_conseiller` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  PRIMARY KEY (`id_conseiller`,`id_client`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_conseiller_client`
--

LOCK TABLES `a_conseiller_client` WRITE;
/*!40000 ALTER TABLE `a_conseiller_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `a_conseiller_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agence`
--

DROP TABLE IF EXISTS `agence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agence` (
  `id_agence` int(11) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_agence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agence`
--

LOCK TABLES `agence` WRITE;
/*!40000 ALTER TABLE `agence` DISABLE KEYS */;
/*!40000 ALTER TABLE `agence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficiaire`
--

DROP TABLE IF EXISTS `beneficiaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beneficiaire` (
  `id_benificiaire` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `iban` varchar(100) DEFAULT NULL,
  `valide` tinyint(1) NOT NULL DEFAULT '0',
  `date_ajout` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_benificiaire`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficiaire`
--

LOCK TABLES `beneficiaire` WRITE;
/*!40000 ALTER TABLE `beneficiaire` DISABLE KEYS */;
INSERT INTO `beneficiaire` VALUES (1,1,'Ben','0123456789',1,'2018-12-08 23:55:48'),(2,1,'Annaelle','2316516564',0,'2018-12-08 23:55:48'),(3,1,'Mathieu','3665582164',1,'2018-12-08 23:55:48'),(34,1,'test ben','546105',1,'2018-12-09 00:17:00');
/*!40000 ALTER TABLE `beneficiaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carte_bancaire`
--

DROP TABLE IF EXISTS `carte_bancaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carte_bancaire` (
  `id_carte` int(11) NOT NULL,
  `id_compte` int(11) DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `Cryptocrypto` varchar(255) DEFAULT NULL,
  `nom_usage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_carte`),
  KEY `id_compte` (`id_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carte_bancaire`
--

LOCK TABLES `carte_bancaire` WRITE;
/*!40000 ALTER TABLE `carte_bancaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `carte_bancaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chequier`
--

DROP TABLE IF EXISTS `chequier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chequier` (
  `id_chequier` int(11) NOT NULL,
  `id_compte` int(11) DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  PRIMARY KEY (`id_chequier`),
  KEY `id_compte` (`id_compte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chequier`
--

LOCK TABLES `chequier` WRITE;
/*!40000 ALTER TABLE `chequier` DISABLE KEYS */;
/*!40000 ALTER TABLE `chequier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` enum('') DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `id_agence` int(11) NOT NULL,
  `rib` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'test','test','','Marie','Marie',NULL,'marie@marie.gmail.com','0123456789','c\'est ici',0,'0');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compte`
--

DROP TABLE IF EXISTS `compte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compte` (
  `id_compte` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('epargne','cheque') DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL,
  `solde` decimal(10,0) DEFAULT NULL,
  `taux` decimal(10,0) DEFAULT NULL,
  `decouvert` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_compte`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compte`
--

LOCK TABLES `compte` WRITE;
/*!40000 ALTER TABLE `compte` DISABLE KEYS */;
INSERT INTO `compte` VALUES (1,'cheque','0123456789',1,0,0,1),(2,'epargne','9876543210',1,0,1,0),(3,'cheque','5345630545',1,11,0,1),(4,'epargne','1112255566',1,30,1,0);
/*!40000 ALTER TABLE `compte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conseiller`
--

DROP TABLE IF EXISTS `conseiller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conseiller` (
  `id_conseiller` int(11) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_conseiller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conseiller`
--

LOCK TABLES `conseiller` WRITE;
/*!40000 ALTER TABLE `conseiller` DISABLE KEYS */;
/*!40000 ALTER TABLE `conseiller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demande`
--

DROP TABLE IF EXISTS `demande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demande` (
  `id_demande` int(11) NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_demande`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demande`
--

LOCK TABLES `demande` WRITE;
/*!40000 ALTER TABLE `demande` DISABLE KEYS */;
/*!40000 ALTER TABLE `demande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation`
--

DROP TABLE IF EXISTS `operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation` (
  `operation_id` int(11) NOT NULL,
  `compte_debit` int(11) DEFAULT NULL,
  `compte_credit` int(11) DEFAULT NULL,
  `type` enum('') DEFAULT NULL,
  `date_execution` date DEFAULT NULL,
  `montant` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`operation_id`),
  KEY `compte_debit` (`compte_debit`),
  KEY `compte_credit` (`compte_credit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation`
--

LOCK TABLES `operation` WRITE;
/*!40000 ALTER TABLE `operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pbp'
--

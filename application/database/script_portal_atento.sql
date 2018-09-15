-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: portal_atento
-- ------------------------------------------------------
-- Server version 5.5.5-10.1.34-MariaDB

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
-- Table structure for table `anexos`
--

CREATE DATABASE portal_atento;

USE portal_atento;


DROP TABLE IF EXISTS `anexos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anexos` (
  `id_anexo` int(5) NOT NULL,
  `link_anexo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_anexo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anexos`
--

LOCK TABLES `anexos` WRITE;
/*!40000 ALTER TABLE `anexos` DISABLE KEYS */;
/*!40000 ALTER TABLE `anexos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividades`
--

DROP TABLE IF EXISTS `atividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividades` (
  `id_atividade` int(5) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(40) NOT NULL,
  `descricao` varchar(80) DEFAULT NULL,
  `data_criacao` date NOT NULL,
  `data_atualizada` date DEFAULT NULL,
  `data_finalizada` date DEFAULT NULL,
  `id_usuario` int(5) NOT NULL,
  `id_questao` int(5) DEFAULT NULL,
  `id_anexo` int(5) DEFAULT NULL,
  PRIMARY KEY (`id_atividade`),
  KEY `ativ_id_usuario_fk` (`id_usuario`),
  KEY `ativ_id_questao_fk` (`id_questao`),
  KEY `ativ_id_anexo_fk` (`id_anexo`),
  CONSTRAINT `ativ_id_anexo_fk` FOREIGN KEY (`id_anexo`) REFERENCES `anexos` (`id_anexo`),
  CONSTRAINT `ativ_id_questao_fk` FOREIGN KEY (`id_questao`) REFERENCES `questoes` (`id_questao`),
  CONSTRAINT `ativ_id_usuario_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividades`
--

LOCK TABLES `atividades` WRITE;
/*!40000 ALTER TABLE `atividades` DISABLE KEYS */;
/*!40000 ALTER TABLE `atividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conquistas`
--

DROP TABLE IF EXISTS `conquistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conquistas` (
  `id_usuario` int(5) NOT NULL,
  `id_atividade` int(5) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `tipo_conquista` varchar(20) NOT NULL,
  `pontuacao` int(2) NOT NULL,
  `data_conquista` date NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_atividade`),
  KEY `conq_id_atividade_fk` (`id_atividade`),
  CONSTRAINT `conq_id_atividade_fk` FOREIGN KEY (`id_atividade`) REFERENCES `atividades` (`id_atividade`),
  CONSTRAINT `conq_id_usuario_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conquistas`
--

LOCK TABLES `conquistas` WRITE;
/*!40000 ALTER TABLE `conquistas` DISABLE KEYS */;
/*!40000 ALTER TABLE `conquistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionarios` (
  `id_funcionario` int(5) NOT NULL AUTO_INCREMENT,
  `p_nome` varchar(20) NOT NULL,
  `u_nome` varchar(80) NOT NULL,
  `status_func` int(1) NOT NULL,
  `id_gestor` int(5) DEFAULT NULL,
  PRIMARY KEY (`id_funcionario`),
  KEY `func_id_gestor_fk` (`id_gestor`),
  CONSTRAINT `func_id_gestor_fk` FOREIGN KEY (`id_gestor`) REFERENCES `funcionarios` (`id_funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questoes`
--

DROP TABLE IF EXISTS `questoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questoes` (
  `id_questao` int(5) NOT NULL AUTO_INCREMENT,
  `enunciado_desc` varchar(80) NOT NULL,
  `pergunta` varchar(100) NOT NULL,
  `pergunta2` varchar(100) NOT NULL,
  `pergunta3` varchar(100) NOT NULL,
  `pergunta4` varchar(100) NOT NULL,
  `resposta_pergunta` varchar(100) NOT NULL,
  PRIMARY KEY (`id_questao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questoes`
--

LOCK TABLES `questoes` WRITE;
/*!40000 ALTER TABLE `questoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `questoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(5) NOT NULL AUTO_INCREMENT,
  `usuario_login` varchar(40) NOT NULL,
  `usuario_senha` varchar(50) NOT NULL,
  `tipo_acesso` varchar(20) NOT NULL,
  `id_funcionario` int(5) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario_login_un` (`usuario_login`),
  KEY `uro_id_funcionario_fk` (`id_funcionario`),
  CONSTRAINT `uro_id_funcionario_fk` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-15 12:27:20

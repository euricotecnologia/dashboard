-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 30/11/2023 às 19:14
-- Versão do servidor: 10.5.19-MariaDB-cll-lve
-- Versão do PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `u512569378_dashboard`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `CADASTRO_EMPRESA`
--

CREATE TABLE `CADASTRO_EMPRESA` (
  `CNPJ` bigint(14) UNSIGNED ZEROFILL NOT NULL,
  `razao_social` varchar(200) DEFAULT NULL,
  `fanstasia` varchar(200) DEFAULT NULL,
  `proprietario` varchar(200) DEFAULT NULL,
  `email` varchar(400) DEFAULT NULL,
  `pass` varchar(120) DEFAULT NULL,
  `ULTIMA_ATUALIZACAO_APP` datetime DEFAULT NULL,
  `JSON_APP` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `CADASTRO_EMPRESA`
--
ALTER TABLE `CADASTRO_EMPRESA`
  ADD UNIQUE KEY `CNPJ` (`CNPJ`),
  ADD UNIQUE KEY `email` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

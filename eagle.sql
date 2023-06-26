-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 26/06/2023 às 15:38
-- Versão do servidor: 8.0.30
-- Versão do PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `eagle`
--
 
            
DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspClienteAlterar` (IN `id_cliente` INT, IN `nome_cliente` VARCHAR(100), IN `cpf_cliente` CHAR(11), IN `data_nascimento` DATE, IN `sexo` BIT, IN `cliente_endereco` VARCHAR(100), IN `cliente_telefone` CHAR(11), IN `cliente_email` VARCHAR(50))   BEGIN
    UPDATE tb_cliente
    SET
        nome_cliente = nome_cliente,
        cpf_cliente = cpf_cliente,
        data_nascimento = data_nascimento,
        sexo = sexo,
        cliente_endereco = cliente_endereco,
        cliente_telefone = cliente_telefone,
        cliente_email = cliente_email
    WHERE
        id_cliente = id_cliente;
        
    SELECT id_cliente AS retorno;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `uspClienteConsultarporNome` (IN `nome_cliente` VARCHAR(100))   BEGIN
    SELECT
        id_cliente,
        nome_cliente,
        cpf_cliente,
        data_nascimento,
        sexo,
        cliente_endereco,
        cliente_telefone,
        cliente_email
    FROM
        tb_cliente
    WHERE
        nome_cliente LIKE CONCAT('%', nome_cliente, '%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `uspClienteInserir1` (IN `nome_cliente` VARCHAR(100), IN `cpf_cliente` CHAR(11), IN `data_nascimento` DATE, IN `sexo` BIT, IN `cliente_endereco` VARCHAR(100), IN `cliente_telefone` CHAR(11), IN `cliente_email` VARCHAR(50))   BEGIN
    INSERT INTO tb_cliente (
        nome_cliente,
        cpf_cliente,
        data_nascimento,
        sexo,
        cliente_endereco,
        cliente_telefone,
        cliente_email
    )
    VALUES (
        nome_cliente,
        cpf_cliente,
        data_nascimento,
        sexo,
        cliente_endereco,
        cliente_telefone,
        cliente_email
    );
    
    SELECT LAST_INSERT_ID() AS RETORNO;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `uspClinteConsultarporID` (IN `id_cliente` INT)   BEGIN
    SELECT
        id_cliente,
        nome_cliente,
        cpf_cliente,
        data_nascimento,
        sexo,
        cliente_endereco,
        cliente_telefone,
        cliente_email
    FROM
        tb_cliente
    WHERE
        id_cliente = id_cliente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `uspClinteExcluir` (IN `id_cliente` INT)   BEGIN
    DELETE FROM tb_cliente
    WHERE id_cliente = id_cliente;
    
    SELECT id_cliente AS RETORNO;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `uspProdutoAlterar` (IN `id_produto` INT, IN `nome_produto` VARCHAR(50), IN `quantidade_produto` INT, IN `valor_produto` DECIMAL(18,2))   BEGIN
    UPDATE tb_produto
    SET
        nome_produto = nome_produto,
        quantidade_produto = quantidade_produto,
        valor_produto = valor_produto
    WHERE
        id_produto = id_produto;
        
    SELECT id_produto AS Retorno;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `uspProdutoExcluir` (IN `id_produto` INT)   BEGIN
    DELETE FROM tb_produto
    WHERE id_produto = id_produto;
    
    SELECT id_produto AS Retorno;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `uspProdutoInserir` (IN `nome_produto` VARCHAR(50), IN `quantidade_produto` INT, IN `valor_produto` DECIMAL(18,2))   BEGIN
    INSERT INTO tb_produto (
        nome_produto,
        quantidade_produto,
        valor_produto
    )
    VALUES (
        nome_produto,
        quantidade_produto,
        valor_produto
    );
    
    SELECT LAST_INSERT_ID() AS Retorno;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_cliente`
--

CREATE TABLE `tb_cliente` (
  `id_cliente` int NOT NULL,
  `nome_cliente` varchar(100) NOT NULL,
  `cpf_cliente` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `data_nascimento` date NOT NULL,
  `sexo` bit(1) NOT NULL,
  `cliente_endereco` varchar(100) NOT NULL,
  `cliente_telefone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cliente_email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_produto`
--

CREATE TABLE `tb_produto` (
  `id_produto` int NOT NULL,
  `nome_produto` varchar(50) NOT NULL,
  `quantidade_produto` int NOT NULL,
  `valor_produto` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices de tabela `tb_produto`
--
ALTER TABLE `tb_produto`
  ADD PRIMARY KEY (`id_produto`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  MODIFY `id_cliente` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_produto`
--
ALTER TABLE `tb_produto`
  MODIFY `id_produto` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

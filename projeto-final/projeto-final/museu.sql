-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16/06/2025 às 17:29
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_museu`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `ingresso`
--

CREATE TABLE `ingresso` (
  `id_ingresso` int(11) NOT NULL,
  `id_sessao` int(11) NOT NULL,
  `tipo_ingresso` varchar(50) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `quant_ingresso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `ingresso`
--

INSERT INTO `ingresso` (`id_ingresso`, `id_sessao`, `tipo_ingresso`, `valor`, `quant_ingresso`) VALUES
(4, 3, 'Meia', 45.00, 3),
(5, 4, 'Meia', 15.00, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id_pagamento` int(11) NOT NULL,
  `id_visitante` int(11) NOT NULL,
  `id_ingresso` int(11) NOT NULL,
  `forma_pagamento` varchar(100) NOT NULL,
  `numero_carteirinha` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pagamento`
--

INSERT INTO `pagamento` (`id_pagamento`, `id_visitante`, `id_ingresso`, `forma_pagamento`, `numero_carteirinha`) VALUES
(4, 4, 4, 'Cartão Débito', 'JD59865'),
(5, 5, 5, 'Voucher', 'VCH98765');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sessao`
--

CREATE TABLE `sessao` (
  `id_sessao` int(11) NOT NULL,
  `tema` varchar(255) NOT NULL,
  `horario` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `sessao`
--

INSERT INTO `sessao` (`id_sessao`, `tema`, `horario`) VALUES
(3, 'Ciência e Tecnologia', '2025-06-03 00:00:00'),
(4, 'Antropologia', '2025-06-04 00:00:00'),
(5, 'Arqueologia', '2025-06-05 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `visitante`
--

CREATE TABLE `visitante` (
  `id_visitante` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `data_nasc` date NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `visitante`
--

INSERT INTO `visitante` (`id_visitante`, `nome`, `data_nasc`, `cpf`, `telefone`, `email`) VALUES
(3, 'Pedro Santos', '2000-01-20', '99988877766', '11923456789', 'pedro.santos@email.com'),
(4, 'Carla Gomes', '1975-07-07', '45678901234', '11934567890', 'carla.gomes@email.com'),
(5, 'Felipe Costa', '1992-11-25', '56789012345', '11945678901', 'felipe.costa@email.com');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `ingresso`
--
ALTER TABLE `ingresso`
  ADD PRIMARY KEY (`id_ingresso`),
  ADD KEY `id_sessao` (`id_sessao`);

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD KEY `id_visitante` (`id_visitante`),
  ADD KEY `id_ingresso` (`id_ingresso`);

--
-- Índices de tabela `sessao`
--
ALTER TABLE `sessao`
  ADD PRIMARY KEY (`id_sessao`);

--
-- Índices de tabela `visitante`
--
ALTER TABLE `visitante`
  ADD PRIMARY KEY (`id_visitante`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `ingresso`
--
ALTER TABLE `ingresso`
  MODIFY `id_ingresso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id_pagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `sessao`
--
ALTER TABLE `sessao`
  MODIFY `id_sessao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `visitante`
--
ALTER TABLE `visitante`
  MODIFY `id_visitante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `ingresso`
--
ALTER TABLE `ingresso`
  ADD CONSTRAINT `ingresso_ibfk_1` FOREIGN KEY (`id_sessao`) REFERENCES `sessao` (`id_sessao`);

--
-- Restrições para tabelas `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`id_visitante`) REFERENCES `visitante` (`id_visitante`),
  ADD CONSTRAINT `pagamento_ibfk_2` FOREIGN KEY (`id_ingresso`) REFERENCES `ingresso` (`id_ingresso`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

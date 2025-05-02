# 🎟️ Sistema de Venda de Ingressos para Museu

Este projeto implementa o banco de dados para um sistema de venda de ingressos de museu, permitindo o controle de sessões, visitantes, compras e pagamentos. Ele ainda está sendo desenvolvido com base em requisitos funcionais para garantir uma experiência fluida tanto para usuários visitantes quanto para a administração do sistema.

## 📂 Estrutura do Projeto

O projeto contém o script SQL para criação das tabelas principais:

- **visitante**: Armazena dados dos usuários.
- **ingresso**: Tipos e valores dos ingressos.
- **sessao**: Horários e capacidade das sessões disponíveis.
- **compra**: Registro das compras realizadas pelos visitantes.
- **pagamento**: Informações e comprovantes de pagamento.

## 📋 Requisitos do Projeto
Este sistema tem como objetivo controlar a venda de ingressos de um museu, permitindo o registro de visitantes, controle de sessões, compras de ingressos e validação de pagamentos. Abaixo estão os requisitos funcionais divididos por módulo.

### 🧾 Requisitos de Ingresso

- Permite seleção do tipo de ingresso: **inteira** ou **meia-entrada**.
- Usuário informa **data e hora da visita**.
- Seleção da **quantidade de ingressos** em uma compra.
- Registro do **valor unitário** e **valor total** da compra.
- Informação da **sessão**: data, horário de início e término.

### 👤 Requisitos de Login do Visitante

- Registro das informações básicas do visitante:
  - Nome
  - CPF
  - E-mail
  - Telefone
- Validação de documentos para meia-entrada:
  - Número de matrícula
  - Comprovantes de estudante (a ser integrado posteriormente)

### 💳 Requisitos de Pagamento

- Suporte a múltiplas formas de pagamento:
  - Cartão de crédito
  - Cartão de débito
  - PIX
  - Dinheiro
  - Boleto
- Registro e validação do comprovante de pagamento.

## 🗃️ Script de Criação das Tabelas (MySQL)

```sql
CREATE TABLE visitante ( 
  id_visitante INT PRIMARY KEY AUTO_INCREMENT,  
  nome VARCHAR(255) NOT NULL,  
  cpf VARCHAR(20) NOT NULL,  
  email VARCHAR(255) NOT NULL,  
  telefone VARCHAR(20) NOT NULL
); 

CREATE TABLE ingresso ( 
  id_ingresso INT PRIMARY KEY AUTO_INCREMENT,  
  tipo_ingresso VARCHAR(255) NOT NULL,  
  valor_unitario FLOAT NOT NULL,  
  quantidade INT NOT NULL
); 

CREATE TABLE sessao ( 
  id_sessao INT PRIMARY KEY AUTO_INCREMENT,  
  horario DATETIME NOT NULL,  
  capacidade INT NOT NULL
); 

CREATE TABLE compra ( 
  id_compra INT PRIMARY KEY AUTO_INCREMENT,  
  id_ingresso INT,  
  id_visitante INT,  
  id_sessao INT,  
  horario DATETIME NOT NULL,  
  valor_ingresso FLOAT NOT NULL,
  FOREIGN KEY (id_ingresso) REFERENCES ingresso(id_ingresso),
  FOREIGN KEY (id_visitante) REFERENCES visitante(id_visitante),
  FOREIGN KEY (id_sessao) REFERENCES sessao(id_sessao)
); 

CREATE TABLE pagamento ( 
  id_pagamento INT PRIMARY KEY AUTO_INCREMENT,  
  id_compra INT,  
  forma_pagamento VARCHAR(255) NOT NULL,  
  comprovante VARCHAR(255) NOT NULL,  
  data_pagamento DATE NOT NULL,
  FOREIGN KEY (id_compra) REFERENCES compra(id_compra)
); 

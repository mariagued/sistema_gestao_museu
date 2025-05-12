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

### 🧾 Requisitos do Projeto

Requisitos do projeto
● Permite inserção dos dados pessoais no campo login;
● Permite a seleção do tipo de ingresso (inteira e meia-entrada);
● Informar a data e hora da visita ao museu;
● Usuário seleciona a quantidade de ingressos vendidos em uma compra;
● Sistema informa o valor de cada ingresso;
● Valor total da compra dos ingressos;
● Sistema solicita o número da carteirinha para validar a compra caso o usuário utilize a meia-entrada;
● Forma de pagamento (cartão de crédito, cartão débito, PIX, dinheiro, boleto…);
● Informar se o comprovante de pagamento foi validado.

### 💳 Requisitos de Pagamento
- Suporte a múltiplas formas de pagamento:
  - Cartão de crédito
  - Cartão de débito
  - PIX
  - Dinheiro
  - Boleto


## Prototipação das Telas (em andamento)

## Modelagem Lógica
![Logic model](https://github.com/user-attachments/assets/1478ae94-cb53-4293-a04c-7f3044debf68)

## 🗃️ Script de Criação das Tabelas (MySQL)

```sql
CREATE TABLE visitante (
    id_visitante INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data_nasc DATE NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE ingresso (
    id_ingresso INT AUTO_INCREMENT PRIMARY KEY,
    id_sessao INT NOT NULL,
    tipo_ingresso VARCHAR(50) NOT NULL, -- 'meia' ou 'inteira'
    valor DECIMAL(10,2) NOT NULL,
    quant_ingresso INT NOT NULL,
    FOREIGN KEY (id_sessao) REFERENCES sessao(id_sessao)
);

CREATE TABLE sessao (
    id_sessao INT AUTO_INCREMENT PRIMARY KEY,
    tema VARCHAR(255) NOT NULL,
    horario DATETIME NOT NULL
);
 
CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_visitante INT NOT NULL,
    id_ingresso INT NOT NULL,
    forma_pagamento VARCHAR(100) NOT NULL,
    numero_carteirinha VARCHAR(20),
    FOREIGN KEY (id_visitante) REFERENCES visitante(id_visitante),
    FOREIGN KEY (id_ingresso) REFERENCES ingresso(id_ingresso)
);


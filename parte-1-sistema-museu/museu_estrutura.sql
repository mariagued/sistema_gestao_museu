-- TABELA: visitante (Login)
CREATE TABLE visitante (
    id_visitante INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data_nasc DATE NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- TABELA: sessao
CREATE TABLE sessao (
    id_sessao INT AUTO_INCREMENT PRIMARY KEY,
    tema VARCHAR(255) NOT NULL,
    horario DATETIME NOT NULL
);

-- TABELA: ingresso
CREATE TABLE ingresso (
    id_ingresso INT AUTO_INCREMENT PRIMARY KEY,
    id_sessao INT NOT NULL,
    tipo_ingresso VARCHAR(50) NOT NULL, -- 'meia' ou 'inteira'
    valor DECIMAL(10,2) NOT NULL,
    quant_ingresso INT NOT NULL,
    FOREIGN KEY (id_sessao) REFERENCES sessao(id_sessao)
);

-- TABELA: pagamento
CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_visitante INT NOT NULL,
    id_ingresso INT NOT NULL,
    forma_pagamento VARCHAR(100) NOT NULL,
    numero_carteirinha VARCHAR(20),
    FOREIGN KEY (id_visitante) REFERENCES visitante(id_visitante),
    FOREIGN KEY (id_ingresso) REFERENCES ingresso(id_ingresso)
);

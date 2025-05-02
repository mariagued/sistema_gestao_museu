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

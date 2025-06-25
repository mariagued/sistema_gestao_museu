# 🎟️ Sistema de Venda de Ingressos para Museu

Este projeto implementa o banco de dados para um sistema de venda de ingressos de museu, permitindo o controle de sessões, visitantes, compras e pagamentos. Ele ainda está sendo desenvolvido com base em requisitos funcionais para garantir uma experiência fluida tanto para usuários visitantes quanto para a administração do sistema.

## 📂 Estrutura do Projeto

Parte 1:
- Definição do tema
- Requisitos funcionais do projeto
- Modelo lógico contendo todas as relações entre tabelas

Parte 2:
- Um relatório organizado com todas as funcionalidades implementadas e os respectivos códigos. (Adiciona o tópico de enunciado e um print do código logo na sequência)
- Deve obrigatoriamente ocorrer a apresentação do projeto para defesa de código para validar o projeto.
  
**ITENS OBRIGATÓRIOS PARA A PARTE 2**
1. Utilize banco de dados relacional (Postgres ou MySQL).
2. Defina a forma de conexão e acesso aos dados:<br>
  a. No mínimo deve existir 3 tabelas relacionadas
3. Implemente os métodos para inserir, editar, buscar e excluir, sendo:<br>
  a. Em cada tabela, insira 5 amostras de dados<br>
  b. Editar 3 opções diferentes de dados (independente da tabela)<br>
  c. Em cada tabela, apresente busque todos os campos<br>
  d. Exclua 2 amostras de dados em cada tabela<br>
4. Permita o uso de pelo menos 2 buscas utilizando diferentes JOINS (INNER, LEFT, RIGHT ou FULL)
5. Faça pelo menos 2 buscas de dados em cada tabela utilizando diferentes funções de agregação (MAX, MIN, GROUP BY, HAVING, SUM, AVG) ou operadores de comparação (>, <, =, entre outros)
6. Implemente 1 subquery.


## 📋 Requisitos do Projeto
Este sistema tem como objetivo controlar a venda de ingressos de um museu, permitindo o registro de visitantes, controle de sessões, compras de ingressos e validação de pagamentos. Abaixo estão os requisitos funcionais divididos por módulo.

- Permite inserção dos dados pessoais no campo login;
- Permite inserção dos dados pessoais no campo login;
- Permite a seleção do tipo de ingresso (inteira e meia-entrada);
- Informar a data e hora da visita ao museu;
- Usuário seleciona a quantidade de ingressos vendidos em uma compra;
- Sistema informa o valor de cada ingresso;
- Valor total da compra dos ingressos;
- Sistema solicita o número da carteirinha para validar a compra caso o usuário utilize a meia-entrada;
- Forma de pagamento (cartão de crédito, cartão débito, PIX, dinheiro, boleto…);
- Informar se o comprovante de pagamento foi validado.

### 💳 Requisitos de Pagamento
- Suporte a múltiplas formas de pagamento:
  - Cartão de crédito
  - Cartão de débito
  - PIX
  - Dinheiro
  - Boleto


## Modelagem Lógica
![Logic model](https://github.com/user-attachments/assets/1478ae94-cb53-4293-a04c-7f3044debf68)

-- 1. Obter todas as colunas das tabelas Clientes, Pedidos e Fornecedores

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;
SELECT * FROM SUPPLIERS;

-- 2. Obter todos os Clientes em ordem alfabética por país e nome

SELECT * FROM CUSTOMERS ORDER BY COUNTRY, CONTACT_NAME;

-- 3. Obter os 5 pedidos mais antigos

SELECT * FROM ORDERS ORDER BY ORDER_DATE ASC LIMIT 5;

-- 4. Obter a contagem de todos os Pedidos feitos durante 1997

SELECT COUNT(*) FROM ORDERS WHERE EXTRACT(YEAR FROM ORDER_DATE) = 1997; 

-- 5. Obter os nomes de todas as pessoas de contato onde a pessoa é um gerente, em ordem alfabética
SELECT CONTACT_NAME FROM CUSTOMERS WHERE CONTACT_TITLE LIKE '%Manager%' ORDER BY CONTACT_NAME;
-- 6. Obter todos os pedidos feitos em 19 de maio de 1997
SELECT * FROM ORDERS WHERE ORDER_DATE = '1997-05-19';
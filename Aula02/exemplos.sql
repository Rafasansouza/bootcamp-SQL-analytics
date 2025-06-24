-- Exibe todos os registros da tabela Customers
SELECT * FROM customers;

-- Exibe o nome de contato e a cidade dos clientes
SELECT contact_name, city FROM customers;

-- Lista todos os países dos clientes
SELECT country FROM customers;
-- Lista os países sem repetição
SELECT DISTINCT country FROM customers;
-- Conta quantos países únicos existem
SELECT COUNT(DISTINCT country) FROM customers;

-- Ordena clientes pelo país
SELECT * FROM customers ORDER BY country;
-- Ordena por país em ordem descendente
SELECT * FROM customers ORDER BY country DESC;
-- Ordena por país e nome do contato
SELECT * FROM customers ORDER BY country, contact_name;
-- Ordena por país em ordem ascendente e nome em ordem descendente
SELECT * FROM customers ORDER BY country ASC, contact_name DESC;

-- Clientes com nome de contato começando por "a"
SELECT * FROM customers WHERE contact_name LIKE 'a%';
-- Clientes com nome de contato não começando por "a"
SELECT * FROM customers WHERE contact_name NOT LIKE 'a%';
-- Clientes de países específicos
SELECT * FROM customers WHERE country IN ('Germany', 'France', 'UK');
-- Clientes não localizados em 'Germany', 'France', 'UK'
SELECT * FROM customers WHERE country NOT IN ('Germany', 'France', 'UK');

--OPERADORES
-- Seleciona todos os produtos com preço menor que 20
SELECT * FROM products
WHERE unit_price < 20;

-- Seleciona todos os produtos com preço maior que 100
SELECT * FROM products
WHERE unit_price > 100;

-- Seleciona todos os produtos com preço menor ou igual a 50
SELECT * FROM products
WHERE unit_price <= 50;

-- Seleciona todos os produtos com quantidade em estoque maior ou igual a 10
SELECT * FROM products
WHERE units_in_stock >= 10;

-- Seleciona todos os produtos cujo preço não é 30
SELECT * FROM products
WHERE unit_price <> 30;

--COMBINAÇÃO DE OPERADORES
-- Seleciona todos os produtos com preço entre 50 e 100 (exclusive)
SELECT * FROM products
WHERE unit_price >= 50 AND unit_price < 100;

-- Seleciona todos os produtos com preço fora do intervalo 20 a 40
SELECT * FROM products
WHERE unit_price < 20 OR unit_price > 40;

-- Is null and is not null: Usado em conjunto com o where para criar regras mais complexas de filtro nos registros.
SELECT * FROM customers
WHERE contact_name is Null;

SELECT * FROM customers
WHERE contact_name is not null;

--LIKE
-- Nome do cliente começando com "a":
SELECT * FROM customers
WHERE contact_name LIKE 'a%';

SELECT * FROM customers
WHERE LOWER(contact_name) LIKE 'a%';

SELECT * FROM customers
WHERE UPPER(contact_name) LIKE 'A%';

-- Nome do cliente terminando com "a":
SELECT * FROM customers
WHERE contact_name LIKE '%a';

-- Nome do cliente que possui "or" em qualquer posição:
SELECT * FROM customers
WHERE contact_name LIKE '%or%';

-- Nome do cliente com "r" na segunda posição:
SELECT * FROM customers
WHERE contact_name LIKE '_r%';

-- Nome do cliente que começa com "A" e tem pelo menos 3 caracteres de comprimento:
SELECT * FROM customers
WHERE contact_name LIKE 'A_%_%';

-- Nome do contato que começa com "A" e termina com "o":
SELECT * FROM customers
WHERE contact_name LIKE 'A%o';

-- Nome do cliente que NÃO começa com "a":
SELECT * FROM customers
WHERE contact_name NOT LIKE 'A%';

-- Usando o curinga [charlist] (SQL server)
SELECT * FROM customers
WHERE city LIKE '[BSP]%';

-- Usando o curinga Similar To (Postgres)
SELECT * FROM customers
WHERE city SIMILAR TO '(B|S|P)%';

-- Usando o MySQL (coitado, tem nada)
SELECT * FROM customers
WHERE (city LIKE 'B%' OR city LIKE 'S%' OR city LIKE 'P%');


--OPERADOR IN
-- localizado na "Alemanha", "França" ou "Reino Unido":
SELECT * FROM customers
WHERE country IN ('Germany', 'France', 'UK');

-- NÃO localizado na "Alemanha", "França" ou "Reino Unido":
SELECT * FROM customers
WHERE country NOT IN ('Germany', 'France', 'UK');

-- Só para dar um gostinho de uma subqueyr... Seleciona todos os clientes que são dos mesmos países que os fornecedores:

SELECT * FROM customers
WHERE country IN (SELECT country FROM suppliers);

-- Exemplo com BETWEEN
SELECT * FROM products
WHERE unit_price BETWEEN 10 AND 20;

-- Exemplo com NOT BETWEEN
SELECT * FROM products
WHERE unit_price NOT BETWEEN 10 AND 20;

-- Seleciona todos os produtos com preço ENTRE 10 e 20. Adicionalmente, não mostra produtos com CategoryID de 1, 2 ou 3:
SELECT * FROM products
WHERE (unit_price BETWEEN 10 AND 20) AND category_id NOT IN (1, 2, 3);

--FUNÇÕES AGREGADAS
-- Exemplo de MIN()
SELECT MIN(unit_price) AS preco_minimo
FROM products;

-- Exemplo de MAX()
SELECT MAX(unit_price) AS preco_maximo
FROM products;

-- Exemplo de COUNT()
SELECT COUNT(*) AS total_de_produtos
FROM products;

-- Exemplo de AVG()
SELECT AVG(unit_price) AS preco_medio
FROM products;

-- Exemplo de SUM()
SELECT SUM(quantity) AS quantidade_total_de_order_details
FROM order_details;


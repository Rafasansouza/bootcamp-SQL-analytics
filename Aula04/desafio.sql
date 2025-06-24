-- Faça a classificação dos produtos mais venvidos usando usando RANK(), DENSE_RANK() e ROW_NUMBER()
-- Essa questão tem 2 implementações, veja uma que utiliza subquery e uma que não utiliza.
-- Tabelas utilizadas FROM order_details o JOIN products p ON p.product_id = o.product_id;

SELECT
	PRODUCT_NAME,
	ROUND(SUM(O.UNIT_PRICE * O.QUANTITY)::NUMERIC, 2) AS TOTAL_SALE,
	ROW_NUMBER() OVER (ORDER BY SUM(O.UNIT_PRICE * O.QUANTITY) DESC) AS ORDER_RN,
	RANK() OVER(ORDER BY SUM(o.unit_price * o.quantity) DESC) AS ORDER_RANK,
	DENSE_RANK() OVER (ORDER BY SUM(o.unit_price * o.quantity) DESC) AS ORDER_DENSE
FROM
	ORDER_DETAILS O
	JOIN PRODUCTS P ON P.PRODUCT_ID = O.PRODUCT_ID
GROUP BY
	P.PRODUCT_NAME;

SELECT
	SALES.PRODUCT_NAME,
	TOTAL_SALE,
	ROW_NUMBER() OVER (ORDER BY TOTAL_SALE DESC) AS ORDER_RN,
	RANK() OVER (ORDER BY TOTAL_SALE DESC) AS ORDER_RANK,
	DENSE_RANK() OVER (ORDER BY TOTAL_SALE DESC) AS ORDER_DENSE
FROM
	(SELECT
		P.PRODUCT_NAME,
		SUM(O.UNIT_PRICE * O.QUANTITY) AS TOTAL_SALE
	FROM
		ORDER_DETAILS O
		JOIN PRODUCTS P ON P.PRODUCT_ID = O.PRODUCT_ID
	GROUP BY
		P.PRODUCT_NAME) AS SALES
ORDER BY
	SALES.TOTAL_SALE DESC;

-- Listar funcionários dividindo-os em 3 grupos usando NTILE
-- FROM employees;

SELECT
	FIRST_NAME,
	LAST_NAME,
	TITLE,
	NTILE(3) OVER (ORDER BY FIRST_NAME) AS GROUP_NUMBER 
FROM
	EMPLOYEES;

-- Ordenando os custos de envio pagos pelos clientes de acordo 
-- com suas datas de pedido, mostrando o custo anterior e o custo posterior usando LAG e LEAD:
-- FROM orders JOIN shippers ON shippers.shipper_id = orders.ship_via;

SELECT
	CUSTOMER_ID,
	TO_CHAR(ORDER_DATE, 'YYYY-MM-DD') AS ORDER_DATE,
	SHIPPERS.COMPANY_NAME AS SHIPPER_NAME,
	LAG(FREIGHT) OVER (PARTITION BY CUSTOMER_ID ORDER BY ORDER_DATE DESC) AS PREVIOUS_ORDER_FREIGHT,
	FREIGHT AS ORDER_FREIGHT,
	LEAD(FREIGHT) OVER (PARTITION BY CUSTOMER_ID ORDER BY ORDER_DATE DESC) AS NEXT_ORDER_FREIGHT
FROM
	ORDERS
JOIN 
	SHIPPERS 
	ON SHIPPERS.SHIPPER_ID = ORDERS.SHIP_VIA;

-- Desafio extra: questão intrevista Google
-- https://medium.com/@aggarwalakshima/interview-question-asked-by-google-and-difference-among-row-number-rank-and-dense-rank-4ca08f888486#:~:text=ROW_NUMBER()%20always%20provides%20unique,a%20continuous%20sequence%20of%20ranks.
-- https://platform.stratascratch.com/coding/10351-activity-rank?code_type=3
-- https://www.youtube.com/watch?v=db-qdlp8u3o
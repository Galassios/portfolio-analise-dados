-- -----------------------------------------------------
-- 1) Faturamento mensal
-- Objetivo: analisar a evolução das vendas ao longo do tempo
-- -----------------------------------------------------

SELECT
    DATE_FORMAT(data, '%Y-%m') AS mes,
    SUM(quantidade * preco_unitario) AS faturamento
FROM dados_vendas
GROUP BY mes
ORDER BY mes;



-- -----------------------------------------------------
-- 2) Crescimento mês a mês
-- Objetivo: comparar o faturamento atual com o mês anterior
-- -----------------------------------------------------

WITH vendas_mes AS (
    SELECT
        DATE_FORMAT(data, '%Y-%m') AS mes,
        SUM(quantidade * preco_unitario) AS faturamento
    FROM dados_vendas
    GROUP BY mes
)

SELECT
    mes,
    faturamento,
    LAG(faturamento) OVER (ORDER BY mes) AS mes_anterior,
    faturamento - LAG(faturamento) OVER (ORDER BY mes) AS crescimento,
	CASE 
		WHEN faturamento > LAG(faturamento) OVER (ORDER BY mes)
			THEN 'CRESCIMENTO'
		WHEN faturamento < LAG(faturamento) OVER (ORDER BY mes)
			THEN 'QUEDA'
		ELSE 'ESTÁVEL'
	END AS situacao
FROM vendas_mes
ORDER BY mes;



-- -----------------------------------------------------
-- 3) Ranking de produtos por faturamento
-- Objetivo: identificar os produtos mais rentáveis
-- -----------------------------------------------------

SELECT
    produto,
    SUM(quantidade * preco_unitario) AS faturamento,
    RANK() OVER (
        ORDER BY SUM(quantidade * preco_unitario) DESC
    ) AS ranking
FROM dados_vendas
GROUP BY produto;



-- -----------------------------------------------------
-- 4) Percentual de faturamento por produto
-- Objetivo: entender a representatividade de cada produto
-- -----------------------------------------------------

SELECT
    produto,
    SUM(quantidade * preco_unitario) AS faturamento,
    ROUND(
        SUM(quantidade * preco_unitario) * 100.0 /
        SUM(SUM(quantidade * preco_unitario)) OVER(),
        2
    ) AS percentual
FROM dados_vendas
GROUP BY produto
ORDER BY percentual DESC;



-- -----------------------------------------------------
-- 5) Ranking de vendedores
-- Objetivo: identificar os vendedores com maior faturamento
-- -----------------------------------------------------

SELECT
    vendedor,
    SUM(quantidade * preco_unitario) AS faturamento,
    RANK() OVER (
        ORDER BY SUM(quantidade * preco_unitario) DESC
    ) AS ranking
FROM dados_vendas
GROUP BY vendedor;



-- -----------------------------------------------------
-- 6) Faturamento acumulado
-- Objetivo: visualizar o crescimento total da empresa
-- -----------------------------------------------------

WITH vendas_mes AS (
    SELECT
        DATE_FORMAT(data, '%Y-%m') AS mes,
        SUM(quantidade * preco_unitario) AS faturamento
    FROM dados_vendas
    GROUP BY mes
)

SELECT
    mes,
    faturamento,
    
    SUM(faturamento) OVER (ORDER BY mes) AS acumulado

FROM vendas_mes
ORDER BY mes;

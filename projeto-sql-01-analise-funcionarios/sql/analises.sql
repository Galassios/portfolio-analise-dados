-- =====================================================
-- PROJETO SQL 01 - ANÁLISE DE FUNCIONÁRIOS
-- Empresa fictícia: TechCorp
-- Autor: Leonardo Caiado Dourado
-- =====================================================


-- -----------------------------------------------------
-- 1) Média salarial por área
-- Objetivo: descobrir quais áreas da empresa pagam mais
-- -----------------------------------------------------

SELECT 
    area,
    ROUND(AVG(salario),2) AS media_salarial
FROM funcionarios
GROUP BY area
ORDER BY media_salarial DESC;



-- -----------------------------------------------------
-- 2) Ranking salarial dentro de cada área
-- Objetivo: identificar os funcionários mais bem pagos
-- -----------------------------------------------------

SELECT
    nome,
    area,
    salario,
    RANK() OVER(PARTITION BY area ORDER BY salario DESC) AS ranking_area
FROM funcionarios;



-- -----------------------------------------------------
-- 3) Top 2 salários por área
-- Objetivo: encontrar os maiores salários de cada departamento
-- -----------------------------------------------------

WITH ranking AS (
SELECT
    nome,
    area,
    salario,
    RANK() OVER(PARTITION BY area ORDER BY salario DESC) AS ranking_area
FROM funcionarios
)

SELECT *
FROM ranking
WHERE ranking_area <= 2;



-- -------------------------------------------------------
-- Análise 4 — Funcionários acima da média da própria área
-- Insight: Quem está ganhando acima da média do time.
-- -------------------------------------------------------

SELECT
    nome,
    area,
    salario
FROM funcionarios f
WHERE salario > (
    SELECT AVG(salario)
    FROM funcionarios
    WHERE area = f.area
);



-- -------------------------------------------------------
-- Análise 5 — Percentual de funcionários por área
-- -------------------------------------------------------

SELECT
    area,
    COUNT(*) AS total_funcionarios,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(),
        2
    ) AS percentual_empresa
FROM funcionarios
GROUP BY area;



-- ---------------------------------------------------
-- Análise 6 — Contratações por ano
-- ---------------------------------------------------

SELECT
    EXTRACT(YEAR FROM data_contratacao) AS ano,
    COUNT(*) AS contratacoes
FROM funcionarios
GROUP BY ano
ORDER BY ano;



-- -------------------------------------------------------
Análise 7 — Acumulado de contratações
-- -------------------------------------------------------
  
SELECT
    ano,
    contratacoes,
    SUM(contratacoes) OVER(ORDER BY ano) AS acumulado
FROM (
    SELECT
        EXTRACT(YEAR FROM data_contratacao) AS ano,
        COUNT(*) AS contratacoes
    FROM funcionarios
    GROUP BY ano
) t;

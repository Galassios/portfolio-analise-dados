WITH base AS (
    SELECT 
        DATE_FORMAT(data, '%Y-%m') AS mes,
        SUM(valor) AS faturamento
    FROM pedidos
    GROUP BY mes
)

SELECT 
    mes,
    faturamento,
    LAG(faturamento) OVER (ORDER BY mes) AS faturamento_mes_anterior,
    ROUND(
        (faturamento - LAG(faturamento) OVER (ORDER BY mes)) 
        / LAG(faturamento) OVER (ORDER BY mes) * 100, 
    2) AS crescimento_percentual
FROM base;

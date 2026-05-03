SET @data_referencia = '2026-06-01';

WITH base AS (
    SELECT 
        cliente_id,
        DATEDIFF(@data_referencia, MAX(data)) as dias_sem_comprar
    FROM pedidos
    GROUP BY cliente_id
)

SELECT
    CASE
        WHEN dias_sem_comprar BETWEEN 0 AND 7 THEN '0-7'
        WHEN dias_sem_comprar BETWEEN 8 AND 15 THEN '8-15'
        WHEN dias_sem_comprar BETWEEN 16 AND 30 THEN '16-30'
        ELSE '30+'
    END AS faixa_dias,
    COUNT(cliente_id) as quantidade_clientes
FROM base
GROUP BY faixa_dias
ORDER BY 
    CASE 
        WHEN faixa_dias = '0-7' THEN 1
        WHEN faixa_dias = '8-15' THEN 2
        WHEN faixa_dias = '16-30' THEN 3
        ELSE 4
    END;

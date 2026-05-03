SET @data_referencia = '2026-06-01';

SELECT 
    cliente_id,
    MAX(data) AS data_ultima_compra,
    DATEDIFF(@data_referencia, MAX(data)) as dias_sem_comprar,
    CASE
        WHEN DATEDIFF(@data_referencia, MAX(data)) < 30 THEN 'ativo'
        ELSE 'churn'
    END as status
FROM pedidos
WHERE data <= @data_referencia
GROUP BY cliente_id;

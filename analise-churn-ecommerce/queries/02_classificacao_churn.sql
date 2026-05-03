SELECT 
    cliente_id,
    MAX(data) AS data_ultima_compra,
    DATEDIFF('2026-06-01', MAX(data)) as dias_sem_comprar,
    CASE
        WHEN DATEDIFF('2026-06-01', MAX(data)) < 30 THEN 'ativo'
        ELSE 'churn'
    END as status
FROM pedidos
GROUP BY cliente_id;

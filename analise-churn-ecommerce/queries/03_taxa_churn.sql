SET @data_referencia = '2026-06-01';
WITH base AS (
    SELECT 
        cliente_id,
        MAX(data) AS data_ultima_compra,
        DATEDIFF(@data_referencia, MAX(data)) as dias_sem_comprar,
        CASE
            WHEN DATEDIFF(@data_referencia, MAX(data)) < 30 THEN 'ativo'
            ELSE 'churn'
        END as status
    FROM pedidos
    GROUP BY cliente_id
)

SELECT
    COUNT(DISTINCT cliente_id) as total_clientes,
    SUM(CASE WHEN status = 'churn' THEN 1 ELSE 0 END) as clientes_churn,
    ROUND(
        SUM(CASE WHEN status = 'churn' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(DISTINCT cliente_id), 
    2) as taxa_churn_percentual
FROM base;

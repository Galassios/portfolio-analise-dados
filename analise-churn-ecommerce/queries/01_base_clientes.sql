SELECT 
    cliente_id,
    MAX(data) AS data_ultima_compra
FROM pedidos
GROUP BY cliente_id;

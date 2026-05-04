SELECT 
    DATE_FORMAT(data, '%Y-%m') AS mes,
    canal,
    SUM(valor) AS faturamento,
    COUNT(id_pedido) AS volume
FROM pedidos
GROUP BY mes, canal
ORDER BY mes, canal;

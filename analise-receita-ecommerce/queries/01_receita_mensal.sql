SELECT 
    DATE_FORMAT(data, '%Y-%m') AS mes,
    SUM(valor) AS faturamento,
    COUNT(id_pedido) AS volume,
    ROUND(SUM(valor) / COUNT(id_pedido), 2) AS ticket_medio
FROM pedidos
GROUP BY mes
ORDER BY mes;

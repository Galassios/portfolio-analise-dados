SELECT 
    canal,
    SUM(valor) AS faturamento,
    COUNT(id_pedido) AS volume,
    ROUND(SUM(valor) / COUNT(id_pedido), 2) AS ticket_medio
FROM pedidos
GROUP BY canal
ORDER BY faturamento DESC;

SELECT 
    a.nome_area,
    ROUND(AVG(p.salario), 2) AS media_salarial,
    COUNT(p.nome) AS quant_pessoas
FROM pessoas p
LEFT JOIN areas a
    ON p.area_id = a.id_area
GROUP BY a.nome_area
HAVING AVG(p.salario) > 8000
ORDER BY media_salarial;

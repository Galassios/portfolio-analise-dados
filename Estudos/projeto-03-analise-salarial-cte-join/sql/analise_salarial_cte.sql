WITH media_geral AS (
    SELECT AVG(salario) AS media_salario
    FROM pessoas
),
acima_media AS (
    SELECT 
        p.nome,
        a.nome_area,
        p.salario
    FROM pessoas p
    INNER JOIN areas a
        ON p.area_id = a.id_area
    WHERE p.salario > (SELECT media_salario FROM media_geral)
)
SELECT
    nome_area,
    ROUND(AVG(salario), 2) AS media_salario_acima,
    COUNT(nome) AS total_pessoas_acima
FROM acima_media
GROUP BY nome_area
ORDER BY media_salario_acima DESC;

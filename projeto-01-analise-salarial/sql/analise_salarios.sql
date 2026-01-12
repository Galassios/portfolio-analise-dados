sql
WITH tabela_limpa AS (
    SELECT DISTINCT *
    FROM dados_pessoas
)
SELECT
    area,
    ROUND(AVG(salario), 2) AS media,
    COUNT(nome) AS quant
FROM tabela_limpa
GROUP BY area
ORDER BY media DESC, quant DESC;

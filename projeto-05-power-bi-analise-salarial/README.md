📊 Projeto 05 — Análise Salarial por Área (Power BI)
📌 Objetivo

Analisar o salário médio dos colaboradores por área, comparando cada área com a média geral da empresa, a fim de identificar diferenças salariais e possíveis desequilíbrios internos.

🗂️ Base de dados

O projeto utiliza duas tabelas relacionadas:

pessoas

nome

salario

area_id

areas

id_area

nome_area

Relacionamento:

pessoas[area_id] → areas[id_area] (muitos para um)

🛠️ Ferramentas utilizadas

Power BI

DAX (medidas)

Modelagem de dados

Visualizações analíticas

📐 Medidas criadas (DAX)
Salário médio por área
Salário Médio Área = 
AVERAGE(pessoas[salario])

Média geral da empresa
Média Geral Salário = 
AVERAGE(pessoas[salario])

Total de pessoas
Total Pessoas = 
COUNT(pessoas[nome])

📊 Visualizações

Gráfico de colunas agrupadas:

Eixo X: Área

Valores: Salário Médio por Área

Linha constante representando a média geral do salário

Caixa de texto com insights analíticos

🔎 Principais insights

As áreas de Marketing e TI apresentam salário médio acima da média geral da empresa.

A área de Marketing se destaca mesmo com um número menor de colaboradores.

A área de RH concentra mais pessoas, porém com salário médio inferior à média geral.

🎯 Conclusão

O dashboard permite uma visão clara das diferenças salariais entre áreas, apoiando decisões estratégicas relacionadas à remuneração, valorização de equipes e alocação de recursos.

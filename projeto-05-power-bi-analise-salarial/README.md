📊 Projeto 05 — Análise Salarial por Área (Power BI)
📌 Objetivo

Analisar os salários dos colaboradores por área, comparando o salário médio de cada área com a média geral da empresa, com o objetivo de identificar diferenças salariais e gerar insights para apoio à tomada de decisão.

🗂️ Estrutura dos dados

O projeto utiliza duas tabelas relacionais:

📄 pessoas

nome — Nome do colaborador

salario — Salário do colaborador

area_id — Identificador da área

📄 areas

id_area — Identificador da área

nome_area — Nome da área

🔗 Relacionamento

pessoas[area_id] → areas[id_area]

Cardinalidade: Muitos para um

🛠️ Ferramentas utilizadas

Power BI Desktop

DAX (Data Analysis Expressions)

Modelagem de dados

Visualização e storytelling de dados

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

📊 Visualizações desenvolvidas

Gráfico de colunas com:

Eixo X: Área

Valores: Salário médio por área

Linha constante representando a média geral do salário

Ajuste do eixo Y para melhor visualização das diferenças

Caixa de texto com insights analíticos

🔎 Principais insights

As áreas de Marketing e TI apresentam salário médio acima da média geral da empresa.

A área de Marketing se destaca mesmo possuindo um número menor de colaboradores.

A área de RH concentra o maior número de pessoas, porém com salário médio inferior à média geral.

🎯 Conclusão

O dashboard fornece uma visão clara das diferenças salariais entre áreas, permitindo identificar possíveis desequilíbrios internos e apoiar decisões estratégicas relacionadas à remuneração e gestão de pessoas.

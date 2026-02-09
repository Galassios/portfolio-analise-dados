Projeto 05 - Análise Salarial por Área (Power BI)
Objetivo

Este projeto tem como objetivo analisar os salários dos colaboradores por área, comparando o salário médio de cada área com a média geral da empresa. A análise busca identificar diferenças salariais entre áreas e gerar insights para apoio à tomada de decisão.

Dados utilizados

O projeto utiliza dois arquivos CSV:

pessoas.csv
Contém informações dos colaboradores, incluindo nome, salário e a área à qual pertencem.

areas.csv
Contém o cadastro das áreas da empresa, com identificador e nome da área.

As tabelas foram relacionadas no Power BI por meio do campo area_id da tabela pessoas com o campo id_area da tabela areas, utilizando relacionamento muitos para um.

Ferramentas utilizadas

Power BI Desktop
DAX (Data Analysis Expressions)
Modelagem de dados
Visualização e análise de dados

Medidas criadas (DAX)

Salário Médio por Área

Salário Médio Área =
AVERAGE(pessoas[salario])


Média Geral do Salário

Média Geral Salário =
AVERAGE(pessoas[salario])


Total de Pessoas

Total Pessoas =
COUNT(pessoas[nome])

Visualizações desenvolvidas

Foi desenvolvido um gráfico de colunas apresentando o salário médio por área.
No mesmo gráfico, foi adicionada uma linha constante representando a média geral do salário da empresa.
O eixo Y foi ajustado para melhorar a visualização das diferenças entre as áreas.
Também foi incluída uma caixa de texto com os principais insights da análise.

Principais insights

A área de Marketing apresenta salário médio acima da média geral da empresa, mesmo possuindo um número menor de colaboradores.
A área de TI também possui salário médio acima da média geral.
A área de RH concentra o maior número de colaboradores, porém com salário médio inferior à média da empresa.

Conclusão

O dashboard permite uma visualização clara das diferenças salariais entre as áreas, auxiliando na identificação de possíveis desequilíbrios internos e apoiando decisões relacionadas à remuneração e gestão de pessoas.

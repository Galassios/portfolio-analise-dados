📄 README FINAL — PROJETO 2 (PRONTO PRA COPIAR)
📊 Análise de Receita em E-commerce
🎯 Objetivo

Analisar o comportamento da receita da empresa ao longo do tempo e comparar o desempenho dos canais de venda, identificando tendências de faturamento, volume de pedidos e ticket médio.

🧩 Problema de Negócio

A empresa precisava entender:

se a receita estava crescendo ou diminuindo
quais canais geravam maior faturamento
como o ticket médio se comportava ao longo do tempo
quais canais apresentavam melhor desempenho
🗃️ Base de Dados

Tabela: pedidos

coluna	descrição
id_pedido	identificador do pedido
cliente_id	identificador do cliente
data	data do pedido
valor	valor do pedido
canal	canal de venda

📌 Os dados utilizados foram simulados para fins de estudo.

⚙️ Tecnologias Utilizadas
SQL
Power BI
📈 Análises Realizadas
1. Evolução do faturamento

Análise da receita ao longo dos meses para identificar crescimento ou queda nas vendas.

SELECT 
    DATE_FORMAT(data, '%Y-%m') AS mes,
    SUM(valor) AS faturamento,
    COUNT(id_pedido) AS volume,
    ROUND(SUM(valor) / COUNT(id_pedido), 2) AS ticket_medio
FROM pedidos
GROUP BY mes
ORDER BY mes;
2. Comparação entre canais

Identificação dos canais com maior faturamento, volume de pedidos e ticket médio.

SELECT 
    canal,
    SUM(valor) AS faturamento,
    COUNT(id_pedido) AS volume,
    ROUND(SUM(valor) / COUNT(id_pedido), 2) AS ticket_medio
FROM pedidos
GROUP BY canal
ORDER BY faturamento DESC;
3. Crescimento mensal

Análise da variação do faturamento entre os meses utilizando window functions.

WITH base AS (
    SELECT 
        DATE_FORMAT(data, '%Y-%m') AS mes,
        SUM(valor) AS faturamento
    FROM pedidos
    GROUP BY mes
)

SELECT 
    mes,
    faturamento,
    LAG(faturamento) OVER (ORDER BY mes) AS faturamento_mes_anterior,
    ROUND(
        (faturamento - LAG(faturamento) OVER (ORDER BY mes)) 
        / LAG(faturamento) OVER (ORDER BY mes) * 100,
    2) AS crescimento_percentual
FROM base;
📊 Dashboard

O dashboard foi desenvolvido no Power BI com foco em simplicidade e clareza visual.

Página 1 — Visão Geral
faturamento total
total de pedidos
ticket médio
evolução do faturamento
comparação de faturamento por canal
Página 2 — Análise por Canal
desempenho individual dos canais
tabela comparativa de métricas
filtro temporal
💡 Principais Insights
O canal site concentra o maior faturamento da empresa
O ticket médio apresenta queda ao longo dos meses
Existe diferença significativa de desempenho entre os canais
A redução do ticket médio pode indicar mudança no comportamento de compra
🎯 Recomendações
Investigar estratégias utilizadas no canal site
Monitorar a queda do ticket médio nos próximos períodos
Comparar resultados com períodos anteriores para validar sazonalidade
Avaliar oportunidades de melhoria nos canais com menor desempenho
🧠 Habilidades Demonstradas
SQL (agregações, CTEs, window functions)
Construção de dashboards no Power BI
Análise de métricas de negócio
Geração de insights acionáveis
📁 Estrutura do Projeto
analise-receita-ecommerce/
│
├── dados/
│   └── pedidos.csv
│
├── queries/
│   ├── 01_receita_mensal.sql
│   ├── 02_receita_canal.sql
│   ├── 03_crescimento.sql
│
├── dashboard/
│   └── dashboard.pbix
│
└── README.md
🚀 Conclusão

A análise permitiu identificar os principais canais de receita da empresa e acompanhar a evolução do faturamento ao longo do tempo, auxiliando decisões relacionadas a crescimento, performance de canais e comportamento de compra dos clientes.

📊 Análise de Churn em E-commerce
🎯 Objetivo

Identificar clientes inativos (churn), medir a taxa de churn e entender o momento crítico em que os clientes deixam de comprar, com o objetivo de apoiar estratégias de retenção e reativação.

🧩 Problema de Negócio

A empresa observou queda na recorrência de clientes, mas não possui clareza sobre:

Quando os clientes deixam de comprar
Qual o volume de clientes em churn
Em que momento agir para evitar a perda
🗃️ Base de Dados

Tabela: pedidos

coluna	descrição
cliente_id	identificador do cliente
data	data do pedido

📌 Observação:
Os dados foram simulados para fins de estudo. Foram adicionados pedidos com datas mais antigas para permitir a análise de churn.

⚙️ Metodologia
1. Definição de churn
Cliente ativo → comprou nos últimos 30 dias
Cliente churn → não compra há 30 dias ou mais
2. Identificação da última compra
SELECT 
    cliente_id,
    MAX(data) AS data_ultima_compra
FROM pedidos
GROUP BY cliente_id;
3. Classificação de clientes
SELECT 
    cliente_id,
    MAX(data) AS data_ultima_compra,
    DATEDIFF('2026-06-01', MAX(data)) as dias_sem_comprar,
    CASE
        WHEN DATEDIFF('2026-06-01', MAX(data)) < 30 THEN 'ativo'
        ELSE 'churn'
    END as status
FROM pedidos
GROUP BY cliente_id;
4. Taxa de churn
WITH base AS (
    SELECT 
        cliente_id,
        MAX(data) AS data_ultima_compra,
        DATEDIFF('2026-06-01', MAX(data)) as dias_sem_comprar,
        CASE
            WHEN DATEDIFF('2026-06-01', MAX(data)) < 30 THEN 'ativo'
            ELSE 'churn'
        END as status
    FROM pedidos
    GROUP BY cliente_id
)

SELECT
    COUNT(DISTINCT cliente_id) as total_clientes,
    SUM(CASE WHEN status = 'churn' THEN 1 ELSE 0 END) as clientes_churn,
    ROUND(
        SUM(CASE WHEN status = 'churn' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(DISTINCT cliente_id), 
    2) as taxa_churn_percentual
FROM base;
5. Distribuição de inatividade
WITH base AS (
    SELECT 
        cliente_id,
        DATEDIFF('2026-06-01', MAX(data)) as dias_sem_comprar
    FROM pedidos
    GROUP BY cliente_id
)

SELECT
    CASE
        WHEN dias_sem_comprar BETWEEN 0 AND 7 THEN '0-7'
        WHEN dias_sem_comprar BETWEEN 8 AND 15 THEN '8-15'
        WHEN dias_sem_comprar BETWEEN 16 AND 30 THEN '16-30'
        ELSE '30+'
    END AS faixa_dias,
    COUNT(cliente_id) as quantidade_clientes
FROM base
GROUP BY faixa_dias
ORDER BY 
    CASE 
        WHEN faixa_dias = '0-7' THEN 1
        WHEN faixa_dias = '8-15' THEN 2
        WHEN faixa_dias = '16-30' THEN 3
        ELSE 4
    END;
📊 Principais Resultados

Distribuição de clientes:

0–7 dias → 5 clientes
8–15 dias → 5 clientes
16–30 dias → 7 clientes
30+ dias → 6 clientes
💡 Insights
A base apresenta clientes ativos e inativos de forma relevante
Existe uma zona crítica entre 16–30 dias, onde clientes estão em risco
Há presença significativa de clientes em churn (30+ dias)
O churn já está acontecendo, não é apenas risco futuro
🎯 Recomendações
1. Retenção (16–30 dias)
Enviar cupons e ofertas personalizadas
Notificações incentivando recompra
2. Reativação (30+ dias)
Campanhas com maior incentivo (descontos mais agressivos)
Ofertas exclusivas para retorno
📈 Métricas de Sucesso
Redução da taxa de churn
Aumento da taxa de recompra
Redução do tempo médio entre compras
🧠 Habilidades Demonstradas
SQL (CTE, agregações, CASE, DATEDIFF)
Pensamento analítico
Tradução de problema de negócio em dados
Geração de insights acionáveis
📁 ESTRUTURA DO REPOSITÓRIO
analise-churn-ecommerce/
│
├── dados/
│   └── pedidos.csv
│
├── queries/
│   ├── 01_base_clientes.sql
│   ├── 02_classificacao_churn.sql
│   ├── 03_taxa_churn.sql
│   └── 04_faixas_churn.sql
│
└── README.md

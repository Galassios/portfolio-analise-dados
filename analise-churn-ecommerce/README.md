# 📊 Análise de Churn em E-commerce

## 🎯 Objetivo

Identificar clientes inativos (churn), medir a taxa de churn e entender o momento crítico em que os clientes deixam de comprar, com o objetivo de apoiar estratégias de retenção e reativação.

---

## 🧩 Problema de Negócio

A empresa observou queda na recorrência de clientes, mas não possui clareza sobre:

* Quando os clientes deixam de comprar
* Qual o volume de clientes em churn
* Em que momento agir para evitar a perda

---

## 🗃️ Base de Dados

Tabela: `pedidos`

| coluna       | descrição                      |
|-------------|-------------------------------|
| id_pedido   | identificador do pedido       |
| cliente_id  | identificador do cliente      |
| data        | data do pedido                |
| valor       | valor do pedido               |
| canal       | canal de venda                |

📌 **Observação:**
Os dados foram simulados para fins de estudo. Foram adicionados pedidos com datas mais antigas para possibilitar a análise de churn.

---

## ⏱️ Data de Referência

A análise utiliza uma data de referência fixa para simular um cenário real de avaliação:

```sql
SET @data_referencia = '2026-06-01';
```

Isso permite calcular corretamente o tempo de inatividade dos clientes.

---

## ⚙️ Metodologia

### 1. Definição de churn

* Cliente **ativo** → comprou nos últimos 30 dias
* Cliente **churn** → não compra há 30 dias ou mais

---

### 2. Identificação da última compra

```sql
SELECT 
    cliente_id,
    MAX(data) AS data_ultima_compra
FROM pedidos
WHERE data <= @data_referencia
GROUP BY cliente_id;
```

---

### 3. Classificação de clientes

```sql
SELECT 
    cliente_id,
    MAX(data) AS data_ultima_compra,
    DATEDIFF(@data_referencia, MAX(data)) AS dias_sem_comprar,
    CASE
        WHEN DATEDIFF(@data_referencia, MAX(data)) < 30 THEN 'ativo'
        ELSE 'churn'
    END AS status
FROM pedidos
WHERE data <= @data_referencia
GROUP BY cliente_id;
```

---

### 4. Taxa de churn

```sql
WITH base AS (
    SELECT 
        cliente_id,
        MAX(data) AS data_ultima_compra,
        DATEDIFF(@data_referencia, MAX(data)) AS dias_sem_comprar,
        CASE
            WHEN DATEDIFF(@data_referencia, MAX(data)) < 30 THEN 'ativo'
            ELSE 'churn'
        END AS status
    FROM pedidos
    WHERE data <= @data_referencia
    GROUP BY cliente_id
)

SELECT
    COUNT(DISTINCT cliente_id) AS total_clientes,
    SUM(CASE WHEN status = 'churn' THEN 1 ELSE 0 END) AS clientes_churn,
    ROUND(
        SUM(CASE WHEN status = 'churn' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(DISTINCT cliente_id), 
    2) AS taxa_churn_percentual
FROM base;
```

---

### 5. Distribuição por faixa de inatividade

```sql
WITH base AS (
    SELECT 
        cliente_id,
        DATEDIFF(@data_referencia, MAX(data)) AS dias_sem_comprar
    FROM pedidos
    WHERE data <= @data_referencia
    GROUP BY cliente_id
)

SELECT
    CASE
        WHEN dias_sem_comprar BETWEEN 0 AND 7 THEN '0-7'
        WHEN dias_sem_comprar BETWEEN 8 AND 15 THEN '8-15'
        WHEN dias_sem_comprar BETWEEN 16 AND 30 THEN '16-30'
        ELSE '30+'
    END AS faixa_dias,
    COUNT(cliente_id) AS quantidade_clientes
FROM base
GROUP BY faixa_dias
ORDER BY 
    CASE 
        WHEN faixa_dias = '0-7' THEN 1
        WHEN faixa_dias = '8-15' THEN 2
        WHEN faixa_dias = '16-30' THEN 3
        ELSE 4
    END;
```

---

## 📊 Resultados

Distribuição de clientes por tempo sem compra:

* 0–7 dias → 5 clientes
* 8–15 dias → 5 clientes
* 16–30 dias → 7 clientes
* 30+ dias → 6 clientes

---

## 💡 Insights

* A base apresenta clientes ativos e inativos de forma relevante
* Existe uma **zona de risco entre 16–30 dias**, onde clientes podem entrar em churn
* Há presença significativa de clientes em **churn (30+ dias)**
* O churn já está acontecendo, não é apenas um risco futuro

---

## 🎯 Recomendações

### 🔹 Retenção (16–30 dias)

* Envio de cupons e incentivos à recompra
* Notificações personalizadas (email/app)

### 🔹 Reativação (30+ dias)

* Campanhas com descontos mais agressivos
* Ofertas exclusivas para retorno

---

## 📈 Métricas de Sucesso

* Redução da taxa de churn
* Aumento da taxa de recompra
* Redução do tempo médio entre compras

---

## ⚠️ Tratamento Temporal

Foi aplicado o filtro:

```sql
WHERE data <= @data_referencia
```

Isso garante que a análise considere apenas dados disponíveis até a data de referência, evitando distorções causadas por dados futuros.

---

## 🧠 Habilidades Demonstradas

* SQL (CTE, agregações, CASE, DATEDIFF)
* Pensamento analítico
* Tradução de problema de negócio em dados
* Geração de insights acionáveis

---

## 📁 Estrutura do Projeto

```
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
```

---

## 🚀 Conclusão

A análise permitiu identificar não apenas a existência de churn, mas também o momento crítico em que ele ocorre, possibilitando ações direcionadas para retenção e reativação de clientes.

---


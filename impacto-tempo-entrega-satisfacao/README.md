# 📦 Impacto do Tempo de Entrega na Satisfação do Cliente — Olist E-commerce

## 🎯 Objetivo

Analisar como o tempo de entrega influencia a satisfação dos clientes em um e-commerce brasileiro, utilizando dados públicos da Olist.

O projeto busca identificar possíveis impactos logísticos nas avaliações dos clientes, além de explorar categorias mais vendidas e recorrência de compra.

---

## 🧩 Problema de Negócio

A experiência de entrega influencia diretamente a satisfação do cliente.

A empresa deseja entender:

* entregas mais demoradas afetam avaliações?
* quais categorias possuem maior volume de vendas?
* qual o tempo médio de entrega?
* existe recorrência de clientes?

Essas análises podem auxiliar decisões relacionadas à logística, retenção e experiência do consumidor.

---

## 🗃️ Base de Dados

Dataset público:

**Olist Brazilian E-Commerce Dataset (Kaggle)**

O projeto utiliza os seguintes arquivos:

| Arquivo                                 | Descrição                |
| --------------------------------------- | ------------------------ |
| `olist_orders_dataset.csv`              | Informações dos pedidos  |
| `olist_order_reviews_dataset.csv`       | Avaliações dos clientes  |
| `olist_order_items_dataset.csv`         | Itens vendidos           |
| `olist_products_dataset.csv`            | Informações dos produtos |
| `olist_customers_dataset.csv`           | Dados dos clientes       |
| `product_category_name_translation.csv` | Tradução das categorias  |

📌 Os dados utilizados são públicos e foram disponibilizados para fins educacionais e analíticos.

---

## ⚙️ Tecnologias Utilizadas

* Python
* Pandas
* Matplotlib
* Seaborn
* Jupyter Notebook

---

## 📈 Análises Realizadas

### 1. Distribuição das avaliações

Análise das notas atribuídas pelos clientes para entender o comportamento geral de satisfação.

**Pergunta de negócio:**

> Os clientes costumam avaliar bem as compras?

---

### 2. Tempo médio de entrega

Cálculo do tempo médio entre a compra e a entrega do pedido.

**Pergunta de negócio:**

> Quanto tempo leva, em média, para um pedido ser entregue?

---

### 3. Tempo de entrega vs satisfação

Análise da relação entre tempo de entrega e nota do review.

**Pergunta de negócio:**

> Entregas mais demoradas impactam negativamente a satisfação?

---

### 4. Categorias mais vendidas

Identificação das categorias com maior volume de vendas.

**Pergunta de negócio:**

> Quais categorias concentram maior demanda?

---

### 5. Recorrência de clientes

Análise do percentual de clientes que realizaram mais de uma compra.

**Pergunta de negócio:**

> A empresa consegue reter clientes?

---

## 📊 Principais Insights

* A maioria das avaliações é positiva, indicando boa percepção geral do serviço.
* Entregas mais demoradas tendem a apresentar notas menores.
* Algumas categorias concentram grande parte do volume de vendas.
* A recorrência de clientes é relativamente baixa, sugerindo oportunidade de retenção.

---

## 🎯 Recomendações

* Reduzir atrasos logísticos para melhorar satisfação.
* Monitorar pedidos com tempo elevado de entrega.
* Criar estratégias de retenção para aumentar recompra.
* Priorizar categorias estratégicas para expansão.

---

## 📁 Estrutura do Projeto

```bash
impacto-tempo-entrega-satisfacao/
│
├── dados/
│   ├── olist_customers_dataset.csv
│   ├── olist_order_items_dataset.csv
│   ├── olist_order_reviews_dataset.csv
│   ├── olist_orders_dataset.csv
│   ├── olist_products_dataset.csv
│   └── product_category_name_translation.csv
│
├── notebooks/
│   └── analise_olist.ipynb
│
├── scripts/
│   └── analise_olist.py
│
├── imagens/
│   ├── distribuicao_reviews.png
│   ├── entrega_vs_review.png
│   └── top_categorias.png
│
├── README.md
│
└── requirements.txt
```

---

## 🧠 Habilidades Demonstradas

* Manipulação de dados com Pandas
* Junção de tabelas (`merge`)
* Análise exploratória de dados (EDA)
* Visualização de dados
* Geração de insights de negócio
* Análise de satisfação do cliente

---

## 🚀 Conclusão

O projeto mostrou evidências de que o tempo de entrega possui relação com a satisfação do cliente, indicando que melhorias logísticas podem impactar diretamente a experiência do consumidor.

Além disso, a análise de categorias e recorrência trouxe informações relevantes para decisões comerciais e estratégias de retenção.

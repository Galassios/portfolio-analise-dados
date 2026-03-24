# 📊 Projeto Power BI — Dashboard de Vendas

## 📌 Sobre o projeto

Este projeto tem como objetivo analisar dados de vendas de uma empresa fictícia de e-commerce, utilizando o Power BI para construção de um dashboard interativo.

A análise foi baseada em um dataset contendo informações sobre produtos, categorias, vendedores, quantidades e valores de venda, permitindo a visualização de indicadores importantes para tomada de decisão.

---

## 🎯 Objetivo

Responder perguntas de negócio como:

* Como o faturamento evolui ao longo do tempo?
* Quais produtos geram mais receita?
* Quem são os vendedores com melhor desempenho?
* Qual a participação de cada categoria no faturamento?
* Qual o ticket médio das vendas?

---

## 🗂️ Dataset

O dataset utilizado contém aproximadamente 200 registros de vendas, com a seguinte estrutura:

* `id_venda` → Identificador da venda
* `data` → Data da venda
* `produto` → Nome do produto
* `categoria` → Categoria do produto
* `vendedor` → Responsável pela venda
* `quantidade` → Quantidade vendida
* `preco_unitario` → Preço por unidade

---

## 🧠 Métricas criadas

### 🔹 Faturamento

Cálculo do valor total de vendas:

```DAX
Faturamento = quantidade * preco_unitario
```

---

### 🔹 Ticket Médio

Cálculo do valor médio por venda:

```DAX
Ticket Medio = 
AVERAGEX(
    dados_vendas,
    dados_vendas[Faturamento]
)
```

---

## 📊 Visualizações do Dashboard

O dashboard foi estruturado com foco em clareza e análise rápida:

* **KPI de Faturamento Total**
* **KPI de Ticket Médio**
* **Gráfico de linha:** Faturamento ao longo do tempo
* **Gráfico de barras:** Faturamento por produto
* **Gráfico de barras:** Desempenho por vendedor
* **Gráfico de pizza:** Faturamento por categoria
* **Filtros interativos (Slicers):** Vendedor e categoria

---

## 📈 Principais insights

* O faturamento apresenta variações ao longo do tempo, indicando possíveis padrões sazonais.
* Produtos da categoria de eletrônicos concentram grande parte da receita.
* Existe diferença significativa de desempenho entre os vendedores.
* O ticket médio elevado (R$ 246.219) ocorre devido à estrutura dos dados, onde cada registro pode representar múltiplas unidades vendidas em uma única transação, além do alto valor agregado dos produtos.

---

## 🎨 Design do Dashboard

O layout foi construído seguindo boas práticas de visualização:

* Hierarquia visual clara (KPI → tendência → detalhamento)
* Uso de cores simples e consistentes
* Organização em seções para facilitar a leitura
* Espaçamento adequado entre elementos

---

## 🛠️ Ferramentas utilizadas

* Power BI
* DAX (Data Analysis Expressions)

---

## 📂 Estrutura do projeto

```
projeto-powerbi-vendas/
│
├── dados/
│   └── dados_vendas.csv
│
├── dashboard/
│   └── dashboard-vendas.pbix
│
└── README.md
```

---

## 🚀 Conclusão

Este projeto demonstra a capacidade de transformar dados brutos em informações visuais e insights estratégicos, utilizando o Power BI como ferramenta principal.

As análises realizadas simulam situações reais do mercado, evidenciando habilidades essenciais para atuação como Analista de Dados.

---

## 👨‍💻 Autor

Projeto desenvolvido por Leonardo Caiado Dourado como parte do portfólio de estudos em Análise de Dados.

# 📊 Projeto SQL 02 — Análise de Vendas

## 📌 Sobre o projeto

Este projeto simula a atuação de um Analista de Dados em uma empresa de e-commerce, com o objetivo de analisar dados de vendas e gerar insights relevantes para o negócio.

A análise foi realizada utilizando SQL, com foco em métricas de faturamento, desempenho de produtos e vendedores, além de evolução temporal das vendas.

---

## 🎯 Objetivo

Responder perguntas de negócio como:

* Como o faturamento evolui ao longo do tempo?
* O negócio está crescendo ou caindo?
* Quais produtos geram mais receita?
* Qual a participação de cada produto no faturamento total?
* Quem são os melhores vendedores?
* Como o faturamento acumulado evolui ao longo do tempo?

---

## 🗂️ Dataset

O dataset utilizado contém informações de vendas, com aproximadamente 200 registros.

### Estrutura dos dados:

* `id_venda` → Identificador da venda
* `data` → Data da venda
* `produto` → Nome do produto
* `categoria` → Categoria do produto
* `vendedor` → Responsável pela venda
* `quantidade` → Quantidade vendida
* `preco_unitario` → Preço por unidade

---

## 🧠 Análises realizadas

### 1. Faturamento mensal

Cálculo do faturamento total por mês para identificar tendências ao longo do tempo.

---

### 2. Crescimento mês a mês

Comparação do faturamento atual com o mês anterior utilizando a função `LAG()`.

---

### 3. Ranking de produtos

Classificação dos produtos com base no faturamento total utilizando `RANK()`.

---

### 4. Percentual de faturamento por produto

Cálculo da participação de cada produto na receita total com `SUM() OVER()`.

---

### 5. Ranking de vendedores

Identificação dos vendedores com melhor desempenho em faturamento.

---

### 6. Faturamento acumulado

Análise do crescimento total da empresa ao longo do tempo utilizando `SUM() OVER (ORDER BY)`.

---

## 📈 Principais insights

* O faturamento apresenta variações ao longo dos meses, indicando possíveis sazonalidades.
* Alguns produtos concentram a maior parte da receita, sugerindo foco estratégico.
* Há diferença significativa de desempenho entre vendedores.
* O faturamento acumulado mostra crescimento consistente ao longo do tempo.

---

## 🛠️ Técnicas SQL utilizadas

* `GROUP BY`
* `CTE (WITH)`
* `Window Functions`
* `LAG()`
* `RANK()`
* `SUM() OVER()`
* Cálculo de métricas (faturamento e percentuais)

---

## 📂 Estrutura do projeto

```
projeto-sql-02-analise-vendas/
│
├── dados/
│   └── dados_vendas.csv
│
├── sql/
│   └── analises.sql
│
└── README.md
```

---

## 🚀 Conclusão

Este projeto demonstra a aplicação de SQL para análise de dados de vendas, permitindo transformar dados brutos em informações estratégicas para tomada de decisão.

As análises apresentadas simulam cenários reais enfrentados por analistas de dados no mercado.

---

## 👨‍💻 Autor

Projeto desenvolvido por Leonardo Caiado Dourado como parte do portfólio de estudos em Análise de Dados.

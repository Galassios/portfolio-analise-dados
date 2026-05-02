# 📊 Projeto 01 — Análise Salarial por Área (SQL e Pandas)

## 📌 Contexto

Este projeto simula uma análise interna de salários de uma empresa, com o objetivo de entender a **distribuição salarial por área** e apoiar decisões de gestão e recursos humanos.

A análise foi desenvolvida utilizando **SQL** e **Python (pandas)**, permitindo comparar abordagens e demonstrar domínio das duas ferramentas.

---

## 🎯 Objetivos

* Calcular a **média salarial por área**
* Identificar a **quantidade de pessoas em cada área**
* Ordenar as áreas por **maior média salarial**
* Aplicar **limpeza de dados** antes da análise
* Implementar a mesma lógica em **SQL e pandas**

---

## 🗂️ Estrutura dos Dados

### 📄 dados_pessoas.csv

Arquivo contendo informações das pessoas da empresa.

| Coluna  | Descrição         |
| ------- | ----------------- |
| nome    | Nome da pessoa    |
| area    | Área de atuação   |
| salario | Salário da pessoa |

---

## 🧹 Limpeza de Dados

Antes da análise, foi realizada a remoção de registros duplicados para evitar distorções nos cálculos:

* **SQL:** uso de `SELECT DISTINCT`
* **Pandas:** uso de `drop_duplicates()`

---

## 🧠 Análise em SQL

Arquivo: `sql/analise_salarial.sql`

```sql
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
```

---

## 🐍 Análise em Python (Pandas)

Arquivo: `python/analise_salarial.py`

```python
import pandas as pd 

df = pd.read_csv('dados/dados_pessoas.csv')

resultado = (
    df
    .drop_duplicates()
    .groupby('area')
    .agg(
        media=('salario', 'mean'),
        quant=('nome', 'count')
    )
    .round(2)
    .sort_values(by=['media', 'quant'], ascending=[False, False])
)

print(resultado)
```

---

## 📈 Principais Insights

* Algumas áreas apresentam **média salarial elevada mesmo com poucos funcionários**.
* Áreas com mais pessoas nem sempre possuem os maiores salários médios.
* A análise evidencia a importância de observar **média e volume conjuntamente**.

---

## 🛠️ Tecnologias Utilizadas

* SQL
* Python
* Pandas
* CSV

---

## 📚 Aprendizados

* Diferença prática entre `GROUP BY`, `ORDER BY` e agregações
* Equivalência entre SQL e pandas
* Importância da limpeza de dados antes da análise
* Organização de um projeto para portfólio profissional

---

## 👤 Autor

Projeto desenvolvido por **Leonardo Caiado Dourado** como parte dos estudos em Análise de Dados.



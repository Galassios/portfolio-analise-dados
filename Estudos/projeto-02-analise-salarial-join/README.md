# 📊 Análise Salarial por Área (SQL e Pandas)

## 📌 Descrição do Projeto

Este projeto tem como objetivo realizar uma análise salarial por área utilizando **SQL** e **Python (pandas)**.
A ideia é demonstrar habilidades essenciais para um Analista de Dados, como:

* Limpeza de dados
* Relacionamento entre tabelas (JOIN)
* Agregações (AVG, COUNT)
* Filtros com `HAVING` / `query`
* Ordenação de resultados
* Comparação entre SQL e pandas

---

## 🗂️ Estrutura dos Dados

### 📄 pessoas.csv

Contém informações individuais das pessoas.

| Coluna    | Descrição               |
| --------- | ----------------------- |
| id_pessoa | Identificador da pessoa |
| nome      | Nome da pessoa          |
| area_id   | Identificador da área   |
| salario   | Salário da pessoa       |

---

### 📄 areas.csv

Contém informações das áreas da empresa.

| Coluna    | Descrição             |
| --------- | --------------------- |
| id_area   | Identificador da área |
| nome_area | Nome da área          |

---

## 🎯 Objetivo da Análise

Responder às seguintes perguntas:

* Qual a média salarial por área?
* Quantas pessoas existem em cada área?
* Quais áreas possuem média salarial acima de 8.000?
* Como implementar a mesma análise em SQL e pandas?

---

## 🧠 Análise em SQL

```sql
SELECT 
    a.nome_area,
    ROUND(AVG(p.salario), 2) AS media_salarial,
    COUNT(p.nome) AS quant_pessoas
FROM pessoas p
LEFT JOIN areas a
    ON p.area_id = a.id_area
GROUP BY a.nome_area
HAVING AVG(p.salario) > 8000
ORDER BY media_salarial;
```

---

## 🐍 Análise em Python (Pandas)

```python
import pandas as pd

pessoas = pd.read_csv("pessoas.csv")
areas = pd.read_csv("areas.csv")

df = pessoas.merge(
    areas,
    left_on="area_id",
    right_on="id_area",
    how="left"
)

resultado = (
    df
      .drop(columns=['id_area'])
      .groupby("nome_area")
      .agg(
          media_salarial=("salario", "mean"),
          quant_pessoas=("nome", "count")
      )
      .query("media_salarial > 8000")
      .round(2)
      .sort_values("media_salarial")
)

print(resultado)
```

---

## 📈 Principais Insights

* A área de **Marketing** possui a maior média salarial, apesar de ter menos funcionários.
* A área de **RH** é a que possui mais pessoas, porém com média salarial inferior ao Marketing.
* A análise mostra como o tamanho da equipe não necessariamente reflete maiores salários médios.

---

## 🛠️ Tecnologias Utilizadas

* SQL
* Python
* Pandas
* CSV

---

## 📚 Aprendizados

* Diferença entre `WHERE` e `HAVING`
* Uso de `GROUP BY` e funções de agregação
* Relacionamentos entre tabelas
* Tradução de queries SQL para pandas
* Organização de um projeto para portfólio

---

## 👤 Autor

Projeto desenvolvido por **Leonardo Caiado Dourado**, como parte dos estudos em Análise de Dados.

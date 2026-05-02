import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
pd.set_option('display.max_columns', None)
pd.set_option('display.width', 1000) # Dá mais "espaço" horizontal
df = pd.read_csv("dados_pessoas.csv")

df["mediana_area"] = df.groupby("area")["salario"].transform("median")
df["diferenca"] = (df["salario"] - df["mediana_area"]).round(2)
df["percentual"] = (df["salario"] / df["mediana_area"]).round(2)

condicoes = [
    (df["percentual"] < 0.8),
    (df["percentual"] > 1.2)
]
resultados = ["Abaixo do mercado","Acima do mercado"]
df["classificacao"] = np.select(condicoes, resultados, default="Dentro da média")

df["outlier_simples"] = df["percentual"].apply(
    lambda x: "Outlier" if x < 0.7 or x > 1.3 else "Normal"
)

df["ranking_area"] = df.groupby("area")["salario"].rank(ascending=False, method="first")

abaixo = df.query("classificacao == 'Abaixo do mercado' and outlier_simples == 'Outlier'").copy()

print(f"\nPossíveis injustiças salariais ({len(abaixo)}):")
print(abaixo[["nome", "area", "salario", "mediana_area"]])

df_ordenado = df.sort_values(by="percentual")
cores = []

for p in df_ordenado["percentual"]:
    if p < 0.8:
        cores.append("red")
    elif p > 1.2:
        cores.append("#81c784")
    else:
        cores.append("gray")

plt.figure()

plt.barh(df_ordenado["nome"], df_ordenado["percentual"], color=cores)

plt.axvline(1)

plt.title("Análise de Discrepância Salarial")
plt.xlabel("Percentual")

plt.show()

print("\nResumo por área:")
print(df.groupby("area")["percentual"].agg(["mean", "min", "max"]))

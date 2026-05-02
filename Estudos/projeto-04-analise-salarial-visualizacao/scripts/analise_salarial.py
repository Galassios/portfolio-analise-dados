import pandas as pd
import matplotlib.pyplot as plt

pessoas = pd.read_csv("dados/pessoas.csv")
areas = pd.read_csv("dados/areas.csv")

df = pessoas.merge(
    areas,
    left_on="area_id",
    right_on="id_area",
    how="left"
)

media_geral = df["salario"].mean()
print(f"Média geral de salário: {media_geral:.2f}")

resumo_area = (
    df
    .groupby("nome_area")
    .agg(
        media_salario=("salario", "mean"),
        total_pessoas=("nome", "count")
    )
    .round(2)
    .sort_values(by="media_salario", ascending=False)
)

print(resumo_area)
print("")
acima_media = df[df["salario"] > media_geral]

print(acima_media[["nome", "area_id", "salario"]])
print("")
resumo_acima_media = (
    acima_media
    .groupby("area_id")
    .agg(
        media_salario=("salario", "mean"),
        total_pessoas=("nome", "count")
    )
    .round(2)
    .sort_values(by="media_salario", ascending=False)
)

print(resumo_acima_media)

ax = resumo_area["media_salario"].plot(kind="bar")

plt.axhline(
    y=media_geral,
    linestyle="--",
    linewidth=2,
    label="Média geral"
)

plt.title("Salário médio por área")
plt.ylabel("Salário médio")
plt.xlabel("Área")
plt.legend()
plt.tight_layout()
plt.show()


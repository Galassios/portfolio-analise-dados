import pandas as pd

df = pd.read_csv("dados/pessoas.csv")

media_geral = df["salario"].mean()
print(f"Média geral de salário: {media_geral:.2f}")

resumo_area = (
    df
    .groupby("area_id")
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


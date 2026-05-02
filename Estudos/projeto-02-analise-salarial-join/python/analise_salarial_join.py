import pandas as pd

pessoas = pd.read_csv("pessoas.csv")
areas = pd.read_csv("areas.csv")

df = pessoas.merge(
    areas,
    left_on="area_id",
    right_on="id_area",
    how="left"
)

resumo = (
    df
    .drop(columns=['id_area'])
    .groupby("nome_area")
    .agg(
        media_salarial=("salario", "mean"),
        quant_pessoas=("nome", "count")
    )
    .query('media_salarial > 8000')
    .round(2)
    .sort_values("media_salarial")
)

print(resumo)

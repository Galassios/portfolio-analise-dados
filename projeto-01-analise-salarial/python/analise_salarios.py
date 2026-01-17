import pandas as pd

df = pd.read_csv('dados/dados_pessoas.csv')

resultado = (
    df
    .drop_duplicates()
    .groupby('area', as_index=False)
    .agg(
        media=('salario', 'mean'),
        quant=('nome', 'count')
    )
    .round(2)
    .sort_values(by=['media', 'quant'], ascending=[False, False])
)

print(resultado)

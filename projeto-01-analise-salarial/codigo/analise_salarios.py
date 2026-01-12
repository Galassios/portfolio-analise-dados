import pandas as pd

df = pd.read_csv('dados_pessoas.csv')

dp = (
    df.copy()
    .drop_duplicates()
    .groupby('area').agg(
        media=('salario',"mean"),
        quant=('nome','count')
    )
    .round(2)
    .sort_values(by=['media', 'quant'], ascending=[False, False])
)
print(dp)

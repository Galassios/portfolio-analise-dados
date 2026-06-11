import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns


# ==========================
# CONFIGURAÇÕES
# ==========================

pd.set_option('display.max_columns', None)
pd.set_option('display.width', 1000)

sns.set_theme(style='whitegrid')


# ==========================
# LEITURA DOS DADOS
# ==========================

customers = pd.read_csv(
    'dados/olist_customers_dataset.csv'
)

items = pd.read_csv(
    'dados/olist_order_items_dataset.csv'
)

reviews = pd.read_csv(
    'dados/olist_order_reviews_dataset.csv'
)

orders = pd.read_csv(
    'dados/olist_orders_dataset.csv'
)

products = pd.read_csv(
    'dados/olist_products_dataset.csv'
)

translation = pd.read_csv(
    'dados/product_category_name_translation.csv'
)


# ==========================
# TRATAMENTO DE DATAS
# ==========================

orders['order_purchase_timestamp'] = pd.to_datetime(
    orders['order_purchase_timestamp']
)

orders['order_delivered_customer_date'] = pd.to_datetime(
    orders['order_delivered_customer_date']
)


# ==========================
# TEMPO DE ENTREGA
# ==========================

orders['tempo_entrega_dias'] = (
    orders['order_delivered_customer_date']
    - orders['order_purchase_timestamp']
).dt.days


# ==========================
# JUNÇÃO PEDIDOS + REVIEWS
# ==========================

df = orders.merge(
    reviews,
    on='order_id',
    how='inner'
)


# ==========================
# ANÁLISE 1
# DISTRIBUIÇÃO DAS AVALIAÇÕES
# ==========================

plt.figure(figsize=(9, 6))

ax = sns.countplot(
    x='review_score',
    data=df
)

plt.title(
    'Distribuição das Avaliações dos Clientes',
    fontsize=14
)

plt.xlabel('Nota da Avaliação')
plt.ylabel('Quantidade de Pedidos')

for p in ax.patches:
    ax.annotate(
        f'{int(p.get_height()):,}',
        (
            p.get_x() + p.get_width() / 2,
            p.get_height()
        ),
        ha='center',
        xytext=(0, 5),
        textcoords='offset points'
    )

plt.tight_layout()

plt.savefig(
    'imagens/distribuicao_reviews.png'
)

plt.close()


# ==========================
# ANÁLISE 2
# TEMPO MÉDIO DE ENTREGA
# ==========================

tempo_medio = (
    df['tempo_entrega_dias']
    .mean()
    .round(2)
)

print(
    f'Tempo médio de entrega: '
    f'{tempo_medio} dias'
)


# ==========================
# ANÁLISE 3
# ENTREGA X SATISFAÇÃO
# ==========================

dados_agrupados = (
    df.groupby('review_score')
    ['tempo_entrega_dias']
    .mean()
    .reset_index()
)

plt.figure(figsize=(9, 6))

ax = sns.barplot(
    x='review_score',
    y='tempo_entrega_dias',
    data=dados_agrupados
)

plt.title(
    'Tempo Médio de Entrega por Nota'
)

plt.xlabel('Nota da Avaliação')
plt.ylabel('Dias para Entrega')

for p in ax.patches:
    ax.annotate(
        f'{p.get_height():.1f}',
        (
            p.get_x() + p.get_width() / 2,
            p.get_height()
        ),
        ha='center',
        xytext=(0, 5),
        textcoords='offset points'
    )

plt.tight_layout()

plt.savefig(
    'imagens/entrega_vs_review.png'
)

plt.close()


# ==========================
# ANÁLISE 4
# TOP 10 CATEGORIAS
# ==========================

df_produtos = items.merge(
    products,
    on='product_id'
)

categorias = (
    df_produtos[
        'product_category_name'
    ]
    .value_counts()
    .head(10)
)

plt.figure(figsize=(10, 6))

ax = sns.barplot(
    x=categorias.values,
    y=categorias.index
)

plt.title(
    'Top 10 Categorias Mais Vendidas'
)

plt.xlabel(
    'Quantidade de Itens Vendidos'
)

plt.ylabel(
    'Categoria do Produto'
)

for p in ax.patches:
    width = p.get_width()

    ax.annotate(
        f'{int(width):,}',
        (
            width,
            p.get_y() + p.get_height() / 2
        ),
        ha='left',
        va='center',
        xytext=(5, 0),
        textcoords='offset points'
    )

plt.tight_layout()

plt.savefig(
    'imagens/top_categorias.png'
)

plt.close()


# ==========================
# ANÁLISE 5
# RECORRÊNCIA DE CLIENTES
# ==========================

orders_customers = orders.merge(
    customers,
    on='customer_id'
)

compras_cliente = (
    orders_customers
    .groupby('customer_unique_id')
    ['order_id']
    .count()
)

clientes_recorrentes = (
    (compras_cliente > 1)
    .mean() * 100
)

print(
    f'Clientes recorrentes: '
    f'{clientes_recorrentes:.2f}%'
)

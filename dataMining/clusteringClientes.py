from sqlalchemy import create_engine
import pandas as pd
from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler
import matplotlib.pyplot as plt
import seaborn as sns

# 🔐 Configuração da conexão com o banco PostgreSQL
DATABASE_URI = 'postgresql+psycopg2://postgres:12856@localhost:5432/dw_varejo'
engine = create_engine(DATABASE_URI)

# 📥 Carregar dados RFM a partir do SQL
query = """
SELECT 
    fv.id_cliente,
    MAX(dt.data) AS ultima_compra,
    CURRENT_DATE - MAX(dt.data) AS dias_ultima_compra,
    COUNT(fv.id_venda) AS frequencia_compras,
    SUM(fv.valor_total) AS valor_total_gasto
FROM public.fato_venda fv
JOIN public.dim_tempo dt ON fv.id_tempo = dt.id_tempo
GROUP BY fv.id_cliente
ORDER BY valor_total_gasto DESC;
"""

df = pd.read_sql(query, engine)

# Mostrar todas as linhas no terminal
pd.set_option('display.max_rows', None)
print("📊 Dados dos Clientes:")
print(df[['id_cliente', 'dias_ultima_compra', 'frequencia_compras', 'valor_total_gasto']])
print("\n" + "-" * 60 + "\n")

# Selecionar coisas pro clustering
X = df[['dias_ultima_compra', 'frequencia_compras', 'valor_total_gasto']]

# Padronizar os valores (se não dá problema no Kmeans)
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# 🧮 Definir número ideal de clusters (ex.: 4)
kmeans = KMeans(n_clusters=4, random_state=42)
df['cluster'] = kmeans.fit_predict(X_scaled)

# Visualizar os clusters
sns.pairplot(df[['dias_ultima_compra', 'frequencia_compras', 'valor_total_gasto', 'cluster']], hue='cluster')
plt.suptitle('Clusters de Clientes', y=1.02)
plt.show()

# Exibir todos os clientes com seus clusters ao lado do resultado
print("📌 Clientes com Clusters Atribuídos:")
print(df[['id_cliente', 'dias_ultima_compra', 'frequencia_compras', 'valor_total_gasto', 'cluster']])
print("\n" + "-" * 60 + "\n")

# Significado dos clusters
print("🏷️ Interpretação dos Clusters:")
print("""
Cluster 0 = Clientes Ativos, altos gastos
Cluster 1 = Clientes ocasionais, médios gastos
Cluster 2 = Clientes Antigos, baixa frequência
Cluster 3 = Novos Clientes, poucas compras
""")
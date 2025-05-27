from sqlalchemy import create_engine
import pandas as pd
from prophet import Prophet
import matplotlib.pyplot as plt

# 🔐 Conexão com PostgreSQL
DATABASE_URI = 'postgresql+psycopg2://postgres:12856@localhost:5432/dw_varejo'
engine = create_engine(DATABASE_URI)

# 📥 Carregar dados de vendas com datas
query = """
SELECT 
    dt.data,
    SUM(fv.valor_total) AS total_venda
FROM public.fato_venda fv
JOIN public.dim_tempo dt ON fv.id_tempo = dt.id_tempo
GROUP BY dt.data
ORDER BY dt.data;
"""

df = pd.read_sql(query, engine)

# Converter data para datetime
df['data'] = pd.to_datetime(df['data'])

# Renomear colunas para Prophet
df = df.rename(columns={'data': 'ds', 'total_venda': 'y'})

# Mostrar os dados carregados
print("📊 Dados históricos de venda:")
print(df.head())

# 📈 Plotar série temporal original
plt.figure(figsize=(12, 6))
plt.plot(df['ds'], df['y'])
plt.title('Histórico de Vendas')
plt.xlabel('Data')
plt.ylabel('Valor Total Vendido')
plt.grid(True)
plt.show()

# 🤖 Criar e treinar modelo Prophet
model = Prophet(
    yearly_seasonality=True,
    weekly_seasonality=True,
    daily_seasonality=False
)
model.add_country_holidays(country_name='Brazil')  # Adicionar feriados brasileiros
model.fit(df)

# 🔮 Fazer previsão futura (ex: próximos 30 dias)
future = model.make_future_dataframe(periods=30)
forecast = model.predict(future)

# 📊 Visualização dos resultados
fig = model.plot_components(forecast)
plt.show()

# 📋 Resultado final com previsões
print("\n🔮 Previsões para os próximos dias:")
print(forecast[['ds', 'yhat', 'yhat_lower', 'yhat_upper']].tail(10))

# 📉 Gráfico da previsão
fig = model.plot(forecast)
plt.title('Previsão de Vendas Futuras')
plt.xlabel('Data')
plt.ylabel('Valor Previsto')
plt.grid(True)
plt.show()
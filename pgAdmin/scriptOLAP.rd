-- CIDADE QUE MAIS VENDEU EM TERMOS DE RECEITA LIQUIDA--
SELECT 
    dl.cidade,
    COUNT(fv.id_venda) AS total_vendas,
    SUM(fv.quantidade) AS quantidade_total,
    SUM(fv.valor_total - COALESCE(fv.desconto, 0)) AS receita_liquida
FROM fato_venda fv
JOIN dim_loja dl ON fv.id_loja = dl.id_loja
GROUP BY dl.cidade
ORDER BY receita_liquida DESC;

-- RANKING TOP 3 CATEGORIAS POR CIDADE EM 2024 --

	WITH vendas_por_cidade_categoria AS (
    SELECT
        l.cidade,
        l.estado,
        p.categoria AS nome_categoria,
        SUM(f.valor_total) AS valor_total
    FROM
        public.fato_venda f
    JOIN public.dim_loja l ON f.id_loja = l.id_loja
    JOIN public.dim_produto p ON f.id_produto = p.id_produto
    JOIN public.dim_tempo t ON f.id_tempo = t.id_tempo
    WHERE t.ano = 2024
    GROUP BY
        l.cidade,
        l.estado,
        p.categoria
),
ranked_vendas AS (
    SELECT
        cidade,
        estado,
        nome_categoria,
        valor_total,
        RANK() OVER (PARTITION BY cidade ORDER BY valor_total DESC) AS ranking
    FROM vendas_por_cidade_categoria
)
SELECT *
FROM ranked_vendas
WHERE ranking <= 3
ORDER BY cidade, ranking;

-- COMPARATIVO TRIMESTRAL POR LOJA --

SELECT 
    dl.nome_loja,
    dt.ano,
    dt.trimestre,
    SUM(fv.quantidade) AS quantidade_vendida,
    SUM(fv.valor_total - COALESCE(fv.desconto, 0)) AS receita_liquida
FROM fato_venda fv
JOIN dim_loja dl ON fv.id_loja = dl.id_loja
JOIN dim_tempo dt ON fv.id_tempo = dt.id_tempo
GROUP BY dl.nome_loja, dt.ano, dt.trimestre
ORDER BY dl.nome_loja, dt.ano, dt.trimestre;
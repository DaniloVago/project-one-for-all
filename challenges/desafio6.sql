SELECT
    ROUND(MIN(s.valor_plano), 2) AS faturamento_minimo,
    ROUND(MAX(s.valor_plano), 2) AS faturamento_maximo,
    ROUND(AVG(s.valor_plano), 2) AS faturamento_medio,
    ROUND(SUM(s.valor_plano), 2) AS faturamento_total
FROM SpotifyClone.signature AS s
INNER JOIN SpotifyClone.user AS u
ON  s.plano_id = u.valor_plano;
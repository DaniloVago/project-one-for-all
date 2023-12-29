SELECT
    m.cancoes AS cancao,
    COUNT(h.musica_id) AS reproducoes
FROM SpotifyClone.music AS m
INNER JOIN SpotifyClone.history AS h
ON m.musica_id = h.musica_id
GROUP BY m.cancoes
ORDER BY reproducoes DESC, m.cancoes
LIMIT 2;
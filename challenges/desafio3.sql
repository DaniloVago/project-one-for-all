SELECT
    u.nome_pessoa_usuaria AS pessoa_usuaria,
    COUNT(h.data_reproducao) AS musicas_ouvidas,
    ROUND(SUM(m.duracao_segundos)/60, 2) AS total_minutos
FROM SpotifyClone.user AS u
INNER JOIN SpotifyClone.history AS h 
ON h.pessoa_usuaria_id = u.pessoa_usuaria_id
INNER JOIN SpotifyClone.music AS m 
ON m.musica_id = h.musica_id
GROUP BY u.nome_pessoa_usuaria
ORDER BY u.nome_pessoa_usuaria
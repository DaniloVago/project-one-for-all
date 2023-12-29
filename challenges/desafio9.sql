SELECT
    COUNT(h.pessoa_usuaria_id) AS musicas_no_historico
FROM SpotifyClone.history AS h
INNER JOIN SpotifyClone.user AS u
ON u.pessoa_usuaria_id = h.pessoa_usuaria_id
WHERE u.nome_pessoa_usuaria = "Barbara Liskov";
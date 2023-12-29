SELECT
    u.nome_pessoa_usuaria AS pessoa_usuaria,
    IF(MAX(YEAR(h.data_reproducao)) < 2021, 'Inativa', 'Ativa') AS status_pessoa_usuaria
FROM SpotifyClone.user AS u
INNER JOIN SpotifyClone.history AS h
ON u.pessoa_usuaria_id = h.pessoa_usuaria_id
GROUP BY u.nome_pessoa_usuaria
ORDER BY u.nome_pessoa_usuaria
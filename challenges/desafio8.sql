SELECT
    ar.artista AS artista,
    al.album AS album
FROM SpotifyClone.artist AS ar
INNER JOIN SpotifyClone.album AS al
ON ar.artista_id = al.artista_id
WHERE artista = "Elis Regina";
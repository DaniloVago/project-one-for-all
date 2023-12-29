SELECT
    ar.artista AS artista,
    al.album AS album,
    COUNT(f.artista_id) AS pessoas_seguidoras
FROM SpotifyClone.artist AS ar
INNER JOIN SpotifyClone.album AS al
ON ar.artista_id = al.artista_id
INNER JOIN SpotifyClone.following AS f
ON al.artista_id = f.artista_id
GROUP BY artista, album
ORDER BY pessoas_seguidoras DESC, artista, album;
SELECT
    (SELECT COUNT(musica_id) FROM music) AS cancoes,
    (SELECT COUNT(artista_id) FROM artist) AS artistas,
    (SELECT COUNT(album_id) FROM album) AS albuns;

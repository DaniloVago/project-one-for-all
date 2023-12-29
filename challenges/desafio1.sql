DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE signature 
(
    plano_id	INT PRIMARY KEY AUTO_INCREMENT,
    valor_plano	DECIMAL(3,2) NOT NULL,
    plano	VARCHAR(512) NOT NULL
);

INSERT INTO signature (plano_id, valor_plano, plano) VALUES
	(1, 0, 'gratuito'),
	(2, 5.99, 'universitário'),
	(3, 6.99, 'pessoal'),
	(4, 7.99, 'familiar');

CREATE TABLE user 
(
    pessoa_usuaria_id	INT PRIMARY KEY AUTO_INCREMENT,
    nome_pessoa_usuaria	VARCHAR(512) NOT NULL,
    idade	INT NOT NULL,
    data_assinatura	VARCHAR(512) NOT NULL,
    valor_plano	INT NOT NULL,
    FOREIGN KEY (valor_plano) REFERENCES SpotifyClone.signature (plano_id)
);

INSERT INTO user (pessoa_usuaria_id, nome_pessoa_usuaria, idade, data_assinatura, valor_plano) VALUES
	(1, 'Barbara Liskov', 82, '2019-10-20', 1),
	(2, 'Robert Cecil Martin', 58, '2017-01-06', 1),
	(3, 'Ada Lovelace', 37, '2017-12-30', 4),
	(4, 'Martin Fowler', 46, '2017-01-17', 4),
	(5, 'Sandi Metz', 58, '2018-04-29', 4),
	(6, 'Paulo Freire', 19, '2018-02-14', 2),
	(7, 'Bell Hooks', 26, '2018-01-05', 2),
	(8, 'Christopher Alexander', 85, '2019-06-05', 3),
	(9, 'Judith Butler', 45, '2020-05-13', 3),
	(10, 'Jorge Amado', 58, '2017-02-17', 3);

CREATE TABLE artist 
(
    artista_id	INT PRIMARY KEY AUTO_INCREMENT,
    artista	VARCHAR(512) NOT NULL
);

INSERT INTO artist (artista_id, artista) VALUES
	(1, 'Beyoncé'),
	(2, 'Queen'),
	(3, 'Elis Regina'),
	(4, 'Baco Exu do Blues'),
	(5, 'Blind Guardian'),
	(6, 'Nina Simone');

CREATE TABLE album 
(
    album_id	INT PRIMARY KEY AUTO_INCREMENT,
    album	VARCHAR(512) NOT NULL,
    artista_id	INT NOT NULL,
    ano_lancamento	INT NOT NULL,
	FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artist (artista_id)
);

INSERT INTO album (album_id, album, artista_id, ano_lancamento) VALUES
	(1, 'Renaissance', 1, 2022),
	(2, 'Jazz', 2, 1978),
	(3, 'Hot Space', 2, 1982),
	(4, 'Falso Brilhante', 3, 1998),
	(5, 'Vento de Maio', 3, 2001),
	(6, 'QVVJFA?', 4, 2003),
	(7, 'Somewhere Far Beyond', 5, 2007),
	(8, 'I Put A Spell On You', 6, 2012);

CREATE TABLE music 
(
    musica_id	INT PRIMARY KEY AUTO_INCREMENT,
    album_id	INT NOT NULL,
    cancoes	VARCHAR(512) NOT NULL,
    duracao_segundos	INT NOT NULL,
	FOREIGN KEY (album_id) REFERENCES SpotifyClone.album (album_id)
);

INSERT INTO music (musica_id, album_id, cancoes, duracao_segundos) VALUES
	(1, 1, "BREAK MY SOUL", 279),
	(2, 1, "VIRGO'S GROOVE", 369),
	(3, 1, "ALIEN SUPERSTAR", 116),
	(4, 2, "Don't Stop Me Now", 203),
	(5, 3, "Under Pressure", 152),
	(6, 4, "Como Nossos Pais", 105),
	(7, 5, "O Medo de Amar é o Medo de Ser Livre", 207),
	(8, 6, "Samba em Paris", 267),
	(9, 7, "The Bard's Song", 244),
	(10, 8, "Feeling Good", 100);

CREATE TABLE history 
(
    pessoa_usuaria_id	INT NOT NULL,
    musica_id	INT NOT NULL,
    data_reproducao	DATETIME NOT NULL,
    PRIMARY KEY (pessoa_usuaria_id, musica_id),
	FOREIGN KEY (pessoa_usuaria_id) REFERENCES SpotifyClone.user (pessoa_usuaria_id),
	FOREIGN KEY (musica_id) REFERENCES SpotifyClone.music (musica_id)
);

INSERT INTO history (pessoa_usuaria_id, musica_id, data_reproducao) VALUES
	(1, 8, '2022-02-28'),
	(1, 2, '2020-05-02'),
	(1, 10, '2020-03-06'),
	(2, 10, '2022-08-05'),
	(2, 7, '2020-01-02'),
	(3, 10, '2020-11-13'),
	(3, 2, '2020-12-05'),
	(4, 8, '2021-08-15'),
	(5, 8, '2022-01-09'),
	(5, 5, '2020-08-06'),
	(6, 7, '2017-01-24'),
	(6, 1, '2017-10-12'),
	(7, 4, '2011-12-15'),
	(8, 4, '2012-03-17'),
	(9, 9, '2022-02-24'),
	(10, 3, '2015-12-13');


CREATE TABLE following 
(
    pessoa_usuaria_id	INT NOT NULL,
    artista_id	INT NOT NULL,
	PRIMARY KEY(pessoa_usuaria_id, artista_id),
	FOREIGN KEY (pessoa_usuaria_id) REFERENCES SpotifyClone.user (pessoa_usuaria_id),
	FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artist (artista_id)
);

INSERT INTO following (pessoa_usuaria_id, artista_id) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 1),
	(2, 3),
	(3, 2),
	(4, 4),
	(5, 5),
	(5, 6),
	(6, 1),
	(6, 6),
	(7, 6),
	(9, 3),
	(10, 2);

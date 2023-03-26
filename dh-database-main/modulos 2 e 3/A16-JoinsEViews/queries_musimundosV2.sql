USE `musimundos_V2`;

SELECT * FROM cancoes;
SELECT * FROM artistas;
SELECT * FROM albuns;

CREATE VIEW colecoes_musicas AS
SELECT cancoes.nome AS MUSICAS, albuns.titulo AS ALBUNS, artistas.nome AS ARTISTAS
FROM cancoes
JOIN albuns ON cancoes.id_album = albuns.id
JOIN artistas ON albuns.id_artista = artistas.id
GROUP BY albuns.titulo
ORDER BY albuns.titulo ASC;

/*1*/

SELECT * FROM colecoes_musicas;

SELECT albuns.titulo, artistas.nome
FROM albuns
JOIN artistas ON albuns.id_artista = artistas.id
HAVING artistas.nome = 'Queen';

/*2*/

SELECT albuns.titulo, artistas.nome
FROM albuns
JOIN artistas ON albuns.id_artista = artistas.id
HAVING artistas.nome = 'Simply Red';

SELECT * FROM albuns
WHERE id_artista = 129;

SELECT * FROM artistas
WHERE nome = 'Simply Red';

/*3*/

SELECT * FROM itens_da_faturas WHERE itens_da_faturas.id_cancao = 20;
SELECT * FROM cancoes WHERE cancoes.nome = 'overdose';
SELECT * FROM artistas;
SELECT * FROM albuns;

SELECT cancoes.nome, artistas.nome, itens_da_faturas.quantidade
FROM cancoes
JOIN albuns ON albuns.id = cancoes.id_album
JOIN artistas ON artistas.id = albuns.id_artista
JOIN itens_da_faturas ON itens_da_faturas.id_cancao = cancoes.id
HAVING cancoes.nome = 'Overdose';

/*SIMPLES*/

SELECT cancoes.nome, COUNT(itens_da_faturas.quantidade)
FROM cancoes
JOIN itens_da_faturas ON itens_da_faturas.id_cancao = cancoes.id AND cancoes.nome = 'Overdose';

/*COM GROUP BY*/

SELECT cancoes.nome, COUNT(itens_da_faturas.quantidade)
FROM cancoes
JOIN itens_da_faturas ON itens_da_faturas.id_cancao = cancoes.id
GROUP BY cancoes.nome
HAVING cancoes.nome = 'Overdose';

/*4*/

SELECT * FROM faturas WHERE pais_cobranca = 'Argentina';


CREATE VIEW FATURAS_NACIONAIS AS
SELECT COUNT(faturas.id), faturas.data_fatura, clientes.id, clientes.nome, clientes.sobrenome, clientes.pais, faturas.valor_total
FROM faturas
JOIN clientes ON faturas.id_cliente = clientes.id AND faturas.pais_cobranca = 'Argentina';

SELECT * FROM FATURAS_NACIONAIS;

/*5*/

SELECT * FROM cancoes;
SELECT * FROM artistas;
SELECT * FROM albuns;
SELECT * FROM generos;
 
CREATE VIEW LATINOS AS
SELECT artistas.nome AS ARTISTA, albuns.titulo AS ALBUM, cancoes.nome AS MÚSICA, generos.nome AS GENERO
FROM cancoes
JOIN albuns ON cancoes.id_album = albuns.id
JOIN artistas ON albuns.id_artista = artistas.id
JOIN generos ON cancoes.id_genero = generos.id AND generos.nome = 'Latin'
ORDER BY artistas.nome, cancoes.nome;

/*SIMPLES*/

CREATE VIEW LATINOS AS
SELECT artistas.nome AS ARTISTA, albuns.titulo AS ALBUM, cancoes.nome AS MÚSICA, generos.nome AS GENERO
FROM cancoes
JOIN albuns ON cancoes.id_album = albuns.id
JOIN artistas ON albuns.id_artista = artistas.id
JOIN generos ON cancoes.id_genero = generos.id
HAVING generos.nome = 'Latin'
ORDER BY artistas.nome, cancoes.nome;

SELECT * FROM LATINOS;

DROP VIEW LATINOS;
USE `musimundos_V2`;

UPDATE faturas SET id_cliente = NULL WHERE id_cliente > 50;
UPDATE cancoes SET cancoes.id_tipo_de_arquivo = NULL WHERE cancoes.id > 850;

/*A*/
/*1*/

/*a*/
SELECT * FROM artistas;

CREATE VIEW EXERCICIO1A AS
SELECT artistas.nome, albuns.titulo
FROM artistas
JOIN albuns ON artistas.id = albuns.id_artista
ORDER BY artistas.id;

-- 347 linhas

SELECT * FROM EXERCICIO1A;

/*b*/

CREATE VIEW EXERCICIO1B AS
SELECT artistas.nome, albuns.titulo
FROM artistas
LEFT JOIN albuns ON artistas.id = albuns.id_artista
ORDER BY artistas.id;

-- 418 linhas

SELECT * FROM EXERCICIO1B;

/*2*/

/*a*/

SELECT * FROM faturas;
SELECT * FROM clientes;

CREATE VIEW EXERCICIO2A AS
SELECT clientes.id, clientes.nome, faturas.valor_total
FROM clientes
JOIN faturas ON clientes.id = faturas.id_cliente;

SELECT * FROM EXERCICIO2A;

-- 350 linhas

/*teste*/

SELECT clientes.id, clientes.nome, faturas.valor_total, SUM(faturas.valor_total)
FROM clientes
JOIN faturas ON clientes.id = faturas.id_cliente
GROUP BY clientes.nome;

/*b*/

CREATE VIEW EXERCICIO2B AS
SELECT clientes.id, clientes.nome, faturas.valor_total
FROM clientes
RIGHT JOIN faturas ON clientes.id = faturas.id_cliente;

SELECT * FROM EXERCICIO2B;

-- 412 linhas

/*3*/

/*a*/

SELECT * FROM cancoes;
SELECT * FROM tipos_de_arquivo;


CREATE VIEW EXERCICIO3A AS
SELECT cancoes.nome AS MUSICA, tipos_de_arquivo.nome AS TIPO_ARQUIVO
FROM cancoes
JOIN tipos_de_arquivo ON cancoes.id_tipo_de_arquivo = tipos_de_arquivo.id;

SELECT * FROM EXERCICIO3A;

-- 850 linhas

/*b*/

CREATE VIEW EXERCICIO3B AS
SELECT cancoes.nome AS MUSICA, tipos_de_arquivo.nome AS TIPO_ARQUIVO
FROM cancoes
RIGHT JOIN tipos_de_arquivo ON cancoes.id_tipo_de_arquivo = tipos_de_arquivo.id;

SELECT * FROM EXERCICIO3B;

-- 853 linhas

/*c*/

CREATE VIEW EXERCICIO3C AS
SELECT cancoes.nome AS MUSICAS, tipos_de_arquivo.nome AS TIPOS_ARQUIVOS
FROM cancoes
LEFT JOIN tipos_de_arquivo ON cancoes.id_tipo_de_arquivo = tipos_de_arquivo.id;

SELECT * FROM EXERCICIO3C;
-- 3503 linhas

/*B*/

/*1 FEITO*/

/*2*/

/*A*/

CREATE VIEW TODAS_MUSICAS AS
SELECT * FROM cancoes;

SELECT * FROM TODAS_MUSICAS;

/*B*/

CREATE VIEW EXERCICIO4B AS
SELECT * FROM faturas WHERE valor_total > 5;
SELECT * FROM EXERCICIO4B;

/*C*/

CREATE VIEW EXERCICIO4C AS
SELECT * FROM artistas WHERE nome LIKE 'B%';

SELECT * FROM EXERCICIO4C;
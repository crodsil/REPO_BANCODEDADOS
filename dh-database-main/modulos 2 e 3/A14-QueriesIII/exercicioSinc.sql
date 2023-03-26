USE `musimundos_V2`;

/*ORDEM DO FROM E INNER JOIN:
FROM - TABELA DO PK
INNER JOIN - TABELA DO FK*/

/*1*/

SELECT * FROM artistas;
SELECT * FROM albuns;

SELECT artistas.nome AS NOME_ARTISTA, albuns.titulo AS NOME_ALBUM
FROM artistas
JOIN albuns ON artistas.id = albuns.id_artista
ORDER BY artistas.id;

/*2*/

SELECT * FROM faturas;
SELECT * FROM clientes;

SELECT clientes.nome AS CLIENTE, faturas.id_cliente AS FATURA, faturas.valor_total AS VALOR_FATURA
FROM clientes
JOIN faturas ON clientes.id = faturas.id_cliente AND faturas.valor_total > 5
ORDER BY valor_total DESC;

/*OU*/

SELECT clientes.nome AS CLIENTE, faturas.id_cliente AS FATURA, faturas.valor_total AS VALOR_FATURA
FROM clientes
JOIN faturas ON clientes.id = faturas.id_cliente 
HAVING faturas.valor_total > 5
ORDER BY valor_total DESC;

/*3*/

SELECT * FROM cancoes;
SELECT * FROM tipos_de_arquivo;

SELECT cancoes.id AS ID_CANCAO, cancoes.nome AS NOME_CANCAO, tipos_de_arquivo.nome AS TIPO_ARQUIVO
FROM cancoes
JOIN tipos_de_arquivo ON cancoes.id_tipo_de_arquivo = tipos_de_arquivo.id
ORDER BY cancoes.id;
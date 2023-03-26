USE musimundos_V2;

SELECT * FROM clientes;
SELECT * FROM faturas;

/*EXERCICIOS*/

/*1*/

SELECT * FROM clientes;
SELECT * FROM faturas;

SELECT DISTINCT CONCAT(clientes.nome, ' ' , clientes.sobrenome) AS  NOME_COMPLETO, faturas.cidade_cobranca AS CIDADE_COBRANCA
FROM clientes
JOIN faturas ON clientes.id = faturas.id_cliente
ORDER BY clientes.nome ASC;

/*2*/

SELECT * FROM cancoes;
SELECT * FROM tipos_de_arquivo;

SELECT COUNT(cancoes.nome) AS MUSICA, tipos_de_arquivo.nome AS TIPO_ARQUIVO
FROM cancoes
LEFT JOIN tipos_de_arquivo ON tipos_de_arquivo.id = cancoes.id_tipo_de_arquivo
ORDER BY cancoes.id DESC
LIMIT 4000;

/*3*/

SELECT * FROM faturas;
SELECT * FROM itens_da_faturas;
SELECT * FROM cancoes;

SELECT COUNT(faturas.id_cliente) AS ID_CLIENTE, faturas.data_fatura AS DATA_FATURA, cancoes.nome AS MUSICA_ADQUIRIDA
FROM clientes
JOIN faturas ON clientes.id = faturas.id_cliente
JOIN itens_da_faturas ON faturas.id = itens_da_faturas.id
JOIN cancoes ON cancoes.id = itens_da_faturas.id_cancao
ORDER BY clientes.id DESC;

SELECT COUNT(faturas.id_cliente) AS ID_CLIENTE, faturas.data_fatura AS DATA_FATURA, cancoes.nome AS MUSICA_ADQUIRIDA
FROM faturas
JOIN itens_da_faturas ON faturas.id = itens_da_faturas.id
JOIN cancoes ON cancoes.id = itens_da_faturas.id_cancao
ORDER BY faturas.id_cliente DESC;

/*4*/

SELECT * FROM artistas;
SELECT * FROM albuns;
SELECT * FROM cancoes;

SELECT artistas.nome AS ARTISTA, albuns.titulo AS ALBUM, cancoes.nome AS CANCAO
FROM artistas
JOIN albuns ON artistas.id = albuns.id_artista
JOIN cancoes ON albuns.id = cancoes.id_album
ORDER BY artistas.nome DESC;

/*5*/

SELECT * FROM generos;
SELECT * FROM cancoes;
SELECT * FROM tipos_de_arquivo;

SELECT generos.nome, cancoes.nome, tipos_de_arquivo.nome
FROM generos
JOIN cancoes ON cancoes.id_genero = generos.id
LEFT JOIN tipos_de_arquivo ON tipos_de_arquivo.id = cancoes.id_tipo_de_arquivo;
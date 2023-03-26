USE `musimundos`;

SELECT * FROM cancoes;
SELECT * FROM generos;

/*1*/

SELECT COUNT(cancoes.id) AS CANCOES, generos.nombre AS GENERO 
FROM cancoes
JOIN generos
ON cancoes.id_genero = generos.id
GROUP BY generos.nombre
ORDER BY COUNT(cancoes.id) DESC;

/*2*/

SELECT COUNT(cancoes.id) AS CANCOES, generos.nombre AS GENERO 
FROM cancoes
JOIN generos
ON cancoes.id_genero = generos.id
GROUP BY generos.nombre
HAVING COUNT(cancoes.id) > 10
ORDER BY COUNT(cancoes.id) DESC;

/*3*/

SELECT * FROM clientes;
SELECT * FROM faturas;

SELECT COUNT(DISTINCT clientes.id), clientes.pais, SUM(faturas.total)
FROM clientes
JOIN faturas
ON clientes.id = faturas.id_cliente
GROUP BY clientes.pais
ORDER BY SUM(faturas.total) DESC
LIMIT 7;
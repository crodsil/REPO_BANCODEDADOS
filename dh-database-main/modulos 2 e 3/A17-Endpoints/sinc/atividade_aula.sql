/*COMANDOS DE AULA*/

USE `musimundos_V2`;

-- 1. liste todos os nomes de todos artistas ordenados de formada crescente;

SELECT artistas.nome
FROM artistas
ORDER BY artistas.nome ASC;

-- 2. Quais são os generos musicais exsitentes? 

SELECT generos.nome
FROM generos;

-- 3. Mostre a todos de compositores que criaram alguma cancao;
SELECT * FROM cancoes;

SELECT DISTINCT (compositor)
FROM cancoes
WHERE compositor IS NOT NULL AND compositor != ' '
ORDER BY compositor;

-- 4. Mostre a lista dos empregados que foram contratados a partir de 2005

SELECT * FROM empregados
WHERE data_contratacao >= '2005-01-01';

-- 5. Liste todos os paises que têm faturas com valor superior a 1.000

SELECT * FROM faturas;

SELECT SUM(valor_total), faturas.pais_cobranca FROM faturas
GROUP BY pais_cobranca
HAVING SUM(valor_total) > 1.000;

SELECT DISTINCT(pais_cobranca), faturas.valor_total
FROM faturas
WHERE valor_total > 1.000;

-- 6. Quantas cancoes foram compostas por AC/DC ?

SELECT COUNT(*) FROM cancoes
WHERE compositor LIKE '%AC/DC%';

-- 7. Mostre as 10 primeiras cidades que tem faturas com valor superior a 100 reias.

SELECT SUM(valor_total), cidade_cobranca FROM faturas
GROUP BY cidade_cobranca
HAVING SUM(valor_total) > 10
ORDER BY valor_total ASC;

SELECT DISTINCT(cidade_cobranca)
FROM faturas
WHERE valor_total > 1
LIMIT 10;

SELECT SUM(faturas.valor_total) 
FROM faturas 
WHERE SUM(faturas.valor_total) > 1000;

SELECT * FROM faturas;

SELECT faturas.pais_cobranca, 
SUM(faturas.valor_total) 
AS SOMA_FATURAS 
FROM faturas
/*GROUP BY faturas.pais_cobranca - não funciona pois só há 1 pais que atende ao WHERE*/
HAVING SUM(faturas.valor_total) > 1000;
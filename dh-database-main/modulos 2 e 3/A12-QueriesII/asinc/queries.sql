USE `movies_db`;

select * from `series`;

-- 1. Mostre o título de todas as séries e use alias para que o nome do campo fique em português.

select title AS nome from series;

select * from `movies` ORDER BY rating ASC;

-- 2. Busque por título de filmes com classificação superior a 3, com mais de 1 prêmio e com data de lançamento entre '01-01-1988' e '31-12-2009'. Classifique os resultados em ordem decrescente.

SELECT title, rating, awards, release_date from movies
WHERE rating > 3 AND awards > 1 AND release_date between '1988-01-01 00:00:00' AND '2009-12-31 00:00:00' ORDER BY title DESC;

-- ou

SELECT title, rating, awards, release_date from movies
WHERE rating > 3 AND awards > 1 AND release_date between '1988-01-01 00:00:00' AND release_date < '2009-12-31 00:00:00' ORDER BY title DESC;

-- 3. Fazer um top 3 com os filmes a partir do 10º registro da consulta anterior.

SELECT title, rating, awards, release_date
FROM movies
WHERE rating > 3 AND awards > 1
AND release_date between '1988-01-01 00:00:00'
AND '2009-12-31 00:00:00' ORDER BY rating LIMIT 3 OFFSET 9;

-- 4. Quais são os 3 piores episódios considerando suas classificações?

SELECT title, rating, release_date
FROM episodes
ORDER BY rating ASC LIMIT 3;

-- 5. Liste todos os atores. Remova a coluna de filmes e datas favoritas e traduza o nome da coluna.

SELECT * from episodes;

SELECT title, rating FROM movies WHERE rating LIKE '%5';

SELECT first_name AS primeiro_nome, last_name AS sobre_nome from actors;
USE musimundos_V2;

SELECT * FROM albuns;
SELECT * FROM artistas;

SELECT artistas.nome, albuns.titulo
FROM albuns
JOIN artistas ON artistas.id = albuns.id_artista AND artistas.nome = "Queen";

/*23*/

SELECT * FROM clientes;

SELECT cidade, COUNT(id) FROM empregados
GROUP BY cidade
ORDER BY cidade;

/*24*/

SELECT * FROM generos;
SELECT * FROM cancoes;

SELECT COUNT(generos.id), generos.nome
FROM cancoes
JOIN generos ON cancoes.id_genero = generos.id
GROUP BY generos.nome
ORDER BY generos.id;

/*25*/

SELECT nome, sobrenome FROM empregados
WHERE data_nascimento = '1984-09-12';

/*26*/

SELECT * FROM clientes;
SELECT * FROM faturas;

SELECT COUNT(id_cliente), pais_cobranca
FROM faturas
GROUP BY pais_cobranca
ORDER BY COUNT(id_cliente) DESC;

/*27*/

SHOW TABLES;
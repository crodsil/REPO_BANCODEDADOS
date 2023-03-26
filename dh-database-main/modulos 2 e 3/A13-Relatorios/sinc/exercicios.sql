/*TABELA FATURAS*/
USE musimundos_V2;

SELECT * FROM faturas;

/*1*/ SELECT cidade_cobranca, MAX(`valor_total`) FROM faturas WHERE cidade_cobranca = 'Oslo';

/*2*/ SELECT MIN(`valor_total`) FROM faturas;

/*3*/ SELECT AVG(`valor_total`) FROM faturas WHERE pais_cobranca = 'Canada';

/*4*/ SELECT COUNT(*) FROM faturas WHERE pais_cobranca = 'Canada';

/*5*/ SELECT SUM(`valor_total`) FROM faturas;

/*6*/ SELECT id, data_fatura, valor_total FROM faturas WHERE valor_total < (SELECT AVG(`valor_total`) FROM faturas);

/*TABELA EMPREGADOS*/

/*7*/ SELECT MAX(`data_nascimento`) FROM empregados;

/*7b - Nome do cara mais novo*/ SELECT nome, data_nascimento FROM empregados WHERE data_nascimento = (SELECT MAX(`data_nascimento`) FROM empregados);

/*8*/ SELECT MIN(`data_nascimento`) FROM empregados;

/*9*/ SELECT DATE_FORMAT(`data_nascimento`, "%a %d %M %Y") FROM empregados;

/*TABELA CANCOES*/

/*10*/ SELECT COUNT(*) AS Qtde_Composit FROM cancoes WHERE compositor = 'AC/DC';

/*11*/ SELECT AVG(`duracao_milisegundos`) AS Tempo_médio FROM cancoes;

/*12*/ SELECT AVG(`bytes`) AS Tam_Médio_Cancoes FROM cancoes WHERE compositor = 'AC/DC';

/*CLIENTES*/

/*13*/ SELECT COUNT(*) AS Clientes_Paulistanos FROM clientes WHERE cidade = 'São Paulo';

/*14*/ SELECT COUNT(*) AS Clientes_Parisienses FROM clientes WHERE cidade = 'Paris';

/*15*/ SELECT COUNT(*) AS Clientes_Yahoo FROM clientes WHERE email LIKE '%yahoo%';

/*Aula 29/06 - Joins*/

/*SUPORTE: https://www.youtube.com/watch?v=jx2ne8iZMOA*/

/*1 - Gerar EER Diagram -> Menu Database Reverse engineer*/
/*2 - Definir quais campos de quais tabelas eu quero na consulta*/
/*3 - JOIN outra tabela ON FK da minha tabela = PK da tabela da qual quero pegar dados*/

/*1:N*/

/*16 extra*/

SELECT * FROM clientes;
SELECT * FROM faturas;

SELECT clientes.id, nome, faturas.id_cliente, valor_total
FROM clientes, faturas
WHERE clientes.id = faturas.id_cliente;

/*Exibe apenas clientes com faturas <> '' - Clientes com faturas relacionadas*/

SELECT clientes.id, nome, faturas.id_cliente, valor_total
FROM clientes
INNER JOIN faturas ON clientes.id = faturas.id_cliente;

/*Exibe clientes com faturas <> '' ou faturas = NULL - Clientes com ou sem faturas relacionadas*/

SELECT clientes.id, nome, faturas.id_cliente, valor_total
FROM clientes
LEFT JOIN faturas ON clientes.id = faturas.id_cliente;

/*Exibe Faturas com Id_clientes <> '' ou = NULL - com ou sem clientes relacionados*/

SELECT clientes.id, nome, faturas.id_cliente, valor_total
FROM clientes
RIGHT JOIN faturas ON clientes.id = faturas.id_cliente;

/*N:N*/
/*Testes*/

SELECT * FROM faturas;
SELECT * FROM itens_da_faturas;
SELECT * FROM cancoes;
SELECT * FROM albuns;
SELECT * FROM generos;

/*CONSULTA DE NOME DA CANÇÃO - TABELA CANCOES, TITULO DO GENERO - TABELA GENEROS, E TITULO ALBUM, TABELA ALBUNS*/

SELECT cancoes.nome AS Nome_Cancao, generos.nome AS Genero, albuns.titulo AS Album
FROM cancoes
JOIN generos ON cancoes.id_genero = generos.id
JOIN albuns ON cancoes.id_album = albuns.id;

/*CONSULTA DE NOME DA CANÇÃO - TABELA CANCOES, TITULO DO GENERO - TABELA GENEROS, E TITULO ALBUM, TABELA ALBUNS
E NOME DO ARTISTA*/

SELECT cancoes.nome AS Nome_Cancao, cancoes.duracao_milisegundos, generos.nome AS Genero, albuns.titulo AS Album, artistas.nome,
COUNT(*), AVG(duracao_milisegundos) 
FROM cancoes
JOIN generos ON cancoes.id_genero = generos.id
JOIN albuns ON cancoes.id_album = albuns.id
JOIN artistas ON albuns.id_artista = artistas.id
GROUP BY artistas.nome;

/*DISTINCT*/
/*NÃO PERMITE CONSULTAS DE DADOS DUPLICADOS EM RELAÇÕES N:N*/
/*EX. TRAZER APENAS DADOS DOS GENEROS, ALBUM E NOME DO ARTISTA SEM REPETÍ-LOS, E ORDERNAR POR NOME*/

SELECT DISTINCT generos.nome AS Genero, albuns.titulo AS Album, artistas.nome AS Artista
FROM cancoes
JOIN generos ON cancoes.id_genero = generos.id
JOIN albuns ON cancoes.id_album = albuns.id
JOIN artistas ON albuns.id_artista = artistas.id
ORDER BY artistas.nome;

/*FUNÇÕES*/

/*CONCAT - Concatenar coisas*/

SELECT CONCAT('Olá', 'Mundo!') AS `SAUDAÇÃO`;

SELECT CONCAT('A resposta é ', 24, '.') AS `Resultado`;

SELECT CONCAT('Nome: ', nome, ' ', compositor) AS `DADOS`
FROM cancoes;

/*COALESCE - Obter primeira expressão não nula de um conjunto de colunas por exemplo*/

SELECT COALESCE(NULL,1,20,'Digital House') AS RESULTADO;

SELECT COALESCE(NULL,NULL,'Digital House') AS RESULTADO;

/*DATEDIFF - DIFERENÇA ENTRE INTERVALO DE DUAS DATAS*/

SELECT DATEDIFF(hour, '2017-08-25 07:00:00', '2017-08-25 12:45:00');
SELECT DATEDIFF(minute, '2017-08-25 07:00:00', '2017-08-25 12:45:00');

/*EXTRACT - one item of a date*/

SELECT EXTRACT(SECOND FROM '2014-02-13 08:44:21');
SELECT EXTRACT(MINUTE FROM '2014-02-13 08:44:21');
SELECT EXTRACT(HOUR FROM '2014-02-13 08:44:21');
SELECT EXTRACT(DAY FROM '2014-02-13 08:44:21');
SELECT EXTRACT(WEEK FROM '2014-02-13 08:44:21');
SELECT EXTRACT(MONTH FROM '2014-02-13 08:44:21');
SELECT EXTRACT(QUARTER FROM '2014-02-13 08:44:21');
SELECT EXTRACT(YEAR FROM '2014-02-13 08:44:21');

/*REPLACE*/

SELECT REPLACE('abc abc', 'a', 'B');
SELECT REPLACE('abc abc', 'A', 'B');
SELECT REPLACE('123 123', '2', '5');

/*DATE FORMAT*/

SELECT DATE_FORMAT('2017-06-15', '%Y');
SELECT DATE_FORMAT('2017-06-15', '%W %M %e %Y');

/*CASE*/

select * from cancoes;

SELECT id, nome, duracao_milisegundos,
	CASE
		WHEN duracao_milisegundos < 10000 THEN 'É só um radio spot'
        WHEN duracao_milisegundos < 20000 THEN 'Musica curta'
        WHEN duracao_milisegundos < 30000 THEN 'Musica média'
        WHEN duracao_milisegundos < 40000 THEN 'Musica longa'
        ELSE 'Música boa'
	END AS Classificação
FROM cancoes
ORDER BY duracao_milisegundos;

/*GROUP BY*/
/*AGRUPA A CONSULTA POR GENERO MUSICAL, CONTA AS BANDAS QUE PERTENCEM A CADA GENERO*/

SELECT cancoes.nome AS Nome_Cancao, cancoes.duracao_milisegundos, generos.nome AS Genero, albuns.titulo AS Album, artistas.nome,
COUNT(*), AVG(duracao_milisegundos) 
FROM cancoes
JOIN generos ON cancoes.id_genero = generos.id
JOIN albuns ON cancoes.id_album = albuns.id
JOIN artistas ON albuns.id_artista = artistas.id
GROUP BY generos.nome;

/*HAVING*/
/*AGRUPA A CONSULTA POR GENERO MUSICAL, CONTA AS BANDAS QUE PERTENCEM A CADA GENERO, E RETORNA APENAS OS GENEROS COM MAIS DE 200 BANDAS*/

SELECT cancoes.nome AS Nome_Cancao, cancoes.duracao_milisegundos, generos.nome AS Genero, albuns.titulo AS Album, artistas.nome,
COUNT(*), AVG(duracao_milisegundos) 
FROM cancoes
JOIN generos ON cancoes.id_genero = generos.id
JOIN albuns ON cancoes.id_album = albuns.id
JOIN artistas ON albuns.id_artista = artistas.id
GROUP BY generos.nome
HAVING COUNT(*) > 200;
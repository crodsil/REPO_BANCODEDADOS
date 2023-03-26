USE musimundos;

/*FUNÇÕES DE AGREGAÇÃO*/

/*Conta quantos registros de artistas há*/

SELECT COUNT(*) FROM artistas;

/*Conta todos os artistas cujo nome começa com B*/

SELECT COUNT(*) FROM artistas WHERE nombre LIKE '%B';

SELECT * FROM faturas;

/*Soma do valor total das faturas*/

SELECT MAX(`total`) FROM faturas;

/* descobrir fatura mais antiga*/

SELECT MIN(`fecha_factura`) FROM faturas;

/*Média do valor das faturas*/

SELECT AVG(`total`) AS Média FROM faturas;

/*Somar valor total das faturas*/

SELECT SUM(`total`) AS SOMA FROM faturas;

/*FUNÇÕES DE FORMATAÇÃO*/

SELECT DATE_FORMAT(`fecha_factura`, "%d %M %Y") FROM faturas;

SELECT DATE_FORMAT(`fecha_factura`, "%a %b %Y") FROM faturas;

/*SUBQUERIES*/

SELECT * FROM faturas;

SELECT fecha_factura, id_cliente, total FROM faturas WHERE `total` > (SELECT AVG(`total`) FROM faturas);
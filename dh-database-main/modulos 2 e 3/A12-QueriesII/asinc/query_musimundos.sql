SELECT nombre, compositor, milisegundos
FROM cancoes
WHERE milisegundos > 300000
LIMIT 15;

SELECT id, nombre, compositor
FROM cancoes
LIMIT 20
OFFSET 20;

-- Não funciona aplicar alias no WHERE

SELECT nombre AS nome
FROM cancoes
WHERE nombre LIKE 'B%';

SELECT * from cancoes;

SELECT nombre, compositor, milisegundos
FROM 
SELECT nombre, compositor, milisegundos
FROM cancoes
WHERE milisegundos > 300000
LIMIT 15;
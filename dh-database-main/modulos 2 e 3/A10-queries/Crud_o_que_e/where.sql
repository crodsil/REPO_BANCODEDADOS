-- SELECT nombre, compositor, milisegundos FROM cancoes WHERE milisegundos != 343719;

-- SELECT nombre, compositor, milisegundos FROM cancoes WHERE milisegundos <= 340000;

-- SELECT nombre, compositor, milisegundos FROM cancoes WHERE milisegundos <= 230000 AND nombre = 'Fast As a shark';

-- SELECT nombre, compositor, milisegundos FROM cancoes WHERE milisegundos <= 230000 OR nombre = 'Fast As a shark' ORDER BY nombre ASC;

SELECT nombre, compositor, milisegundos FROM cancoes WHERE milisegundos <= 230000 OR nombre = 'Fast As a shark' ORDER BY nombre DESC;
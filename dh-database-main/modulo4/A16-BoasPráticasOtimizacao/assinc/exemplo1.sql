USE musimundos_V2;

/*RETORNA O TEMPO QUE LOVEOU A CONSULTA*/

SELECT BENCHMARK(10000, (SELECT nome FROM artistas LIMIT 1));
SELECT BENCHMARK(100000000, (SELECT nome FROM empregados WHERE data_contratacao >= '1987-01-01' LIMIT 1));

CREATE INDEX nome_indice ON artistas(nome);

EXPLAIN SELECT nome FROM artistas;

/*PERMISSÕES*/

/*root: admin*/

CREATE USER 'felipe'@'localhost'
IDENTIFIED BY 'estagio';
SELECT user FROM mysql.user;

/*NA TABELA, OU EM TODAS*/

GRANT SELECT ON musimundos_V2.artistas TO 'estagiario'@'localhost';
GRANT SELECT ON musimundos_V2.* TO 'felipe'@'localhost';
GRANT ALL PRIVILEGES ON musimundos_V2.* TO 'felipe'@'localhost';

/*EM MAIS DE UM BANCO*/

GRANT ALL PRIVILEGES ON musimundos_V2.*, emarket.* TO 'felipe'@'localhost';

/*NO BANCO TODO*/

GRANT SELECT ON * TO 'estagiario'@'localhost';

SHOW GRANTS FOR 'root'@'localhost';

/*REVOGANDO PERMISSÕES*/

REVOKE SELECT ON musimundos_V2.artistas FROM 'estagiario'@'localhost';

/*EXCLUINDO USUARIOS*/

DROP USER 'estagiario'@'localhost';

SHOW GRANTS FOR 'felipe'@'localhost';

FLUSH PRIVILEGES;
USE musimundos_V2;

SELECT `a`.`nome`, COUNT(`b`.`id`)
FROM `artistas` `a`
INNER JOIN `albuns` `b`
ON `a`.`id` = `b`.`id_artista`
GROUP BY `a`.`nome`
ORDER BY COUNT(`b`.`id`) DESC
LIMIT 10;

/*CONSULTA OTIMIZADA*/

SELECT `a`.`nome`, COUNT(`b`.`id`) 
FROM `artistas` `a`
INNER JOIN `albuns` `b`
ON `a`.`id` = `b`.`id_artista`
GROUP BY `a`.`nome`
ORDER BY COUNT(`b`.`id`) desc
LIMIT 10;

(SELECT artistas.nome
FROM artistas)
UNION ALL
(SELECT albuns.titulo,  COUNT(albuns.id)
FROM albuns);

/*TEMPO DE SELECT NA TAB COMPOSITOR SEM INDEX NELA*/

EXPLAIN SELECT nome FROM cancoes
WHERE compositor = 'AC/DC';

CREATE INDEX IDX_COMPOSITOR
ON cancoes(compositor);

/*TEMPO DE SELECT NA TAB COMPOSITOR COM INDEX NELA - APÓS CRIAÇÃO DO INDEX*/
/*ISSO INFLUENCIA NA PERFOFRMANCE DA APLICAÇÃO - RETORNO DE INFORMAÇÕPES REQUISITADAS NO FRONT-END*/
/*A IDEIA É CRIAR INDICES SOMENTE EM TABELAS COM COM CAMPOS QUE SÃO MUITO CONSULTADOS*/
/*INDEXAR CAMPOS CONSOME MUITO RECURSOS DO BD - POR ISSO LIMITAR*/

EXPLAIN SELECT nome FROM cancoes
WHERE compositor = 'AC/DC';

/*2 - TABELA CANCOES*/
/*a*/

SHOW INDEX FROM cancoes;

/*b*/

EXPLAIN SELECT nome FROM cancoes
WHERE compositor = 'Hero';

/*c*/

CREATE INDEX I_cancoes_nome
ON cancoes(nome);

/*d*/

EXPLAIN SELECT nome FROM cancoes
WHERE compositor = 'Hero';

/*e*/

DROP INDEX I_cancoes_nome ON cancoes;

/*2 - TABELA ALBUNS*/

/*a*/

SHOW INDEX FROM albuns;

/*b*/

EXPLAIN SELECT titulo FROM albuns
WHERE titulo = 'Na pista';

EXPLAIN ANALYZE SELECT titulo FROM albuns
WHERE titulo = 'Na pista';

/*c*/

CREATE INDEX I_albuns_titulo
ON albuns(titulo);

/*d*/

DROP INDEX I_albuns_titulo ON albuns;

/*CRIAR INDEX AGRUPADO*/


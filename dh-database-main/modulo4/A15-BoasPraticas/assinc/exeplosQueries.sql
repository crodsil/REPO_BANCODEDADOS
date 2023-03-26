/*otimizando queries para melhor performance do BD*/

USE musimundos_V2;

/*Use alias de coluna nas tabelas*/

SELECT artistas.nome FROM artistas;

/*Não use LIKE com %palavra%*/

SELECT artistas.nome FROM artistas
WHERE artistas.nome LIKE '%pt';

/*USE EXISTS OU NOT EXISTS*/
/*USADO EM SUBQUERIES*/

/*PARA NÃO USAR FUNÇÕES COM WHERE*/

SELECT DISTINCT(faturas.id_cliente), faturas.endereco_cobranca FROM faturas
WHERE EXISTS (SELECT clientes.id FROM clientes
				WHERE clientes.id = faturas.id_cliente);
                                
SELECT DISTINCT(faturas.id_cliente), faturas.endereco_cobranca FROM faturas
WHERE NOT EXISTS (SELECT clientes.id FROM clientes
					WHERE clientes.id = faturas.id_cliente);


/*UNINDO FUNÇÕES COM UNION/ UNION ALL*/

/*COM UNION*/

(SELECT faturas.id_cliente, faturas.endereco_cobranca FROM faturas
WHERE EXISTS (SELECT clientes.id FROM clientes
				WHERE clientes.id = faturas.id_cliente))                
UNION
(SELECT DISTINCT(faturas.id_cliente), faturas.endereco_cobranca FROM faturas
WHERE data_fatura >= '2010-01-01');

/*COM UNION ALL*/

(SELECT faturas.id_cliente, faturas.endereco_cobranca FROM faturas
WHERE EXISTS (SELECT clientes.id FROM clientes
				WHERE clientes.id = faturas.id_cliente))                
UNION ALL
(SELECT DISTINCT(faturas.id_cliente), faturas.endereco_cobranca FROM faturas
WHERE data_fatura >= '2010-01-01');

/*USE SET NO COUNT ON -> no t-sql*/

/*USE ROW_COUNT - NO MYSQL*/
/*PROCURAR EQUIVALENTE - MYSQL*/

SELECT faturas.data_fatura FROM faturas;
SELECT ROW_COUNT();

/*CRIE INDICES*/
/*INDICES - TORNAM CADA REGISTROI UNICO PARA MELHORAR PERFORMANCE - É O QUE AS PKs FAZEM NOS IDs - INDEXAM O INDICE DE CADA REGISTRO*/
/*2 tipos basicamente - agrupados e não agrupados - IDs e FKs - são definidos por padrão na criação das tabelas*/
         /*Pode existir mais de uma tabela com o mesmo Index, organiza no arguivo em que foi criado*/

CREATE INDEX CLIENTES_EMAILS
ON clientes (`email`);

/*MOSTRAR INDEXES*/

SHOW INDEX FROM clientes;

DROP INDEX CLIENTES_EMAILS ON clientes;

/*ANALISE E ARMAZENE DISTRIBUIÇÃO DE CHAVES EM TABELAS*/

ANALYZE TABLE clientes;

/*OBTENHA INFORMAÇÕES SOBRE UMA TABELA*/
EXPLAIN clientes;
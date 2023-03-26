USE musimundos_V2;

/*TABELA FATURAS*/

/*
1 - Crie uma procedure que selecione o valor da fatura com o valor mais baixo.
*/

DELIMITER $$
CREATE PROCEDURE `faturaMinima` ()
BEGIN
SELECT MIN(valor_total) FROM faturas;
END $$

CALL faturaMinima;

/*2 - Crie uma procedure que retorna a quantidade de faturas que tem o país de cobrança como “Canada”.*/

DELIMITER $$
CREATE PROCEDURE `faturas_Canada` ()
BEGIN
SELECT COUNT(id) FROM faturas
WHERE pais_cobranca = 'Canada';
END $$

CALL faturas_Canada;

/*3 Uma procedure que retorna o valor somado de todas as faturas.
*/

DELIMITER $$
CREATE PROCEDURE `total_faturas` ()
BEGIN
SELECT SUM(valor_total) FROM faturas;
END $$

CALL total_faturas;

/*4 - Uma procedure que retorna o valor médio de todas as faturas.*/

DELIMITER $$
CREATE PROCEDURE `total_faturas` ()
BEGIN
SELECT AVG(valor_total) FROM faturas;
END $$

/*TABELA CANCOES*/

/*1 - Crie uma procedure que retorna o tamanho em bytes e a duração de uma canção pelo seu id.*/

DELIMITER $$
CREATE PROCEDURE `dados_cancao` (IN id_cancao INT)
BEGIN
SELECT id, bytes, duracao_milisegundos FROM cancoes
WHERE id = id_cancao;
END $$

-- DROP PROCEDURE dados_cancao;

CALL dados_cancao(2);

/*2 - Crie uma procedure que retorna o preço unitário uma canção pelo seu id.*/

DELIMITER $$
CREATE PROCEDURE `preco_cancao` (IN id_preco INT)
BEGIN
SELECT id, preco_unitario FROM cancoes
WHERE id = id_preco;
END $$

CALL preco_cancao(2);

-- DROP PROCEDURE preco_cancao;

/*3 - Crie uma procedure que retorna o id da canção, o nome da canção e o tipo de arquivo(table tipos_de_arquivo)
desta canção á partir de um id da canção informado.*/

DELIMITER $$
CREATE PROCEDURE `tipo_arquivo` (IN id_tipo INT)
BEGIN
SELECT cancoes.id, cancoes.nome, tipos_de_arquivo.nome 
FROM cancoes
JOIN tipos_de_arquivo ON cancoes.id = tipos_de_arquivo.id AND cancoes.id = id_tipo;
END $$

-- DROP PROCEDURE tipo_arquivo;

CALL tipo_arquivo(2);

/*TABELA CLIENTES*/

/*1 - Crie uma procedure que retorna o nome e sobrenome concatenados e também o email de todos os clientes.*/

DELIMITER $$
CREATE PROCEDURE `dados_clientes` ()
BEGIN
SELECT CONCAT(nome, ' ', sobrenome), email FROM clientes;
END $$

DROP PROCEDURE dados_clientes;

CALL dados_clientes;

/*2 - Crie uma procedure que retorna o nome completo (nome e sobrenome concatenados)
e também o endereço completo (endereço, cidade, estado e país) de um cliente pelo id informado.*/

DELIMITER $$
CREATE PROCEDURE `relatorio_clientes` (IN id_cliente INT)
BEGIN
SELECT CONCAT(nome, ' ', sobrenome), endereco, cidade, estado, pais FROM clientes
WHERE id = id_cliente;
END $$

-- DROP PROCEDURE dados_clientes;

CALL relatorio_clientes(2);

/*3 - Crie uma procedure que retorna o nome do cliente
e o valor total de cada uma das suas faturas pelo id do cliente informado.*/

DELIMITER $$
CREATE PROCEDURE `faturas_cliente` (IN id_cliente INT)
BEGIN
SELECT clientes.nome, faturas.valor_total
FROM clientes
JOIN faturas ON clientes.id = faturas.id_cliente AND clientes.id = id_cliente;
END $$

CALL faturas_cliente(1);
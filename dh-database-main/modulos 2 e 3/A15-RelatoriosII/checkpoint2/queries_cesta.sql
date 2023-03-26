/*TESTE DE REQUISITOS DO PROJETO: O ARQUIVO DE SCRIPT DE RESPOSTA DEVE CONTER*/

USE cesta_coletiva;

/*INSERÇÃO EM UMA DAS TABELAS - TABELA PLANOS*/

INSERT INTO planos (nome_plano, ativo)
VALUES
('basico', 1),
('plus', 1),
('gold', 1);

/*INSERÇÃO DE DADOS - TABELA CLIENTES*/

/*SEM DADOS NULOS*/

INSERT INTO clientes (plano_id, nome, sobrenome, cpf, rg, data_nascimento, telefone1, telefone2, email, observacoes, login, senha)
VALUES
(1, 'Silvia', 'Franca', 99999999999, 999999999, '1994-01-01', 12934567890, 12934567891, 'silvia.saint@gmail.com', 'Recebe entregas das 18h às 22h', 'silvia.saint@gmail.com', 'secret*2'),
(2, 'Carlos', 'Carvalho', 99999999999, 999999999, '1995-02-02', 12934567892, 12934567893, 'carlos.saint@gmail.com', 'Recebe entregas das 22h às 2h', 'carlos.saint@gmail.com', 'secret#2');

/*COM DADOS NULOS - CAMPO TELEFONE 2 E OBSERVACOES*/

INSERT INTO clientes (plano_id, nome, sobrenome, cpf, rg, data_nascimento, telefone1, email,login, senha)
VALUES
(3, 'Fernanda', 'Franca', 99999999999, 999999999, '1994-01-03', 12934567890, 'fernanda.saint@gmail.com','fernanda.saint@gmail.com', 'secret%3'),
(1, 'Bruno', 'Carvalho', 99999999999, 999999999, '1995-02-04', 12934567892, 'bruno.saint@gmail.com', 'brunon.saint@gmail.com', 'secret$4'),
(2, 'Felipe', 'Moreira', 99999999999, 999999999, '1995-03-18', 12934567991, 'felipe.saint@gmail.com', 'felipe.saint@gmail.com', 'secret$2'),
(3, 'Camila', 'Silva', 99999999999, 999999999, '1995-08-14', 12934567993, 'camila.saint@gmail.com', 'camila.saint@gmail.com', 'secret$5');


SELECT * FROM clientes;

/*ATUALIZACAO DE DADOS EM UMA DAS TABELAS*/

UPDATE clientes SET
senha = 'secret*5'
WHERE id = 5;

/*EXCLUSÃO DE DADOS EM UMA DAS TABELAS*/

DELETE FROM clientes
WHERE id = 6;

/*SELEÇÃO DE DADOS EM UMA DAS TABELAS*/

SELECT nome, sobrenome, cpf, observacoes FROM clientes
WHERE observacoes IS NOT NULL;

SELECT nome, sobrenome, cpf, observacoes FROM clientes
WHERE observacoes IS NULL;

/*--------- TESTES ADICIONAIS - TESTES SIMPLES DAS RELAÇÕES - SEM AGREGAÇÕES*/

/*SELECTS ADICIONAIS*/

/*JOIN SIMPLES*/

SELECT clientes.nome, enderecos.endereco, planos.nome_plano
FROM clientes
JOIN enderecos ON clientes.id = enderecos.cliente_id
JOIN planos ON clientes.plano_id = planos.id;

/*INSERÇÕES ADICIONAIS E JOINS*/

/*INSERCAO DE DADOS - TABELA ENDERECOS*/

SELECT * FROM clientes;
SELECT * FROM enderecos;

INSERT INTO enderecos (cliente_id, endereco, bairro, numero, complemento, cidade, estado, cep, observacoes)
VALUES 
(1, 'Av. das bromélias', 'Centro', 500, 'Ap C79 - bloco B', 'São Paulo', 'SP', 09898000, 'Favor não comunicar a portaria'),
(2, 'Av. das papoulas', 'Centro', 500, 'Ap C80 - bloco B', 'São Paulo', 'SP', 09898000, 'Favor comunicar a portaria'),
(3, 'Av. das amélias', 'Centro', 501, 'Ap C81 - bloco B', 'São Paulo', 'SP', 09898001, 'Recebe entregas até 22h'),
(4, 'Av. parmesão', 'Centro', 502, 'fundos', 'Belo Horizonte', 'MG', 09898002, 'Recebe entregas até 17h'),
(5, 'Av. dos calafrios', 'Centro', 503, 'Ap C83 - bloco A', 'Florianopolis', 'SC', 09898003, 'Recebe entregas quando o sol sai');

/*INSERCAO DE DADOS - TABELA PLANOS*/

SELECT * FROM enderecos;

INSERT INTO tipos_pagamento (tipo, ativo)
VALUES
('boleto a vista', 1),
('boleto a prazo', 1),
('debito', 1),
('credito', 1);

SELECT * FROM tipos_pagamento;

INSERT INTO secoes (descricao, observacoes)
VALUES
('bebes', 'Produtos para cuidado infantil'),
('brinquedos', 'Produtos para entretenimento infantil'),
('casa e moveis', 'Produtos para o lar'),
('construcao', 'Produtos para suporte a construção de edificações'),
('eletrodomesticos', 'Produtos para suporte às tarefas domésticas'),
('esportes e fitness', 'Produtos para suporte ao cuidado do corpo'),
('tecnologia', 'Produtos para suporte às necessidade diárias');

SELECT * FROM secoes;

INSERT INTO redes_varejistas (cnpj, razao_social, nome_fantasia, foto, nome_representante, email_representante, classificacao, observacoes)
VALUES 
('89.936.149/0001-90', 'COMERCIAL ASSAI Ltda.', 'ASSAI ATACADISTA', 'https://www.noticiasdaregiao.com.br/wp-content/uploads/2021/02/assai-atacadista-1.jpg', 'Assai da Silva', 'representante@assai.com.br', 9, 'Necessário pré agendar reuniões'),
('60.964.103/0001-01', 'COMERCIAL SPANI Ltda.', 'SPANI ATACADISTA', 'https://mk0portaldeamergyp3q.kinstacdn.com/wp-content/uploads/2017/07/Spani.webp', 'Spani da Silva', 'representante@spani.com.br', 9, 'Necessário pré agendar reuniões'),
('66.858.454/0001-06', 'COMERCIAL MAKRO Ltda.', 'MAKRO ATACADISTA', 'https://newtrade.com.br/wp-content/uploads/2018/11/makro-brasilia-01-11-2018.jpg', 'Makro da Silva', 'representante@makro.com.br', 9, 'Necessário pré agendar reuniões biligue'),
('83.834.908/0001-28', 'COMERCIAL PICHAU Ltda.', 'PICHAU ATACADISTA', 'https://www.pichauarena.com.br/wp-content/uploads/2020/08/CD1-Pichau-Informatica-1024x576.jpg', 'Pichau da Silva', 'representante@pichau.com.br', 9, 'Agendamento de reuniões somente pelo site'),
('39.141.518/0001-80', 'COMERCIAL MIRAO Ltda.', 'MIRAO ATACADISTA', 'http://www.digifort.com.br/blog/wp-content/uploads/2020/12/1mscom_midia_digifort_28-12-20_002-300x225.jpg', 'Mirao da Silva', 'representante@mirao.com.br', 9,'Necessário consultar datas de reuniões previamente');

SELECT * FROM redes_varejistas;

INSERT INTO centros_distribuicao (varejista_id, cnpj, razao_social, nome_fantasia, foto, nome_responsavel, email_responsavel, horario_ini, horario_fin, observacoes)
VALUES
(1, '89.936.149/0001-90', 'CENTRO DISTRIBUICAO ASSAI Ltda.', 'ASSAI CENTRO DISTRIBUICAO', 'https://www.noticiasdaregiao.com.br/wp-content/uploads/2021/02/assai-atacadista-1.jpg', 'Assai da Silva', 'representante@assai.com.br', '08:00:00', '22:00:00', 'Necessário pré agendar reuniões'),
(2, '60.964.103/0001-01', 'CENTRO DISTRIBUICAO SPANI Ltda.', 'SPANI CENTRO DISTRIBUICAO', 'https://mk0portaldeamergyp3q.kinstacdn.com/wp-content/uploads/2017/07/Spani.webp', 'Spani da Silva', 'representante@spani.com.br', '08:00:00', '22:00:00', 'Necessário pré agendar reuniões'),
(3, '66.858.454/0001-06', 'CENTRO DISTRIBUICAO MAKRO Ltda.', 'MAKRO CENTRO DISTRIBUICAO', 'https://newtrade.com.br/wp-content/uploads/2018/11/makro-brasilia-01-11-2018.jpg', 'Makro da Silva', 'representante@makro.com.br', '08:00:00', '22:00:00', 'Necessário pré agendar reuniões biligue'),
(4, '83.834.908/0001-28', 'CENTRO DISTRIBUICAO PICHAU Ltda.', 'PICHAU CENTRO DISTRIBUICAO', 'https://www.pichauarena.com.br/wp-content/uploads/2020/08/CD1-Pichau-Informatica-1024x576.jpg', 'Pichau da Silva', 'representante@pichau.com.br', '08:00:00', '22:00:00', 'Agendamento de reuniões somente pelo site'),
(5, '39.141.518/0001-80', 'CENTRO DISTRIBUICAO MIRAO Ltda.', 'MIRAO CENTRO DISTRIBUICAO', 'http://www.digifort.com.br/blog/wp-content/uploads/2020/12/1mscom_midia_digifort_28-12-20_002-300x225.jpg', 'Mirao da Silva', 'representante@mirao.com.br', '08:00:00', '22:00:00','Necessário consultar datas de reuniões previamente');

SELECT * FROM centros_distribuicao;

INSERT INTO enderecos_cd (cd_id, endereco, numero, bairro, cidade, estado, cep, observacoes)
VALUES 
(1, 'Av. das bromélias', 500, 'centro', 'São Paulo', 'SP', 09898000, 'Favor não comunicar a portaria'),
(2, 'Av. das papoulas', 500, 'centro', 'São Paulo', 'SP', 09898000, 'Favor comunicar a portaria'),
(3, 'Av. das amélias', 500, 'centro', 'São Paulo', 'SP', 09898001, 'Recebe entregas até 22h'),
(4, 'Av. parmesão', 500, 'centro', 'Belo Horizonte', 'MG', 09898002, 'Recebe entregas até 17h'),
(5, 'Av. dos calafrios', 500, 'centro', 'Florianopolis', 'SC', 09898003, 'Recebe entregas quando o sol sai');

select * from enderecos_cd;

INSERT INTO produtos (secao_id, varejista_id, descricao, cod_barras, disponibilidade, quantidade, valor_unit, especificacoes, observacoes)
VALUES
(1, 1, 'Chocalho Ninar Estrela', 123456789012, 1, 2, 15.00, 'dimensoes: 15x8 cm, peso: 100g', 'observacoes: garantia de 6 meses'),
(2, 2, 'Kit carrinho hot wheels', 123456789013, 1, 2, 25.00, 'dimensoes: 8x8 cm, peso: 100g', 'observacoes: garantia de 6 meses'),
(3, 3, 'Mesa office ice-white',  123456789014, 1, 2, 515.00, 'dimensoes: 150x80cm, peso: 10kg', 'observacoes: garantia de 6 meses'),
(4, 4, 'Furadeira Makita HardWork',  123456789014, 1, 2, 115.00, 'dimensoes: 35x30 cm, peso: 1Kg', 'observacoes: garantia de 6 meses'),
(5, 5, 'Fritadeira Air Frier Phillips Wallita',  123456789015, 1, 2, 815.00, 'dimensoes: 215x80 cm, peso: 2Kg', 'observacoes: garantia de 6 meses'),
(6, 1, 'Cinta ABUltra Polishop', 123456789016, 1, 2, 315.00, 'dimensoes: 515x30 cm, peso: 300g', 'observacoes: garantia de 6 meses'),
(7, 2, 'Mouse c/ fio Logitec', 123456789017, 1, 2, 55.00, 'dimensoes: 15x8 cm, peso: 100g', 'observacoes: garantia de 6 meses');

SELECT * FROM produtos;
SELECT * FROM secoes;
SELECT * FROM redes_varejistas;

INSERT INTO pedidos (tipo_pagamento_id, produto_id, cliente_id, endereco_cliente_id, produtos, valor_frete, valor_pedido, observacoes)
VALUES
(1, 1, 1, 1, 'Chocalho Ninar Estrela', 17.00, 34.00, 'Comunicar a portaria'),
(2, 2, 2, 2, 'Kit carrinho hot wheels', 20.00, 50.00, 'Entregar antes das 18h'),
(3, 3, 3, 3, 'Mesa office ice-white', 25.00, 1030.00, 'Entregar pela manhã'),
(4, 4, 4, 4, 'Furadeira Makita HardWork', 18.00, 330.00, 'Entregar a noite'),
(1, 7, 5, 5, 'Mouse c/ fio Logitec', 15.00, 110.00, 'Entregar pela manhã');

INSERT INTO situacoes (nome_situacao, descricao)
VALUES
('A entrega do objeto está condicionada à composição Acompanhar BDR do lote', 'Acompanhar e aguardar um novo Status.'),
('A entrega não pode ser efetuada', 'Objeto será devolvido ao remetente.'),
('A entrega não pode ser efetuada - Cliente mudou-se', 'Objeto será devolvido ao remetente.'),
('Coleta ou entrega de objeto não efetuada', 'Será realizada nova tentativa de coleta ou entrega.'),
('Objeto entregue ao destinatário', 'Não é mais necessário prosseguir com o acompanhamento.');

SELECT * FROM situacoes;

INSERT INTO rastreios (situacao_id, pedido_id, codigo_rastreio, geo_lat, geo_long, data_rastreio, hora_rastreio)
VALUES
(1, 1, 'AA100833276BR', '28°05 56 S', '48°40 30 1', '2021-07-04', '08:00:00'),
(2, 2, 'AA100833277BR', '28°06 57 S', '49°41 30 1', '2021-07-05', '09:00:00'),
(3, 3, 'AA100833278BR', '30°06 56 S', '50°40 30 1', '2021-07-06', '10:00:00'),
(4, 4, 'AA100833279BR', '32°07 48 S', '55°41 32 0', '2021-07-07', '10:00:00'),
(5, 5, 'AA1008332791R', '35°08 48 S', '60°50 35 1', '2021-07-08', '11:00:00');

/*SELECT JOIN ENVOLVENDO TABELA PEDIDOS*/

CREATE VIEW RASTREIO_ENTREGAS AS
SELECT clientes.nome AS CLIENTE, enderecos.endereco AS LOGRADOURO, enderecos.cep AS CEP, enderecos.numero AS NUMERO, pedidos.produtos AS PEDIDO, rastreios.codigo_rastreio AS COD_RASTREIO, situacoes.nome_situacao AS SIT_ENTREGA
FROM clientes
JOIN enderecos ON clientes.id = enderecos.cliente_id
JOIN pedidos ON clientes.id = pedidos.cliente_id
JOIN rastreios ON pedidos.id = rastreios.pedido_id
JOIN situacoes ON situacoes.id = rastreios.situacao_id;

SELECT * FROM RASTREIO_ENTREGAS;
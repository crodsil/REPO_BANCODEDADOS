/*TESTE DE REQUISITOS DO PROJETO: O ARQUIVO DE SCRIPT DE RESPOSTA DEVE CONTER*/

/*CRIAÇÃO DO BANCO DE DADOS*/

CREATE DATABASE `cesta_coletiva`;
USE `cesta_coletiva`;

/*CRIACAO DAS TABELAS COM PKs e FKs - CRIAÇÃO FKs adicionais no final do script*/
/*DEMAIS REQUISITOS - VIDE ARQUIVO QUERIES_CESTA*/

CREATE TABLE clientes(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    plano_id INT NOT NULL,
    nome VARCHAR(20) NOT NULL,
    sobrenome VARCHAR(130) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    rg VARCHAR(15) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone1 VARCHAR(20) DEFAULT NULL,
    telefone2 VARCHAR(20) DEFAULT NULL,
    email VARCHAR(100) DEFAULT NULL,
    observacoes VARCHAR(150) DEFAULT NULL,
    login VARCHAR(50) NOT NULL,
    senha VARCHAR(8) NOT NULL
);

CREATE TABLE enderecos(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cliente_id INT NOT NULL,
    endereco VARCHAR(150) NOT NULL,
    bairro VARCHAR(150) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    complemento VARCHAR(150) DEFAULT NULL,
    cidade VARCHAR(150) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    observacoes VARCHAR(150) DEFAULT NULL,
	FOREIGN KEY (`cliente_id`)
	REFERENCES clientes(`id`)
);

CREATE TABLE planos (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_plano VARCHAR(20) NOT NULL,
    ativo TINYINT NOT NULL
);

CREATE TABLE pedidos(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    tipo_pagamento_id INT NOT NULL,
    produto_id INT NOT NULL,
	cliente_id INT NOT NULL,
    endereco_cliente_id INT NOT NULL,
    produtos VARCHAR(150) NOT NULL,
    valor_frete DECIMAL(4,2) NOT NULL,
    valor_pedido DECIMAL(9,2) NOT NULL,
	observacoes VARCHAR(150) DEFAULT NULL,
    
    FOREIGN KEY (`cliente_id`)
    REFERENCES clientes(`id`),
    
    FOREIGN KEY (`endereco_cliente_id`)
    REFERENCES enderecos(`id`)
);

CREATE TABLE rastreios (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	situacao_id INT NOT NULL,
	pedido_id INT NOT NULL,
	codigo_rastreio VARCHAR(13) NOT NULL,
	geo_lat VARCHAR(14) NOT NULL,
	geo_long VARCHAR(14) NOT NULL,
    data_rastreio DATE NOT NULL,
    hora_rastreio TIME NOT NULL,
    
    FOREIGN KEY (`pedido_id`)
	REFERENCES pedidos(`id`)
);

CREATE TABLE situacoes (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nome_situacao VARCHAR(150) NOT NULL,
    descricao VARCHAR(150) DEFAULT NULL
);

CREATE TABLE tipos_pagamento (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    ativo TINYINT NOT NULL
);

CREATE TABLE secoes (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    descricao VARCHAR(150) NOT NULL,
    observacoes VARCHAR(150) DEFAULT NULL
);

CREATE TABLE produtos(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    secao_id INT NOT NULL,
    varejista_id INT NOT NULL,
    descricao VARCHAR(150) NOT NULL,
    cod_barras VARCHAR(44) NOT NULL,
    disponibilidade TINYINT NOT NULL,
    quantidade TINYINT NOT NULL,
    valor_unit DECIMAL(5,2) NOT NULL,
    especificacoes VARCHAR(150) NOT NULL,
    observacoes VARCHAR(150) DEFAULT NULL
);

CREATE TABLE redes_varejistas (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	cnpj VARCHAR(18) NOT NULL,
    razao_social VARCHAR(255) NOT NULL,
    nome_fantasia VARCHAR(255) NOT NULL,
    foto VARCHAR(150) DEFAULT NULL,
    nome_representante VARCHAR(150) NOT NULL,
    email_representante VARCHAR(100) NOT NULL,
    classificacao TINYINT DEFAULT NULL,
    observacoes VARCHAR(150) DEFAULT NULL
);

CREATE TABLE centros_distribuicao(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    varejista_id INT NOT NULL,
    cnpj VARCHAR(18) NOT NULL,
    razao_social VARCHAR(255) NOT NULL,
    nome_fantasia VARCHAR(255) NOT NULL,
    foto VARCHAR(150) DEFAULT NULL,
    nome_responsavel VARCHAR(150) NOT NULL,
    email_responsavel VARCHAR(100) NOT NULL,
    horario_ini TIME NOT NULL,
    horario_fin TIME NOT NULL,
    observacoes VARCHAR(150) DEFAULT NULL
);

CREATE TABLE enderecos_cd(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cd_id INT NOT NULL,
    endereco VARCHAR(150) NOT NULL,
    numero VARCHAR(20),
    bairro VARCHAR(150) NOT NULL,
    cidade VARCHAR(150) NOT NULL,
    estado CHAR(2),
    cep VARCHAR(10),
    observacoes VARCHAR(150) DEFAULT NULL
);

/*CRIAÇÃO DAS FKs DEPENDENTES*/

ALTER TABLE clientes ADD
	FOREIGN KEY (`plano_id`)
	REFERENCES planos(`id`);

ALTER TABLE pedidos
	ADD FOREIGN KEY (`produto_id`)
	REFERENCES produtos(`id`);

ALTER TABLE pedidos
	ADD FOREIGN KEY (`tipo_pagamento_id`)
	REFERENCES tipos_pagamento(`id`);

ALTER TABLE rastreios
	ADD FOREIGN KEY (`situacao_id`)
	REFERENCES situacoes(`id`);

ALTER TABLE produtos
	ADD FOREIGN KEY (`secao_id`)
	REFERENCES secoes(`id`);

ALTER TABLE produtos
	ADD FOREIGN KEY (`varejista_id`)
	REFERENCES redes_varejistas(`id`);

ALTER TABLE centros_distribuicao
	ADD FOREIGN KEY (`varejista_id`)
	REFERENCES redes_varejistas(`id`);

ALTER TABLE enderecos_cd
	ADD FOREIGN KEY (`cd_id`)
	REFERENCES centros_distribuicao(`id`);
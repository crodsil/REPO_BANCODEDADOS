-- Comandos DML
-- DROP E ALTER

CREATE SCHEMA `banco_teste`;

CREATE TABLE usuarios (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    sobrenome VARCHAR(130),
    email VARCHAR(150) NOT NULL UNIQUE,
    data_nascimento DATE
);

ALTER TABLE usuario
ADD telefone VARCHAR(50);

SELECT * FROM usuarios;
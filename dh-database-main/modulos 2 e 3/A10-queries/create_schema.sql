CREATE SCHEMA `playground`;

-- Comando shar codigo
-- É melhor criar a tabela toda certa do que dar ALTER TABLE
-- ALTER TABLE consome performance do banco
-- Se criar tabela errada, e ainda da estiver vazia dê DROP TABLE e crie DENOVO - de forma CORRETA


CREATE TABLE `playground`.`categorias` (

`idcategoria` INT NOT NULL,
`nome` VARCHAR(100) NULL,

PRIMARY KEY (`idcategoria`)
);

CREATE TABLE `playground`.`usuarios` (

	`idusuario`INT NOT NULL,
    `nome` VARCHAR(100) NULL,
    `apelido`VARCHAR(100) NULL,
    `email` VARCHAR(50) NULL,
    `categoria` INT NULL,
    
    PRIMARY KEY (`idusuario`),
    INDEX `FKcategoria_idx` (`categoria` ASC) VISIBLE,
    CONSTRAINT `FKcategoria`
		FOREIGN KEY (`categoria`)
        REFERENCES `playground`.`categorias` (`idcategoria`)
);

CREATE TABLE `playground`.`curso` (

	`idcurso` INT NOT NULL,
    `titulo` VARCHAR(45) NULL,
    `descricao` VARCHAR(100) NULL,
    
    PRIMARY KEY (`idcurso`)
);

CREATE TABLE `playground`.`usuarios_curso` (

	`id` INT NOT NULL,
    `usuario` INT NULL,
    `curso` INT NULL,
    `datadeinscricao` DATE NULL,
    
    PRIMARY KEY (`id`),
    INDEX `usuario_idx` (`usuario` ASC) VISIBLE,
    INDEX `curso_idx` (`curso` ASC) VISIBLE,
    CONSTRAINT `usuario`
		FOREIGN KEY (`usuario`)
        REFERENCES `playground`.`usuarios` (`idusuario`),
	CONSTRAINT `curso`
		FOREIGN KEY (`curso`)
        REFERENCES `playground`.`curso` (`idcurso`)
);

-- Sempre usar aspas para dados do INSERT INTO
-- Tanto faz, aspas simples '' ou dupla ""

INSERT INTO `playground`.`categorias` (`idcategoria`, `nome`)
VALUES
(1, "Aluno"),
(2, "Docente"),
(3, "Editor"),
(4, "Administrador"),
(5, "Gestor");

SELECT * FROM `playground`.`categorias`;

INSERT INTO `playground`.`usuarios` (`idusuario`, `nome`, `apelido`, `email`, `categoria`)
VALUES
(1, 'Felipe', 'Moreira', 'felipe.saint@gmail.com', 1),
(2, 'Franciele', 'Moura', 'fran_moura@gmail.com', 1),
(3, 'Yana', 'Silva', 'Yana.saint@gmail.com', 2),
(4, 'Fernanda', 'Matos', 'Fernanda.saint@gmail.com', 2),
(5, 'Mauricio', 'Santos', 'Mauricio_Santos@gmail.com', 1);

SELECT * FROM `playground`.`usuarios`;

INSERT INTO `playground`.`curso` (`idcurso`, `titulo`, `descricao`)
VALUES
(1, 'Certified Tech Developer', 'Formação para desenvolvedor Full-Cicle'),
(2, 'Desenvolvedor Back-end', 'Formação para futuro desenvolvedor Java Back-end'),
(3, 'Desenvolvedor Full-stack', 'Formação para futuro desenvolvedor Node.Js'),
(4, 'Desenvolvedor Mobile', 'Formação para futuro desenvolvedor Swift'),
(5, 'Desewnvolvedor Front-end', 'Formação para futuro desenvolvedor React');

SELECT * FROM `playground`.`curso`;

INSERT INTO `playground`.`usuarios_curso` (`id`, `usuario`, `curso`, `datadeinscricao`)
VALUES
(1, 1, 1, '2021-01-25'),
(2, 2, 5, '2021-06-16'),
(3, 3, 4, '2021-06-15'),
(4, 4, 3, '2021-05-15'),
(5, 5, 2, '2021-02-14');

-- Comandos de suporte

SELECT * FROM `playground`.`usuarios_curso`;

SELECT * FROM playground.usuarios;

UPDATE usuarios SET
-- idusuario = 4 WHERE idusuario = 5;
categoria = 2 WHERE categoria = 6;

UPDATE categorias SET
idcategoria = 4 WHERE idcategoria = 6;
-- nome = 'Editor' WHERE idcategoria = 5;

SELECT * FROM `playground`.`categorias`;
SELECT * FROM `playground`.`usuarios`;

-- Tarefa: inserir ao menos 5 elementos em todas as tabelas e enviar print do script (INSERTS)
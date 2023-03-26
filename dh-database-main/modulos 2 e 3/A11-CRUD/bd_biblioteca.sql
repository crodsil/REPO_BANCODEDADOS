CREATE DATABASE `biblioteca`;
USE biblioteca;
CREATE TABLE `usuarios`(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50),
  email VARCHAR(100),
  telefone VARCHAR (20)
);
CREATE TABLE livros (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR (100)
);
CREATE TABLE emprestimos (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  data_emprest DATE,
  data_devolucao DATE,
  id_usuarios INT,
  id_livros INT,
  FOREIGN KEY (id_usuarios) REFERENCES usuarios (id),
  FOREIGN KEY (id_livros) REFERENCES livros (id)
);
INSERT INTO
  usuarios (nome, email, telefone)
VALUES
  (
    "Felipe",
    "felipe@digitalhouse.com.br",
    12988397209
  ),
  (
    "Pedro",
    "Pedro@digitalhouse.com.br",
    12988397208
  ),
  (
    "silas",
    "Silas@digitalhouse.com.br",
    12988397207
  );
INSERT INTO
  livros (titulo)
VALUES
  ("Diario de um banana"),
  ("O senhor dos aneis"),
  ("Verdade tropical");
INSERT INTO
  emprestimos (
    data_emprest,
    data_devolucao,
    id_usuarios,
    id_livros
  )
VALUES
  ("2021-06-17", "2021-06-09", 2, 3);
 
  SELECT * FROM emprestimos;

  SELECT nome FROM usuarios
  WHERE id = 1;

  SELECT titulo FROM livros
  WHERE id = 1;

  UPDATE usuarios SET 
  nome = "Silas" WHERE nome = "silas";
  
  DELETE FROM emprestimos
  WHERE id_usuarios = 3 AND id_livros = 2;
  
  DROP DATABASE biblioteca;
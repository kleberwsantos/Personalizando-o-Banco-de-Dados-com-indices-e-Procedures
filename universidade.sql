CREATE DATABASE universidade;

USE universidade; 

CREATE TABLE Pessoa (
    idPessoa int primary key auto_increment,
    Nome varchar(20) NOT NULL,
    Sobrenome varchar(20) NOT NULL,
    CPF varchar(11) UNIQUE NOT NULL,
    Endereco varchar(100),
    Contato varchar(20)
);

CREATE TABLE Aluno (
    idAluno int primary key auto_increment,
    Matrícula varchar(45) UNIQUE NOT NULL,
    idPessoa int,
    foreign key (idPessoa) references Pessoa(idPessoa)
    ON DELETE CASCADE
);

CREATE TABLE Curso_Extensao (
    idExtensao int primary key,
    Nome varchar(100) NOT NULL
);

CREATE TABLE Extensao_Aluno (
    idAluno int,
    idCurso int,
    foreign key (idAluno) references Aluno(idAluno)
    ON DELETE CASCADE,
    foreign key (idCurso) references Curso_Extensao(idExtensao)
    ON DELETE CASCADE,
    primary key (idAluno, idCurso)
);

CREATE TABLE Disciplina (
    idDisciplina int primary key,
    Nome varchar(100) NOT NULL
);

CREATE TABLE Pre_Requisito (
    idDisciplina int,
    idPreRequisito int,
    foreign key (idDisciplina) references Disciplina(idDisciplina)
    ON DELETE CASCADE,
    foreign key (idPreRequisito) references Disciplina(idDisciplina)
    ON DELETE CASCADE,
    primary key (idDisciplina, idPreRequisito)
);

CREATE TABLE Professor (
    idProfessor int primary key,
    idPessoa int,
    foreign key (idPessoa) references Pessoa(idPessoa)
    ON DELETE CASCADE
);

CREATE TABLE Departamento (
    idDepartamento int primary key,
    Nome varchar(100) NOT NULL
);

CREATE TABLE Curso (
    idCurso int primary key,
    Nome varchar(100) NOT NULL,
    idDepartamento int,
    foreign key (idDepartamento) references Departamento(idDepartamento) ON DELETE CASCADE
);

CREATE TABLE Disciplina_Curso (
    idDisciplina int,
    idCurso int,
    foreign key (idDisciplina) references Disciplina(idDisciplina)
    ON DELETE CASCADE,
    foreign key (idCurso) references Curso(idCurso)
    ON DELETE CASCADE,
    primary key (idDisciplina, idCurso)
);

CREATE TABLE Oferta_Disciplina (
    idOfertaDis int primary key,
    idDisciplina int,
    idProfessor int,
    Periodo varchar(10) NOT NULL,
    foreign key (idDisciplina) references Disciplina(idDisciplina)
    ON DELETE CASCADE,
    foreign key (idProfessor) references Professor(idProfessor)
    ON DELETE CASCADE
);

-- Inserindo dados na tabela Pessoa
INSERT INTO Pessoa (Nome, Sobrenome, CPF, Endereco, Contato) VALUES
                   ('João', 'Silva', '12345678901', 'QNM 34, 123', '61987654321'),
                   ('Maria', 'Pereira', '23456789012', 'QNO 06, 456', '61976543210'),
                   ('Carlos', 'Oliveira', '34567890123', 'QNN 17, 789', '61965432109'),
                   ('Ana', 'Fernandes', '45678901234', 'QNP 05, 012', '61954321098'),
                   ('Pedro', 'Santos', '56789012345', 'QSD 01, 345', '61943210987');

-- Inserindo dados na tabela Aluno
INSERT INTO Aluno (Matrícula, idPessoa) VALUES
				  ('20220001', 1),
			      ('20220002', 2),
                  ('20220003', 3),
				  ('20220004', 4),
                  ('20220005', 5);

-- Inserindo dados na tabela Curso_Extensao
INSERT INTO Curso_Extensao (idExtensao, Nome) VALUES
						   (1, 'Curso de Extensão em Teoria de Conjuntos'),
                           (2, 'Curso de Extensão em Astronomia'),
                           (3, 'Curso de Extensão em Farmácia'),
                           (4, 'Curso de Extensão em Biologia Molecular'),
						   (5, 'Curso de Extensão em História Antiga');

-- Inserindo dados na tabela Extensao_Aluno
INSERT INTO Extensao_Aluno (idAluno, idCurso) VALUES
                           (1, 1),
                           (2, 2),
                           (3, 3),
                           (4, 4),
                           (5, 5);

-- Inserindo dados na tabela Disciplina
INSERT INTO Disciplina (idDisciplina, Nome) VALUES
                       (1, 'Matemática'),
				       (2, 'Física'),
                       (3, 'Química'),
                       (4, 'Biologia'),
                       (5, 'História');

-- Inserindo dados na tabela Pre_Requisito
INSERT INTO Pre_Requisito (idDisciplina, idPreRequisito) VALUES
                          (2, 1),
                          (3, 1),
                          (4, 1),
                          (5, 1),
                          (1, 2);

-- Inserindo dados na tabela Professor
INSERT INTO Professor (idProfessor, idPessoa) VALUES
					  (1, 1),
                      (2, 2),
                      (3, 3),
                      (4, 4),
                      (5, 5);

-- Inserindo dados na tabela Departamento
INSERT INTO Departamento (idDepartamento, Nome) VALUES
                         (1, 'Departamento de Matemática'),
                         (2, 'Departamento de Física'),
                         (3, 'Departamento de Química'),
                         (4, 'Departamento de Biologia'),
                         (5, 'Departamento de História');

-- Inserindo dados na tabela Curso
INSERT INTO Curso (idCurso, Nome, idDepartamento) VALUES
                  (1, 'Curso de Teoria de Conjuntos', 1),
                  (2, 'Curso de Astronomia', 2),
                  (3, 'Curso de Farmácia', 3),
                  (4, 'Curso de Biologia Molecular', 4),
                  (5, 'Curso de História Antiga', 5);

-- Inserindo dados na tabela Disciplina_Curso
INSERT INTO Disciplina_Curso (idDisciplina, idCurso) VALUES
                             (1, 1),
                             (2, 2),
                             (3, 3),
                             (4, 4),
                             (5, 5);

-- Inserindo dados na tabela Oferta_Disciplina
INSERT INTO Oferta_Disciplina (idOfertaDis, idDisciplina, idProfessor, Periodo) VALUES
                              (1, 1, 1, '2024.1'),
                              (2, 2, 2, '2024.1'),
                              (3, 3, 3, '2024.1'),
                              (4, 4, 4, '2024.1'),
                              (5, 5, 5, '2024.1');

-- Procedure                              
DELIMITER //
CREATE PROCEDURE ManagePessoas(IN op INT, IN id INT, IN Nome VARCHAR(20), IN Sobrenome VARCHAR(20), IN CPF VARCHAR(11), IN Endereco VARCHAR(100), IN Contato VARCHAR(20))
BEGIN
    CASE op
        WHEN 1 THEN -- Select
            SELECT * FROM Pessoa WHERE idPessoa = id;
        WHEN 2 THEN -- Update
            UPDATE Pessoa SET Nome = Nome, Sobrenome = Sobrenome, CPF = CPF, Endereco = Endereco, Contato = Contato WHERE idPessoa = id;
        WHEN 3 THEN -- Delete
            DELETE FROM Pessoa WHERE idPessoa = id;
        WHEN 4 THEN -- Insert
            INSERT INTO Pessoa(Nome, Sobrenome, CPF, Endereco, Contato) VALUES(Nome, Sobrenome, CPF, Endereco, Contato);
    END CASE;
END //
DELIMITER ;
                              
-- Chamando procedure
CALL ManagePessoas(4, 1 ,'Antônio', 'Silva', '12345678999', 'QNM 34, 123', '61987654321');


show databases;
show tables;
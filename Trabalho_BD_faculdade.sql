CREATE DATABASE FaculdadeDB;
USE FaculdadeDB;

CREATE TABLE Alunos (
    aluno_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    matricula INT UNIQUE NOT NULL,
    curso_id INT,
    turma_id INT,
    FOREIGN KEY (curso_id) REFERENCES Cursos(curso_id),
    FOREIGN KEY (turma_id) REFERENCES Turmas(turma_id)
);

CREATE TABLE Cursos (
    curso_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(100) NOT NULL,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    carga_horaria INT NOT NULL
);

CREATE TABLE Disciplinas (
    disciplina_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL
);

CREATE TABLE Professores (
    professor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    area_especialidade VARCHAR(100) NOT NULL
);

CREATE TABLE Turmas (
    turma_id INT PRIMARY KEY AUTO_INCREMENT,
    disciplina_id INT,
    professor_id INT,
    semestre INT NOT NULL,
    FOREIGN KEY (disciplina_id) REFERENCES Disciplinas(disciplina_id),
    FOREIGN KEY (professor_id) REFERENCES Professores(professor_id)
);

CREATE TABLE Notas (
    nota_id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT,
    turma_id INT,
    nota FLOAT NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES Alunos(aluno_id),
    FOREIGN KEY (turma_id) REFERENCES Turmas(turma_id)
);

CREATE TABLE TurmaDisciplina (
	turma_id INT,
    disciplina_id INT,
    FOREIGN KEY (turma_id) REFERENCES Turmas(turma_id),
    FOREIGN KEY (disciplina_id) REFERENCES Disciplinas(disciplina_id)
    );
    
CREATE TABLE TurmaProfessor(
	turma_id INT,
    professor_id INT,
    FOREIGN KEY (turma_id) REFERENCES Turmas(turma_id),
    FOREIGN KEY (professor_id) REFERENCES Professores(professor_id)
    );
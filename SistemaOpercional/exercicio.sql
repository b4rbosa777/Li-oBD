--ddl

CREATE TABLE alunos(
	cpf int PRIMARY KEY,
	nome_aluno VARCHAR (50) not null,
	idade int ,
	rua text,
	numero varchar(10),
	bairro varchar(20),
	cidade varchar(20),
	estado varchar(20),
	cep int,
	pais varchar(30)
)

ALTER TABLE alunos ALTER COLUMN
cpf type varchar(15)

CREATE TABLE telefones (
	cpf varchar(15) references alunos,
	ddd int,
	numero int,
	cod_pais int
)

DROP TABLE telefones CASCADE 

CREATE TABLE emails(
	cpf varchar (15)REFERENCES alunos,
	email varchar (64),
	dominio varchar (20)
)

CREATE TABLE departamentos(
	id_dpto serial primary key,
	sigla_dpto varchar(4),
	nome_dpto varchar (10)
)

CREATE TABLE cursos(
	id_curso serial primary key,
	nome_curso varchar (10),
	id_dpto serial references departamentos
)

CREATE TABLE matriculas(
	ra serial primary key,
	cpf varchar (15) references alunos,
	status varchar(10),
	id_curso int references cursos
)

CREATE TABLE disciplinas(
	id_disciplina serial primary key,
	nome_disciplina varchar (10),	
	optativa boolean
)
CREATE TABLE cursos_disciplinas(
	id_curso serial references cursos,
	id_disciplinas serial references disciplinas
)

CREATE TABLE matriculas_disciplinas(
	ra serial references matriculas,
	id_disciplina serial references disciplinas

)

--dml

INSERT INTO alunos (cpf, nome_aluno, idade, rua, numero, bairro, cidade, estado, cep, pais)
VALUES
(12345678900, 'João Silva', 25, 'Rua A', '123', 'Centro', 'Cidade A', 'Estado A', 12345678, 'Brasil'),
(23456789011, 'Maria Souza', 30, 'Rua B', '456', 'Bairro X', 'Cidade B', 'Estado B', 23456789, 'Brasil'),
(34567890122, 'Carlos Oliveira', 20, 'Rua C', '789', 'Bairro Y', 'Cidade C', 'Estado C', 34567890, 'Brasil'),
(45678901233, 'Ana Santos', 22, 'Rua D', '1011', 'Bairro Z', 'Cidade D', 'Estado D', 45678901, 'Brasil'),
(56789012344, 'Fernanda Costa', 28, 'Rua E', '1213', 'Centro', 'Cidade E', 'Estado E', 56789012, 'Brasil'),
(67890123455, 'Paulo Pereira', 24, 'Rua F', '1415', 'Bairro W', 'Cidade F', 'Estado F', 67890123, 'Brasil'),
(78901234566, 'Mariana Oliveira', 26, 'Rua G', '1617', 'Bairro V', 'Cidade G', 'Estado G', 78901234, 'Brasil'),
(89012345677, 'Pedro Almeida', 29, 'Rua H', '1819', 'Bairro U', 'Cidade H', 'Estado H', 89012345, 'Brasil'),
(90123456788, 'Laura Mendes', 27, 'Rua I', '2021', 'Bairro T', 'Cidade I', 'Estado I', 90123456, 'Brasil'),
(12345678999, 'Juliana Lima', 23, 'Rua J', '2223', 'Bairro S', 'Cidade J', 'Estado J', 12345678, 'Brasil');

INSERT INTO telefones (cpf, ddd, numero, cod_pais)
VALUES
('12345678900', 11, 987654321, 55),
('23456789011', 21, 123456789, 55),
('34567890122', 31, 456789012, 55),
('45678901233', 41, 789012345, 55),
('56789012344', 51, 234567890, 55),
('67890123455', 61, 567890123, 55),
('78901234566', 71, 890123456, 55),
('89012345677', 81, 123456789, 55),
('90123456788', 91, 234567890, 55),
('12345678999', 31, 345678901, 55);

INSERT INTO emails (cpf, email, dominio)
VALUES
('12345678900', 'joao@example.com', 'example.com'),
('23456789011', 'maria@example.com', 'example.com'),
('34567890122', 'carlos@example.com', 'example.com'),
('45678901233', 'ana@example.com', 'example.com'),
('56789012344', 'fernanda@example.com', 'example.com'),
('67890123455', 'paulo@example.com', 'example.com'),
('78901234566', 'mariana@example.com', 'example.com'),
('89012345677', 'pedro@example.com', 'example.com'),
('90123456788', 'laura@example.com', 'example.com'),
('12345678999', 'juliana@example.com', 'example.com');


INSERT INTO departamentos (sigla_dpto, nome_dpto)
VALUES
('DPT1', 'Dpto 1'),
('DPT2', 'Dpto 2'),
('DPT3', 'Dpto 3'),
('DPT4', 'Dpto 4'),
('DPT5', 'Dpto 5'),
('DPT6', 'Dpto 6'),
('DPT7', 'Dpto 7'),
('DPT8', 'Dpto 8'),
('DPT9', 'Dpto 9'),
('DPT0', 'Dpto 10');

INSERT INTO cursos (nome_curso, id_dpto)
VALUES
('Curso 1', 1),
('Curso 2', 2),
('Curso 3', 3),
('Curso 4', 4),
('Curso 5', 5),
('Curso 6', 6),
('Curso 7', 7),
('Curso 8', 8),
('Curso 9', 9),
('Curso 10', 10);

INSERT INTO matriculas (cpf, status, id_curso)
VALUES
('12345678900', 'Ativa', 1),
('23456789011', 'Ativa', 2),
('34567890122', 'Ativa', 3),
('45678901233', 'Ativa', 4),
('56789012344', 'Ativa', 5),
('67890123455', 'Ativa', 6),
('78901234566', 'Ativa', 7),
('89012345677', 'Ativa', 8),
('90123456788', 'Ativa', 9),
('12345678999', 'Ativa', 10);

INSERT INTO disciplinas (nome_disciplina, optativa)
VALUES
('calculo', FALSE),
('portugues', TRUE),
('ciencias', FALSE),
('historia', TRUE),
('literatura', FALSE),
('quimica', TRUE),
('fisica', FALSE),
('biologia', TRUE),
('matematica', FALSE),
('geo', TRUE);


-- Dado o RA ou o Nome do Aluno, buscar no BD todos os demais dados do aluno.
SELECT * FROM alunos 
WHERE nome_aluno = 'Laura Mendes'

-- Dado o nome de um departamento, exibir o nome de todos os cursos associados a ele.
SELECT * FROM cursos WHERE id_dpto = '3'
--Dado o nome de uma disciplina, exibir a qual ou quais cursos ela pertence.
SELECT * FROM cursos_disciplinas INNER JOIN disciplinas ON nome_disciplina= 'matematica'

-- Dado o CPF de um aluno, exibir quais disciplinas ele está cursando.
SELECT cpf, id_disciplina, nome_disciplina FROM alunos INNER JOIN disciplinas ON cpf = '12345678900'

-- Filtrar todos os alunos matriculados em um determinado curso
SELECT nome_aluno, cpf, nome_curso FROM alunos INNER JOIN cursos ON nome_curso = 'Curso 1'

-- Filtrar todos os alunos matriculados em determinada disciplina
SELECT nome_aluno, cpf, nome_disciplina, id_disciplina FROM alunos INNER JOIN disciplinas ON nome_disciplina = 'geo'

-- Filtrar alunos formados.
SELECT nome_aluno FROM alunos INNER JOIN matriculas on status = 'Ativa'


-- Filtrar alunos ativos
SELECT nome_aluno FROM alunos INNER JOIN matriculas ON status = 'Ativa'

-- Apresentar a quantidade de alunos ativos por curso.
SELECT c.nome_curso,
       (SELECT COUNT(*)
        FROM matriculas m
        WHERE m.id_curso = c.id_curso
          AND m.status = 'Ativa') AS quantidade_alunos_ativos
FROM cursos c;

-- Apresentar a quantidade de alunos ativos por disciplina.
SELECT d.nome_disciplina, COUNT(md.ra) AS quantidade_alunos
FROM disciplinas d
LEFT JOIN matriculas_disciplinas md ON d.id_disciplina = md.id_disciplina
LEFT JOIN matriculas m ON md.ra = m.ra
WHERE m.status = 'Ativa'
GROUP BY d.nome_disciplina;


INSERT INTO matriculas_disciplinas (ra, id_disciplina)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

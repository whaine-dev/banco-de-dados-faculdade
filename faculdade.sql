CREATE DATABASE universidade;

USE universidade
CREATE TABLE titulacaomax(
    id_titular INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
)CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE professor(
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_titular INT NOT NULL,
    FOREIGN KEY (id_titular) REFERENCES titulacaomax(id_titular)
)CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE crachar(
    id_crachar INT AUTO_INCREMENT PRIMARY KEY,
    num_serie VARCHAR(50) NOT NULL UNIQUE,
    id_professor INT NOT NULL UNIQUE,
    FOREIGN KEY(id_professor) REFERENCES professor(id_professor)
)CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE disciplina(
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_hr VARCHAR(10) NOT NULL
)CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE aluno(
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(50) NOT NULL UNIQUE,
    id_monitor INT,
    FOREIGN KEY(id_monitor) REFERENCES aluno(id_aluno)
)CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE monitor(
    id_monitor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(4) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    id_professor INT NOT NULL,
    FOREIGN KEY(id_professor) REFERENCES professor(id_professor)
)CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE telefone(
    id_telefone INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(15) NOT NULL,
    id_monitor INT NOT NULL,
    FOREIGN KEY(id_monitor) REFERENCES monitor(id_monitor)
)CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE ministra(
    id_professor INT NOT NULL,
    id_disciplina INT NOT NULL,
    PRIMARY KEY(id_professor, id_disciplina),
    FOREIGN KEY(id_professor) REFERENCES professor(id_professor),
    FOREIGN KEY(id_disciplina) REFERENCES disciplina(id_disciplina)
)CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE matricula (
    dt_matricula DATE NOT NULL,
    id_disciplina INT NOT NULL,
    id_aluno INT NOT NULL,
    FOREIGN KEY(id_disciplina) REFERENCES disciplina(id_disciplina),
    FOREIGN KEY(id_aluno) REFERENCES aluno(id_aluno)
)CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE requerimento(
    num_requerimento INT AUTO_INCREMENT PRIMARY KEY,
    dt_num_re DATE NOT NULL,
    tipo ENUM('trancamneto', 'solicitação', 'outros'),
    status ENUM('Aerto', 'Em análise', 'concluído', 'cancelado') NOT NULL,
    id_aluno INT NOT NULL,
    FOREIGN KEY(id_aluno) REFERENCES aluno(id_aluno)
)CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO titulacaomax VALUES 
(null, "Graduação"),
(null, "Especialização"),
(null, "Mestrado"),
(null, "Doutorado"),
(null, "Pós-doutorado");


INSERT INTO professor VALUES
(null, "Carlos Luiz", 1),
(null, "Ana Maria", 2),
(null, "Caio Rodrigues", 4),
(null, "Lucas Santana", 3),
(null, "Renato Araújo", 5),
(null, "Maísa Luísa", 3),
(null, "Felipe Martins", 2),
(null, "Juliana Oliveira", 1);

INSERT INTO crachar VALUES
(NULL, "BDG-1432", 1),
(NULL, "JSD-1732", 2),
(NULL, "KDF-3487", 3),
(NULL, "BAS-2364", 4),
(NULL, "STR-3862", 5),
(NULL, "ASN_2983", 6),
(NULL, "ALS-1923", 7),
(NULL, "MSH-2374", 8);
 
 INSERT INTO monitor VALUES 
(NULL, "ana paula", "Rua Alexandre Bell", "305", "COHAB", 1),
(NULL, "fabiana renata", "Rua Gurupá", "489", "Casa Amarela", 2),
(NULL, "carlos henrique", "Rua Raul Leoni", "126", "Imbiribeira", 3),
(NULL, "maria alina", "Rua Mostardas", "229", "Torrões", 1),
(NULL, "lucas santos", "Rua General Adauto Gomes Barbosa", "536", "Várzea", 5),
(NULL, "taty maria", "Rua Dom Expedito Lopes", "165", "San Martin", 8),
(NULL, "bruno santos", "Travessa Alto do Eucalipto", "775", "Brejo de Beberibe", 7),
(NULL, "caio silva", "Rua Padre Miguelinho", "151", "Torreão", 5);

INSERT INTO telefone VALUES
(NULL, "81 3805-2073", 1),
(NULL, "81 98139-3655", 2),
(NULL, "81 98139-3655", 3),
(NULL, "81 98209-2559", 4),
(NULL, "81 98381-5072", 5),
(NULL, "81 2635-0806", 6),
(NULL, "81 3515-4694", 7),
(NULL, "81 99243-1940", 8),
(NULL, "81 99235-3704", 4),
(NULL, "81 2791-4972", 3),
(NULL, "81 99235-3704", 2);

INSERT INTO disciplina VALUES
(NULL, "Banco de Dados", "80h"),
(NULL, "Front-End", "100h"),
(NULL, "Algoritimo e Lógica", "90h"),
(NULL, "Linguagem em C", "90h"),
(NULL, "Design UX/UI", "50h"),
(NULL, "Gestão de Projeto", "40h"),
(NULL, "Linguagem em Rust", "120h"),
(NULL, "Linguagem em Python", "100h"),
(NULL, "Inovação", "80h"),
(NULL, "English basic", "70h"),
(NULL, "Linguagem em Java", "140h");

INSERT INTO ministra VALUES
(1 , 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(4, 5),
(5, 2),
(7, 1),
(8, 1),
(4, 2),
(1, 2);

INSERT INTO aluno VALUES
(NULL, "ana paula", "2834-HBF", NULL),
(NULL, "lucas brito", "2874-BBV", 1),
(NULL, "ana maria", "2845-NSD", 1),
(NULL, "paulo antônio", "7832-GBE", 1),
(NULL, "Leonardo henrique", "2093-UJR", 1),
(NULL, "keven whaine", "7634-TED", 1),
(NULL, "joel brito", "7634-NDH", 1),
(NULL, "Lucas Santana", "7928-BGS", NULL),
(NULL, "Fabiana renata", "8734-BER", 8),
(NULL, "luiz amaral", "9743-TED", 8),
(NULL, "ana taty", "8732-INH", 8),
(NULL, "Gabril snatos", "8364-JNS", 8),
(NULL, "Maísa Luísa", "7241-BVA", NULL),
(NULL, "Eduarda maria", "9876-AFS", 13),
(NULL, "kawan fereira", "9354-GVF", 13),
(NULL, "Rayanne freires", "8764-RTE", 13);

INSERT INTO requerimento VALUES
(NULL, "2026-03-12", "trancamneto", "Aceito", 3),
(NULL, "2026-04-21", "solicitação", "Em análise", 3),
(NULL, "2026-01-08", "outros", "cancelado", 4),
(NULL, "2026-09-23", "trancamneto", "Em análise", 5),
(NULL, "2026-09-02", "outros", "Em análise", 11);

INSERT INTO matricula VALUES
("2026-06-10", 1, 1),
("2026-06-10", 2, 2),
("2026-06-10", 3, 3),
("2026-06-10", 4, 4),
("2026-06-10", 5, 5),
("2026-06-10", 6, 6),
("2026-06-10", 7, 7),
("2026-06-10", 8, 8),
("2026-06-10", 7, 9),
("2026-06-10", 4, 10),
("2026-06-10", 3, 11),
("2026-06-10", 2, 12),
("2026-06-10", 3, 13),
("2026-06-10", 2, 14),
("2026-06-10", 3, 15),
("2026-06-10", 2, 16),
("2026-06-10", 4, 1),
("2026-06-10", 5, 10),
("2026-06-10", 6, 7),
("2026-06-10", 7, 3);
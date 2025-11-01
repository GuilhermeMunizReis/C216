-- ==============================================
-- Script de Criação Completa do Banco Catálogo
-- ==============================================

-- Cria o banco (opcional, se ainda não existir)
-- ATENÇÃO: só funciona se não estiver conectado dentro dele
-- CREATE DATABASE catalogo_filmes;
-- \c catalogo_filmes;

-- Limpeza total para evitar conflitos
DROP TABLE IF EXISTS avaliacao CASCADE;
DROP TABLE IF EXISTS filme CASCADE;
DROP TABLE IF EXISTS usuario CASCADE;

DROP SEQUENCE IF EXISTS avaliacao_id_seq CASCADE;
DROP SEQUENCE IF EXISTS filme_id_seq CASCADE;
DROP SEQUENCE IF EXISTS usuario_id_seq CASCADE;

-- ==============================================
-- Tabelas e Sequências
-- ==============================================

CREATE SEQUENCE public.usuario_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE public.filme_id_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE public.avaliacao_id_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE public.usuario (
    id integer PRIMARY KEY DEFAULT nextval('usuario_id_seq'),
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL DEFAULT '123',
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE public.filme (
    id integer PRIMARY KEY DEFAULT nextval('filme_id_seq'),
    titulo VARCHAR(200) NOT NULL,
    ano_lancamento INT CHECK (ano_lancamento >= 1888),
    genero VARCHAR(50),
    duracao_minutos INT CHECK (duracao_minutos > 0),
    diretor VARCHAR(100)
);

CREATE TABLE public.avaliacao (
    id integer PRIMARY KEY DEFAULT nextval('avaliacao_id_seq'),
    usuario_id INT NOT NULL,
    filme_id INT NOT NULL,
    nota NUMERIC(3,1) CHECK (nota >= 0 AND nota <= 10),
    comentario TEXT,
    data_avaliacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_usuario FOREIGN KEY (usuario_id)
        REFERENCES public.usuario (id) ON DELETE CASCADE,
    CONSTRAINT fk_filme FOREIGN KEY (filme_id)
        REFERENCES public.filme (id) ON DELETE CASCADE,
    CONSTRAINT uq_usuario_filme UNIQUE (usuario_id, filme_id)
);

-- ==============================================
-- Inserção de Dados Exemplo
-- ==============================================

INSERT INTO public.usuario (nome, email, senha)
VALUES 

    ('Maria Souza', 'maria@example.com', '123'),
    ('João Lima', 'joao@example.com', '123'),
    ('Carla Mendes', 'carla@example.com', '123');

INSERT INTO public.filme (titulo, ano_lancamento, genero, duracao_minutos, diretor)
VALUES
    ('Matrix', 1999, 'Ficção Científica', 136, 'Lana Wachowski'),
    ('O Senhor dos Anéis: A Sociedade do Anel', 2001, 'Fantasia', 178, 'Peter Jackson'),
    ('Interestelar', 2014, 'Ficção Científica', 169, 'Christopher Nolan');

INSERT INTO public.avaliacao (usuario_id, filme_id, nota, comentario)
VALUES
    (1, 1, 9.5, 'Um clássico da ficção científica!'),
    (2, 2, 10.0, 'Uma obra-prima do cinema.'),
    (3, 3, 9.0, 'Visual e trilha sonora impecáveis.');

-- ==============================================
-- Ajusta os contadores de sequência
-- ==============================================

SELECT setval('usuario_id_seq', (SELECT MAX(id) FROM usuario));
SELECT setval('filme_id_seq', (SELECT MAX(id) FROM filme));
SELECT setval('avaliacao_id_seq', (SELECT MAX(id) FROM avaliacao));

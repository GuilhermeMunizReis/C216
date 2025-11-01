--
-- PostgreSQL database dump
--

\restrict wiCb8tJD04pIdKAxK7gQNQCLpizZMQRglGKckg7EAyFpMXUnjfmriRgeWmxXcLY

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2025-11-01 14:30:45

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 16463)
-- Name: avaliacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.avaliacao (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    filme_id integer NOT NULL,
    nota numeric(3,1),
    comentario text,
    data_avaliacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT avaliacao_nota_check CHECK (((nota >= (0)::numeric) AND (nota <= (10)::numeric)))
);


ALTER TABLE public.avaliacao OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16462)
-- Name: avaliacao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.avaliacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.avaliacao_id_seq OWNER TO postgres;

--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 223
-- Name: avaliacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.avaliacao_id_seq OWNED BY public.avaliacao.id;


--
-- TOC entry 222 (class 1259 OID 16452)
-- Name: filme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filme (
    id integer NOT NULL,
    titulo character varying(200) NOT NULL,
    ano_lancamento integer,
    genero character varying(50),
    duracao_minutos integer,
    diretor character varying(100),
    CONSTRAINT filme_ano_lancamento_check CHECK ((ano_lancamento >= 1888)),
    CONSTRAINT filme_duracao_minutos_check CHECK ((duracao_minutos > 0))
);


ALTER TABLE public.filme OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16451)
-- Name: filme_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.filme_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.filme_id_seq OWNER TO postgres;

--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 221
-- Name: filme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.filme_id_seq OWNED BY public.filme.id;


--
-- TOC entry 220 (class 1259 OID 16439)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    data_cadastro timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    senha character varying(255) DEFAULT '123'::character varying NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16438)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_seq OWNER TO postgres;

--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 219
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 4769 (class 2604 OID 16466)
-- Name: avaliacao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacao ALTER COLUMN id SET DEFAULT nextval('public.avaliacao_id_seq'::regclass);


--
-- TOC entry 4768 (class 2604 OID 16455)
-- Name: filme id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filme ALTER COLUMN id SET DEFAULT nextval('public.filme_id_seq'::regclass);


--
-- TOC entry 4765 (class 2604 OID 16442)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 4938 (class 0 OID 16463)
-- Dependencies: 224
-- Data for Name: avaliacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.avaliacao (id, usuario_id, filme_id, nota, comentario, data_avaliacao) FROM stdin;
10	13	13	9.5	Um clássico da ficção científica!	2025-11-01 14:09:01.395119
11	14	14	10.0	Uma obra-prima do cinema.	2025-11-01 14:09:01.395119
12	15	15	9.0	Visual e trilha sonora impecáveis.	2025-11-01 14:09:01.395119
\.


--
-- TOC entry 4936 (class 0 OID 16452)
-- Dependencies: 222
-- Data for Name: filme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filme (id, titulo, ano_lancamento, genero, duracao_minutos, diretor) FROM stdin;
13	Matrix	1999	Ficção Científica	136	Lana Wachowski
14	O Senhor dos Anéis: A Sociedade do Anel	2001	Fantasia	178	Peter Jackson
15	Interestelar	2014	Ficção Científica	169	Christopher Nolan
\.


--
-- TOC entry 4934 (class 0 OID 16439)
-- Dependencies: 220
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id, nome, email, data_cadastro, senha) FROM stdin;
13	Maria Souza	maria@example.com	2025-11-01 14:08:03.425876	123
14	João Lima	joao@example.com	2025-11-01 14:08:03.425876	123
15	Carla Mendes	carla@example.com	2025-11-01 14:08:03.425876	123
\.


--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 223
-- Name: avaliacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.avaliacao_id_seq', 12, true);


--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 221
-- Name: filme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.filme_id_seq', 15, true);


--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 219
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 15, true);


--
-- TOC entry 4781 (class 2606 OID 16475)
-- Name: avaliacao avaliacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacao
    ADD CONSTRAINT avaliacao_pkey PRIMARY KEY (id);


--
-- TOC entry 4779 (class 2606 OID 16461)
-- Name: filme filme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filme
    ADD CONSTRAINT filme_pkey PRIMARY KEY (id);


--
-- TOC entry 4783 (class 2606 OID 16477)
-- Name: avaliacao uq_usuario_filme; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacao
    ADD CONSTRAINT uq_usuario_filme UNIQUE (usuario_id, filme_id);


--
-- TOC entry 4775 (class 2606 OID 16450)
-- Name: usuario usuario_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_email_key UNIQUE (email);


--
-- TOC entry 4777 (class 2606 OID 16448)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 4784 (class 2606 OID 16483)
-- Name: avaliacao fk_filme; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacao
    ADD CONSTRAINT fk_filme FOREIGN KEY (filme_id) REFERENCES public.filme(id) ON DELETE CASCADE;


--
-- TOC entry 4785 (class 2606 OID 16478)
-- Name: avaliacao fk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avaliacao
    ADD CONSTRAINT fk_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuario(id) ON DELETE CASCADE;


-- Completed on 2025-11-01 14:30:45

--
-- PostgreSQL database dump complete
--

\unrestrict wiCb8tJD04pIdKAxK7gQNQCLpizZMQRglGKckg7EAyFpMXUnjfmriRgeWmxXcLY


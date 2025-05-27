--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-25 15:35:42 -03

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
-- TOC entry 231 (class 1259 OID 24744)
-- Name: dim_categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_categoria (
    id_categoria integer NOT NULL,
    nome_categoria character varying(50),
    descricao text
);


ALTER TABLE public.dim_categoria OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 24711)
-- Name: dim_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_cliente (
    id_cliente integer NOT NULL,
    cpf character varying(11),
    nome character varying(100),
    cidade character varying(50),
    estado character varying(2)
);


ALTER TABLE public.dim_cliente OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24710)
-- Name: dim_cliente_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_cliente_id_cliente_seq OWNER TO postgres;

--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 227
-- Name: dim_cliente_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_cliente_id_cliente_seq OWNED BY public.dim_cliente.id_cliente;


--
-- TOC entry 222 (class 1259 OID 16463)
-- Name: dim_loja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_loja (
    id_loja integer NOT NULL,
    nome_loja character varying(50),
    cidade character varying(50),
    estado character(2)
);


ALTER TABLE public.dim_loja OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16468)
-- Name: dim_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_produto (
    id_produto integer NOT NULL,
    nome_produto character varying(100),
    categoria character varying(50),
    marca character varying(50),
    preco numeric(10,2),
    unidade_medida character varying(20)
);


ALTER TABLE public.dim_produto OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16474)
-- Name: dim_tempo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_tempo (
    id_tempo integer NOT NULL,
    data date,
    dia integer,
    mes integer,
    ano integer,
    trimestre integer
);


ALTER TABLE public.dim_tempo OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16473)
-- Name: dim_tempo_id_tempo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_tempo_id_tempo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_tempo_id_tempo_seq OWNER TO postgres;

--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 224
-- Name: dim_tempo_id_tempo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_tempo_id_tempo_seq OWNED BY public.dim_tempo.id_tempo;


--
-- TOC entry 230 (class 1259 OID 24718)
-- Name: fato_venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fato_venda (
    id_venda integer NOT NULL,
    id_cliente integer,
    id_produto integer,
    id_loja integer,
    id_tempo integer,
    quantidade integer,
    valor_total numeric(10,2),
    desconto numeric(10,2)
);


ALTER TABLE public.fato_venda OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 24717)
-- Name: fato_venda_id_venda_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fato_venda_id_venda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fato_venda_id_venda_seq OWNER TO postgres;

--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 229
-- Name: fato_venda_id_venda_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fato_venda_id_venda_seq OWNED BY public.fato_venda.id_venda;


--
-- TOC entry 219 (class 1259 OID 16447)
-- Name: staging_categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_categoria (
    id_categoria integer,
    nome_categoria character varying(50),
    descricao text
);


ALTER TABLE public.staging_categoria OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16514)
-- Name: staging_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_cliente (
    id_cliente integer,
    cpf character varying(11),
    nome character varying(50),
    email character varying(50),
    telefone character varying(50),
    endereco character varying(50),
    cidade character varying(50),
    estado character varying(50),
    cep integer,
    ativo integer
);


ALTER TABLE public.staging_cliente OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16455)
-- Name: staging_item_venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_item_venda (
    id_item integer,
    id_venda integer,
    id_produto integer,
    quantidade integer,
    preco_unitario numeric(10,2),
    desconto numeric(10,2),
    valor_total numeric(10,2)
);


ALTER TABLE public.staging_item_venda OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16439)
-- Name: staging_loja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_loja (
    id_loja integer,
    codigo_loja character varying(10),
    nome_loja character varying(50),
    endereco character varying(200),
    cidade character varying(50),
    estado character(2),
    cep character varying(8),
    telefone character varying(20),
    gerente character varying(100),
    ativa boolean
);


ALTER TABLE public.staging_loja OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16442)
-- Name: staging_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_produto (
    id_produto integer,
    codigo_produto character varying(20),
    nome_produto character varying(100),
    descricao text,
    id_categoria integer,
    marca character varying(50),
    preco_atual numeric(10,2),
    unidade_medida character varying(20),
    ativo boolean
);


ALTER TABLE public.staging_produto OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16452)
-- Name: staging_venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staging_venda (
    id_venda integer,
    numero_venda character varying(20),
    id_cliente integer,
    id_loja integer,
    id_funcionario integer,
    data_venda date,
    valor_total numeric(10,2),
    desconto_total numeric(10,2),
    forma_pagamento character varying(30),
    status_venda character varying(20)
);


ALTER TABLE public.staging_venda OWNER TO postgres;

--
-- TOC entry 3321 (class 2604 OID 24714)
-- Name: dim_cliente id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.dim_cliente_id_cliente_seq'::regclass);


--
-- TOC entry 3320 (class 2604 OID 16477)
-- Name: dim_tempo id_tempo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_tempo ALTER COLUMN id_tempo SET DEFAULT nextval('public.dim_tempo_id_tempo_seq'::regclass);


--
-- TOC entry 3322 (class 2604 OID 24721)
-- Name: fato_venda id_venda; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fato_venda ALTER COLUMN id_venda SET DEFAULT nextval('public.fato_venda_id_venda_seq'::regclass);


--
-- TOC entry 3498 (class 0 OID 24744)
-- Dependencies: 231
-- Data for Name: dim_categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_categoria (id_categoria, nome_categoria, descricao) FROM stdin;
1	Eletrônicos	Produtos eletrônicos, tecnologia e informática
2	Alimentos e Bebidas	Produtos alimentícios, bebidas e snacks
3	Vestuário	Roupas, calçados e acessórios
4	Casa e Decoração	Móveis, decoração e utilidades domésticas
5	Esportes e Lazer	Produtos esportivos e equipamentos de lazer
6	Beleza e Cuidados	Cosméticos, perfumaria e cuidados pessoais
7	Livros e Papelaria	Livros, material escolar e escritório
8	Brinquedos	Brinquedos e jogos infantis
\.


--
-- TOC entry 3495 (class 0 OID 24711)
-- Dependencies: 228
-- Data for Name: dim_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_cliente (id_cliente, cpf, nome, cidade, estado) FROM stdin;
3	34567890123	Roberto Carlos Oliveira	Rio de Janeiro	RJ
10	01234567890	Patricia Almeida Costa	São Paulo	SP
2	23456789012	Ana Maria Santos	São Paulo	SP
9	90123456789	Ricardo Pereira Lima	Curitiba	PR
4	45678901234	Juliana Costa Lima	Belo Horizonte	MG
6	67890123456	Mariana Ferreira Souza	Salvador	BA
13	33445566778	Carlos Eduardo Santos	Recife	PE
7	78901234567	Alexandre Martins Silva	Porto Alegre	RS
11	11223344556	Bruno Carvalho Dias	Rio de Janeiro	RJ
14	44556677889	Daniela Sousa Lima	Salvador	BA
1	12345678901	Paulo Henrique Silva	São Paulo	SP
12	22334455667	Letícia Nunes Oliveira	Belo Horizonte	MG
5	56789012345	Fernando Alves Costa	Recife	PE
15	55667788990	Marcelo Ferreira Costa	Porto Alegre	RS
8	89012345678	Camila Rodrigues Santos	Brasília	DF
\.


--
-- TOC entry 3489 (class 0 OID 16463)
-- Dependencies: 222
-- Data for Name: dim_loja; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_loja (id_loja, nome_loja, cidade, estado) FROM stdin;
3	Loja BH Shopping	Belo Horizonte	MG
7	Loja Brasília Shopping	Brasília	DF
8	Loja Curitiba Shopping	Curitiba	PR
1	Loja Shopping Center	São Paulo	SP
2	Loja Barra Shopping	Rio de Janeiro	RJ
4	Loja Recife Shopping	Recife	PE
5	Loja Salvador Shopping	Salvador	BA
6	Loja Porto Alegre	Porto Alegre	RS
\.


--
-- TOC entry 3490 (class 0 OID 16468)
-- Dependencies: 223
-- Data for Name: dim_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_produto (id_produto, nome_produto, categoria, marca, preco, unidade_medida) FROM stdin;
5	Mouse Gamer	Eletrônicos	Logitech	199.90	UN
4	Fone Bluetooth	Eletrônicos	JBL	249.90	UN
3	TV Smart 50" 4K	Eletrônicos	LG	2199.00	UN
2	Notebook Dell Inspiron 15	Eletrônicos	Dell	2899.00	UN
1	Smartphone Galaxy S22	Eletrônicos	Samsung	3499.00	UN
10	Suco Natural 1L	Alimentos e Bebidas	Del Valle	7.90	UN
9	Biscoito Integral	Alimentos e Bebidas	Vitarella	4.50	PCT
8	Água Mineral 1,5L	Alimentos e Bebidas	Crystal	2.90	UN
7	Chocolate ao Leite 200g	Alimentos e Bebidas	Nestlé	8.90	UN
6	Café Premium 500g	Alimentos e Bebidas	Melitta	24.90	PCT
15	Mochila Escolar	Vestuário	Samsonite	149.90	UN
14	Vestido Casual	Vestuário	Renner	119.90	UN
13	Tênis Running	Vestuário	Nike	399.90	PAR
12	Calça Jeans Feminina	Vestuário	Levi's	259.90	UN
11	Camisa Polo Masculina	Vestuário	Lacoste	189.90	UN
20	Organizador Multiuso	Casa e Decoração	Ordene	39.90	UN
19	Luminária de Mesa	Casa e Decoração	Philips	89.90	UN
18	Conjunto de Toalhas	Casa e Decoração	Karsten	99.90	KIT
17	Edredom Casal	Casa e Decoração	Santista	189.90	UN
16	Jogo de Panelas 5 peças	Casa e Decoração	Tramontina	299.90	JG
25	Corda de Pular	Esportes e Lazer	Speedo	39.90	UN
24	Bicicleta Aro 29	Esportes e Lazer	Caloi	1499.00	UN
23	Tapete Yoga	Esportes e Lazer	Acte Sports	79.90	UN
22	Kit Halteres 10kg	Esportes e Lazer	Kikos	199.90	KIT
21	Bola de Futebol	Esportes e Lazer	Adidas	129.90	UN
30	Kit Maquiagem	Beleza e Cuidados	Ruby Rose	89.90	KIT
29	Base Líquida	Beleza e Cuidados	MAC	249.90	UN
28	Perfume Masculino 100ml	Beleza e Cuidados	Boticário	189.90	UN
27	Creme Hidratante 200ml	Beleza e Cuidados	Nivea	24.90	UN
26	Shampoo 400ml	Beleza e Cuidados	Pantene	18.90	UN
35	Calculadora Científica	Livros e Papelaria	Casio	89.90	UN
34	Agenda 2024	Livros e Papelaria	Foroni	34.90	UN
33	Kit Canetas Coloridas	Livros e Papelaria	BIC	19.90	KIT
32	Caderno Universitário	Livros e Papelaria	Tilibra	24.90	UN
31	Livro Best Seller	Livros e Papelaria	Intrínseca	49.90	UN
40	Jogo de Tabuleiro	Brinquedos	Grow	89.90	CX
39	Carrinho Hot Wheels	Brinquedos	Hot Wheels	12.90	UN
38	Quebra-cabeça 1000 peças	Brinquedos	Grow	59.90	CX
37	Boneca Fashion	Brinquedos	Mattel	149.90	UN
36	Lego Classic 500 peças	Brinquedos	Lego	299.90	CX
\.


--
-- TOC entry 3492 (class 0 OID 16474)
-- Dependencies: 225
-- Data for Name: dim_tempo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_tempo (id_tempo, data, dia, mes, ano, trimestre) FROM stdin;
1	2024-01-15	15	1	2024	1
2	2024-02-05	5	2	2024	1
3	2024-02-01	1	2	2024	1
4	2024-01-16	16	1	2024	1
5	2024-01-17	17	1	2024	1
6	2024-01-23	23	1	2024	1
7	2024-02-03	3	2	2024	1
8	2024-02-02	2	2	2024	1
9	2024-01-19	19	1	2024	1
10	2024-02-04	4	2	2024	1
11	2024-01-21	21	1	2024	1
12	2024-01-18	18	1	2024	1
13	2024-01-20	20	1	2024	1
14	2024-01-22	22	1	2024	1
\.


--
-- TOC entry 3497 (class 0 OID 24718)
-- Dependencies: 230
-- Data for Name: fato_venda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fato_venda (id_venda, id_cliente, id_produto, id_loja, id_tempo, quantidade, valor_total, desconto) FROM stdin;
1	1	1	1	1	1	3499.00	0.00
2	1	4	1	1	1	199.90	0.00
3	2	6	1	1	2	47.31	2.49
4	2	8	1	1	3	24.87	0.89
5	2	13	1	1	1	359.91	39.99
6	3	3	2	4	1	2199.00	0.00
7	4	16	3	5	1	269.91	29.99
8	4	21	3	5	1	17.01	1.89
9	5	11	4	12	1	189.90	0.00
10	5	12	4	12	1	259.90	0.00
11	5	26	4	12	1	49.90	0.00
12	6	35	5	9	1	89.90	0.00
13	7	19	6	13	1	1349.10	149.90
14	8	22	7	11	2	49.80	0.00
15	8	17	7	11	1	189.90	0.00
16	8	33	7	11	1	59.90	0.00
17	9	9	8	14	2	8.55	0.45
18	9	37	8	14	1	134.91	14.99
19	10	2	1	6	1	2899.00	0.00
20	10	5	1	6	1	199.90	0.00
21	11	1	2	3	1	3149.10	349.90
22	11	25	2	3	1	80.91	8.99
23	12	34	3	8	1	199.90	0.00
24	13	13	4	7	1	359.91	39.99
25	13	14	4	7	1	107.91	11.99
26	13	15	4	7	1	134.91	14.99
27	14	38	5	10	1	89.90	0.00
28	15	18	6	2	2	71.82	3.99
29	15	23	6	2	1	224.91	24.99
\.


--
-- TOC entry 3486 (class 0 OID 16447)
-- Dependencies: 219
-- Data for Name: staging_categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_categoria (id_categoria, nome_categoria, descricao) FROM stdin;
1	Eletrônicos	Produtos eletrônicos, tecnologia e informática
2	Alimentos e Bebidas	Produtos alimentícios, bebidas e snacks
3	Vestuário	Roupas, calçados e acessórios
4	Casa e Decoração	Móveis, decoração e utilidades domésticas
5	Esportes e Lazer	Produtos esportivos e equipamentos de lazer
6	Beleza e Cuidados	Cosméticos, perfumaria e cuidados pessoais
7	Livros e Papelaria	Livros, material escolar e escritório
8	Brinquedos	Brinquedos e jogos infantis
\.


--
-- TOC entry 3493 (class 0 OID 16514)
-- Dependencies: 226
-- Data for Name: staging_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_cliente (id_cliente, cpf, nome, email, telefone, endereco, cidade, estado, cep, ativo) FROM stdin;
1	12345678901	Paulo Henrique Silva	paulo.silva@email.com	11-98765-4321	Rua das Flores, 123	São Paulo	SP	1234567	1
2	23456789012	Ana Maria Santos	ana.santos@email.com	11-97654-3210	Av. Paulista, 456	São Paulo	SP	1310100	1
3	34567890123	Roberto Carlos Oliveira	roberto.oliveira@email.com	21-96543-2109	Rua Copacabana, 789	Rio de Janeiro	RJ	22020050	1
4	45678901234	Juliana Costa Lima	juliana.lima@email.com	31-95432-1098	Av. Afonso Pena, 321	Belo Horizonte	MG	30130005	1
5	56789012345	Fernando Alves Costa	fernando.costa@email.com	81-94321-0987	Av. Boa Viagem, 654	Recife	PE	51020180	1
6	67890123456	Mariana Ferreira Souza	mariana.souza@email.com	71-93210-9876	Av. Oceânica, 987	Salvador	BA	40160060	1
7	78901234567	Alexandre Martins Silva	alexandre.silva@email.com	51-92109-8765	Rua da Praia, 147	Porto Alegre	RS	90020060	1
8	89012345678	Camila Rodrigues Santos	camila.santos@email.com	61-91098-7654	SQS 308 Bloco C	Brasília	DF	70355030	1
9	90123456789	Ricardo Pereira Lima	ricardo.lima@email.com	41-90987-6543	Rua XV de Novembro, 258	Curitiba	PR	80020310	1
10	01234567890	Patricia Almeida Costa	patricia.costa@email.com	11-89876-5432	Alameda Santos, 369	São Paulo	SP	1419002	1
11	11223344556	Bruno Carvalho Dias	bruno.dias@email.com	21-88765-4321	Av. Rio Branco, 741	Rio de Janeiro	RJ	20040008	1
12	22334455667	Letícia Nunes Oliveira	leticia.oliveira@email.com	31-87654-3210	Rua da Bahia, 852	Belo Horizonte	MG	30160011	1
13	33445566778	Carlos Eduardo Santos	carlos.santos@email.com	81-86543-2109	Rua do Sol, 963	Recife	PE	50030230	1
14	44556677889	Daniela Sousa Lima	daniela.lima@email.com	71-85432-1098	Av. Sete de Setembro, 159	Salvador	BA	40060500	1
15	55667788990	Marcelo Ferreira Costa	marcelo.costa@email.com	51-84321-0987	Av. Ipiranga, 753	Porto Alegre	RS	90160091	1
\.


--
-- TOC entry 3488 (class 0 OID 16455)
-- Dependencies: 221
-- Data for Name: staging_item_venda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_item_venda (id_item, id_venda, id_produto, quantidade, preco_unitario, desconto, valor_total) FROM stdin;
1	1	1	1	3499.00	0.00	3499.00
2	1	4	1	199.90	0.00	199.90
3	2	6	2	24.90	2.49	47.31
4	2	8	3	8.90	0.89	24.87
5	2	13	1	399.90	39.99	359.91
6	3	3	1	2199.00	0.00	2199.00
7	4	16	1	299.90	29.99	269.91
8	4	21	1	18.90	1.89	17.01
9	5	11	1	189.90	0.00	189.90
10	5	12	1	259.90	0.00	259.90
11	5	26	1	49.90	0.00	49.90
12	6	35	1	89.90	0.00	89.90
13	7	19	1	1499.00	149.90	1349.10
14	8	22	2	24.90	0.00	49.80
15	8	17	1	189.90	0.00	189.90
16	8	33	1	59.90	0.00	59.90
17	9	9	2	4.50	0.45	8.55
18	9	37	1	149.90	14.99	134.91
19	10	2	1	2899.00	0.00	2899.00
20	10	5	1	199.90	0.00	199.90
21	11	1	1	3499.00	349.90	3149.10
22	11	25	1	89.90	8.99	80.91
23	12	34	1	199.90	0.00	199.90
24	13	13	1	399.90	39.99	359.91
25	13	14	1	119.90	11.99	107.91
26	13	15	1	149.90	14.99	134.91
27	14	38	1	89.90	0.00	89.90
28	15	18	2	39.90	3.99	71.82
29	15	23	1	249.90	24.99	224.91
\.


--
-- TOC entry 3484 (class 0 OID 16439)
-- Dependencies: 217
-- Data for Name: staging_loja; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_loja (id_loja, codigo_loja, nome_loja, endereco, cidade, estado, cep, telefone, gerente, ativa) FROM stdin;
1	LJ001	Loja Shopping Center	Av. Paulista, 1500	São Paulo	SP	01310100	11-3456-7890	Carlos Silva	f
2	LJ002	Loja Barra Shopping	Av. das Américas, 4666	Rio de Janeiro	RJ	22640102	21-2431-8900	Ana Santos	f
3	LJ003	Loja BH Shopping	Rod. BR-356, 3049	Belo Horizonte	MG	31150900	31-3456-7890	Pedro Oliveira	f
4	LJ004	Loja Recife Shopping	Av. Agamenon Magalhães, 1000	Recife	PE	52070000	81-3456-7890	Maria Costa	f
5	LJ005	Loja Salvador Shopping	Av. Tancredo Neves, 2915	Salvador	BA	41820021	71-3456-7890	João Pereira	f
6	LJ006	Loja Porto Alegre	Av. Diário de Notícias, 300	Porto Alegre	RS	90810000	51-3456-7890	Paula Lima	f
7	LJ007	Loja Brasília Shopping	SCN Q 6 L 2	Brasília	DF	70716900	61-3456-7890	Roberto Alves	f
8	LJ008	Loja Curitiba Shopping	Av. das Torres, 1700	Curitiba	PR	82840730	41-3456-7890	Juliana Martins	f
\.


--
-- TOC entry 3485 (class 0 OID 16442)
-- Dependencies: 218
-- Data for Name: staging_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_produto (id_produto, codigo_produto, nome_produto, descricao, id_categoria, marca, preco_atual, unidade_medida, ativo) FROM stdin;
1	ELET001	Smartphone Galaxy S22	Smartphone Samsung Galaxy S22 128GB	1	Samsung	3499.00	UN	f
2	ELET002	Notebook Dell Inspiron 15	Notebook Dell i5 8GB RAM 512GB SSD	1	Dell	2899.00	UN	f
3	ELET003	TV Smart 50" 4K	Smart TV LG 50 polegadas 4K	1	LG	2199.00	UN	f
4	ELET004	Fone Bluetooth	Fone de ouvido bluetooth JBL	1	JBL	249.90	UN	f
5	ELET005	Mouse Gamer	Mouse gamer RGB Logitech	1	Logitech	199.90	UN	f
6	ALIM001	Café Premium 500g	Café torrado e moído premium	2	Melitta	24.90	PCT	f
7	ALIM002	Chocolate ao Leite 200g	Chocolate ao leite Nestlé	2	Nestlé	8.90	UN	f
8	ALIM003	Água Mineral 1,5L	Água mineral sem gás	2	Crystal	2.90	UN	f
9	ALIM004	Biscoito Integral	Biscoito integral multigrãos	2	Vitarella	4.50	PCT	f
10	ALIM005	Suco Natural 1L	Suco de laranja natural	2	Del Valle	7.90	UN	f
11	VEST001	Camisa Polo Masculina	Camisa polo algodão masculina	3	Lacoste	189.90	UN	f
12	VEST002	Calça Jeans Feminina	Calça jeans feminina skinny	3	Levi's	259.90	UN	f
13	VEST003	Tênis Running	Tênis para corrida unissex	3	Nike	399.90	PAR	f
14	VEST004	Vestido Casual	Vestido casual feminino	3	Renner	119.90	UN	f
15	VEST005	Mochila Escolar	Mochila escolar resistente	3	Samsonite	149.90	UN	f
16	CASA001	Jogo de Panelas 5 peças	Jogo de panelas antiaderente	4	Tramontina	299.90	JG	f
17	CASA002	Edredom Casal	Edredom casal 100% algodão	4	Santista	189.90	UN	f
18	CASA003	Conjunto de Toalhas	Kit 4 toalhas de banho	4	Karsten	99.90	KIT	f
19	CASA004	Luminária de Mesa	Luminária LED para mesa	4	Philips	89.90	UN	f
20	CASA005	Organizador Multiuso	Organizador plástico com divisórias	4	Ordene	39.90	UN	f
21	ESPO001	Bola de Futebol	Bola de futebol oficial	5	Adidas	129.90	UN	f
22	ESPO002	Kit Halteres 10kg	Par de halteres ajustáveis	5	Kikos	199.90	KIT	f
23	ESPO003	Tapete Yoga	Tapete para yoga antiderrapante	5	Acte Sports	79.90	UN	f
24	ESPO004	Bicicleta Aro 29	Mountain bike aro 29	5	Caloi	1499.00	UN	f
25	ESPO005	Corda de Pular	Corda de pular profissional	5	Speedo	39.90	UN	f
26	BELZ001	Shampoo 400ml	Shampoo hidratante	6	Pantene	18.90	UN	f
27	BELZ002	Creme Hidratante 200ml	Creme hidratante corporal	6	Nivea	24.90	UN	f
28	BELZ003	Perfume Masculino 100ml	Perfume masculino amadeirado	6	Boticário	189.90	UN	f
29	BELZ004	Base Líquida	Base líquida cobertura média	6	MAC	249.90	UN	f
30	BELZ005	Kit Maquiagem	Kit maquiagem completo	6	Ruby Rose	89.90	KIT	f
31	LIVR001	Livro Best Seller	Romance contemporâneo	7	Intrínseca	49.90	UN	f
32	LIVR002	Caderno Universitário	Caderno 200 folhas	7	Tilibra	24.90	UN	f
33	LIVR003	Kit Canetas Coloridas	Kit 12 canetas coloridas	7	BIC	19.90	KIT	f
34	LIVR004	Agenda 2024	Agenda executiva 2024	7	Foroni	34.90	UN	f
35	LIVR005	Calculadora Científica	Calculadora científica completa	7	Casio	89.90	UN	f
36	BRIN001	Lego Classic 500 peças	Kit Lego construção classic	8	Lego	299.90	CX	f
37	BRIN002	Boneca Fashion	Boneca fashion com acessórios	8	Mattel	149.90	UN	f
38	BRIN003	Quebra-cabeça 1000 peças	Quebra-cabeça paisagem	8	Grow	59.90	CX	f
39	BRIN004	Carrinho Hot Wheels	Carrinho colecionável	8	Hot Wheels	12.90	UN	f
40	BRIN005	Jogo de Tabuleiro	Jogo War clássico	8	Grow	89.90	CX	f
\.


--
-- TOC entry 3487 (class 0 OID 16452)
-- Dependencies: 220
-- Data for Name: staging_venda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staging_venda (id_venda, numero_venda, id_cliente, id_loja, id_funcionario, data_venda, valor_total, desconto_total, forma_pagamento, status_venda) FROM stdin;
1	VD202401001	1	1	2	2024-01-15	3698.90	0.00	Cartão Crédito	Finalizada
2	VD202401002	2	1	3	2024-01-15	449.80	44.98	PIX	Finalizada
3	VD202401003	3	2	6	2024-01-16	2199.00	0.00	Cartão Débito	Finalizada
4	VD202401004	4	3	10	2024-01-17	279.80	27.98	Dinheiro	Finalizada
5	VD202401005	5	4	14	2024-01-18	519.70	0.00	Cartão Crédito	Finalizada
6	VD202401006	6	5	18	2024-01-19	89.90	0.00	PIX	Finalizada
7	VD202401007	7	6	2	2024-01-20	1499.00	149.90	Cartão Crédito	Finalizada
8	VD202401008	8	7	3	2024-01-21	349.70	0.00	Cartão Débito	Finalizada
9	VD202401009	9	8	4	2024-01-22	169.80	16.98	PIX	Finalizada
10	VD202401010	10	1	5	2024-01-23	787.50	0.00	Cartão Crédito	Finalizada
11	VD202402001	11	2	6	2024-02-01	4298.80	429.88	Cartão Crédito	Finalizada
12	VD202402002	12	3	7	2024-02-02	199.90	0.00	PIX	Finalizada
13	VD202402003	13	4	8	2024-02-03	659.60	65.96	Cartão Débito	Finalizada
14	VD202402004	14	5	9	2024-02-04	89.90	0.00	Dinheiro	Finalizada
15	VD202402005	15	6	10	2024-02-05	349.80	34.98	PIX	Finalizada
\.


--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 227
-- Name: dim_cliente_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_cliente_id_cliente_seq', 1, false);


--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 224
-- Name: dim_tempo_id_tempo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_tempo_id_tempo_seq', 14, true);


--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 229
-- Name: fato_venda_id_venda_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fato_venda_id_venda_seq', 29, true);


--
-- TOC entry 3334 (class 2606 OID 24750)
-- Name: dim_categoria dim_categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_categoria
    ADD CONSTRAINT dim_categoria_pkey PRIMARY KEY (id_categoria);


--
-- TOC entry 3330 (class 2606 OID 24716)
-- Name: dim_cliente dim_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_cliente
    ADD CONSTRAINT dim_cliente_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 3324 (class 2606 OID 16467)
-- Name: dim_loja dim_loja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_loja
    ADD CONSTRAINT dim_loja_pkey PRIMARY KEY (id_loja);


--
-- TOC entry 3326 (class 2606 OID 16472)
-- Name: dim_produto dim_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_produto
    ADD CONSTRAINT dim_produto_pkey PRIMARY KEY (id_produto);


--
-- TOC entry 3328 (class 2606 OID 16479)
-- Name: dim_tempo dim_tempo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_tempo
    ADD CONSTRAINT dim_tempo_pkey PRIMARY KEY (id_tempo);


--
-- TOC entry 3332 (class 2606 OID 24723)
-- Name: fato_venda fato_venda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fato_venda
    ADD CONSTRAINT fato_venda_pkey PRIMARY KEY (id_venda);


--
-- TOC entry 3335 (class 2606 OID 24724)
-- Name: fato_venda fato_venda_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fato_venda
    ADD CONSTRAINT fato_venda_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.dim_cliente(id_cliente);


--
-- TOC entry 3336 (class 2606 OID 24734)
-- Name: fato_venda fato_venda_id_loja_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fato_venda
    ADD CONSTRAINT fato_venda_id_loja_fkey FOREIGN KEY (id_loja) REFERENCES public.dim_loja(id_loja);


--
-- TOC entry 3337 (class 2606 OID 24729)
-- Name: fato_venda fato_venda_id_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fato_venda
    ADD CONSTRAINT fato_venda_id_produto_fkey FOREIGN KEY (id_produto) REFERENCES public.dim_produto(id_produto);


--
-- TOC entry 3338 (class 2606 OID 24739)
-- Name: fato_venda fato_venda_id_tempo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fato_venda
    ADD CONSTRAINT fato_venda_id_tempo_fkey FOREIGN KEY (id_tempo) REFERENCES public.dim_tempo(id_tempo);


-- Completed on 2025-05-25 15:35:42 -03

--
-- PostgreSQL database dump complete
--


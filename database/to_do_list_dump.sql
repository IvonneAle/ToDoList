--
-- PostgreSQL database dump
--

-- Dumped from database version 12.10
-- Dumped by pg_dump version 12.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: to_do_list; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA to_do_list;


ALTER SCHEMA to_do_list OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: board; Type: TABLE; Schema: to_do_list; Owner: postgres
--

CREATE TABLE to_do_list.board (
    id integer NOT NULL,
    user_id integer NOT NULL,
    title character varying(30)[] NOT NULL
);


ALTER TABLE to_do_list.board OWNER TO postgres;

--
-- Name: board_id_seq; Type: SEQUENCE; Schema: to_do_list; Owner: postgres
--

CREATE SEQUENCE to_do_list.board_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE to_do_list.board_id_seq OWNER TO postgres;

--
-- Name: board_id_seq; Type: SEQUENCE OWNED BY; Schema: to_do_list; Owner: postgres
--

ALTER SEQUENCE to_do_list.board_id_seq OWNED BY to_do_list.board.id;


--
-- Name: card; Type: TABLE; Schema: to_do_list; Owner: postgres
--

CREATE TABLE to_do_list.card (
    id integer NOT NULL,
    title character varying(30)[] NOT NULL,
    duration integer,
    start_date date,
    end_date date,
    board_id integer,
    notes_id integer,
    status_id integer
);


ALTER TABLE to_do_list.card OWNER TO postgres;

--
-- Name: card_id_seq; Type: SEQUENCE; Schema: to_do_list; Owner: postgres
--

CREATE SEQUENCE to_do_list.card_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE to_do_list.card_id_seq OWNER TO postgres;

--
-- Name: card_id_seq; Type: SEQUENCE OWNED BY; Schema: to_do_list; Owner: postgres
--

ALTER SEQUENCE to_do_list.card_id_seq OWNED BY to_do_list.card.id;


--
-- Name: image; Type: TABLE; Schema: to_do_list; Owner: postgres
--

CREATE TABLE to_do_list.image (
    id integer NOT NULL,
    image bytea,
    notes_id integer
);


ALTER TABLE to_do_list.image OWNER TO postgres;

--
-- Name: image_id_seq; Type: SEQUENCE; Schema: to_do_list; Owner: postgres
--

CREATE SEQUENCE to_do_list.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE to_do_list.image_id_seq OWNER TO postgres;

--
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: to_do_list; Owner: postgres
--

ALTER SEQUENCE to_do_list.image_id_seq OWNED BY to_do_list.image.id;


--
-- Name: notes; Type: TABLE; Schema: to_do_list; Owner: postgres
--

CREATE TABLE to_do_list.notes (
    id integer NOT NULL,
    card_id integer NOT NULL,
    content text
);


ALTER TABLE to_do_list.notes OWNER TO postgres;

--
-- Name: notes_id_seq; Type: SEQUENCE; Schema: to_do_list; Owner: postgres
--

CREATE SEQUENCE to_do_list.notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE to_do_list.notes_id_seq OWNER TO postgres;

--
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: to_do_list; Owner: postgres
--

ALTER SEQUENCE to_do_list.notes_id_seq OWNED BY to_do_list.notes.id;


--
-- Name: status; Type: TABLE; Schema: to_do_list; Owner: postgres
--

CREATE TABLE to_do_list.status (
    id integer NOT NULL,
    name character varying(30)[] NOT NULL,
    description character varying(80)[] NOT NULL
);


ALTER TABLE to_do_list.status OWNER TO postgres;

--
-- Name: status_id_seq; Type: SEQUENCE; Schema: to_do_list; Owner: postgres
--

CREATE SEQUENCE to_do_list.status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE to_do_list.status_id_seq OWNER TO postgres;

--
-- Name: status_id_seq; Type: SEQUENCE OWNED BY; Schema: to_do_list; Owner: postgres
--

ALTER SEQUENCE to_do_list.status_id_seq OWNED BY to_do_list.status.id;


--
-- Name: user; Type: TABLE; Schema: to_do_list; Owner: postgres
--

CREATE TABLE to_do_list."user" (
    id integer NOT NULL,
    password character varying(20)[] NOT NULL,
    username character varying(20)[] NOT NULL,
    email character varying(40)[] NOT NULL
);


ALTER TABLE to_do_list."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: to_do_list; Owner: postgres
--

CREATE SEQUENCE to_do_list.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE to_do_list.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: to_do_list; Owner: postgres
--

ALTER SEQUENCE to_do_list.user_id_seq OWNED BY to_do_list."user".id;


--
-- Name: board id; Type: DEFAULT; Schema: to_do_list; Owner: postgres
--

ALTER TABLE ONLY to_do_list.board ALTER COLUMN id SET DEFAULT nextval('to_do_list.board_id_seq'::regclass);


--
-- Name: card id; Type: DEFAULT; Schema: to_do_list; Owner: postgres
--

ALTER TABLE ONLY to_do_list.card ALTER COLUMN id SET DEFAULT nextval('to_do_list.card_id_seq'::regclass);


--
-- Name: image id; Type: DEFAULT; Schema: to_do_list; Owner: postgres
--

ALTER TABLE ONLY to_do_list.image ALTER COLUMN id SET DEFAULT nextval('to_do_list.image_id_seq'::regclass);


--
-- Name: notes id; Type: DEFAULT; Schema: to_do_list; Owner: postgres
--

ALTER TABLE ONLY to_do_list.notes ALTER COLUMN id SET DEFAULT nextval('to_do_list.notes_id_seq'::regclass);


--
-- Name: status id; Type: DEFAULT; Schema: to_do_list; Owner: postgres
--

ALTER TABLE ONLY to_do_list.status ALTER COLUMN id SET DEFAULT nextval('to_do_list.status_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: to_do_list; Owner: postgres
--

ALTER TABLE ONLY to_do_list."user" ALTER COLUMN id SET DEFAULT nextval('to_do_list.user_id_seq'::regclass);


--
-- Data for Name: board; Type: TABLE DATA; Schema: to_do_list; Owner: postgres
--

COPY to_do_list.board (id, user_id, title) FROM stdin;
\.


--
-- Data for Name: card; Type: TABLE DATA; Schema: to_do_list; Owner: postgres
--

COPY to_do_list.card (id, title, duration, start_date, end_date, board_id, notes_id, status_id) FROM stdin;
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: to_do_list; Owner: postgres
--

COPY to_do_list.image (id, image, notes_id) FROM stdin;
\.


--
-- Data for Name: notes; Type: TABLE DATA; Schema: to_do_list; Owner: postgres
--

COPY to_do_list.notes (id, card_id, content) FROM stdin;
\.


--
-- Data for Name: status; Type: TABLE DATA; Schema: to_do_list; Owner: postgres
--

COPY to_do_list.status (id, name, description) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: to_do_list; Owner: postgres
--

COPY to_do_list."user" (id, password, username, email) FROM stdin;
\.


--
-- Name: board_id_seq; Type: SEQUENCE SET; Schema: to_do_list; Owner: postgres
--

SELECT pg_catalog.setval('to_do_list.board_id_seq', 1, false);


--
-- Name: card_id_seq; Type: SEQUENCE SET; Schema: to_do_list; Owner: postgres
--

SELECT pg_catalog.setval('to_do_list.card_id_seq', 1, false);


--
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: to_do_list; Owner: postgres
--

SELECT pg_catalog.setval('to_do_list.image_id_seq', 1, false);


--
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: to_do_list; Owner: postgres
--

SELECT pg_catalog.setval('to_do_list.notes_id_seq', 1, false);


--
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: to_do_list; Owner: postgres
--

SELECT pg_catalog.setval('to_do_list.status_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: to_do_list; Owner: postgres
--

SELECT pg_catalog.setval('to_do_list.user_id_seq', 1, false);


--
-- Name: board board_pkey; Type: CONSTRAINT; Schema: to_do_list; Owner: postgres
--

ALTER TABLE ONLY to_do_list.board
    ADD CONSTRAINT board_pkey PRIMARY KEY (id);


--
-- Name: card card_pkey; Type: CONSTRAINT; Schema: to_do_list; Owner: postgres
--

ALTER TABLE ONLY to_do_list.card
    ADD CONSTRAINT card_pkey PRIMARY KEY (id);


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: to_do_list; Owner: postgres
--

ALTER TABLE ONLY to_do_list.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: to_do_list; Owner: postgres
--

ALTER TABLE ONLY to_do_list.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- Name: status status_pkey; Type: CONSTRAINT; Schema: to_do_list; Owner: postgres
--

ALTER TABLE ONLY to_do_list.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- Name: card unique_card_title; Type: CONSTRAINT; Schema: to_do_list; Owner: postgres
--

ALTER TABLE ONLY to_do_list.card
    ADD CONSTRAINT unique_card_title UNIQUE (title);


--
-- Name: board unique_title; Type: CONSTRAINT; Schema: to_do_list; Owner: postgres
--

ALTER TABLE ONLY to_do_list.board
    ADD CONSTRAINT unique_title UNIQUE (title);


--
-- Name: user unique_username; Type: CONSTRAINT; Schema: to_do_list; Owner: postgres
--

ALTER TABLE ONLY to_do_list."user"
    ADD CONSTRAINT unique_username UNIQUE (username);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: to_do_list; Owner: postgres
--

ALTER TABLE ONLY to_do_list."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: card fk_board; Type: FK CONSTRAINT; Schema: to_do_list; Owner: postgres
--

ALTER TABLE ONLY to_do_list.card
    ADD CONSTRAINT fk_board FOREIGN KEY (board_id) REFERENCES to_do_list.board(id);


--
-- Name: notes fk_card; Type: FK CONSTRAINT; Schema: to_do_list; Owner: postgres
--

ALTER TABLE ONLY to_do_list.notes
    ADD CONSTRAINT fk_card FOREIGN KEY (card_id) REFERENCES to_do_list.card(id);


--
-- Name: card fk_notes; Type: FK CONSTRAINT; Schema: to_do_list; Owner: postgres
--

ALTER TABLE ONLY to_do_list.card
    ADD CONSTRAINT fk_notes FOREIGN KEY (notes_id) REFERENCES to_do_list.notes(id);


--
-- Name: image fk_notes; Type: FK CONSTRAINT; Schema: to_do_list; Owner: postgres
--

ALTER TABLE ONLY to_do_list.image
    ADD CONSTRAINT fk_notes FOREIGN KEY (notes_id) REFERENCES to_do_list.notes(id);


--
-- Name: card fk_status; Type: FK CONSTRAINT; Schema: to_do_list; Owner: postgres
--

ALTER TABLE ONLY to_do_list.card
    ADD CONSTRAINT fk_status FOREIGN KEY (status_id) REFERENCES to_do_list.status(id);


--
-- Name: board fk_user; Type: FK CONSTRAINT; Schema: to_do_list; Owner: postgres
--

ALTER TABLE ONLY to_do_list.board
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES to_do_list."user"(id);


--
-- PostgreSQL database dump complete
--


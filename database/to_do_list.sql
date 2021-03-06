PGDMP     -        
            z        
   to_do_list    12.10    14.2 9    P           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            Q           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            R           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            S           1262    16696 
   to_do_list    DATABASE     g   CREATE DATABASE to_do_list WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE to_do_list;
                postgres    false                        2615    16697 
   to_do_list    SCHEMA        CREATE SCHEMA to_do_list;
    DROP SCHEMA to_do_list;
                postgres    false            ?            1259    16698    board    TABLE     ?   CREATE TABLE to_do_list.board (
    id integer NOT NULL,
    user_id integer NOT NULL,
    title character varying(30)[] NOT NULL
);
    DROP TABLE to_do_list.board;
    
   to_do_list         heap    postgres    false    5            ?            1259    16704    board_id_seq    SEQUENCE     ?   CREATE SEQUENCE to_do_list.board_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE to_do_list.board_id_seq;
    
   to_do_list          postgres    false    203    5            T           0    0    board_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE to_do_list.board_id_seq OWNED BY to_do_list.board.id;
       
   to_do_list          postgres    false    204            ?            1259    16706    card    TABLE     ?   CREATE TABLE to_do_list.card (
    id integer NOT NULL,
    title character varying(30)[] NOT NULL,
    duration integer,
    start_date date,
    end_date date,
    board_id integer,
    notes_id integer,
    status_id integer
);
    DROP TABLE to_do_list.card;
    
   to_do_list         heap    postgres    false    5            ?            1259    16712    card_id_seq    SEQUENCE     ?   CREATE SEQUENCE to_do_list.card_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE to_do_list.card_id_seq;
    
   to_do_list          postgres    false    5    205            U           0    0    card_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE to_do_list.card_id_seq OWNED BY to_do_list.card.id;
       
   to_do_list          postgres    false    206            ?            1259    16714    image    TABLE     b   CREATE TABLE to_do_list.image (
    id integer NOT NULL,
    image bytea,
    notes_id integer
);
    DROP TABLE to_do_list.image;
    
   to_do_list         heap    postgres    false    5            ?            1259    16720    image_id_seq    SEQUENCE     ?   CREATE SEQUENCE to_do_list.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE to_do_list.image_id_seq;
    
   to_do_list          postgres    false    207    5            V           0    0    image_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE to_do_list.image_id_seq OWNED BY to_do_list.image.id;
       
   to_do_list          postgres    false    208            ?            1259    16722    notes    TABLE     k   CREATE TABLE to_do_list.notes (
    id integer NOT NULL,
    card_id integer NOT NULL,
    content text
);
    DROP TABLE to_do_list.notes;
    
   to_do_list         heap    postgres    false    5            ?            1259    16728    notes_id_seq    SEQUENCE     ?   CREATE SEQUENCE to_do_list.notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE to_do_list.notes_id_seq;
    
   to_do_list          postgres    false    209    5            W           0    0    notes_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE to_do_list.notes_id_seq OWNED BY to_do_list.notes.id;
       
   to_do_list          postgres    false    210            ?            1259    16730    status    TABLE     ?   CREATE TABLE to_do_list.status (
    id integer NOT NULL,
    name character varying(30)[] NOT NULL,
    description character varying(80)[] NOT NULL
);
    DROP TABLE to_do_list.status;
    
   to_do_list         heap    postgres    false    5            ?            1259    16736    status_id_seq    SEQUENCE     ?   CREATE SEQUENCE to_do_list.status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE to_do_list.status_id_seq;
    
   to_do_list          postgres    false    211    5            X           0    0    status_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE to_do_list.status_id_seq OWNED BY to_do_list.status.id;
       
   to_do_list          postgres    false    212            ?            1259    16738    user    TABLE     ?   CREATE TABLE to_do_list."user" (
    id integer NOT NULL,
    password character varying(20)[] NOT NULL,
    username character varying(20)[] NOT NULL,
    email character varying(40)[] NOT NULL
);
    DROP TABLE to_do_list."user";
    
   to_do_list         heap    postgres    false    5            ?            1259    16744    user_id_seq    SEQUENCE     ?   CREATE SEQUENCE to_do_list.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE to_do_list.user_id_seq;
    
   to_do_list          postgres    false    5    213            Y           0    0    user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE to_do_list.user_id_seq OWNED BY to_do_list."user".id;
       
   to_do_list          postgres    false    214            ?
           2604    16746    board id    DEFAULT     l   ALTER TABLE ONLY to_do_list.board ALTER COLUMN id SET DEFAULT nextval('to_do_list.board_id_seq'::regclass);
 ;   ALTER TABLE to_do_list.board ALTER COLUMN id DROP DEFAULT;
    
   to_do_list          postgres    false    204    203            ?
           2604    16747    card id    DEFAULT     j   ALTER TABLE ONLY to_do_list.card ALTER COLUMN id SET DEFAULT nextval('to_do_list.card_id_seq'::regclass);
 :   ALTER TABLE to_do_list.card ALTER COLUMN id DROP DEFAULT;
    
   to_do_list          postgres    false    206    205            ?
           2604    16748    image id    DEFAULT     l   ALTER TABLE ONLY to_do_list.image ALTER COLUMN id SET DEFAULT nextval('to_do_list.image_id_seq'::regclass);
 ;   ALTER TABLE to_do_list.image ALTER COLUMN id DROP DEFAULT;
    
   to_do_list          postgres    false    208    207            ?
           2604    16749    notes id    DEFAULT     l   ALTER TABLE ONLY to_do_list.notes ALTER COLUMN id SET DEFAULT nextval('to_do_list.notes_id_seq'::regclass);
 ;   ALTER TABLE to_do_list.notes ALTER COLUMN id DROP DEFAULT;
    
   to_do_list          postgres    false    210    209            ?
           2604    16750 	   status id    DEFAULT     n   ALTER TABLE ONLY to_do_list.status ALTER COLUMN id SET DEFAULT nextval('to_do_list.status_id_seq'::regclass);
 <   ALTER TABLE to_do_list.status ALTER COLUMN id DROP DEFAULT;
    
   to_do_list          postgres    false    212    211            ?
           2604    16751    user id    DEFAULT     l   ALTER TABLE ONLY to_do_list."user" ALTER COLUMN id SET DEFAULT nextval('to_do_list.user_id_seq'::regclass);
 <   ALTER TABLE to_do_list."user" ALTER COLUMN id DROP DEFAULT;
    
   to_do_list          postgres    false    214    213            B          0    16698    board 
   TABLE DATA           7   COPY to_do_list.board (id, user_id, title) FROM stdin;
 
   to_do_list          postgres    false    203   ?=       D          0    16706    card 
   TABLE DATA           l   COPY to_do_list.card (id, title, duration, start_date, end_date, board_id, notes_id, status_id) FROM stdin;
 
   to_do_list          postgres    false    205   ?=       F          0    16714    image 
   TABLE DATA           8   COPY to_do_list.image (id, image, notes_id) FROM stdin;
 
   to_do_list          postgres    false    207   ?=       H          0    16722    notes 
   TABLE DATA           9   COPY to_do_list.notes (id, card_id, content) FROM stdin;
 
   to_do_list          postgres    false    209   ?=       J          0    16730    status 
   TABLE DATA           ;   COPY to_do_list.status (id, name, description) FROM stdin;
 
   to_do_list          postgres    false    211   >       L          0    16738    user 
   TABLE DATA           C   COPY to_do_list."user" (id, password, username, email) FROM stdin;
 
   to_do_list          postgres    false    213   )>       Z           0    0    board_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('to_do_list.board_id_seq', 1, false);
       
   to_do_list          postgres    false    204            [           0    0    card_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('to_do_list.card_id_seq', 1, false);
       
   to_do_list          postgres    false    206            \           0    0    image_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('to_do_list.image_id_seq', 1, false);
       
   to_do_list          postgres    false    208            ]           0    0    notes_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('to_do_list.notes_id_seq', 1, false);
       
   to_do_list          postgres    false    210            ^           0    0    status_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('to_do_list.status_id_seq', 1, false);
       
   to_do_list          postgres    false    212            _           0    0    user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('to_do_list.user_id_seq', 1, false);
       
   to_do_list          postgres    false    214            ?
           2606    16753    board board_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY to_do_list.board
    ADD CONSTRAINT board_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY to_do_list.board DROP CONSTRAINT board_pkey;
    
   to_do_list            postgres    false    203            ?
           2606    16755    card card_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY to_do_list.card
    ADD CONSTRAINT card_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY to_do_list.card DROP CONSTRAINT card_pkey;
    
   to_do_list            postgres    false    205            ?
           2606    16757    image image_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY to_do_list.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY to_do_list.image DROP CONSTRAINT image_pkey;
    
   to_do_list            postgres    false    207            ?
           2606    16759    notes notes_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY to_do_list.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY to_do_list.notes DROP CONSTRAINT notes_pkey;
    
   to_do_list            postgres    false    209            ?
           2606    16761    status status_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY to_do_list.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY to_do_list.status DROP CONSTRAINT status_pkey;
    
   to_do_list            postgres    false    211            ?
           2606    16763    card unique_card_title 
   CONSTRAINT     V   ALTER TABLE ONLY to_do_list.card
    ADD CONSTRAINT unique_card_title UNIQUE (title);
 D   ALTER TABLE ONLY to_do_list.card DROP CONSTRAINT unique_card_title;
    
   to_do_list            postgres    false    205            ?
           2606    16801    user unique_email 
   CONSTRAINT     S   ALTER TABLE ONLY to_do_list."user"
    ADD CONSTRAINT unique_email UNIQUE (email);
 A   ALTER TABLE ONLY to_do_list."user" DROP CONSTRAINT unique_email;
    
   to_do_list            postgres    false    213            ?
           2606    16765    board unique_title 
   CONSTRAINT     R   ALTER TABLE ONLY to_do_list.board
    ADD CONSTRAINT unique_title UNIQUE (title);
 @   ALTER TABLE ONLY to_do_list.board DROP CONSTRAINT unique_title;
    
   to_do_list            postgres    false    203            ?
           2606    16767    user unique_username 
   CONSTRAINT     Y   ALTER TABLE ONLY to_do_list."user"
    ADD CONSTRAINT unique_username UNIQUE (username);
 D   ALTER TABLE ONLY to_do_list."user" DROP CONSTRAINT unique_username;
    
   to_do_list            postgres    false    213            ?
           2606    16769    user user_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY to_do_list."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY to_do_list."user" DROP CONSTRAINT user_pkey;
    
   to_do_list            postgres    false    213            ?
           2606    16770    card fk_board    FK CONSTRAINT     u   ALTER TABLE ONLY to_do_list.card
    ADD CONSTRAINT fk_board FOREIGN KEY (board_id) REFERENCES to_do_list.board(id);
 ;   ALTER TABLE ONLY to_do_list.card DROP CONSTRAINT fk_board;
    
   to_do_list          postgres    false    2731    205    203            ?
           2606    16775    notes fk_card    FK CONSTRAINT     s   ALTER TABLE ONLY to_do_list.notes
    ADD CONSTRAINT fk_card FOREIGN KEY (card_id) REFERENCES to_do_list.card(id);
 ;   ALTER TABLE ONLY to_do_list.notes DROP CONSTRAINT fk_card;
    
   to_do_list          postgres    false    2735    209    205            ?
           2606    16780    card fk_notes    FK CONSTRAINT     u   ALTER TABLE ONLY to_do_list.card
    ADD CONSTRAINT fk_notes FOREIGN KEY (notes_id) REFERENCES to_do_list.notes(id);
 ;   ALTER TABLE ONLY to_do_list.card DROP CONSTRAINT fk_notes;
    
   to_do_list          postgres    false    205    209    2741            ?
           2606    16785    image fk_notes    FK CONSTRAINT     v   ALTER TABLE ONLY to_do_list.image
    ADD CONSTRAINT fk_notes FOREIGN KEY (notes_id) REFERENCES to_do_list.notes(id);
 <   ALTER TABLE ONLY to_do_list.image DROP CONSTRAINT fk_notes;
    
   to_do_list          postgres    false    2741    209    207            ?
           2606    16790    card fk_status    FK CONSTRAINT     x   ALTER TABLE ONLY to_do_list.card
    ADD CONSTRAINT fk_status FOREIGN KEY (status_id) REFERENCES to_do_list.status(id);
 <   ALTER TABLE ONLY to_do_list.card DROP CONSTRAINT fk_status;
    
   to_do_list          postgres    false    211    2743    205            ?
           2606    16795    board fk_user    FK CONSTRAINT     u   ALTER TABLE ONLY to_do_list.board
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES to_do_list."user"(id);
 ;   ALTER TABLE ONLY to_do_list.board DROP CONSTRAINT fk_user;
    
   to_do_list          postgres    false    203    2749    213            B      x?????? ? ?      D      x?????? ? ?      F      x?????? ? ?      H      x?????? ? ?      J      x?????? ? ?      L      x?????? ? ?     
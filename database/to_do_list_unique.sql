PGDMP         "                z        
   to_do_list    12.2    12.2 7    O           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            P           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            Q           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            R           1262    168966 
   to_do_list    DATABASE     ?   CREATE DATABASE to_do_list WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Mexico.1252' LC_CTYPE = 'Spanish_Mexico.1252';
    DROP DATABASE to_do_list;
                postgres    false                        2615    168976 
   to_do_list    SCHEMA        CREATE SCHEMA to_do_list;
    DROP SCHEMA to_do_list;
                postgres    false            ?            1259    168977    board    TABLE     ?   CREATE TABLE to_do_list.board (
    id integer NOT NULL,
    user_id integer NOT NULL,
    title character varying(30)[] NOT NULL
);
    DROP TABLE to_do_list.board;
    
   to_do_list         heap    postgres    false    8            ?            1259    168983    board_id_seq    SEQUENCE     ?   CREATE SEQUENCE to_do_list.board_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE to_do_list.board_id_seq;
    
   to_do_list          postgres    false    203    8            S           0    0    board_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE to_do_list.board_id_seq OWNED BY to_do_list.board.id;
       
   to_do_list          postgres    false    204            ?            1259    168985    card    TABLE     ?   CREATE TABLE to_do_list.card (
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
   to_do_list         heap    postgres    false    8            ?            1259    168991    card_id_seq    SEQUENCE     ?   CREATE SEQUENCE to_do_list.card_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE to_do_list.card_id_seq;
    
   to_do_list          postgres    false    205    8            T           0    0    card_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE to_do_list.card_id_seq OWNED BY to_do_list.card.id;
       
   to_do_list          postgres    false    206            ?            1259    168993    image    TABLE     b   CREATE TABLE to_do_list.image (
    id integer NOT NULL,
    image bytea,
    notes_id integer
);
    DROP TABLE to_do_list.image;
    
   to_do_list         heap    postgres    false    8            ?            1259    168999    image_id_seq    SEQUENCE     ?   CREATE SEQUENCE to_do_list.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE to_do_list.image_id_seq;
    
   to_do_list          postgres    false    8    207            U           0    0    image_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE to_do_list.image_id_seq OWNED BY to_do_list.image.id;
       
   to_do_list          postgres    false    208            ?            1259    169001    notes    TABLE     k   CREATE TABLE to_do_list.notes (
    id integer NOT NULL,
    card_id integer NOT NULL,
    content text
);
    DROP TABLE to_do_list.notes;
    
   to_do_list         heap    postgres    false    8            ?            1259    169007    notes_id_seq    SEQUENCE     ?   CREATE SEQUENCE to_do_list.notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE to_do_list.notes_id_seq;
    
   to_do_list          postgres    false    8    209            V           0    0    notes_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE to_do_list.notes_id_seq OWNED BY to_do_list.notes.id;
       
   to_do_list          postgres    false    210            ?            1259    169009    status    TABLE     ?   CREATE TABLE to_do_list.status (
    id integer NOT NULL,
    name character varying(30)[] NOT NULL,
    description character varying(80)[] NOT NULL
);
    DROP TABLE to_do_list.status;
    
   to_do_list         heap    postgres    false    8            ?            1259    169015    status_id_seq    SEQUENCE     ?   CREATE SEQUENCE to_do_list.status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE to_do_list.status_id_seq;
    
   to_do_list          postgres    false    211    8            W           0    0    status_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE to_do_list.status_id_seq OWNED BY to_do_list.status.id;
       
   to_do_list          postgres    false    212            ?            1259    169223    users_id_seq    SEQUENCE     y   CREATE SEQUENCE to_do_list.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE to_do_list.users_id_seq;
    
   to_do_list          postgres    false    8            ?            1259    169225    users    TABLE        CREATE TABLE to_do_list.users (
    id bigint DEFAULT nextval('to_do_list.users_id_seq'::regclass) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    username text,
    email text,
    password text
);
    DROP TABLE to_do_list.users;
    
   to_do_list         heap    postgres    false    213    8            ?
           2604    169025    board id    DEFAULT     l   ALTER TABLE ONLY to_do_list.board ALTER COLUMN id SET DEFAULT nextval('to_do_list.board_id_seq'::regclass);
 ;   ALTER TABLE to_do_list.board ALTER COLUMN id DROP DEFAULT;
    
   to_do_list          postgres    false    204    203            ?
           2604    169026    card id    DEFAULT     j   ALTER TABLE ONLY to_do_list.card ALTER COLUMN id SET DEFAULT nextval('to_do_list.card_id_seq'::regclass);
 :   ALTER TABLE to_do_list.card ALTER COLUMN id DROP DEFAULT;
    
   to_do_list          postgres    false    206    205            ?
           2604    169027    image id    DEFAULT     l   ALTER TABLE ONLY to_do_list.image ALTER COLUMN id SET DEFAULT nextval('to_do_list.image_id_seq'::regclass);
 ;   ALTER TABLE to_do_list.image ALTER COLUMN id DROP DEFAULT;
    
   to_do_list          postgres    false    208    207            ?
           2604    169028    notes id    DEFAULT     l   ALTER TABLE ONLY to_do_list.notes ALTER COLUMN id SET DEFAULT nextval('to_do_list.notes_id_seq'::regclass);
 ;   ALTER TABLE to_do_list.notes ALTER COLUMN id DROP DEFAULT;
    
   to_do_list          postgres    false    210    209            ?
           2604    169029 	   status id    DEFAULT     n   ALTER TABLE ONLY to_do_list.status ALTER COLUMN id SET DEFAULT nextval('to_do_list.status_id_seq'::regclass);
 <   ALTER TABLE to_do_list.status ALTER COLUMN id DROP DEFAULT;
    
   to_do_list          postgres    false    212    211            A          0    168977    board 
   TABLE DATA           7   COPY to_do_list.board (id, user_id, title) FROM stdin;
 
   to_do_list          postgres    false    203   F<       C          0    168985    card 
   TABLE DATA           l   COPY to_do_list.card (id, title, duration, start_date, end_date, board_id, notes_id, status_id) FROM stdin;
 
   to_do_list          postgres    false    205   c<       E          0    168993    image 
   TABLE DATA           8   COPY to_do_list.image (id, image, notes_id) FROM stdin;
 
   to_do_list          postgres    false    207   ?<       G          0    169001    notes 
   TABLE DATA           9   COPY to_do_list.notes (id, card_id, content) FROM stdin;
 
   to_do_list          postgres    false    209   ?<       I          0    169009    status 
   TABLE DATA           ;   COPY to_do_list.status (id, name, description) FROM stdin;
 
   to_do_list          postgres    false    211   ?<       L          0    169225    users 
   TABLE DATA           f   COPY to_do_list.users (id, created_at, updated_at, deleted_at, username, email, password) FROM stdin;
 
   to_do_list          postgres    false    214   ?<       X           0    0    board_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('to_do_list.board_id_seq', 1, false);
       
   to_do_list          postgres    false    204            Y           0    0    card_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('to_do_list.card_id_seq', 1, false);
       
   to_do_list          postgres    false    206            Z           0    0    image_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('to_do_list.image_id_seq', 1, false);
       
   to_do_list          postgres    false    208            [           0    0    notes_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('to_do_list.notes_id_seq', 1, false);
       
   to_do_list          postgres    false    210            \           0    0    status_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('to_do_list.status_id_seq', 1, false);
       
   to_do_list          postgres    false    212            ]           0    0    users_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('to_do_list.users_id_seq', 1, false);
       
   to_do_list          postgres    false    213            ?
           2606    169032    board board_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY to_do_list.board
    ADD CONSTRAINT board_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY to_do_list.board DROP CONSTRAINT board_pkey;
    
   to_do_list            postgres    false    203            ?
           2606    169034    card card_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY to_do_list.card
    ADD CONSTRAINT card_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY to_do_list.card DROP CONSTRAINT card_pkey;
    
   to_do_list            postgres    false    205            ?
           2606    169036    image image_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY to_do_list.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY to_do_list.image DROP CONSTRAINT image_pkey;
    
   to_do_list            postgres    false    207            ?
           2606    169038    notes notes_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY to_do_list.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY to_do_list.notes DROP CONSTRAINT notes_pkey;
    
   to_do_list            postgres    false    209            ?
           2606    169040    status status_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY to_do_list.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY to_do_list.status DROP CONSTRAINT status_pkey;
    
   to_do_list            postgres    false    211            ?
           2606    169042    card unique_card_title 
   CONSTRAINT     V   ALTER TABLE ONLY to_do_list.card
    ADD CONSTRAINT unique_card_title UNIQUE (title);
 D   ALTER TABLE ONLY to_do_list.card DROP CONSTRAINT unique_card_title;
    
   to_do_list            postgres    false    205            ?
           2606    169046    board unique_title 
   CONSTRAINT     R   ALTER TABLE ONLY to_do_list.board
    ADD CONSTRAINT unique_title UNIQUE (title);
 @   ALTER TABLE ONLY to_do_list.board DROP CONSTRAINT unique_title;
    
   to_do_list            postgres    false    203            ?
           2606    169344    users unique_username 
   CONSTRAINT     X   ALTER TABLE ONLY to_do_list.users
    ADD CONSTRAINT unique_username UNIQUE (username);
 C   ALTER TABLE ONLY to_do_list.users DROP CONSTRAINT unique_username;
    
   to_do_list            postgres    false    214            ?
           2606    169233    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY to_do_list.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY to_do_list.users DROP CONSTRAINT users_pkey;
    
   to_do_list            postgres    false    214            ?
           1259    169234    idx_to_do_list_users_deleted_at    INDEX     [   CREATE INDEX idx_to_do_list_users_deleted_at ON to_do_list.users USING btree (deleted_at);
 7   DROP INDEX to_do_list.idx_to_do_list_users_deleted_at;
    
   to_do_list            postgres    false    214            ?
           2606    169051    card fk_board    FK CONSTRAINT     u   ALTER TABLE ONLY to_do_list.card
    ADD CONSTRAINT fk_board FOREIGN KEY (board_id) REFERENCES to_do_list.board(id);
 ;   ALTER TABLE ONLY to_do_list.card DROP CONSTRAINT fk_board;
    
   to_do_list          postgres    false    205    2731    203            ?
           2606    169056    notes fk_card    FK CONSTRAINT     s   ALTER TABLE ONLY to_do_list.notes
    ADD CONSTRAINT fk_card FOREIGN KEY (card_id) REFERENCES to_do_list.card(id);
 ;   ALTER TABLE ONLY to_do_list.notes DROP CONSTRAINT fk_card;
    
   to_do_list          postgres    false    2735    205    209            ?
           2606    169061    card fk_notes    FK CONSTRAINT     u   ALTER TABLE ONLY to_do_list.card
    ADD CONSTRAINT fk_notes FOREIGN KEY (notes_id) REFERENCES to_do_list.notes(id);
 ;   ALTER TABLE ONLY to_do_list.card DROP CONSTRAINT fk_notes;
    
   to_do_list          postgres    false    2741    205    209            ?
           2606    169066    image fk_notes    FK CONSTRAINT     v   ALTER TABLE ONLY to_do_list.image
    ADD CONSTRAINT fk_notes FOREIGN KEY (notes_id) REFERENCES to_do_list.notes(id);
 <   ALTER TABLE ONLY to_do_list.image DROP CONSTRAINT fk_notes;
    
   to_do_list          postgres    false    2741    207    209            ?
           2606    169071    card fk_status    FK CONSTRAINT     x   ALTER TABLE ONLY to_do_list.card
    ADD CONSTRAINT fk_status FOREIGN KEY (status_id) REFERENCES to_do_list.status(id);
 <   ALTER TABLE ONLY to_do_list.card DROP CONSTRAINT fk_status;
    
   to_do_list          postgres    false    2743    211    205            ?
           2606    169235    board fk_user    FK CONSTRAINT     t   ALTER TABLE ONLY to_do_list.board
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES to_do_list.users(id);
 ;   ALTER TABLE ONLY to_do_list.board DROP CONSTRAINT fk_user;
    
   to_do_list          postgres    false    203    214    2748            A      x?????? ? ?      C      x?????? ? ?      E      x?????? ? ?      G      x?????? ? ?      I      x?????? ? ?      L      x?????? ? ?     
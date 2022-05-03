PGDMP         &                z        
   to_do_list    12.10    14.2 8    N           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            O           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            P           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            Q           1262    16573 
   to_do_list    DATABASE     g   CREATE DATABASE to_do_list WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE to_do_list;
                postgres    false                        2615    16574 
   to_do_list    SCHEMA        CREATE SCHEMA to_do_list;
    DROP SCHEMA to_do_list;
                postgres    false            �            1259    16594    board    TABLE     �   CREATE TABLE to_do_list.board (
    id integer NOT NULL,
    user_id integer NOT NULL,
    title character varying(30)[] NOT NULL
);
    DROP TABLE to_do_list.board;
    
   to_do_list         heap    postgres    false    8            �            1259    16592    board_id_seq    SEQUENCE     �   CREATE SEQUENCE to_do_list.board_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE to_do_list.board_id_seq;
    
   to_do_list          postgres    false    8    206            R           0    0    board_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE to_do_list.board_id_seq OWNED BY to_do_list.board.id;
       
   to_do_list          postgres    false    205            �            1259    16644    card    TABLE     �   CREATE TABLE to_do_list.card (
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
   to_do_list         heap    postgres    false    8            �            1259    16642    card_id_seq    SEQUENCE     �   CREATE SEQUENCE to_do_list.card_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE to_do_list.card_id_seq;
    
   to_do_list          postgres    false    212    8            S           0    0    card_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE to_do_list.card_id_seq OWNED BY to_do_list.card.id;
       
   to_do_list          postgres    false    211            �            1259    16655    image    TABLE     b   CREATE TABLE to_do_list.image (
    id integer NOT NULL,
    image bytea,
    notes_id integer
);
    DROP TABLE to_do_list.image;
    
   to_do_list         heap    postgres    false    8            �            1259    16653    image_id_seq    SEQUENCE     �   CREATE SEQUENCE to_do_list.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE to_do_list.image_id_seq;
    
   to_do_list          postgres    false    214    8            T           0    0    image_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE to_do_list.image_id_seq OWNED BY to_do_list.image.id;
       
   to_do_list          postgres    false    213            �            1259    16633    notes    TABLE     k   CREATE TABLE to_do_list.notes (
    id integer NOT NULL,
    card_id integer NOT NULL,
    content text
);
    DROP TABLE to_do_list.notes;
    
   to_do_list         heap    postgres    false    8            �            1259    16631    notes_id_seq    SEQUENCE     �   CREATE SEQUENCE to_do_list.notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE to_do_list.notes_id_seq;
    
   to_do_list          postgres    false    210    8            U           0    0    notes_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE to_do_list.notes_id_seq OWNED BY to_do_list.notes.id;
       
   to_do_list          postgres    false    209            �            1259    16622    status    TABLE     �   CREATE TABLE to_do_list.status (
    id integer NOT NULL,
    name character varying(30)[] NOT NULL,
    description character varying(80)[] NOT NULL
);
    DROP TABLE to_do_list.status;
    
   to_do_list         heap    postgres    false    8            �            1259    16620    status_id_seq    SEQUENCE     �   CREATE SEQUENCE to_do_list.status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE to_do_list.status_id_seq;
    
   to_do_list          postgres    false    8    208            V           0    0    status_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE to_do_list.status_id_seq OWNED BY to_do_list.status.id;
       
   to_do_list          postgres    false    207            �            1259    16577    user    TABLE     �   CREATE TABLE to_do_list."user" (
    id integer NOT NULL,
    password character varying(20)[] NOT NULL,
    username character varying(20)[] NOT NULL,
    email character varying(40)[] NOT NULL
);
    DROP TABLE to_do_list."user";
    
   to_do_list         heap    postgres    false    8            �            1259    16575    user_id_seq    SEQUENCE     �   CREATE SEQUENCE to_do_list.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE to_do_list.user_id_seq;
    
   to_do_list          postgres    false    204    8            W           0    0    user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE to_do_list.user_id_seq OWNED BY to_do_list."user".id;
       
   to_do_list          postgres    false    203            �
           2604    16597    board id    DEFAULT     l   ALTER TABLE ONLY to_do_list.board ALTER COLUMN id SET DEFAULT nextval('to_do_list.board_id_seq'::regclass);
 ;   ALTER TABLE to_do_list.board ALTER COLUMN id DROP DEFAULT;
    
   to_do_list          postgres    false    205    206    206            �
           2604    16647    card id    DEFAULT     j   ALTER TABLE ONLY to_do_list.card ALTER COLUMN id SET DEFAULT nextval('to_do_list.card_id_seq'::regclass);
 :   ALTER TABLE to_do_list.card ALTER COLUMN id DROP DEFAULT;
    
   to_do_list          postgres    false    211    212    212            �
           2604    16658    image id    DEFAULT     l   ALTER TABLE ONLY to_do_list.image ALTER COLUMN id SET DEFAULT nextval('to_do_list.image_id_seq'::regclass);
 ;   ALTER TABLE to_do_list.image ALTER COLUMN id DROP DEFAULT;
    
   to_do_list          postgres    false    213    214    214            �
           2604    16636    notes id    DEFAULT     l   ALTER TABLE ONLY to_do_list.notes ALTER COLUMN id SET DEFAULT nextval('to_do_list.notes_id_seq'::regclass);
 ;   ALTER TABLE to_do_list.notes ALTER COLUMN id DROP DEFAULT;
    
   to_do_list          postgres    false    210    209    210            �
           2604    16625 	   status id    DEFAULT     n   ALTER TABLE ONLY to_do_list.status ALTER COLUMN id SET DEFAULT nextval('to_do_list.status_id_seq'::regclass);
 <   ALTER TABLE to_do_list.status ALTER COLUMN id DROP DEFAULT;
    
   to_do_list          postgres    false    207    208    208            �
           2604    16580    user id    DEFAULT     l   ALTER TABLE ONLY to_do_list."user" ALTER COLUMN id SET DEFAULT nextval('to_do_list.user_id_seq'::regclass);
 <   ALTER TABLE to_do_list."user" ALTER COLUMN id DROP DEFAULT;
    
   to_do_list          postgres    false    204    203    204            C          0    16594    board 
   TABLE DATA           7   COPY to_do_list.board (id, user_id, title) FROM stdin;
 
   to_do_list          postgres    false    206   �<       I          0    16644    card 
   TABLE DATA           l   COPY to_do_list.card (id, title, duration, start_date, end_date, board_id, notes_id, status_id) FROM stdin;
 
   to_do_list          postgres    false    212   �<       K          0    16655    image 
   TABLE DATA           8   COPY to_do_list.image (id, image, notes_id) FROM stdin;
 
   to_do_list          postgres    false    214   �<       G          0    16633    notes 
   TABLE DATA           9   COPY to_do_list.notes (id, card_id, content) FROM stdin;
 
   to_do_list          postgres    false    210   �<       E          0    16622    status 
   TABLE DATA           ;   COPY to_do_list.status (id, name, description) FROM stdin;
 
   to_do_list          postgres    false    208   =       A          0    16577    user 
   TABLE DATA           C   COPY to_do_list."user" (id, password, username, email) FROM stdin;
 
   to_do_list          postgres    false    204   )=       X           0    0    board_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('to_do_list.board_id_seq', 1, false);
       
   to_do_list          postgres    false    205            Y           0    0    card_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('to_do_list.card_id_seq', 1, false);
       
   to_do_list          postgres    false    211            Z           0    0    image_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('to_do_list.image_id_seq', 1, false);
       
   to_do_list          postgres    false    213            [           0    0    notes_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('to_do_list.notes_id_seq', 1, false);
       
   to_do_list          postgres    false    209            \           0    0    status_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('to_do_list.status_id_seq', 1, false);
       
   to_do_list          postgres    false    207            ]           0    0    user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('to_do_list.user_id_seq', 1, false);
       
   to_do_list          postgres    false    203            �
           2606    16602    board board_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY to_do_list.board
    ADD CONSTRAINT board_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY to_do_list.board DROP CONSTRAINT board_pkey;
    
   to_do_list            postgres    false    206            �
           2606    16652    card card_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY to_do_list.card
    ADD CONSTRAINT card_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY to_do_list.card DROP CONSTRAINT card_pkey;
    
   to_do_list            postgres    false    212            �
           2606    16663    image image_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY to_do_list.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY to_do_list.image DROP CONSTRAINT image_pkey;
    
   to_do_list            postgres    false    214            �
           2606    16641    notes notes_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY to_do_list.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY to_do_list.notes DROP CONSTRAINT notes_pkey;
    
   to_do_list            postgres    false    210            �
           2606    16630    status status_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY to_do_list.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY to_do_list.status DROP CONSTRAINT status_pkey;
    
   to_do_list            postgres    false    208            �
           2606    16692    card unique_card_title 
   CONSTRAINT     V   ALTER TABLE ONLY to_do_list.card
    ADD CONSTRAINT unique_card_title UNIQUE (title);
 D   ALTER TABLE ONLY to_do_list.card DROP CONSTRAINT unique_card_title;
    
   to_do_list            postgres    false    212            �
           2606    16690    board unique_title 
   CONSTRAINT     R   ALTER TABLE ONLY to_do_list.board
    ADD CONSTRAINT unique_title UNIQUE (title);
 @   ALTER TABLE ONLY to_do_list.board DROP CONSTRAINT unique_title;
    
   to_do_list            postgres    false    206            �
           2606    16694    user unique_username 
   CONSTRAINT     Y   ALTER TABLE ONLY to_do_list."user"
    ADD CONSTRAINT unique_username UNIQUE (username);
 D   ALTER TABLE ONLY to_do_list."user" DROP CONSTRAINT unique_username;
    
   to_do_list            postgres    false    204            �
           2606    16585    user user_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY to_do_list."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY to_do_list."user" DROP CONSTRAINT user_pkey;
    
   to_do_list            postgres    false    204            �
           2606    16664    card fk_board    FK CONSTRAINT     u   ALTER TABLE ONLY to_do_list.card
    ADD CONSTRAINT fk_board FOREIGN KEY (board_id) REFERENCES to_do_list.board(id);
 ;   ALTER TABLE ONLY to_do_list.card DROP CONSTRAINT fk_board;
    
   to_do_list          postgres    false    2735    212    206            �
           2606    16679    notes fk_card    FK CONSTRAINT     s   ALTER TABLE ONLY to_do_list.notes
    ADD CONSTRAINT fk_card FOREIGN KEY (card_id) REFERENCES to_do_list.card(id);
 ;   ALTER TABLE ONLY to_do_list.notes DROP CONSTRAINT fk_card;
    
   to_do_list          postgres    false    2743    212    210            �
           2606    16669    card fk_notes    FK CONSTRAINT     u   ALTER TABLE ONLY to_do_list.card
    ADD CONSTRAINT fk_notes FOREIGN KEY (notes_id) REFERENCES to_do_list.notes(id);
 ;   ALTER TABLE ONLY to_do_list.card DROP CONSTRAINT fk_notes;
    
   to_do_list          postgres    false    2741    210    212            �
           2606    16684    image fk_notes    FK CONSTRAINT     v   ALTER TABLE ONLY to_do_list.image
    ADD CONSTRAINT fk_notes FOREIGN KEY (notes_id) REFERENCES to_do_list.notes(id);
 <   ALTER TABLE ONLY to_do_list.image DROP CONSTRAINT fk_notes;
    
   to_do_list          postgres    false    210    214    2741            �
           2606    16674    card fk_status    FK CONSTRAINT     x   ALTER TABLE ONLY to_do_list.card
    ADD CONSTRAINT fk_status FOREIGN KEY (status_id) REFERENCES to_do_list.status(id);
 <   ALTER TABLE ONLY to_do_list.card DROP CONSTRAINT fk_status;
    
   to_do_list          postgres    false    212    2739    208            �
           2606    16603    board fk_user    FK CONSTRAINT     u   ALTER TABLE ONLY to_do_list.board
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES to_do_list."user"(id);
 ;   ALTER TABLE ONLY to_do_list.board DROP CONSTRAINT fk_user;
    
   to_do_list          postgres    false    204    2733    206            C      x������ � �      I      x������ � �      K      x������ � �      G      x������ � �      E      x������ � �      A      x������ � �     
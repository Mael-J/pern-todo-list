PGDMP         0                x            perntodo    11.4    11.4     �
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                        1262    65683    perntodo    DATABASE     �   CREATE DATABASE perntodo WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
    DROP DATABASE perntodo;
             postgres    false            �            1259    65686    todo    TABLE     c   CREATE TABLE public.todo (
    todo_id integer NOT NULL,
    description character varying(255)
);
    DROP TABLE public.todo;
       public         postgres    false            �            1259    65684    todo_todo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.todo_todo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.todo_todo_id_seq;
       public       postgres    false    197                       0    0    todo_todo_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.todo_todo_id_seq OWNED BY public.todo.todo_id;
            public       postgres    false    196            }
           2604    65689    todo todo_id    DEFAULT     l   ALTER TABLE ONLY public.todo ALTER COLUMN todo_id SET DEFAULT nextval('public.todo_todo_id_seq'::regclass);
 ;   ALTER TABLE public.todo ALTER COLUMN todo_id DROP DEFAULT;
       public       postgres    false    197    196    197            �
          0    65686    todo 
   TABLE DATA               4   COPY public.todo (todo_id, description) FROM stdin;
    public       postgres    false    197    
                  0    0    todo_todo_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.todo_todo_id_seq', 50, true);
            public       postgres    false    196            
           2606    65691    todo todo_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.todo
    ADD CONSTRAINT todo_pkey PRIMARY KEY (todo_id);
 8   ALTER TABLE ONLY public.todo DROP CONSTRAINT todo_pkey;
       public         postgres    false    197            �
      x�3��I,�V0�25����b���� Muj     
PGDMP  /                    }         	   dw_varejo    17.4    17.4 2    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16388 	   dw_varejo    DATABASE     q   CREATE DATABASE dw_varejo WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';
    DROP DATABASE dw_varejo;
                     postgres    false            �            1259    24744    dim_categoria    TABLE     �   CREATE TABLE public.dim_categoria (
    id_categoria integer NOT NULL,
    nome_categoria character varying(50),
    descricao text
);
 !   DROP TABLE public.dim_categoria;
       public         heap r       postgres    false            �            1259    24711    dim_cliente    TABLE     �   CREATE TABLE public.dim_cliente (
    id_cliente integer NOT NULL,
    cpf character varying(11),
    nome character varying(100),
    cidade character varying(50),
    estado character varying(2)
);
    DROP TABLE public.dim_cliente;
       public         heap r       postgres    false            �            1259    24710    dim_cliente_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.dim_cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.dim_cliente_id_cliente_seq;
       public               postgres    false    228            �           0    0    dim_cliente_id_cliente_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.dim_cliente_id_cliente_seq OWNED BY public.dim_cliente.id_cliente;
          public               postgres    false    227            �            1259    16463    dim_loja    TABLE     �   CREATE TABLE public.dim_loja (
    id_loja integer NOT NULL,
    nome_loja character varying(50),
    cidade character varying(50),
    estado character(2)
);
    DROP TABLE public.dim_loja;
       public         heap r       postgres    false            �            1259    16468    dim_produto    TABLE     �   CREATE TABLE public.dim_produto (
    id_produto integer NOT NULL,
    nome_produto character varying(100),
    categoria character varying(50),
    marca character varying(50),
    preco numeric(10,2),
    unidade_medida character varying(20)
);
    DROP TABLE public.dim_produto;
       public         heap r       postgres    false            �            1259    16474 	   dim_tempo    TABLE     �   CREATE TABLE public.dim_tempo (
    id_tempo integer NOT NULL,
    data date,
    dia integer,
    mes integer,
    ano integer,
    trimestre integer
);
    DROP TABLE public.dim_tempo;
       public         heap r       postgres    false            �            1259    16473    dim_tempo_id_tempo_seq    SEQUENCE     �   CREATE SEQUENCE public.dim_tempo_id_tempo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.dim_tempo_id_tempo_seq;
       public               postgres    false    225            �           0    0    dim_tempo_id_tempo_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.dim_tempo_id_tempo_seq OWNED BY public.dim_tempo.id_tempo;
          public               postgres    false    224            �            1259    24718 
   fato_venda    TABLE     �   CREATE TABLE public.fato_venda (
    id_venda integer NOT NULL,
    id_cliente integer,
    id_produto integer,
    id_loja integer,
    id_tempo integer,
    quantidade integer,
    valor_total numeric(10,2),
    desconto numeric(10,2)
);
    DROP TABLE public.fato_venda;
       public         heap r       postgres    false            �            1259    24717    fato_venda_id_venda_seq    SEQUENCE     �   CREATE SEQUENCE public.fato_venda_id_venda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.fato_venda_id_venda_seq;
       public               postgres    false    230            �           0    0    fato_venda_id_venda_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.fato_venda_id_venda_seq OWNED BY public.fato_venda.id_venda;
          public               postgres    false    229            �            1259    16447    staging_categoria    TABLE     �   CREATE TABLE public.staging_categoria (
    id_categoria integer,
    nome_categoria character varying(50),
    descricao text
);
 %   DROP TABLE public.staging_categoria;
       public         heap r       postgres    false            �            1259    16514    staging_cliente    TABLE     P  CREATE TABLE public.staging_cliente (
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
 #   DROP TABLE public.staging_cliente;
       public         heap r       postgres    false            �            1259    16455    staging_item_venda    TABLE     �   CREATE TABLE public.staging_item_venda (
    id_item integer,
    id_venda integer,
    id_produto integer,
    quantidade integer,
    preco_unitario numeric(10,2),
    desconto numeric(10,2),
    valor_total numeric(10,2)
);
 &   DROP TABLE public.staging_item_venda;
       public         heap r       postgres    false            �            1259    16439    staging_loja    TABLE     _  CREATE TABLE public.staging_loja (
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
     DROP TABLE public.staging_loja;
       public         heap r       postgres    false            �            1259    16442    staging_produto    TABLE     >  CREATE TABLE public.staging_produto (
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
 #   DROP TABLE public.staging_produto;
       public         heap r       postgres    false            �            1259    16452    staging_venda    TABLE     V  CREATE TABLE public.staging_venda (
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
 !   DROP TABLE public.staging_venda;
       public         heap r       postgres    false            �           2604    24714    dim_cliente id_cliente    DEFAULT     �   ALTER TABLE ONLY public.dim_cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.dim_cliente_id_cliente_seq'::regclass);
 E   ALTER TABLE public.dim_cliente ALTER COLUMN id_cliente DROP DEFAULT;
       public               postgres    false    228    227    228            �           2604    16477    dim_tempo id_tempo    DEFAULT     x   ALTER TABLE ONLY public.dim_tempo ALTER COLUMN id_tempo SET DEFAULT nextval('public.dim_tempo_id_tempo_seq'::regclass);
 A   ALTER TABLE public.dim_tempo ALTER COLUMN id_tempo DROP DEFAULT;
       public               postgres    false    225    224    225            �           2604    24721    fato_venda id_venda    DEFAULT     z   ALTER TABLE ONLY public.fato_venda ALTER COLUMN id_venda SET DEFAULT nextval('public.fato_venda_id_venda_seq'::regclass);
 B   ALTER TABLE public.fato_venda ALTER COLUMN id_venda DROP DEFAULT;
       public               postgres    false    230    229    230            �          0    24744    dim_categoria 
   TABLE DATA           P   COPY public.dim_categoria (id_categoria, nome_categoria, descricao) FROM stdin;
    public               postgres    false    231   ?       �          0    24711    dim_cliente 
   TABLE DATA           L   COPY public.dim_cliente (id_cliente, cpf, nome, cidade, estado) FROM stdin;
    public               postgres    false    228   G@       �          0    16463    dim_loja 
   TABLE DATA           F   COPY public.dim_loja (id_loja, nome_loja, cidade, estado) FROM stdin;
    public               postgres    false    222   �A       �          0    16468    dim_produto 
   TABLE DATA           h   COPY public.dim_produto (id_produto, nome_produto, categoria, marca, preco, unidade_medida) FROM stdin;
    public               postgres    false    223   �B       �          0    16474 	   dim_tempo 
   TABLE DATA           M   COPY public.dim_tempo (id_tempo, data, dia, mes, ano, trimestre) FROM stdin;
    public               postgres    false    225   �F       �          0    24718 
   fato_venda 
   TABLE DATA           |   COPY public.fato_venda (id_venda, id_cliente, id_produto, id_loja, id_tempo, quantidade, valor_total, desconto) FROM stdin;
    public               postgres    false    230   kG       �          0    16447    staging_categoria 
   TABLE DATA           T   COPY public.staging_categoria (id_categoria, nome_categoria, descricao) FROM stdin;
    public               postgres    false    219   �H       �          0    16514    staging_cliente 
   TABLE DATA           w   COPY public.staging_cliente (id_cliente, cpf, nome, email, telefone, endereco, cidade, estado, cep, ativo) FROM stdin;
    public               postgres    false    226   �I       �          0    16455    staging_item_venda 
   TABLE DATA           ~   COPY public.staging_item_venda (id_item, id_venda, id_produto, quantidade, preco_unitario, desconto, valor_total) FROM stdin;
    public               postgres    false    221   \M       �          0    16439    staging_loja 
   TABLE DATA           �   COPY public.staging_loja (id_loja, codigo_loja, nome_loja, endereco, cidade, estado, cep, telefone, gerente, ativa) FROM stdin;
    public               postgres    false    217   �N       �          0    16442    staging_produto 
   TABLE DATA           �   COPY public.staging_produto (id_produto, codigo_produto, nome_produto, descricao, id_categoria, marca, preco_atual, unidade_medida, ativo) FROM stdin;
    public               postgres    false    218   �P       �          0    16452    staging_venda 
   TABLE DATA           �   COPY public.staging_venda (id_venda, numero_venda, id_cliente, id_loja, id_funcionario, data_venda, valor_total, desconto_total, forma_pagamento, status_venda) FROM stdin;
    public               postgres    false    220   �V       �           0    0    dim_cliente_id_cliente_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.dim_cliente_id_cliente_seq', 1, false);
          public               postgres    false    227            �           0    0    dim_tempo_id_tempo_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.dim_tempo_id_tempo_seq', 14, true);
          public               postgres    false    224            �           0    0    fato_venda_id_venda_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.fato_venda_id_venda_seq', 29, true);
          public               postgres    false    229                       2606    24750     dim_categoria dim_categoria_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.dim_categoria
    ADD CONSTRAINT dim_categoria_pkey PRIMARY KEY (id_categoria);
 J   ALTER TABLE ONLY public.dim_categoria DROP CONSTRAINT dim_categoria_pkey;
       public                 postgres    false    231                       2606    24716    dim_cliente dim_cliente_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.dim_cliente
    ADD CONSTRAINT dim_cliente_pkey PRIMARY KEY (id_cliente);
 F   ALTER TABLE ONLY public.dim_cliente DROP CONSTRAINT dim_cliente_pkey;
       public                 postgres    false    228            �           2606    16467    dim_loja dim_loja_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.dim_loja
    ADD CONSTRAINT dim_loja_pkey PRIMARY KEY (id_loja);
 @   ALTER TABLE ONLY public.dim_loja DROP CONSTRAINT dim_loja_pkey;
       public                 postgres    false    222            �           2606    16472    dim_produto dim_produto_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.dim_produto
    ADD CONSTRAINT dim_produto_pkey PRIMARY KEY (id_produto);
 F   ALTER TABLE ONLY public.dim_produto DROP CONSTRAINT dim_produto_pkey;
       public                 postgres    false    223                        2606    16479    dim_tempo dim_tempo_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.dim_tempo
    ADD CONSTRAINT dim_tempo_pkey PRIMARY KEY (id_tempo);
 B   ALTER TABLE ONLY public.dim_tempo DROP CONSTRAINT dim_tempo_pkey;
       public                 postgres    false    225                       2606    24723    fato_venda fato_venda_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.fato_venda
    ADD CONSTRAINT fato_venda_pkey PRIMARY KEY (id_venda);
 D   ALTER TABLE ONLY public.fato_venda DROP CONSTRAINT fato_venda_pkey;
       public                 postgres    false    230                       2606    24724 %   fato_venda fato_venda_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fato_venda
    ADD CONSTRAINT fato_venda_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.dim_cliente(id_cliente);
 O   ALTER TABLE ONLY public.fato_venda DROP CONSTRAINT fato_venda_id_cliente_fkey;
       public               postgres    false    3330    230    228                       2606    24734 "   fato_venda fato_venda_id_loja_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fato_venda
    ADD CONSTRAINT fato_venda_id_loja_fkey FOREIGN KEY (id_loja) REFERENCES public.dim_loja(id_loja);
 L   ALTER TABLE ONLY public.fato_venda DROP CONSTRAINT fato_venda_id_loja_fkey;
       public               postgres    false    222    3324    230            	           2606    24729 %   fato_venda fato_venda_id_produto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fato_venda
    ADD CONSTRAINT fato_venda_id_produto_fkey FOREIGN KEY (id_produto) REFERENCES public.dim_produto(id_produto);
 O   ALTER TABLE ONLY public.fato_venda DROP CONSTRAINT fato_venda_id_produto_fkey;
       public               postgres    false    223    3326    230            
           2606    24739 #   fato_venda fato_venda_id_tempo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.fato_venda
    ADD CONSTRAINT fato_venda_id_tempo_fkey FOREIGN KEY (id_tempo) REFERENCES public.dim_tempo(id_tempo);
 M   ALTER TABLE ONLY public.fato_venda DROP CONSTRAINT fato_venda_id_tempo_fkey;
       public               postgres    false    225    3328    230            �   0  x�MQ;nB1��S� (R�i�#J�*�ⷠM��>�6�A)P�T��X�$�l���̮��4`��#�b摛�X^TG.��8�����nɱ-�D�y�b7��1.��8���S�YqeJ�K�yGI��"�y�܃�<���fP�"堰�;3�	^�s��/�l^�a��]͹���(�U��nˏԴb��Tz�	���/F������i�]�\�`ƺ�m�0�U^W6aQ�t\T�q�[�â���U�hf����z�x*�\	�4�g�j
��0�}2�H�:c5=_���+=�[�Kj�qe��Cm�s      �   �  x�m�Kn�0���S�E����#i`�!H�l&�4�&QJ4�\����HV�&��<���'�4ˋr��2I
���{��`}�-�B�^��w����)sC������ze�-��z�����
���T*�d^+����4�z�})^�r^ �Z��0�w|@���=?#T��`��`-��T���d����_��	.y�i��p^���*h��� �2)�i��yQ��&���8J�(j����Z�0�/ae�7�6� ݳ�t�2*?.�/��n�1`L�L�`��8�������_���K�ڢc�#B7��99����\�_�&U����.������Ct�ו�kqs(9��N,h��w>��/#�rRb�~x	�\�կ�&�X�k�~��dJe�;��Q��F=}SJ�.�#      �   �   x�M�;�0��>EN�ě�-��)JV� �EueZ���)z1*ڊ������t7"N��QY�"��z)�{QQY8�p�#6���	��z���%5�ʝ5$ �;4�Db�ݼIHS{-q����r$.Vd���	T���){vW��r�������ɐ@�C��"y�s{J�q��_�_c�      �     x�uU�r�F]_1�M6�K``	��@��:IU6�Ԇ�G3xN�]>%�ŭ�*������ ˶�V�ӧ����L{��
4�D�3�Jdڲ���ٖţ��(b��;�
�DztZ��[��dʒ�!��V7|Y�q�}�{Wﲟ�$$����͵õ�w���_(�F+����_�k`�*��6�u�|��$yZBa�ڰn����4���$��l,E��i˩C\�*:~R"������NS�7nE����;�Gl��:CV����gBa��]��55��Q�d�9`�VgZ�C�O��(ڴ��h�,���}�R�-����B������ph�*���t���vC�}����VT��ǽ*B䚧`=5� \���Y��$��_%,��J	ZQ#z.�u_��_w���g����Sj�0��L�A|kYүb�_h��l��{�HB�*�؏fJ<A��y鄷�RQ"$�f�@���GS\�*�y ����Bj�9�Zh.h�bgYMY��p+r��z��U�e6W��;��c������� ]5���٥�TtP(��>�!͸�we�Д�Ɨ�p_�u�>�m�ׅ9�;miM���!��:��GG���n��h��>�h�Ze�Ab�����g�k>Z6��v%?��Pp�m>B���D�:�$f�{���c�-|yu5qR;^Tq����`�&(�)1��ŵ_?�kmq����,Ȃ���}�k���i�Y�![����z��XT��D;��輡orr��"7�H���&��<xB�����ּ��"�S���mR� ����|���x0�	-h�$Q�
[�����	,�H8-�SM/� w? ��RR�#E�t��ZUvr���^E7XL����IQ��
��������4FӍ_��P��K2RI��S>+����^T��
�^"=lb����zf�����t�#*��߭���񟷈�6�_��;���<R��g�WT�=Y�&��U�O�n�V��8���t�Ʌ����Ċ,<7-!�`"D��Q�������      �   u   x�M��� C�f*�@?�t�9J��F���-l�Y���{�~��0}�o�:����C�@(���R84�pM��	ʿ�p!���]	3mϣ-��D�'�L�.D�S��J)u�7      �   .  x�]�[n� D�a1? ����1�-��Dl�Ǒ"��|��{�8�"�/B|?q+ZfF��j�w�]�q���cׁ��[�^8w���Z�r5^���)�)��Y��d��@��h�?�҉�E:.$@:_��6�7�]�ʂ?G�_$s�8P��f�x��Y�|	�@f/��-��LLk������: E� qm��q�!�{��3���Q9��P&g(;CaN3�͂��h�9��]�� ���{�(E���R�$;Ǝ�ݣ�b�G��ע��2��㟀�L�$P:��,�Y��Z�rC      �   0  x�MQ;nB1��S� (R�i�#J�*�ⷠM��>�6�A)P�T��X�$�l���̮��4`��#�b摛�X^TG.��8�����nɱ-�D�y�b7��1.��8���S�YqeJ�K�yGI��"�y�܃�<���fP�"堰�;3�	^�s��/�l^�a��]͹���(�U��nˏԴb��Tz�	���/F������i�]�\�`ƺ�m�0�U^W6aQ�t\T�q�[�â���U�hf����z�x*�\	�4�g�j
��0�}2�H�:c5=_���+=�[�Kj�qe��Cm�s      �   c  x�m�Kr�8�׭S� �
�C�v#�qf\yhĪ�,f���I8 �J�8�:����7(���-v��ߊT���|�/�����N�mZo��(l}����Yǿ�2����t)-��<��$V��kQ�N��Λn*p(�?�'R�9aHMb�1�Z-�ko�(tۻ�t�g]�yA,� ��:������T�KV�����FTB[�3�w�F��u�cm�zM~��ܱp�7��]�6oܓ.��98��։ʈ{��UG�{�cK�1?���=>��|�xgM_�Ҭ��6�85��\ۡG�\���U9o���7��-%R%`p3����rbUL7���X�g�l���E`����~4�T`�5�}0�yC�B�*�V�4����y��p��<��錹 ��68�K����%���(4������R��R�����o��7���۶;�O�+�3p�f#V�h��xm�U�6�}����ж����FrN7���[Wy��ǐ�6��~-�`�ۈ����B$2�ڕГ�^wϿ`���B&Y&f.iD�y��;1�8��P)x|����k��L��n*�]���N�fK9�� �?#VbK�� ���1�:��=1���Bxs�׈��%��T������2���93X��8N�4� ���ېރ�?;qkuG;��*�|��|\N��SmKt�H�k��2Ezr�bE�����q���9[��C����7��ѫ���^�Y�zx!57<Q�Z'xP+l�7�>����z-қ�\X����yr�\	��`�:Ѡխn��Cb��T�P��
��_n�������T��/Ⓟ嬰�NTh�̖<�?+cЪ�WV!���5���jy/g�+��/y���&��o�� �      �   6  x�uRA�� ;ۏa�����Jv��δ�i
(�da�'�9�w�|�u �0���j�!.~>�xG�ja:p�%dc~��N�[P���Gb�������Ž�E�bz2�J���B
m�nzd��p�k�N���|��V�`��㍍��t�*��wɐ�p�wGiE7��������4����b�L�a�v���qm���T�8�U^��`dp��h�K6��q��һT<���Q��(���S}E���;�=�y|�(9�F�%�%٪)˦�J�Jx~����?ݜ���rR�$.���b��Ye=˺gٟ���-e�2      �   �  x�m�Mr�@�׭S�$�����HN�RI/���<)D��En��*����dUe�t�o�{��ݖs;�eX���Ϯ9��m:�!;/Yn^j�vf�D�9��+�B�JpAc!*��"IW6��ز��g�3rD�����@�L˲S�׻�i�,�ZC�U�mMc�G(� ��%A����X�C֐�i:l	�H]@����%[�9S<Z����nѻ�HNa�� ���Z�m�}�ݙ�1��#�=�G{�&;��m�a{s4�S�j�E�a܆�Ē'|�S��xg�)l�_�1e��uo����;{(r%bx_�u�H%%/ �r�:��bI�I9�YVۣ�r��?~l�������=�j�(a�S\�W	ҭ�s��Triț��������4�1	���+$<zhGO�|���?ɧA>�7/�u��?�v�އV�x_���T�O��y�`�Ψ��5��r6��oR�      �     x�]��r�6���S`:��͈_�t��q,9���ˊ�)�$����GI{Ȥ39��b��)���+���O�buq;�lW���Q��_RN��.���.�������lgbQ<���L�7��E��!�QV�z�D���TR����,2����b͓ ��n�
tgc�l��<:b�w�u�'��x|��ˡ]]B�+���d�-`�K#N�91{�nx���*e��x\Տ���7��+p�g�_�='񜄭Um\ ��s���Y�LZ��#���D9c�����bI��g�Ѣ�u�{L2��Jk�C��������Z��Z�_�Yނ8�Đ-�*U9Y�I����Ŏ�y�����g ������#�����ײ�r|�����*#
�58K�d,!�g�91;�&U�*���4�kxQ�Vf��[9ڝ��Q��I�`�	�թ�7d�ֱU'#�9i*�/;H(,~Gy.�t�,�����B!��_�I�\��k+��<S�ŋ����X���)�A���'�o���F�ʎ�j߷�{���A��c�G�.����G�	�Ji��.q*��
��)
F������ Xԕ�f�u�ؓ�����_���^L[��K��%�̂`�P�1�ң̉_W\z�E's-�D��_���P�t�TpƖ�������n�9Z9�@��`���J+� t�٭�BA����}�^:�ԓ1�ZTᮋ��R�$L&_	m��(��y�yVĖ�|_��u�VQ~�����M�Jΰ���`פ��Y���U[�sϊ٪F���Z�;��ƪ�ū.��3�l���ʰ�_�ĳ�NgT�?054_�F��z��rt��h��?�Gi��?�w� JW.'r�.v�w./�ȥ��u�x>����սL%⚰�5hX�8��m��Pn�8��?dl���+�}ml��QHڵ|� Ʊ#OC3P%0�~V��m���h+�	%��g)�Jik�t�]�yn@�2ͅ%�Њ�s7�KK��{t�N��Vҕ�h&��҇68��5� VN�G����lõ�
�Y������vO�����dR�t�M�����M�`�n�B�7��@��'��:��x�f�p3���F��'�	�\���AO�S���BɹzV�
���<a{��/��(�Nʽ��B�1΋��A�����N�&����&��L�T����
�u.m���*#|'u�a[_�m]�W��>�P�;, ̿�*�L]�1$B7�B�)�6�͗҈:r*�0�P���%����]0z5���U;E�����2E��ZbZ̘%֒n��i�ì3���p�d����g�l���'��,>�����k�x9�ۛ���ə��6@��`!������z�OO�>�.�00*�e���iC/0��F�_0V��'����l֞���'ǜzf�,�����׋���CJ�i�!�͌��Z�?�R���"�}-���R�;�\N��T^ \%�إV��d����bD�ۂ�Q��x"7'�)Rx�fb��7��-+�xZ2��[��x�Ӫ���ᓺ��h�ޟ�ɟ__�x��?�:��      �   ^  x���Mj�0���S����:��]W��n\R��$`��u��9r�>�Ԛ�n6H6��Oo���6b�[���^B�yeyŁ\,�K�XK�~<���w��t��=���c��}'�8Ns�/&[,�dz|x�R����(6)�\J�������z��+�'��I$i� �Z����a<�ľ2.&�ET����x��eN�"����R�a����$�V�5Y�2e��8����iQ�BpN-���(ǅ�"�Y�}��,v�r2�4�A25�U?,��n	���,Q,���oʿ�a���C�i�PL�XL��Be�@S���A^�c����
�cn: a�.qK?ۋ������     
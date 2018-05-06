--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: codigo_idcodigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE codigo_idcodigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE codigo_idcodigo_seq OWNER TO postgres;

--
-- Name: codigo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE codigo (
    idcodigo integer DEFAULT nextval('codigo_idcodigo_seq'::regclass) NOT NULL,
    enlace character varying(500) NOT NULL,
    codigodes character varying(1000) NOT NULL,
    id_usuario_id integer NOT NULL,
    referencia character varying(50)
);


ALTER TABLE codigo OWNER TO postgres;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- Name: registration_registrationprofile; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE registration_registrationprofile (
    id integer NOT NULL,
    activation_key character varying(40) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE registration_registrationprofile OWNER TO postgres;

--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE registration_registrationprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registration_registrationprofile_id_seq OWNER TO postgres;

--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE registration_registrationprofile_id_seq OWNED BY registration_registrationprofile.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuarios (
    iduser integer NOT NULL,
    username character varying(50) NOT NULL,
    pass character varying(500) NOT NULL
);


ALTER TABLE usuarios OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY registration_registrationprofile ALTER COLUMN id SET DEFAULT nextval('registration_registrationprofile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add group	4	add_group
11	Can change group	4	change_group
12	Can delete group	4	delete_group
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add auth group	9	add_authgroup
20	Can change auth group	9	change_authgroup
21	Can delete auth group	9	delete_authgroup
22	Can add auth group permissions	10	add_authgrouppermissions
23	Can change auth group permissions	10	change_authgrouppermissions
24	Can delete auth group permissions	10	delete_authgrouppermissions
25	Can add auth permission	11	add_authpermission
26	Can change auth permission	11	change_authpermission
27	Can delete auth permission	11	delete_authpermission
28	Can add auth user	12	add_authuser
29	Can change auth user	12	change_authuser
30	Can delete auth user	12	delete_authuser
31	Can add auth user groups	13	add_authusergroups
32	Can change auth user groups	13	change_authusergroups
33	Can delete auth user groups	13	delete_authusergroups
34	Can add auth user user permissions	14	add_authuseruserpermissions
35	Can change auth user user permissions	14	change_authuseruserpermissions
36	Can delete auth user user permissions	14	delete_authuseruserpermissions
37	Can add codigo	7	add_codigo
38	Can change codigo	7	change_codigo
39	Can delete codigo	7	delete_codigo
40	Can add django admin log	15	add_djangoadminlog
41	Can change django admin log	15	change_djangoadminlog
42	Can delete django admin log	15	delete_djangoadminlog
43	Can add django content type	16	add_djangocontenttype
44	Can change django content type	16	change_djangocontenttype
45	Can delete django content type	16	delete_djangocontenttype
46	Can add django migrations	17	add_djangomigrations
47	Can change django migrations	17	change_djangomigrations
48	Can delete django migrations	17	delete_djangomigrations
49	Can add django session	18	add_djangosession
50	Can change django session	18	change_djangosession
51	Can delete django session	18	delete_djangosession
52	Can add usuarios	8	add_usuarios
53	Can change usuarios	8	change_usuarios
54	Can delete usuarios	8	delete_usuarios
55	Can add registration profile	19	add_registrationprofile
56	Can change registration profile	19	change_registrationprofile
57	Can delete registration profile	19	delete_registrationprofile
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 54, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$30000$RaHP5YGTVZWZ$F+wJMOYwjdDsxwFAOezvDsmffBvyYQhnSnvH8rVN7+M=	\N	f	loli				f	t	2017-01-09 00:43:07-05
1	pbkdf2_sha256$30000$bRjbBoS3sB4b$fDJa8h05QU7OcvCB1XVTTPGQjSmxDABy2d/Ku+PNztc=	2017-01-23 10:34:59.911748-05	t	admin				t	t	2017-01-02 18:58:47.575078-05
11	pbkdf2_sha256$30000$tmPe30oYEImW$+RuX5nxWeF2jIf6qlriQPWiIDPODmcjVIGeA99fF4qs=	2017-01-29 20:46:38.931055-05	f	galo			galines@g.com	f	t	2017-01-29 18:32:42.330416-05
12	pbkdf2_sha256$30000$Y0ko4qzenA3J$NcAx2IWI6vM5tkfrUCS6nKVkHJsU9Pu9Ip+BaOlJ8uY=	\N	f	rosarosas			ro@g.com	f	t	2017-01-29 22:42:11.047698-05
13	pbkdf2_sha256$30000$RtEg7HASQ2P2$aAs/VakBUrFJ+KCI4YjhBg8nmdBEEsqMxWDGa9K8Srs=	2017-01-29 22:43:01.738464-05	f	beatriz			beatriz@g.com	f	t	2017-01-29 22:42:51.61712-05
3	pbkdf2_sha256$30000$nyyjZgVvysVr$Gs3+xRgbUx3qM7fTqOkpuAG7Ai+lIWGO940gNfQ9iQ0=	2017-01-29 23:00:22.151401-05	f	gallina				f	t	2017-01-19 12:35:16-05
14	pbkdf2_sha256$30000$ENtwu63lUCNc$byMsmcJTTL5G7iOmXtLyugCrqfSY8Efrcaqvs3dpJWY=	2017-01-30 01:07:31.737872-05	f	fernanda			fernanda@gmail.com	f	t	2017-01-30 01:07:11.529629-05
4	pbkdf2_sha256$30000$9EElffzaxMqX$EARk/nx9kzdQeuVSCteESPkixcqkArCU0nl6zzd/jHU=	2017-01-28 13:05:58.735275-05	f	pamela				f	t	2017-01-23 10:35:35-05
5	pbkdf2_sha256$30000$KAsKP6Wwk0g8$Pe6DHUVEK1hmIbRk5WfMtgWxtqxKu0gtaPYHdzzIUTE=	\N	f	rosax			pame@g.com	f	t	2017-01-29 17:38:49.258932-05
6	pbkdf2_sha256$30000$25M1DecUgMcy$GwPTVoLK7IChMzemlD2WMkNAsqNDMFdKk+8cNS1AVkg=	2017-01-29 17:40:25.478417-05	f	lady			lady@gm.com	f	t	2017-01-29 17:40:15.267265-05
7	pbkdf2_sha256$30000$AGYBEQEtMyld$rv0WzDMpRRDH/Al2aEKuRnR11XwewGdMrDoRDjbuTss=	2017-01-29 18:01:14.544171-05	f	alexito			hu@g.com	f	t	2017-01-29 18:01:06.813152-05
8	pbkdf2_sha256$30000$hN7oDtnC7UZw$++rdr3phVco0aWQwX6DR3rWW/4LcmKru0eJ1jZt+h/Q=	2017-01-29 18:15:06.256212-05	f	aaa			a@g.com	f	t	2017-01-29 18:14:52.721965-05
9	pbkdf2_sha256$30000$6yatTOhoJM5w$lM2gxzoVRa7ifCUye+j4oXSQj0hKmExE5xPFhEcBc0s=	2017-01-29 18:16:04.681853-05	f	jose			jo@g.com	f	t	2017-01-29 18:15:57.749367-05
10	pbkdf2_sha256$30000$xY2AnmFj123m$+IN7DD7ncf/a+NkFAx8CbWRDdAfDgPJRSIvoLHQSyh4=	2017-01-29 18:20:47.297399-05	f	carola			pam@gmail.com	f	t	2017-01-29 18:20:39.048727-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 14, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	3	1
2	3	2
3	3	3
4	3	4
5	3	5
6	3	6
7	3	7
8	3	8
9	3	9
10	3	10
11	3	11
12	3	12
13	3	13
14	3	14
15	3	15
16	3	16
17	3	17
18	3	18
19	3	19
20	3	20
21	3	21
22	3	22
23	3	23
24	3	24
25	3	25
26	3	26
27	3	27
28	3	28
29	3	29
30	3	30
31	3	31
32	3	32
33	3	33
34	3	34
35	3	35
36	3	36
37	3	37
38	3	38
39	3	39
40	3	40
41	3	41
42	3	42
43	3	43
44	3	44
45	3	45
46	3	46
47	3	47
48	3	48
49	3	49
50	3	50
51	3	51
52	3	52
53	3	53
54	3	54
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: codigo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY codigo (idcodigo, enlace, codigodes, id_usuario_id, referencia) FROM stdin;
63	codigopython	###Imprimir los numeros impares desde el 1 al 25, ambos inclusive\r\nn = 1\r\nh = ''\r\nwhile n <= 25:\r\n    if n%2 != 0:\r\n        h += ' %i' % n\r\n    n += 1\r\nprint h	14	2017/01/30 01:11:20
64	prueba	print "hola"	11	29/01/2017
\.


--
-- Name: codigo_idcodigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('codigo_idcodigo_seq', 64, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-01-02 19:00:13.633239-05	1	Usuarios object	1	[{"added": {}}]	8	1
2	2017-01-02 19:01:08.682187-05	1	Codigo object	1	[{"added": {}}]	7	1
3	2017-01-02 19:44:51.304877-05	2	Codigo object	1	[{"added": {}}]	7	1
4	2017-01-02 19:45:12.731622-05	2	Usuarios object	1	[{"added": {}}]	8	1
5	2017-01-09 00:43:07.054391-05	2	loli	1	[{"added": {}}]	3	1
6	2017-01-09 00:43:16.606364-05	2	loli	2	[]	3	1
7	2017-01-19 12:35:16.201319-05	3	gallina	1	[{"added": {}}]	3	1
8	2017-01-19 12:36:06.055431-05	3	gallina	2	[]	3	1
9	2017-01-23 10:35:35.637107-05	4	pamela	1	[{"added": {}}]	3	1
10	2017-01-23 10:35:39.071765-05	4	pamela	2	[]	3	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 10, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	user
4	auth	group
5	contenttypes	contenttype
6	sessions	session
7	aplicacion	codigo
8	aplicacion	usuarios
9	aplicacion	authgroup
10	aplicacion	authgrouppermissions
11	aplicacion	authpermission
12	aplicacion	authuser
13	aplicacion	authusergroups
14	aplicacion	authuseruserpermissions
15	aplicacion	djangoadminlog
16	aplicacion	djangocontenttype
17	aplicacion	djangomigrations
18	aplicacion	djangosession
19	registration	registrationprofile
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 18, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-01-02 17:47:04.878946-05
2	auth	0001_initial	2017-01-02 17:47:05.693162-05
3	admin	0001_initial	2017-01-02 17:47:05.882398-05
4	admin	0002_logentry_remove_auto_add	2017-01-02 17:47:05.915679-05
5	contenttypes	0002_remove_content_type_name	2017-01-02 17:47:05.960391-05
6	auth	0002_alter_permission_name_max_length	2017-01-02 17:47:05.993935-05
7	auth	0003_alter_user_email_max_length	2017-01-02 17:47:06.027165-05
8	auth	0004_alter_user_username_opts	2017-01-02 17:47:06.045721-05
9	auth	0005_alter_user_last_login_null	2017-01-02 17:47:06.071319-05
10	auth	0006_require_contenttypes_0002	2017-01-02 17:47:06.082608-05
11	auth	0007_alter_validators_add_error_messages	2017-01-02 17:47:06.10223-05
12	auth	0008_alter_user_username_max_length	2017-01-02 17:47:06.171567-05
13	sessions	0001_initial	2017-01-02 17:47:06.338549-05
14	aplicacion	0001_initial	2017-01-02 19:09:34.327484-05
15	aplicacion	0002_auto_20170109_0711	2017-01-09 02:11:28.73615-05
16	registration	0001_initial	2017-01-23 10:50:07.608408-05
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 15, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
baejxhdhq3z6kuoaoqrc8dm2ef896b6f	ODA1NWEzZTQ1ODQ5ZGUzZmQyMDIwMjFhNjhjMzU1ZDFkY2NiZDI2ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImMyNWRlYmRiOGM2M2U5OWMwMzlmN2ZhOWEzZWZhM2VmNmQ4MmNlNmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2017-01-16 18:59:20.665611-05
4nziiwu3pinpujp8byciq7u6d0pxvjil	NmM2NTVlMDIzOWQyMjg5NWIwY2I1OWMxYjZjZDgzZmY0OWYxZmNhMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjAyMjgxZDNlNTdmMWMzM2QzYTg2OTVhMWQ3ZjczMzlkYWE5ZGJhMDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMyJ9	2017-02-12 22:43:01.799989-05
622yny32m6cqkoodwn6ditz3l9l4bgwy	OGVjMTIyZWE4Y2NmNjg4NDAxNGY2YmNkN2EwMDNmYmUxNmYyYjlkZjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc3NGQyM2E2YWRjMzEwODRmNzI2NTI1ODMyNzg5NDkxYThmMDkxMDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2017-02-12 23:00:22.162516-05
rhm4ufwex0vipx77utkottyfoji41yp5	MzQ3NzNjYjZjZDcxMTc3Y2UyODhiZjg3ZTljZDQzMzE2ZDQyZmIxMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImMzNWU0ZWNjNjExM2E4YTE2NmNmZGU2MjZiMDYzNjJjYjFhZGI2OTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNCJ9	2017-02-13 01:07:31.749087-05
usi7bwskjlavjpb8yf6lng6iqhh465tn	OGVjMTIyZWE4Y2NmNjg4NDAxNGY2YmNkN2EwMDNmYmUxNmYyYjlkZjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijc3NGQyM2E2YWRjMzEwODRmNzI2NTI1ODMyNzg5NDkxYThmMDkxMDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2017-02-10 10:06:12.846713-05
xm7yknkt0g928bvuumptp14plr1ej43d	OTM5OGZkYjRkZWU2NTkzMjY2Y2Q0MzVjYTFlYjc2MGJmYWM0NmFjYzp7Il9hdXRoX3VzZXJfaGFzaCI6ImRiYTRkM2Q2MWMzZWI4NjQ3NzBmZGQ0MzAwOTk0YjhjN2E5MmVjZDciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMSJ9	2017-02-12 18:54:22.954109-05
\.


--
-- Data for Name: registration_registrationprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY registration_registrationprofile (id, activation_key, user_id) FROM stdin;
\.


--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('registration_registrationprofile_id_seq', 1, false);


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuarios (iduser, username, pass) FROM stdin;
1	pame	pamelita
2	alex	alex
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: codigo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY codigo
    ADD CONSTRAINT codigo_pkey PRIMARY KEY (idcodigo);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: registration_registrationprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_pkey PRIMARY KEY (id);


--
-- Name: registration_registrationprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_user_id_key UNIQUE (user_id);


--
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (iduser);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: codigo_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY codigo
    ADD CONSTRAINT codigo_id_usuario_fkey FOREIGN KEY (id_usuario_id) REFERENCES auth_user(id);


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_registrationprofi_user_id_5fcbf725_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofi_user_id_5fcbf725_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


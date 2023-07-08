--
-- PostgreSQL database dump
--

-- Dumped from database version 12.13 (Ubuntu 12.13-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.13 (Ubuntu 12.13-0ubuntu0.20.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: campaigns; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.campaigns (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    food_target integer NOT NULL,
    clothes_target integer NOT NULL,
    money_target integer NOT NULL,
    image_link text NOT NULL,
    is_available boolean DEFAULT true,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "categoryId" integer
);


ALTER TABLE public.campaigns OWNER TO admin;

--
-- Name: campaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.campaigns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.campaigns_id_seq OWNER TO admin;

--
-- Name: campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.campaigns_id_seq OWNED BY public.campaigns.id;


--
-- Name: capons; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.capons (
    id integer NOT NULL,
    food integer,
    clothes integer,
    money integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "campaignId" integer,
    "familyId" integer
);


ALTER TABLE public.capons OWNER TO admin;

--
-- Name: capons_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.capons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.capons_id_seq OWNER TO admin;

--
-- Name: capons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.capons_id_seq OWNED BY public.capons.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    icon_url character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO admin;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO admin;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.contacts (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    message text NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.contacts OWNER TO admin;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO admin;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: donations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.donations (
    id integer NOT NULL,
    food integer DEFAULT 0 NOT NULL,
    clothes integer DEFAULT 0 NOT NULL,
    money integer DEFAULT 0 NOT NULL,
    description character varying(255) NOT NULL,
    deliver_time timestamp with time zone NOT NULL,
    location character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "campaignId" integer,
    "donorId" integer
);


ALTER TABLE public.donations OWNER TO admin;

--
-- Name: donations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.donations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.donations_id_seq OWNER TO admin;

--
-- Name: donations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.donations_id_seq OWNED BY public.donations.id;


--
-- Name: donors; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.donors (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    profile_img character varying(255) DEFAULT 'https://w7.pngwing.com/pngs/481/915/png-transparent-computer-icons-user-avatar-woman-avatar-computer-business-conversation.png'::character varying,
    is_admin boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.donors OWNER TO admin;

--
-- Name: donors_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.donors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.donors_id_seq OWNER TO admin;

--
-- Name: donors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.donors_id_seq OWNED BY public.donors.id;


--
-- Name: families; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.families (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.families OWNER TO admin;

--
-- Name: families_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.families_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.families_id_seq OWNER TO admin;

--
-- Name: families_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.families_id_seq OWNED BY public.families.id;


--
-- Name: reports; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.reports (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    message text NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.reports OWNER TO admin;

--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reports_id_seq OWNER TO admin;

--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.reports_id_seq OWNED BY public.reports.id;


--
-- Name: campaigns id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.campaigns ALTER COLUMN id SET DEFAULT nextval('public.campaigns_id_seq'::regclass);


--
-- Name: capons id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.capons ALTER COLUMN id SET DEFAULT nextval('public.capons_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Name: donations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.donations ALTER COLUMN id SET DEFAULT nextval('public.donations_id_seq'::regclass);


--
-- Name: donors id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.donors ALTER COLUMN id SET DEFAULT nextval('public.donors_id_seq'::regclass);


--
-- Name: families id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.families ALTER COLUMN id SET DEFAULT nextval('public.families_id_seq'::regclass);


--
-- Name: reports id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.reports ALTER COLUMN id SET DEFAULT nextval('public.reports_id_seq'::regclass);


--
-- Data for Name: campaigns; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.campaigns (id, title, description, food_target, clothes_target, money_target, image_link, is_available, "createdAt", "updatedAt", "categoryId") FROM stdin;
1	I deserve life 	The campaign aims to provide assistance and care for the injured by purchasing medicines. Reducing the spread of diseases to them. Reducing the rate of complications of diseases Providing the necessary medical care and support for patients with chronic diseases. Spreading awareness of prevention and treatment methods, and adopting a healthy lifestyle. Conducting and supporting scientific research with the aim of controlling chronic diseases.	0	0	5000	https://res.cloudinary.com/farahshcoding/image/upload/v1653091113/sv8s3elif4ilk8qok0jk.jpg	t	2022-05-21 15:45:24.522+03	2022-05-21 15:45:24.522+03	1
2	Make my way	Campaigns aim to collect donations to help university students complete their academic careers, The challenge is some of these students come from very humble and poor families.Our aim is to empower these families for their economic sustainability which will make their dreams come true, and provide them with the opportunity to live a decent life in the future. Donate to our campaign Be a reason to change a person's life	0	0	5000	https://assets.rebelmouse.io/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpbWFnZSI6Imh0dHBzOi8vbWVkaWEucmJsLm1zL2ltYWdlP3U9JTJGZmlsZXMlMkYyMDE2JTJGMDMlMkYyOCUyRjYzNTk0NzIzODAyNjQxODEwMDEwNDkwMDQ2NDRfQ29sbGVnZS1HcmFkdWF0aW9uJTI1MjAlMjgxJTI5LmpwZyZobz1odHRwcyUzQSUyRiUyRmF6NjE2NTc4LnZvLm1zZWNuZC5uZXQmcz0xMDE4Jmg9ZGFmMmIwZDg3M2YxNzYyZTljZDZjMWM2MDhlZTc3ZjdkZTY0NGFhMWY4YjY3Y2I0MmM4YjBmZGE3ZDRkNWVjYyZzaXplPTk4MHgmYz0zMDc5NzQyMTkxIiwiZXhwaXJlc19hdCI6MTY5MjY5OTc1MH0.UDLkpjvV8T_FK_TcWV5vSJ2scQlqguCoep1RvMHwkU0/img.jpg?width=2500&height=1308	t	2022-05-21 15:45:24.523+03	2022-05-21 15:45:24.523+03	3
3	winter clothes collection	Our campaign aims to help families who have been affected by the war in Gaza to provide them with winter clothes to protect from heat and prevent them from being exposed to diseases. The campaign aims to collect three hundred pieces to distribute to thirty needy families. All you have to do is open your safes and choose one of the pieces. the disease	0	80	1000	https://res.cloudinary.com/farahshcoding/image/upload/v1653088338/fcq2oa2sptbnyfxtrqar.jpg	f	2022-05-21 15:45:24.523+03	2022-05-21 15:45:24.523+03	3
4	Ramadan Wafir	The blessed month of Ramadan brings us new hope on our way to God Almighty, and despite the blessings and joys of this month, the condition of many families does not please anyone. Hunger destroys the bodies of hundreds of thousands of children Many are depriving millions of families of gathering at the breakfast table, which made the advent of the month of Ramadan without a noticeable effect on the tables of the poor and needy, as they break the fast without breaking the fast and the fasting without suhoor. Our campaign will provide assistance to needy families through food baskets and sums of money. Contribute to a fasting iftar. We believe in your giving and support	50	0	1000	https://res.cloudinary.com/farahshcoding/image/upload/v1653088857/fplscb28pgfg4avyznhn.jpg	f	2022-05-21 15:45:24.523+03	2022-05-21 15:45:24.523+03	4
5	Create Smile	The day of Eid is a day of joy and happiness and bringing joy to those around us. That is why we came up with an idea to draw a smile on children’s faces, and to make Eid a joy for every poor child to feel and enjoy the most beautiful moments of Eid. The idea of our campaign revolves around distributing a set of bags that contain a set of games Small children are bought from toy stores, and a small amount of money is placed with it as a gift and also a small candy, and you may buy a small booklet that contributed to bringing happiness and joy to the heart of the children	0	0	300	https://res.cloudinary.com/farahshcoding/image/upload/v1653089559/wssru8gghnjgyravxaoi.jpg	f	2022-05-21 15:45:24.523+03	2022-05-21 15:45:24.523+03	3
6	Support Web Developer	our mission is to provide financial support to those who develop the site because of their contribution and volunteering, so we aim to let them continue their charitable work. You are the reason for spreading good	0	0	5000	https://res.cloudinary.com/farahshcoding/image/upload/v1653099290/h0autzfhnxs71oq2nn2f.png	t	2022-05-21 15:45:24.523+03	2022-05-21 15:45:24.523+03	3
7	Eid clothes 2020	The day of Eid is a day of joy and happiness and bringing joy to those around us.and to make Eid a joy for every poor child to feel and enjoy the most beautiful moments of Eid The campaign aims to collect three hundred pieces to distribute to thirty needy families. All you have to do is open your safes and choose one of the pieces. the disease	0	200	1000	https://res.cloudinary.com/farahshcoding/image/upload/v1653088338/fcq2oa2sptbnyfxtrqar.jpg	f	2022-05-21 15:45:24.523+03	2022-05-21 15:45:24.523+03	4
8	She Can2021	Providing the opportunity for education on the sewing profession for dozens of trainees according to varying times, thus giving them the opportunity to work in manual and mechanical sewing for complete self-reliance, whether inside or outside the center. The campaign aims to educate 15 women to become responsible for the expenses of their homes, training more women to rely on Self with a profession that preserves their dignity wherever they are	0	0	4000	https://res.cloudinary.com/farahshcoding/image/upload/v1653090482/doypu2wcq4pvaahr4vb9.jpg	t	2022-05-21 15:45:24.523+03	2022-05-21 15:45:24.523+03	4
9	Support Disables2021	Our mission is to help people with disabilities hearing impairedand deaf learning Furthermore Our goal is to strengthen their social inclusion with integrated learning by giving them advice personally and online, making physical and info-communications accessible for them, with organizing training We do these activities with the help of fellow helpers which is a unique method in our country Our goal is to create a form of knowledge that is accessible for everyone in order to do that we share and promote information  knowledge and good practices As part of that we make videos every day with simple text, sign language, and subtitles	0	0	3000	https://raisingchildren.net.au/__data/assets/image/0017/48203/disability-school-support.jpg	t	2022-05-21 15:45:24.523+03	2022-05-21 15:45:24.523+03	2
10	Eid clothes 	The day of Eid is a day of joy and happiness and bringing joy to those around us.and to make Eid a joy for every poor child to feel and enjoy the most beautiful moments of Eid The campaign aims to collect three hundred pieces to distribute to thirty needy families. All you have to do is open your safes and choose one of the pieces. the disease	0	200	1000	https://res.cloudinary.com/farahshcoding/image/upload/v1653088338/fcq2oa2sptbnyfxtrqar.jpg	t	2022-05-21 15:45:24.523+03	2022-05-21 15:45:24.523+03	4
11	She Can	Providing the opportunity for education on the sewing profession for dozens of trainees according to varying times, thus giving them the opportunity to work in manual and mechanical sewing for complete self-reliance, whether inside or outside the center. The campaign aims to educate 15 women to become responsible for the expenses of their homes, training more women to rely on Self with a profession that preserves their dignity wherever they are	0	0	4000	https://res.cloudinary.com/farahshcoding/image/upload/v1653090482/doypu2wcq4pvaahr4vb9.jpg	t	2022-05-21 15:45:24.523+03	2022-05-21 15:45:24.523+03	4
12	Support Disables	help people with disabilities hearing impairedand deaf learning Furthermore Our goal is to strengthen their social inclusion with integrated learning by giving them advice personally and online, making physical and info-communications accessible for them, with organizing training We do these activities with the help of fellow helpers which is a unique method in our country Our goal is to create a form of knowledge that is accessible for everyone in order to do that we share and promote information knowledge and good practices As part of that we make videos every day with simple text, sign language, and subtitles	0	0	3000	https://raisingchildren.net.au/__data/assets/image/0017/48203/disability-school-support.jpg	t	2022-05-21 15:45:24.523+03	2022-05-21 15:45:24.523+03	2
\.


--
-- Data for Name: capons; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.capons (id, food, clothes, money, "createdAt", "updatedAt", "campaignId", "familyId") FROM stdin;
1	0	20	200	2022-05-21 15:45:24.794+03	2022-05-21 15:45:24.794+03	3	1
2	0	10	100	2022-05-21 15:45:24.794+03	2022-05-21 15:45:24.794+03	3	2
3	0	10	300	2022-05-21 15:45:24.795+03	2022-05-21 15:45:24.795+03	3	3
4	0	10	100	2022-05-21 15:45:24.795+03	2022-05-21 15:45:24.795+03	3	4
5	0	20	100	2022-05-21 15:45:24.795+03	2022-05-21 15:45:24.795+03	3	5
6	0	20	100	2022-05-21 15:45:24.795+03	2022-05-21 15:45:24.795+03	3	6
7	0	20	200	2022-05-21 15:45:24.795+03	2022-05-21 15:45:24.795+03	3	1
8	0	10	100	2022-05-21 15:45:24.795+03	2022-05-21 15:45:24.795+03	3	2
9	0	10	300	2022-05-21 15:45:24.795+03	2022-05-21 15:45:24.795+03	3	3
10	0	10	100	2022-05-21 15:45:24.795+03	2022-05-21 15:45:24.795+03	3	4
11	0	20	100	2022-05-21 15:45:24.795+03	2022-05-21 15:45:24.795+03	3	5
12	0	20	100	2022-05-21 15:45:24.795+03	2022-05-21 15:45:24.795+03	3	6
13	0	20	200	2022-05-21 15:45:24.795+03	2022-05-21 15:45:24.795+03	4	6
14	0	10	100	2022-05-21 15:45:24.795+03	2022-05-21 15:45:24.795+03	4	4
15	0	10	300	2022-05-21 15:45:24.796+03	2022-05-21 15:45:24.796+03	4	7
16	0	10	100	2022-05-21 15:45:24.796+03	2022-05-21 15:45:24.796+03	4	8
17	0	20	100	2022-05-21 15:45:24.796+03	2022-05-21 15:45:24.796+03	4	5
18	0	20	100	2022-05-21 15:45:24.796+03	2022-05-21 15:45:24.796+03	4	6
24	0	20	100	2022-05-21 15:45:24.796+03	2022-05-21 15:45:24.796+03	5	\N
23	0	20	100	2022-05-21 15:45:24.796+03	2022-05-21 15:45:24.796+03	5	\N
19	0	20	200	2022-05-21 15:45:24.796+03	2022-05-21 15:45:24.796+03	4	\N
20	0	10	100	2022-05-21 15:45:24.796+03	2022-05-21 15:45:24.796+03	5	\N
21	0	10	300	2022-05-21 15:45:24.796+03	2022-05-21 15:45:24.796+03	5	\N
22	0	10	100	2022-05-21 15:45:24.796+03	2022-05-21 15:45:24.796+03	5	\N
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.categories (id, name, icon_url, "createdAt", "updatedAt") FROM stdin;
1	Medicine	https://cdn.discordapp.com/attachments/881560989940731927/977303925835309107/unknown.png	2022-05-21 15:45:24.511+03	2022-05-21 15:45:24.511+03
2	Education	https://cdn.discordapp.com/attachments/881560989940731927/977290043003650149/unknown.png	2022-05-21 15:45:24.511+03	2022-05-21 15:45:24.511+03
3	Humanitarian	https://cdn.discordapp.com/attachments/881560989940731927/977290654206033930/unknown.png	2022-05-21 15:45:24.511+03	2022-05-21 15:45:24.511+03
4	Crowdfunding	https://cdn.discordapp.com/attachments/881560989940731927/977294487128801371/unknown.png	2022-05-21 15:45:24.511+03	2022-05-21 15:45:24.511+03
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.contacts (id, name, email, message, "createdAt", "updatedAt") FROM stdin;
1	Ahmed	Ahmed@gmail.com	Suggest an idea to donate to unemployed people	2022-05-10 21:06:13.734+03	2022-05-10 21:06:13.734+03
2	Ali	Ali@gmail.com	I like your work very much, but I suggest and hope that it will be on a global level	2022-05-10 21:06:13.74+03	2022-05-10 21:06:13.74+03
3	ameer	ameer@gmail.com	I know a poor family in need of help. I hope to contact me 0594562017	2022-05-10 21:06:13.742+03	2022-05-10 21:06:13.742+03
4	Ossama	Ossama@gmail.com	I am from a poor family and I need help. Please contact me 0598740265	2022-05-10 21:06:13.744+03	2022-05-10 21:06:13.744+03
5	reports	report@gmail.com	 any message you want	2022-05-10 21:06:14.611+03	2022-05-10 21:06:14.611+03
\.


--
-- Data for Name: donations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.donations (id, food, clothes, money, description, deliver_time, location, "createdAt", "updatedAt", "campaignId", "donorId") FROM stdin;
2	0	0	300	Donte with 100$	2022-01-05 00:00:00+02	Gaza al shuhada street	2022-05-21 15:45:24.797+03	2022-05-21 15:45:24.797+03	1	7
4	0	0	100	Donte with 100$	2022-05-06 00:00:00+03	North Gaza Haifa street	2022-05-21 15:45:24.798+03	2022-05-21 15:45:24.798+03	1	4
6	0	0	100	Donte with 100$	2022-03-06 00:00:00+02	Gaza / al seifa street	2022-05-21 15:45:24.799+03	2022-05-21 15:45:24.799+03	1	6
8	0	0	1000	Paying 100$ to avoid paying college student fees	2020-04-06 00:00:00+03	Gaza Al jala street	2022-05-21 15:45:24.799+03	2022-05-21 15:45:24.799+03	2	4
9	0	0	900	Paying 900$ to avoid paying college student fees	2020-04-06 00:00:00+03	North Gaza huja street	2022-05-21 15:45:24.799+03	2022-05-21 15:45:24.799+03	2	6
12	0	5	0	5 pieces of 3 for clothes boys for child 2 for adult	2022-02-03 00:00:00+02	North Gaza hwja street	2022-05-21 15:45:24.799+03	2022-05-21 15:45:24.799+03	2	4
16	10	10	300	Donte with 300$ to feed one family all ramdan	2022-04-04 00:00:00+03	Gaza / al seifa street	2022-05-21 15:45:24.8+03	2022-05-21 15:45:24.8+03	4	4
17	10	0	300	Donte with 300$ to feed one family all ramdan	2022-04-04 00:00:00+03	Gaza / al seifa street	2022-05-21 15:45:24.8+03	2022-05-21 15:45:24.8+03	4	7
5	0	0	100	Donte with 100$	2022-03-06 00:00:00+02	Gaza / al seifa street	2022-05-21 15:45:24.798+03	2022-05-21 15:45:24.798+03	1	5
13	0	0	100	500$ to pay clothes for 50 child	2022-02-03 00:00:00+02	Gaza	2022-05-21 15:45:24.8+03	2022-05-21 15:45:24.8+03	2	5
19	0	10	100	Donte with 300$ to feed one family all ramdan	2022-04-04 00:00:00+03	Gaza / al seifa street	2022-05-21 15:45:24.801+03	2022-05-21 15:45:24.801+03	4	5
24	0	10	100	Donte with 300$ to feed one family all ramdan	2022-04-04 00:00:00+03	Gaza / al seifa street	2022-05-21 15:45:24.802+03	2022-05-21 15:45:24.802+03	4	5
31	0	10	100	Donte with 300$ to feed one family all ramdan	2022-04-04 00:00:00+03	Gaza / al seifa street	2022-05-21 15:45:24.802+03	2022-05-21 15:45:24.802+03	9	5
\.


--
-- Data for Name: donors; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.donors (id, name, email, password, address, phone, profile_img, is_admin, "createdAt", "updatedAt") FROM stdin;
1	admin	admin@gmail.com	$2a$10$zak/42j/GpDReRtzYC/iEef.ZR6HRJPNy0yvUxn54632Ekhr9Q7se	Gaza	0599888611	https://w7.pngwing.com/pngs/481/915/png-transparent-computer-icons-user-avatar-woman-avatar-computer-business-conversation.png	t	2022-05-21 15:45:24.518+03	2022-05-21 15:45:24.518+03
4	Sami Ali	sami@gmail.com	$2a$10$zak/42j/GpDReRtzYC/iEef.ZR6HRJPNy0yvUxn54632Ekhr9Q7se	Gaza	0599848610	https://w7.pngwing.com/pngs/481/915/png-transparent-computer-icons-user-avatar-woman-avatar-computer-business-conversation.png	f	2022-05-21 15:45:24.519+03	2022-05-21 15:45:24.519+03
5	Sara Khalil	sara.Khalil@gmail.com	$2a$10$zak/42j/GpDReRtzYC/iEef.ZR6HRJPNy0yvUxn54632Ekhr9Q7se	Gaza	05970801055	https://w7.pngwing.com/pngs/481/915/png-transparent-computer-icons-user-avatar-woman-avatar-computer-business-conversation.png	f	2022-05-21 15:45:24.519+03	2022-05-21 15:45:24.519+03
6	Mohammed khalid	Mohammed@gmail.com	$2a$10$zak/42j/GpDReRtzYC/iEef.ZR6HRJPNy0yvUxn54632Ekhr9Q7se	Gaza	0599823484	https://w7.pngwing.com/pngs/481/915/png-transparent-computer-icons-user-avatar-woman-avatar-computer-business-conversation.png	f	2022-05-21 15:45:24.519+03	2022-05-21 15:45:24.519+03
7	Khalil Madhon	Khalil@gmail.com	$2a$10$zak/42j/GpDReRtzYC/iEef.ZR6HRJPNy0yvUxn54632Ekhr9Q7se	Gaza	0592366505	https://w7.pngwing.com/pngs/481/915/png-transparent-computer-icons-user-avatar-woman-avatar-computer-business-conversation.png	f	2022-05-21 15:45:24.52+03	2022-05-21 15:45:24.52+03
11	Salah Rami	Mohammed1@gmail.com	$2a$10$zak/42j/GpDReRtzYC/iEef.ZR6HRJPNy0yvUxn54632Ekhr9Q7se	Gaza	0595466663	https://w7.pngwing.com/pngs/481/915/png-transparent-computer-icons-user-avatar-woman-avatar-computer-business-conversation.png	f	2022-05-21 15:45:24.52+03	2022-05-21 15:45:24.52+03
12	Khalid Issa	KhalilIssa@gmail.com	$2a$10$zak/42j/GpDReRtzYC/iEef.ZR6HRJPNy0yvUxn54632Ekhr9Q7se	Gaza	05998325671	https://w7.pngwing.com/pngs/481/915/png-transparent-computer-icons-user-avatar-woman-avatar-computer-business-conversation.png	f	2022-05-21 15:45:24.521+03	2022-05-21 15:45:24.521+03
13	Baraa Akram	Baraa@gmail.com	$2a$10$zak/42j/GpDReRtzYC/iEef.ZR6HRJPNy0yvUxn54632Ekhr9Q7se	Gaza	0595280158	https://w7.pngwing.com/pngs/481/915/png-transparent-computer-icons-user-avatar-woman-avatar-computer-business-conversation.png	f	2022-05-21 15:45:24.521+03	2022-05-21 15:45:24.521+03
\.


--
-- Data for Name: families; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.families (id, name, phone, address, "createdAt", "updatedAt") FROM stdin;
1	Salah Marouf	0599888620	Gaza al remal street	2022-05-21 15:45:24.514+03	2022-05-21 15:45:24.514+03
2	Ahamed Shaqoura	0599815756	Rafah al abuKhater street	2022-05-21 15:45:24.514+03	2022-05-21 15:45:24.514+03
3	Khaled Madhon	0597801162	Khan Youne street	2022-05-21 15:45:24.515+03	2022-05-21 15:45:24.515+03
4	Sami Srror	0597802262	Jabalia al  street	2022-05-21 15:45:24.516+03	2022-05-21 15:45:24.516+03
5	Khaled  Hamdona	0597086162	Gaza al seifa street	2022-05-21 15:45:24.516+03	2022-05-21 15:45:24.516+03
6	Amjad Isamil	0597446162	Gaza al shuhada street	2022-05-21 15:45:24.516+03	2022-05-21 15:45:24.516+03
7	Hassan Hamada	0597086432	North Gaza Haifa street	2022-05-21 15:45:24.516+03	2022-05-21 15:45:24.516+03
8	Yousef Kalash	0597056662	North Gaza hwja street	2022-05-21 15:45:24.516+03	2022-05-21 15:45:24.516+03
9	Hani olwan	0593456162	Gaza Al jala street	2022-05-21 15:45:24.517+03	2022-05-21 15:45:24.517+03
\.


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.reports (id, name, email, message, "createdAt", "updatedAt") FROM stdin;
1	Ahmed	Ahmed@gmail.com	Suggest an idea to donate to unemployed people	2022-05-21 15:45:24.512+03	2022-05-21 15:45:24.512+03
2	Ali	Ali@gmail.com	I like your work very much, but I suggest and hope that it will be on a global level	2022-05-21 15:45:24.512+03	2022-05-21 15:45:24.512+03
3	Ameer	ameer@gmail.com	I know a poor family in need of help. I hope to contact me 0594562017	2022-05-21 15:45:24.513+03	2022-05-21 15:45:24.513+03
4	Ossama	Ossama@gmail.com	Suggest an idea to donate to disability people	2022-05-21 15:45:24.513+03	2022-05-21 15:45:24.513+03
5	Denaa	Denaa@gmail.com	Suggest an idea to collect clothes  donation in Al eid to poor families	2022-05-21 15:45:24.513+03	2022-05-21 15:45:24.513+03
6	Salah Marouf	sala@gmail.com	I  am poor family. I hope to contact me 059348565	2022-05-21 15:45:24.513+03	2022-05-21 15:45:24.513+03
\.


--
-- Name: campaigns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.campaigns_id_seq', 12, true);


--
-- Name: capons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.capons_id_seq', 24, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.categories_id_seq', 4, true);


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.contacts_id_seq', 5, true);


--
-- Name: donations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.donations_id_seq', 38, true);


--
-- Name: donors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.donors_id_seq', 13, true);


--
-- Name: families_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.families_id_seq', 9, true);


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.reports_id_seq', 6, true);


--
-- Name: campaigns campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT campaigns_pkey PRIMARY KEY (id);


--
-- Name: capons capons_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.capons
    ADD CONSTRAINT capons_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: donations donations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.donations
    ADD CONSTRAINT donations_pkey PRIMARY KEY (id);


--
-- Name: donors donors_email_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.donors
    ADD CONSTRAINT donors_email_key UNIQUE (email);


--
-- Name: donors donors_phone_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.donors
    ADD CONSTRAINT donors_phone_key UNIQUE (phone);


--
-- Name: donors donors_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.donors
    ADD CONSTRAINT donors_pkey PRIMARY KEY (id);


--
-- Name: families families_phone_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.families
    ADD CONSTRAINT families_phone_key UNIQUE (phone);


--
-- Name: families families_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.families
    ADD CONSTRAINT families_pkey PRIMARY KEY (id);


--
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: campaigns campaigns_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT "campaigns_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: capons capons_campaignId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.capons
    ADD CONSTRAINT "capons_campaignId_fkey" FOREIGN KEY ("campaignId") REFERENCES public.campaigns(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: capons capons_familyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.capons
    ADD CONSTRAINT "capons_familyId_fkey" FOREIGN KEY ("familyId") REFERENCES public.families(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: donations donations_campaignId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.donations
    ADD CONSTRAINT "donations_campaignId_fkey" FOREIGN KEY ("campaignId") REFERENCES public.campaigns(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: donations donations_donorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.donations
    ADD CONSTRAINT "donations_donorId_fkey" FOREIGN KEY ("donorId") REFERENCES public.donors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--


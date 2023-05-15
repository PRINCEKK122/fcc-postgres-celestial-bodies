--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_in_million_years integer,
    has_life boolean DEFAULT false NOT NULL,
    distance_from_earth numeric(5,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    distance_from_earth numeric(5,2),
    is_spherical boolean DEFAULT false NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean DEFAULT false NOT NULL,
    age_in_million_years integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: planet_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_galaxy_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer,
    distance_from_earth numeric(5,2) NOT NULL,
    has_life boolean DEFAULT false,
    age_in_million_years integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: test_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.test_table (
    test_table_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age integer NOT NULL
);


ALTER TABLE public.test_table OWNER TO freecodecamp;

--
-- Name: test_table_test_table_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.test_table_test_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_table_test_table_id_seq OWNER TO freecodecamp;

--
-- Name: test_table_test_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.test_table_test_table_id_seq OWNED BY public.test_table.test_table_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_galaxy_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: test_table test_table_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.test_table ALTER COLUMN test_table_id SET DEFAULT nextval('public.test_table_test_table_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Name1', 'Description 1', 120, false, 23.45);
INSERT INTO public.galaxy VALUES (3, 'Name 2', 'Description 2', 20, false, 123.46);
INSERT INTO public.galaxy VALUES (4, 'Name 3', 'Description 3', 20, true, 3.49);
INSERT INTO public.galaxy VALUES (5, 'Name 4', 'Description 4', 200, true, 103.49);
INSERT INTO public.galaxy VALUES (6, 'Name 5', 'Description 5', 10, true, 111.24);
INSERT INTO public.galaxy VALUES (7, 'Name 6', 'Description 6', 75, false, 23.45);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon 1', 1, 59.00, true);
INSERT INTO public.moon VALUES (2, 'Moon 2', 2, 60.00, true);
INSERT INTO public.moon VALUES (3, 'Moon 3', 3, 70.00, false);
INSERT INTO public.moon VALUES (4, 'Moon 4', 22, 22.00, true);
INSERT INTO public.moon VALUES (5, 'Moon 5', 23, 123.00, false);
INSERT INTO public.moon VALUES (6, 'Moon 6', 24, 7.00, true);
INSERT INTO public.moon VALUES (7, 'Moon 7', 25, 859.00, true);
INSERT INTO public.moon VALUES (8, 'Moon 8', 26, 620.00, false);
INSERT INTO public.moon VALUES (9, 'Moon 9', 27, 787.97, false);
INSERT INTO public.moon VALUES (10, 'Moon 10', 28, 22.97, true);
INSERT INTO public.moon VALUES (11, 'Moon 11', 29, 123.00, false);
INSERT INTO public.moon VALUES (12, 'Moon 12', 30, 7.00, true);
INSERT INTO public.moon VALUES (13, 'Moon 13', 2, 33.73, false);
INSERT INTO public.moon VALUES (14, 'Moon 14', 30, 500.97, false);
INSERT INTO public.moon VALUES (15, 'Moon 15', 1, 100.97, true);
INSERT INTO public.moon VALUES (16, 'Moon 16', 29, 610.00, true);
INSERT INTO public.moon VALUES (17, 'Moon 17', 29, 29.40, true);
INSERT INTO public.moon VALUES (18, 'Moon 18', 22, 220.42, false);
INSERT INTO public.moon VALUES (19, 'Moon 19', 25, 25.97, true);
INSERT INTO public.moon VALUES (20, 'Moon 20', 28, 290.12, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Earth', true, 2023, 2);
INSERT INTO public.planet VALUES (2, 'Jupiter', 'Jupiter', false, 5000, 1);
INSERT INTO public.planet VALUES (3, 'Mars', 'Mars', true, 70, 8);
INSERT INTO public.planet VALUES (22, 'Earth 1', 'Earth 1', true, 2023, 2);
INSERT INTO public.planet VALUES (23, 'Jupiter 2', 'Jupiter 1', false, 5000, 1);
INSERT INTO public.planet VALUES (24, 'Mars 1', 'Mars 1', true, 70, 8);
INSERT INTO public.planet VALUES (25, 'Saturn', 'Saturn', false, 700043, 9);
INSERT INTO public.planet VALUES (26, 'Mercury', 'Mercury', true, 995, 10);
INSERT INTO public.planet VALUES (27, 'Pluto', 'Pluto', false, 107, 2);
INSERT INTO public.planet VALUES (28, 'Uranus', 'Uranus', true, 25, 8);
INSERT INTO public.planet VALUES (29, 'Neptune', 'Neptune', true, 95, 8);
INSERT INTO public.planet VALUES (30, 'Saturn 1', 'Saturn 1', false, 7, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Star 1', 1, 31.45, false, 31);
INSERT INTO public.star VALUES (2, 'Star 2', 1, 45.46, false, 70);
INSERT INTO public.star VALUES (3, 'Star 3', 3, 300.79, false, 1000);
INSERT INTO public.star VALUES (8, 'Star 4', 4, 31.45, false, 31);
INSERT INTO public.star VALUES (9, 'Star 5', 4, 45.46, false, 70);
INSERT INTO public.star VALUES (10, 'Star 6', 7, 300.79, false, 1000);


--
-- Data for Name: test_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.test_table VALUES (1, 'Prince', 11);
INSERT INTO public.test_table VALUES (2, 'Awuah', 12);
INSERT INTO public.test_table VALUES (3, 'Karikari', 13);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_galaxy_id_seq', 30, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: test_table_test_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.test_table_test_table_id_seq', 3, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: test_table test_table_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.test_table
    ADD CONSTRAINT test_table_name_unique UNIQUE (name);


--
-- Name: test_table test_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.test_table
    ADD CONSTRAINT test_table_pkey PRIMARY KEY (test_table_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--



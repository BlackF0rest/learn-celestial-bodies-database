--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    galaxyid integer NOT NULL,
    name character varying,
    galaxyagemillions numeric,
    sizelj integer,
    distancefromearthlj integer,
    description text,
    hasblackhole boolean,
    ispretty boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxyid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxyid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxyid_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxyid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxyid_seq OWNED BY public.galaxy.galaxyid;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255),
    size_km double precision,
    has_life boolean,
    kind character varying(255),
    description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    time_till_death_ly numeric,
    temp_tdegree integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_starid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_starid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_starid_seq OWNER TO freecodecamp;

--
-- Name: star_starid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_starid_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxyid; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxyid SET DEFAULT nextval('public.galaxy_galaxyid_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_starid_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Oculus', 150, 80, 56, 'Eine Sternensystem, welches die Virtuelle Realität benutzt', false, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 220000, 2537000, 'A spiral galaxy and the nearest major galaxy to the Milky Way.', true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000, 60000, 3000000, 'A spiral galaxy and the third-largest member of the Local Group.', true, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 4000, 76000, 23000000, 'A grand-design spiral galaxy interacting with a smaller galaxy.', true, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 13000, 50000, 29000000, 'A lenticular galaxy with a prominent dust lane in the constellation Virgo.', true, true);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 13500, 120000, 53000000, 'A giant elliptical galaxy in the Virgo Cluster with a supermassive black hole.', true, true);
INSERT INTO public.galaxy VALUES (7, 'Pinwheel', 10000, 170000, 21000000, 'A face-on spiral galaxy located in the constellation Ursa Major.', true, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Proxima Centauri b', 12000, true, 'Terrestrial', 'A potentially habitable exoplanet orbiting Proxima Centauri.', 1);
INSERT INTO public.planet VALUES (2, 'Alpha Trianguli I', 4500, false, 'Gas Giant', 'A gas giant in the Alpha Trianguli star system.', 2);
INSERT INTO public.planet VALUES (3, 'Beta Whirlpool I', 15000, true, 'Terrestrial', 'A rocky planet with signs of liquid water.', 3);
INSERT INTO public.planet VALUES (4, 'Gamma Sombrero A', 60000, false, 'Gas Giant', 'A large gas giant with a thick atmosphere.', 4);
INSERT INTO public.planet VALUES (5, 'Delta M87 Prime', 18000, false, 'Terrestrial', 'A rocky planet with a thin atmosphere.', 5);
INSERT INTO public.planet VALUES (6, 'Epsilon Pinwheel I', 11000, true, 'Terrestrial', 'A planet with a mild climate and liquid water.', 6);
INSERT INTO public.planet VALUES (7, 'Zeta Andromedae I', 20000, false, 'Gas Giant', 'A massive gas giant with strong storms.', 7);
INSERT INTO public.planet VALUES (8, 'Eta Trianguli I', 5000, false, 'Dwarf', 'A small, cold dwarf planet.', 8);
INSERT INTO public.planet VALUES (9, 'Theta Whirlpool II', 22000, true, 'Terrestrial', 'A terrestrial planet with signs of primitive life.', 9);
INSERT INTO public.planet VALUES (10, 'Iota Sombrero B', 70000, false, 'Gas Giant', 'A large gas giant with many moons.', 10);
INSERT INTO public.planet VALUES (11, 'Kappa M87 II', 14000, false, 'Terrestrial', 'A rocky planet with a barren surface.', 11);
INSERT INTO public.planet VALUES (12, 'Lambda Pinwheel II', 16000, true, 'Terrestrial', 'A terrestrial planet with potential for life.', 12);
INSERT INTO public.planet VALUES (13, 'Mu Andromedae I', 13000, true, 'Terrestrial', 'A potentially habitable planet with a breathable atmosphere.', 13);
INSERT INTO public.planet VALUES (14, 'Nu Trianguli II', 6000, false, 'Dwarf', 'A cold, distant dwarf planet.', 14);
INSERT INTO public.planet VALUES (15, 'Xi Whirlpool III', 30000, false, 'Gas Giant', 'A huge gas giant with a complex ring system.', 15);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'omega 6', 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Proxima Andromedae', 2, 5000000, 3500);
INSERT INTO public.star VALUES (3, 'Alpha Trianguli', 3, 4000000, 4500);
INSERT INTO public.star VALUES (4, 'Beta Whirlpool', 4, 6000000, 5500);
INSERT INTO public.star VALUES (5, 'Gamma Sombrero', 5, 3000000, 6500);
INSERT INTO public.star VALUES (6, 'Delta M87', 6, 7000000, 5000);
INSERT INTO public.star VALUES (7, 'Epsilon Pinwheel', 7, 8000000, 6000);
INSERT INTO public.star VALUES (8, 'Zeta Andromedae', 2, 2500000, 3700);
INSERT INTO public.star VALUES (9, 'Eta Trianguli', 3, 3500000, 4800);
INSERT INTO public.star VALUES (10, 'Theta Whirlpool', 4, 4500000, 5300);
INSERT INTO public.star VALUES (11, 'Iota Sombrero', 5, 2200000, 6200);
INSERT INTO public.star VALUES (12, 'Kappa M87', 6, 5400000, 5200);
INSERT INTO public.star VALUES (13, 'Lambda Pinwheel', 7, 6600000, 5800);
INSERT INTO public.star VALUES (14, 'Mu Andromedae', 2, 3000000, 3600);
INSERT INTO public.star VALUES (15, 'Nu Trianguli', 3, 3200000, 4700);
INSERT INTO public.star VALUES (16, 'Xi Whirlpool', 4, 5200000, 5600);


--
-- Name: galaxy_galaxyid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxyid_seq', 7, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_starid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_starid_seq', 16, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxyid);


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
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxyid_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxyid);


--
-- PostgreSQL database dump complete
--


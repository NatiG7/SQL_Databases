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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description character varying(255),
    orbital_period_in_years numeric(6,2),
    last_seen date,
    is_visible_from_earth boolean
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    number_of_stars_in_billions integer,
    name character varying(40) NOT NULL,
    galaxy_type character varying(50),
    galaxy_age_in_billion_years numeric(5,2)
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
    name character varying(40) NOT NULL,
    diameter_in_million_km integer,
    description text,
    orbits_a_planet boolean,
    is_spherical boolean,
    distance_from_earth_in_million_km numeric(6,2),
    planet_id integer
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
    name character varying(40) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(6,2),
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
    name character varying(40) NOT NULL,
    description character varying(255),
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(6,2),
    planet_types text,
    distance_from_earth numeric(6,2),
    galaxy_id integer
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halleys Comet', 'A famous comet that appears approximately every 76 years.', 76.00, '1986-02-09', true);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'One of the brightest comets in decades, visible to the naked eye.', 2533.00, '1997-04-01', true);
INSERT INTO public.comet VALUES (3, 'Comet NEOWISE', 'Discovered in March 2020, visible in July 2020.', 6769.00, '2020-07-23', true);
INSERT INTO public.comet VALUES (4, 'Swift-Tuttle', 'The parent comet of the Perseid meteor shower, has a period of about 133 years.', 133.00, '1992-01-01', true);
INSERT INTO public.comet VALUES (5, 'Bielas Comet', 'Has a periodic orbit of about 6.6 years, now considered lost.', 6.60, '1852-01-01', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 100, 'Milky Way', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 200, 'Andromeda', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 50, 'Triangulum', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 30, 'Whirlpool', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 75, 'Sombrero', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 10, 'Cartwheel', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 0, 'Earth''s only natural satellite', true, true, 0.38, 1);
INSERT INTO public.moon VALUES (2, 'Deimos', 0, 'A small moon of Mars', true, true, 0.24, 2);
INSERT INTO public.moon VALUES (3, 'Phobos', 0, 'The larger moon of Mars', true, true, 0.01, 2);
INSERT INTO public.moon VALUES (4, 'Io', 0, 'A volcanic moon of Jupiter', true, true, 628.30, 4);
INSERT INTO public.moon VALUES (5, 'Callisto', 0, 'One of Jupiter''s largest moons', true, true, 628.30, 4);
INSERT INTO public.moon VALUES (6, 'Titan', 0, 'A moon of Saturn with a dense atmosphere', true, true, 1271.00, 5);
INSERT INTO public.moon VALUES (7, 'Rhea', 0, 'A moon of Saturn', true, true, 1270.00, 5);
INSERT INTO public.moon VALUES (8, 'Enceladus', 0, 'A moon of Saturn with water geysers', true, true, 1271.00, 5);
INSERT INTO public.moon VALUES (9, 'Mimas', 0, 'A moon of Saturn with a large crater', true, true, 1272.00, 5);
INSERT INTO public.moon VALUES (10, 'Dione', 0, 'A moon of Saturn', true, true, 1271.00, 5);
INSERT INTO public.moon VALUES (11, 'Tethys', 0, 'A moon of Saturn', true, true, 1272.00, 5);
INSERT INTO public.moon VALUES (12, 'Hyperion', 0, 'A moon of Saturn', true, true, 1273.00, 5);
INSERT INTO public.moon VALUES (13, 'Iapetus', 0, 'A moon of Saturn with a unique two-tone coloration', true, true, 1273.00, 5);
INSERT INTO public.moon VALUES (14, 'Phoebe', 0, 'An irregularly shaped moon of Saturn', true, true, 1273.00, 5);
INSERT INTO public.moon VALUES (15, 'Ariel', 0, 'A moon of Uranus', true, true, 1273.00, 6);
INSERT INTO public.moon VALUES (16, 'Umbriel', 0, 'A moon of Uranus', true, true, 1274.00, 6);
INSERT INTO public.moon VALUES (17, 'Titania', 0, 'The largest moon of Uranus', true, true, 1274.00, 6);
INSERT INTO public.moon VALUES (18, 'Oberon', 0, 'A moon of Uranus', true, true, 1275.00, 6);
INSERT INTO public.moon VALUES (19, 'Miranda', 0, 'A moon of Uranus', true, true, 1275.00, 6);
INSERT INTO public.moon VALUES (20, 'Portia', 0, 'A small moon of Uranus', true, true, 1275.00, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The only known planet with life', true, true, 4500.00, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'The red planet', true, true, 4500.00, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'The hottest planet in the solar system', false, true, 4600.00, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'The largest planet in our solar system', false, true, 4600.00, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Known for its rings', false, true, 4600.00, 1);
INSERT INTO public.planet VALUES (6, 'Mercury', 'The closest planet to the Sun', false, true, 4600.00, 1);
INSERT INTO public.planet VALUES (7, 'Titan', 'A moon of Saturn with a dense atmosphere', false, true, 4500.00, 2);
INSERT INTO public.planet VALUES (8, 'Europa', 'A moon of Jupiter believed to have a subsurface ocean', true, true, 4600.00, 4);
INSERT INTO public.planet VALUES (9, 'Callisto', 'The second-largest moon of Jupiter', false, true, 4600.00, 4);
INSERT INTO public.planet VALUES (10, 'Ganymede', 'The largest moon in the solar system', false, true, 4600.00, 4);
INSERT INTO public.planet VALUES (11, 'Triton', 'A moon of Neptune', false, true, 4600.00, 2);
INSERT INTO public.planet VALUES (12, 'Enceladus', 'A moon of Saturn with water geysers', true, true, 4500.00, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our solar system', true, true, 4600.00, 'Rocky, Gaseous', 0.00, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'The brightest star in the night sky', false, true, 200.00, 'Gaseous', 8.60, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'The closest star to the Sun', true, true, 4500.00, 'Rocky', 4.24, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'A red supergiant star in the Orion constellation', false, true, 800.00, 'Gaseous', 642.00, 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'The largest star in the Alpha Centauri star system', false, true, 5800.00, 'Gaseous', 4.37, 1);
INSERT INTO public.star VALUES (6, 'Aldebaran', 'The eye of the bull in the Taurus constellation', false, true, 6500.00, 'Gaseous', 65.00, 1);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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


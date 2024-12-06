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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (255, 2018, 'Final', 4, 2, 526, 527);
INSERT INTO public.games VALUES (256, 2018, 'Third Place', 2, 0, 528, 529);
INSERT INTO public.games VALUES (257, 2018, 'Semi-Final', 2, 1, 527, 529);
INSERT INTO public.games VALUES (258, 2018, 'Semi-Final', 1, 0, 526, 528);
INSERT INTO public.games VALUES (259, 2018, 'Quarter-Final', 3, 2, 527, 530);
INSERT INTO public.games VALUES (260, 2018, 'Quarter-Final', 2, 0, 529, 531);
INSERT INTO public.games VALUES (261, 2018, 'Quarter-Final', 2, 1, 528, 532);
INSERT INTO public.games VALUES (262, 2018, 'Quarter-Final', 2, 0, 526, 533);
INSERT INTO public.games VALUES (263, 2018, 'Eighth-Final', 2, 1, 529, 534);
INSERT INTO public.games VALUES (264, 2018, 'Eighth-Final', 1, 0, 531, 535);
INSERT INTO public.games VALUES (265, 2018, 'Eighth-Final', 3, 2, 528, 536);
INSERT INTO public.games VALUES (266, 2018, 'Eighth-Final', 2, 0, 532, 537);
INSERT INTO public.games VALUES (267, 2018, 'Eighth-Final', 2, 1, 527, 538);
INSERT INTO public.games VALUES (268, 2018, 'Eighth-Final', 2, 1, 530, 539);
INSERT INTO public.games VALUES (269, 2018, 'Eighth-Final', 2, 1, 533, 540);
INSERT INTO public.games VALUES (270, 2018, 'Eighth-Final', 4, 3, 526, 541);
INSERT INTO public.games VALUES (271, 2014, 'Final', 1, 0, 542, 541);
INSERT INTO public.games VALUES (272, 2014, 'Third Place', 3, 0, 543, 532);
INSERT INTO public.games VALUES (273, 2014, 'Semi-Final', 1, 0, 541, 543);
INSERT INTO public.games VALUES (274, 2014, 'Semi-Final', 7, 1, 542, 532);
INSERT INTO public.games VALUES (275, 2014, 'Quarter-Final', 1, 0, 543, 544);
INSERT INTO public.games VALUES (276, 2014, 'Quarter-Final', 1, 0, 541, 528);
INSERT INTO public.games VALUES (277, 2014, 'Quarter-Final', 2, 1, 532, 534);
INSERT INTO public.games VALUES (278, 2014, 'Quarter-Final', 1, 0, 542, 526);
INSERT INTO public.games VALUES (279, 2014, 'Eighth-Final', 2, 1, 532, 545);
INSERT INTO public.games VALUES (280, 2014, 'Eighth-Final', 2, 0, 534, 533);
INSERT INTO public.games VALUES (281, 2014, 'Eighth-Final', 2, 0, 526, 546);
INSERT INTO public.games VALUES (282, 2014, 'Eighth-Final', 2, 1, 542, 547);
INSERT INTO public.games VALUES (283, 2014, 'Eighth-Final', 2, 1, 543, 537);
INSERT INTO public.games VALUES (284, 2014, 'Eighth-Final', 2, 1, 544, 548);
INSERT INTO public.games VALUES (285, 2014, 'Eighth-Final', 1, 0, 541, 535);
INSERT INTO public.games VALUES (286, 2014, 'Eighth-Final', 2, 1, 528, 549);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (526, 'France');
INSERT INTO public.teams VALUES (527, 'Croatia');
INSERT INTO public.teams VALUES (528, 'Belgium');
INSERT INTO public.teams VALUES (529, 'England');
INSERT INTO public.teams VALUES (530, 'Russia');
INSERT INTO public.teams VALUES (531, 'Sweden');
INSERT INTO public.teams VALUES (532, 'Brazil');
INSERT INTO public.teams VALUES (533, 'Uruguay');
INSERT INTO public.teams VALUES (534, 'Colombia');
INSERT INTO public.teams VALUES (535, 'Switzerland');
INSERT INTO public.teams VALUES (536, 'Japan');
INSERT INTO public.teams VALUES (537, 'Mexico');
INSERT INTO public.teams VALUES (538, 'Denmark');
INSERT INTO public.teams VALUES (539, 'Spain');
INSERT INTO public.teams VALUES (540, 'Portugal');
INSERT INTO public.teams VALUES (541, 'Argentina');
INSERT INTO public.teams VALUES (542, 'Germany');
INSERT INTO public.teams VALUES (543, 'Netherlands');
INSERT INTO public.teams VALUES (544, 'Costa Rica');
INSERT INTO public.teams VALUES (545, 'Chile');
INSERT INTO public.teams VALUES (546, 'Nigeria');
INSERT INTO public.teams VALUES (547, 'Algeria');
INSERT INTO public.teams VALUES (548, 'Greece');
INSERT INTO public.teams VALUES (549, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 286, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 549, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--


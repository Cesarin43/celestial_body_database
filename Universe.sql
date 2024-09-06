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
    galaxy_id integer NOT NULL,
    name character varying(30),
    age bigint NOT NULL,
    num_of_planets bigint,
    description character varying(250)
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
    name character varying(30),
    planet_id integer,
    age integer NOT NULL,
    description character varying(250)
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
    name character varying(30) NOT NULL,
    weight numeric(4,2),
    life_on_planet boolean,
    star_id integer,
    has_water boolean
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
    name character varying(30),
    galaxy_id integer NOT NULL,
    description text,
    age integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_planets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_planets (
    star_planets_id integer NOT NULL,
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.star_planets OWNER TO freecodecamp;

--
-- Name: star_planets_star_planets_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_planets_star_planets_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_planets_star_planets_seq OWNER TO freecodecamp;

--
-- Name: star_planets_star_planets_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_planets_star_planets_seq OWNED BY public.star_planets.star_planets_id;


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
-- Name: star_planets star_planets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planets ALTER COLUMN star_planets_id SET DEFAULT nextval('public.star_planets_star_planets_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600000000, 100000000000, 'The galaxy containing our Solar System, characterized by its spiral shape and large central bulge.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000000000, 1000000000, 'A neighboring spiral galaxy to the Milky Way, known for its impending collision with our galaxy in about 4.5 billion years.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 14000000000, 50000000000, 'A spiral galaxy located in the constellation Triangulum, one of the closest galaxies to the Milky Way.');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 13000000000, 200000000000, 'A prominent spiral galaxy located in the constellation Canes Venatici, known for its well-defined spiral arms.');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 13200000000, 300000000000, 'An edge-on spiral galaxy located in the constellation Virgo, named for its sombrero-like appearance.');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 13700000000, 1500000000000, 'A giant elliptical galaxy located in the Virgo cluster, notable for its supermassive black hole at its center.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ganymede', 5, 4500, 'Largest moon of Jupiter');
INSERT INTO public.moon VALUES (3, 'Callisto', 5, 4500, 'Second largest moon of Jupiter');
INSERT INTO public.moon VALUES (4, 'Io', 5, 4500, 'Volcanically active moon of Jupiter');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 4500, 'Ice-covered moon of Jupiter');
INSERT INTO public.moon VALUES (2, 'Titan', 6, 4500, 'Largest moon of Saturn');
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 4500, 'Geologically active moon of Saturn');
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 4500, 'Ice-covered moon of Saturn');
INSERT INTO public.moon VALUES (16, 'Tethys', 6, 4500, 'Inner moon of Saturn');
INSERT INTO public.moon VALUES (17, 'Iapetus', 6, 4500, 'Outer moon of Saturn');
INSERT INTO public.moon VALUES (18, 'Mimas', 6, 4500, 'Small moon of Saturn');
INSERT INTO public.moon VALUES (8, 'Oberon', 7, 4500, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (11, 'Miranda', 7, 4500, 'Bright moon of Uranus');
INSERT INTO public.moon VALUES (12, 'Ariel', 7, 4500, 'One of the major moons of Uranus');
INSERT INTO public.moon VALUES (14, 'Phobos', 4, 4500, 'Largest moon of Mars');
INSERT INTO public.moon VALUES (15, 'Deimos', 4, 4500, 'Small moon of Mars');
INSERT INTO public.moon VALUES (6, 'Moon', 3, 4500, 'Earths only natural satellite');
INSERT INTO public.moon VALUES (7, 'Triton', 8, 4500, 'Largest moon of Neptune');
INSERT INTO public.moon VALUES (19, 'CesGur Moon', 10, 4000, 'Unique moon of CesGur');
INSERT INTO public.moon VALUES (20, 'Xandor Prime', 13, 4000, 'Unique moon of Xandor');
INSERT INTO public.moon VALUES (13, 'Dione', 10, 450, 'Cesgurs second moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 3.30, false, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 4.87, false, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 5.97, true, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 0.64, false, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1.90, false, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 5.68, false, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 8.68, false, 1, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 1.02, false, 1, NULL);
INSERT INTO public.planet VALUES (10, 'CesGur', 9.43, true, 2, NULL);
INSERT INTO public.planet VALUES (11, 'Simpson', 2.11, false, 3, NULL);
INSERT INTO public.planet VALUES (12, 'Monkeys Planet', 6.87, true, 4, NULL);
INSERT INTO public.planet VALUES (13, 'Xandor', 4.57, true, 5, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'The star at the center of the Solar System.', 4600);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'The brightest star in the night sky, located in the constellation Canis Major.', 200);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 'The closest star system to the Solar System, consisting of three stars.', 5800);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'A red supergiant star in the constellation Orion, known for its distinct reddish hue.', 1000);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'A blue-white star in the constellation Lyra, one of the brightest stars in the night sky.', 450);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 'The closest known star to the Sun, part of the Alpha Centauri star system.', 4500);


--
-- Data for Name: star_planets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_planets VALUES (1, 1, 1, NULL);
INSERT INTO public.star_planets VALUES (2, 2, 1, NULL);
INSERT INTO public.star_planets VALUES (3, 3, 1, NULL);
INSERT INTO public.star_planets VALUES (4, 4, 1, NULL);
INSERT INTO public.star_planets VALUES (5, 5, 1, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_planets_star_planets_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_planets_star_planets_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: star description; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT description UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: star_planets planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planets
    ADD CONSTRAINT planet_id UNIQUE (planet_id);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_planets star_planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planets
    ADD CONSTRAINT star_planets_pkey PRIMARY KEY (star_planets_id);


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
-- Name: star_planets star_planets_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planets
    ADD CONSTRAINT star_planets_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star_planets star_planets_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planets
    ADD CONSTRAINT star_planets_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--


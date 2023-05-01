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
-- Name: black_holes; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_holes (
    name character varying(40),
    black_holes_id integer NOT NULL,
    galaxy_name character varying(40),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.black_holes OWNER TO freecodecamp;

--
-- Name: black_holes_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_holes_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_holes_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_holes_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_holes_black_hole_id_seq OWNED BY public.black_holes.black_holes_id;


--
-- Name: black_holes_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_holes_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_holes_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: black_holes_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_holes_galaxy_id_seq OWNED BY public.black_holes.galaxy_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(40) NOT NULL,
    description text,
    distance_from_earth bigint,
    galaxy_type character varying(20),
    age bigint,
    galaxy_id integer NOT NULL
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
    name character varying(40) NOT NULL,
    moon_id integer NOT NULL,
    visited boolean,
    planet_id integer NOT NULL,
    parent_planet character varying(40)
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
-- Name: moon_parent_planet_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_parent_planet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_parent_planet_seq OWNER TO freecodecamp;

--
-- Name: moon_parent_planet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_parent_planet_seq OWNED BY public.moon.planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(40) NOT NULL,
    galaxy_name text,
    planet_type character varying(20),
    planet_id integer NOT NULL,
    number_of_moons integer,
    oxygen_percentage numeric(3,1),
    has_life boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_parent_star_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_parent_star_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_parent_star_seq OWNER TO freecodecamp;

--
-- Name: planet_parent_star_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_parent_star_seq OWNED BY public.planet.star_id;


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
    name character varying(40) NOT NULL,
    description text,
    star_type character varying(20),
    star_id integer NOT NULL,
    number_of_planets integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_home_galaxy_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_home_galaxy_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_home_galaxy_seq OWNER TO freecodecamp;

--
-- Name: star_home_galaxy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_home_galaxy_seq OWNED BY public.star.galaxy_id;


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
-- Name: black_holes black_holes_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes ALTER COLUMN black_holes_id SET DEFAULT nextval('public.black_holes_black_hole_id_seq'::regclass);


--
-- Name: black_holes galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes ALTER COLUMN galaxy_id SET DEFAULT nextval('public.black_holes_galaxy_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN planet_id SET DEFAULT nextval('public.moon_parent_planet_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN star_id SET DEFAULT nextval('public.planet_parent_star_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_home_galaxy_seq'::regclass);


--
-- Data for Name: black_holes; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_holes VALUES ('Sagittarius A', 1, 'Milky Way', 2);
INSERT INTO public.black_holes VALUES ('A0620-00', 2, 'Milky Way', 2);
INSERT INTO public.black_holes VALUES ('Cygnus X-1', 3, 'Milky Way', 2);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 'Home Galaxy for our Solar System and between 100-400 million stars', 25800, 'Barred Spiral Galaxy', 13200000000, 2);
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 'It is a satellite galaxy of the Milky way', 158200, 'Magellanic Spiral', 1101000000, 3);
INSERT INTO public.galaxy VALUES ('Small Magellanic Cloud', 'Is a dwarf galaxy near the Milky Way', 199000, 'Dwarf Galaxy', 6500000000, 4);
INSERT INTO public.galaxy VALUES ('Triangulum Galaxy', 'The Triangulum Galaxy is the third largest member of the local group of galaxiesbehind the Andromeda Galaxy and the Milky Way', 2730000, 'Spiral Galaxy', 13000000000, 5);
INSERT INTO public.galaxy VALUES ('Centaurus A', 'Centaurus A is a galaxy in the constellation of Centaurus. Discovered by Scottish astronomer James Dunlop', 13050000, 'Lenticular Galaxy', 13270000, 6);
INSERT INTO public.galaxy VALUES ('Andromeda Galaxy', 'Andromeda galaxy is located at 2.5 million light years from Earth. It contains an estimate of 1 trillion stars', 2500000, 'Spiral Galaxy', 10000000000, 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Metis', 18, false, 25, 'Jupiter');
INSERT INTO public.moon VALUES ('Adrastea', 19, false, 25, 'Jupiter');
INSERT INTO public.moon VALUES ('Amalthea', 20, false, 25, 'Jupiter');
INSERT INTO public.moon VALUES ('Thebe', 21, false, 25, 'Jupiter');
INSERT INTO public.moon VALUES ('Io', 22, false, 25, 'Jupiter');
INSERT INTO public.moon VALUES ('Europa', 23, false, 25, 'Jupiter');
INSERT INTO public.moon VALUES ('Ganymede', 24, false, 25, 'Jupiter');
INSERT INTO public.moon VALUES ('Callisto', 25, false, 25, 'Jupiter');
INSERT INTO public.moon VALUES ('Themisto', 26, false, 25, 'Jupiter');
INSERT INTO public.moon VALUES ('Leda', 27, false, 25, 'Jupiter');
INSERT INTO public.moon VALUES ('Ersa', 28, false, 25, 'Jupiter');
INSERT INTO public.moon VALUES ('Himalia', 29, false, 25, 'Jupiter');
INSERT INTO public.moon VALUES ('Elara', 30, false, 25, 'Jupiter');
INSERT INTO public.moon VALUES ('Dia', 31, false, 25, 'Jupiter');
INSERT INTO public.moon VALUES ('Carpo', 32, false, 25, 'Jupiter');
INSERT INTO public.moon VALUES ('Phobos', 33, false, 24, 'Mars');
INSERT INTO public.moon VALUES ('Deimos', 34, false, 24, 'Mars');
INSERT INTO public.moon VALUES ('Moon', 2, true, 20, 'Earth');
INSERT INTO public.moon VALUES ('Titania', 35, false, 27, 'Uranus');
INSERT INTO public.moon VALUES ('Ariel', 36, false, 27, 'Uranus');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 'Milky Way', 'Terrestrial', 20, 1, 21.0, true, 1);
INSERT INTO public.planet VALUES ('GU Piscium B', 'Milky Way', 'Gas Giant', 21, 0, 0.0, false, 2);
INSERT INTO public.planet VALUES ('Mercury', 'Milky Way', 'Terrestrial', 22, 0, 0.0, false, 1);
INSERT INTO public.planet VALUES ('Mars', 'Milky Way', 'Terrestrial', 24, 2, 0.0, false, 1);
INSERT INTO public.planet VALUES ('Venus', 'Milky Way', 'Terrestrial', 23, 0, 0.0, false, 1);
INSERT INTO public.planet VALUES ('Jupiter', 'Milky Way', 'Gas Giant', 25, 95, 0.0, false, 1);
INSERT INTO public.planet VALUES ('Saturn', 'Milky Way', 'Gas Giant', 26, 83, 0.0, false, 1);
INSERT INTO public.planet VALUES ('Uranus', 'Milky Way', 'Ice Giant', 27, 14, 0.0, false, 1);
INSERT INTO public.planet VALUES ('Pluto', 'Milky Way', 'Dwarf Planet', 28, 5, 0.0, false, 1);
INSERT INTO public.planet VALUES ('HD 209458 b', 'Milky Way', 'Gas Giant', 30, 0, 0.0, false, 8);
INSERT INTO public.planet VALUES ('WASP-12', 'Milky Way', 'G', 31, 0, 0.0, false, 9);
INSERT INTO public.planet VALUES ('Proxima Centauri b', 'Milky Way', 'Terrestrial', 32, 0, 0.0, false, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 'HD 209458 is an 8th magnitude star in the constellation Pegasus', 'Yellow Dwarf', 1, 8, 2);
INSERT INTO public.star VALUES ('GU Piscium', 'HD 209458 is an 8th magnitude star in the constellation Pegasus', 'Brown Dwarf', 2, 1, 2);
INSERT INTO public.star VALUES ('Sirius A', 'HD 209458 is an 8th magnitude star in the constellation Pegasus', 'A', 3, 0, 2);
INSERT INTO public.star VALUES ('Sirius B', 'HD 209458 is an 8th magnitude star in the constellation Pegasus', 'White Dwarf', 4, 0, 2);
INSERT INTO public.star VALUES ('Algol', 'HD 209458 is an 8th magnitude star in the constellation Pegasus', 'Elipsing Binaries', 6, 0, 2);
INSERT INTO public.star VALUES ('Alpha Sagittarii', 'HD 209458 is an 8th magnitude star in the constellation Pegasus', 'Class B Dwarf', 5, 0, 2);
INSERT INTO public.star VALUES ('Proxima Centauri', 'HD 209458 is an 8th magnitude star in the constellation Pegasus', 'Red Dwarf', 7, 1, 2);
INSERT INTO public.star VALUES ('WASP-12', 'HD 209458 is an 8th magnitude star in the constellation Pegasus', 'Yellow Dwarf', 9, 1, 2);
INSERT INTO public.star VALUES ('HD 209458', 'HD 209458 is an 8th magnitude star in the constellation Pegasus', 'F', 8, 1, 2);


--
-- Name: black_holes_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_holes_black_hole_id_seq', 3, true);


--
-- Name: black_holes_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_holes_galaxy_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 37, true);


--
-- Name: moon_parent_planet_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_parent_planet_seq', 16, true);


--
-- Name: planet_parent_star_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_parent_star_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 32, true);


--
-- Name: star_home_galaxy_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_home_galaxy_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: black_holes black_holes_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes
    ADD CONSTRAINT black_holes_name_key UNIQUE (name);


--
-- Name: black_holes black_holes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes
    ADD CONSTRAINT black_holes_pkey PRIMARY KEY (black_holes_id);


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
-- Name: moon moon_parent_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_parent_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_parent_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_parent_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_home_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_home_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

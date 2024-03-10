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
    name character varying(40) NOT NULL,
    has_life boolean,
    is_spherical boolean NOT NULL,
    description text,
    age_in_millions_of_years integer,
    number_of_star integer,
    distance_from_earth_in_ly numeric(20,10)
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
    has_life boolean,
    is_spherical boolean NOT NULL,
    description text,
    age_in_millions_of_years integer,
    orbital_period_in_day integer,
    distance_from_earth_in_ly numeric(20,10),
    planet_id integer NOT NULL
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
    has_life boolean,
    is_spherical boolean NOT NULL,
    description text,
    age_in_millions_of_years integer,
    number_of_moon integer,
    distance_from_earth_in_ly numeric(20,10),
    star_id integer NOT NULL
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
-- Name: research; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.research (
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    research_date date,
    research_id integer NOT NULL,
    name character varying(40)
);


ALTER TABLE public.research OWNER TO freecodecamp;

--
-- Name: research_research_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.research_research_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_research_id_seq OWNER TO freecodecamp;

--
-- Name: research_research_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.research_research_id_seq OWNED BY public.research.research_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    has_life boolean,
    is_spherical boolean NOT NULL,
    description text,
    age_in_millions_of_years integer,
    number_of_planet integer,
    distance_from_earth_in_ly numeric(20,10),
    galaxy_id integer NOT NULL
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
-- Name: research research_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.research ALTER COLUMN research_id SET DEFAULT nextval('public.research_research_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', false, true, 'The nearest major galaxy to the Milky Way, known for its spiral structure. It is part of the Local Group.', 10000, 1000000000, 2537000.0000000000);
INSERT INTO public.galaxy VALUES (5, 'Magellanic', true, true, 'A duo of irregular dwarf galaxies, orbiting the Milky Way, rich in gas and dust, showing signs of recent star formation.', 14000, 30000000, 160000.0000000000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', true, true, 'A face-on spiral galaxy, noted for its striking arm structures and the presence of many nebulae. It is a grand design spiral galaxy.', 21000, 1000000000, 21000000.0000000000);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', false, false, 'A classic spiral galaxy, famous for its well-defined spiral arms and being a starburst galaxy, which is actively forming new stars.', 8000, 300000000, 23000000.0000000000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', false, false, 'Known for its bright nucleus, large central bulge, and dramatic dust lanes in its disk. Its appearance resembles a sombrero.', 9000, 800000000, 29000000.0000000000);
INSERT INTO public.galaxy VALUES (2, 'Triangulum', true, false, 'A member of the Local Group, this spiral galaxy is a close neighbor to the Milky Way and Andromeda, notable for its clear spiral arms.', 13000, 40000000, 3000000.0000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Lunaris', false, true, 'A small, rocky moon with no atmosphere.', 3000, 27, 0.0027000000, 1);
INSERT INTO public.moon VALUES (2, 'Selene', false, true, 'A desolate moon with extensive lava plains.', 4500, 15, 0.0029000000, 1);
INSERT INTO public.moon VALUES (5, 'Europa', true, true, 'Ice-covered moon with a subsurface ocean, speculated to harbor life.', 4500, 4, 0.0022000000, 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', false, true, 'The largest moon in the solar system, with a magnetic field.', 4500, 7, 0.0025000000, 3);
INSERT INTO public.moon VALUES (7, 'Titan', true, true, 'Has a thick atmosphere and liquid methane lakes, potentially harboring life.', 4600, 16, 0.0085000000, 4);
INSERT INTO public.moon VALUES (8, 'Rhea', true, false, 'An icy moon with a thin oxygen atmosphere.', 4600, 5, 0.0092000000, 4);
INSERT INTO public.moon VALUES (9, 'Callisto', false, true, 'A heavily cratered moon with an ancient surface.', 4500, 17, 0.0026000000, 5);
INSERT INTO public.moon VALUES (10, 'Iapetus', false, true, 'Known for its unusual two-tone coloration.', 4600, 79, 0.0035000000, 5);
INSERT INTO public.moon VALUES (13, 'Triton', false, true, 'Orbits its planet in a retrograde direction.', 6000, 6, 0.0027000000, 7);
INSERT INTO public.moon VALUES (14, 'Nereid', false, true, 'Has a highly eccentric orbit.', 6000, 360, 0.0028000000, 7);
INSERT INTO public.moon VALUES (15, 'Charon', true, false, 'Large enough to be considered a binary system with its planet.', 4500, 6, 0.0029000000, 8);
INSERT INTO public.moon VALUES (16, 'Nix', false, false, 'A small, irregularly shaped moon.', 4500, 25, 0.0030000000, 8);
INSERT INTO public.moon VALUES (17, 'Hydra', false, true, 'Another small moon, orbiting further out.', 4500, 38, 0.0031000000, 9);
INSERT INTO public.moon VALUES (18, 'Kerberos', false, false, 'Discovered more recently, smaller and darker.', 4500, 32, 0.0032000000, 9);
INSERT INTO public.moon VALUES (19, 'Styx', true, false, 'The outermost known moon of its planet.', 4500, 20, 0.0033000000, 10);
INSERT INTO public.moon VALUES (20, 'Dysnomia', true, true, 'A moon with a very reflective surface, suggesting ice.', 1000, 16, 0.0100000000, 10);
INSERT INTO public.moon VALUES (3, 'Phobos', false, false, 'A tiny, irregularly shaped moon with a rapid orbit.', 4600, 9, 0.0001000000, 2);
INSERT INTO public.moon VALUES (11, 'Miranda', false, false, 'Features one of the most extreme topographies.', 4500, 41, 0.0012000000, 6);
INSERT INTO public.moon VALUES (4, 'Deimos', false, false, 'Smaller and less massive than its sibling, with a smoother surface.', 4600, 11, 0.0001400000, 2);
INSERT INTO public.moon VALUES (12, 'Ariel', false, true, 'Shows signs of past geological activity.', 4500, 100, 0.0013000000, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Proxima b', false, true, 'An exoplanet orbiting within the habitable zone of Proxima Centauri.', 4600, 0, 4.2400000000, 1);
INSERT INTO public.planet VALUES (2, 'Proxima c', false, true, 'A more distant and colder planet in the Proxima Centauri system.', 4600, 0, 4.2400000000, 1);
INSERT INTO public.planet VALUES (3, 'Betelgeuse b', true, false, 'A gas giant orbiting the red supergiant star Betelgeuse.', 8000, 0, 642.5000000000, 2);
INSERT INTO public.planet VALUES (4, 'Betelgeuse c', false, true, 'A distant planet with extreme seasons due to its elliptical orbit.', 8000, 0, 642.5000000000, 2);
INSERT INTO public.planet VALUES (5, 'Vega b', false, false, 'A hot jupiter closely orbiting Vega.', 455, 0, 25.0400000000, 3);
INSERT INTO public.planet VALUES (6, 'Vega c', false, false, 'A rocky exoplanet with no atmosphere, orbiting Vega.', 455, 0, 25.0400000000, 3);
INSERT INTO public.planet VALUES (7, 'Sirius b', false, true, 'A rocky planet within the habitable zone of Sirius, with liquid water.', 242, 1, 8.6000000000, 4);
INSERT INTO public.planet VALUES (8, 'Sirius c', false, false, 'A gas giant with a system of over 30 moons.', 242, 30, 8.6000000000, 4);
INSERT INTO public.planet VALUES (9, 'R136a1 b', true, true, 'A planet surviving extreme conditions, orbiting the luminous R136a1.', 1000, 0, 163000.0000000000, 5);
INSERT INTO public.planet VALUES (10, 'R136a1 c', true, true, 'A gas giant being stripped away by the intense radiation of R136a1.', 1000, 0, 163000.0000000000, 5);
INSERT INTO public.planet VALUES (11, 'Kepler-444 b', true, false, 'An ancient rocky planet, potentially harboring life.', 11700, 0, 117.0000000000, 6);
INSERT INTO public.planet VALUES (12, 'Kepler-444 c', false, true, 'An ancient gas giant with a thick atmosphere.', 11700, 0, 117.0000000000, 6);


--
-- Data for Name: research; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.research VALUES (1, 1, '2023-01-15', 1, 'research_1');
INSERT INTO public.research VALUES (2, 3, '2023-02-20', 2, 'research_2');
INSERT INTO public.research VALUES (3, 5, '2023-03-25', 3, 'research_3');
INSERT INTO public.research VALUES (4, 7, '2023-04-30', 4, 'research_4');
INSERT INTO public.research VALUES (5, 9, '2023-05-05', 5, 'research_5');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', false, true, 'The closest known star to the Sun, hosting a potentially habitable planet.', 4600, 1, 4.2400000000, 1);
INSERT INTO public.star VALUES (3, 'Vega', false, true, 'A bright, blue-tinged star that is one of the most luminous stars in the nearby neighborhood.', 455, 0, 25.0400000000, 3);
INSERT INTO public.star VALUES (5, 'R136a1', false, true, 'The most massive and luminous star known, located in the Large Magellanic Cloud.', 1000, 0, 163000.0000000000, 5);
INSERT INTO public.star VALUES (6, 'Kepler-444', true, false, 'An ancient star hosting a system of five small exoplanets, one of the oldest known.', 11700, 5, 117.0000000000, 6);
INSERT INTO public.star VALUES (4, 'Sirius', false, true, 'The brightest star in the Earth night sky, known as the "Dog Star" in the constellation Canis Major.', 242, 2, 8.6000000000, 4);
INSERT INTO public.star VALUES (2, 'Betelgeuse', true, false, 'A red supergiant star nearing the end of its life, expected to explode as a supernova.', 8000, 0, 642.5000000000, 2);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: research_research_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.research_research_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: research research_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.research
    ADD CONSTRAINT research_pkey PRIMARY KEY (research_id);


--
-- Name: research research_research_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.research
    ADD CONSTRAINT research_research_name_key UNIQUE (name);


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


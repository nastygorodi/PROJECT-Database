--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5
-- Dumped by pg_dump version 14.1

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

--
-- Name: count_songs(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.count_songs(singer_ text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE count_ int;
BEGIN SELECT SUM(1) INTO count_ FROM songs
WHERE singer = singer_;
RETURN count_;
END;
$$;


--
-- Name: customer_base(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.customer_base(label_ text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE count_ int;
BEGIN SELECT SUM(1) INTO count_ FROM musicians
WHERE label = label_;
RETURN count_;
END;
$$;


--
-- Name: upd_labels(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.upd_labels() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN INSERT INTO labels ( label_name )
VALUES ( NEW.label )
ON CONFLICT ( label_name ) DO NOTHING;
RETURN NEW;
END;
$$;


--
-- Name: upd_musicians(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.upd_musicians() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN INSERT INTO musicians ( singer )
VALUES ( NEW.singer )
ON CONFLICT ( singer ) DO NOTHING;
RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: films; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.films (
    singer text NOT NULL,
    type text,
    name text NOT NULL,
    year integer,
    CONSTRAINT films_type_check CHECK (((type = 'serial'::text) OR (type = 'film'::text)))
);


--
-- Name: labels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.labels (
    label_name text NOT NULL,
    company text,
    country text,
    year_foundation integer
);


--
-- Name: music_albums; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.music_albums (
    name text NOT NULL,
    singer text NOT NULL,
    size integer,
    year integer
);


--
-- Name: musicians; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.musicians (
    singer text NOT NULL,
    date_of_birth date,
    country text,
    tags text[],
    label text DEFAULT ''::text
);


--
-- Name: rewards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rewards (
    singer text NOT NULL,
    reward_name text,
    year integer
);


--
-- Name: songs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.songs (
    name text NOT NULL,
    singer text NOT NULL,
    year integer,
    genre text,
    album text
);


--
-- Name: tours; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tours (
    tour_name text NOT NULL,
    singer text NOT NULL,
    year integer,
    countries_cities json
);


--
-- Name: video_clips; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.video_clips (
    name text NOT NULL,
    singer text NOT NULL,
    year integer,
    genre text,
    album text
);


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.films (singer, type, name, year) FROM stdin;
Miley Cyrus	film	LOL	2012
Miley Cyrus	serial	Crisis in Six Scenes	2016
Danna Paola	serial	Elite	2019
Danna Paola	serial	La Doña	2016
Danna Paola	film	Home	2015
\.


--
-- Data for Name: labels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.labels (label_name, company, country, year_foundation) FROM stdin;
Columbia Records	\N	\N	\N
Universal Music Group	\N	\N	\N
	\N	\N	\N
\.


--
-- Data for Name: music_albums; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.music_albums (name, singer, size, year) FROM stdin;
21	Adele	\N	\N
SIE7E	Danna Paola	\N	\N
Future Nostalgia	Dua Lipa	\N	\N
Bangerz	Miley Cyrus	\N	\N
SHE IS COMING	Miley Cyrus	\N	\N
This Is Acting	Sia	\N	\N
Chosen	Maneskin	\N	\N
Younger Now	Miley Cyrus	\N	\N
1000 Forms of Fear	Sia	\N	\N
\.


--
-- Data for Name: musicians; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.musicians (singer, date_of_birth, country, tags, label) FROM stdin;
Miley Cyrus	\N	USA	\N	Columbia Records
Danna Paola	\N	Spain	\N	Universal Music Group
Adele	\N	UK	\N	Columbia Records
Maneskin	\N	\N	\N	
Dua Lipa	\N	\N	\N	
Sia	\N	\N	\N	
\.


--
-- Data for Name: rewards; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.rewards (singer, reward_name, year) FROM stdin;
Miley Cyrus	Billboard	2014
Miley Cyrus	iHeartRadio Music Awards	2014
Dua Lipa	Grammy Awards	2021
Adele	American Music Awards	2016
Maneskin	Wind Music Awards	2018
Miley Cyrus	MTV Europe Music Awards	2013
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.songs (name, singer, year, genre, album) FROM stdin;
Robot	Miley Cyrus	2010	\N	\N
Contigo	Danna Paola	2020	\N	\N
CORALINE	Maneskin	2021	\N	\N
Malibu	Miley Cyrus	2017	\N	\N
Polo a Tierra	Danna Paola	2020	\N	\N
Hallucinate	Dua Lipa	2020	\N	\N
Drive	Miley Cyrus	2013	\N	\N
Liberty Walk	Miley Cyrus	2010	\N	\N
1 Sun	Miley Cyrus	2015	\N	\N
Plastic Hearts	Miley Cyrus	2020	\N	\N
Unstoppable	Sia	2016	\N	\N
Big Girls Cry	Sia	2014	\N	\N
Levitating	Dua Lipa	2020	\N	\N
Final Feliz	Danna Paola	2020	\N	\N
Beggin	Maneskin	2017	\N	\N
Future Nostalgia	Dua Lipa	2020	\N	\N
Someone Like You	Adele	2011	\N	\N
\.


--
-- Data for Name: tours; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tours (tour_name, singer, year, countries_cities) FROM stdin;
Bangerz Tour	Miley Cyrus	2013	{ "USA": { "city" : "New-York" } }
Maneskin Tour	Maneskin	2021	{ "Russia": { "city" : "Moscow" } }
\.


--
-- Data for Name: video_clips; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.video_clips (name, singer, year, genre, album) FROM stdin;
Malibu	Miley Cyrus	2017	\N	\N
Contigo	Danna Paola	2020	\N	\N
\.


--
-- Name: labels labels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.labels
    ADD CONSTRAINT labels_pkey PRIMARY KEY (label_name);


--
-- Name: music_albums music_albums_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.music_albums
    ADD CONSTRAINT music_albums_pkey PRIMARY KEY (name);


--
-- Name: musicians musicians_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.musicians
    ADD CONSTRAINT musicians_pkey PRIMARY KEY (singer);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (name);


--
-- Name: tours tours_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tours
    ADD CONSTRAINT tours_pkey PRIMARY KEY (tour_name);


--
-- Name: musicians add_labels; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER add_labels BEFORE INSERT ON public.musicians FOR EACH ROW EXECUTE FUNCTION public.upd_labels();


--
-- Name: songs add_musicians; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER add_musicians BEFORE INSERT ON public.songs FOR EACH ROW EXECUTE FUNCTION public.upd_musicians();


--
-- Name: films films_singer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_singer_fkey FOREIGN KEY (singer) REFERENCES public.musicians(singer) ON DELETE CASCADE;


--
-- Name: music_albums music_albums_singer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.music_albums
    ADD CONSTRAINT music_albums_singer_fkey FOREIGN KEY (singer) REFERENCES public.musicians(singer) ON DELETE CASCADE;


--
-- Name: musicians musicians_label_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.musicians
    ADD CONSTRAINT musicians_label_fkey FOREIGN KEY (label) REFERENCES public.labels(label_name) ON DELETE SET DEFAULT;


--
-- Name: rewards rewards_singer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rewards
    ADD CONSTRAINT rewards_singer_fkey FOREIGN KEY (singer) REFERENCES public.musicians(singer) ON DELETE CASCADE;


--
-- Name: songs songs_singer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_singer_fkey FOREIGN KEY (singer) REFERENCES public.musicians(singer) ON DELETE CASCADE;


--
-- Name: tours tours_singer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tours
    ADD CONSTRAINT tours_singer_fkey FOREIGN KEY (singer) REFERENCES public.musicians(singer) ON DELETE CASCADE;


--
-- Name: video_clips video_clips_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.video_clips
    ADD CONSTRAINT video_clips_name_fkey FOREIGN KEY (name) REFERENCES public.songs(name) ON DELETE CASCADE;


--
-- Name: video_clips video_clips_singer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.video_clips
    ADD CONSTRAINT video_clips_singer_fkey FOREIGN KEY (singer) REFERENCES public.musicians(singer) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--


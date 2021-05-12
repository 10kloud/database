--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Ubuntu 12.2-4)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-4)

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
-- Name: alarm; Type: TABLE; Schema: public; Owner: bolzan
--

CREATE TABLE public.alarm (
    id integer NOT NULL,
    silos_id integer NOT NULL,
    threshold double precision NOT NULL,
    alarming_parameter character varying(45) NOT NULL,
    severity_alarm integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.alarm OWNER TO bolzan;

--
-- Name: alarm_id_seq; Type: SEQUENCE; Schema: public; Owner: bolzan
--

CREATE SEQUENCE public.alarm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alarm_id_seq OWNER TO bolzan;

--
-- Name: alarm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bolzan
--

ALTER SEQUENCE public.alarm_id_seq OWNED BY public.alarm.id;


--
-- Name: alarm_user_id_seq; Type: SEQUENCE; Schema: public; Owner: bolzan
--

CREATE SEQUENCE public.alarm_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alarm_user_id_seq OWNER TO bolzan;

--
-- Name: alarm_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bolzan
--

ALTER SEQUENCE public.alarm_user_id_seq OWNED BY public.alarm.user_id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: bolzan
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    mail character varying(45) NOT NULL,
    password character varying(45) NOT NULL,
    permission integer NOT NULL
);


ALTER TABLE public."user" OWNER TO bolzan;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: bolzan
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO bolzan;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bolzan
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: alarm id; Type: DEFAULT; Schema: public; Owner: bolzan
--

ALTER TABLE ONLY public.alarm ALTER COLUMN id SET DEFAULT nextval('public.alarm_id_seq'::regclass);


--
-- Name: alarm user_id; Type: DEFAULT; Schema: public; Owner: bolzan
--

ALTER TABLE ONLY public.alarm ALTER COLUMN user_id SET DEFAULT nextval('public.alarm_user_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: bolzan
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: alarm alarm_pkey; Type: CONSTRAINT; Schema: public; Owner: bolzan
--

ALTER TABLE ONLY public.alarm
    ADD CONSTRAINT alarm_pkey PRIMARY KEY (id);


--
-- Name: user user_mail_key; Type: CONSTRAINT; Schema: public; Owner: bolzan
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_mail_key UNIQUE (mail);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: bolzan
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: alarm alarm_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bolzan
--

ALTER TABLE ONLY public.alarm
    ADD CONSTRAINT alarm_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- PostgreSQL database dump complete
--


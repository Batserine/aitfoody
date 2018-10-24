--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)
-- Dumped by pg_dump version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: projects1; Type: TABLE; Schema: public; Owner: balu
--

CREATE TABLE public.projects1 (
    projectid integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.projects1 OWNER TO balu;

--
-- Name: students; Type: TABLE; Schema: public; Owner: balu
--

CREATE TABLE public.students (
    studentid integer NOT NULL,
    name character varying(100),
    projectid integer
);


ALTER TABLE public.students OWNER TO balu;

--
-- Data for Name: projects1; Type: TABLE DATA; Schema: public; Owner: balu
--

COPY public.projects1 (projectid, name) FROM stdin;
1	CSIM info system
2	I am awesome
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: balu
--

COPY public.students (studentid, name, projectid) FROM stdin;
123456	I am	1
123457	awesome	2
\.


--
-- Name: projects1 projects1_pkey; Type: CONSTRAINT; Schema: public; Owner: balu
--

ALTER TABLE ONLY public.projects1
    ADD CONSTRAINT projects1_pkey PRIMARY KEY (projectid);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: balu
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (studentid);


--
-- Name: students students_projectid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: balu
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_projectid_fkey FOREIGN KEY (projectid) REFERENCES public.projects1(projectid);


--
-- PostgreSQL database dump complete
--


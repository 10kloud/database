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
-- Name: AspNetRoleClaims; Type: TABLE; Schema: public; Owner: bolzan
--

CREATE TABLE public."AspNetRoleClaims" (
    "Id" integer NOT NULL,
    "RoleId" text NOT NULL,
    "ClaimType" text,
    "ClaimValue" text
);


ALTER TABLE public."AspNetRoleClaims" OWNER TO bolzan;

--
-- Name: AspNetRoleClaims_Id_seq; Type: SEQUENCE; Schema: public; Owner: bolzan
--

ALTER TABLE public."AspNetRoleClaims" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."AspNetRoleClaims_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: AspNetRoles; Type: TABLE; Schema: public; Owner: bolzan
--

CREATE TABLE public."AspNetRoles" (
    "Id" text NOT NULL,
    "Name" character varying(256),
    "NormalizedName" character varying(256),
    "ConcurrencyStamp" text
);


ALTER TABLE public."AspNetRoles" OWNER TO bolzan;

--
-- Name: AspNetUserClaims; Type: TABLE; Schema: public; Owner: bolzan
--

CREATE TABLE public."AspNetUserClaims" (
    "Id" integer NOT NULL,
    "UserId" text NOT NULL,
    "ClaimType" text,
    "ClaimValue" text
);


ALTER TABLE public."AspNetUserClaims" OWNER TO bolzan;

--
-- Name: AspNetUserClaims_Id_seq; Type: SEQUENCE; Schema: public; Owner: bolzan
--

ALTER TABLE public."AspNetUserClaims" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."AspNetUserClaims_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: AspNetUserLogins; Type: TABLE; Schema: public; Owner: bolzan
--

CREATE TABLE public."AspNetUserLogins" (
    "LoginProvider" character varying(128) NOT NULL,
    "ProviderKey" character varying(128) NOT NULL,
    "ProviderDisplayName" text,
    "UserId" text NOT NULL
);


ALTER TABLE public."AspNetUserLogins" OWNER TO bolzan;

--
-- Name: AspNetUserRoles; Type: TABLE; Schema: public; Owner: bolzan
--

CREATE TABLE public."AspNetUserRoles" (
    "UserId" text NOT NULL,
    "RoleId" text NOT NULL
);


ALTER TABLE public."AspNetUserRoles" OWNER TO bolzan;

--
-- Name: AspNetUserTokens; Type: TABLE; Schema: public; Owner: bolzan
--

CREATE TABLE public."AspNetUserTokens" (
    "UserId" text NOT NULL,
    "LoginProvider" character varying(128) NOT NULL,
    "Name" character varying(128) NOT NULL,
    "Value" text
);


ALTER TABLE public."AspNetUserTokens" OWNER TO bolzan;

--
-- Name: AspNetUsers; Type: TABLE; Schema: public; Owner: bolzan
--

CREATE TABLE public."AspNetUsers" (
    "Id" text NOT NULL,
    "UserName" character varying(256),
    "NormalizedUserName" character varying(256),
    "Email" character varying(256),
    "NormalizedEmail" character varying(256),
    "EmailConfirmed" boolean NOT NULL,
    "PasswordHash" text,
    "SecurityStamp" text,
    "ConcurrencyStamp" text,
    "PhoneNumber" text,
    "PhoneNumberConfirmed" boolean NOT NULL,
    "TwoFactorEnabled" boolean NOT NULL,
    "LockoutEnd" timestamp with time zone,
    "LockoutEnabled" boolean NOT NULL,
    "AccessFailedCount" integer NOT NULL,
    "Permission" integer
);


ALTER TABLE public."AspNetUsers" OWNER TO bolzan;

--
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: bolzan
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO bolzan;

--
-- Name: alarm; Type: TABLE; Schema: public; Owner: bolzan
--

CREATE TABLE public.alarm (
    id integer NOT NULL,
    name character varying(45),
    description character varying(1000),
    silos_id integer,
    severity_alarm integer,
    threshold double precision,
    alarming_parameter character varying(45),
    user_id text NOT NULL
);


ALTER TABLE public.alarm OWNER TO bolzan;

--
-- Name: alarm_history; Type: TABLE; Schema: public; Owner: bolzan
--

CREATE TABLE public.alarm_history (
    alarm_id integer NOT NULL,
    data date,
    description character varying(1000)
);


ALTER TABLE public.alarm_history OWNER TO bolzan;

--
-- Name: alarm_history_alarm_id_seq; Type: SEQUENCE; Schema: public; Owner: bolzan
--

CREATE SEQUENCE public.alarm_history_alarm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alarm_history_alarm_id_seq OWNER TO bolzan;

--
-- Name: alarm_history_alarm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bolzan
--

ALTER SEQUENCE public.alarm_history_alarm_id_seq OWNED BY public.alarm_history.alarm_id;


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
-- Name: alarm id; Type: DEFAULT; Schema: public; Owner: bolzan
--

ALTER TABLE ONLY public.alarm ALTER COLUMN id SET DEFAULT nextval('public.alarm_id_seq'::regclass);


--
-- Name: alarm user_id; Type: DEFAULT; Schema: public; Owner: bolzan
--

ALTER TABLE ONLY public.alarm ALTER COLUMN user_id SET DEFAULT nextval('public.alarm_user_id_seq'::regclass);


--
-- Name: alarm_history alarm_id; Type: DEFAULT; Schema: public; Owner: bolzan
--

ALTER TABLE ONLY public.alarm_history ALTER COLUMN alarm_id SET DEFAULT nextval('public.alarm_history_alarm_id_seq'::regclass);


--
-- Name: AspNetRoleClaims PK_AspNetRoleClaims; Type: CONSTRAINT; Schema: public; Owner: bolzan
--

ALTER TABLE ONLY public."AspNetRoleClaims"
    ADD CONSTRAINT "PK_AspNetRoleClaims" PRIMARY KEY ("Id");


--
-- Name: AspNetRoles PK_AspNetRoles; Type: CONSTRAINT; Schema: public; Owner: bolzan
--

ALTER TABLE ONLY public."AspNetRoles"
    ADD CONSTRAINT "PK_AspNetRoles" PRIMARY KEY ("Id");


--
-- Name: AspNetUserLogins PK_AspNetUserLogins; Type: CONSTRAINT; Schema: public; Owner: bolzan
--

ALTER TABLE ONLY public."AspNetUserLogins"
    ADD CONSTRAINT "PK_AspNetUserLogins" PRIMARY KEY ("LoginProvider", "ProviderKey");


--
-- Name: AspNetUserRoles PK_AspNetUserRoles; Type: CONSTRAINT; Schema: public; Owner: bolzan
--

ALTER TABLE ONLY public."AspNetUserRoles"
    ADD CONSTRAINT "PK_AspNetUserRoles" PRIMARY KEY ("UserId", "RoleId");


--
-- Name: alarm_history alarm_history_pkey; Type: CONSTRAINT; Schema: public; Owner: bolzan
--

ALTER TABLE ONLY public.alarm_history
    ADD CONSTRAINT alarm_history_pkey PRIMARY KEY (alarm_id);


--
-- Name: alarm alarm_pkey; Type: CONSTRAINT; Schema: public; Owner: bolzan
--

ALTER TABLE ONLY public.alarm
    ADD CONSTRAINT alarm_pkey PRIMARY KEY (id);


--
-- Name: EmailIndex; Type: INDEX; Schema: public; Owner: bolzan
--

CREATE INDEX "EmailIndex" ON public."AspNetUsers" USING btree ("NormalizedEmail");


--
-- Name: IX_AspNetRoleClaims_RoleId; Type: INDEX; Schema: public; Owner: bolzan
--

CREATE INDEX "IX_AspNetRoleClaims_RoleId" ON public."AspNetRoleClaims" USING btree ("RoleId");


--
-- Name: IX_AspNetUserClaims_UserId; Type: INDEX; Schema: public; Owner: bolzan
--

CREATE INDEX "IX_AspNetUserClaims_UserId" ON public."AspNetUserClaims" USING btree ("UserId");


--
-- Name: IX_AspNetUserLogins_UserId; Type: INDEX; Schema: public; Owner: bolzan
--

CREATE INDEX "IX_AspNetUserLogins_UserId" ON public."AspNetUserLogins" USING btree ("UserId");


--
-- Name: IX_AspNetUserRoles_RoleId; Type: INDEX; Schema: public; Owner: bolzan
--

CREATE INDEX "IX_AspNetUserRoles_RoleId" ON public."AspNetUserRoles" USING btree ("RoleId");


--
-- Name: NameIndex; Type: INDEX; Schema: public; Owner: bolzan
--

CREATE UNIQUE INDEX "NameIndex" ON public."AspNetUsers" USING btree ("NormalizedUserName");


--
-- Name: RoleNameIndex; Type: INDEX; Schema: public; Owner: bolzan
--

CREATE UNIQUE INDEX "RoleNameIndex" ON public."AspNetRoles" USING btree ("NormalizedName");


--
-- Name: AspNetRoleClaims FK_AspNetRoleClaims_AspNetRoles_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: bolzan
--

ALTER TABLE ONLY public."AspNetRoleClaims"
    ADD CONSTRAINT "FK_AspNetRoleClaims_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES public."AspNetRoles"("Id") ON DELETE CASCADE;


--
-- Name: alarm_history alarm_history_alarm_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bolzan
--

ALTER TABLE ONLY public.alarm_history
    ADD CONSTRAINT alarm_history_alarm_id_fkey FOREIGN KEY (alarm_id) REFERENCES public.alarm(id);


--
-- Name: alarm alarm_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bolzan
--

ALTER TABLE ONLY public.alarm
    ADD CONSTRAINT alarm_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."AspNetRoles"("Id");


--
-- PostgreSQL database dump complete
--

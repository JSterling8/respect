--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5beta1
-- Dumped by pg_dump version 9.5beta1

-- Started on 2016-03-12 20:39:23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE respect;
--
-- TOC entry 2392 (class 1262 OID 26858)
-- Name: respect; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE respect WITH TEMPLATE = template0 ENCODING = 'UTF8';


ALTER DATABASE respect OWNER TO postgres;

\connect respect

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2393 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 234 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2395 (class 0 OID 0)
-- Dependencies: 234
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 26859)
-- Name: assistant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE assistant (
    id integer NOT NULL,
    home_score smallint NOT NULL,
    away_score smallint NOT NULL,
    comment character varying(4095),
    report_id integer NOT NULL
);


ALTER TABLE assistant OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 26865)
-- Name: assistant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE assistant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE assistant_id_seq OWNER TO postgres;

--
-- TOC entry 2396 (class 0 OID 0)
-- Dependencies: 181
-- Name: assistant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE assistant_id_seq OWNED BY assistant.id;


--
-- TOC entry 182 (class 1259 OID 26867)
-- Name: assistant_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE assistant_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE assistant_report_id_seq OWNER TO postgres;

--
-- TOC entry 2397 (class 0 OID 0)
-- Dependencies: 182
-- Name: assistant_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE assistant_report_id_seq OWNED BY assistant.report_id;


--
-- TOC entry 183 (class 1259 OID 26869)
-- Name: ball; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ball (
    id integer NOT NULL,
    provided boolean NOT NULL,
    report_id integer NOT NULL
);


ALTER TABLE ball OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 26872)
-- Name: ball_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ball_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ball_id_seq OWNER TO postgres;

--
-- TOC entry 2398 (class 0 OID 0)
-- Dependencies: 184
-- Name: ball_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ball_id_seq OWNED BY ball.id;


--
-- TOC entry 185 (class 1259 OID 26874)
-- Name: ball_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ball_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ball_report_id_seq OWNER TO postgres;

--
-- TOC entry 2399 (class 0 OID 0)
-- Dependencies: 185
-- Name: ball_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ball_report_id_seq OWNED BY ball.report_id;


--
-- TOC entry 186 (class 1259 OID 26876)
-- Name: captain_armband; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE captain_armband (
    id integer NOT NULL,
    report_id integer NOT NULL,
    home_away_both_neither character varying(255) NOT NULL
);


ALTER TABLE captain_armband OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 26879)
-- Name: captain_armband_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE captain_armband_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE captain_armband_id_seq OWNER TO postgres;

--
-- TOC entry 2400 (class 0 OID 0)
-- Dependencies: 187
-- Name: captain_armband_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE captain_armband_id_seq OWNED BY captain_armband.id;


--
-- TOC entry 188 (class 1259 OID 26881)
-- Name: captain_armband_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE captain_armband_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE captain_armband_report_id_seq OWNER TO postgres;

--
-- TOC entry 2401 (class 0 OID 0)
-- Dependencies: 188
-- Name: captain_armband_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE captain_armband_report_id_seq OWNED BY captain_armband.report_id;


--
-- TOC entry 189 (class 1259 OID 26883)
-- Name: captain_liaison; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE captain_liaison (
    id integer NOT NULL,
    home_score smallint NOT NULL,
    away_score smallint NOT NULL,
    comment character varying(4095),
    report_id integer NOT NULL
);


ALTER TABLE captain_liaison OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 26889)
-- Name: captain_liaison_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE captain_liaison_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE captain_liaison_id_seq OWNER TO postgres;

--
-- TOC entry 2402 (class 0 OID 0)
-- Dependencies: 190
-- Name: captain_liaison_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE captain_liaison_id_seq OWNED BY captain_liaison.id;


--
-- TOC entry 191 (class 1259 OID 26891)
-- Name: captain_liaison_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE captain_liaison_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE captain_liaison_report_id_seq OWNER TO postgres;

--
-- TOC entry 2403 (class 0 OID 0)
-- Dependencies: 191
-- Name: captain_liaison_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE captain_liaison_report_id_seq OWNED BY captain_liaison.report_id;


--
-- TOC entry 192 (class 1259 OID 26893)
-- Name: changing_facility; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE changing_facility (
    id integer NOT NULL,
    report_id integer NOT NULL,
    score smallint NOT NULL,
    comment character varying(4095)
);


ALTER TABLE changing_facility OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 26901)
-- Name: changing_facilitiy_score_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE changing_facilitiy_score_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE changing_facilitiy_score_report_id_seq OWNER TO postgres;

--
-- TOC entry 2404 (class 0 OID 0)
-- Dependencies: 194
-- Name: changing_facilitiy_score_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE changing_facilitiy_score_report_id_seq OWNED BY changing_facility.report_id;


--
-- TOC entry 193 (class 1259 OID 26899)
-- Name: changing_facility_score_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE changing_facility_score_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE changing_facility_score_id_seq OWNER TO postgres;

--
-- TOC entry 2405 (class 0 OID 0)
-- Dependencies: 193
-- Name: changing_facility_score_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE changing_facility_score_id_seq OWNED BY changing_facility.id;


--
-- TOC entry 195 (class 1259 OID 26903)
-- Name: competition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE competition (
    id integer NOT NULL,
    name character varying(255),
    league integer NOT NULL
);


ALTER TABLE competition OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 26906)
-- Name: competition_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE competition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE competition_id_seq OWNER TO postgres;

--
-- TOC entry 2406 (class 0 OID 0)
-- Dependencies: 196
-- Name: competition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE competition_id_seq OWNED BY competition.id;


--
-- TOC entry 197 (class 1259 OID 26908)
-- Name: competition_league_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE competition_league_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE competition_league_seq OWNER TO postgres;

--
-- TOC entry 2407 (class 0 OID 0)
-- Dependencies: 197
-- Name: competition_league_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE competition_league_seq OWNED BY competition.league;


--
-- TOC entry 198 (class 1259 OID 26910)
-- Name: contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE contact (
    id integer NOT NULL,
    yes_no_club character varying(255) NOT NULL,
    report_id integer NOT NULL
);


ALTER TABLE contact OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 26913)
-- Name: contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contact_id_seq OWNER TO postgres;

--
-- TOC entry 2408 (class 0 OID 0)
-- Dependencies: 199
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contact_id_seq OWNED BY contact.id;


--
-- TOC entry 200 (class 1259 OID 26915)
-- Name: contact_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contact_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contact_report_id_seq OWNER TO postgres;

--
-- TOC entry 2409 (class 0 OID 0)
-- Dependencies: 200
-- Name: contact_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contact_report_id_seq OWNED BY contact.report_id;


--
-- TOC entry 201 (class 1259 OID 26917)
-- Name: home_hospitality; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE home_hospitality (
    id integer NOT NULL,
    score smallint NOT NULL,
    report_id integer NOT NULL
);


ALTER TABLE home_hospitality OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 26920)
-- Name: home_hospitality_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE home_hospitality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_hospitality_id_seq OWNER TO postgres;

--
-- TOC entry 2410 (class 0 OID 0)
-- Dependencies: 202
-- Name: home_hospitality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE home_hospitality_id_seq OWNED BY home_hospitality.id;


--
-- TOC entry 203 (class 1259 OID 26922)
-- Name: home_hospitality_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE home_hospitality_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_hospitality_report_id_seq OWNER TO postgres;

--
-- TOC entry 2411 (class 0 OID 0)
-- Dependencies: 203
-- Name: home_hospitality_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE home_hospitality_report_id_seq OWNED BY home_hospitality.report_id;


--
-- TOC entry 204 (class 1259 OID 26924)
-- Name: kick_off; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE kick_off (
    id integer NOT NULL,
    report_id integer NOT NULL,
    late boolean NOT NULL,
    how_late character varying(255),
    fault character varying(255)
);


ALTER TABLE kick_off OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 26930)
-- Name: late_kick_off_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE late_kick_off_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE late_kick_off_id_seq OWNER TO postgres;

--
-- TOC entry 2412 (class 0 OID 0)
-- Dependencies: 205
-- Name: late_kick_off_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE late_kick_off_id_seq OWNED BY kick_off.id;


--
-- TOC entry 206 (class 1259 OID 26932)
-- Name: late_kick_off_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE late_kick_off_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE late_kick_off_report_id_seq OWNER TO postgres;

--
-- TOC entry 2413 (class 0 OID 0)
-- Dependencies: 206
-- Name: late_kick_off_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE late_kick_off_report_id_seq OWNED BY kick_off.report_id;


--
-- TOC entry 207 (class 1259 OID 26934)
-- Name: league; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE league (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE league OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 26937)
-- Name: league_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE league_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE league_id_seq OWNER TO postgres;

--
-- TOC entry 2414 (class 0 OID 0)
-- Dependencies: 208
-- Name: league_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE league_id_seq OWNED BY league.id;


--
-- TOC entry 209 (class 1259 OID 26939)
-- Name: overall_score; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE overall_score (
    id integer NOT NULL,
    report_id integer NOT NULL,
    home_score smallint NOT NULL,
    away_score smallint NOT NULL,
    comment character varying(4095)
);


ALTER TABLE overall_score OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 26942)
-- Name: overall_score_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE overall_score_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE overall_score_id_seq OWNER TO postgres;

--
-- TOC entry 2415 (class 0 OID 0)
-- Dependencies: 210
-- Name: overall_score_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE overall_score_id_seq OWNED BY overall_score.id;


--
-- TOC entry 211 (class 1259 OID 26944)
-- Name: overall_score_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE overall_score_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE overall_score_report_id_seq OWNER TO postgres;

--
-- TOC entry 2416 (class 0 OID 0)
-- Dependencies: 211
-- Name: overall_score_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE overall_score_report_id_seq OWNED BY overall_score.report_id;


--
-- TOC entry 212 (class 1259 OID 26946)
-- Name: referee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE referee (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    level smallint
);


ALTER TABLE referee OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 26952)
-- Name: referee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE referee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE referee_id_seq OWNER TO postgres;

--
-- TOC entry 2417 (class 0 OID 0)
-- Dependencies: 213
-- Name: referee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE referee_id_seq OWNED BY referee.id;


--
-- TOC entry 214 (class 1259 OID 26954)
-- Name: report; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE report (
    id integer NOT NULL,
    match_date date NOT NULL,
    competition integer NOT NULL,
    referee_id integer NOT NULL,
    home_team_id integer NOT NULL,
    away_team_id integer NOT NULL,
    submitted date NOT NULL
);


ALTER TABLE report OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 26957)
-- Name: report_away_team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE report_away_team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE report_away_team_id_seq OWNER TO postgres;

--
-- TOC entry 2418 (class 0 OID 0)
-- Dependencies: 215
-- Name: report_away_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE report_away_team_id_seq OWNED BY report.away_team_id;


--
-- TOC entry 218 (class 1259 OID 26963)
-- Name: report_competition_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE report_competition_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE report_competition_seq OWNER TO postgres;

--
-- TOC entry 2419 (class 0 OID 0)
-- Dependencies: 218
-- Name: report_competition_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE report_competition_seq OWNED BY report.competition;


--
-- TOC entry 216 (class 1259 OID 26959)
-- Name: report_home_team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE report_home_team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE report_home_team_id_seq OWNER TO postgres;

--
-- TOC entry 2420 (class 0 OID 0)
-- Dependencies: 216
-- Name: report_home_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE report_home_team_id_seq OWNED BY report.home_team_id;


--
-- TOC entry 217 (class 1259 OID 26961)
-- Name: report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE report_id_seq OWNER TO postgres;

--
-- TOC entry 2421 (class 0 OID 0)
-- Dependencies: 217
-- Name: report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE report_id_seq OWNED BY report.id;


--
-- TOC entry 219 (class 1259 OID 26965)
-- Name: report_referee_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE report_referee_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE report_referee_seq OWNER TO postgres;

--
-- TOC entry 2422 (class 0 OID 0)
-- Dependencies: 219
-- Name: report_referee_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE report_referee_seq OWNED BY report.referee_id;


--
-- TOC entry 220 (class 1259 OID 26967)
-- Name: shirt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE shirt (
    id integer NOT NULL,
    report_id integer NOT NULL,
    did_wear character varying(255) NOT NULL
);


ALTER TABLE shirt OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 26970)
-- Name: shirt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE shirt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shirt_id_seq OWNER TO postgres;

--
-- TOC entry 2423 (class 0 OID 0)
-- Dependencies: 221
-- Name: shirt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE shirt_id_seq OWNED BY shirt.id;


--
-- TOC entry 222 (class 1259 OID 26972)
-- Name: shirt_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE shirt_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shirt_report_id_seq OWNER TO postgres;

--
-- TOC entry 2424 (class 0 OID 0)
-- Dependencies: 222
-- Name: shirt_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE shirt_report_id_seq OWNED BY shirt.report_id;


--
-- TOC entry 223 (class 1259 OID 26974)
-- Name: spectator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE spectator (
    id integer NOT NULL,
    home_score smallint NOT NULL,
    away_score smallint NOT NULL,
    report_id integer NOT NULL,
    comment character varying(4095)
);


ALTER TABLE spectator OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 26980)
-- Name: spectator_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spectator_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spectator_id_seq OWNER TO postgres;

--
-- TOC entry 2425 (class 0 OID 0)
-- Dependencies: 224
-- Name: spectator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spectator_id_seq OWNED BY spectator.id;


--
-- TOC entry 225 (class 1259 OID 26982)
-- Name: spectator_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spectator_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spectator_report_id_seq OWNER TO postgres;

--
-- TOC entry 2426 (class 0 OID 0)
-- Dependencies: 225
-- Name: spectator_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spectator_report_id_seq OWNED BY spectator.report_id;


--
-- TOC entry 226 (class 1259 OID 26984)
-- Name: team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE team (
    id integer NOT NULL,
    name character varying(255),
    competition integer NOT NULL
);


ALTER TABLE team OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 26987)
-- Name: team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE team_id_seq OWNER TO postgres;

--
-- TOC entry 2427 (class 0 OID 0)
-- Dependencies: 227
-- Name: team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE team_id_seq OWNED BY team.id;


--
-- TOC entry 228 (class 1259 OID 26991)
-- Name: team_sheet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE team_sheet (
    id integer NOT NULL,
    received character varying(255) NOT NULL,
    report_id integer NOT NULL
);


ALTER TABLE team_sheet OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 26994)
-- Name: team_sheet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE team_sheet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE team_sheet_id_seq OWNER TO postgres;

--
-- TOC entry 2428 (class 0 OID 0)
-- Dependencies: 229
-- Name: team_sheet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE team_sheet_id_seq OWNED BY team_sheet.id;


--
-- TOC entry 230 (class 1259 OID 26996)
-- Name: team_sheet_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE team_sheet_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE team_sheet_report_id_seq OWNER TO postgres;

--
-- TOC entry 2429 (class 0 OID 0)
-- Dependencies: 230
-- Name: team_sheet_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE team_sheet_report_id_seq OWNED BY team_sheet.report_id;


--
-- TOC entry 231 (class 1259 OID 26998)
-- Name: use; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE use (
    id integer NOT NULL,
    referee_id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(32767) NOT NULL,
    type character varying(255) NOT NULL,
    created date NOT NULL,
    approved boolean NOT NULL,
    remind boolean NOT NULL,
    validated boolean NOT NULL,
    validation_code character varying(1027)
);


ALTER TABLE use OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 27004)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_id_seq OWNER TO postgres;

--
-- TOC entry 2430 (class 0 OID 0)
-- Dependencies: 232
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_id_seq OWNED BY use.id;


--
-- TOC entry 233 (class 1259 OID 27006)
-- Name: user_referee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_referee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_referee_id_seq OWNER TO postgres;

--
-- TOC entry 2431 (class 0 OID 0)
-- Dependencies: 233
-- Name: user_referee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_referee_id_seq OWNED BY use.referee_id;


--
-- TOC entry 2127 (class 2604 OID 27008)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assistant ALTER COLUMN id SET DEFAULT nextval('assistant_id_seq'::regclass);


--
-- TOC entry 2128 (class 2604 OID 27009)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assistant ALTER COLUMN report_id SET DEFAULT nextval('assistant_report_id_seq'::regclass);


--
-- TOC entry 2129 (class 2604 OID 27010)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ball ALTER COLUMN id SET DEFAULT nextval('ball_id_seq'::regclass);


--
-- TOC entry 2130 (class 2604 OID 27011)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ball ALTER COLUMN report_id SET DEFAULT nextval('ball_report_id_seq'::regclass);


--
-- TOC entry 2131 (class 2604 OID 27012)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY captain_armband ALTER COLUMN id SET DEFAULT nextval('captain_armband_id_seq'::regclass);


--
-- TOC entry 2132 (class 2604 OID 27013)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY captain_armband ALTER COLUMN report_id SET DEFAULT nextval('captain_armband_report_id_seq'::regclass);


--
-- TOC entry 2133 (class 2604 OID 27014)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY captain_liaison ALTER COLUMN id SET DEFAULT nextval('captain_liaison_id_seq'::regclass);


--
-- TOC entry 2134 (class 2604 OID 27015)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY captain_liaison ALTER COLUMN report_id SET DEFAULT nextval('captain_liaison_report_id_seq'::regclass);


--
-- TOC entry 2135 (class 2604 OID 27016)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY changing_facility ALTER COLUMN id SET DEFAULT nextval('changing_facility_score_id_seq'::regclass);


--
-- TOC entry 2136 (class 2604 OID 27017)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY changing_facility ALTER COLUMN report_id SET DEFAULT nextval('changing_facilitiy_score_report_id_seq'::regclass);


--
-- TOC entry 2137 (class 2604 OID 27018)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY competition ALTER COLUMN id SET DEFAULT nextval('competition_id_seq'::regclass);


--
-- TOC entry 2138 (class 2604 OID 27019)
-- Name: league; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY competition ALTER COLUMN league SET DEFAULT nextval('competition_league_seq'::regclass);


--
-- TOC entry 2139 (class 2604 OID 27020)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- TOC entry 2140 (class 2604 OID 27021)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contact ALTER COLUMN report_id SET DEFAULT nextval('contact_report_id_seq'::regclass);


--
-- TOC entry 2141 (class 2604 OID 27022)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY home_hospitality ALTER COLUMN id SET DEFAULT nextval('home_hospitality_id_seq'::regclass);


--
-- TOC entry 2142 (class 2604 OID 27023)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY home_hospitality ALTER COLUMN report_id SET DEFAULT nextval('home_hospitality_report_id_seq'::regclass);


--
-- TOC entry 2143 (class 2604 OID 27024)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kick_off ALTER COLUMN id SET DEFAULT nextval('late_kick_off_id_seq'::regclass);


--
-- TOC entry 2144 (class 2604 OID 27025)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kick_off ALTER COLUMN report_id SET DEFAULT nextval('late_kick_off_report_id_seq'::regclass);


--
-- TOC entry 2145 (class 2604 OID 27026)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY league ALTER COLUMN id SET DEFAULT nextval('league_id_seq'::regclass);


--
-- TOC entry 2146 (class 2604 OID 27027)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY overall_score ALTER COLUMN id SET DEFAULT nextval('overall_score_id_seq'::regclass);


--
-- TOC entry 2147 (class 2604 OID 27028)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY overall_score ALTER COLUMN report_id SET DEFAULT nextval('overall_score_report_id_seq'::regclass);


--
-- TOC entry 2148 (class 2604 OID 27029)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY referee ALTER COLUMN id SET DEFAULT nextval('referee_id_seq'::regclass);


--
-- TOC entry 2149 (class 2604 OID 27030)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY report ALTER COLUMN id SET DEFAULT nextval('report_id_seq'::regclass);


--
-- TOC entry 2150 (class 2604 OID 27031)
-- Name: competition; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY report ALTER COLUMN competition SET DEFAULT nextval('report_competition_seq'::regclass);


--
-- TOC entry 2151 (class 2604 OID 27032)
-- Name: referee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY report ALTER COLUMN referee_id SET DEFAULT nextval('report_referee_seq'::regclass);


--
-- TOC entry 2152 (class 2604 OID 27033)
-- Name: home_team_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY report ALTER COLUMN home_team_id SET DEFAULT nextval('report_home_team_id_seq'::regclass);


--
-- TOC entry 2153 (class 2604 OID 27034)
-- Name: away_team_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY report ALTER COLUMN away_team_id SET DEFAULT nextval('report_away_team_id_seq'::regclass);


--
-- TOC entry 2154 (class 2604 OID 27035)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shirt ALTER COLUMN id SET DEFAULT nextval('shirt_id_seq'::regclass);


--
-- TOC entry 2155 (class 2604 OID 27036)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shirt ALTER COLUMN report_id SET DEFAULT nextval('shirt_report_id_seq'::regclass);


--
-- TOC entry 2156 (class 2604 OID 27037)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spectator ALTER COLUMN id SET DEFAULT nextval('spectator_id_seq'::regclass);


--
-- TOC entry 2157 (class 2604 OID 27038)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spectator ALTER COLUMN report_id SET DEFAULT nextval('spectator_report_id_seq'::regclass);


--
-- TOC entry 2158 (class 2604 OID 27039)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY team ALTER COLUMN id SET DEFAULT nextval('team_id_seq'::regclass);


--
-- TOC entry 2159 (class 2604 OID 27041)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY team_sheet ALTER COLUMN id SET DEFAULT nextval('team_sheet_id_seq'::regclass);


--
-- TOC entry 2160 (class 2604 OID 27042)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY team_sheet ALTER COLUMN report_id SET DEFAULT nextval('team_sheet_report_id_seq'::regclass);


--
-- TOC entry 2161 (class 2604 OID 27043)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY use ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- TOC entry 2162 (class 2604 OID 27044)
-- Name: referee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY use ALTER COLUMN referee_id SET DEFAULT nextval('user_referee_id_seq'::regclass);


--
-- TOC entry 2334 (class 0 OID 26859)
-- Dependencies: 180
-- Data for Name: assistant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY assistant (id, home_score, away_score, comment, report_id) FROM stdin;
1141	10	10	Excellent assistance especially from colne valley. Deserve special note	1143
1142	9	9	\N	1144
1143	7	7	\N	1145
1144	9	9	\N	1146
1145	7	7	\N	1147
1146	6	9	\N	1148
1147	9	10	\N	1149
1148	8	7	\N	1150
1149	10	10	Both very good - unbiased very reliable	1151
1150	9	9	\N	1152
1151	9	9	Honest and Fair.	1153
1152	7	5	away team only ten men, no one to assist.	1154
1153	8	8	\N	1155
1154	6	9	\N	1156
1155	9	9	\N	1157
1156	8	7	\N	1158
1157	8	8	\N	1159
1158	9	9	\N	1160
1159	9	10	\N	1161
1160	7	7	\N	1162
1161	9	9	\N	1163
1162	10	9	\N	1164
1163	9	9	\N	1165
1164	8	8	\N	1166
1165	8	7	\N	1167
1166	10	8	\N	1168
1167	9	9	\N	1169
1168	8	8	\N	1170
1169	9	10	\N	1171
1170	8	8	\N	1172
1171	8	8	\N	1173
1172	8	8	\N	1174
1173	9	9	\N	1175
1174	7	7	\N	1176
1175	6	6	\N	1177
1176	6	5	Flag broken	1178
1177	8	8	Fair and consistent	1179
1178	9	9	\N	1180
1179	8	8	\N	1181
1180	10	10	\N	1182
1181	8	7	\N	1183
1182	10	10	\N	1184
1183	10	10	\N	1185
1184	9	7	\N	1186
1185	9	9	\N	1187
1186	9	9	\N	1188
1187	8	8	\N	1189
1188	8	8	Fair and consistent	1190
1189	9	10	\N	1191
1190	9	9	away side didnt have a man to run the touch. only had 11 players. brill of other team to go and do it. Thanks.	1192
1191	10	10	\N	1193
1192	8	8	\N	1194
1193	7	7	\N	1195
1194	8	7	\N	1196
1195	6	7	\N	1197
1196	7	6	\N	1198
1197	9	7	\N	1199
1198	7	7	\N	1200
1199	10	7	\N	1201
1200	10	10	\N	1202
1201	8	6	\N	1203
1202	8	7	\N	1204
1203	7	6	\N	1205
1204	9	9	\N	1206
1205	8	8	\N	1207
1206	8	8	\N	1208
1207	8	8	\N	1209
1208	10	10	Excellent, honest assistance	1210
1209	6	8	\N	1211
1210	1	6	\N	1212
1211	7	6	\N	1213
1212	10	10	\N	1214
1213	10	10	\N	1215
1214	6	10	\N	1216
1215	10	10	\N	1217
1216	9	9	both gave decisions to best of ability when could see and unbiased	1218
1217	9	9	\N	1219
1218	7	8	\N	1220
1219	10	7	\N	1221
1220	9	9	\N	1222
1221	10	10	\N	1223
1222	7	7	\N	1224
1223	10	6	\N	1225
1224	6	7	\N	1226
1225	9	8	\N	1227
1226	10	10	Excellent neutral assistance	1228
1227	8	7	\N	1229
1228	2	8	After disagreeing with a penalty decision in the first 15 miutes of the game, they placed the flag on the floor and refused to continue in their assistant referee role.	1230
1229	6	8	\N	1231
1230	7	6	\N	1232
1231	5	8	Home club had only 11 players	1233
1232	7	7	\N	1234
1233	10	8	\N	1235
1234	5	8	home team club assistant seemed intent on questioning my decisions than doing the line.	1236
1235	8	8	\N	1237
1236	7	9	\N	1238
1237	9	9	\N	1239
1238	10	10	\N	1240
1239	10	10	\N	1241
1240	9	9	\N	1242
1241	9	8	\N	1243
1242	8	8	\N	1244
1243	2	8	Newsome hardly any help from them - Flag spent more time on the floor	1245
1244	10	10	\N	1246
1245	9	9	\N	1247
1246	10	10	\N	1248
1247	7	7	\N	1249
1248	9	9	\N	1250
1249	10	10	\N	1251
1250	7	7	adequate	1252
1251	10	8	\N	1253
1252	9	10	\N	1254
1253	7	8	\N	1255
1254	8	8	\N	1256
1255	9	9	\N	1257
1256	8	8	\N	1258
1257	9	7	\N	1259
1258	8	8	\N	1260
1259	10	7	\N	1261
1260	9	8	\N	1262
1261	8	8	\N	1263
1262	8	8	\N	1264
1263	8	9	\N	1265
1264	1	8	Home club no ensure assistant referee for all game	1266
1265	6	6	\N	1267
1266	6	7	\N	1268
1267	9	9	\N	1269
1268	7	7	\N	1270
1269	9	10	Both assistants were alert & involved. The home assistant forgat to use his flag at times hence the point deducted	1271
1270	9	8	\N	1272
1271	6	9	\N	1273
1272	9	9	\N	1274
1273	6	8	\N	1275
1274	7	7	\N	1276
1275	6	6	\N	1277
1276	6	6	\N	1278
1277	9	9	\N	1279
1278	8	8	\N	1280
1279	9	9	\N	1281
1280	9	9	\N	1282
1281	9	9	\N	1283
1282	9	10	\N	1284
1283	9	9	\N	1285
1284	8	7	\N	1286
1285	8	9	\N	1287
1286	6	6	\N	1288
1287	7	7	\N	1289
1288	6	9	\N	1290
1289	7	9	\N	1291
1290	9	9	\N	1292
1291	6	6	\N	1293
1292	10	10	\N	1294
1293	7	7	\N	1295
1294	10	10	Both assistants were alert & fully involved	1296
1295	9	9	\N	1297
1296	8	8	\N	1298
1297	9	9	\N	1299
1298	6	6	\N	1300
1299	9	9	\N	1301
1300	7	5	kept having to ask one of them to run the line	1302
1301	9	9	\N	1303
1302	6	6	\N	1304
1303	7	7	\N	1305
1304	7	7	\N	1306
1305	9	7	\N	1307
1306	6	5	Abusive towards own players and myself - red card given	1308
1307	9	8	\N	1309
1308	9	9	its a bonus having reliable help	1310
1309	9	8	\N	1311
1310	9	9	\N	1312
1311	7	8	\N	1313
1312	7	7	\N	1314
1313	9	9	\N	1315
1314	8	8	\N	1316
1315	9	9	\N	1317
1316	9	9	\N	1318
1317	10	10	\N	1319
1318	9	9	\N	1320
1319	7	7	\N	1321
1320	10	10	Both assistants remained impartial & gave correct decisions as they saw it.	1322
1321	10	6	\N	1323
1322	9	9	\N	1324
1323	8	9	\N	1325
1324	8	6	\N	1326
1325	9	9	\N	1327
1326	9	9	Fair and consistent	1328
1327	7	7	\N	1329
1328	10	10	\N	1330
1329	9	9	\N	1331
1330	8	10	The home club assistant was not concentration at times when I needed his assistance when making line judgements	1332
1331	10	9	\N	1333
1332	9	5	Put flag down midway through first half and used his arm only after i over ruled a decision of his	1334
1333	7	9	\N	1335
1334	8	7	\N	1336
1335	9	9	\N	1337
1336	9	9	\N	1338
1337	8	8	\N	1339
1338	9	2	gave the flag to paddock offical i noticed it was on floor asked them to pick it up i then hasd to ask again a bit later 	1340
1339	6	6	\N	1341
1340	9	9	\N	1342
1341	6	6	\N	1343
1342	10	10	\N	1344
1343	9	9	\N	1345
1344	10	10	\N	1346
1345	7	7	\N	1347
1346	9	9	\N	1348
1347	7	6	\N	1349
1348	6	8	\N	1350
1349	9	9	\N	1351
1350	7	6	\N	1352
1351	7	6	\N	1353
1352	8	8	\N	1354
1353	10	10	\N	1355
1354	8	9	\N	1356
1355	6	10	\N	1357
1356	10	10	\N	1358
1357	10	10	\N	1359
1358	10	10	\N	1360
1359	7	10	\N	1361
1360	8	8	\N	1362
1361	9	9	\N	1363
1362	8	9	\N	1364
1363	8	8	\N	1365
1364	8	8	\N	1366
1365	8	8	\N	1367
1366	8	8	\N	1368
1367	7	5	Only eleven players	1369
1368	9	9	\N	1370
1369	8	9	\N	1371
1370	9	8	\N	1372
1371	8	6	\N	1373
1372	6	8	\N	1374
1373	6	8	\N	1375
1374	7	7	\N	1376
1375	10	10	\N	1377
1376	8	8	\N	1378
1377	8	7	\N	1379
1378	7	6	\N	1380
1379	8	9	\N	1381
1380	10	9	\N	1382
1381	8	8	\N	1383
1382	6	6	\N	1384
1383	7	8	\N	1385
1384	9	9	\N	1386
1385	8	8	\N	1387
1386	8	9	\N	1388
1387	9	9	\N	1389
1388	7	7	\N	1390
1389	8	8	\N	1391
1390	10	9	\N	1392
1391	6	7	\N	1393
1392	10	10	\N	1394
1393	10	10	\N	1395
1394	7	9	\N	1396
1395	10	9	\N	1397
1396	8	8	\N	1398
1397	10	10	\N	1399
1398	7	6	\N	1400
1399	7	8	\N	1401
1400	9	9	Both fair gowever Away team tried to give offsides (had a quiet word)	1402
1401	9	9	\N	1403
1402	10	10	No complaints from assistants	1404
1403	9	9	\N	1405
1404	7	7	\N	1406
1405	7	7	\N	1407
1406	1	1	away as above, flag spent more time on ground i told them to pick it up they did for about 10 mins.	1408
1407	8	8	\N	1409
1408	9	9	\N	1410
1409	9	9	\N	1411
1410	7	7	\N	1412
1411	8	8	Fair	1413
1412	9	9	\N	1414
1413	10	10	\N	1415
1414	6	6	\N	1416
1415	8	8	\N	1417
1416	8	2	Away club stopped 20 mins into game	1418
1417	10	9	Well done to the home assistant who was excellent throughout	1419
1418	8	8	\N	1420
1419	9	9	\N	1421
1420	6	6	\N	1422
1421	8	7	\N	1423
1422	9	9	\N	1424
1423	8	7	\N	1425
1424	9	9	\N	1426
1425	8	5	\N	1427
1426	9	8	\N	1428
1427	10	10	\N	1429
1428	8	7	\N	1430
1429	9	9	\N	1431
1430	8	8	\N	1432
1431	7	8	\N	1433
1432	9	9	\N	1434
1433	6	6	\N	1435
1434	6	7	\N	1436
1435	6	7	\N	1437
1436	6	6	\N	1438
1437	8	8	both were very fair 	1439
1438	8	9	\N	1440
1439	9	9	its always better when both clubs provide assistants who do a good job 	1441
1440	8	8	\N	1442
1441	7	7	\N	1443
1442	9	8	\N	1444
1443	6	8	\N	1445
1444	9	9	\N	1446
1445	9	9	\N	1447
1446	10	9	\N	1448
1447	9	9	\N	1449
1448	8	8	\N	1450
1449	9	9	\N	1451
1450	9	9	\N	1452
1451	9	8	\N	1453
1452	7	8	\N	1454
1453	6	6	\N	1455
1454	6	6	\N	1456
1455	10	10	\N	1457
1456	7	9	\N	1458
1457	10	7	\N	1459
1458	7	7	\N	1460
1459	10	10	Both club assistants were helpful & involved	1461
1460	6	6	\N	1462
1461	8	8	\N	1463
1462	10	7	\N	1464
1463	7	6	\N	1465
1464	9	9	\N	1466
1465	8	8	\N	1467
1466	9	9	\N	1468
1467	10	10	\N	1469
1468	8	8	\N	1470
1469	7	7	\N	1471
1470	7	7	\N	1472
1471	8	8	\N	1473
1472	7	7	\N	1474
1473	8	10	\N	1475
1474	7	7	\N	1476
1475	10	10	good assistance from both lines	1477
1476	9	8	\N	1478
1477	8	8	\N	1479
1478	10	10	\N	1480
1479	9	9	\N	1481
1480	8	9	\N	1482
1481	9	7	\N	1483
1482	6	6	\N	1484
1483	10	8	\N	1485
1484	7	8	\N	1486
1485	8	5	\N	1487
1486	7	7	\N	1488
1487	8	8	\N	1489
1488	7	1	assistant not provided by away team	1490
1489	7	7	\N	1491
1490	8	7	\N	1492
1491	8	8	\N	1493
1492	9	9	\N	1494
1493	8	7	\N	1495
1494	7	7	\N	1496
1495	7	8	\N	1497
1496	9	9	\N	1498
1497	9	10	\N	1499
1498	8	8	\N	1500
1499	9	9	\N	1501
1500	10	10	\N	1502
1501	7	7	\N	1503
1502	6	8	\N	1504
1503	7	7	\N	1505
1504	6	7	\N	1506
1505	7	7	\N	1507
1506	6	6	\N	1508
1507	7	7	\N	1509
1508	8	8	\N	1510
1509	6	9	\N	1511
1510	8	8	\N	1512
1511	8	8	\N	1513
1512	9	9	\N	1514
1513	7	7	\N	1515
1514	10	10	\N	1516
1515	7	7	\N	1517
1516	8	6	\N	1518
1517	9	9	\N	1519
1518	9	10	\N	1520
1519	7	7	\N	1521
1520	9	8	\N	1522
1521	10	10	\N	1523
1522	9	9	\N	1524
1523	9	9	\N	1525
1524	10	10	\N	1526
1525	9	9	\N	1527
1526	7	9	\N	1528
1527	10	10	\N	1529
1528	9	9	\N	1530
1529	7	7	\N	1531
1530	7	9	At times I was getting no assistance fromm the home assistant	1532
1531	9	5	noone to run line	1533
1532	8	8	\N	1534
1533	8	5	Foul language	1535
1534	7	9	\N	1536
1535	9	9	\N	1537
1536	9	9	\N	1538
1537	8	8	\N	1539
1538	7	7	\N	1540
1539	10	10	\N	1541
1540	9	9	\N	1542
1541	9	9	\N	1543
1542	10	10	Both assistants were excellent	1544
1543	9	9	\N	1545
1544	8	8	\N	1546
1545	8	7	\N	1547
1546	9	9	\N	1548
1547	9	8	\N	1549
1548	10	10	\N	1550
1549	9	10	\N	1551
1550	9	10	\N	1552
1551	8	8	\N	1553
1552	7	10	\N	1554
1553	8	8	Both assistants failed to raise their flags for throw ins with no signals at all at times	1555
1554	9	9	\N	1556
1555	10	9	\N	1557
1556	8	8	\N	1558
1557	8	8	\N	1559
1558	7	8	\N	1560
1559	9	9	\N	1561
1560	8	8	\N	1562
1561	10	10	\N	1563
1562	10	9	\N	1564
1563	7	7	\N	1565
1564	6	6	\N	1566
1565	9	9	neil moorhouse and peter jackson were able to assist	1567
1566	1	8	Noone there to do club assistant 	1568
1567	8	8	\N	1569
1568	10	10	\N	1570
1569	9	9	\N	1571
1570	8	8	\N	1572
1571	7	9	\N	1573
1572	10	9	\N	1574
1573	9	9	Honest and Fair.	1575
1574	8	8	\N	1576
1575	8	8	\N	1577
1576	7	7	\N	1578
1577	8	7	\N	1579
1578	6	7	\N	1580
1579	8	1	Again Shelley assistant mirrored the spectators on the touch line and at one point when I awarded a free kick to the opposing team he threw my flag onto the playing field in am aggressive manner. I then relieved him of his duties.	1581
1580	10	10	\N	1582
1581	6	8	\N	1583
1582	10	10	Nomproblems	1584
1583	8	8	\N	1585
1584	9	9	\N	1586
1585	9	9	\N	1587
1586	7	7	\N	1588
1587	10	10	\N	1589
1588	3	9	Home decided not to do the job after 60 minutes or so becuase things werent going his sides way.	1590
1589	8	8	\N	1591
1590	10	10	\N	1592
1591	6	7	\N	1593
1592	6	7	\N	1594
1593	9	10	\N	1595
1594	9	9	\N	1596
1595	9	9	\N	1597
1596	9	10	\N	1598
1597	10	10	\N	1599
1598	9	9	\N	1600
1599	7	6	\N	1601
1600	7	8	\N	1602
1601	8	8	\N	1603
1602	8	8	\N	1604
1603	7	7	\N	1605
1604	9	9	\N	1606
1605	9	8	\N	1607
1606	8	8	\N	1608
1607	9	6	\N	1609
1608	9	9	\N	1610
1609	9	9	\N	1611
1610	9	9	\N	1612
1611	10	10	\N	1613
1612	8	7	\N	1614
1613	10	10	\N	1615
1614	7	6	\N	1616
1615	8	6	\N	1617
1616	9	9	\N	1618
1617	9	9	\N	1619
1618	9	9	\N	1620
1619	9	9	\N	1621
1620	8	10	\N	1622
1621	7	6	\N	1623
1622	6	6	\N	1624
1623	9	9	\N	1625
1624	8	8	\N	1626
1625	10	10	\N	1627
1626	9	9	\N	1628
1627	9	9	\N	1629
1628	6	6	\N	1630
1629	6	8	\N	1631
1630	10	10	\N	1632
1631	7	7	\N	1633
1632	9	8	\N	1634
1633	9	10	\N	1635
1634	9	9	\N	1636
1635	9	9	\N	1637
1636	9	8	\N	1638
1637	7	7	\N	1639
1638	9	9	\N	1640
1639	9	9	\N	1641
1640	7	3	Disputing decisions and coaching	1642
1641	8	10	Netherton very sporting both ways.	1643
1642	9	8	\N	1644
1643	8	8	\N	1645
1644	9	8	\N	1646
1645	7	7	\N	1647
1646	6	7	\N	1648
1647	9	9	\N	1649
1648	10	9	\N	1650
1649	9	9	\N	1651
1650	7	7	\N	1652
1651	6	7	\N	1653
1652	5	9	Home club gave up halfway through match until reminded 	1654
1653	10	10	Good help from both assistants	1655
1654	9	9	\N	1656
1655	8	7	\N	1657
1656	10	10	\N	1658
1657	10	10	\N	1659
1658	10	8	\N	1660
1659	9	9	\N	1661
1660	7	4	\N	1662
1661	8	10	\N	1663
1662	9	9	\N	1664
1663	9	9	\N	1665
1664	9	9	\N	1666
1665	9	10	\N	1667
1666	8	7	\N	1668
1667	8	8	\N	1669
1668	7	9	\N	1670
1669	8	6	\N	1671
1670	9	9	\N	1672
1671	9	9	\N	1673
1672	9	9	\N	1674
1673	9	9	\N	1675
1674	8	8	\N	1676
1675	7	7	\N	1677
1676	9	9	\N	1678
1677	6	7	\N	1679
1678	9	9	Away team supplied both assistants and did a good job	1680
1679	7	7	\N	1681
1680	10	10	\N	1682
1681	8	8	\N	1683
1682	1	1	i had no assistants please see extra general comments below	1684
1683	7	5	\N	1685
1684	8	8	No issues.	1686
1685	5	7	During the match the flag was given to a little girl to hold	1687
1686	8	8	\N	1688
1687	9	8	\N	1689
1688	10	10	\N	1690
1689	9	9	\N	1691
1690	8	8	\N	1692
1691	8	8	\N	1693
1692	9	9	\N	1694
1693	10	10	Both fair and trustworthy	1695
1694	8	8	\N	1696
1695	8	6	\N	1697
1696	7	7	\N	1698
1697	8	9	\N	1699
1698	8	8	\N	1700
1699	9	9	\N	1701
1700	7	9	\N	1702
1701	10	10	\N	1703
1702	6	8	\N	1704
1703	6	6	\N	1705
1704	9	9	\N	1706
1705	10	10	\N	1707
1706	9	9	\N	1708
\.


--
-- TOC entry 2432 (class 0 OID 0)
-- Dependencies: 181
-- Name: assistant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('assistant_id_seq', 1706, true);


--
-- TOC entry 2433 (class 0 OID 0)
-- Dependencies: 182
-- Name: assistant_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('assistant_report_id_seq', 1, false);


--
-- TOC entry 2337 (class 0 OID 26869)
-- Dependencies: 183
-- Data for Name: ball; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ball (id, provided, report_id) FROM stdin;
1141	t	1143
1142	t	1144
1143	t	1145
1144	t	1146
1145	t	1147
1146	t	1148
1147	t	1149
1148	t	1150
1149	t	1151
1150	t	1152
1151	t	1153
1152	t	1154
1153	t	1155
1154	t	1156
1155	t	1157
1156	t	1158
1157	t	1159
1158	t	1160
1159	t	1161
1160	t	1162
1161	t	1163
1162	t	1164
1163	t	1165
1164	t	1166
1165	t	1167
1166	t	1168
1167	t	1169
1168	t	1170
1169	t	1171
1170	t	1172
1171	t	1173
1172	t	1174
1173	t	1175
1174	t	1176
1175	t	1177
1176	t	1178
1177	t	1179
1178	t	1180
1179	t	1181
1180	t	1182
1181	t	1183
1182	t	1184
1183	t	1185
1184	t	1186
1185	t	1187
1186	t	1188
1187	t	1189
1188	t	1190
1189	t	1191
1190	t	1192
1191	t	1193
1192	t	1194
1193	t	1195
1194	t	1196
1195	t	1197
1196	t	1198
1197	t	1199
1198	t	1200
1199	t	1201
1200	t	1202
1201	t	1203
1202	t	1204
1203	t	1205
1204	t	1206
1205	t	1207
1206	t	1208
1207	t	1209
1208	t	1210
1209	t	1211
1210	t	1212
1211	t	1213
1212	t	1214
1213	t	1215
1214	t	1216
1215	t	1217
1216	t	1218
1217	t	1219
1218	t	1220
1219	t	1221
1220	t	1222
1221	t	1223
1222	t	1224
1223	t	1225
1224	t	1226
1225	t	1227
1226	t	1228
1227	t	1229
1228	t	1230
1229	t	1231
1230	t	1232
1231	t	1233
1232	t	1234
1233	t	1235
1234	t	1236
1235	t	1237
1236	t	1238
1237	t	1239
1238	t	1240
1239	t	1241
1240	t	1242
1241	t	1243
1242	t	1244
1243	t	1245
1244	t	1246
1245	t	1247
1246	t	1248
1247	t	1249
1248	t	1250
1249	t	1251
1250	t	1252
1251	t	1253
1252	t	1254
1253	t	1255
1254	t	1256
1255	t	1257
1256	t	1258
1257	t	1259
1258	t	1260
1259	t	1261
1260	t	1262
1261	t	1263
1262	t	1264
1263	t	1265
1264	t	1266
1265	t	1267
1266	t	1268
1267	t	1269
1268	t	1270
1269	t	1271
1270	t	1272
1271	t	1273
1272	t	1274
1273	t	1275
1274	t	1276
1275	t	1277
1276	t	1278
1277	t	1279
1278	t	1280
1279	t	1281
1280	t	1282
1281	t	1283
1282	t	1284
1283	t	1285
1284	t	1286
1285	t	1287
1286	t	1288
1287	t	1289
1288	t	1290
1289	t	1291
1290	t	1292
1291	t	1293
1292	t	1294
1293	t	1295
1294	t	1296
1295	t	1297
1296	t	1298
1297	t	1299
1298	t	1300
1299	t	1301
1300	t	1302
1301	t	1303
1302	t	1304
1303	t	1305
1304	t	1306
1305	t	1307
1306	t	1308
1307	t	1309
1308	t	1310
1309	t	1311
1310	t	1312
1311	t	1313
1312	t	1314
1313	t	1315
1314	t	1316
1315	t	1317
1316	t	1318
1317	t	1319
1318	t	1320
1319	t	1321
1320	t	1322
1321	t	1323
1322	t	1324
1323	t	1325
1324	t	1326
1325	t	1327
1326	t	1328
1327	t	1329
1328	t	1330
1329	t	1331
1330	t	1332
1331	t	1333
1332	t	1334
1333	t	1335
1334	t	1336
1335	t	1337
1336	t	1338
1337	t	1339
1338	t	1340
1339	t	1341
1340	t	1342
1341	t	1343
1342	t	1344
1343	t	1345
1344	t	1346
1345	t	1347
1346	t	1348
1347	t	1349
1348	t	1350
1349	t	1351
1350	t	1352
1351	t	1353
1352	t	1354
1353	t	1355
1354	t	1356
1355	t	1357
1356	f	1358
1357	t	1359
1358	t	1360
1359	t	1361
1360	t	1362
1361	t	1363
1362	t	1364
1363	t	1365
1364	t	1366
1365	t	1367
1366	t	1368
1367	t	1369
1368	t	1370
1369	t	1371
1370	t	1372
1371	t	1373
1372	t	1374
1373	t	1375
1374	t	1376
1375	t	1377
1376	t	1378
1377	t	1379
1378	t	1380
1379	t	1381
1380	t	1382
1381	t	1383
1382	t	1384
1383	t	1385
1384	t	1386
1385	t	1387
1386	t	1388
1387	t	1389
1388	t	1390
1389	t	1391
1390	t	1392
1391	t	1393
1392	t	1394
1393	t	1395
1394	t	1396
1395	t	1397
1396	t	1398
1397	t	1399
1398	t	1400
1399	t	1401
1400	t	1402
1401	t	1403
1402	t	1404
1403	t	1405
1404	t	1406
1405	t	1407
1406	t	1408
1407	t	1409
1408	t	1410
1409	t	1411
1410	t	1412
1411	t	1413
1412	t	1414
1413	t	1415
1414	t	1416
1415	t	1417
1416	t	1418
1417	t	1419
1418	t	1420
1419	t	1421
1420	t	1422
1421	t	1423
1422	t	1424
1423	t	1425
1424	t	1426
1425	t	1427
1426	t	1428
1427	t	1429
1428	t	1430
1429	t	1431
1430	t	1432
1431	t	1433
1432	t	1434
1433	t	1435
1434	t	1436
1435	t	1437
1436	t	1438
1437	t	1439
1438	t	1440
1439	t	1441
1440	t	1442
1441	t	1443
1442	t	1444
1443	t	1445
1444	t	1446
1445	t	1447
1446	t	1448
1447	t	1449
1448	t	1450
1449	t	1451
1450	t	1452
1451	t	1453
1452	t	1454
1453	t	1455
1454	t	1456
1455	t	1457
1456	t	1458
1457	t	1459
1458	t	1460
1459	t	1461
1460	t	1462
1461	t	1463
1462	t	1464
1463	t	1465
1464	t	1466
1465	t	1467
1466	t	1468
1467	t	1469
1468	t	1470
1469	t	1471
1470	t	1472
1471	t	1473
1472	t	1474
1473	t	1475
1474	t	1476
1475	t	1477
1476	t	1478
1477	t	1479
1478	t	1480
1479	t	1481
1480	t	1482
1481	t	1483
1482	t	1484
1483	t	1485
1484	t	1486
1485	t	1487
1486	t	1488
1487	t	1489
1488	t	1490
1489	t	1491
1490	t	1492
1491	t	1493
1492	t	1494
1493	t	1495
1494	t	1496
1495	t	1497
1496	t	1498
1497	t	1499
1498	t	1500
1499	t	1501
1500	t	1502
1501	t	1503
1502	t	1504
1503	t	1505
1504	t	1506
1505	t	1507
1506	t	1508
1507	t	1509
1508	t	1510
1509	t	1511
1510	t	1512
1511	t	1513
1512	t	1514
1513	t	1515
1514	t	1516
1515	t	1517
1516	t	1518
1517	t	1519
1518	t	1520
1519	t	1521
1520	t	1522
1521	t	1523
1522	t	1524
1523	t	1525
1524	t	1526
1525	t	1527
1526	t	1528
1527	t	1529
1528	t	1530
1529	t	1531
1530	t	1532
1531	t	1533
1532	t	1534
1533	t	1535
1534	t	1536
1535	t	1537
1536	t	1538
1537	t	1539
1538	t	1540
1539	t	1541
1540	t	1542
1541	t	1543
1542	t	1544
1543	t	1545
1544	t	1546
1545	t	1547
1546	t	1548
1547	t	1549
1548	t	1550
1549	t	1551
1550	t	1552
1551	t	1553
1552	t	1554
1553	t	1555
1554	t	1556
1555	t	1557
1556	t	1558
1557	t	1559
1558	t	1560
1559	t	1561
1560	t	1562
1561	t	1563
1562	t	1564
1563	t	1565
1564	t	1566
1565	t	1567
1566	t	1568
1567	t	1569
1568	t	1570
1569	t	1571
1570	t	1572
1571	t	1573
1572	t	1574
1573	t	1575
1574	t	1576
1575	t	1577
1576	t	1578
1577	t	1579
1578	t	1580
1579	t	1581
1580	t	1582
1581	t	1583
1582	t	1584
1583	t	1585
1584	t	1586
1585	t	1587
1586	t	1588
1587	t	1589
1588	t	1590
1589	t	1591
1590	t	1592
1591	t	1593
1592	t	1594
1593	t	1595
1594	t	1596
1595	t	1597
1596	t	1598
1597	t	1599
1598	t	1600
1599	t	1601
1600	t	1602
1601	t	1603
1602	t	1604
1603	t	1605
1604	t	1606
1605	t	1607
1606	t	1608
1607	t	1609
1608	t	1610
1609	t	1611
1610	t	1612
1611	f	1613
1612	t	1614
1613	t	1615
1614	t	1616
1615	t	1617
1616	t	1618
1617	t	1619
1618	t	1620
1619	t	1621
1620	t	1622
1621	f	1623
1622	t	1624
1623	t	1625
1624	t	1626
1625	t	1627
1626	t	1628
1627	t	1629
1628	t	1630
1629	t	1631
1630	t	1632
1631	t	1633
1632	t	1634
1633	t	1635
1634	t	1636
1635	t	1637
1636	t	1638
1637	t	1639
1638	t	1640
1639	t	1641
1640	t	1642
1641	t	1643
1642	t	1644
1643	t	1645
1644	t	1646
1645	t	1647
1646	t	1648
1647	t	1649
1648	t	1650
1649	t	1651
1650	t	1652
1651	t	1653
1652	t	1654
1653	t	1655
1654	t	1656
1655	t	1657
1656	t	1658
1657	t	1659
1658	t	1660
1659	t	1661
1660	t	1662
1661	t	1663
1662	t	1664
1663	t	1665
1664	t	1666
1665	t	1667
1666	t	1668
1667	t	1669
1668	t	1670
1669	t	1671
1670	t	1672
1671	t	1673
1672	t	1674
1673	t	1675
1674	t	1676
1675	t	1677
1676	t	1678
1677	t	1679
1678	t	1680
1679	t	1681
1680	t	1682
1681	t	1683
1682	t	1684
1683	t	1685
1684	t	1686
1685	t	1687
1686	t	1688
1687	t	1689
1688	t	1690
1689	t	1691
1690	t	1692
1691	t	1693
1692	t	1694
1693	t	1695
1694	t	1696
1695	t	1697
1696	t	1698
1697	t	1699
1698	t	1700
1699	t	1701
1700	t	1702
1701	t	1703
1702	t	1704
1703	t	1705
1704	t	1706
1705	f	1707
1706	t	1708
\.


--
-- TOC entry 2434 (class 0 OID 0)
-- Dependencies: 184
-- Name: ball_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ball_id_seq', 1706, true);


--
-- TOC entry 2435 (class 0 OID 0)
-- Dependencies: 185
-- Name: ball_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ball_report_id_seq', 1, false);


--
-- TOC entry 2340 (class 0 OID 26876)
-- Dependencies: 186
-- Data for Name: captain_armband; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY captain_armband (id, report_id, home_away_both_neither) FROM stdin;
1350	1143	Both
1351	1144	Both
1352	1145	Both
1353	1146	Away
1354	1147	Both
1355	1148	Both
1356	1149	Both
1357	1150	Home
1358	1151	Both
1359	1152	Both
1360	1153	Both
1361	1154	Home
1362	1155	Both
1363	1156	Both
1364	1157	Both
1365	1158	Both
1366	1159	Home
1367	1160	Both
1368	1161	Both
1369	1162	Home
1370	1163	Away
1371	1164	Both
1372	1165	Both
1373	1166	Both
1374	1167	Both
1375	1168	Both
1376	1169	Both
1377	1170	Both
1378	1171	Both
1379	1172	Both
1380	1173	Both
1381	1174	Both
1382	1175	Both
1383	1176	Both
1384	1177	Both
1385	1178	Both
1386	1179	Away
1387	1180	Both
1388	1181	Both
1389	1182	Both
1390	1183	Both
1391	1184	Both
1392	1185	Both
1393	1186	Both
1394	1187	Both
1395	1188	Both
1396	1189	Both
1397	1190	Away
1398	1191	Neither
1399	1192	Both
1400	1193	Home
1401	1194	Home
1402	1195	Both
1403	1196	Both
1404	1197	Home
1405	1198	Home
1406	1199	Both
1407	1200	Both
1408	1201	Home
1409	1202	Both
1410	1203	Both
1411	1204	Both
1412	1205	Both
1413	1206	Home
1414	1207	Both
1415	1208	Both
1416	1209	Both
1417	1210	Both
1418	1211	Both
1419	1212	Both
1420	1213	Both
1421	1214	Both
1422	1215	Both
1423	1216	Both
1424	1217	Both
1425	1218	Both
1426	1219	Both
1427	1220	Both
1428	1221	Both
1429	1222	Both
1430	1223	Both
1431	1224	Away
1432	1225	Home
1433	1226	Both
1434	1227	Both
1435	1228	Both
1436	1229	Both
1437	1230	Both
1438	1231	Both
1439	1232	Both
1440	1233	Both
1441	1234	Home
1442	1235	Both
1443	1236	Both
1444	1237	Away
1445	1238	Both
1446	1239	Both
1447	1240	Both
1448	1241	Both
1449	1242	Both
1450	1243	Both
1451	1244	Both
1452	1245	Both
1453	1246	Both
1454	1247	Both
1455	1248	Both
1456	1249	Both
1457	1250	Both
1458	1251	Both
1459	1252	Both
1460	1253	Both
1461	1254	Both
1462	1255	Both
1463	1256	Both
1464	1257	Both
1465	1258	Both
1466	1259	Both
1467	1260	Home
1468	1261	Both
1469	1262	Both
1470	1263	Both
1471	1264	Both
1472	1265	Both
1473	1266	Both
1474	1267	Both
1475	1268	Both
1476	1269	Both
1477	1270	Away
1478	1271	Both
1479	1272	Both
1480	1273	Both
1481	1274	Both
1482	1275	Both
1483	1276	Both
1484	1277	Both
1485	1278	Away
1486	1279	Both
1487	1280	Both
1488	1281	Both
1489	1282	Away
1490	1283	Both
1491	1284	Both
1492	1285	Both
1493	1286	Both
1494	1287	Both
1495	1288	Both
1496	1289	Both
1497	1290	Home
1498	1291	Both
1499	1292	Both
1500	1293	Both
1501	1294	Both
1502	1295	Both
1503	1296	Both
1504	1297	Both
1505	1298	Both
1506	1299	Both
1507	1300	Both
1508	1301	Both
1509	1302	Both
1510	1303	Both
1511	1304	Both
1512	1305	Both
1513	1306	Both
1514	1307	Both
1515	1308	Both
1516	1309	Both
1517	1310	Both
1518	1311	Home
1519	1312	Both
1520	1313	Both
1521	1314	Home
1522	1315	Both
1523	1316	Both
1524	1317	Both
1525	1318	Both
1526	1319	Both
1527	1320	Both
1528	1321	Away
1529	1322	Both
1530	1323	Both
1531	1324	Both
1532	1325	Both
1533	1326	Both
1534	1327	Both
1535	1328	Both
1536	1329	Both
1537	1330	Both
1538	1331	Both
1539	1332	Both
1540	1333	Both
1541	1334	Both
1542	1335	Both
1543	1336	Both
1544	1337	Both
1545	1338	Both
1546	1339	Neither
1547	1340	Both
1548	1341	Both
1549	1342	Both
1550	1343	Both
1551	1344	Home
1552	1345	Both
1553	1346	Away
1554	1347	Both
1555	1348	Both
1556	1349	Both
1557	1350	Both
1558	1351	Both
1559	1352	Both
1560	1353	Both
1561	1354	Away
1562	1355	Both
1563	1356	Both
1564	1357	Both
1565	1358	Both
1566	1359	Both
1567	1360	Both
1568	1361	Both
1569	1362	Both
1570	1363	Both
1571	1364	Both
1572	1365	Both
1573	1366	Both
1574	1367	Both
1575	1368	Both
1576	1369	Both
1577	1370	Both
1578	1371	Both
1579	1372	Both
1580	1373	Both
1581	1374	Both
1582	1375	Home
1583	1376	Both
1584	1377	Both
1585	1378	Both
1586	1379	Both
1587	1380	Both
1588	1381	Both
1589	1382	Both
1590	1383	Both
1591	1384	Both
1592	1385	Both
1593	1386	Both
1594	1387	Both
1595	1388	Both
1596	1389	Both
1597	1390	Both
1598	1391	Both
1599	1392	Both
1600	1393	Both
1601	1394	Both
1602	1395	Neither
1603	1396	Both
1604	1397	Both
1605	1398	Both
1606	1399	Both
1607	1400	Both
1608	1401	Both
1609	1402	Both
1610	1403	Both
1611	1404	Both
1612	1405	Both
1613	1406	Both
1614	1407	Both
1615	1408	Away
1616	1409	Both
1617	1410	Both
1618	1411	Both
1619	1412	Both
1620	1413	Both
1621	1414	Both
1622	1415	Both
1623	1416	Both
1624	1417	Both
1625	1418	Both
1626	1419	Both
1627	1420	Both
1628	1421	Neither
1629	1422	Both
1630	1423	Both
1631	1424	Both
1632	1425	Both
1633	1426	Both
1634	1427	Home
1635	1428	Both
1636	1429	Both
1637	1430	Both
1638	1431	Both
1639	1432	Both
1640	1433	Both
1641	1434	Both
1642	1435	Both
1643	1436	Both
1644	1437	Both
1645	1438	Both
1646	1439	Both
1647	1440	Both
1648	1441	Both
1649	1442	Both
1650	1443	Away
1651	1444	Both
1652	1445	Both
1653	1446	Both
1654	1447	Both
1655	1448	Both
1656	1449	Both
1657	1450	Both
1658	1451	Both
1659	1452	Both
1660	1453	Both
1661	1454	Both
1662	1455	Home
1663	1456	Both
1664	1457	Both
1665	1458	Both
1666	1459	Both
1667	1460	Both
1668	1461	Both
1669	1462	Both
1670	1463	Both
1671	1464	Both
1672	1465	Both
1673	1466	Both
1674	1467	Home
1675	1468	Both
1676	1469	Both
1677	1470	Both
1678	1471	Both
1679	1472	Both
1680	1473	Both
1681	1474	Away
1682	1475	Both
1683	1476	Home
1684	1477	Both
1685	1478	Both
1686	1479	Both
1687	1480	Both
1688	1481	Both
1689	1482	Both
1690	1483	Both
1691	1484	Both
1692	1485	Both
1693	1486	Both
1694	1487	Both
1695	1488	Home
1696	1489	Both
1697	1490	Both
1698	1491	Away
1699	1492	Both
1700	1493	Both
1701	1494	Both
1702	1495	Both
1703	1496	Both
1704	1497	Both
1705	1498	Both
1706	1499	Both
1707	1500	Both
1708	1501	Both
1709	1502	Both
1710	1503	Both
1711	1504	Both
1712	1505	Both
1713	1506	Both
1714	1507	Both
1715	1508	Both
1716	1509	Both
1717	1510	Both
1718	1511	Both
1719	1512	Both
1720	1513	Both
1721	1514	Both
1722	1515	Home
1723	1516	Both
1724	1517	Both
1725	1518	Both
1726	1519	Both
1727	1520	Both
1728	1521	Home
1729	1522	Both
1730	1523	Home
1731	1524	Both
1732	1525	Both
1733	1526	Both
1734	1527	Both
1735	1528	Both
1736	1529	Both
1737	1530	Both
1738	1531	Both
1739	1532	Both
1740	1533	Both
1741	1534	Both
1742	1535	Both
1743	1536	Both
1744	1537	Both
1745	1538	Both
1746	1539	Both
1747	1540	Both
1748	1541	Both
1749	1542	Both
1750	1543	Both
1751	1544	Both
1752	1545	Both
1753	1546	Both
1754	1547	Both
1755	1548	Both
1756	1549	Both
1757	1550	Both
1758	1551	Both
1759	1552	Both
1760	1553	Both
1761	1554	Both
1762	1555	Both
1763	1556	Both
1764	1557	Both
1765	1558	Both
1766	1559	Both
1767	1560	Away
1768	1561	Both
1769	1562	Both
1770	1563	Neither
1771	1564	Both
1772	1565	Both
1773	1566	Both
1774	1567	Both
1775	1568	Both
1776	1569	Both
1777	1570	Both
1778	1571	Both
1779	1572	Both
1780	1573	Both
1781	1574	Both
1782	1575	Both
1783	1576	Both
1784	1577	Both
1785	1578	Both
1786	1579	Both
1787	1580	Both
1788	1581	Both
1789	1582	Both
1790	1583	Both
1791	1584	Home
1792	1585	Both
1793	1586	Both
1794	1587	Both
1795	1588	Both
1796	1589	Both
1797	1590	Both
1798	1591	Neither
1799	1592	Both
1800	1593	Both
1801	1594	Both
1802	1595	Both
1803	1596	Both
1804	1597	Both
1805	1598	Both
1806	1599	Both
1807	1600	Both
1808	1601	Away
1809	1602	Both
1810	1603	Both
1811	1604	Both
1812	1605	Both
1813	1606	Both
1814	1607	Both
1815	1608	Both
1816	1609	Both
1817	1610	Both
1818	1611	Both
1819	1612	Both
1820	1613	Neither
1821	1614	Both
1822	1615	Both
1823	1616	Both
1824	1617	Both
1825	1618	Both
1826	1619	Both
1827	1620	Both
1828	1621	Both
1829	1622	Home
1830	1623	Both
1831	1624	Both
1832	1625	Both
1833	1626	Both
1834	1627	Both
1835	1628	Neither
1836	1629	Both
1837	1630	Both
1838	1631	Home
1839	1632	Both
1840	1633	Both
1841	1634	Both
1842	1635	Both
1843	1636	Both
1844	1637	Both
1845	1638	Both
1846	1639	Both
1847	1640	Both
1848	1641	Both
1849	1642	Both
1850	1643	Both
1851	1644	Both
1852	1645	Both
1853	1646	Both
1854	1647	Both
1855	1648	Both
1856	1649	Home
1857	1650	Both
1858	1651	Both
1859	1652	Both
1860	1653	Both
1861	1654	Home
1862	1655	Both
1863	1656	Both
1864	1657	Both
1865	1658	Both
1866	1659	Both
1867	1660	Both
1868	1661	Both
1869	1662	Both
1870	1663	Both
1871	1664	Both
1872	1665	Both
1873	1666	Both
1874	1667	Both
1875	1668	Both
1876	1669	Both
1877	1670	Both
1878	1671	Both
1879	1672	Both
1880	1673	Both
1881	1674	Both
1882	1675	Both
1883	1676	Both
1884	1677	Both
1885	1678	Both
1886	1679	Both
1887	1680	Neither
1888	1681	Home
1889	1682	Both
1890	1683	Home
1891	1684	Both
1892	1685	Both
1893	1686	Away
1894	1687	Both
1895	1688	Both
1896	1689	Both
1897	1690	Both
1898	1691	Both
1899	1692	Both
1900	1693	Home
1901	1694	Both
1902	1695	Both
1903	1696	Both
1904	1697	Both
1905	1698	Both
1906	1699	Both
1907	1700	Both
1908	1701	Both
1909	1702	Both
1910	1703	Both
1911	1704	Both
1912	1705	Both
1913	1706	Both
1914	1707	Both
1915	1708	Both
\.


--
-- TOC entry 2436 (class 0 OID 0)
-- Dependencies: 187
-- Name: captain_armband_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('captain_armband_id_seq', 38, true);


--
-- TOC entry 2437 (class 0 OID 0)
-- Dependencies: 188
-- Name: captain_armband_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('captain_armband_report_id_seq', 1, false);


--
-- TOC entry 2343 (class 0 OID 26883)
-- Dependencies: 189
-- Data for Name: captain_liaison; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY captain_liaison (id, home_score, away_score, comment, report_id) FROM stdin;
1350	10	8	Away captain a bit of a loudmouth, had to tell him to pipe down	1143
1351	9	9	\N	1144
1352	9	9	\N	1145
1353	9	9	\N	1146
1354	7	7	\N	1147
1355	6	6	\N	1148
1356	8	8	\N	1149
1357	7	8	\N	1150
1358	8	8	Not ideal the goalkeeper being the captain - however not really needed 	1151
1359	9	9	\N	1152
1360	9	9	No issues to involve them at all.	1153
1361	8	6	\N	1154
1362	7	7	\N	1155
1363	8	8	\N	1156
1364	9	9	\N	1157
1365	8	8	\N	1158
1366	7	7	\N	1159
1367	8	8	\N	1160
1368	8	8	\N	1161
1369	7	9	\N	1162
1370	9	9	\N	1163
1371	6	7	\N	1164
1372	6	6	\N	1165
1373	8	5	Away club captain sent off!	1166
1374	7	7	\N	1167
1375	9	7	\N	1168
1376	9	8	\N	1169
1377	9	9	\N	1170
1378	7	9	\N	1171
1379	9	9	\N	1172
1380	8	7	\N	1173
1381	8	7	\N	1174
1382	7	7	\N	1175
1383	4	8	constant complaints to my authority	1176
1384	9	9	\N	1177
1385	6	6	\N	1178
1386	4	8	Home captain no authority and showed no inclination to get involved to curb dissent.	1179
1387	8	8	\N	1180
1388	9	9	\N	1181
1389	9	9	\N	1182
1390	8	8	\N	1183
1391	8	3	Had to caution him for comments he made to me and didnt help when his players got a bit unruly	1184
1392	9	9	\N	1185
1393	7	7	\N	1186
1394	9	9	\N	1187
1395	9	7	\N	1188
1396	9	9	\N	1189
1397	6	8	Home captain could possibly have saved a team mate from a dissent caution but didn't act decisively enough.	1190
1398	6	6	\N	1191
1399	10	8	\N	1192
1400	10	10	\N	1193
1401	8	8	\N	1194
1402	7	8	\N	1195
1403	9	5	captain first player in the book. was not invested in working with me, rather against me and questioned most decisions all game.	1196
1404	7	7	\N	1197
1405	8	6	\N	1198
1406	8	8	\N	1199
1407	7	7	not required.	1200
1408	8	7	\N	1201
1409	9	9	\N	1202
1410	7	7	\N	1203
1411	8	8	\N	1204
1412	8	8	\N	1205
1413	8	8	\N	1206
1414	9	9	\N	1207
1415	9	9	\N	1208
1416	7	9	\N	1209
1417	10	10	Captains managed their players well	1210
1418	6	7	\N	1211
1419	7	7	\N	1212
1420	8	7	\N	1213
1421	10	9	\N	1214
1422	10	10	\N	1215
1423	7	10	\N	1216
1424	10	9	\N	1217
1425	9	9	lots of talk to captain and liased well	1218
1426	9	8	\N	1219
1427	7	7	\N	1220
1428	6	6	\N	1221
1429	8	8	\N	1222
1430	10	10	\N	1223
1431	6	6	\N	1224
1432	7	9	\N	1225
1433	8	8	\N	1226
1434	9	9	\N	1227
1435	7	7	Captains did little at first to control their players which led to 4 very quick yellow cards	1228
1436	9	9	\N	1229
1437	8	8	\N	1230
1438	7	7	\N	1231
1439	8	8	\N	1232
1440	7	7	\N	1233
1441	7	6	\N	1234
1442	10	10	\N	1235
1443	6	8	\N	1236
1444	9	9	\N	1237
1445	9	9	\N	1238
1446	9	9	\N	1239
1447	10	10	\N	1240
1448	9	9	\N	1241
1449	9	9	\N	1242
1450	9	7	\N	1243
1451	7	6	\N	1244
1452	8	8	\N	1245
1453	10	9	\N	1246
1454	6	6	\N	1247
1455	10	10	\N	1248
1456	6	8	\N	1249
1457	9	10	\N	1250
1458	7	10	\N	1251
1459	7	7	both respectful.	1252
1460	7	8	\N	1253
1461	10	9	\N	1254
1462	8	6	\N	1255
1463	6	6	\N	1256
1464	6	6	\N	1257
1465	7	6	\N	1258
1466	9	9	\N	1259
1467	7	7	\N	1260
1468	10	10	\N	1261
1469	8	8	\N	1262
1470	8	8	\N	1263
1471	8	8	\N	1264
1472	7	8	\N	1265
1473	7	8	\N	1266
1474	7	7	\N	1267
1475	8	8	\N	1268
1476	9	9	\N	1269
1477	10	7	\N	1270
1478	10	10	Both skippers were excellent & proactive with their players, although there was little drama in the game	1271
1479	9	6	\N	1272
1480	10	8	\N	1273
1481	9	9	\N	1274
1482	7	8	\N	1275
1483	7	7	\N	1276
1484	7	7	\N	1277
1485	8	8	\N	1278
1486	8	8	\N	1279
1487	9	7	\N	1280
1488	9	9	\N	1281
1489	7	8	\N	1282
1490	10	9	\N	1283
1491	9	6	\N	1284
1492	9	9	\N	1285
1493	8	7	\N	1286
1494	10	9	\N	1287
1495	6	6	\N	1288
1496	9	9	\N	1289
1497	7	8	\N	1290
1498	10	10	\N	1291
1499	9	9	\N	1292
1500	8	8	\N	1293
1501	10	8	\N	1294
1502	8	6	\N	1295
1503	9	9	Bothe skippers did their bit for me when asked to get involved	1296
1504	8	6	\N	1297
1505	8	10	\N	1298
1506	9	8	\N	1299
1507	6	3	the captain had little effect on delivering request from me to stop his teams dissent. At times making comments that fueled extra dissent. 	1300
1508	8	7	\N	1301
1509	6	6	\N	1302
1510	10	10	\N	1303
1511	6	7	\N	1304
1512	7	5	Away Captain alright whilst they were winning. Increasingly argumentative and subsequently cautioned for dissent.	1305
1513	8	8	\N	1306
1514	9	7	\N	1307
1515	6	6	\N	1308
1516	8	8	\N	1309
1517	8	8	\N	1310
1518	9	8	\N	1311
1519	9	9	\N	1312
1520	7	7	\N	1313
1521	9	7	\N	1314
1522	8	9	\N	1315
1523	9	9	\N	1316
1524	9	7	\N	1317
1525	9	9	\N	1318
1526	10	10	\N	1319
1527	9	9	\N	1320
1528	8	8	\N	1321
1529	8	10	The home captain was asked to get one of his players under control after continually appealling for fouls that were not there. Eventually I had to caution the same player for his lack of control in a challenge 	1322
1530	10	4	did nothing when serten players that was showing me decent there was a few words said by the skipper but no one lisend to him thats y 2 people were in the book for decent	1323
1531	9	9	\N	1324
1532	9	8	\N	1325
1533	8	6	\N	1326
1534	9	9	\N	1327
1535	8	5	Away picked up two yellows.	1328
1536	7	7	\N	1329
1537	7	9	\N	1330
1538	7	8	\N	1331
1539	10	10	both skippers were helpful when requested	1332
1540	10	10	\N	1333
1541	9	9	\N	1334
1542	7	8	\N	1335
1543	7	7	\N	1336
1544	9	9	\N	1337
1545	6	6	\N	1338
1546	6	6	\N	1339
1547	7	7	\N	1340
1548	6	6	\N	1341
1549	9	9	\N	1342
1550	7	7	\N	1343
1551	10	1	away captain was a nightmare to work with.	1344
1552	9	8	\N	1345
1553	10	10	\N	1346
1554	6	7	\N	1347
1555	9	9	\N	1348
1556	9	9	\N	1349
1557	7	7	\N	1350
1558	9	9	\N	1351
1559	6	7	\N	1352
1560	7	6	\N	1353
1561	8	8	\N	1354
1562	9	9	\N	1355
1563	8	8	\N	1356
1564	10	10	\N	1357
1565	10	10	\N	1358
1566	10	10	\N	1359
1567	10	1	Golcar Con's captain spent most of the match trying to argue with me, then got sent off for grabbing a 16-year old on the other team by the throat.  I couldn't imagine a worse captain.	1360
1568	6	6	\N	1361
1569	8	5	away captain did not control his players	1362
1570	8	8	\N	1363
1571	8	8	\N	1364
1572	8	8	\N	1365
1573	8	6	\N	1366
1574	8	9	\N	1367
1575	8	8	\N	1368
1576	8	9	\N	1369
1577	8	8	\N	1370
1578	8	8	\N	1371
1579	9	9	\N	1372
1580	8	7	\N	1373
1581	8	8	\N	1374
1582	6	6	\N	1375
1583	6	7	\N	1376
1584	10	10	Both captains brillant to work with	1377
1585	8	8	\N	1378
1586	7	8	\N	1379
1587	8	8	\N	1380
1588	9	9	\N	1381
1589	9	7	\N	1382
1590	9	8	\N	1383
1591	6	8	\N	1384
1592	8	6	\N	1385
1593	8	8	\N	1386
1594	9	9	\N	1387
1595	10	7	\N	1388
1596	9	9	\N	1389
1597	8	8	\N	1390
1598	7	7	\N	1391
1599	6	10	\N	1392
1600	8	8	\N	1393
1601	10	10	\N	1394
1602	10	10	\N	1395
1603	6	6	\N	1396
1604	7	6	\N	1397
1605	9	9	\N	1398
1606	9	9	\N	1399
1607	7	7	\N	1400
1608	9	9	\N	1401
1609	9	9	Both captains worked well shame about the rest of the newsome team - However the captain helped shame he couldnt pass on his attitude	1402
1610	8	8	\N	1403
1611	7	7	Captains did little to help control the game	1404
1612	9	9	\N	1405
1613	8	7	\N	1406
1614	7	7	\N	1407
1615	6	6	\N	1408
1616	8	8	\N	1409
1617	8	9	\N	1410
1618	7	9	\N	1411
1619	7	8	\N	1412
1620	8	9	Away captain kept his players in line without my intervention. Home ok too in calming players down.	1413
1621	9	9	\N	1414
1622	8	10	\N	1415
1623	8	6	\N	1416
1624	7	8	\N	1417
1625	10	10	\N	1418
1626	10	7	The away skipper began to show his frustrations of a heavy defeat in the second half	1419
1627	8	8	\N	1420
1628	9	9	\N	1421
1629	7	7	\N	1422
1630	9	9	\N	1423
1631	7	6	\N	1424
1632	6	7	\N	1425
1633	9	7	\N	1426
1634	8	8	\N	1427
1635	7	7	\N	1428
1636	10	5	The captains attitude was awful to is players and to me I booked him to carm him down which help but when game finished shook hands with everybody the grange moor walked over to me put is hand out as I went to shake he pulled his away tried to talk to him but is attitude stunk not good for grange moor as captain should be an example for everybody at club 	1429
1637	7	7	\N	1430
1638	9	9	\N	1431
1639	8	8	\N	1432
1640	8	8	\N	1433
1641	9	9	\N	1434
1642	7	7	\N	1435
1643	8	8	\N	1436
1644	8	8	\N	1437
1645	6	6	\N	1438
1646	9	7	Holmbridge captain very helpful in working with me during the game	1439
1647	9	9	\N	1440
1648	8	8	\N	1441
1649	8	8	\N	1442
1650	6	8	\N	1443
1651	8	8	\N	1444
1652	8	8	\N	1445
1653	8	8	\N	1446
1654	8	8	\N	1447
1655	9	9	\N	1448
1656	8	8	\N	1449
1657	8	8	\N	1450
1658	9	9	\N	1451
1659	9	9	\N	1452
1660	9	8	\N	1453
1661	9	9	\N	1454
1662	6	6	\N	1455
1663	8	8	\N	1456
1664	7	8	\N	1457
1665	9	8	\N	1458
1666	9	9	\N	1459
1667	7	7	\N	1460
1668	9	9	Both skippers were supportive when required	1461
1669	6	6	\N	1462
1670	7	7	\N	1463
1671	9	9	\N	1464
1672	6	6	\N	1465
1673	8	8	\N	1466
1674	8	8	\N	1467
1675	9	9	\N	1468
1676	10	10	\N	1469
1677	9	10	Both captains were on par with what you get at supply league level	1470
1678	8	8	\N	1471
1679	8	8	\N	1472
1680	8	8	\N	1473
1681	9	9	\N	1474
1682	7	10	Few bits of dissent from home team captain - Away team captain a privelidge to be on the same field as even when losing	1475
1683	7	8	\N	1476
1684	10	10	Neither were called upon during the game	1477
1685	8	7	\N	1478
1686	8	8	\N	1479
1687	7	8	\N	1480
1688	9	9	\N	1481
1689	9	9	\N	1482
1690	7	8	\N	1483
1691	6	7	\N	1484
1692	10	8	\N	1485
1693	6	6	\N	1486
1694	6	6	\N	1487
1695	2	3	Home captain a pain. Away captain no influence with his team.	1488
1696	7	7	\N	1489
1697	6	6	\N	1490
1698	8	7	\N	1491
1699	8	8	\N	1492
1700	9	9	\N	1493
1701	8	8	\N	1494
1702	8	9	\N	1495
1703	8	7	\N	1496
1704	7	9	\N	1497
1705	8	7	\N	1498
1706	8	10	\N	1499
1707	9	9	\N	1500
1708	8	4	Totally ill disciplined	1501
1709	8	10	\N	1502
1710	7	8	\N	1503
1711	7	7	\N	1504
1712	9	8	\N	1505
1713	7	6	\N	1506
1714	7	7	\N	1507
1715	7	8	\N	1508
1716	7	6	\N	1509
1717	8	8	\N	1510
1718	7	7	\N	1511
1719	9	9	\N	1512
1720	8	9	\N	1513
1721	6	6	\N	1514
1722	10	10	\N	1515
1723	10	10	\N	1516
1724	9	9	\N	1517
1725	8	6	\N	1518
1726	8	8	\N	1519
1727	9	9	\N	1520
1728	8	8	\N	1521
1729	7	7	\N	1522
1730	10	10	\N	1523
1731	6	6	\N	1524
1732	9	9	\N	1525
1733	10	10	\N	1526
1734	9	10	\N	1527
1735	6	7	\N	1528
1736	9	7	\N	1529
1737	6	8	\N	1530
1738	9	9	\N	1531
1739	9	9	No issues with either captains	1532
1740	8	8	nothing to do	1533
1741	8	7	\N	1534
1742	8	6	\N	1535
1743	7	7	\N	1536
1744	9	9	\N	1537
1745	9	9	\N	1538
1746	7	8	\N	1539
1747	8	8	\N	1540
1748	10	10	\N	1541
1749	10	6	\N	1542
1750	10	10	\N	1543
1751	10	7	The Grimescar skipper could have been more proactive in helping contain some of his teams outbursts of poor behaviour	1544
1752	7	8	\N	1545
1753	7	7	\N	1546
1754	9	9	\N	1547
1755	9	8	\N	1548
1756	9	8	\N	1549
1757	8	8	\N	1550
1758	9	9	\N	1551
1759	9	9	\N	1552
1760	9	9	\N	1553
1761	8	9	\N	1554
1762	8	8	I had to involve both skippers in discussions with players but felt I could have been supported more by them.	1555
1763	7	9	\N	1556
1764	10	10	\N	1557
1765	8	8	\N	1558
1766	7	9	\N	1559
1767	8	8	\N	1560
1768	9	9	\N	1561
1769	9	8	\N	1562
1770	10	10	\N	1563
1771	7	9	\N	1564
1772	8	8	\N	1565
1773	7	7	\N	1566
1774	9	9	both captains observed a captains role	1567
1775	8	8	\N	1568
1776	9	9	\N	1569
1777	10	10	\N	1570
1778	9	9	\N	1571
1779	8	9	\N	1572
1780	8	8	\N	1573
1781	7	6	\N	1574
1782	7	7	\N	1575
1783	10	10	\N	1576
1784	9	9	\N	1577
1785	8	8	\N	1578
1786	7	9	\N	1579
1787	7	7	\N	1580
1788	7	7	\N	1581
1789	10	10	\N	1582
1790	9	9	\N	1583
1791	8	8	Only called on once to control a scuffle	1584
1792	7	8	\N	1585
1793	9	9	\N	1586
1794	9	9	\N	1587
1795	8	9	\N	1588
1796	10	10	\N	1589
1797	8	8	\N	1590
1798	8	8	\N	1591
1799	10	1	I sent off Black Horse's captain, then later sent off their replacement captain.	1592
1800	8	8	\N	1593
1801	3	7	Home team played poorly so began to moan about everything. Captain as bad as rest leading by example.	1594
1802	10	10	\N	1595
1803	9	9	\N	1596
1804	9	9	\N	1597
1805	7	7	\N	1598
1806	10	10	\N	1599
1807	9	9	\N	1600
1808	7	8	\N	1601
1809	7	8	\N	1602
1810	9	10	\N	1603
1811	9	9	\N	1604
1812	9	9	\N	1605
1813	10	9	\N	1606
1814	8	8	\N	1607
1815	8	8	\N	1608
1816	10	7	\N	1609
1817	9	9	\N	1610
1818	8	8	\N	1611
1819	9	9	\N	1612
1820	8	5	\N	1613
1821	9	9	\N	1614
1822	10	10	\N	1615
1823	7	7	\N	1616
1824	7	7	\N	1617
1825	10	10	Great game with two great captains deserve credit	1618
1826	8	8	\N	1619
1827	9	9	\N	1620
1828	9	9	\N	1621
1829	7	6	\N	1622
1830	8	6	\N	1623
1831	6	6	\N	1624
1832	9	9	\N	1625
1833	9	9	\N	1626
1834	10	10	\N	1627
1835	8	9	\N	1628
1836	9	9	\N	1629
1837	9	9	\N	1630
1838	8	8	\N	1631
1839	10	10	\N	1632
1840	7	7	\N	1633
1841	9	5	\N	1634
1842	10	10	\N	1635
1843	8	8	\N	1636
1844	9	9	\N	1637
1845	7	9	\N	1638
1846	7	8	\N	1639
1847	6	6	\N	1640
1848	9	9	\N	1641
1849	8	6	\N	1642
1850	9	9	\N	1643
1851	8	7	\N	1644
1852	8	8	\N	1645
1853	9	9	\N	1646
1854	8	8	\N	1647
1855	8	8	\N	1648
1856	9	8	\N	1649
1857	9	9	\N	1650
1858	9	9	\N	1651
1859	7	7	\N	1652
1860	8	5	No help whatsoever	1653
1861	9	4	Came on late	1654
1862	7	10	Home captain less helpful than away captain	1655
1863	9	9	\N	1656
1864	7	9	Brook Motors one of best behaved teams.	1657
1865	10	10	\N	1658
1866	10	10	both captains were brilliant to work with	1659
1867	9	10	\N	1660
1868	9	9	\N	1661
1869	8	6	\N	1662
1870	9	9	\N	1663
1871	9	9	\N	1664
1872	9	9	\N	1665
1873	9	9	\N	1666
1874	9	9	\N	1667
1875	8	8	\N	1668
1876	8	8	\N	1669
1877	8	8	\N	1670
1878	8	6	\N	1671
1879	9	6	\N	1672
1880	8	9	\N	1673
1881	9	9	\N	1674
1882	10	8	\N	1675
1883	9	9	\N	1676
1884	8	7	\N	1677
1885	7	7	\N	1678
1886	8	8	\N	1679
1887	9	9	\N	1680
1888	10	6	\N	1681
1889	10	10	\N	1682
1890	8	8	\N	1683
1891	8	7	\N	1684
1892	6	6	\N	1685
1893	7	7	No issues.	1686
1894	8	8	\N	1687
1895	7	6	\N	1688
1896	7	7	\N	1689
1897	10	9	\N	1690
1898	9	9	\N	1691
1899	8	8	\N	1692
1900	7	7	\N	1693
1901	8	9	\N	1694
1902	7	10	Dissent from Home Captain - Away captain was a pleasure to work with	1695
1903	8	9	\N	1696
1904	8	6	\N	1697
1905	7	7	\N	1698
1906	9	9	\N	1699
1907	10	10	\N	1700
1908	8	8	\N	1701
1909	9	9	\N	1702
1910	10	10	\N	1703
1911	8	8	\N	1704
1912	6	6	\N	1705
1913	9	9	\N	1706
1914	10	10	\N	1707
1915	6	6	\N	1708
\.


--
-- TOC entry 2438 (class 0 OID 0)
-- Dependencies: 190
-- Name: captain_liaison_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('captain_liaison_id_seq', 38, true);


--
-- TOC entry 2439 (class 0 OID 0)
-- Dependencies: 191
-- Name: captain_liaison_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('captain_liaison_report_id_seq', 1, false);


--
-- TOC entry 2440 (class 0 OID 0)
-- Dependencies: 194
-- Name: changing_facilitiy_score_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('changing_facilitiy_score_report_id_seq', 1, false);


--
-- TOC entry 2346 (class 0 OID 26893)
-- Dependencies: 192
-- Data for Name: changing_facility; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY changing_facility (id, report_id, score, comment) FROM stdin;
1350	1143	5	Small cupboard. Always the same with Scissett
1351	1144	10	\N
1352	1145	8	\N
1353	1146	10	\N
1354	1147	5	Poor, as only broom cupboard.  Communal urinals and showers
1355	1148	4	Had to use the old cricket store room as the key for the referees room was not available. small space, dirty , no toilet or washing facility's.
1356	1149	9	\N
1357	1150	6	\N
1358	1151	6	Changing in the middle of the tea room of cricket paviliion is not ideal
1359	1152	8	\N
1360	1153	8	In with the home team.
1361	1154	8	\N
1362	1155	7	\N
1363	1156	9	\N
1364	1157	9	\N
1365	1158	6	\N
1366	1159	6	\N
1367	1160	8	\N
1368	1161	7	\N
1369	1162	5	\N
1370	1163	8	\N
1371	1164	9	\N
1372	1165	10	\N
1373	1166	8	Floor could do with a clean
1374	1167	7	Floor needs cleaning
1375	1168	6	\N
1376	1169	8	\N
1377	1170	9	\N
1378	1171	10	\N
1379	1172	7	\N
1380	1173	10	\N
1381	1174	8	\N
1382	1175	9	\N
1383	1176	7	\N
1384	1177	8	\N
1385	1178	5	No toilet, cold shower
1386	1179	7	\N
1387	1180	9	\N
1388	1181	5	\N
1389	1182	9	\N
1390	1183	8	\N
1391	1184	7	\N
1392	1185	6	\N
1393	1186	7	\N
1394	1187	5	\N
1395	1188	7	\N
1396	1189	9	\N
1397	1190	5	\N
1398	1191	6	\N
1399	1192	9	\N
1400	1193	2	No door on refs changing room also had dirty clothing on the floor
1401	1194	5	Did not go to changing facility.
1402	1195	6	\N
1403	1196	5	Went straight to ground.
1404	1197	5	Did not visit.
1405	1198	8	\N
1406	1199	7	\N
1407	1200	7	Never ideal to share with either team.
1408	1201	5	No referee changing room so had to change with home team
1409	1202	10	\N
1410	1203	6	\N
1411	1204	7	\N
1412	1205	7	\N
1413	1206	6	Cold Showers & some not working poorly cleaned although some remedial work on the roof looks to have been done
1414	1207	9	\N
1415	1208	9	\N
1416	1209	10	\N
1417	1210	9	Could do with a clothes hook, but is a tremendous improvement on their previous facilities
1418	1211	7	\N
1419	1212	7	\N
1420	1213	7	\N
1421	1214	8	\N
1422	1215	10	\N
1423	1216	7	\N
1424	1217	5	not attended
1425	1218	9	Nice clean changing facilities 
1426	1219	10	\N
1427	1220	7	\N
1428	1221	7	\N
1429	1222	8	\N
1430	1223	8	\N
1431	1224	8	\N
1432	1225	9	\N
1433	1226	6	\N
1434	1227	8	\N
1435	1228	7	Ongoing work to put in a shower which makes it a bit messy but a huge improvement for Britannia sports from Lindley
1436	1229	9	\N
1437	1230	7	\N
1438	1231	8	\N
1439	1232	7	\N
1440	1233	8	\N
1441	1234	9	\N
1442	1235	7	\N
1443	1236	7	\N
1444	1237	8	\N
1445	1238	9	\N
1446	1239	9	\N
1447	1240	10	\N
1448	1241	9	\N
1449	1242	7	\N
1450	1243	5	\N
1451	1244	6	\N
1452	1245	5	Small, Dirty, Dark least I was in my own Room
1453	1246	10	\N
1454	1247	5	\N
1455	1248	5	\N
1456	1249	8	\N
1457	1250	5	\N
1458	1251	10	\N
1459	1252	8	\N
1460	1253	6	\N
1461	1254	5	did not visit changing
1462	1255	7	\N
1463	1256	6	\N
1464	1257	8	\N
1465	1258	8	\N
1466	1259	8	\N
1467	1260	8	\N
1468	1261	5	Didn't visit changing room
1469	1262	9	\N
1470	1263	5	Didn't use went straight to ground
1471	1264	6	\N
1472	1265	9	\N
1473	1266	7	\N
1474	1267	9	\N
1475	1268	6	\N
1476	1269	8	No shower in referee room
1477	1270	8	\N
1478	1271	7	Changing room is an area just off the showers with block walls but no door etc. & not really seperate from the teams before & after the game. It was okay but perhaps using some of the space in the rest of the building would be better? 
1479	1272	7	\N
1480	1273	9	\N
1481	1274	5	Did not visit changing
1482	1275	8	\N
1483	1276	8	\N
1484	1277	9	\N
1485	1278	9	\N
1486	1279	8	\N
1487	1280	9	\N
1488	1281	7	no sepp. accomodation
1489	1282	8	no sepp. shower
1490	1283	10	Changing rooms really good at Shepley now good for club making them better
1491	1284	9	\N
1492	1285	8	\N
1493	1286	7	\N
1494	1287	8	\N
1495	1288	6	\N
1496	1289	8	\N
1497	1290	5	DID NOT USE DUE TO PREVIOUS EXPERIENCE
1498	1291	9	\N
1499	1292	9	\N
1500	1293	5	Went straight to pitch
1501	1294	9	\N
1502	1295	9	\N
1503	1296	9	Had to share with the home team but the facilities were good 
1504	1297	9	\N
1505	1298	7	\N
1506	1299	7	\N
1507	1300	7	\N
1508	1301	7	\N
1509	1302	5	\N
1510	1303	10	\N
1511	1304	8	\N
1512	1305	6	\N
1513	1306	9	\N
1514	1307	5	\N
1515	1308	4	Muddy floor, shower not working, toilet disgusting
1516	1309	7	\N
1517	1310	10	its a school  accademy changing room with superb facilities for  the ref
1518	1311	9	much improved at reinwood rec
1519	1312	10	\N
1520	1313	7	\N
1521	1314	9	\N
1522	1315	9	\N
1523	1316	9	\N
1524	1317	9	\N
1525	1318	8	\N
1526	1319	8	\N
1527	1320	6	\N
1528	1321	5	Did not go to changing facility.
1529	1322	8	Changing rooms have been refurbished in recent years but was filthy & swimming in water on arrival
1530	1323	10	\N
1531	1324	8	\N
1532	1325	8	\N
1533	1326	8	\N
1534	1327	9	\N
1535	1328	5	Did Not Attend
1536	1329	7	\N
1537	1330	7	\N
1538	1331	10	\N
1539	1332	10	Great facilities at Broadlands
1540	1333	8	\N
1541	1334	5	Did not visit changing
1542	1335	7	\N
1543	1336	7	\N
1544	1337	8	They will be brilliant! However its a building site at the present time
1545	1338	10	\N
1546	1339	10	\N
1547	1340	7	\N
1548	1341	3	Awful
1549	1342	9	\N
1550	1343	7	\N
1551	1344	8	\N
1552	1345	10	\N
1553	1346	2	Not usable, full of equipment
1554	1347	8	\N
1555	1348	8	\N
1556	1349	8	\N
1557	1350	5	Did not visit
1558	1351	8	\N
1559	1352	9	\N
1560	1353	6	\N
1561	1354	8	\N
1562	1355	10	\N
1563	1356	6	\N
1564	1357	3	No light in room.  Changed in hallway.
1565	1358	2	No light.  Tiny room.  Changed in hallway instead.
1566	1359	10	\N
1567	1360	10	\N
1568	1361	6	\N
1569	1362	9	\N
1570	1363	8	\N
1571	1364	9	\N
1572	1365	9	\N
1573	1366	7	\N
1574	1367	7	\N
1575	1368	9	\N
1576	1369	7	\N
1577	1370	4	NO SEPP. ROOM OR SHOWER
1578	1371	7	sepp. room but no shower  yet, its work in progress so we should be patient
1579	1372	10	\N
1580	1373	8	\N
1581	1374	7	\N
1582	1375	6	\N
1583	1376	8	\N
1584	1377	5	\N
1585	1378	9	\N
1586	1379	9	\N
1587	1380	7	\N
1588	1381	6	\N
1589	1382	9	\N
1590	1383	7	\N
1591	1384	6	\N
1592	1385	8	\N
1593	1386	9	\N
1594	1387	9	\N
1595	1388	9	\N
1596	1389	8	I apologise for giving a low mark for facilities last week.  I was unaware there is 2 referee changing rooms. 
1597	1390	3	No toilet, no running water in referees changing room, no power in referees changing room, Dirty.
1598	1391	5	shower out of action
1599	1392	10	\N
1600	1393	5	Did not visit
1601	1394	10	\N
1602	1395	10	\N
1603	1396	9	\N
1604	1397	9	\N
1605	1398	9	\N
1606	1399	8	\N
1607	1400	7	\N
1608	1401	9	\N
1609	1402	3	Small, Dark, Not great facilties
1610	1403	9	own room and shower at new college but very small
1611	1404	2	Gets worse every time I go here
1612	1405	8	\N
1613	1406	6	\N
1614	1407	6	\N
1615	1408	7	\N
1616	1409	7	\N
1617	1410	7	\N
1618	1411	10	\N
1619	1412	5	\N
1620	1413	9	\N
1621	1414	8	\N
1622	1415	10	\N
1623	1416	5	I was not there
1624	1417	10	\N
1625	1418	5	I did not visit changing rooms
1626	1419	7	Main issue is the size of the room with very little room for your bag & seating. Also the shower curtain does not fit all way round the tray so the floor is wet through after you get out 
1627	1420	9	\N
1628	1421	8	\N
1629	1422	5	Did not visit changing rooms
1630	1423	7	\N
1631	1424	10	\N
1632	1425	7	\N
1633	1426	6	\N
1634	1427	8	\N
1635	1428	8	\N
1636	1429	10	\N
1637	1430	7	showers cold
1638	1431	8	\N
1639	1432	6	\N
1640	1433	8	\N
1641	1434	7	\N
1642	1435	9	\N
1643	1436	9	\N
1644	1437	8	\N
1645	1438	5	poor conditions,haven;t changed in over 10 years,an adjoining area onto the home teams dressing room,which could cause serious confrontations if problems during the game. needs to be moved to a different area.
1646	1439	3	Shocking Cupboard full of cricket equipment, Dark, Dirty Nowhere to put Bag or hang clothes door wouldnt shut
1647	1440	8	\N
1648	1441	8	clean and tidy umpires room but no sepp. shower
1649	1442	7	own room with shower but needs some attension
1650	1443	8	\N
1651	1444	8	\N
1652	1445	9	\N
1653	1446	6	\N
1654	1447	8	\N
1655	1448	9	\N
1656	1449	8	\N
1657	1450	7	\N
1658	1451	9	\N
1659	1452	9	\N
1660	1453	8	\N
1661	1454	8	\N
1662	1455	10	\N
1663	1456	6	\N
1664	1457	5	\N
1665	1458	5	Did not visit changing
1666	1459	10	\N
1667	1460	5	\N
1668	1461	7	Spacious enough ref's room, however there were only 2 of the 3 showers working for all the players + me. The Honley socialist club has gone into receivership so Brook Motors will be looking for new facilities to get changed
1669	1462	6	\N
1670	1463	9	very good facilities
1671	1464	10	\N
1672	1465	7	\N
1673	1466	8	\N
1674	1467	5	Went direct to ground
1675	1468	9	\N
1676	1469	10	\N
1677	1470	10	Really pleased with facilities. In comparison to halifax district these were amazing!
1678	1471	9	\N
1679	1472	8	\N
1680	1473	8	\N
1681	1474	8	No shower
1682	1475	6	not the best - Not seperate or in your own room just given a bench in between teams
1683	1476	9	\N
1684	1477	4	no separate toilet or shower. It had been swept up though 
1685	1478	9	NEW FACILITY WITH WORK IN PROGRESS
1686	1479	9	\N
1687	1480	10	\N
1688	1481	8	\N
1689	1482	8	\N
1690	1483	7	\N
1691	1484	5	went to field
1692	1485	7	\N
1693	1486	8	\N
1694	1487	5	\N
1695	1488	5	Did not visit.
1696	1489	8	\N
1697	1490	5	Not used
1698	1491	9	\N
1699	1492	5	Did not visit changing facility
1700	1493	1	very poor shower not working properly changing room door to outside would,nt close very cramped for 2 refs in there we had very little room
1701	1494	8	\N
1702	1495	8	\N
1703	1496	8	\N
1704	1497	8	\N
1705	1498	8	\N
1706	1499	9	\N
1707	1500	9	\N
1708	1501	9	\N
1709	1502	8	\N
1710	1503	6	\N
1711	1504	7	\N
1712	1505	6	\N
1713	1506	6	\N
1714	1507	5	i went to field
1715	1508	7	\N
1716	1509	8	\N
1717	1510	9	\N
1718	1511	7	shower blocked and inopperative
1719	1512	8	\N
1720	1513	9	\N
1721	1514	9	\N
1722	1515	8	\N
1723	1516	8	\N
1724	1517	5	I did not visit changing room
1725	1518	7	\N
1726	1519	6	\N
1727	1520	8	\N
1728	1521	6	\N
1729	1522	9	\N
1730	1523	9	\N
1731	1524	7	\N
1732	1525	9	\N
1733	1526	10	\N
1734	1527	10	\N
1735	1528	6	\N
1736	1529	9	\N
1737	1530	9	\N
1738	1531	6	\N
1739	1532	9	Only issue the ref has to share changing facilities with teams at the high school. The showers were excellent
1740	1533	8	\N
1741	1534	9	\N
1742	1535	8	\N
1743	1536	8	\N
1744	1537	7	\N
1745	1538	9	\N
1746	1539	10	\N
1747	1540	7	\N
1748	1541	8	\N
1749	1542	9	\N
1750	1543	7	Shame the Referees Shower didnt work - Not good when players keep coming in to use your room for mirror and sink
1751	1544	10	Excellent facilities at Lepton
1752	1545	8	school facility but no seperate room for ref, but all clean an tidy
1753	1546	9	\N
1754	1547	8	\N
1755	1548	9	\N
1756	1549	8	\N
1757	1550	7	\N
1758	1551	7	\N
1759	1552	10	\N
1760	1553	1	showers not working
1761	1554	7	\N
1762	1555	8	work in progress with the refs facilities being refurbished
1763	1556	6	\N
1764	1557	10	\N
1765	1558	9	\N
1766	1559	8	\N
1767	1560	5	\N
1768	1561	5	\N
1769	1562	7	\N
1770	1563	6	\N
1771	1564	7	\N
1772	1565	9	\N
1773	1566	8	\N
1774	1567	10	its meltham !
1775	1568	9	\N
1776	1569	10	\N
1777	1570	8	\N
1778	1571	9	\N
1779	1572	8	\N
1780	1573	8	\N
1781	1574	9	\N
1782	1575	7	\N
1783	1576	8	\N
1784	1577	9	\N
1785	1578	6	\N
1786	1579	9	\N
1787	1580	5	Did not visit
1788	1581	9	\N
1789	1582	5	It was a changing room with no chair.It was like the storage cupboard for the cricket team.
1790	1583	6	\N
1791	1584	3	Diabolical! Messy, dirty, unloved. An indictment of local football
1792	1585	5	\N
1793	1586	8	\N
1794	1587	7	\N
1795	1588	8	\N
1796	1589	10	Best changing facilities I've seen in years.
1797	1590	6	\N
1798	1591	9	all new at reinwood clean an tidy own room and shower
1799	1592	5	\N
1800	1593	6	\N
1801	1594	2	Wet and filthy as has been the case for years.
1802	1595	8	\N
1803	1596	7	\N
1804	1597	8	\N
1805	1598	8	\N
1806	1599	10	\N
1807	1600	8	\N
1808	1601	7	\N
1809	1602	8	\N
1810	1603	7	\N
1811	1604	8	\N
1812	1605	9	\N
1813	1606	6	\N
1814	1607	10	\N
1815	1608	7	\N
1816	1609	10	\N
1817	1610	9	\N
1818	1611	5	\N
1819	1612	7	\N
1820	1613	10	\N
1821	1614	4	\N
1822	1615	8	\N
1823	1616	7	\N
1824	1617	6	\N
1825	1618	3	Colder outside than inside, Dark Dingy Horrific Dirty
1826	1619	5	a wood portition no bigger than a rabbit hutch ,no hooks , no sep. shower overall poor
1827	1620	9	\N
1828	1621	7	\N
1829	1622	10	\N
1830	1623	9	\N
1831	1624	6	\N
1832	1625	7	\N
1833	1626	8	\N
1834	1627	8	\N
1835	1628	7	\N
1836	1629	9	Nice to have a seperate room shower & toilet lots of room
1837	1630	7	\N
1838	1631	7	\N
1839	1632	5	Did not visit
1840	1633	4	They are poor and need cleaning
1841	1634	8	\N
1842	1635	10	\N
1843	1636	8	\N
1844	1637	6	\N
1845	1638	7	\N
1846	1639	7	\N
1847	1640	7	\N
1848	1641	7	\N
1849	1642	5	Not attended
1850	1643	9	Nice clean changing facilities 
1851	1644	7	still not finished the alterations but clean an tidy
1852	1645	7	clean an tidy but no sep. shower
1853	1646	8	\N
1854	1647	7	\N
1855	1648	6	\N
1856	1649	9	\N
1857	1650	5	\N
1858	1651	8	\N
1859	1652	6	\N
1860	1653	5	Did not go to changing facility.
1861	1654	10	\N
1862	1655	9	Very bad smell in changing rooms but by far one of the best in Huddersfield
1863	1656	9	\N
1864	1657	5	Game moved to clayton fields so didn't use changing rooms.
1865	1658	5	\N
1866	1659	6	\N
1867	1660	7	\N
1868	1661	6	\N
1869	1662	7	\N
1870	1663	8	\N
1871	1664	8	excellent when they get showers in
1872	1665	7	\N
1873	1666	8	\N
1874	1667	10	\N
1875	1668	7	\N
1876	1669	8	\N
1877	1670	7	\N
1878	1671	7	\N
1879	1672	9	Nice and new could do with a shower curtain one missing
1880	1673	8	\N
1881	1674	6	\N
1882	1675	7	\N
1883	1676	7	\N
1884	1677	8	\N
1885	1678	8	\N
1886	1679	6	\N
1887	1680	8	\N
1888	1681	8	\N
1889	1682	1	no water,no electric,no shower. enough?
1890	1683	8	\N
1891	1684	8	school facility with a security janitor but no sepp. shpwer
1892	1685	4	no showers after game
1893	1686	7	\N
1894	1687	7	\N
1895	1688	6	\N
1896	1689	3	its very poor...changed with away team
1897	1690	7	\N
1898	1691	9	\N
1899	1692	6	\N
1900	1693	7	\N
1901	1694	8	\N
1902	1695	9	Nice Warm, Could have done witha few empty bottles pciking up but other than that great changing rooms
1903	1696	5	\N
1904	1697	5	not a changing room at new mill wmc,it was 3 foot x 4 foot with a chair.
1905	1698	9	\N
1906	1699	8	\N
1907	1700	8	\N
1908	1701	8	\N
1909	1702	5	\N
1910	1703	7	\N
1911	1704	5	\N
1912	1705	5	\N
1913	1706	8	\N
1914	1707	10	\N
1915	1708	9	\N
\.


--
-- TOC entry 2441 (class 0 OID 0)
-- Dependencies: 193
-- Name: changing_facility_score_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('changing_facility_score_id_seq', 38, true);


--
-- TOC entry 2349 (class 0 OID 26903)
-- Dependencies: 195
-- Data for Name: competition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY competition (id, name, league) FROM stdin;
850	Division 3	2
851	Division 1	2
852	Division 2	2
853	Reserve Division 4	2
854	Reserve Division 3	2
855	Reserve Division 2	2
856	Reserve Division 1	2
857	Division 4	2
858	Division 1	4
859	Division 1	3
860	Challenge Cup	5
861	Challenge Trophy	5
862	Groom Cup	5
863	Gee Cup	5
864	Richardson Cup	5
865	Barlow Cup	5
866	KSL Get Smart Challenge Cup	5
867	KSL Lockwood Private Hire Trophy	5
868	Hoyle Cup	5
\.


--
-- TOC entry 2442 (class 0 OID 0)
-- Dependencies: 196
-- Name: competition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('competition_id_seq', 17, true);


--
-- TOC entry 2443 (class 0 OID 0)
-- Dependencies: 197
-- Name: competition_league_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('competition_league_seq', 1, false);


--
-- TOC entry 2352 (class 0 OID 26910)
-- Dependencies: 198
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contact (id, yes_no_club, report_id) FROM stdin;
1400	Yes	1143
1401	Yes	1144
1402	No	1145
1403	Yes	1146
1404	Club contacted me	1147
1405	Yes	1148
1406	Yes	1149
1407	Yes	1150
1408	Club contacted me	1151
1409	Yes	1152
1410	Yes	1153
1411	Club contacted me	1154
1412	Yes	1155
1413	Club contacted me	1156
1414	Club contacted me	1157
1415	Club contacted me	1158
1416	Yes	1159
1417	Club contacted me	1160
1418	Club contacted me	1161
1419	Yes	1162
1420	Yes	1163
1421	Yes	1164
1422	Club contacted me	1165
1423	Club contacted me	1166
1424	Yes	1167
1425	Yes	1168
1426	Yes	1169
1427	Yes	1170
1428	Club contacted me	1171
1429	No	1172
1430	Yes	1173
1431	Club contacted me	1174
1432	No	1175
1433	Club contacted me	1176
1434	Yes	1177
1435	No	1178
1436	Yes	1179
1437	Yes	1180
1438	Yes	1181
1439	Yes	1182
1440	No	1183
1441	Yes	1184
1442	Yes	1185
1443	Club contacted me	1186
1444	Yes	1187
1445	Yes	1188
1446	Club contacted me	1189
1447	Yes	1190
1448	Yes	1191
1449	Yes	1192
1450	Yes	1193
1451	Yes	1194
1452	Yes	1195
1453	No	1196
1454	No	1197
1455	Yes	1198
1456	Yes	1199
1457	Yes	1200
1458	Club contacted me	1201
1459	Yes	1202
1460	No	1203
1461	Yes	1204
1462	No	1205
1463	Yes	1206
1464	No	1207
1465	Club contacted me	1208
1466	Yes	1209
1467	Yes	1210
1468	Yes	1211
1469	Yes	1212
1470	No	1213
1471	Club contacted me	1214
1472	Club contacted me	1215
1473	No	1216
1474	Club contacted me	1217
1475	Yes	1218
1476	Yes	1219
1477	Yes	1220
1478	Yes	1221
1479	Yes	1222
1480	Yes	1223
1481	Club contacted me	1224
1482	No	1225
1483	Yes	1226
1484	No	1227
1485	Yes	1228
1486	No	1229
1487	Club contacted me	1230
1488	Club contacted me	1231
1489	No	1232
1490	Club contacted me	1233
1491	Yes	1234
1492	No	1235
1493	Club contacted me	1236
1494	Club contacted me	1237
1495	Yes	1238
1496	Club contacted me	1239
1497	Club contacted me	1240
1498	Club contacted me	1241
1499	Club contacted me	1242
1500	No	1243
1501	No	1244
1502	Club contacted me	1245
1503	Yes	1246
1504	Yes	1247
1505	Yes	1248
1506	Yes	1249
1507	Yes	1250
1508	Yes	1251
1509	Yes	1252
1510	Yes	1253
1511	Club contacted me	1254
1512	Yes	1255
1513	No	1256
1514	No	1257
1515	No	1258
1516	No	1259
1517	No	1260
1518	Yes	1261
1519	Club contacted me	1262
1520	Club contacted me	1263
1521	Club contacted me	1264
1522	Club contacted me	1265
1523	No	1266
1524	Yes	1267
1525	Yes	1268
1526	Yes	1269
1527	Club contacted me	1270
1528	Yes	1271
1529	Yes	1272
1530	Yes	1273
1531	Club contacted me	1274
1532	No	1275
1533	No	1276
1534	Yes	1277
1535	No	1278
1536	No	1279
1537	Yes	1280
1538	Yes	1281
1539	Yes	1282
1540	Club contacted me	1283
1541	Yes	1284
1542	Club contacted me	1285
1543	Yes	1286
1544	Yes	1287
1545	No	1288
1546	No	1289
1547	Yes	1290
1548	Yes	1291
1549	Yes	1292
1550	No	1293
1551	Yes	1294
1552	No	1295
1553	Club contacted me	1296
1554	No	1297
1555	Yes	1298
1556	Yes	1299
1557	Yes	1300
1558	Club contacted me	1301
1559	Yes	1302
1560	Club contacted me	1303
1561	Yes	1304
1562	Yes	1305
1563	Club contacted me	1306
1564	Yes	1307
1565	Yes	1308
1566	Yes	1309
1567	Club contacted me	1310
1568	Yes	1311
1569	Club contacted me	1312
1570	No	1313
1571	No	1314
1572	Yes	1315
1573	No	1316
1574	Yes	1317
1575	No	1318
1576	Yes	1319
1577	No	1320
1578	Club contacted me	1321
1579	Club contacted me	1322
1580	No	1323
1581	Yes	1324
1582	No	1325
1583	No	1326
1584	Yes	1327
1585	Yes	1328
1586	Yes	1329
1587	Yes	1330
1588	Club contacted me	1331
1589	Yes	1332
1590	No	1333
1591	Club contacted me	1334
1592	Club contacted me	1335
1593	No	1336
1594	Yes	1337
1595	Yes	1338
1596	Yes	1339
1597	Club contacted me	1340
1598	No	1341
1599	No	1342
1600	Club contacted me	1343
1601	Club contacted me	1344
1602	Club contacted me	1345
1603	Club contacted me	1346
1604	Club contacted me	1347
1605	Yes	1348
1606	No	1349
1607	Yes	1350
1608	Yes	1351
1609	No	1352
1610	Yes	1353
1611	Yes	1354
1612	Yes	1355
1613	Club contacted me	1356
1614	Yes	1357
1615	No	1358
1616	Yes	1359
1617	No	1360
1618	Club contacted me	1361
1619	Club contacted me	1362
1620	Yes	1363
1621	Yes	1364
1622	Yes	1365
1623	Yes	1366
1624	Yes	1367
1625	Yes	1368
1626	Yes	1369
1627	Yes	1370
1628	Yes	1371
1629	Club contacted me	1372
1630	Club contacted me	1373
1631	No	1374
1632	No	1375
1633	Club contacted me	1376
1634	Club contacted me	1377
1635	Yes	1378
1636	Club contacted me	1379
1637	No	1380
1638	No	1381
1639	Club contacted me	1382
1640	Club contacted me	1383
1641	No	1384
1642	Club contacted me	1385
1643	Yes	1386
1644	Club contacted me	1387
1645	Yes	1388
1646	Club contacted me	1389
1647	Yes	1390
1648	No	1391
1649	Yes	1392
1650	Yes	1393
1651	Yes	1394
1652	Yes	1395
1653	Club contacted me	1396
1654	No	1397
1655	Yes	1398
1656	Yes	1399
1657	No	1400
1658	Yes	1401
1659	Yes	1402
1660	Yes	1403
1661	Yes	1404
1662	Club contacted me	1405
1663	Yes	1406
1664	Yes	1407
1665	No	1408
1666	Yes	1409
1667	Yes	1410
1668	Yes	1411
1669	Yes	1412
1670	Yes	1413
1671	Yes	1414
1672	Yes	1415
1673	No	1416
1674	Yes	1417
1675	Club contacted me	1418
1676	Yes	1419
1677	Club contacted me	1420
1678	Yes	1421
1679	No	1422
1680	No	1423
1681	Club contacted me	1424
1682	Club contacted me	1425
1683	Yes	1426
1684	Yes	1427
1685	Yes	1428
1686	Club contacted me	1429
1687	No	1430
1688	Yes	1431
1689	Yes	1432
1690	Club contacted me	1433
1691	Yes	1434
1692	Yes	1435
1693	Club contacted me	1436
1694	No	1437
1695	Yes	1438
1696	Club contacted me	1439
1697	Club contacted me	1440
1698	Yes	1441
1699	Yes	1442
1700	Club contacted me	1443
1701	Club contacted me	1444
1702	Club contacted me	1445
1703	Club contacted me	1446
1704	Club contacted me	1447
1705	Club contacted me	1448
1706	Club contacted me	1449
1707	Club contacted me	1450
1708	Club contacted me	1451
1709	Club contacted me	1452
1710	Club contacted me	1453
1711	Yes	1454
1712	Yes	1455
1713	No	1456
1714	Yes	1457
1715	Club contacted me	1458
1716	No	1459
1717	No	1460
1718	Yes	1461
1719	Yes	1462
1720	Yes	1463
1721	Yes	1464
1722	Yes	1465
1723	Yes	1466
1724	Yes	1467
1725	Club contacted me	1468
1726	Yes	1469
1727	Club contacted me	1470
1728	Yes	1471
1729	Yes	1472
1730	Yes	1473
1731	Yes	1474
1732	Yes	1475
1733	Club contacted me	1476
1734	Club contacted me	1477
1735	Yes	1478
1736	Club contacted me	1479
1737	Yes	1480
1738	Yes	1481
1739	Club contacted me	1482
1740	No	1483
1741	Club contacted me	1484
1742	Yes	1485
1743	Yes	1486
1744	Yes	1487
1745	Yes	1488
1746	Yes	1489
1747	Club contacted me	1490
1748	Yes	1491
1749	Yes	1492
1750	Yes	1493
1751	Yes	1494
1752	No	1495
1753	No	1496
1754	Yes	1497
1755	Yes	1498
1756	No	1499
1757	Yes	1500
1758	Yes	1501
1759	Yes	1502
1760	Yes	1503
1761	Yes	1504
1762	No	1505
1763	Yes	1506
1764	No	1507
1765	Club contacted me	1508
1766	Yes	1509
1767	Yes	1510
1768	Yes	1511
1769	Yes	1512
1770	Yes	1513
1771	Yes	1514
1772	Yes	1515
1773	Yes	1516
1774	No	1517
1775	Club contacted me	1518
1776	Yes	1519
1777	No	1520
1778	Yes	1521
1779	No	1522
1780	Yes	1523
1781	Yes	1524
1782	No	1525
1783	Yes	1526
1784	Yes	1527
1785	Yes	1528
1786	Yes	1529
1787	Yes	1530
1788	No	1531
1789	Yes	1532
1790	Yes	1533
1791	Club contacted me	1534
1792	Yes	1535
1793	Yes	1536
1794	Yes	1537
1795	Yes	1538
1796	Yes	1539
1797	No	1540
1798	Yes	1541
1799	Yes	1542
1800	Yes	1543
1801	Yes	1544
1802	Yes	1545
1803	Yes	1546
1804	Club contacted me	1547
1805	Club contacted me	1548
1806	Yes	1549
1807	Yes	1550
1808	Yes	1551
1809	Yes	1552
1810	Yes	1553
1811	Yes	1554
1812	Yes	1555
1813	Club contacted me	1556
1814	Yes	1557
1815	Yes	1558
1816	Yes	1559
1817	Yes	1560
1818	Club contacted me	1561
1819	Yes	1562
1820	No	1563
1821	Yes	1564
1822	Yes	1565
1823	Yes	1566
1824	Yes	1567
1825	Yes	1568
1826	Club contacted me	1569
1827	Yes	1570
1828	Yes	1571
1829	No	1572
1830	Yes	1573
1831	Yes	1574
1832	Yes	1575
1833	Yes	1576
1834	Club contacted me	1577
1835	Club contacted me	1578
1836	Yes	1579
1837	No	1580
1838	Club contacted me	1581
1839	Yes	1582
1840	No	1583
1841	Club contacted me	1584
1842	Yes	1585
1843	Yes	1586
1844	Yes	1587
1845	Yes	1588
1846	No	1589
1847	Club contacted me	1590
1848	Yes	1591
1849	Yes	1592
1850	Yes	1593
1851	Yes	1594
1852	Yes	1595
1853	Yes	1596
1854	Yes	1597
1855	Yes	1598
1856	Yes	1599
1857	Club contacted me	1600
1858	Club contacted me	1601
1859	Yes	1602
1860	Yes	1603
1861	Yes	1604
1862	Yes	1605
1863	Yes	1606
1864	Yes	1607
1865	Yes	1608
1866	Club contacted me	1609
1867	Yes	1610
1868	Club contacted me	1611
1869	Yes	1612
1870	Club contacted me	1613
1871	No	1614
1872	Club contacted me	1615
1873	Yes	1616
1874	Yes	1617
1875	Yes	1618
1876	Yes	1619
1877	Club contacted me	1620
1878	Yes	1621
1879	Yes	1622
1880	Yes	1623
1881	Yes	1624
1882	Yes	1625
1883	Yes	1626
1884	Club contacted me	1627
1885	Club contacted me	1628
1886	Yes	1629
1887	No	1630
1888	Club contacted me	1631
1889	Yes	1632
1890	No	1633
1891	Club contacted me	1634
1892	Club contacted me	1635
1893	Yes	1636
1894	Club contacted me	1637
1895	Yes	1638
1896	Yes	1639
1897	Yes	1640
1898	Yes	1641
1899	Yes	1642
1900	Yes	1643
1901	Yes	1644
1902	Yes	1645
1903	Yes	1646
1904	Club contacted me	1647
1905	No	1648
1906	Club contacted me	1649
1907	No	1650
1908	Yes	1651
1909	No	1652
1910	Yes	1653
1911	Yes	1654
1912	Yes	1655
1913	Yes	1656
1914	Yes	1657
1915	Yes	1658
1916	Yes	1659
1917	Club contacted me	1660
1918	Yes	1661
1919	Club contacted me	1662
1920	No	1663
1921	No	1664
1922	No	1665
1923	Club contacted me	1666
1924	Yes	1667
1925	Yes	1668
1926	Yes	1669
1927	Yes	1670
1928	Yes	1671
1929	Yes	1672
1930	Yes	1673
1931	Yes	1674
1932	Yes	1675
1933	Yes	1676
1934	Club contacted me	1677
1935	Yes	1678
1936	No	1679
1937	No	1680
1938	Yes	1681
1939	Yes	1682
1940	Club contacted me	1683
1941	Yes	1684
1942	Yes	1685
1943	Club contacted me	1686
1944	Yes	1687
1945	No	1688
1946	Club contacted me	1689
1947	Club contacted me	1690
1948	Yes	1691
1949	Club contacted me	1692
1950	Yes	1693
1951	Yes	1694
1952	Club contacted me	1695
1953	Yes	1696
1954	Club contacted me	1697
1955	Club contacted me	1698
1956	Yes	1699
1957	Yes	1700
1958	Yes	1701
1959	Yes	1702
1960	Yes	1703
1961	Club contacted me	1704
1962	Yes	1705
1963	Yes	1706
1964	No	1707
1965	Yes	1708
\.


--
-- TOC entry 2444 (class 0 OID 0)
-- Dependencies: 199
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contact_id_seq', 39, true);


--
-- TOC entry 2445 (class 0 OID 0)
-- Dependencies: 200
-- Name: contact_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contact_report_id_seq', 1, false);


--
-- TOC entry 2355 (class 0 OID 26917)
-- Dependencies: 201
-- Data for Name: home_hospitality; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY home_hospitality (id, score, report_id) FROM stdin;
1400	10	1143
1401	8	1144
1402	8	1145
1403	10	1146
1404	8	1147
1405	4	1148
1406	8	1149
1407	7	1150
1408	9	1151
1409	9	1152
1410	8	1153
1411	7	1154
1412	7	1155
1413	9	1156
1414	9	1157
1415	8	1158
1416	6	1159
1417	9	1160
1418	8	1161
1419	8	1162
1420	9	1163
1421	9	1164
1422	8	1165
1423	7	1166
1424	8	1167
1425	8	1168
1426	8	1169
1427	9	1170
1428	10	1171
1429	7	1172
1430	9	1173
1431	7	1174
1432	9	1175
1433	6	1176
1434	8	1177
1435	5	1178
1436	4	1179
1437	7	1180
1438	5	1181
1439	9	1182
1440	7	1183
1441	7	1184
1442	7	1185
1443	8	1186
1444	9	1187
1445	9	1188
1446	9	1189
1447	5	1190
1448	7	1191
1449	9	1192
1450	10	1193
1451	6	1194
1452	6	1195
1453	7	1196
1454	6	1197
1455	7	1198
1456	8	1199
1457	4	1200
1458	10	1201
1459	10	1202
1460	7	1203
1461	6	1204
1462	8	1205
1463	8	1206
1464	9	1207
1465	9	1208
1466	8	1209
1467	10	1210
1468	6	1211
1469	9	1212
1470	9	1213
1471	10	1214
1472	10	1215
1473	8	1216
1474	10	1217
1475	9	1218
1476	9	1219
1477	7	1220
1478	9	1221
1479	8	1222
1480	8	1223
1481	7	1224
1482	9	1225
1483	6	1226
1484	9	1227
1485	9	1228
1486	8	1229
1487	7	1230
1488	8	1231
1489	8	1232
1490	7	1233
1491	5	1234
1492	9	1235
1493	5	1236
1494	9	1237
1495	8	1238
1496	9	1239
1497	10	1240
1498	10	1241
1499	9	1242
1500	7	1243
1501	6	1244
1502	8	1245
1503	9	1246
1504	7	1247
1505	7	1248
1506	5	1249
1507	5	1250
1508	7	1251
1509	7	1252
1510	8	1253
1511	9	1254
1512	7	1255
1513	6	1256
1514	7	1257
1515	5	1258
1516	9	1259
1517	8	1260
1518	10	1261
1519	9	1262
1520	9	1263
1521	8	1264
1522	8	1265
1523	8	1266
1524	7	1267
1525	7	1268
1526	9	1269
1527	7	1270
1528	9	1271
1529	9	1272
1530	8	1273
1531	9	1274
1532	7	1275
1533	8	1276
1534	6	1277
1535	8	1278
1536	9	1279
1537	9	1280
1538	9	1281
1539	10	1282
1540	10	1283
1541	10	1284
1542	8	1285
1543	9	1286
1544	9	1287
1545	6	1288
1546	8	1289
1547	6	1290
1548	8	1291
1549	9	1292
1550	6	1293
1551	10	1294
1552	8	1295
1553	10	1296
1554	10	1297
1555	8	1298
1556	10	1299
1557	8	1300
1558	8	1301
1559	8	1302
1560	10	1303
1561	8	1304
1562	10	1305
1563	9	1306
1564	8	1307
1565	7	1308
1566	7	1309
1567	9	1310
1568	9	1311
1569	9	1312
1570	7	1313
1571	8	1314
1572	9	1315
1573	9	1316
1574	9	1317
1575	10	1318
1576	10	1319
1577	9	1320
1578	6	1321
1579	9	1322
1580	6	1323
1581	9	1324
1582	8	1325
1583	8	1326
1584	9	1327
1585	5	1328
1586	8	1329
1587	10	1330
1588	10	1331
1589	10	1332
1590	4	1333
1591	9	1334
1592	8	1335
1593	6	1336
1594	9	1337
1595	7	1338
1596	7	1339
1597	5	1340
1598	6	1341
1599	9	1342
1600	6	1343
1601	7	1344
1602	10	1345
1603	7	1346
1604	7	1347
1605	8	1348
1606	8	1349
1607	1	1350
1608	9	1351
1609	6	1352
1610	6	1353
1611	7	1354
1612	9	1355
1613	8	1356
1614	10	1357
1615	10	1358
1616	10	1359
1617	10	1360
1618	7	1361
1619	9	1362
1620	7	1363
1621	8	1364
1622	7	1365
1623	7	1366
1624	7	1367
1625	7	1368
1626	6	1369
1627	9	1370
1628	8	1371
1629	10	1372
1630	9	1373
1631	8	1374
1632	5	1375
1633	7	1376
1634	5	1377
1635	9	1378
1636	7	1379
1637	8	1380
1638	9	1381
1639	8	1382
1640	9	1383
1641	7	1384
1642	8	1385
1643	9	1386
1644	9	1387
1645	10	1388
1646	8	1389
1647	7	1390
1648	8	1391
1649	10	1392
1650	9	1393
1651	10	1394
1652	10	1395
1653	8	1396
1654	1	1397
1655	8	1398
1656	10	1399
1657	8	1400
1658	9	1401
1659	10	1402
1660	9	1403
1661	6	1404
1662	10	1405
1663	8	1406
1664	7	1407
1665	4	1408
1666	8	1409
1667	8	1410
1668	8	1411
1669	9	1412
1670	7	1413
1671	9	1414
1672	10	1415
1673	7	1416
1674	9	1417
1675	8	1418
1676	10	1419
1677	8	1420
1678	9	1421
1679	5	1422
1680	9	1423
1681	7	1424
1682	7	1425
1683	6	1426
1684	8	1427
1685	9	1428
1686	10	1429
1687	6	1430
1688	8	1431
1689	7	1432
1690	8	1433
1691	9	1434
1692	7	1435
1693	8	1436
1694	8	1437
1695	7	1438
1696	7	1439
1697	9	1440
1698	8	1441
1699	8	1442
1700	8	1443
1701	9	1444
1702	9	1445
1703	9	1446
1704	9	1447
1705	9	1448
1706	9	1449
1707	9	1450
1708	9	1451
1709	9	1452
1710	9	1453
1711	8	1454
1712	10	1455
1713	8	1456
1714	7	1457
1715	9	1458
1716	9	1459
1717	8	1460
1718	10	1461
1719	6	1462
1720	8	1463
1721	10	1464
1722	1	1465
1723	9	1466
1724	6	1467
1725	9	1468
1726	10	1469
1727	7	1470
1728	7	1471
1729	8	1472
1730	7	1473
1731	8	1474
1732	8	1475
1733	8	1476
1734	10	1477
1735	9	1478
1736	9	1479
1737	10	1480
1738	9	1481
1739	10	1482
1740	6	1483
1741	7	1484
1742	10	1485
1743	8	1486
1744	7	1487
1745	3	1488
1746	7	1489
1747	7	1490
1748	8	1491
1749	7	1492
1750	9	1493
1751	9	1494
1752	10	1495
1753	4	1496
1754	7	1497
1755	9	1498
1756	9	1499
1757	10	1500
1758	8	1501
1759	9	1502
1760	8	1503
1761	5	1504
1762	8	1505
1763	7	1506
1764	8	1507
1765	8	1508
1766	9	1509
1767	9	1510
1768	8	1511
1769	9	1512
1770	9	1513
1771	6	1514
1772	6	1515
1773	8	1516
1774	8	1517
1775	7	1518
1776	9	1519
1777	9	1520
1778	8	1521
1779	8	1522
1780	10	1523
1781	9	1524
1782	9	1525
1783	10	1526
1784	9	1527
1785	8	1528
1786	10	1529
1787	8	1530
1788	9	1531
1789	10	1532
1790	6	1533
1791	9	1534
1792	8	1535
1793	8	1536
1794	9	1537
1795	9	1538
1796	10	1539
1797	8	1540
1798	10	1541
1799	9	1542
1800	8	1543
1801	10	1544
1802	10	1545
1803	7	1546
1804	9	1547
1805	9	1548
1806	8	1549
1807	8	1550
1808	9	1551
1809	9	1552
1810	7	1553
1811	7	1554
1812	9	1555
1813	9	1556
1814	10	1557
1815	8	1558
1816	9	1559
1817	6	1560
1818	8	1561
1819	6	1562
1820	10	1563
1821	9	1564
1822	8	1565
1823	6	1566
1824	10	1567
1825	4	1568
1826	9	1569
1827	8	1570
1828	10	1571
1829	9	1572
1830	8	1573
1831	9	1574
1832	7	1575
1833	10	1576
1834	9	1577
1835	8	1578
1836	10	1579
1837	6	1580
1838	7	1581
1839	7	1582
1840	7	1583
1841	6	1584
1842	5	1585
1843	9	1586
1844	9	1587
1845	8	1588
1846	10	1589
1847	7	1590
1848	9	1591
1849	10	1592
1850	8	1593
1851	3	1594
1852	10	1595
1853	9	1596
1854	9	1597
1855	8	1598
1856	10	1599
1857	9	1600
1858	7	1601
1859	8	1602
1860	8	1603
1861	10	1604
1862	7	1605
1863	9	1606
1864	10	1607
1865	8	1608
1866	9	1609
1867	9	1610
1868	7	1611
1869	9	1612
1870	10	1613
1871	8	1614
1872	9	1615
1873	8	1616
1874	8	1617
1875	9	1618
1876	8	1619
1877	9	1620
1878	7	1621
1879	7	1622
1880	8	1623
1881	7	1624
1882	8	1625
1883	9	1626
1884	9	1627
1885	9	1628
1886	9	1629
1887	7	1630
1888	6	1631
1889	10	1632
1890	6	1633
1891	9	1634
1892	10	1635
1893	9	1636
1894	9	1637
1895	8	1638
1896	8	1639
1897	6	1640
1898	9	1641
1899	7	1642
1900	9	1643
1901	8	1644
1902	9	1645
1903	8	1646
1904	8	1647
1905	8	1648
1906	9	1649
1907	9	1650
1908	9	1651
1909	6	1652
1910	7	1653
1911	9	1654
1912	10	1655
1913	9	1656
1914	5	1657
1915	5	1658
1916	5	1659
1917	9	1660
1918	9	1661
1919	7	1662
1920	9	1663
1921	9	1664
1922	8	1665
1923	8	1666
1924	9	1667
1925	8	1668
1926	8	1669
1927	8	1670
1928	8	1671
1929	9	1672
1930	9	1673
1931	9	1674
1932	7	1675
1933	9	1676
1934	8	1677
1935	8	1678
1936	4	1679
1937	8	1680
1938	8	1681
1939	8	1682
1940	6	1683
1941	9	1684
1942	5	1685
1943	7	1686
1944	8	1687
1945	8	1688
1946	8	1689
1947	10	1690
1948	9	1691
1949	8	1692
1950	7	1693
1951	9	1694
1952	9	1695
1953	8	1696
1954	6	1697
1955	8	1698
1956	9	1699
1957	6	1700
1958	6	1701
1959	7	1702
1960	9	1703
1961	6	1704
1962	4	1705
1963	9	1706
1964	10	1707
1965	7	1708
\.


--
-- TOC entry 2446 (class 0 OID 0)
-- Dependencies: 202
-- Name: home_hospitality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('home_hospitality_id_seq', 39, true);


--
-- TOC entry 2447 (class 0 OID 0)
-- Dependencies: 203
-- Name: home_hospitality_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('home_hospitality_report_id_seq', 1, false);


--
-- TOC entry 2358 (class 0 OID 26924)
-- Dependencies: 204
-- Data for Name: kick_off; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kick_off (id, report_id, late, how_late, fault) FROM stdin;
1142	1143	f	\N	\N
1143	1144	f	\N	\N
1144	1145	f	\N	\N
1145	1146	f	\N	\N
1146	1147	f	\N	\N
1147	1148	f	\N	\N
1148	1149	f	\N	\N
1149	1150	f	\N	\N
1150	1151	f	\N	\N
1151	1152	f	\N	\N
1152	1153	t	15 minutes	Away
1153	1154	f	\N	\N
1154	1155	f	\N	\N
1155	1156	f	\N	\N
1156	1157	f	\N	\N
1157	1158	f	\N	\N
1158	1159	f	\N	\N
1159	1160	f	\N	\N
1160	1161	f	\N	\N
1161	1162	t	10 min	Both
1162	1163	f	\N	\N
1163	1164	f	\N	\N
1164	1165	f	\N	\N
1165	1166	f	\N	\N
1166	1167	f	\N	\N
1167	1168	f	\N	\N
1168	1169	f	\N	\N
1169	1170	f	\N	\N
1170	1171	f	\N	\N
1171	1172	f	\N	\N
1172	1173	f	\N	\N
1173	1174	f	\N	\N
1174	1175	f	\N	\N
1175	1176	f	\N	\N
1176	1177	f	\N	\N
1177	1178	f	\N	\N
1178	1179	t	15 minutes	Home
1179	1180	f	\N	\N
1180	1181	t	35mins due to me having traffic problems on the M60	\N
1181	1182	f	\N	\N
1182	1183	f	\N	\N
1183	1184	f	\N	\N
1184	1185	t	10 min	Away
1185	1186	f	\N	\N
1186	1187	f	\N	\N
1187	1188	f	\N	\N
1188	1189	f	\N	\N
1189	1190	f	\N	\N
1190	1191	f	\N	\N
1191	1192	f	\N	\N
1192	1193	f	\N	\N
1193	1194	f	\N	\N
1194	1195	f	\N	\N
1195	1196	f	\N	\N
1196	1197	f	\N	\N
1197	1198	f	\N	\N
1198	1199	f	\N	\N
1199	1200	f	\N	\N
1200	1201	f	\N	\N
1201	1202	f	\N	\N
1202	1203	f	\N	\N
1203	1204	f	\N	\N
1204	1205	f	\N	\N
1205	1206	f	\N	\N
1206	1207	f	\N	\N
1207	1208	f	\N	\N
1208	1209	f	\N	\N
1209	1210	f	\N	\N
1210	1211	f	\N	\N
1211	1212	f	\N	\N
1212	1213	f	\N	\N
1213	1214	f	\N	\N
1214	1215	f	\N	\N
1215	1216	f	\N	\N
1216	1217	t	8 minutes	Away
1217	1218	f	\N	\N
1218	1219	f	\N	\N
1219	1220	f	\N	\N
1220	1221	f	\N	\N
1221	1222	f	\N	\N
1222	1223	f	\N	\N
1223	1224	f	\N	\N
1224	1225	f	\N	\N
1225	1226	f	\N	\N
1226	1227	f	\N	\N
1227	1228	f	\N	\N
1228	1229	f	\N	\N
1229	1230	f	\N	\N
1230	1231	f	\N	\N
1231	1232	f	\N	\N
1232	1233	f	\N	\N
1233	1234	f	\N	\N
1234	1235	f	\N	\N
1235	1236	f	\N	\N
1236	1237	f	\N	\N
1237	1238	f	\N	\N
1238	1239	f	\N	\N
1239	1240	f	\N	\N
1240	1241	f	\N	\N
1241	1242	f	\N	\N
1242	1243	f	\N	\N
1243	1244	f	\N	\N
1244	1245	f	\N	\N
1245	1246	f	\N	\N
1246	1247	f	\N	\N
1247	1248	f	\N	\N
1248	1249	f	\N	\N
1249	1250	f	\N	\N
1250	1251	f	\N	\N
1251	1252	f	\N	\N
1252	1253	f	\N	\N
1253	1254	f	n/a	\N
1254	1255	f	\N	\N
1255	1256	f	\N	\N
1256	1257	f	\N	\N
1257	1258	f	\N	\N
1258	1259	f	\N	\N
1259	1260	f	\N	\N
1260	1261	f	\N	\N
1261	1262	f	\N	\N
1262	1263	f	\N	\N
1263	1264	f	\N	\N
1264	1265	f	\N	\N
1265	1266	f	\N	\N
1266	1267	f	\N	\N
1267	1268	f	\N	\N
1268	1269	f	\N	\N
1269	1270	f	\N	\N
1270	1271	f	Game kicked off 5 minutes early at the request of both teams	\N
1271	1272	f	\N	\N
1272	1273	f	\N	\N
1273	1274	f	\N	\N
1274	1275	f	\N	\N
1275	1276	f	\N	\N
1276	1277	f	\N	\N
1277	1278	f	\N	\N
1278	1279	f	\N	\N
1279	1280	f	\N	\N
1280	1281	f	\N	\N
1281	1282	t	13.0	Home
1282	1283	f	\N	\N
1283	1284	f	\N	\N
1284	1285	f	\N	\N
1285	1286	f	\N	\N
1286	1287	f	\N	\N
1287	1288	f	\N	\N
1288	1289	f	\N	\N
1289	1290	f	\N	\N
1290	1291	f	\N	\N
1291	1292	f	\N	\N
1292	1293	f	\N	\N
1293	1294	f	\N	\N
1294	1295	f	\N	\N
1295	1296	f	\N	\N
1296	1297	f	\N	\N
1297	1298	f	\N	\N
1298	1299	f	\N	\N
1299	1300	f	\N	\N
1300	1301	f	\N	\N
1301	1302	f	\N	\N
1302	1303	f	\N	\N
1303	1304	f	\N	\N
1304	1305	f	\N	\N
1305	1306	f	\N	\N
1306	1307	f	\N	\N
1307	1308	f	\N	\N
1308	1309	f	\N	\N
1309	1310	f	\N	\N
1310	1311	f	\N	\N
1311	1312	f	\N	\N
1312	1313	f	\N	\N
1313	1314	f	\N	\N
1314	1315	f	\N	\N
1315	1316	f	\N	\N
1316	1317	f	\N	\N
1317	1318	f	\N	\N
1318	1319	f	\N	\N
1319	1320	f	\N	\N
1320	1321	f	\N	\N
1321	1322	f	\N	\N
1322	1323	f	\N	\N
1323	1324	f	\N	\N
1324	1325	f	\N	\N
1325	1326	f	\N	\N
1326	1327	f	\N	\N
1327	1328	f	\N	\N
1328	1329	f	\N	\N
1329	1330	f	\N	\N
1330	1331	f	\N	\N
1331	1332	f	\N	\N
1332	1333	f	\N	\N
1333	1334	f	\N	\N
1334	1335	f	\N	\N
1335	1336	f	\N	\N
1336	1337	f	\N	\N
1337	1338	f	\N	\N
1338	1339	f	\N	\N
1339	1340	f	\N	\N
1340	1341	f	\N	\N
1341	1342	f	\N	\N
1342	1343	f	\N	\N
1343	1344	f	\N	\N
1344	1345	f	\N	\N
1345	1346	f	\N	\N
1346	1347	f	\N	\N
1347	1348	f	\N	\N
1348	1349	f	\N	\N
1349	1350	f	\N	\N
1350	1351	f	\N	\N
1351	1352	f	\N	\N
1352	1353	f	\N	\N
1353	1354	f	\N	\N
1354	1355	f	\N	\N
1355	1356	f	\N	\N
1356	1357	f	\N	\N
1357	1358	f	\N	\N
1358	1359	f	\N	\N
1359	1360	f	\N	\N
1360	1361	f	\N	\N
1361	1362	t	10 minutes	Away
1362	1363	f	\N	\N
1363	1364	f	\N	\N
1364	1365	f	\N	\N
1365	1366	f	\N	\N
1366	1367	f	\N	\N
1367	1368	f	\N	\N
1368	1369	f	\N	\N
1369	1370	f	\N	\N
1370	1371	f	\N	\N
1371	1372	f	\N	\N
1372	1373	f	\N	\N
1373	1374	t	5 minutes	Home
1374	1375	f	\N	\N
1375	1376	t	5 mins	Away
1376	1377	f	\N	\N
1377	1378	f	\N	\N
1378	1379	f	\N	\N
1379	1380	f	\N	\N
1380	1381	f	\N	\N
1381	1382	f	\N	\N
1382	1383	f	\N	\N
1383	1384	f	\N	\N
1384	1385	f	\N	\N
1385	1386	f	\N	\N
1386	1387	f	\N	\N
1387	1388	f	\N	\N
1388	1389	f	\N	\N
1389	1390	f	\N	\N
1390	1391	f	\N	\N
1391	1392	f	\N	\N
1392	1393	f	\N	\N
1393	1394	f	\N	\N
1394	1395	f	\N	\N
1395	1396	f	\N	\N
1396	1397	f	\N	\N
1397	1398	f	\N	\N
1398	1399	t	15 min	Away
1399	1400	f	\N	\N
1400	1401	f	\N	\N
1401	1402	f	\N	\N
1402	1403	f	\N	\N
1403	1404	f	\N	\N
1404	1405	f	\N	\N
1405	1406	f	\N	\N
1406	1407	f	\N	\N
1407	1408	f	\N	\N
1408	1409	f	\N	\N
1409	1410	f	\N	\N
1410	1411	f	\N	\N
1411	1412	f	\N	\N
1412	1413	f	\N	\N
1413	1414	f	\N	\N
1414	1415	f	\N	\N
1415	1416	f	\N	\N
1416	1417	f	\N	\N
1417	1418	f	\N	\N
1418	1419	f	\N	\N
1419	1420	f	\N	\N
1420	1421	f	\N	\N
1421	1422	f	\N	\N
1422	1423	f	\N	\N
1423	1424	f	\N	\N
1424	1425	f	\N	\N
1425	1426	f	\N	\N
1426	1427	f	\N	\N
1427	1428	f	\N	\N
1428	1429	f	\N	\N
1429	1430	f	\N	\N
1430	1431	f	\N	\N
1431	1432	f	\N	\N
1432	1433	f	\N	\N
1433	1434	f	\N	\N
1434	1435	f	\N	\N
1435	1436	f	\N	\N
1436	1437	f	\N	\N
1437	1438	f	\N	\N
1438	1439	f	\N	\N
1439	1440	f	\N	\N
1440	1441	f	\N	\N
1441	1442	f	\N	\N
1442	1443	f	\N	\N
1443	1444	f	\N	\N
1444	1445	f	\N	\N
1445	1446	f	\N	\N
1446	1447	f	\N	\N
1447	1448	f	\N	\N
1448	1449	f	\N	\N
1449	1450	f	\N	\N
1450	1451	f	\N	\N
1451	1452	f	\N	\N
1452	1453	f	\N	\N
1453	1454	f	\N	\N
1454	1455	f	\N	\N
1455	1456	f	\N	\N
1456	1457	f	\N	\N
1457	1458	f	\N	\N
1458	1459	f	\N	\N
1459	1460	f	\N	\N
1460	1461	f	\N	\N
1461	1462	f	\N	\N
1462	1463	f	\N	\N
1463	1464	f	\N	\N
1464	1465	f	\N	\N
1465	1466	f	\N	\N
1466	1467	f	\N	\N
1467	1468	f	\N	\N
1468	1469	f	\N	\N
1469	1470	f	\N	\N
1470	1471	f	\N	\N
1471	1472	f	\N	\N
1472	1473	f	\N	\N
1473	1474	f	\N	\N
1474	1475	f	\N	\N
1475	1476	f	\N	\N
1476	1477	f	\N	\N
1477	1478	f	\N	\N
1478	1479	f	\N	\N
1479	1480	f	\N	\N
1480	1481	f	\N	\N
1481	1482	f	\N	\N
1482	1483	f	\N	\N
1483	1484	f	\N	\N
1484	1485	f	\N	\N
1485	1486	f	\N	\N
1486	1487	f	\N	\N
1487	1488	f	\N	\N
1488	1489	f	\N	\N
1489	1490	f	\N	\N
1490	1491	f	\N	\N
1491	1492	f	\N	\N
1492	1493	f	\N	\N
1493	1494	f	\N	\N
1494	1495	f	\N	\N
1495	1496	f	\N	\N
1496	1497	f	\N	\N
1497	1498	f	\N	\N
1498	1499	f	\N	\N
1499	1500	f	\N	\N
1500	1501	f	\N	\N
1501	1502	f	\N	\N
1502	1503	f	\N	\N
1503	1504	f	\N	\N
1504	1505	f	\N	\N
1505	1506	f	\N	\N
1506	1507	f	\N	\N
1507	1508	f	\N	\N
1508	1509	f	\N	\N
1509	1510	f	\N	\N
1510	1511	f	\N	\N
1511	1512	f	\N	\N
1512	1513	f	\N	\N
1513	1514	f	\N	\N
1514	1515	f	\N	\N
1515	1516	f	\N	\N
1516	1517	f	\N	\N
1517	1518	f	\N	\N
1518	1519	f	\N	\N
1519	1520	f	\N	\N
1520	1521	f	\N	\N
1521	1522	f	\N	\N
1522	1523	f	\N	\N
1523	1524	f	\N	\N
1524	1525	f	\N	\N
1525	1526	f	\N	\N
1526	1527	f	\N	\N
1527	1528	f	\N	\N
1528	1529	f	\N	\N
1529	1530	f	\N	\N
1530	1531	f	\N	\N
1531	1532	f	\N	\N
1532	1533	f	\N	\N
1533	1534	f	\N	\N
1534	1535	t	7 minutes	Away
1535	1536	f	\N	\N
1536	1537	f	\N	\N
1537	1538	f	\N	\N
1538	1539	f	\N	\N
1539	1540	f	\N	\N
1540	1541	f	\N	\N
1541	1542	f	\N	\N
1542	1543	f	\N	\N
1543	1544	f	\N	\N
1544	1545	f	\N	\N
1545	1546	f	\N	\N
1546	1547	f	\N	\N
1547	1548	f	\N	\N
1548	1549	f	\N	\N
1549	1550	f	\N	\N
1550	1551	f	\N	\N
1551	1552	f	\N	\N
1552	1553	f	\N	\N
1553	1554	f	\N	\N
1554	1555	f	\N	\N
1555	1556	f	\N	\N
1556	1557	f	\N	\N
1557	1558	f	\N	\N
1558	1559	f	\N	\N
1559	1560	f	\N	\N
1560	1561	f	\N	\N
1561	1562	f	\N	\N
1562	1563	f	\N	\N
1563	1564	f	\N	\N
1564	1565	f	\N	\N
1565	1566	f	\N	\N
1566	1567	f	\N	\N
1567	1568	f	\N	\N
1568	1569	f	\N	\N
1569	1570	f	\N	\N
1570	1571	f	\N	\N
1571	1572	f	\N	\N
1572	1573	f	\N	\N
1573	1574	f	\N	\N
1574	1575	f	\N	\N
1575	1576	f	\N	\N
1576	1577	f	\N	\N
1577	1578	f	\N	\N
1578	1579	f	\N	\N
1579	1580	f	\N	\N
1580	1581	f	\N	\N
1581	1582	f	\N	\N
1582	1583	f	\N	\N
1583	1584	f	\N	\N
1584	1585	f	\N	\N
1585	1586	f	\N	\N
1586	1587	f	\N	\N
1587	1588	f	\N	\N
1588	1589	f	\N	\N
1589	1590	f	\N	\N
1590	1591	f	\N	\N
1591	1592	f	\N	\N
1592	1593	f	\N	\N
1593	1594	f	\N	\N
1594	1595	f	\N	\N
1595	1596	f	\N	\N
1596	1597	f	\N	\N
1597	1598	f	\N	\N
1598	1599	f	\N	\N
1599	1600	f	\N	\N
1600	1601	f	\N	\N
1601	1602	f	\N	\N
1602	1603	f	\N	\N
1603	1604	f	\N	\N
1604	1605	f	\N	\N
1605	1606	f	\N	\N
1606	1607	f	\N	\N
1607	1608	f	\N	\N
1608	1609	f	\N	\N
1609	1610	f	\N	\N
1610	1611	t	ten minutes late	Away
1611	1612	f	\N	\N
1612	1613	f	\N	\N
1613	1614	t	15 minutes	\N
1614	1615	f	\N	\N
1615	1616	f	\N	\N
1616	1617	f	\N	\N
1617	1618	f	\N	\N
1618	1619	f	\N	\N
1619	1620	f	\N	\N
1620	1621	f	\N	\N
1621	1622	f	\N	\N
1622	1623	f	\N	\N
1623	1624	f	\N	\N
1624	1625	f	\N	\N
1625	1626	f	\N	\N
1626	1627	f	\N	\N
1627	1628	f	\N	\N
1628	1629	f	\N	\N
1629	1630	f	\N	\N
1630	1631	f	\N	\N
1631	1632	f	\N	\N
1632	1633	f	\N	\N
1633	1634	f	\N	\N
1634	1635	f	\N	\N
1635	1636	f	\N	\N
1636	1637	f	\N	\N
1637	1638	f	\N	\N
1638	1639	f	\N	\N
1639	1640	f	\N	\N
1640	1641	f	\N	\N
1641	1642	f	\N	\N
1642	1643	f	\N	\N
1643	1644	f	\N	\N
1644	1645	f	\N	\N
1645	1646	f	\N	\N
1646	1647	f	\N	\N
1647	1648	f	\N	\N
1648	1649	f	\N	\N
1649	1650	f	\N	\N
1650	1651	f	\N	\N
1651	1652	f	\N	\N
1652	1653	f	\N	\N
1653	1654	f	\N	\N
1654	1655	f	\N	\N
1655	1656	f	\N	\N
1656	1657	f	\N	\N
1657	1658	f	\N	\N
1658	1659	f	\N	\N
1659	1660	f	\N	\N
1660	1661	f	\N	\N
1661	1662	f	\N	\N
1662	1663	f	\N	\N
1663	1664	f	\N	\N
1664	1665	f	\N	\N
1665	1666	f	\N	\N
1666	1667	f	\N	\N
1667	1668	f	\N	\N
1668	1669	f	\N	\N
1669	1670	f	\N	\N
1670	1671	f	\N	\N
1671	1672	f	\N	\N
1672	1673	f	\N	\N
1673	1674	f	\N	\N
1674	1675	f	\N	\N
1675	1676	f	\N	\N
1676	1677	f	\N	\N
1677	1678	f	\N	\N
1678	1679	f	\N	\N
1679	1680	f	\N	\N
1680	1681	f	\N	\N
1681	1682	f	\N	\N
1682	1683	f	\N	\N
1683	1684	f	\N	\N
1684	1685	f	\N	\N
1685	1686	f	\N	\N
1686	1687	f	\N	\N
1687	1688	f	\N	\N
1688	1689	f	\N	\N
1689	1690	f	\N	\N
1690	1691	f	\N	\N
1691	1692	f	\N	\N
1692	1693	f	\N	\N
1693	1694	f	\N	\N
1694	1695	f	\N	\N
1695	1696	f	\N	\N
1696	1697	f	\N	\N
1697	1698	f	\N	\N
1698	1699	f	\N	\N
1699	1700	f	\N	\N
1700	1701	f	\N	\N
1701	1702	f	\N	\N
1702	1703	f	\N	\N
1703	1704	f	\N	\N
1704	1705	f	\N	\N
1705	1706	f	\N	\N
1706	1707	f	\N	\N
1707	1708	f	\N	\N
\.


--
-- TOC entry 2448 (class 0 OID 0)
-- Dependencies: 205
-- Name: late_kick_off_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('late_kick_off_id_seq', 1707, true);


--
-- TOC entry 2449 (class 0 OID 0)
-- Dependencies: 206
-- Name: late_kick_off_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('late_kick_off_report_id_seq', 1, false);


--
-- TOC entry 2361 (class 0 OID 26934)
-- Dependencies: 207
-- Data for Name: league; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY league (id, name) FROM stdin;
2	Huddersfield & District Association Football League
3	Huddersfield & District Works & Combination League
4	Kirklees Sunday League
5	Cup Competition
\.


--
-- TOC entry 2450 (class 0 OID 0)
-- Dependencies: 208
-- Name: league_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('league_id_seq', 5, true);


--
-- TOC entry 2363 (class 0 OID 26939)
-- Dependencies: 209
-- Data for Name: overall_score; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY overall_score (id, report_id, home_score, away_score, comment) FROM stdin;
1142	1143	10	10	An excellent first game of the season. A thrilling 3-3 draw with two late goals
1143	1144	9	9	Excellent game played in the right spirit.
1144	1145	9	9	Generally there was a good game, there was no need to show any yellow or red cards.
1145	1146	7	7	\N
1146	1147	6	8	A good pyhsical game of football on a mild wet evening.  Both teams played some good football at times but too often spoiled by a niggly game.  Holmbridge a bit whinging whereas Diggle wanted to get on and playing the physical game. 
1147	1148	3	5	\N
1148	1149	7	8	\N
1149	1150	7	7	Usual Linthwaite pitch had no lines on the pitch. Luckily the adjacent pitch did not have a game on it. There was only 3 corner flags provided as well.
1150	1151	8	8	Very nice welcoming from Harry as always at Flockton - Changing facilities not ideal but tried there best. Both Teams tried in a hard fought game 
1151	1152	9	9	A good pyhsical game of football on a mild evening.  Both teams played some reasonable football. at times but too often spoiled by a niggly game.  Both Teams showed good Respect and sportsmanship.  A pleasure to Referee.
1152	1153	9	9	Played in great spirit.
1153	1154	9	8	\N
1154	1155	8	8	Excellent game of football and great respect from both clubs 
1155	1156	9	7	\N
1156	1157	9	9	\N
1157	1158	8	7	\N
1158	1159	8	7	please change moorside home ground to clayton playing fields oldham both teams
1159	1160	8	8	\N
1160	1161	8	9	What a cracking game. Well done both sides.
1161	1162	5	8	Asked Thornhill Spectator to leave the vasinity of the field of play
1162	1163	9	9	\N
1163	1164	9	9	\N
1164	1165	10	10	\N
1165	1166	8	6	\N
1166	1167	8	7	\N
1167	1168	9	8	\N
1168	1169	9	8	\N
1169	1170	9	8	\N
1170	1171	10	10	\N
1171	1172	9	9	very good match, two penalties for the away team, one yellow card.
1172	1173	8	8	A good pyhsical game of football on a mild evening.  Although rather niggly at stages both Teams showed reasonable Respect and sportsmanship.
1173	1174	8	7	\N
1174	1175	8	9	\N
1175	1176	4	8	too much complaining from home team who won game
1176	1177	8	7	\N
1177	1178	5	5	Poor attitude from spectators
1178	1179	5	8	Too much dissent from home team to score highly in Respect. As always some good lads too. Away ok but one or two wanting to debate decisions but more controlled.
1179	1180	9	8	\N
1180	1181	9	9	Due to late start only played 40mins each way.
1181	1182	8	9	great start to season on 2nd day back from hols. very hard but fair game. two very good teams. please thank both sides for sporting "touch lines"! 
1182	1183	8	9	Generally the game was easy to do, there was no need to show any yellow or red cards.
1183	1184	7	3	A crazy game on a fabulous pitch. 6 cautions and lots of issues. Is there anywhere in the Handbook that says referees arn't allowed to enjoy the game!
1184	1185	10	8	\N
1185	1186	9	8	good game, good competative game
1186	1187	9	7	\N
1187	1188	8	7	A good pyhsical game of football on a mild evening.  Although rather niggly at stages both Teams showed reasonable Respect and sportsmanship.
1188	1189	9	9	\N
1189	1190	8	8	No problems of any significance.
1190	1191	9	9	\N
1191	1192	10	7	away club only had 11 players and "sports" ran the line for them. at half time several spectators turned up and started shouting "thats a foul and bloody hell a mile offside and every corner was theirs". spoilt what was a good game with the away side not deserving of a 5.1 score line. my regards to senior players on their team, but the young players need to "grow up" and soon !
1192	1193	10	10	Both captains were a pleasure to work. Also everyone showed so much respect towards me not one bit of dissent at all
1193	1194	8	8	\N
1194	1195	7	9	\N
1195	1196	9	5	home team fine but the away team wanted to question most decisions or non decisions all game.
1196	1197	8	8	Good game
1197	1198	8	3	Not happy about being asked by a number of Newsome players if I was sending reports in . Will have to deal with this if it happens again. Otherwise a good game .
1198	1199	9	9	Pitch in excellent condition. Generally a well disciplined performance from both sides with only 2 cautions.
1199	1200	7	7	No problems.
1200	1201	10	1	\N
1201	1202	8	7	\N
1202	1203	8	9	good game, competition difficult to keep, many fouls, four yellow cards
1203	1204	8	8	\N
1204	1205	8	8	\N
1205	1206	9	9	Overall a quite good game played in a generally good sporting way with little dissent.
1206	1207	8	8	\N
1207	1208	9	8	\N
1208	1209	8	9	\N
1209	1210	10	10	Excellent hospitality from hade edge. Harry from Flockton was as friendly and helpful as ever
1210	1211	6	8	\N
1211	1212	8	6	\N
1212	1213	9	6	\N
1213	1214	9	8	\N
1214	1215	10	10	\N
1215	1216	7	10	\N
1216	1217	10	9	\N
1217	1218	9	9	\N
1218	1219	8	8	good game. 1.1 score and about right! got a telling off for playing a minute short in second half.!! by away side! no problems at all with players on field. Thanks for game.
1219	1220	8	8	\N
1220	1221	10	9	\N
1221	1222	8	7	\N
1222	1223	10	10	\N
1223	1224	9	9	good from both teams for first game of season no complaints
1224	1225	9	9	\N
1225	1226	8	8	Great game
1226	1227	9	9	A good pyhsical game of football on a mild but showery day.  Although rather niggly at stages both Teams showed good Respect and sportsmanship.  A pleasure to Referee.
1227	1228	8	7	Holmbridge a bit gobby, need to learn to pipe down
1228	1229	10	8	Generally the game was easy to do, there was no need to show any yellow or red cards.
1330	1331	7	9	tough local derby.home team wound up due to silly remarks by touchline. 
1521	1522	8	9	late appointment fews hours, i made contact with clubs as it was late change of referee
1229	1230	4	8	Cartworth Moor players displayed acceptable Respect behaviour throughout. Their management caused the aforementioned issues with the Assistant Referee and at both half time and full time conducted very loud team talks that everyone outside (half time) or in the changing room block (full time) could hear, bemoaning referee performance. In my opinion this did little to encourage a respectful atmosphere. 
1230	1231	8	8	\N
1231	1232	9	9	\N
1232	1233	8	8	\N
1233	1234	9	6	Away wanted to debate and question too much.
1234	1235	10	9	\N
1235	1236	6	8	\N
1236	1237	9	9	\N
1237	1238	8	9	On numerous occasions it took a long time for the ball to be returned from the trees/bushes. Home club said the players kept kicking it too far. 
1238	1239	9	9	\N
1239	1240	10	10	\N
1240	1241	10	10	\N
1241	1242	9	9	\N
1242	1243	9	8	\N
1243	1244	6	8	\N
1244	1245	7	8	Nice contested game of football in a derby - pleasure to referee
1245	1246	9	9	I would gladly ref both these teams all year. not a problem at all.My thanks and good luck to both teams.
1246	1247	9	8	\N
1247	1248	10	10	\N
1248	1249	7	8	\N
1249	1250	10	10	\N
1250	1251	10	10	\N
1251	1252	7	7	game played in a good spirit,enjoyable.
1252	1253	8	8	\N
1253	1254	9	8	\N
1254	1255	7	8	Referee shower area at Longfield Ave needs some attention , pretty grotty . 
1255	1256	7	8	someone forgot to turn showers on so cold shower game ok just one yellow for dissent
1256	1257	7	9	no problems good game to referee
1257	1258	1	9	very poor respect from home team 2 cautions for dissent to home team, 
1258	1259	9	8	\N
1259	1260	9	9	game was how it should be played no bad tackles no dissent 
1260	1261	10	8	\N
1261	1262	8	6	\N
1262	1263	8	8	\N
1263	1264	9	6	\N
1264	1265	7	8	new ground but only faults was the markings were only just visable
1265	1266	9	8	a good game, penalty kick for away team (not shot), without yellow and red cards
1266	1267	7	7	\N
1267	1268	8	8	\N
1268	1269	6	9	\N
1269	1270	9	8	\N
1270	1271	10	9	A gtreat game played in excellent sporting spirit. No drama, no cards, with both sides only interested in their own game. Slaithwaite dereved the 2-5 victory with some good passing & possession football.
1271	1272	8	7	A good pyhsical game of football on a mild day.  Although rather niggly at stages both Teams showed reasonable Respect and sportsmanship especially HV Academicals. 
1272	1273	10	10	\N
1273	1274	9	9	\N
1274	1275	8	8	\N
1275	1276	8	8	\N
1276	1277	7	7	\N
1277	1278	8	8	\N
1278	1279	9	9	\N
1279	1280	9	8	\N
1280	1281	8	8	a good competitive res 1 fixtute with no discipline probs 
1281	1282	7	8	the quality of sunday football leaves a lot to be desired
1282	1283	10	9	\N
1283	1284	9	8	What a bloody hard and "full on" game that was. good football and solid tackles made for an exciting and hard game. thanks to both teams and managers from me.
1284	1285	8	9	\N
1285	1286	8	7	\N
1286	1287	10	9	\N
1287	1288	6	6	\N
1288	1289	9	9	Generally there was a good game, there was no need to show any yellow or red cards.
1289	1290	6	9	\N
1290	1291	8	9	An excellent competitive game.
1291	1292	8	9	A good pyhsical game of football on a mild afternoon.  Although rather niggly at stages both Teams showed good Respect and sportsmanship.  A pleasure to Referee.
1292	1293	8	8	\N
1293	1294	10	9	\N
1294	1295	8	6	\N
1295	1296	10	10	Both teams played some excellent football with Heyside having most of the possession & chances. They should have scored 2 goals in the 1st half but failed to capitalise. The Sheeley keeper had a very good game with 2 excellent stops in the 2nd half. It ended 1-1 with 1 caution on either side. special thanks to the home officials who looked after me throughout my visit. 
1296	1297	9	7	\N
1297	1298	8	8	\N
1298	1299	9	7	\N
1299	1300	8	1	\N
1300	1301	9	7	\N
1301	1302	7	8	\N
1302	1303	10	10	\N
1303	1304	8	7	\N
1304	1305	7	8	Very good game, enjoyed the challenge.
1305	1306	9	8	\N
1306	1307	9	7	\N
1307	1308	6	4	Constant challenging of refereeing decisions by away club
1308	1309	7	7	\N
1309	1310	9	9	pity its not like this every week
1310	1311	9	8	a one sided affair as expected and no probs on the day
1311	1312	9	9	nothing amiss at all. b.o.b underestimated Mount. Felt like they had won the league on final whistle. Glad to have been a part of it.Thanks to both teams and managers.
1312	1313	7	7	Rang three sep nos on Friday & sat before getting a response
1313	1314	9	9	\N
1314	1315	9	9	\N
1315	1316	8	9	\N
1316	1317	9	8	\N
1317	1318	9	9	\N
1318	1319	10	10	Game played in excellent spirit
1319	1320	9	9	Changing rooms not cleaned. Also used as a storeage room for kits. Generally played in good spirit
1320	1321	8	8	\N
1321	1322	7	8	A committed game from both teams & ended 3-2 to Diggle, although they were fortunate with some charitable defending from Holmbridge early in the second half. There were 2 cautions for Diggle, one for Holmbridge along with a red card for a double yellow after an undisciplined challenge from a holmbridge forward.
1322	1323	10	5	to day was not one ov my best games but the amount ov abuse i was given as made me feel like giving up refing for a bit going tom think about it coz its not worth the abuse 
1323	1324	7	9	\N
1324	1325	8	8	\N
1325	1326	8	6	poor attitude from some of the away team
1326	1327	9	9	\N
1327	1328	8	8	No problems.
1328	1329	8	8	\N
1329	1330	7	9	\N
1331	1332	9	9	A steady game with Nightingale starting faster & were 0-2 up midway through the 1st half, but Meltham got stronger to pull it back to 1-2 at full time. Many thanks to the home club secretary who looked after me during my visit.
1332	1333	10	10	\N
1333	1334	8	8	\N
1334	1335	8	8	\N
1335	1336	7	7	\N
1336	1337	9	8	\N
1337	1338	7	9	\N
1338	1339	10	10	\N
1339	1340	9	9	nothing in game both teams got on with the game
1340	1341	7	6	\N
1341	1342	9	9	\N
1342	1343	7	7	\N
1343	1344	10	6	\N
1344	1345	9	7	\N
1345	1346	9	9	\N
1346	1347	7	8	\N
1347	1348	9	9	A good pyhsical game of football on a mild afternoon.   Both Teams showed good Respect and sportsmanship.  A pleasure to Referee.
1348	1349	8	7	\N
1349	1350	6	7	\N
1350	1351	8	9	\N
1351	1352	7	8	Moorside did not hand in their team sheet until almost kick-off. There were no flags on the corner posts but the club were reminded to  get some on for their next home game
1352	1353	7	4	Poor attitude from away team - 3 red cards and 2 yellow (mainly dissent)
1353	1354	7	8	KKS goalkeeper did not wear numbered shirt
1354	1355	9	9	Couldnt have asked for a complete easier game to ref. Thanks to both sides for making it easy to officiate. Credit to the division. Thanks to both sets of supporters also. In general,a good day out.
1355	1356	7	8	\N
1356	1357	6	10	\N
1357	1358	10	10	\N
1358	1359	10	10	Two exemplary teams.  This match was what all grassroots football should be like.
1359	1360	10	3	\N
1360	1361	9	8	\N
1361	1362	8	5	dicipline in away team very poor
1362	1363	8	8	\N
1363	1364	8	8	\N
1364	1365	8	8	\N
1365	1366	7	6	\N
1366	1367	8	9	\N
1367	1368	8	8	\N
1368	1369	9	10	\N
1369	1370	8	8	overall good day except changing facility
1370	1371	9	8	\N
1371	1372	10	9	\N
1372	1373	9	5	Newsome constantly disputed decisions. Also constantly appealing for offsides when it was obvious that the player was onside. 
1373	1374	7	9	\N
1374	1375	8	8	no problems it seems from most of my games so far they just want to play football and leave me to my game, hope it can continue
1375	1376	7	7	S Hall did not get to pitch until 2 mins before k-off
1376	1377	10	10	\N
1377	1378	8	6	thought it very unsporting that shelly manager never shook my hand at the end of the game 
1378	1379	8	9	Changing rooms at Milnrow v good , they have a caretaker, a defibrillator on wall and nice hot showers ! Brig house Athletic are a v good addition to the league.
1379	1380	9	9	\N
1380	1381	9	9	A fair & sporting game of football with players willing to listen & accept decisions which made for a good afternoon for all.
1381	1382	10	8	Compeditive but generally well disciplined cup tie which witnessed 3 penalties and 3 cautions. the Heywood Assistant was outstanding and a credit to the game.An enjoyable match and a excellent pitch.
1382	1383	9	7	\N
1383	1384	8	10	Generally the game was easy to do and two yellow cards for the away team and one yellow card for the home team
1384	1385	8	7	\N
1385	1386	8	8	A good pyhsical game of football on a mild afternoon.   Although somewhat niggly at stages as it was a close match.  Both Teams showed reasonable Respect and sportsmanship befitting the Challenge Cup.
1386	1387	9	9	\N
1387	1388	10	8	\N
1388	1389	8	9	\N
1389	1390	8	7	\N
1390	1391	9	9	Very competitive game but played in an excellent spirit where players accepted decisions with very little whingeing. Both teams were a credit to the works league and I very much enjoyed the afternoon out.
1391	1392	9	9	\N
1392	1393	9	9	\N
1393	1394	10	10	\N
1394	1395	10	10	\N
1395	1396	8	9	\N
1396	1397	5	3	I found the britannia players blaming me foe everyting de to them being out classed  so dissaponting
1397	1398	9	9	\N
1398	1399	10	10	\N
1399	1400	9	8	\N
1400	1401	9	9	\N
1401	1402	9	4	Very warm welcome from Scissett both before and after the game, Newsome poor attitude would have had a lower score if it wasnt for the captain trying to help. Rest of team had a shocking attitude and no respect. Even when turning up to the changing rooms they were slagging it off from the word go and had a very poor respect very dissapointing to see.
1402	1403	9	8	one sided cup tie with Lindley the expected winners
1403	1404	6	6	A poor game with poor discipline and poor respect for my decisions. As usual, its all the referee's fault despite being outplayed in every area. Home manager very vocal and encroached onto field of play during a stoppage and had to be told to leave. All in all a very disappointing display from both teams. I think the Huddersfield FA should do more in terms of education. The players and managers do not know the laws of the game and many have no concept of respectful behaviour. Perhaps the FA could provide seminars on the LOTG while at the monthly meetings? or perhaps all managers and secretaries should attend a practical session with the referees at the start of the season to go through the difficulties we all face week in week out, perhaps then it might be a more enjoyable experience for all involved rather than the chore that it is rapidly becoming
1404	1405	10	10	The game was so one sided not much for me to do everything went smooth enjoyed
1405	1406	8	7	Competitive. enjoyed it.
1406	1407	7	7	\N
1407	1408	9	8	one sided game, played on a poor field, no real problems in game.
1408	1409	8	8	\N
1409	1410	7	9	\N
1410	1411	7	9	\N
1411	1412	8	8	\N
1412	1413	6	8	Tight game never out of control.
1413	1414	9	9	Excellent game and both teams respected all decisions
1414	1415	6	10	\N
1415	1416	10	8	Match especially in the second half difficult to carry, change of the winner, the players were nervous  and I had to give two yellow cards to the away team
1518	1519	8	8	\N
1519	1520	9	9	\N
1520	1521	7	8	\N
1416	1417	7	7	A good pyhsical game of football on a wet afternoon.   Although rather niggly both Teams showed reasonable Respect and sportsmanship. 
1417	1418	10	10	\N
1418	1419	9	8	Very little to do in the game, which was poor, with Junction winning 12-1. Only one yellow to a junction player for pulling back an opponent stopping a promising attack.
1419	1420	9	7	\N
1420	1421	9	9	\N
1421	1422	9	8	\N
1422	1423	9	9	\N
1423	1424	10	10	\N
1424	1425	8	7	\N
1425	1426	8	9	\N
1426	1427	8	6	\N
1427	1428	9	7	\N
1428	1429	10	8	\N
1429	1430	7	7	\N
1430	1431	9	9	nice easy game with both sides glad to have a different ref who had travelled 40 miles round trip!!!. no problems at all with either side. Thanks to both.
1431	1432	7	8	\N
1432	1433	8	8	\N
1433	1434	9	9	\N
1434	1435	7	7	A good game,played in a good spirit.
1435	1436	8	8	\N
1436	1437	8	8	\N
1437	1438	6	6	A poor game,a poor standard,not what you would expect from 2 division 1 sides.
1438	1439	8	6	\N
1439	1440	9	9	\N
1440	1441	7	8	a good competitive div.3 game
1441	1442	9	9	another one sided sunday fixture ( 9-0 ) to walkers, i shud av stayed in bed like some of the players 
1442	1443	6	7	As expected a competitive game. As the game progressed it was clear that Golcar were used to "bossing" the referee. Constantly appealing and questioning decisions. The captain was appalling and ended up been cautioned for dissent.Not a difficult game to referee but would be interesting to see how they behave in future cup fixtures. 
1443	1444	10	7	\N
1444	1445	9	9	\N
1445	1446	9	9	\N
1446	1447	9	9	\N
1447	1448	9	9	\N
1448	1449	9	9	\N
1449	1450	9	9	\N
1450	1451	9	9	\N
1451	1452	9	9	\N
1452	1453	9	7	\N
1453	1454	8	9	\N
1454	1455	9	9	\N
1455	1456	10	9	Generally the game was easy to do, there was no need to show any yellow or red cards.
1456	1457	6	8	A tough old battle with 4 cautions but compelling stuff.
1457	1458	8	8	\N
1458	1459	9	9	\N
1459	1460	8	8	\N
1460	1461	9	9	Brook motors had an off day, losing 2-6, but credit to Lepton for some good linking play & shooting from distance. Special thanks to Trevor Smeaton fro Brook Motors who looked after me throughout my visit.
1461	1462	6	6	A very competetive game,with no quarter given,the marsden spectators were at times too vocal and abusive,but after a quick word with the manager this ceased.A fast paced game,players accepted most decisions readily.A very even game decided by 2 second half defensive errors.
1462	1463	9	9	A very one sided game,this was played mainly in the Wooldale half,the score could easily have been well into the double figures,if Shelley had really applied themselves properly,instead of trying to walk the ball into the net.It was a case of men against boys,but to there credit Wooldale never gave up and competed well.
1463	1464	10	9	\N
1464	1465	6	6	\N
1465	1466	8	8	\N
1466	1467	8	8	\N
1467	1468	9	9	What a great game for a reserve division. Top quality football,end to end, and not a bad tackle in the whole game.both teams a credit to club and league. both managers superb. a draw would have been a fair result. shook hands with all connected to both clubs. Just how it should be !!
1468	1469	10	10	\N
1469	1470	7	9	A very fiesty game however I couldn't believe how genuinely nice both teams were post match
1470	1471	8	9	\N
1471	1472	8	8	\N
1472	1473	7	7	\N
1473	1474	7	8	\N
1474	1475	8	10	Despite Losing Wooldale were a pleasure to referee with a great attitude
1475	1476	8	8	\N
1476	1477	10	10	A great turnaround since the last time I visited Skelmanthorpe which was a total and utter disgrace
1477	1478	8	6	\N
1478	1479	6	8	Respect score of 6 given due to coach constantly bickering from the touchline. In general the players were fine.
1479	1480	7	8	\N
1480	1481	9	1	the manager is a disgrace how he talks to refs is disgusting
1481	1482	9	9	\N
1482	1483	6	7	\N
1483	1484	6	8	\N
1484	1485	9	9	\N
1485	1486	9	9	\N
1486	1487	8	8	\N
1487	1488	3	3	Two gobby teams on a wet Saturday afternoon. There are more pleasant ways of spending a couple of hours!
1488	1489	8	8	\N
1489	1490	7	7	\N
1490	1491	7	7	\N
1491	1492	8	7	\N
1492	1493	9	9	the game was abandoned on 62 min due to serious injuryat this point home team were winning 4  -  2
1493	1494	9	9	\N
1494	1495	9	9	\N
1495	1496	5	5	\N
1496	1497	8	9	\N
1497	1498	9	9	\N
1498	1499	9	9	\N
1499	1500	9	9	\N
1500	1501	8	3	Only 2 players shook hands after the game.
1501	1502	8	10	\N
1502	1503	7	8	Good football played in poor conditions. Unfortunately two ambulances required , one knee ligaments and the other a dislocated shoulder. Very good response from the NHS.
1503	1504	5	7	\N
1504	1505	10	8	Generally the game was easy to do, a high score of the match for the home team, one yellow card for the away team.
1505	1506	8	6	As Mount only had 10 players,the commitment and enthusiasm they showed was incredible! they were prepared to throw there bodies into every block possible,and they could not have given any more,it was like the alamo! but credit where it,s due,they never gave up! Massive respect to each and every Mount player!
1506	1507	7	8	\N
1507	1508	8	8	\N
1508	1509	8	7	\N
1509	1510	9	8	\N
1510	1511	6	7	\N
1511	1512	8	8	\N
1512	1513	8	8	\N
1513	1514	8	8	\N
1514	1515	7	7	\N
1515	1516	9	9	\N
1516	1517	8	10	Generally the game was easy to do, one yellow card for the away team
1517	1518	8	6	\N
1522	1523	10	10	\N
1523	1524	8	8	\N
1524	1525	9	9	No problems
1525	1526	10	10	Good game to referee
1526	1527	9	9	Good hard fought game played in a good spirit
1527	1528	6	8	\N
1528	1529	9	8	\N
1529	1530	6	8	\N
1530	1531	10	9	Generally the game was easy to do, there was no need to show any yellow or red cards.
1531	1532	9	9	The game was played in driving rain but both teams got on with it. Poor defending in the 1st half cost Netherton A the game.
1532	1533	8	8	no contact from home club noone to welcome me
1533	1534	8	8	A good pyhsical game of football on a cold and very wet and windy afternoon.   Although somewhat niggly at stages largely as a result of the testing heavy conditions.  It was a close match withn the 3-1 score line to Heyside perhaps harch on Heywood.  Both Teams showed good Respect and sportsmanship.  A pleasure to Referee apart from the weather.
1534	1535	8	5	Poor attitude from away club
1535	1536	8	8	praise to both teams for playing in adverse conditions with great sporting attitude. a pleasure to refde
1536	1537	9	9	\N
1537	1538	9	9	worst conditions ever ha ha but both team addapted very well very good game both teams excellent
1538	1539	7	8	\N
1539	1540	8	8	\N
1540	1541	10	10	It was very wet but both teams just wanted to play football enjoyed game 
1541	1542	10	3	\N
1542	1543	9	9	Cracking game in shocking weather conditions! Both captains were a credit to there clubs and was a joy to referee
1543	1544	10	8	On a difficult surface both teams did well to deliver some passing football. Lepton forwards were the quicker & lead to a 6-2 scoreline. Some of the Grimescar players were demanding decisions their way which were not. Many thanks to Nick Turner & Richard Walker who looked after me throughout my visit as well as providing food after the game.
1544	1545	9	8	\N
1545	1546	8	8	\N
1546	1547	8	7	\N
1547	1548	9	9	\N
1548	1549	9	9	\N
1549	1550	7	9	Played in difficult conditions, apart from one major flashpoint an exciting encounter.
1550	1551	9	9	CRACKING GAME. DRAW WOULD HAVE BEEN FAIR. BRILLIANT ATTITUDE FROM BOTH PLAYERS AND SPECTATORS AND MANAGERS. A CREDIT TO LEAGUE.
1551	1552	7	8	hard fast and typical top of division game. no quarters asked for or given! 
1552	1553	8	8	\N
1553	1554	8	8	Good cup tie played in a good spirit.
1554	1555	8	7	After 2 red cards to Holmfirth the game was more or less over after 70 minutes with Britannia scoring 3 late goals to make it 5-1
1555	1556	6	9	\N
1556	1557	9	8	\N
1557	1558	9	9	\N
1558	1559	7	8	\N
1559	1560	8	8	one corner flag missing
1560	1561	9	9	\N
1561	1562	9	9	\N
1562	1563	10	10	\N
1563	1564	9	9	\N
1564	1565	9	9	\N
1565	1566	6	7	\N
1566	1567	9	9	a lowly fixture turned out to be a good competitive game only spoilt by the poor conditions
1567	1568	7	8	\N
1568	1569	10	9	\N
1569	1570	10	10	My regards to two fantastic sets of players and spectators and managers. brilliant game in conditions. Thanks.
1570	1571	10	10	\N
1571	1572	9	9	A good pyhsical game of football on a cold afternoon.   Although somewhat niggly at stages largely as a result of the testing heavy conditions.  It was a close match even though Cumberworth were evenual 6-3  winners perhaps harch on Meltham.  Both Teams showed good Respect and sportsmanship.  A pleasure to Referee.
1572	1573	9	8	Last minute stand in for Gary Porter(ill). pleased to step in as was both teams. I Hope!Good hard clean game. just what the players needed after 5 weeks out. My regards to both clubs
1573	1574	10	9	\N
1574	1575	8	8	Good competitive District League game. Enjoyable.
1575	1576	8	10	\N
1576	1577	9	9	\N
1577	1578	8	9	Generally the game was easy to do and one yellow card for the away team
1578	1579	7	8	Thank God for 4G !  Enjoyed the game , very large pitch though . 
1579	1580	7	8	\N
1580	1581	7	4	The Shelley team, officials and spectators did not show any respect throughout the game. Silly comments throughout from the side and some players. Not an enjoyable afternoon.
1581	1582	9	9	\N
1582	1583	8	10	Generally the game was easy to do, there was no need to show any yellow or red cards.
1583	1584	8	8	A complete lack of quality or ability from both clubs, particularly mount, although at times they did try to play some football on a very very poor surface which had not been marked out by the council
1584	1585	8	8	\N
1585	1586	9	8	A good pyhsical game of football on a cold and windy afternoon.   Althoug, we played on a heavy pitch.  Both Teams showed good Respect and sportsmanship.  It was a close match with Lindley Saddle eventual 1-0 winners.  A pleasure to Referee.
1586	1587	9	9	\N
1587	1588	8	6	\N
1588	1589	10	10	\N
1589	1590	2	10	usual blame the ref attitude from the home team during the game and general bad attitude and childish comments after the final whistle .
1590	1591	9	9	a good cup tie on a cow field but players were great with sporting behaviour making my job easy
1591	1592	10	10	\N
1592	1593	7	8	\N
1593	1594	3	8	No acknowledgement of contact from me by secretary. Too much moaning because of poor performance of players so it must be referees fault! Away team played well and behaved.
1594	1595	10	10	\N
1595	1596	9	9	Both teams not played for a long time and it showed! well behaved, competetive, and good solid challenges in poor conditions with a heavy pitch. both managers brilliant. i was delayed by traffic accident and phoned ahead,forgetting to bring my flags to the pitch.! Both managers did a fine job with their hands!!!. my thanks to both teams. Arnie.
1596	1597	9	9	\N
1597	1598	9	10	\N
1598	1599	10	10	\N
1599	1600	8	8	\N
1600	1601	7	8	\N
1601	1602	8	8	\N
1602	1603	8	8	\N
1603	1604	10	9	\N
1604	1605	8	8	good game. 2 good teams 
1605	1606	10	10	2 good sets of lads. 
1606	1607	10	8	\N
1607	1608	8	8	\N
1608	1609	9	7	\N
1609	1610	9	9	A good pyhsical game of football on a cold and sleety afternoon.   Althoug, we played on a heavy pitch.  Both Teams showed good Respect and sportsmanship.  It was a close match with 3-3 draw a fair result .  A pleasure to Referee.
1610	1611	9	9	Both teams credit to the league and tried to play football in atrocious conditions in a sporting manner. Thank you guys.
1611	1612	6	8	\N
1612	1613	9	7	\N
1613	1614	9	8	i went to watch my son. but there was no official referee there. i was told by britannia that the referee hadnt replied to numerous text and phone calls. so i agreed to referee.
1614	1615	10	10	in attrocios conditions,hail,snow,wind, it was without doubt a brilliant match with two good sides betraying horrendous conditions in thick mud to play superb football. never seen two more committed sides striving to beat the elements thrown at them (and me!) my best regards to both teams and supporters and managers at the end. Thanks for the game. Both teams a credit to thier clubs.
1615	1616	8	8	\N
1616	1617	8	7	\N
1617	1618	9	9	Cracking game in poor conditions weather wise
1618	1619	8	8	conditions spoilt the day but we managed to get thro. it
1619	1620	9	9	very good game by 2 very well disciplined teams a pleasure to ref
1620	1621	9	9	this match was abandoned due to exteme bad weather after about 16 minutes with the score at 2-1.
1621	1622	8	7	\N
1622	1623	8	3	Away team Manager questioned every decision and as usual this flowed through onto the pitch. One players second caution was thus for dissent. I warned the manager and he calmed down , a bit. Very nearly a report to county. Otherwise a good game in poor conditions. 
1623	1624	7	7	\N
1624	1625	8	8	\N
1625	1626	8	3	\N
1626	1627	9	9	\N
1627	1628	8	9	\N
1628	1629	9	9	\N
1629	1630	10	9	Generally the game was easy to do, there was no need to show any yellow or red cards.
1630	1631	6	8	\N
1631	1632	10	10	\N
1632	1633	6	7	\N
1633	1634	8	7	A good pyhsical game of football on a cold afternoon.   Although somewhat niggly at stages largely as a result of the testing heavy conditions.  It was a close match even though Hepworth were evenual 5-3  winners.  Hepworth good Respect and sportsmanship.  Heyside were let down by their Captain who from the onset questioned my every decision resulting in a yellow card late on which on another day could have been a red.  
1634	1635	9	10	\N
1635	1636	9	10	game played at shepley due to Aimbry pitch to wet
1636	1637	9	9	\N
1637	1638	8	8	\N
1638	1639	8	8	\N
1639	1640	8	9	\N
1640	1641	9	9	\N
1641	1642	8	3	Away club constant hecling and ungentlemanly behaviour adisputing of decision making.n
1642	1643	8	10	Netherton were excellent. Cumberworth could have done with some to welcome me.
1643	1644	8	7	poor game on a poor field but we were lucky to play
1644	1645	8	8	this game went ahead due the extra work done on the field by the home club even tho. its a council pitch
1645	1646	9	9	\N
1646	1647	8	8	\N
1647	1648	8	8	\N
1648	1649	9	8	\N
1649	1650	8	8	\N
1650	1651	8	9	\N
1651	1652	7	7	\N
1652	1653	8	5	\N
1653	1654	8	7	\N
1654	1655	10	10	Two good teams who did their best on a very poor surface. Both teams deserve credit for putting on a good competitive match
1655	1656	9	10	\N
1656	1657	7	9	Decent game in awful conditions.
1657	1658	10	10	\N
1658	1659	10	10	\N
1659	1660	10	9	\N
1660	1661	8	8	\N
1661	1662	8	6	\N
1662	1663	9	9	\N
1663	1664	5	9	\N
1664	1665	9	9	\N
1665	1666	9	7	i have reported diggle as a misconduct to CFA, and told them i would be doing so after calming the situation down
1666	1667	8	8	Hard fought game with good levels of discipline on the whole. Pitch played well. weather poor as usual!
1667	1668	9	6	\N
1668	1669	9	8	\N
1669	1670	8	8	\N
1670	1671	9	5	Taken us 4 goes to get this one on ! Indeed we switched to Jagger Lane as Scissett wasn't fit again. Enjoyed it. Gave Brook motors a low respect score , as I was cautioning one of their players  another one gave me his opinion which resulted in a red card. 
1671	1672	9	6	Had to work hard to keep my cards in my pocket with the Honley players constantly moaning had to speak with several player and involve the captain on a couple of occasions before I finally gave in and cautioned one for his persistent comments. 
1672	1673	8	8	\N
1673	1674	6	8	\N
1674	1675	10	8	\N
1675	1676	9	9	\N
1676	1677	9	9	Generally there was a good game, there was no need to show any yellow or red cards.
1677	1678	7	7	A good pyhsical game of football on a cold afternoon.   Although somewhat a niggly game. A bit off a one sided game with Shelley were evenual 1-7. winners.  Both Teams were rather winging but showed some Respect and sportsmanship.
1678	1679	7	7	\N
1679	1680	8	8	\N
1680	1681	9	4	\N
1681	1682	10	10	top lads,top game. not a bad tackle or word said out of place. really enjoyed it. Thanks.
1682	1683	7	9	\N
1683	1684	7	7	a poor game played on a cowfield with players of reduced ability made it the worst sat game of the season. home club started with 10 men and no touch line help. away club gave no touchline help either
1684	1685	9	9	\N
1685	1686	6	8	\N
1686	1687	6	8	\N
1687	1688	7	7	\N
1688	1689	8	7	\N
1689	1690	10	9	\N
1690	1691	9	9	\N
1691	1692	8	8	\N
1692	1693	9	8	straightfoward game played on a heavy pitch 
1693	1694	9	10	\N
1694	1695	8	10	Cartworth Moor were a joy to referee played in great spirit
1695	1696	8	8	\N
1696	1697	7	6	This game was played at SCHOLES ground due to grange moor being unplayable. the above still has grange moor as the home club.
1697	1698	8	8	game played in good spirit.
1698	1699	9	10	\N
1699	1700	9	9	\N
1700	1701	8	10	\N
1701	1702	9	9	\N
1702	1703	10	10	\N
1703	1704	8	8	\N
1704	1705	6	6	\N
1705	1706	9	9	\N
1706	1707	10	10	\N
1707	1708	7	6	\N
\.


--
-- TOC entry 2451 (class 0 OID 0)
-- Dependencies: 210
-- Name: overall_score_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('overall_score_id_seq', 1707, true);


--
-- TOC entry 2452 (class 0 OID 0)
-- Dependencies: 211
-- Name: overall_score_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('overall_score_report_id_seq', 1, false);


--
-- TOC entry 2366 (class 0 OID 26946)
-- Dependencies: 212
-- Data for Name: referee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY referee (id, first_name, last_name, level) FROM stdin;
20	David	Armitage	7
21	Eddie	Aspin	7
22	Matt	Barber	7
23	Nigel	Bennett	7
24	Alan	Berry	7
25	Neil	Blackburn	7
26	Nigel	Booth	7
27	Stephen	Bottom	7
28	Rob	Byrne	7
29	Dwayne	Chappell	7
30	Michael	Coles	7
31	John	Connolly	7
32	Stephen	Crawshaw	7
33	Ronnie	Cushing	7
34	Ian	Daffern	7
35	Peter	Darby	7
36	Peter	Davies	7
37	Tom	Dickens	7
38	Jack	Dowse	7
39	Gordon	Durward	7
40	Joel	Ezro	7
41	Adam	Farmer	7
42	Christian	Firth	7
43	Charles	Fosbrook	7
44	Off	Game	7
45	Ian	Garrett	7
46	John	Gray	7
47	Alan	Green	7
48	Tony	Green	7
49	Michael	Hallam	7
50	Charlie	Harrison	7
51	Chris	Hinchcliffe	7
52	Mark	Hinchcliffe	7
53	John	Hislop	7
54	Thomas	Holmes	7
55	Graham	Hughes	7
56	Alan	Kelly	7
57	Tahir	Khan	7
58	Jason	Knowles	7
59	Carl	Leadbeater	7
60	Chris	Lockwood	7
61	Steve	Longmore	7
62	Tom	Mallon	7
64	Josh	Martin	7
65	Dennis	McCarthy	7
66	Andrew	Noble	7
67	Ian	Parker	7
68	Kyle	Pearson	7
69	Neil	Pickles	7
70	Gary	Porter	7
71	Piotr	Ptak	7
72	Alex	Rak	7
73	Haneef	Rashid	7
74	Albert	Rennison	7
75	Coalen	Rennison	7
76	Chris	Rhodes	7
77	Martin	Rhodes	7
78	Mike	Roberts	7
79	Michael	Robertson	7
81	Craig	Salmons	7
82	Gordon	Schofield	7
83	Bob	Skeldon	7
84	Barry	South	7
85	Johnathon	Spencer	7
87	Michael	Stoddart	7
88	David	Szuminski	7
89	Gareth	Thomas	7
90	Arnie	Thorpe	7
91	Nathan	Tosum	7
92	Ossie	Tosum	7
93	Arron	Townend	7
94	Peter	Tupman	7
95	Daniel	Waddington	7
96	Michael	Walsh	7
97	Darren	Weaver	7
98	Bill	Westwood	7
99	Brian	Whitaker	7
100	Geoff	Wilding	7
101	Arran	Williams	7
102	John	Wozniak	7
103	Howard	Young	7
104	Paul	Vasilenko	7
105	Paul	Wilkinson	7
86	Jonathan	Sterling	6
80	Stephen	Rushworth	5
106	TestFirst	TestLast	6
107	First2	Last2	6
108	First3	Last3	-1
63	Jonny	Martin	7
179	Andy	Noble	7
180	Mike	Stoddart	7
181	Chris	King	7
182	Mick	Coles	7
183	Andrew	Gee	7
184	John	Field	7
185	Charlie	Fosbrook	7
186	Paul	Conquest	7
187	Alan	Gill	7
\.


--
-- TOC entry 2453 (class 0 OID 0)
-- Dependencies: 213
-- Name: referee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('referee_id_seq', 187, true);


--
-- TOC entry 2368 (class 0 OID 26954)
-- Dependencies: 214
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY report (id, match_date, competition, referee_id, home_team_id, away_team_id, submitted) FROM stdin;
1143	2015-08-25	850	63	270	271	2015-08-25
1144	2015-08-25	851	80	272	273	2015-08-25
1145	2015-08-25	850	71	274	275	2015-08-25
1146	2015-08-25	851	179	276	277	2015-08-25
1147	2015-08-25	851	62	278	279	2015-08-25
1148	2015-08-25	851	42	280	281	2015-08-25
1149	2015-08-25	852	180	282	283	2015-08-26
1150	2015-08-25	852	64	284	285	2015-08-26
1151	2015-08-25	850	41	286	287	2015-08-26
1152	2015-08-27	853	62	288	289	2015-08-27
1153	2015-08-27	854	79	290	291	2015-08-28
1154	2015-08-27	855	94	292	293	2015-08-28
1155	2015-08-27	856	65	294	295	2015-08-28
1156	2015-08-25	850	59	296	297	2015-08-28
1157	2015-08-27	854	59	298	299	2015-08-28
1158	2015-08-27	853	64	300	301	2015-08-28
1159	2015-08-27	854	83	302	303	2015-08-28
1160	2015-08-27	854	96	304	305	2015-08-28
1161	2015-08-27	856	180	306	307	2015-08-28
1162	2015-08-25	857	181	308	309	2015-08-28
1163	2015-08-27	855	179	310	311	2015-08-29
1164	2015-08-25	851	34	312	313	2015-08-30
1165	2015-08-27	853	34	314	315	2015-08-30
1166	2015-08-25	857	47	316	317	2015-08-31
1167	2015-08-27	855	47	318	319	2015-08-31
1168	2015-08-27	856	29	320	321	2015-08-31
1169	2015-09-01	851	80	322	281	2015-09-01
1170	2015-09-01	852	31	323	283	2015-09-01
1171	2015-09-01	851	27	272	278	2015-09-01
1172	2015-09-01	852	71	324	325	2015-09-01
1173	2015-09-01	851	62	276	280	2015-09-01
1174	2015-09-01	851	65	326	312	2015-09-02
1175	2015-09-01	851	59	277	313	2015-09-02
1176	2015-09-01	857	74	327	328	2015-09-02
1177	2015-09-01	857	64	329	330	2015-09-02
1178	2015-09-01	850	47	287	331	2015-09-02
1179	2015-09-01	857	79	332	333	2015-09-02
1180	2015-09-01	857	67	309	334	2015-09-03
1181	2015-09-01	850	104	335	297	2015-09-03
1182	2015-09-01	852	90	336	337	2015-09-03
1183	2015-09-03	853	71	338	339	2015-09-03
1184	2015-09-03	856	180	320	295	2015-09-03
1185	2015-09-03	854	27	302	291	2015-09-03
1186	2015-09-03	856	182	307	340	2015-09-03
1187	2015-09-01	850	179	270	341	2015-09-03
1188	2015-09-03	856	62	294	342	2015-09-03
1189	2015-09-03	854	31	343	299	2015-09-04
1190	2015-09-03	855	79	344	311	2015-09-04
1191	2015-09-03	856	34	306	345	2015-09-04
1192	2015-09-03	855	90	346	347	2015-09-04
1193	2015-09-03	855	29	348	292	2015-09-04
1194	2015-09-03	855	94	349	350	2015-09-05
1195	2015-09-03	854	67	351	303	2015-09-05
1196	2015-09-05	852	94	284	352	2015-09-05
1197	2015-09-05	852	73	353	323	2015-09-05
1198	2015-09-05	851	67	322	272	2015-09-05
1199	2015-09-05	850	180	287	270	2015-09-05
1200	2015-09-05	851	79	326	273	2015-09-05
1201	2015-09-05	851	29	281	277	2015-09-05
1202	2015-09-05	851	27	279	312	2015-09-05
1203	2015-09-05	856	71	320	354	2015-09-05
1204	2015-09-03	856	96	354	321	2015-09-06
1205	2015-09-05	855	74	348	347	2015-09-06
1206	2015-09-05	853	33	355	356	2015-09-06
1207	2015-09-05	851	31	276	278	2015-09-06
1208	2015-09-06	858	31	357	358	2015-09-06
1209	2015-09-05	850	64	335	331	2015-09-06
1210	2015-09-05	850	63	296	286	2015-09-06
1211	2015-09-05	857	47	359	360	2015-09-06
1212	2015-09-06	858	67	361	362	2015-09-06
1213	2015-09-05	857	59	332	328	2015-09-07
1214	2015-08-25	850	21	331	341	2015-09-07
1215	2015-08-27	856	21	342	345	2015-09-07
1216	2015-09-03	854	21	363	290	2015-09-07
1217	2015-09-05	855	21	349	319	2015-09-07
1218	2015-09-05	852	41	364	285	2015-09-07
1219	2015-09-05	850	90	297	271	2015-09-07
1220	2015-09-03	853	83	365	301	2015-09-07
1221	2015-09-05	850	34	275	366	2015-09-07
1222	2015-09-05	852	70	336	324	2015-09-08
1223	2015-09-05	854	72	363	343	2015-09-09
1224	2015-08-25	852	105	364	336	2015-09-12
1225	2015-09-12	852	183	352	282	2015-09-12
1226	2015-09-12	850	73	275	296	2015-09-12
1227	2015-09-12	853	62	301	356	2015-09-12
1228	2015-09-12	851	63	273	278	2015-09-12
1229	2015-09-12	851	71	276	326	2015-09-12
1230	2015-09-12	857	96	328	367	2015-09-13
1231	2015-09-12	854	74	298	291	2015-09-13
1232	2015-09-12	855	98	348	310	2015-09-13
1233	2015-09-12	857	47	316	329	2015-09-13
1234	2015-09-12	855	79	292	318	2015-09-13
1235	2015-09-13	858	51	368	361	2015-09-13
1236	2015-09-12	850	94	331	270	2015-09-13
1237	2015-09-12	857	70	317	308	2015-09-14
1238	2015-09-12	856	64	345	294	2015-09-14
1239	2015-09-01	850	46	296	366	2015-09-14
1240	2015-09-03	853	46	314	289	2015-09-14
1241	2015-09-05	852	46	283	337	2015-09-14
1242	2015-09-12	852	46	285	324	2015-09-14
1243	2015-09-05	856	40	294	306	2015-09-14
1244	2015-09-12	852	40	364	325	2015-09-14
1245	2015-09-12	856	41	340	306	2015-09-14
1246	2015-09-12	857	90	333	360	2015-09-14
1247	2015-09-12	852	34	284	337	2015-09-14
1248	2015-08-27	855	35	347	344	2015-09-14
1249	2015-09-03	856	35	369	370	2015-09-14
1250	2015-09-05	854	35	371	299	2015-09-14
1251	2015-09-12	853	35	289	372	2015-09-14
1252	2015-09-12	855	24	350	311	2015-09-14
1253	2015-09-12	851	56	313	277	2015-09-14
1254	2015-09-12	853	184	339	288	2015-09-14
1255	2015-09-13	858	67	373	357	2015-09-15
1256	2015-08-27	853	105	356	374	2015-09-15
1257	2015-09-01	850	105	274	271	2015-09-15
1258	2015-09-05	852	105	325	282	2015-09-15
1259	2015-09-12	856	59	354	369	2015-09-15
1260	2015-09-12	851	105	312	272	2015-09-15
1261	2015-09-12	851	29	280	322	2015-09-15
1262	2015-08-25	852	84	323	337	2015-09-16
1263	2015-09-05	851	84	280	313	2015-09-16
1264	2015-09-12	850	84	287	271	2015-09-16
1265	2015-09-12	850	83	335	341	2015-09-16
1266	2015-09-19	852	71	353	284	2015-09-19
1267	2015-09-19	857	73	360	334	2015-09-19
1268	2015-09-19	857	94	367	329	2015-09-19
1269	2015-09-19	850	179	335	274	2015-09-19
1270	2015-09-19	856	102	369	306	2015-09-19
1271	2015-09-19	850	185	366	341	2015-09-19
1272	2015-09-19	852	62	325	352	2015-09-19
1273	2015-09-19	850	42	297	270	2015-09-19
1274	2015-09-19	853	184	339	356	2015-09-19
1275	2015-09-19	856	96	294	370	2015-09-20
1276	2015-09-19	855	74	310	319	2015-09-20
1277	2015-09-20	858	42	358	362	2015-09-20
1278	2015-09-19	853	98	289	374	2015-09-20
1279	2015-09-19	850	59	287	286	2015-09-21
1280	2015-09-19	856	47	345	354	2015-09-21
1281	2015-09-19	856	99	295	340	2015-09-21
1282	2015-09-20	858	99	375	368	2015-09-21
1283	2015-09-19	851	46	322	279	2015-09-21
1284	2015-09-19	851	90	273	281	2015-09-21
1285	2015-09-20	858	184	357	376	2015-09-21
1286	2015-09-19	850	56	275	331	2015-09-22
1287	2015-09-19	852	51	285	337	2015-09-22
1288	2015-09-26	850	73	341	271	2015-09-26
1289	2015-09-26	851	71	277	312	2015-09-26
1290	2015-09-26	852	64	336	352	2015-09-26
1291	2015-09-26	856	80	369	295	2015-09-26
1292	2015-09-26	852	62	364	353	2015-09-26
1293	2015-09-26	851	104	280	326	2015-09-26
1294	2015-09-26	850	51	286	335	2015-09-26
1295	2015-09-26	856	74	345	370	2015-09-26
1296	2015-09-26	851	185	281	276	2015-09-26
1297	2015-09-26	850	96	274	296	2015-09-27
1298	2015-09-26	853	94	288	338	2015-09-27
1299	2015-09-26	851	179	313	273	2015-09-27
1300	2015-09-27	858	42	376	377	2015-09-27
1301	2015-09-26	855	69	344	310	2015-09-27
1302	2015-09-26	859	34	378	379	2015-09-27
1303	2015-09-26	850	46	270	331	2015-09-27
1304	2015-09-19	852	67	283	324	2015-09-28
1305	2015-09-26	857	67	327	333	2015-09-28
1306	2015-09-26	851	84	272	279	2015-09-28
1307	2015-09-26	851	59	278	322	2015-09-28
1308	2015-09-26	857	47	367	334	2015-09-28
1309	2015-09-26	852	56	284	283	2015-09-28
1310	2015-09-26	857	99	360	309	2015-09-28
1311	2015-09-27	858	99	368	358	2015-09-28
1312	2015-09-26	857	90	317	316	2015-09-28
1313	2015-09-26	850	83	366	275	2015-09-29
1314	2015-09-26	859	98	380	381	2015-09-30
1315	2015-08-25	857	36	333	334	2015-09-30
1316	2015-08-27	855	36	346	349	2015-09-30
1317	2015-09-03	854	36	382	305	2015-09-30
1318	2015-09-05	854	36	351	302	2015-09-30
1319	2015-09-12	856	36	295	370	2015-09-30
1320	2015-09-26	857	36	332	308	2015-09-30
1321	2015-10-03	850	94	341	366	2015-10-03
1322	2015-10-03	851	185	279	278	2015-10-03
1323	2015-10-03	857	68	317	367	2015-10-03
1324	2015-10-03	855	179	383	349	2015-10-03
1325	2015-10-03	856	96	320	345	2015-10-03
1326	2015-10-03	859	74	380	384	2015-10-03
1327	2015-10-03	851	70	326	281	2015-10-04
1328	2015-10-03	852	79	336	323	2015-10-04
1329	2015-10-03	856	47	306	369	2015-10-04
1330	2015-10-03	856	72	307	370	2015-10-04
1331	2015-10-03	852	90	283	325	2015-10-04
1332	2015-10-04	858	185	362	368	2015-10-04
1333	2015-10-03	855	35	348	350	2015-10-04
1334	2015-10-03	855	184	293	310	2015-10-05
1335	2015-10-03	852	59	353	285	2015-10-05
1336	2015-10-03	857	83	332	359	2015-10-05
1337	2015-10-03	851	64	322	312	2015-10-05
1338	2015-09-19	851	34	277	276	2015-10-05
1339	2015-10-03	857	34	316	334	2015-10-05
1340	2015-10-03	850	105	275	297	2015-10-05
1341	2015-10-03	856	73	321	340	2015-10-05
1342	2015-10-03	856	97	342	354	2015-10-05
1343	2015-10-03	854	98	304	382	2015-10-06
1344	2015-10-03	852	29	364	352	2015-10-06
1345	2015-10-03	857	46	309	308	2015-10-07
1346	2015-10-10	855	97	310	349	2015-10-10
1347	2015-10-10	853	74	289	315	2015-10-10
1348	2015-10-10	850	62	275	271	2015-10-10
1349	2015-10-10	850	96	287	297	2015-10-11
1350	2015-10-10	856	73	342	320	2015-10-11
1351	2015-10-10	852	179	283	352	2015-10-11
1352	2015-10-10	854	60	371	302	2015-10-11
1353	2015-10-10	855	47	350	344	2015-10-11
1354	2015-10-10	852	64	282	337	2015-10-11
1355	2015-10-10	856	90	345	321	2015-10-11
1356	2015-10-10	851	27	280	277	2015-10-11
1357	2015-10-10	856	86	340	369	2015-10-12
1358	2015-10-11	858	86	362	357	2015-10-12
1359	2015-10-03	857	86	333	328	2015-10-12
1360	2015-10-04	858	86	376	373	2015-10-12
1361	2015-10-10	850	34	270	274	2015-10-12
1362	2015-10-10	855	69	292	383	2015-10-12
1363	2015-08-25	852	45	324	352	2015-10-12
1364	2015-08-27	853	45	372	365	2015-10-12
1365	2015-09-01	857	45	316	367	2015-10-12
1366	2015-09-03	853	45	300	288	2015-10-12
1367	2015-09-05	857	45	327	308	2015-10-12
1368	2015-09-19	852	45	282	336	2015-10-12
1369	2015-10-10	854	94	291	382	2015-10-12
1370	2015-10-10	852	99	284	325	2015-10-13
1371	2015-10-11	858	99	376	361	2015-10-13
1372	2015-10-10	851	46	281	326	2015-10-13
1373	2015-10-10	851	56	279	272	2015-10-13
1374	2015-10-10	859	84	385	381	2015-10-13
1375	2015-10-10	856	105	294	307	2015-10-14
1376	2015-10-10	857	83	333	309	2015-10-14
1377	2015-10-10	850	29	335	366	2015-10-14
1378	2015-10-10	851	70	273	276	2015-10-15
1379	2015-10-03	857	67	330	360	2015-10-15
1380	2015-10-10	853	98	339	300	2015-10-15
1381	2015-10-17	854	33	363	291	2015-10-17
1382	2015-10-17	860	180	277	386	2015-10-17
1383	2015-10-17	851	65	278	272	2015-10-17
1384	2015-10-17	860	71	359	287	2015-10-17
1385	2015-10-17	854	74	304	302	2015-10-17
1386	2015-10-17	860	62	282	333	2015-10-17
1387	2015-10-17	860	31	387	284	2015-10-17
1388	2015-10-17	853	51	289	338	2015-10-17
1389	2015-10-17	852	97	364	324	2015-10-17
1390	2015-10-17	859	42	378	380	2015-10-17
1391	2015-10-17	859	60	379	381	2015-10-18
1392	2015-10-18	858	37	362	376	2015-10-18
1393	2015-10-10	855	37	319	311	2015-10-18
1394	2015-10-17	860	86	325	367	2015-10-18
1395	2015-10-18	858	86	377	375	2015-10-18
1396	2015-10-17	860	34	329	341	2015-10-18
1397	2015-10-17	860	35	388	273	2015-10-18
1398	2015-10-18	858	42	357	368	2015-10-18
1399	2015-10-17	853	27	365	339	2015-10-18
1400	2015-10-17	850	73	274	331	2015-10-19
1401	2015-10-17	861	70	292	303	2015-10-19
1402	2015-10-17	860	41	270	389	2015-10-19
1403	2015-10-17	860	99	317	336	2015-10-19
1404	2015-10-17	851	63	280	276	2015-10-19
1405	2015-10-17	860	46	313	328	2015-10-19
1406	2015-10-17	861	67	293	294	2015-10-20
1407	2015-10-17	857	47	332	330	2015-10-21
1408	2015-10-17	861	105	321	390	2015-10-22
1409	2015-10-17	861	59	320	290	2015-10-23
1410	2015-10-10	850	72	341	331	2015-10-23
1411	2015-10-17	850	72	335	296	2015-10-23
1412	2015-10-24	850	51	341	275	2015-10-24
1413	2015-10-24	851	79	272	276	2015-10-24
1414	2015-10-24	852	65	324	283	2015-10-24
1415	2015-10-24	852	86	282	364	2015-10-24
1416	2015-10-24	852	71	337	352	2015-10-24
1417	2015-10-24	857	62	309	332	2015-10-24
1418	2015-10-24	853	184	339	289	2015-10-24
1419	2015-10-24	857	185	333	359	2015-10-24
1420	2015-10-24	857	31	360	308	2015-10-24
1421	2015-10-24	853	179	315	314	2015-10-24
1422	2015-10-24	854	73	382	371	2015-10-25
1423	2015-10-25	858	31	361	357	2015-10-25
1424	2015-10-24	852	34	323	285	2015-10-25
1425	2015-10-24	851	94	281	273	2015-10-25
1426	2015-10-24	856	27	306	321	2015-10-25
1427	2015-10-24	850	64	270	297	2015-10-26
1428	2015-10-24	850	56	286	366	2015-10-26
1429	2015-10-24	850	46	274	287	2015-10-26
1430	2015-10-24	854	47	290	343	2015-10-26
1431	2015-10-24	850	90	331	296	2015-10-26
1432	2015-10-17	861	83	349	310	2015-10-26
1433	2015-10-24	856	83	342	370	2015-10-26
1434	2015-10-24	855	72	344	383	2015-10-26
1435	2015-10-17	856	24	340	370	2015-10-26
1436	2015-10-17	854	98	298	371	2015-10-26
1437	2015-10-24	856	98	354	295	2015-10-26
1438	2015-10-24	851	24	313	279	2015-10-26
1439	2015-10-24	851	41	278	280	2015-10-28
1440	2015-10-24	856	70	369	294	2015-10-28
1441	2015-10-24	850	99	335	271	2015-10-28
1442	2015-10-25	858	99	377	373	2015-10-28
1443	2015-10-17	860	84	391	322	2015-10-29
1444	2015-10-24	857	84	334	327	2015-10-29
1445	2015-10-24	857	48	317	328	2015-10-30
1446	2015-10-17	860	48	275	327	2015-10-30
1447	2015-09-26	857	48	329	359	2015-10-30
1448	2015-09-01	850	48	286	275	2015-10-30
1449	2015-10-03	850	48	331	274	2015-10-30
1450	2015-09-12	852	48	353	283	2015-10-30
1451	2015-09-19	852	48	323	364	2015-10-30
1452	2015-09-05	856	48	342	307	2015-10-30
1453	2015-08-27	856	48	369	340	2015-10-30
1454	2015-10-31	850	61	331	287	2015-10-31
1455	2015-10-31	853	37	289	314	2015-10-31
1456	2015-10-31	854	71	305	343	2015-10-31
1457	2015-10-31	852	180	353	336	2015-10-31
1458	2015-10-31	855	184	293	347	2015-10-31
1459	2015-10-31	856	97	345	340	2015-10-31
1460	2015-10-31	855	74	318	311	2015-10-31
1461	2015-10-31	850	185	275	274	2015-10-31
1462	2015-10-31	852	24	337	324	2015-10-31
1463	2015-10-22	860	24	392	366	2015-10-31
1464	2015-10-31	852	51	323	284	2015-11-01
1465	2015-10-31	859	73	381	384	2015-11-01
1466	2015-10-31	853	48	301	339	2015-11-01
1467	2015-10-31	852	104	325	285	2015-11-01
1468	2015-10-31	856	90	370	320	2015-11-01
1469	2015-10-31	850	86	297	335	2015-11-01
1470	2015-10-31	851	101	279	280	2015-11-01
1471	2015-10-31	855	42	383	346	2015-11-02
1472	2015-11-01	858	42	368	362	2015-11-02
1473	2015-10-31	857	56	333	329	2015-11-02
1474	2015-10-31	851	64	273	272	2015-11-02
1475	2015-10-31	850	41	271	366	2015-11-02
1476	2015-10-31	856	96	342	295	2015-11-02
1477	2015-10-31	851	63	312	326	2015-11-03
1478	2015-10-31	851	99	322	277	2015-11-03
1479	2015-10-31	852	84	364	282	2015-11-03
1480	2015-10-31	851	29	276	313	2015-11-04
1481	2015-10-31	852	70	352	283	2015-11-04
1482	2015-10-31	854	46	304	371	2015-11-05
1483	2015-10-31	859	83	378	379	2015-11-06
1484	2015-11-07	854	74	371	363	2015-11-07
1485	2015-11-07	850	185	286	297	2015-11-07
1486	2015-11-07	852	182	364	284	2015-11-07
1487	2015-10-03	854	182	305	299	2015-11-07
1488	2015-11-07	857	79	308	327	2015-11-08
1489	2015-10-31	854	47	390	298	2015-11-08
1490	2015-11-07	854	47	299	304	2015-11-08
1491	2015-11-08	858	42	358	376	2015-11-08
1492	2015-11-07	856	94	294	345	2015-11-08
1493	2015-11-07	857	70	367	333	2015-11-09
1494	2015-11-07	853	48	315	301	2015-11-10
1495	2015-10-10	854	186	351	298	2015-11-11
1496	2015-10-24	859	186	381	378	2015-11-11
1497	2015-10-17	853	186	374	301	2015-11-11
1498	2015-10-31	853	186	356	372	2015-11-11
1499	2015-11-07	854	186	303	290	2015-11-11
1500	2015-10-10	857	36	317	329	2015-11-11
1501	2015-10-17	861	36	343	354	2015-11-11
1502	2015-11-07	852	58	336	325	2015-11-12
1503	2015-11-07	853	67	300	339	2015-11-12
1504	2015-11-07	856	51	340	295	2015-11-13
1505	2015-11-14	857	71	334	360	2015-11-14
1506	2015-11-14	862	24	317	309	2015-11-15
1507	2015-11-14	863	74	339	314	2015-11-15
1508	2015-11-14	863	98	315	390	2015-11-15
1509	2015-11-14	859	47	380	379	2015-11-15
1510	2015-11-08	858	99	368	357	2015-11-16
1511	2015-11-14	852	99	353	352	2015-11-16
1512	2015-11-14	853	70	355	338	2015-11-17
1513	2015-11-07	850	56	274	270	2015-11-17
1514	2015-11-14	864	34	354	383	2015-11-18
1515	2015-11-14	862	29	330	287	2015-11-18
1516	2015-11-21	852	80	352	337	2015-11-21
1517	2015-11-21	853	71	374	300	2015-11-21
1518	2015-11-21	861	47	338	351	2015-11-22
1519	2015-11-21	852	179	324	284	2015-11-22
1520	2015-11-21	861	48	318	346	2015-11-22
1521	2015-11-21	853	98	355	314	2015-11-22
1522	2015-11-21	852	182	282	353	2015-11-22
1523	2015-11-21	853	51	339	301	2015-11-23
1524	2015-11-21	860	34	391	336	2015-11-25
1525	2015-10-24	854	36	363	304	2015-11-25
1526	2015-11-14	854	36	290	371	2015-11-25
1527	2015-11-21	857	36	359	328	2015-11-25
1528	2015-11-21	860	99	327	341	2015-11-26
1529	2015-11-21	859	69	380	393	2015-11-28
1530	2015-10-31	850	69	296	341	2015-11-28
1531	2015-11-28	855	71	311	383	2015-11-28
1532	2015-11-28	853	185	301	355	2015-11-28
1533	2015-11-28	853	69	314	372	2015-11-28
1534	2015-11-28	851	62	277	281	2015-11-28
1535	2015-11-28	850	47	274	335	2015-11-29
1536	2015-11-28	856	74	354	370	2015-11-29
1537	2015-11-28	850	59	275	270	2015-11-30
1538	2015-11-28	859	70	384	380	2015-11-30
1539	2015-11-28	851	56	276	312	2015-11-30
1540	2015-11-28	856	98	320	306	2015-11-30
1541	2015-11-28	854	46	390	290	2015-12-01
1542	2015-11-28	853	37	315	338	2015-12-01
1543	2015-11-28	852	41	353	325	2015-12-03
1544	2015-12-05	859	185	380	385	2015-12-05
1545	2015-12-05	851	99	281	278	2015-12-05
1546	2015-12-05	854	47	390	303	2015-12-06
1547	2015-11-28	857	84	308	317	2015-12-06
1548	2015-11-14	865	84	281	283	2015-12-06
1549	2015-12-05	857	48	359	308	2015-12-06
1550	2015-12-05	855	180	344	319	2015-12-06
1551	2015-11-21	857	90	367	308	2015-12-07
1552	2015-12-05	856	90	370	307	2015-12-07
1553	2015-12-05	854	70	305	290	2015-12-09
1554	2015-12-19	860	180	337	279	2015-12-19
1555	2015-12-19	851	187	273	283	2015-12-19
1556	2015-12-19	860	179	389	271	2015-12-19
1557	2015-12-19	861	51	348	306	2015-12-20
1558	2015-12-19	860	31	364	313	2015-12-20
1559	2015-12-19	857	48	308	334	2015-12-20
1560	2015-12-19	852	104	284	336	2015-12-20
1561	2015-12-19	853	184	339	374	2015-12-20
1562	2015-12-19	856	94	369	354	2015-12-20
1563	2015-12-19	853	86	355	315	2015-12-20
1564	2015-12-19	860	97	281	312	2015-12-20
1565	2015-12-19	854	42	303	304	2015-12-20
1566	2015-12-19	857	73	309	330	2015-12-21
1567	2015-12-19	855	99	292	347	2015-12-21
1568	2015-12-19	857	103	359	327	2015-12-25
1569	2016-01-02	857	42	317	330	2016-01-02
1570	2015-12-19	853	90	300	356	2016-01-03
1571	2016-01-02	853	48	365	300	2016-01-03
1572	2016-01-09	855	62	310	292	2016-01-09
1573	2016-01-09	852	90	353	337	2016-01-10
1574	2016-01-09	862	34	296	359	2016-01-10
1575	2016-01-09	856	79	321	370	2016-01-10
1576	2016-01-09	853	95	289	365	2016-01-11
1577	2016-01-16	861	31	307	342	2016-01-16
1578	2016-01-16	857	71	308	329	2016-01-16
1579	2016-01-09	865	67	281	325	2016-01-17
1580	2016-01-23	852	73	285	325	2016-01-23
1581	2016-01-23	865	94	279	276	2016-01-23
1582	2016-01-23	851	80	278	313	2016-01-23
1583	2016-01-23	857	71	328	309	2016-01-23
1584	2016-01-23	857	63	327	317	2016-01-23
1585	2016-01-23	857	104	308	333	2016-01-23
1586	2016-01-23	862	62	366	367	2016-01-23
1587	2016-01-23	865	179	336	364	2016-01-23
1588	2016-01-23	857	42	334	359	2016-01-23
1589	2016-01-23	851	86	272	281	2016-01-23
1590	2016-01-23	864	51	307	321	2016-01-24
1591	2016-01-23	862	99	297	270	2016-01-24
1592	2015-11-07	861	86	352	329	2016-01-24
1593	2016-01-24	866	42	373	376	2016-01-24
1594	2016-01-23	852	79	337	283	2016-01-24
1595	2016-01-23	862	61	332	275	2016-01-24
1596	2016-01-23	865	90	284	326	2016-01-24
1597	2016-01-23	855	70	350	349	2016-01-25
1598	2016-01-23	855	34	318	348	2016-01-25
1599	2016-01-23	856	46	370	294	2016-01-26
1600	2016-01-23	865	41	312	282	2016-01-26
1601	2016-01-23	855	98	344	293	2016-01-28
1602	2016-01-23	855	83	292	346	2016-01-28
1603	2015-09-01	852	61	352	285	2016-01-29
1604	2015-09-03	855	61	394	310	2016-01-29
1605	2015-09-19	851	61	272	313	2016-01-29
1606	2015-12-19	857	61	367	317	2016-01-29
1607	2016-01-23	854	37	371	382	2016-01-30
1608	2016-01-30	856	104	354	345	2016-01-30
1609	2016-01-30	851	65	276	279	2016-01-30
1610	2016-01-30	854	62	291	290	2016-01-30
1611	2016-01-30	863	94	288	314	2016-01-30
1612	2016-01-30	852	179	337	353	2016-01-30
1613	2016-01-31	858	86	358	361	2016-01-31
1614	2016-01-30	854	48	303	343	2016-01-31
1615	2016-01-30	850	90	275	287	2016-01-31
1616	2016-01-30	856	74	320	307	2016-01-31
1617	2016-01-23	864	74	306	369	2016-01-31
1618	2016-01-30	857	41	327	367	2016-02-01
1619	2016-01-30	852	99	285	284	2016-02-01
1620	2016-01-30	861	70	371	342	2016-02-01
1621	2016-01-30	856	180	294	340	2016-02-01
1622	2016-01-30	855	37	310	344	2016-02-02
1623	2016-01-23	859	67	384	380	2016-02-05
1624	2016-02-06	852	73	352	364	2016-02-06
1625	2016-02-06	859	51	381	384	2016-02-07
1626	2016-02-06	853	70	301	300	2016-02-07
1627	2016-02-06	856	97	307	294	2016-02-07
1628	2016-01-23	857	97	329	360	2016-02-07
1629	2016-02-06	859	41	380	379	2016-02-08
1630	2016-02-13	865	71	273	336	2016-02-13
1631	2016-02-13	857	94	330	317	2016-02-13
1632	2016-02-13	853	86	315	374	2016-02-13
1633	2016-02-13	856	73	303	363	2016-02-13
1634	2016-02-13	851	62	313	281	2016-02-13
1635	2016-02-13	851	97	272	326	2016-02-13
1636	2016-02-13	865	27	352	322	2016-02-13
1637	2016-02-13	862	31	275	328	2016-02-14
1638	2016-02-13	865	48	324	285	2016-02-14
1639	2016-02-13	862	64	296	329	2016-02-14
1640	2016-02-13	857	34	332	309	2016-02-14
1641	2016-02-13	850	179	297	331	2016-02-14
1642	2016-02-13	856	56	295	369	2016-02-14
1643	2016-02-13	852	41	364	337	2016-02-15
1644	2016-02-14	867	99	376	362	2016-02-15
1645	2016-02-13	851	99	312	276	2016-02-15
1646	2016-02-13	863	61	343	390	2016-02-15
1647	2016-02-13	855	98	311	346	2016-02-15
1648	2016-01-30	853	98	339	338	2016-02-15
1649	2016-02-13	862	70	360	334	2016-02-17
1650	2016-02-20	860	64	280	281	2016-02-20
1651	2016-02-20	851	179	326	322	2016-02-20
1652	2016-02-20	856	73	354	306	2016-02-20
1653	2016-02-20	852	94	336	364	2016-02-20
1654	2016-02-20	854	37	390	291	2016-02-20
1655	2016-02-20	860	63	309	271	2016-02-21
1656	2016-02-20	855	51	310	318	2016-02-21
1657	2016-02-20	850	79	335	275	2016-02-21
1658	2016-02-20	856	35	307	342	2016-02-21
1659	2016-02-13	855	29	349	344	2016-02-21
1660	2016-02-20	860	27	313	387	2016-02-21
1661	2016-02-20	852	70	337	323	2016-02-22
1662	2016-02-20	854	98	299	302	2016-02-22
1663	2016-02-20	857	46	327	329	2016-02-23
1664	2016-01-23	851	53	273	322	2016-02-23
1665	2015-10-17	861	53	350	306	2016-02-23
1666	2016-02-20	851	53	312	279	2016-02-23
1667	2016-02-20	851	180	276	273	2016-02-23
1668	2016-11-28	857	84	308	317	2016-02-23
1669	2016-01-23	856	84	354	342	2016-02-23
1670	2016-02-20	861	84	340	294	2016-02-23
1671	2016-02-20	861	67	311	344	2016-02-24
1672	2016-02-13	863	33	291	371	2016-02-24
1673	2016-02-20	854	99	303	351	2016-02-25
1674	2016-02-27	865	179	280	313	2016-02-27
1675	2016-02-27	851	80	312	281	2016-02-27
1676	2016-02-27	859	61	393	384	2016-02-27
1677	2016-02-27	852	71	323	325	2016-02-27
1678	2016-02-27	856	62	307	345	2016-02-27
1679	2016-02-27	864	73	350	318	2016-02-27
1680	2016-02-27	855	33	310	348	2016-02-27
1681	2016-02-27	854	51	304	291	2016-02-28
1682	2016-02-27	868	90	385	381	2016-02-28
1683	2016-02-27	856	94	370	321	2016-02-28
1684	2016-02-27	857	99	359	367	2016-02-28
1685	2016-02-27	850	34	331	297	2016-02-28
1686	2016-02-27	865	79	279	353	2016-02-28
1687	2016-02-27	863	56	351	305	2016-02-28
1688	2016-02-27	854	74	371	390	2016-02-28
1689	2016-02-27	851	182	278	276	2016-02-28
1690	2016-02-27	857	27	330	327	2016-02-28
1691	2016-02-27	864	70	346	293	2016-02-29
1692	2016-02-27	855	31	344	347	2016-02-29
1693	2016-02-27	857	105	332	329	2016-02-29
1694	2016-02-27	850	48	366	271	2016-02-29
1695	2016-02-27	857	41	360	328	2016-03-01
1696	2016-02-27	852	42	337	282	2016-03-01
1697	2016-02-20	860	24	287	285	2016-03-02
1698	2016-02-27	862	24	286	274	2016-03-02
1699	2016-02-27	864	46	349	295	2016-03-02
1700	2015-09-13	858	35	362	377	2016-03-04
1701	2015-11-07	856	35	307	354	2016-03-04
1702	2015-11-21	854	35	303	291	2016-03-04
1703	2016-01-30	857	35	317	333	2016-03-04
1704	2016-02-27	852	84	324	336	2016-03-05
1705	2016-03-05	853	73	315	287	2016-03-05
1706	2016-03-05	855	48	293	342	2016-03-06
1707	2016-03-06	866	86	368	357	2016-03-06
1708	2016-03-05	860	34	278	325	2016-03-07
\.


--
-- TOC entry 2454 (class 0 OID 0)
-- Dependencies: 215
-- Name: report_away_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('report_away_team_id_seq', 1, false);


--
-- TOC entry 2455 (class 0 OID 0)
-- Dependencies: 218
-- Name: report_competition_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('report_competition_seq', 1, false);


--
-- TOC entry 2456 (class 0 OID 0)
-- Dependencies: 216
-- Name: report_home_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('report_home_team_id_seq', 1, false);


--
-- TOC entry 2457 (class 0 OID 0)
-- Dependencies: 217
-- Name: report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('report_id_seq', 1708, true);


--
-- TOC entry 2458 (class 0 OID 0)
-- Dependencies: 219
-- Name: report_referee_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('report_referee_seq', 1, false);


--
-- TOC entry 2374 (class 0 OID 26967)
-- Dependencies: 220
-- Data for Name: shirt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY shirt (id, report_id, did_wear) FROM stdin;
1142	1143	Both
1143	1144	Both
1144	1145	Both
1145	1146	Both
1146	1147	Both
1147	1148	Both
1148	1149	Both
1149	1150	Both
1150	1151	Both
1151	1152	Both
1152	1153	Both
1153	1154	Both
1154	1155	Both
1155	1156	Both
1156	1157	Both
1157	1158	Both
1158	1159	Both
1159	1160	Both
1160	1161	Both
1161	1162	Neither
1162	1163	Both
1163	1164	Both
1164	1165	Both
1165	1166	Both
1166	1167	Both
1167	1168	Both
1168	1169	Both
1169	1170	Both
1170	1171	Both
1171	1172	Both
1172	1173	Both
1173	1174	Both
1174	1175	Both
1175	1176	Both
1176	1177	Both
1177	1178	Both
1178	1179	Both
1179	1180	Both
1180	1181	Away
1181	1182	Both
1182	1183	Both
1183	1184	Both
1184	1185	Both
1185	1186	Both
1186	1187	Both
1187	1188	Both
1188	1189	Both
1189	1190	Both
1190	1191	Both
1191	1192	Both
1192	1193	Both
1193	1194	Both
1194	1195	Both
1195	1196	Both
1196	1197	Both
1197	1198	Both
1198	1199	Both
1199	1200	Both
1200	1201	Both
1201	1202	Both
1202	1203	Both
1203	1204	Both
1204	1205	Both
1205	1206	Both
1206	1207	Both
1207	1208	Both
1208	1209	Both
1209	1210	Both
1210	1211	Both
1211	1212	Both
1212	1213	Both
1213	1214	Both
1214	1215	Both
1215	1216	Both
1216	1217	Both
1217	1218	Both
1218	1219	Both
1219	1220	Both
1220	1221	Both
1221	1222	Both
1222	1223	Both
1223	1224	Both
1224	1225	Both
1225	1226	Both
1226	1227	Both
1227	1228	Both
1228	1229	Both
1229	1230	Both
1230	1231	Both
1231	1232	Both
1232	1233	Both
1233	1234	Both
1234	1235	Both
1235	1236	Both
1236	1237	Both
1237	1238	Both
1238	1239	Both
1239	1240	Both
1240	1241	Both
1241	1242	Both
1242	1243	Both
1243	1244	Both
1244	1245	Both
1245	1246	Both
1246	1247	Both
1247	1248	Both
1248	1249	Both
1249	1250	Both
1250	1251	Both
1251	1252	Both
1252	1253	Both
1253	1254	Both
1254	1255	Both
1255	1256	Both
1256	1257	Both
1257	1258	Both
1258	1259	Both
1259	1260	Both
1260	1261	Both
1261	1262	Both
1262	1263	Both
1263	1264	Both
1264	1265	Both
1265	1266	Both
1266	1267	Both
1267	1268	Both
1268	1269	Both
1269	1270	Both
1270	1271	Both
1271	1272	Both
1272	1273	Neither
1273	1274	Both
1274	1275	Both
1275	1276	Both
1276	1277	Both
1277	1278	Both
1278	1279	Both
1279	1280	Both
1280	1281	Both
1281	1282	Both
1282	1283	Both
1283	1284	Both
1284	1285	Both
1285	1286	Both
1286	1287	Both
1287	1288	Both
1288	1289	Both
1289	1290	Both
1290	1291	Both
1291	1292	Both
1292	1293	Both
1293	1294	Both
1294	1295	Both
1295	1296	Both
1296	1297	Both
1297	1298	Both
1298	1299	Both
1299	1300	Both
1300	1301	Both
1301	1302	Both
1302	1303	Both
1303	1304	Both
1304	1305	Both
1305	1306	Both
1306	1307	Both
1307	1308	Both
1308	1309	Both
1309	1310	Both
1310	1311	Both
1311	1312	Both
1312	1313	Both
1313	1314	Both
1314	1315	Both
1315	1316	Both
1316	1317	Both
1317	1318	Both
1318	1319	Both
1319	1320	Both
1320	1321	Both
1321	1322	Both
1322	1323	Both
1323	1324	Both
1324	1325	Both
1325	1326	Both
1326	1327	Both
1327	1328	Both
1328	1329	Both
1329	1330	Both
1330	1331	Both
1331	1332	Both
1332	1333	Both
1333	1334	Both
1334	1335	Both
1335	1336	Both
1336	1337	Both
1337	1338	Both
1338	1339	Both
1339	1340	Home
1340	1341	Both
1341	1342	Both
1342	1343	Both
1343	1344	Both
1344	1345	Both
1345	1346	Both
1346	1347	Both
1347	1348	Both
1348	1349	Both
1349	1350	Both
1350	1351	Both
1351	1352	Both
1352	1353	Both
1353	1354	Both
1354	1355	Both
1355	1356	Both
1356	1357	Both
1357	1358	Both
1358	1359	Both
1359	1360	Both
1360	1361	Both
1361	1362	Both
1362	1363	Both
1363	1364	Both
1364	1365	Both
1365	1366	Both
1366	1367	Both
1367	1368	Both
1368	1369	Both
1369	1370	Both
1370	1371	Both
1371	1372	Both
1372	1373	Both
1373	1374	Both
1374	1375	Both
1375	1376	Both
1376	1377	Both
1377	1378	Both
1378	1379	Both
1379	1380	Both
1380	1381	Both
1381	1382	Both
1382	1383	Both
1383	1384	Both
1384	1385	Both
1385	1386	Both
1386	1387	Both
1387	1388	Both
1388	1389	Both
1389	1390	Both
1390	1391	Both
1391	1392	Both
1392	1393	Both
1393	1394	Both
1394	1395	Both
1395	1396	Both
1396	1397	Both
1397	1398	Both
1398	1399	Both
1399	1400	Both
1400	1401	Away
1401	1402	Both
1402	1403	Both
1403	1404	Both
1404	1405	Both
1405	1406	Both
1406	1407	Both
1407	1408	Away
1408	1409	Both
1409	1410	Both
1410	1411	Both
1411	1412	Both
1412	1413	Both
1413	1414	Both
1414	1415	Both
1415	1416	Both
1416	1417	Both
1417	1418	Both
1418	1419	Both
1419	1420	Both
1420	1421	Both
1421	1422	Both
1422	1423	Both
1423	1424	Both
1424	1425	Both
1425	1426	Both
1426	1427	Both
1427	1428	Both
1428	1429	Both
1429	1430	Both
1430	1431	Both
1431	1432	Both
1432	1433	Both
1433	1434	Both
1434	1435	Both
1435	1436	Both
1436	1437	Both
1437	1438	Both
1438	1439	Both
1439	1440	Both
1440	1441	Both
1441	1442	Both
1442	1443	Both
1443	1444	Both
1444	1445	Both
1445	1446	Both
1446	1447	Both
1447	1448	Both
1448	1449	Both
1449	1450	Both
1450	1451	Both
1451	1452	Both
1452	1453	Both
1453	1454	Home
1454	1455	Both
1455	1456	Both
1456	1457	Both
1457	1458	Both
1458	1459	Both
1459	1460	Both
1460	1461	Both
1461	1462	Both
1462	1463	Both
1463	1464	Both
1464	1465	Both
1465	1466	Away
1466	1467	Both
1467	1468	Both
1468	1469	Both
1469	1470	Both
1470	1471	Both
1471	1472	Both
1472	1473	Both
1473	1474	Both
1474	1475	Both
1475	1476	Both
1476	1477	Both
1477	1478	Both
1478	1479	Both
1479	1480	Both
1480	1481	Both
1481	1482	Both
1482	1483	Both
1483	1484	Both
1484	1485	Both
1485	1486	Both
1486	1487	Both
1487	1488	Both
1488	1489	Both
1489	1490	Both
1490	1491	Both
1491	1492	Both
1492	1493	Both
1493	1494	Both
1494	1495	Both
1495	1496	Both
1496	1497	Both
1497	1498	Both
1498	1499	Both
1499	1500	Both
1500	1501	Both
1501	1502	Both
1502	1503	Both
1503	1504	Both
1504	1505	Both
1505	1506	Both
1506	1507	Both
1507	1508	Both
1508	1509	Both
1509	1510	Both
1510	1511	Both
1511	1512	Both
1512	1513	Both
1513	1514	Both
1514	1515	Both
1515	1516	Both
1516	1517	Both
1517	1518	Both
1518	1519	Both
1519	1520	Both
1520	1521	Both
1521	1522	Both
1522	1523	Both
1523	1524	Both
1524	1525	Both
1525	1526	Both
1526	1527	Both
1527	1528	Both
1528	1529	Both
1529	1530	Both
1530	1531	Both
1531	1532	Both
1532	1533	Both
1533	1534	Both
1534	1535	Both
1535	1536	Both
1536	1537	Both
1537	1538	Both
1538	1539	Both
1539	1540	Both
1540	1541	Both
1541	1542	Both
1542	1543	Both
1543	1544	Both
1544	1545	Both
1545	1546	Both
1546	1547	Both
1547	1548	Both
1548	1549	Both
1549	1550	Home
1550	1551	Both
1551	1552	Both
1552	1553	Both
1553	1554	Both
1554	1555	Both
1555	1556	Both
1556	1557	Both
1557	1558	Both
1558	1559	Both
1559	1560	Both
1560	1561	Both
1561	1562	Both
1562	1563	Both
1563	1564	Both
1564	1565	Both
1565	1566	Both
1566	1567	Both
1567	1568	Both
1568	1569	Both
1569	1570	Both
1570	1571	Both
1571	1572	Both
1572	1573	Both
1573	1574	Both
1574	1575	Both
1575	1576	Both
1576	1577	Both
1577	1578	Both
1578	1579	Both
1579	1580	Both
1580	1581	Both
1581	1582	Both
1582	1583	Both
1583	1584	Both
1584	1585	Both
1585	1586	Both
1586	1587	Both
1587	1588	Both
1588	1589	Both
1589	1590	Both
1590	1591	Both
1591	1592	Both
1592	1593	Both
1593	1594	Both
1594	1595	Both
1595	1596	Both
1596	1597	Both
1597	1598	Both
1598	1599	Both
1599	1600	Both
1600	1601	Both
1601	1602	Both
1602	1603	Both
1603	1604	Both
1604	1605	Both
1605	1606	Both
1606	1607	Both
1607	1608	Both
1608	1609	Both
1609	1610	Both
1610	1611	Both
1611	1612	Both
1612	1613	Both
1613	1614	Both
1614	1615	Both
1615	1616	Both
1616	1617	Both
1617	1618	Both
1618	1619	Both
1619	1620	Both
1620	1621	Both
1621	1622	Both
1622	1623	Both
1623	1624	Both
1624	1625	Both
1625	1626	Both
1626	1627	Both
1627	1628	Both
1628	1629	Both
1629	1630	Both
1630	1631	Both
1631	1632	Both
1632	1633	Both
1633	1634	Both
1634	1635	Both
1635	1636	Both
1636	1637	Both
1637	1638	Both
1638	1639	Both
1639	1640	Both
1640	1641	Both
1641	1642	Both
1642	1643	Both
1643	1644	Both
1644	1645	Both
1645	1646	Both
1646	1647	Both
1647	1648	Both
1648	1649	Both
1649	1650	Both
1650	1651	Both
1651	1652	Both
1652	1653	Both
1653	1654	Both
1654	1655	Both
1655	1656	Both
1656	1657	Both
1657	1658	Both
1658	1659	Both
1659	1660	Both
1660	1661	Both
1661	1662	Both
1662	1663	Both
1663	1664	Both
1664	1665	Both
1665	1666	Both
1666	1667	Both
1667	1668	Both
1668	1669	Both
1669	1670	Both
1670	1671	Both
1671	1672	Both
1672	1673	Both
1673	1674	Both
1674	1675	Both
1675	1676	Both
1676	1677	Both
1677	1678	Both
1678	1679	Both
1679	1680	Both
1680	1681	Both
1681	1682	Both
1682	1683	Both
1683	1684	Both
1684	1685	Both
1685	1686	Both
1686	1687	Both
1687	1688	Both
1688	1689	Both
1689	1690	Both
1690	1691	Both
1691	1692	Both
1692	1693	Both
1693	1694	Both
1694	1695	Both
1695	1696	Both
1696	1697	Both
1697	1698	Both
1698	1699	Both
1699	1700	Both
1700	1701	Both
1701	1702	Both
1702	1703	Both
1703	1704	Both
1704	1705	Both
1705	1706	Both
1706	1707	Both
1707	1708	Both
\.


--
-- TOC entry 2459 (class 0 OID 0)
-- Dependencies: 221
-- Name: shirt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('shirt_id_seq', 1707, true);


--
-- TOC entry 2460 (class 0 OID 0)
-- Dependencies: 222
-- Name: shirt_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('shirt_report_id_seq', 1, false);


--
-- TOC entry 2377 (class 0 OID 26974)
-- Dependencies: 223
-- Data for Name: spectator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spectator (id, home_score, away_score, report_id, comment) FROM stdin;
1142	10	10	1143	no problems from either line
1143	9	9	1144	\N
1144	9	9	1145	\N
1145	7	6	1146	\N
1146	6	8	1147	\N
1147	6	6	1148	\N
1148	8	10	1149	\N
1149	7	7	1150	\N
1150	7	8	1151	\N
1151	9	9	1152	\N
1152	10	10	1153	Never heard a  bad word from side lines
1153	7	9	1154	away team had no spectators
1154	8	8	1155	\N
1155	9	9	1156	\N
1156	9	9	1157	\N
1157	9	6	1158	\N
1158	8	7	1159	\N
1159	9	9	1160	\N
1160	10	10	1161	\N
1161	4	8	1162	Racist remark made against Storhtes Hall player
1162	9	9	1163	\N
1163	9	9	1164	\N
1164	10	9	1165	\N
1165	8	7	1166	\N
1166	8	7	1167	\N
1167	10	10	1168	\N
1168	10	10	1169	\N
1169	9	9	1170	\N
1170	10	10	1171	\N
1171	9	9	1172	\N
1172	9	9	1173	\N
1173	8	7	1174	\N
1174	7	9	1175	\N
1175	6	9	1176	\N
1176	8	7	1177	\N
1177	5	5	1178	Abuse from both sets from time to time
1178	6	7	1179	Both very focal and partisan.
1179	9	8	1180	\N
1180	9	9	1181	\N
1181	9	10	1182	\N
1182	9	9	1183	\N
1183	6	9	1184	\N
1184	10	10	1185	\N
1185	9	9	1186	\N
1186	9	8	1187	\N
1187	9	8	1188	\N
1188	9	9	1189	\N
1189	8	8	1190	\N
1190	9	10	1191	\N
1191	10	7	1192	\N
1192	10	10	1193	\N
1193	8	8	1194	\N
1194	7	8	1195	\N
1195	9	7	1196	\N
1196	8	8	1197	\N
1197	8	3	1198	Misconduct report for away spectators
1198	10	10	1199	\N
1199	7	7	1200	\N
1200	10	1	1201	shouting abusive to every decision what was against them 
1201	10	10	1202	\N
1202	8	8	1203	\N
1203	9	9	1204	\N
1204	8	8	1205	\N
1205	10	10	1206	\N
1206	9	9	1207	\N
1207	8	8	1208	\N
1208	8	9	1209	\N
1209	10	10	1210	No problems from either line
1210	6	8	1211	\N
1211	8	8	1212	Home club , no one picked flag up .
1212	9	7	1213	\N
1213	9	8	1214	\N
1214	10	10	1215	\N
1215	7	10	1216	\N
1216	10	9	1217	\N
1217	9	9	1218	\N
1218	9	9	1219	\N
1219	8	8	1220	\N
1220	10	10	1221	\N
1221	9	9	1222	\N
1222	10	10	1223	\N
1223	9	9	1224	\N
1224	10	9	1225	\N
1225	8	8	1226	\N
1226	9	9	1227	\N
1227	10	7	1228	Some comments made by holmbridge fans
1228	9	9	1229	\N
1229	8	8	1230	\N
1230	8	8	1231	\N
1231	9	9	1232	\N
1232	8	8	1233	\N
1233	9	7	1234	Away too partisan.
1234	10	10	1235	\N
1235	6	8	1236	\N
1236	9	9	1237	\N
1237	7	9	1238	\N
1238	9	9	1239	\N
1239	10	10	1240	\N
1240	10	9	1241	\N
1241	10	9	1242	\N
1242	9	9	1243	\N
1243	8	8	1244	\N
1244	8	8	1245	No Bother from either touchline 
1245	9	10	1246	\N
1246	10	10	1247	\N
1247	10	10	1248	\N
1248	1	7	1249	The home spectators seem to think they can shout and abuse the ref over anything I had the same thing with the 1st team also last season I did tell Ronnie so I'm sure they will take notice
1249	10	10	1250	\N
1250	10	10	1251	\N
1251	8	8	1252	well behaved both sets.
1252	9	8	1253	\N
1253	10	10	1254	\N
1254	8	9	1255	\N
1255	9	9	1256	\N
1256	9	9	1257	\N
1257	7	9	1258	\N
1258	9	8	1259	\N
1259	9	9	1260	\N
1260	10	8	1261	\N
1261	9	7	1262	\N
1262	8	9	1263	\N
1263	9	6	1264	\N
1264	7	9	1265	\N
1265	9	9	1266	\N
1266	7	6	1267	\N
1267	8	7	1268	\N
1268	6	9	1269	\N
1269	10	10	1270	\N
1270	10	10	1271	Fantastic behaviour from both lines
1271	9	8	1272	\N
1272	10	10	1273	\N
1273	9	9	1274	\N
1274	8	8	1275	\N
1275	8	8	1276	\N
1276	9	9	1277	\N
1277	9	9	1278	\N
1278	9	9	1279	\N
1279	8	7	1280	\N
1280	9	9	1281	\N
1281	9	9	1282	\N
1282	10	9	1283	\N
1283	9	8	1284	\N
1284	7	10	1285	\N
1285	8	8	1286	\N
1286	10	9	1287	\N
1287	7	7	1288	\N
1288	9	9	1289	\N
1289	6	9	1290	\N
1290	9	10	1291	\N
1291	9	9	1292	\N
1292	8	8	1293	\N
1293	9	9	1294	\N
1294	8	8	1295	\N
1295	10	10	1296	Both sets of spectators were excellent
1296	9	9	1297	\N
1297	8	8	1298	\N
1298	9	9	1299	\N
1299	9	2	1300	A lot of foul abuse from the away spectators. 
1300	9	9	1301	\N
1301	9	6	1302	\N
1302	10	10	1303	\N
1303	8	7	1304	\N
1304	7	8	1305	\N
1305	8	6	1306	\N
1306	9	7	1307	\N
1307	7	6	1308	\N
1308	7	8	1309	\N
1309	10	10	1310	2 new clubs setting a fine example
1310	9	9	1311	\N
1311	9	9	1312	\N
1312	8	8	1313	\N
1313	8	8	1314	\N
1314	8	8	1315	\N
1315	8	9	1316	\N
1316	9	9	1317	\N
1317	9	9	1318	\N
1318	9	9	1319	\N
1319	9	9	1320	\N
1320	8	8	1321	\N
1321	9	10	1322	\N
1322	10	6	1323	\N
1323	7	9	1324	\N
1324	8	8	1325	\N
1325	8	7	1326	\N
1326	9	9	1327	\N
1327	9	8	1328	No problems at all.
1328	8	8	1329	\N
1329	10	10	1330	\N
1330	7	9	1331	\N
1331	10	10	1332	Ni issues from anyone in the crowd
1332	10	8	1333	\N
1333	9	9	1334	\N
1334	7	9	1335	\N
1335	8	8	1336	\N
1336	8	9	1337	\N
1337	8	9	1338	\N
1338	10	10	1339	\N
1339	9	9	1340	\N
1340	9	6	1341	\N
1341	10	10	1342	\N
1342	8	8	1343	\N
1343	10	10	1344	\N
1344	8	8	1345	\N
1345	10	10	1346	\N
1346	8	7	1347	\N
1347	10	9	1348	\N
1348	8	7	1349	\N
1349	6	6	1350	\N
1350	8	9	1351	\N
1351	9	9	1352	\N
1352	7	6	1353	\N
1353	8	9	1354	\N
1354	9	9	1355	\N
1355	7	8	1356	\N
1356	6	10	1357	\N
1357	10	10	1358	\N
1358	10	10	1359	\N
1359	10	2	1360	Golcar Con's fans made sure I knew they though I was crap and that I had spoiled the game by sending off two of their players for violent conduct (one headbutt, and one grabbing someone by the throat).
1360	9	10	1361	\N
1361	9	7	1362	\N
1362	7	8	1363	\N
1363	9	9	1364	\N
1364	8	8	1365	\N
1365	8	7	1366	\N
1366	8	9	1367	\N
1367	8	8	1368	\N
1368	8	5	1369	No away spectators
1369	9	9	1370	\N
1370	9	9	1371	\N
1371	10	10	1372	\N
1372	9	6	1373	\N
1373	8	8	1374	\N
1374	9	9	1375	\N
1375	7	7	1376	\N
1376	10	10	1377	\N
1377	8	6	1378	\N
1378	8	8	1379	\N
1379	9	9	1380	\N
1380	10	10	1381	\N
1381	10	10	1382	\N
1382	8	8	1383	\N
1383	8	8	1384	\N
1384	8	8	1385	\N
1385	9	9	1386	\N
1386	9	9	1387	\N
1387	10	10	1388	\N
1388	8	9	1389	\N
1389	8	7	1390	\N
1390	9	9	1391	\N
1391	8	8	1392	\N
1392	7	9	1393	\N
1393	10	10	1394	\N
1394	5	10	1395	\N
1395	10	10	1396	\N
1396	9	9	1397	\N
1397	9	9	1398	\N
1398	9	9	1399	\N
1399	8	8	1400	\N
1400	9	9	1401	\N
1401	9	8	1402	\N
1402	9	9	1403	\N
1403	8	8	1404	The odd shout here and there but nothing out of the ordinary
1404	9	9	1405	\N
1405	8	7	1406	\N
1406	7	7	1407	\N
1407	8	1	1408	away team had no subs or spectators
1408	8	8	1409	\N
1409	7	9	1410	\N
1410	7	10	1411	\N
1411	10	10	1412	\N
1412	6	8	1413	Home team always try to pressurise referee by appealing for everything and criticising.
1413	9	9	1414	\N
1414	10	10	1415	\N
1415	8	8	1416	\N
1416	8	8	1417	\N
1417	10	10	1418	\N
1418	9	10	1419	One Junction spectator wanted to referee the game from the touchline but was asked by the home coach to button it!!!
1419	8	8	1420	\N
1420	9	9	1421	\N
1421	9	8	1422	\N
1422	9	9	1423	\N
1423	10	10	1424	\N
1424	8	8	1425	\N
1425	9	9	1426	\N
1426	8	5	1427	\N
1427	9	9	1428	\N
1428	10	10	1429	\N
1429	8	7	1430	\N
1430	8	10	1431	\N
1431	8	8	1432	\N
1432	7	8	1433	\N
1433	9	9	1434	\N
1434	8	8	1435	\N
1435	8	8	1436	\N
1436	8	8	1437	\N
1437	7	7	1438	\N
1438	7	5	1439	away support very poor very vocal in challanging and appealing most decisions
1439	9	9	1440	\N
1440	8	9	1441	\N
1441	9	9	1442	\N
1442	7	8	1443	\N
1443	9	9	1444	\N
1444	9	9	1445	\N
1445	8	9	1446	\N
1446	8	9	1447	\N
1447	9	9	1448	\N
1448	8	8	1449	\N
1449	8	8	1450	\N
1450	9	9	1451	\N
1451	9	8	1452	\N
1452	9	7	1453	\N
1453	8	9	1454	\N
1454	9	10	1455	\N
1455	9	9	1456	\N
1456	9	10	1457	\N
1457	9	7	1458	\N
1458	9	9	1459	\N
1459	8	8	1460	\N
1460	8	10	1461	Some Home supporters were very aggrieved that I had not given offside just before Lepton's 3rd goal, with some choice words being used
1461	6	6	1462	some comments from the marsden section were not acceptable,I spoke to the manager and I had no further issues!
1462	8	8	1463	\N
1463	9	10	1464	\N
1464	6	6	1465	\N
1465	9	9	1466	\N
1466	9	9	1467	\N
1467	9	9	1468	\N
1468	10	10	1469	\N
1469	7	10	1470	\N
1470	10	10	1471	\N
1471	9	9	1472	\N
1472	9	8	1473	\N
1473	7	9	1474	\N
1474	8	10	1475	\N
1475	9	9	1476	\N
1476	10	10	1477	no problems
1477	8	7	1478	\N
1478	7	9	1479	\N
1479	1	8	1480	home team spectators shouting abuse told home team I would report this matter
1480	9	9	1481	\N
1481	9	9	1482	\N
1482	8	7	1483	\N
1483	7	7	1484	\N
1484	10	9	1485	\N
1485	9	8	1486	\N
1486	8	8	1487	\N
1487	4	4	1488	Far too partisan which didn't help the game at all.
1488	7	7	1489	\N
1489	6	7	1490	\N
1490	9	9	1491	\N
1491	8	7	1492	\N
1492	9	9	1493	\N
1493	9	8	1494	\N
1494	10	10	1495	\N
1495	3	5	1496	\N
1496	10	10	1497	\N
1497	10	10	1498	\N
1498	10	10	1499	\N
1499	9	9	1500	\N
1500	9	3	1501	Shepley team generally ill disciplined, want to dispute every decision.
1501	10	10	1502	\N
1502	8	8	1503	\N
1503	6	10	1504	\N
1504	9	9	1505	\N
1505	7	7	1506	\N
1506	7	7	1507	\N
1507	8	8	1508	\N
1508	7	6	1509	\N
1509	9	9	1510	\N
1510	6	9	1511	\N
1511	9	9	1512	\N
1512	9	9	1513	\N
1513	5	9	1514	\N
1514	7	7	1515	\N
1515	10	10	1516	\N
1516	9	9	1517	\N
1517	8	6	1518	\N
1518	9	9	1519	\N
1519	9	9	1520	\N
1520	8	8	1521	\N
1521	9	9	1522	\N
1522	10	10	1523	\N
1523	9	9	1524	\N
1524	9	9	1525	\N
1525	10	10	1526	\N
1526	9	9	1527	\N
1527	7	8	1528	\N
1528	10	10	1529	\N
1529	9	9	1530	\N
1530	9	9	1531	\N
1531	9	10	1532	Only one home spectator telling me how to ref the game
1532	9	9	1533	\N
1533	7	9	1534	\N
1534	8	5	1535	Abuse from sidelines
1535	8	8	1536	\N
1536	10	10	1537	\N
1537	9	9	1538	\N
1538	9	9	1539	\N
1539	8	8	1540	\N
1540	10	10	1541	\N
1541	10	2	1542	Smoking weed on touchline
1542	9	9	1543	\N
1543	10	10	1544	No issues from both sets of spectators
1544	9	8	1545	\N
1545	8	8	1546	\N
1546	8	8	1547	\N
1547	9	9	1548	\N
1548	8	8	1549	\N
1549	9	10	1550	\N
1550	9	10	1551	\N
1551	6	9	1552	\N
1552	9	9	1553	\N
1553	8	10	1554	\N
1554	10	10	1555	Both were behaved & no issues
1555	9	9	1556	\N
1556	10	8	1557	\N
1557	9	9	1558	\N
1558	7	9	1559	\N
1559	9	10	1560	\N
1560	9	9	1561	\N
1561	9	8	1562	\N
1562	10	10	1563	\N
1563	10	9	1564	\N
1564	10	10	1565	\N
1565	7	7	1566	\N
1566	9	9	1567	not many there but still good
1567	1	9	1568	Home side had noone on the touchline for the entire game.
1568	10	10	1569	\N
1569	10	10	1570	\N
1570	10	10	1571	\N
1571	8	9	1572	\N
1572	9	8	1573	\N
1573	10	8	1574	\N
1574	8	7	1575	No real problems.
1575	10	10	1576	\N
1576	9	8	1577	\N
1577	9	9	1578	\N
1578	9	8	1579	\N
1579	8	8	1580	\N
1580	7	3	1581	Shelley touchline questioned most decisions throughout the game.
1581	10	10	1582	\N
1582	8	8	1583	\N
1583	9	9	1584	No problems
1584	8	8	1585	\N
1585	10	8	1586	\N
1586	9	9	1587	\N
1587	10	10	1588	\N
1588	10	10	1589	\N
1589	3	10	1590	\N
1590	9	9	1591	\N
1591	5	10	1592	\N
1592	8	10	1593	\N
1593	6	8	1594	\N
1594	9	10	1595	\N
1595	9	9	1596	\N
1596	9	9	1597	\N
1597	10	10	1598	\N
1598	10	10	1599	\N
1599	6	7	1600	hard to comment on KKS only had 1 person with a flag
1600	8	8	1601	\N
1601	8	8	1602	\N
1602	9	9	1603	\N
1603	9	9	1604	\N
1604	7	8	1605	\N
1605	9	9	1606	\N
1606	9	9	1607	\N
1607	9	9	1608	\N
1608	9	6	1609	\N
1609	10	10	1610	\N
1610	9	9	1611	\N
1611	6	9	1612	\N
1612	10	10	1613	\N
1613	9	9	1614	\N
1614	10	10	1615	\N
1615	8	8	1616	\N
1616	8	6	1617	\N
1617	9	9	1618	\N
1618	8	8	1619	\N
1619	9	9	1620	\N
1620	9	9	1621	\N
1621	9	9	1622	\N
1622	9	6	1623	\N
1623	7	7	1624	\N
1624	8	8	1625	\N
1625	8	6	1626	\N
1626	10	10	1627	\N
1627	9	10	1628	\N
1628	9	9	1629	\N
1629	9	9	1630	\N
1630	6	8	1631	\N
1631	10	10	1632	\N
1632	7	8	1633	\N
1633	9	8	1634	\N
1634	9	10	1635	\N
1635	9	9	1636	\N
1636	9	9	1637	\N
1637	8	9	1638	\N
1638	8	8	1639	\N
1639	10	10	1640	\N
1640	9	9	1641	\N
1641	8	3	1642	Constant heckling and foul language
1642	8	10	1643	bit of dissent from Home team manager - Everybody else fine - netherton no problems very well behaved
1643	9	9	1644	\N
1644	8	8	1645	\N
1645	9	9	1646	\N
1646	8	8	1647	\N
1647	8	8	1648	\N
1648	9	7	1649	\N
1649	7	9	1650	\N
1650	9	9	1651	\N
1651	8	8	1652	\N
1652	8	7	1653	\N
1653	9	9	1654	\N
1654	10	10	1655	No problems from either line
1655	9	10	1656	\N
1656	9	9	1657	Never heard a word from spectators. Pouring rain probably helped.
1657	10	10	1658	\N
1658	10	10	1659	\N
1659	9	8	1660	\N
1660	9	9	1661	\N
1661	8	8	1662	\N
1662	9	9	1663	\N
1663	9	9	1664	\N
1664	9	9	1665	\N
1665	7	3	1666	all was well until an icident where i had to send a skelmanthorpe player off, most of the officials and spectors and subs came onto the field of play to remonstrate with the player and would have been a more serious incident if the player hadnt been dragged away, also substitue who i didnt know was a substitute was abusive after this incident. not a very nice experience for an experienced official like myself
1666	10	10	1667	\N
1667	8	8	1668	\N
1668	9	9	1669	\N
1669	9	9	1670	\N
1670	9	7	1671	\N
1671	10	8	1672	\N
1672	9	9	1673	\N
1673	7	9	1674	\N
1674	10	10	1675	\N
1675	9	9	1676	\N
1676	9	8	1677	\N
1677	8	7	1678	\N
1678	9	6	1679	\N
1679	10	10	1680	\N
1680	10	7	1681	\N
1681	10	10	1682	\N
1682	6	8	1683	\N
1683	7	7	1684	\N
1684	8	10	1685	\N
1685	4	8	1686	home fans abusive to me and visiting players.
1686	7	8	1687	\N
1687	8	8	1688	\N
1688	9	9	1689	\N
1689	10	10	1690	\N
1690	9	9	1691	\N
1691	8	8	1692	\N
1692	9	9	1693	\N
1693	9	10	1694	\N
1694	9	9	1695	Touchlines were great
1695	9	9	1696	\N
1696	8	6	1697	some verbal abuse from touchline,but put a stop to it straight away.
1697	8	8	1698	\N
1698	9	9	1699	\N
1699	10	10	1700	\N
1700	10	10	1701	\N
1701	8	8	1702	\N
1702	10	10	1703	\N
1703	6	8	1704	\N
1704	6	6	1705	\N
1705	9	9	1706	\N
1706	10	10	1707	\N
1707	6	9	1708	\N
\.


--
-- TOC entry 2461 (class 0 OID 0)
-- Dependencies: 224
-- Name: spectator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spectator_id_seq', 1707, true);


--
-- TOC entry 2462 (class 0 OID 0)
-- Dependencies: 225
-- Name: spectator_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spectator_report_id_seq', 1, false);


--
-- TOC entry 2380 (class 0 OID 26984)
-- Dependencies: 226
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY team (id, name, competition) FROM stdin;
270	Scissett	850
271	Colne Valley	850
272	Newsome	851
273	Britannia Sports	851
274	Lepton Highlanders	850
275	Brook Motors	850
276	Shelley	851
277	Heywood Irish Centre	851
278	Holmbridge	851
279	Diggle	851
280	Berry Brow	851
281	Heyside	851
282	KKS Spartans	852
283	Honley	852
284	Linthwaite Athletic	852
285	Scholes	852
286	Flockton	850
287	Grange Moor	850
288	Heyside A	853
289	Hade Edge A	853
290	Berry Brow A	854
291	Uppermill Reserves	854
292	Meltham Athletic A	855
293	Scholes Reserves	855
294	Hepworth United Reserves	856
295	Netherton Reserves	856
296	Hade Edge	850
297	Paddock Rangers	850
298	Hade Edge Reserves	854
299	Scissett A	854
300	Almondbury Woolpack Reserves	853
301	Almondbury WMC Reserves	853
302	Moorside Reserves	854
303	Britannia Sports A	854
304	Flockton Reserves	854
305	Linthwaite Athletic Reserves	854
306	Berry Brow Reserves	856
307	Heyside Reserves	856
308	Thornhill United	857
309	Storthes Hall	857
310	Cumberworth Reserves	855
311	Scissett Reserves	855
312	Skelmanthorpe	851
313	Hepworth United	851
314	Shelley A	853
315	Honley A	853
316	Brighouse Old Boys	857
317	Mount	857
318	Kirkheaton Rovers A	855
319	H.V. Academicals Reserves	855
320	Skelmanthorpe Reserves	856
321	Kirkheaton Rovers Reserves	856
322	Shepley	851
323	Meltham Athletic	852
324	Marsden	852
325	H.V. Academicals	852
326	Holmfirth Town	851
327	Almondbury Woolpack	857
328	Cartworth Moor	857
329	Black Horse	857
330	3D Dynamoes	857
331	Uppermill	850
332	Golcar United	857
333	Junction	857
334	Almondbury WMC	857
335	Moorside	850
336	AFC Lindley	852
337	Netherton	852
338	Black Horse Reserves	853
339	Scholes A	853
340	Newsome Reserves	856
341	Slaithwaite United	850
342	Meltham Athletic Reserves	856
343	Junction Reserves	854
344	Brook Motors Reserves	855
345	Shelley Reserves	856
346	Britannia Sports Reserves	855
347	Holmbridge Reserves	855
348	Wooldale Wanderers Reserves	855
349	Slaithwaite United Reserves	855
350	AFC Lindley Reserves	855
351	Aimbry Reserves	854
352	Aimbry	852
353	Kirkheaton Rovers	852
354	Shepley Reserves	856
355	Netherton A	853
356	Grange Moor Reserves	853
357	KSL Dalton	858
358	KSL Wellington Westgate	858
359	Railway Berry Brow	857
360	Brighouse Athletic	857
361	KSL Linthwaite	858
362	KSL Meltham Victoria	858
363	Marsden Reserves	854
364	Cumberworth	852
365	3D Dynamoes Reserves	853
366	Wooldale Wanderers	850
367	Lindley Saddle	857
368	KSL Nightingale	858
369	Diggle Reserves	856
370	Heywood Irish Centre Reserves	856
371	Honley Reserves	854
372	Cumberworth B	853
373	KSL Golcar Conservative	858
374	Thornhill United Reserves	853
375	KSL Foresters Honley	858
376	KSL Linthwaite Reserves	858
377	KSL Walkers Hounds	858
378	WL Cask	859
379	WL Lindley Saddle	859
380	WL Lepton Highlanders	859
381	WL Soverign Sports	859
382	Mount Reserves	854
383	KKS Spartans Reserves	855
384	WL DRAM	859
385	WL Grimescar	859
386	Holmfirth Town (W/R)	860
387	Lepton Highlanders (W/R)	860
388	YMCA (W/R)	860
389	Newsome (W/R)	860
390	Cumberworth A	861
391	Golcar United (W/R)	860
392	Shelley (WYL)	860
393	WL Royal Dolphins	859
394	 KKS Spartans Reserves	855
\.


--
-- TOC entry 2463 (class 0 OID 0)
-- Dependencies: 227
-- Name: team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('team_id_seq', 394, true);


--
-- TOC entry 2382 (class 0 OID 26991)
-- Dependencies: 228
-- Data for Name: team_sheet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY team_sheet (id, received, report_id) FROM stdin;
1142	Both	1143
1143	Both	1144
1144	Both	1145
1145	Both	1146
1146	Both	1147
1147	Both	1148
1148	Both	1149
1149	Both	1150
1150	Both	1151
1151	Both	1152
1152	Home	1153
1153	Neither	1154
1154	Both	1155
1155	Home	1156
1156	Both	1157
1157	Home	1158
1158	Both	1159
1159	Both	1160
1160	Both	1161
1161	Home	1162
1162	Both	1163
1163	Both	1164
1164	Both	1165
1165	Home	1166
1166	Both	1167
1167	Both	1168
1168	Both	1169
1169	Both	1170
1170	Both	1171
1171	Both	1172
1172	Both	1173
1173	Away	1174
1174	Both	1175
1175	Both	1176
1176	Both	1177
1177	Both	1178
1178	Away	1179
1179	Both	1180
1180	Both	1181
1181	Both	1182
1182	Both	1183
1183	Both	1184
1184	Both	1185
1185	Both	1186
1186	Both	1187
1187	Both	1188
1188	Both	1189
1189	Both	1190
1190	Both	1191
1191	Both	1192
1192	Both	1193
1193	Neither	1194
1194	Both	1195
1195	Both	1196
1196	Both	1197
1197	Both	1198
1198	Both	1199
1199	Both	1200
1200	Both	1201
1201	Both	1202
1202	Home	1203
1203	Both	1204
1204	Both	1205
1205	Both	1206
1206	Both	1207
1207	Both	1208
1208	Both	1209
1209	Both	1210
1210	Both	1211
1211	Both	1212
1212	Both	1213
1213	Home	1214
1214	Both	1215
1215	Both	1216
1216	Home	1217
1217	Both	1218
1218	Both	1219
1219	Both	1220
1220	Both	1221
1221	Both	1222
1222	Both	1223
1223	Both	1224
1224	Both	1225
1225	Both	1226
1226	Both	1227
1227	Both	1228
1228	Both	1229
1229	Home	1230
1230	Both	1231
1231	Both	1232
1232	Both	1233
1233	Both	1234
1234	Both	1235
1235	Both	1236
1236	Both	1237
1237	Both	1238
1238	Both	1239
1239	Both	1240
1240	Both	1241
1241	Both	1242
1242	Both	1243
1243	Both	1244
1244	Both	1245
1245	Both	1246
1246	Both	1247
1247	Both	1248
1248	Both	1249
1249	Both	1250
1250	Both	1251
1251	Away	1252
1252	Both	1253
1253	Both	1254
1254	Both	1255
1255	Both	1256
1256	Both	1257
1257	Both	1258
1258	Both	1259
1259	Both	1260
1260	Both	1261
1261	Both	1262
1262	Both	1263
1263	Both	1264
1264	Both	1265
1265	Both	1266
1266	Both	1267
1267	Both	1268
1268	Both	1269
1269	Both	1270
1270	Both	1271
1271	Both	1272
1272	Both	1273
1273	Both	1274
1274	Both	1275
1275	Both	1276
1276	Both	1277
1277	Both	1278
1278	Both	1279
1279	Both	1280
1280	Both	1281
1281	Away	1282
1282	Both	1283
1283	Both	1284
1284	Both	1285
1285	Both	1286
1286	Both	1287
1287	Both	1288
1288	Both	1289
1289	Both	1290
1290	Both	1291
1291	Both	1292
1292	Both	1293
1293	Both	1294
1294	Both	1295
1295	Both	1296
1296	Both	1297
1297	Both	1298
1298	Both	1299
1299	Both	1300
1300	Both	1301
1301	Both	1302
1302	Both	1303
1303	Both	1304
1304	Both	1305
1305	Both	1306
1306	Both	1307
1307	Both	1308
1308	Both	1309
1309	Both	1310
1310	Home	1311
1311	Both	1312
1312	Both	1313
1313	Both	1314
1314	Both	1315
1315	Both	1316
1316	Both	1317
1317	Both	1318
1318	Both	1319
1319	Both	1320
1320	Both	1321
1321	Both	1322
1322	Both	1323
1323	Both	1324
1324	Both	1325
1325	Both	1326
1326	Both	1327
1327	Both	1328
1328	Both	1329
1329	Both	1330
1330	Both	1331
1331	Both	1332
1332	Both	1333
1333	Both	1334
1334	Both	1335
1335	Both	1336
1336	Both	1337
1337	Both	1338
1338	Both	1339
1339	Both	1340
1340	Both	1341
1341	Both	1342
1342	Both	1343
1343	Both	1344
1344	Both	1345
1345	Both	1346
1346	Both	1347
1347	Both	1348
1348	Both	1349
1349	Both	1350
1350	Both	1351
1351	Home	1352
1352	Both	1353
1353	Home	1354
1354	Both	1355
1355	Both	1356
1356	Both	1357
1357	Both	1358
1358	Both	1359
1359	Both	1360
1360	Both	1361
1361	Both	1362
1362	Both	1363
1363	Both	1364
1364	Both	1365
1365	Both	1366
1366	Both	1367
1367	Both	1368
1368	Both	1369
1369	Both	1370
1370	Home	1371
1371	Both	1372
1372	Both	1373
1373	Both	1374
1374	Both	1375
1375	Home	1376
1376	Both	1377
1377	Both	1378
1378	Both	1379
1379	Both	1380
1380	Both	1381
1381	Both	1382
1382	Both	1383
1383	Both	1384
1384	Both	1385
1385	Both	1386
1386	Both	1387
1387	Both	1388
1388	Both	1389
1389	Both	1390
1390	Both	1391
1391	Both	1392
1392	Both	1393
1393	Both	1394
1394	Both	1395
1395	Both	1396
1396	Both	1397
1397	Both	1398
1398	Home	1399
1399	Both	1400
1400	Both	1401
1401	Both	1402
1402	Both	1403
1403	Both	1404
1404	Both	1405
1405	Both	1406
1406	Both	1407
1407	Both	1408
1408	Both	1409
1409	Both	1410
1410	Both	1411
1411	Both	1412
1412	Both	1413
1413	Both	1414
1414	Both	1415
1415	Both	1416
1416	Both	1417
1417	Both	1418
1418	Both	1419
1419	Both	1420
1420	Both	1421
1421	Both	1422
1422	Both	1423
1423	Both	1424
1424	Home	1425
1425	Both	1426
1426	Both	1427
1427	Both	1428
1428	Both	1429
1429	Both	1430
1430	Both	1431
1431	Both	1432
1432	Both	1433
1433	Both	1434
1434	Both	1435
1435	Both	1436
1436	Both	1437
1437	Both	1438
1438	Both	1439
1439	Both	1440
1440	Both	1441
1441	Both	1442
1442	Both	1443
1443	Both	1444
1444	Both	1445
1445	Both	1446
1446	Both	1447
1447	Both	1448
1448	Both	1449
1449	Both	1450
1450	Both	1451
1451	Both	1452
1452	Both	1453
1453	Both	1454
1454	Both	1455
1455	Both	1456
1456	Both	1457
1457	Both	1458
1458	Both	1459
1459	Both	1460
1460	Both	1461
1461	Both	1462
1462	Both	1463
1463	Both	1464
1464	Home	1465
1465	Both	1466
1466	Both	1467
1467	Both	1468
1468	Both	1469
1469	Both	1470
1470	Both	1471
1471	Both	1472
1472	Both	1473
1473	Both	1474
1474	Both	1475
1475	Both	1476
1476	Both	1477
1477	Both	1478
1478	Both	1479
1479	Both	1480
1480	Both	1481
1481	Both	1482
1482	Home	1483
1483	Both	1484
1484	Both	1485
1485	Both	1486
1486	Both	1487
1487	Both	1488
1488	Both	1489
1489	Both	1490
1490	Both	1491
1491	Both	1492
1492	Both	1493
1493	Home	1494
1494	Both	1495
1495	Both	1496
1496	Both	1497
1497	Both	1498
1498	Both	1499
1499	Both	1500
1500	Both	1501
1501	Both	1502
1502	Both	1503
1503	Both	1504
1504	Both	1505
1505	Both	1506
1506	Both	1507
1507	Both	1508
1508	Both	1509
1509	Both	1510
1510	Both	1511
1511	Both	1512
1512	Both	1513
1513	Both	1514
1514	Both	1515
1515	Both	1516
1516	Both	1517
1517	Neither	1518
1518	Both	1519
1519	Both	1520
1520	Both	1521
1521	Both	1522
1522	Both	1523
1523	Both	1524
1524	Both	1525
1525	Both	1526
1526	Both	1527
1527	Both	1528
1528	Both	1529
1529	Both	1530
1530	Both	1531
1531	Both	1532
1532	Both	1533
1533	Both	1534
1534	Home	1535
1535	Both	1536
1536	Both	1537
1537	Both	1538
1538	Both	1539
1539	Both	1540
1540	Both	1541
1541	Home	1542
1542	Both	1543
1543	Home	1544
1544	Both	1545
1545	Both	1546
1546	Both	1547
1547	Both	1548
1548	Both	1549
1549	Both	1550
1550	Both	1551
1551	Both	1552
1552	Away	1553
1553	Both	1554
1554	Both	1555
1555	Both	1556
1556	Neither	1557
1557	Both	1558
1558	Both	1559
1559	Both	1560
1560	Both	1561
1561	Both	1562
1562	Both	1563
1563	Both	1564
1564	Both	1565
1565	Both	1566
1566	Both	1567
1567	Both	1568
1568	Both	1569
1569	Both	1570
1570	Both	1571
1571	Both	1572
1572	Both	1573
1573	Both	1574
1574	Both	1575
1575	Both	1576
1576	Both	1577
1577	Both	1578
1578	Both	1579
1579	Both	1580
1580	Home	1581
1581	Both	1582
1582	Both	1583
1583	Both	1584
1584	Both	1585
1585	Both	1586
1586	Both	1587
1587	Both	1588
1588	Both	1589
1589	Both	1590
1590	Both	1591
1591	Both	1592
1592	Both	1593
1593	Both	1594
1594	Both	1595
1595	Both	1596
1596	Both	1597
1597	Both	1598
1598	Both	1599
1599	Both	1600
1600	Both	1601
1601	Both	1602
1602	Both	1603
1603	Both	1604
1604	Both	1605
1605	Both	1606
1606	Both	1607
1607	Both	1608
1608	Both	1609
1609	Both	1610
1610	Home	1611
1611	Both	1612
1612	Both	1613
1613	Neither	1614
1614	Both	1615
1615	Both	1616
1616	Both	1617
1617	Both	1618
1618	Both	1619
1619	Both	1620
1620	Both	1621
1621	Both	1622
1622	Both	1623
1623	Both	1624
1624	Both	1625
1625	Both	1626
1626	Both	1627
1627	Both	1628
1628	Both	1629
1629	Both	1630
1630	Both	1631
1631	Both	1632
1632	Both	1633
1633	Both	1634
1634	Both	1635
1635	Both	1636
1636	Both	1637
1637	Both	1638
1638	Both	1639
1639	Both	1640
1640	Both	1641
1641	Both	1642
1642	Both	1643
1643	Both	1644
1644	Both	1645
1645	Both	1646
1646	Both	1647
1647	Both	1648
1648	Both	1649
1649	Both	1650
1650	Both	1651
1651	Both	1652
1652	Both	1653
1653	Both	1654
1654	Both	1655
1655	Both	1656
1656	Both	1657
1657	Both	1658
1658	Both	1659
1659	Both	1660
1660	Both	1661
1661	Both	1662
1662	Both	1663
1663	Both	1664
1664	Both	1665
1665	Both	1666
1666	Both	1667
1667	Both	1668
1668	Both	1669
1669	Both	1670
1670	Both	1671
1671	Home	1672
1672	Both	1673
1673	Both	1674
1674	Both	1675
1675	Both	1676
1676	Both	1677
1677	Both	1678
1678	Both	1679
1679	Neither	1680
1680	Both	1681
1681	Both	1682
1682	Both	1683
1683	Both	1684
1684	Both	1685
1685	Both	1686
1686	Away	1687
1687	Both	1688
1688	Both	1689
1689	Both	1690
1690	Both	1691
1691	Both	1692
1692	Both	1693
1693	Both	1694
1694	Both	1695
1695	Both	1696
1696	Both	1697
1697	Both	1698
1698	Both	1699
1699	Both	1700
1700	Both	1701
1701	Both	1702
1702	Both	1703
1703	Both	1704
1704	Both	1705
1705	Both	1706
1706	Both	1707
1707	Both	1708
\.


--
-- TOC entry 2464 (class 0 OID 0)
-- Dependencies: 229
-- Name: team_sheet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('team_sheet_id_seq', 1707, true);


--
-- TOC entry 2465 (class 0 OID 0)
-- Dependencies: 230
-- Name: team_sheet_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('team_sheet_report_id_seq', 1, false);


--
-- TOC entry 2385 (class 0 OID 26998)
-- Dependencies: 231
-- Data for Name: use; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY use (id, referee_id, email, password, type, created, approved, remind, validated, validation_code) FROM stdin;
23	106	a@a.com	$2a$10$EKD.X3iuYjnEZaOJ957bx.ZEDD58NqZ6DRryxHwCxK9/TuD.OtLcy	ADMIN	2016-03-11	t	t	t	\N
24	107	b@b.com	$2a$10$0CbS/X0OZSvW8ocHWnT7s.kEbQdeYIGuphI7wg4B4HGwf.bp6N6Yq	DEFAULT	2016-03-11	t	t	f	db8579d9-912c-4da1-9699-c18328a29c54
25	108	c@c.com	$2a$10$MiTwunGmo.6a668Cb6myoe3joXSmWTC24kWE.Cv485BGfrRVjQ6aG	DEFAULT	2016-03-11	f	t	f	33628a37-2e05-4e59-b839-2ac42220de4f
\.


--
-- TOC entry 2466 (class 0 OID 0)
-- Dependencies: 232
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_id_seq', 25, true);


--
-- TOC entry 2467 (class 0 OID 0)
-- Dependencies: 233
-- Name: user_referee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_referee_id_seq', 1, false);


--
-- TOC entry 2168 (class 2606 OID 27046)
-- Name: armband_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY captain_armband
    ADD CONSTRAINT armband_pkey PRIMARY KEY (id);


--
-- TOC entry 2164 (class 2606 OID 27048)
-- Name: assistant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assistant
    ADD CONSTRAINT assistant_pkey PRIMARY KEY (id);


--
-- TOC entry 2166 (class 2606 OID 27050)
-- Name: ball_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ball
    ADD CONSTRAINT ball_pkey PRIMARY KEY (id);


--
-- TOC entry 2170 (class 2606 OID 27052)
-- Name: captain_liaison_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY captain_liaison
    ADD CONSTRAINT captain_liaison_pkey PRIMARY KEY (id);


--
-- TOC entry 2174 (class 2606 OID 27054)
-- Name: comp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY competition
    ADD CONSTRAINT comp_pkey PRIMARY KEY (id);


--
-- TOC entry 2176 (class 2606 OID 27056)
-- Name: contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- TOC entry 2198 (class 2606 OID 27058)
-- Name: email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY use
    ADD CONSTRAINT email_unique UNIQUE (email);


--
-- TOC entry 2172 (class 2606 OID 27060)
-- Name: facility_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY changing_facility
    ADD CONSTRAINT facility_pkey PRIMARY KEY (id);


--
-- TOC entry 2178 (class 2606 OID 27062)
-- Name: hospitality_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY home_hospitality
    ADD CONSTRAINT hospitality_pkey PRIMARY KEY (id);


--
-- TOC entry 2180 (class 2606 OID 27064)
-- Name: kick_off_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kick_off
    ADD CONSTRAINT kick_off_pkey PRIMARY KEY (id);


--
-- TOC entry 2182 (class 2606 OID 27066)
-- Name: league_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY league
    ADD CONSTRAINT league_pkey PRIMARY KEY (id);


--
-- TOC entry 2184 (class 2606 OID 27068)
-- Name: overall_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY overall_score
    ADD CONSTRAINT overall_pkey PRIMARY KEY (id);


--
-- TOC entry 2186 (class 2606 OID 27070)
-- Name: ref_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY referee
    ADD CONSTRAINT ref_pk PRIMARY KEY (id);


--
-- TOC entry 2188 (class 2606 OID 27072)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2190 (class 2606 OID 27074)
-- Name: shirt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shirt
    ADD CONSTRAINT shirt_pkey PRIMARY KEY (id);


--
-- TOC entry 2192 (class 2606 OID 27076)
-- Name: spectator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spectator
    ADD CONSTRAINT spectator_pkey PRIMARY KEY (id);


--
-- TOC entry 2194 (class 2606 OID 27078)
-- Name: team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


--
-- TOC entry 2196 (class 2606 OID 27080)
-- Name: team_sheet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY team_sheet
    ADD CONSTRAINT team_sheet_pkey PRIMARY KEY (id);


--
-- TOC entry 2200 (class 2606 OID 27082)
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY use
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2211 (class 2606 OID 27083)
-- Name: away_team_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY report
    ADD CONSTRAINT away_team_fkey FOREIGN KEY (away_team_id) REFERENCES team(id);


--
-- TOC entry 2213 (class 2606 OID 27093)
-- Name: competition_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY report
    ADD CONSTRAINT competition_fkey FOREIGN KEY (competition) REFERENCES competition(id);


--
-- TOC entry 2217 (class 2606 OID 27205)
-- Name: competition_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY team
    ADD CONSTRAINT competition_fkey FOREIGN KEY (competition) REFERENCES competition(id);


--
-- TOC entry 2212 (class 2606 OID 27088)
-- Name: home_team_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY report
    ADD CONSTRAINT home_team_fkey FOREIGN KEY (home_team_id) REFERENCES team(id);


--
-- TOC entry 2206 (class 2606 OID 27103)
-- Name: league_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY competition
    ADD CONSTRAINT league_fkey FOREIGN KEY (league) REFERENCES league(id);


--
-- TOC entry 2214 (class 2606 OID 27108)
-- Name: referee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY report
    ADD CONSTRAINT referee_fkey FOREIGN KEY (referee_id) REFERENCES referee(id);


--
-- TOC entry 2219 (class 2606 OID 27113)
-- Name: referee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY use
    ADD CONSTRAINT referee_fkey FOREIGN KEY (referee_id) REFERENCES referee(id);


--
-- TOC entry 2205 (class 2606 OID 27118)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY changing_facility
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2209 (class 2606 OID 27123)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kick_off
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2216 (class 2606 OID 27128)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spectator
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2202 (class 2606 OID 27133)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ball
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2215 (class 2606 OID 27138)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shirt
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2201 (class 2606 OID 27143)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assistant
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2208 (class 2606 OID 27148)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY home_hospitality
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2218 (class 2606 OID 27153)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY team_sheet
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2207 (class 2606 OID 27158)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2204 (class 2606 OID 27163)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY captain_liaison
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2203 (class 2606 OID 27168)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY captain_armband
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2210 (class 2606 OID 27173)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY overall_score
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2394 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-03-12 20:39:23

--
-- PostgreSQL database dump complete
--


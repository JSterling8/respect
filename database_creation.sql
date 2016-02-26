--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5beta1
-- Dumped by pg_dump version 9.5beta1

-- Started on 2016-02-25 23:45:22

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2395 (class 1262 OID 25162)
-- Name: respect; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE respect WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United Kingdom.1252' LC_CTYPE = 'English_United Kingdom.1252';


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
-- TOC entry 235 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2398 (class 0 OID 0)
-- Dependencies: 235
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 213 (class 1259 OID 25375)
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
-- TOC entry 211 (class 1259 OID 25371)
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
-- TOC entry 2399 (class 0 OID 0)
-- Dependencies: 211
-- Name: assistant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE assistant_id_seq OWNED BY assistant.id;


--
-- TOC entry 212 (class 1259 OID 25373)
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
-- TOC entry 2400 (class 0 OID 0)
-- Dependencies: 212
-- Name: assistant_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE assistant_report_id_seq OWNED BY assistant.report_id;


--
-- TOC entry 205 (class 1259 OID 25316)
-- Name: ball; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ball (
    id integer NOT NULL,
    provided boolean NOT NULL,
    report_id integer NOT NULL
);


ALTER TABLE ball OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 25312)
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
-- TOC entry 2401 (class 0 OID 0)
-- Dependencies: 203
-- Name: ball_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ball_id_seq OWNED BY ball.id;


--
-- TOC entry 204 (class 1259 OID 25314)
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
-- TOC entry 2402 (class 0 OID 0)
-- Dependencies: 204
-- Name: ball_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ball_report_id_seq OWNED BY ball.report_id;


--
-- TOC entry 228 (class 1259 OID 25462)
-- Name: captain_armband; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE captain_armband (
    id integer NOT NULL,
    report_id integer NOT NULL,
    home_away_both_neither character varying(255) NOT NULL
);


ALTER TABLE captain_armband OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 25458)
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
-- TOC entry 2403 (class 0 OID 0)
-- Dependencies: 226
-- Name: captain_armband_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE captain_armband_id_seq OWNED BY captain_armband.id;


--
-- TOC entry 227 (class 1259 OID 25460)
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
-- TOC entry 2404 (class 0 OID 0)
-- Dependencies: 227
-- Name: captain_armband_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE captain_armband_report_id_seq OWNED BY captain_armband.report_id;


--
-- TOC entry 225 (class 1259 OID 25443)
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
-- TOC entry 223 (class 1259 OID 25439)
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
-- TOC entry 2405 (class 0 OID 0)
-- Dependencies: 223
-- Name: captain_liaison_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE captain_liaison_id_seq OWNED BY captain_liaison.id;


--
-- TOC entry 224 (class 1259 OID 25441)
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
-- TOC entry 2406 (class 0 OID 0)
-- Dependencies: 224
-- Name: captain_liaison_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE captain_liaison_report_id_seq OWNED BY captain_liaison.report_id;


--
-- TOC entry 195 (class 1259 OID 25249)
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
-- TOC entry 193 (class 1259 OID 25245)
-- Name: changing_facilitiy_score_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE changing_facilitiy_score_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE changing_facilitiy_score_id_seq OWNER TO postgres;

--
-- TOC entry 2407 (class 0 OID 0)
-- Dependencies: 193
-- Name: changing_facilitiy_score_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE changing_facilitiy_score_id_seq OWNED BY changing_facility.id;


--
-- TOC entry 194 (class 1259 OID 25247)
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
-- TOC entry 2408 (class 0 OID 0)
-- Dependencies: 194
-- Name: changing_facilitiy_score_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE changing_facilitiy_score_report_id_seq OWNED BY changing_facility.report_id;


--
-- TOC entry 192 (class 1259 OID 25233)
-- Name: competition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE competition (
    id integer NOT NULL,
    name character varying(255),
    league integer NOT NULL
);


ALTER TABLE competition OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 25229)
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
-- TOC entry 2409 (class 0 OID 0)
-- Dependencies: 190
-- Name: competition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE competition_id_seq OWNED BY competition.id;


--
-- TOC entry 191 (class 1259 OID 25231)
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
-- TOC entry 2410 (class 0 OID 0)
-- Dependencies: 191
-- Name: competition_league_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE competition_league_seq OWNED BY competition.league;


--
-- TOC entry 222 (class 1259 OID 25427)
-- Name: contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE contact (
    id integer NOT NULL,
    yes_no_club character varying(255) NOT NULL,
    report_id integer NOT NULL
);


ALTER TABLE contact OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 25423)
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
-- TOC entry 2411 (class 0 OID 0)
-- Dependencies: 220
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contact_id_seq OWNED BY contact.id;


--
-- TOC entry 221 (class 1259 OID 25425)
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
-- TOC entry 2412 (class 0 OID 0)
-- Dependencies: 221
-- Name: contact_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contact_report_id_seq OWNED BY contact.report_id;


--
-- TOC entry 216 (class 1259 OID 25395)
-- Name: home_hospitality; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE home_hospitality (
    id integer NOT NULL,
    score smallint NOT NULL,
    report_id integer NOT NULL
);


ALTER TABLE home_hospitality OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 25391)
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
-- TOC entry 2413 (class 0 OID 0)
-- Dependencies: 214
-- Name: home_hospitality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE home_hospitality_id_seq OWNED BY home_hospitality.id;


--
-- TOC entry 215 (class 1259 OID 25393)
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
-- TOC entry 2414 (class 0 OID 0)
-- Dependencies: 215
-- Name: home_hospitality_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE home_hospitality_report_id_seq OWNED BY home_hospitality.report_id;


--
-- TOC entry 198 (class 1259 OID 25268)
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
-- TOC entry 196 (class 1259 OID 25264)
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
-- TOC entry 2415 (class 0 OID 0)
-- Dependencies: 196
-- Name: late_kick_off_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE late_kick_off_id_seq OWNED BY kick_off.id;


--
-- TOC entry 197 (class 1259 OID 25266)
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
-- TOC entry 2416 (class 0 OID 0)
-- Dependencies: 197
-- Name: late_kick_off_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE late_kick_off_report_id_seq OWNED BY kick_off.report_id;


--
-- TOC entry 185 (class 1259 OID 25187)
-- Name: league; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE league (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE league OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 25185)
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
-- TOC entry 2417 (class 0 OID 0)
-- Dependencies: 184
-- Name: league_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE league_id_seq OWNED BY league.id;


--
-- TOC entry 231 (class 1259 OID 25478)
-- Name: overall_score; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE overall_score (
    id integer NOT NULL,
    report_id integer NOT NULL,
    home_score smallint NOT NULL,
    away_score smallint NOT NULL
);


ALTER TABLE overall_score OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 25474)
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
-- TOC entry 2418 (class 0 OID 0)
-- Dependencies: 229
-- Name: overall_score_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE overall_score_id_seq OWNED BY overall_score.id;


--
-- TOC entry 230 (class 1259 OID 25476)
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
-- TOC entry 2419 (class 0 OID 0)
-- Dependencies: 230
-- Name: overall_score_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE overall_score_report_id_seq OWNED BY overall_score.report_id;


--
-- TOC entry 180 (class 1259 OID 25163)
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
-- TOC entry 181 (class 1259 OID 25166)
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
-- TOC entry 2420 (class 0 OID 0)
-- Dependencies: 181
-- Name: referee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE referee_id_seq OWNED BY referee.id;


--
-- TOC entry 183 (class 1259 OID 25179)
-- Name: report; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE report (
    id integer NOT NULL,
    date date NOT NULL,
    league integer NOT NULL,
    referee_id integer NOT NULL,
    home_team_id integer NOT NULL,
    away_team_id integer NOT NULL
);


ALTER TABLE report OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 25351)
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
-- TOC entry 2421 (class 0 OID 0)
-- Dependencies: 210
-- Name: report_away_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE report_away_team_id_seq OWNED BY report.away_team_id;


--
-- TOC entry 209 (class 1259 OID 25344)
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
-- TOC entry 2422 (class 0 OID 0)
-- Dependencies: 209
-- Name: report_home_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE report_home_team_id_seq OWNED BY report.home_team_id;


--
-- TOC entry 182 (class 1259 OID 25177)
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
-- TOC entry 2423 (class 0 OID 0)
-- Dependencies: 182
-- Name: report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE report_id_seq OWNED BY report.id;


--
-- TOC entry 186 (class 1259 OID 25193)
-- Name: report_league_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE report_league_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE report_league_seq OWNER TO postgres;

--
-- TOC entry 2424 (class 0 OID 0)
-- Dependencies: 186
-- Name: report_league_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE report_league_seq OWNED BY report.league;


--
-- TOC entry 202 (class 1259 OID 25300)
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
-- TOC entry 2425 (class 0 OID 0)
-- Dependencies: 202
-- Name: report_referee_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE report_referee_seq OWNED BY report.referee_id;


--
-- TOC entry 208 (class 1259 OID 25332)
-- Name: shirt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE shirt (
    id integer NOT NULL,
    report_id integer NOT NULL,
    did_wear character varying(255) NOT NULL
);


ALTER TABLE shirt OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 25328)
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
-- TOC entry 2426 (class 0 OID 0)
-- Dependencies: 206
-- Name: shirt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE shirt_id_seq OWNED BY shirt.id;


--
-- TOC entry 207 (class 1259 OID 25330)
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
-- TOC entry 2427 (class 0 OID 0)
-- Dependencies: 207
-- Name: shirt_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE shirt_report_id_seq OWNED BY shirt.report_id;


--
-- TOC entry 201 (class 1259 OID 25288)
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
-- TOC entry 199 (class 1259 OID 25284)
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
-- TOC entry 2428 (class 0 OID 0)
-- Dependencies: 199
-- Name: spectator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spectator_id_seq OWNED BY spectator.id;


--
-- TOC entry 200 (class 1259 OID 25286)
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
-- TOC entry 2429 (class 0 OID 0)
-- Dependencies: 200
-- Name: spectator_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spectator_report_id_seq OWNED BY spectator.report_id;


--
-- TOC entry 189 (class 1259 OID 25209)
-- Name: team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE team (
    id integer NOT NULL,
    name character varying(255),
    league integer NOT NULL
);


ALTER TABLE team OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 25205)
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
-- TOC entry 2430 (class 0 OID 0)
-- Dependencies: 187
-- Name: team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE team_id_seq OWNED BY team.id;


--
-- TOC entry 188 (class 1259 OID 25207)
-- Name: team_league_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE team_league_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE team_league_seq OWNER TO postgres;

--
-- TOC entry 2431 (class 0 OID 0)
-- Dependencies: 188
-- Name: team_league_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE team_league_seq OWNED BY team.league;


--
-- TOC entry 219 (class 1259 OID 25411)
-- Name: team_sheet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE team_sheet (
    id integer NOT NULL,
    recieved character varying(255) NOT NULL,
    report_id integer NOT NULL
);


ALTER TABLE team_sheet OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 25407)
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
-- TOC entry 2432 (class 0 OID 0)
-- Dependencies: 217
-- Name: team_sheet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE team_sheet_id_seq OWNED BY team_sheet.id;


--
-- TOC entry 218 (class 1259 OID 25409)
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
-- TOC entry 2433 (class 0 OID 0)
-- Dependencies: 218
-- Name: team_sheet_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE team_sheet_report_id_seq OWNED BY team_sheet.report_id;


--
-- TOC entry 234 (class 1259 OID 25494)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "user" (
    id integer NOT NULL,
    referee_id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255)
);


ALTER TABLE "user" OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 25490)
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
-- TOC entry 2434 (class 0 OID 0)
-- Dependencies: 232
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- TOC entry 233 (class 1259 OID 25492)
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
-- TOC entry 2435 (class 0 OID 0)
-- Dependencies: 233
-- Name: user_referee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_referee_id_seq OWNED BY "user".referee_id;


--
-- TOC entry 2149 (class 2604 OID 25378)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assistant ALTER COLUMN id SET DEFAULT nextval('assistant_id_seq'::regclass);


--
-- TOC entry 2150 (class 2604 OID 25379)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assistant ALTER COLUMN report_id SET DEFAULT nextval('assistant_report_id_seq'::regclass);


--
-- TOC entry 2145 (class 2604 OID 25319)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ball ALTER COLUMN id SET DEFAULT nextval('ball_id_seq'::regclass);


--
-- TOC entry 2146 (class 2604 OID 25320)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ball ALTER COLUMN report_id SET DEFAULT nextval('ball_report_id_seq'::regclass);


--
-- TOC entry 2159 (class 2604 OID 25465)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY captain_armband ALTER COLUMN id SET DEFAULT nextval('captain_armband_id_seq'::regclass);


--
-- TOC entry 2160 (class 2604 OID 25466)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY captain_armband ALTER COLUMN report_id SET DEFAULT nextval('captain_armband_report_id_seq'::regclass);


--
-- TOC entry 2157 (class 2604 OID 25446)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY captain_liaison ALTER COLUMN id SET DEFAULT nextval('captain_liaison_id_seq'::regclass);


--
-- TOC entry 2158 (class 2604 OID 25447)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY captain_liaison ALTER COLUMN report_id SET DEFAULT nextval('captain_liaison_report_id_seq'::regclass);


--
-- TOC entry 2139 (class 2604 OID 25252)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY changing_facility ALTER COLUMN id SET DEFAULT nextval('changing_facilitiy_score_id_seq'::regclass);


--
-- TOC entry 2140 (class 2604 OID 25253)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY changing_facility ALTER COLUMN report_id SET DEFAULT nextval('changing_facilitiy_score_report_id_seq'::regclass);


--
-- TOC entry 2137 (class 2604 OID 25236)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY competition ALTER COLUMN id SET DEFAULT nextval('competition_id_seq'::regclass);


--
-- TOC entry 2138 (class 2604 OID 25237)
-- Name: league; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY competition ALTER COLUMN league SET DEFAULT nextval('competition_league_seq'::regclass);


--
-- TOC entry 2155 (class 2604 OID 25430)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- TOC entry 2156 (class 2604 OID 25431)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contact ALTER COLUMN report_id SET DEFAULT nextval('contact_report_id_seq'::regclass);


--
-- TOC entry 2151 (class 2604 OID 25398)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY home_hospitality ALTER COLUMN id SET DEFAULT nextval('home_hospitality_id_seq'::regclass);


--
-- TOC entry 2152 (class 2604 OID 25399)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY home_hospitality ALTER COLUMN report_id SET DEFAULT nextval('home_hospitality_report_id_seq'::regclass);


--
-- TOC entry 2141 (class 2604 OID 25271)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kick_off ALTER COLUMN id SET DEFAULT nextval('late_kick_off_id_seq'::regclass);


--
-- TOC entry 2142 (class 2604 OID 25272)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kick_off ALTER COLUMN report_id SET DEFAULT nextval('late_kick_off_report_id_seq'::regclass);


--
-- TOC entry 2134 (class 2604 OID 25190)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY league ALTER COLUMN id SET DEFAULT nextval('league_id_seq'::regclass);


--
-- TOC entry 2161 (class 2604 OID 25481)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY overall_score ALTER COLUMN id SET DEFAULT nextval('overall_score_id_seq'::regclass);


--
-- TOC entry 2162 (class 2604 OID 25482)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY overall_score ALTER COLUMN report_id SET DEFAULT nextval('overall_score_report_id_seq'::regclass);


--
-- TOC entry 2128 (class 2604 OID 25168)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY referee ALTER COLUMN id SET DEFAULT nextval('referee_id_seq'::regclass);


--
-- TOC entry 2129 (class 2604 OID 25182)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY report ALTER COLUMN id SET DEFAULT nextval('report_id_seq'::regclass);


--
-- TOC entry 2130 (class 2604 OID 25195)
-- Name: league; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY report ALTER COLUMN league SET DEFAULT nextval('report_league_seq'::regclass);


--
-- TOC entry 2131 (class 2604 OID 25302)
-- Name: referee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY report ALTER COLUMN referee_id SET DEFAULT nextval('report_referee_seq'::regclass);


--
-- TOC entry 2132 (class 2604 OID 25346)
-- Name: home_team_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY report ALTER COLUMN home_team_id SET DEFAULT nextval('report_home_team_id_seq'::regclass);


--
-- TOC entry 2133 (class 2604 OID 25353)
-- Name: away_team_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY report ALTER COLUMN away_team_id SET DEFAULT nextval('report_away_team_id_seq'::regclass);


--
-- TOC entry 2147 (class 2604 OID 25335)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shirt ALTER COLUMN id SET DEFAULT nextval('shirt_id_seq'::regclass);


--
-- TOC entry 2148 (class 2604 OID 25336)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shirt ALTER COLUMN report_id SET DEFAULT nextval('shirt_report_id_seq'::regclass);


--
-- TOC entry 2143 (class 2604 OID 25291)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spectator ALTER COLUMN id SET DEFAULT nextval('spectator_id_seq'::regclass);


--
-- TOC entry 2144 (class 2604 OID 25292)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spectator ALTER COLUMN report_id SET DEFAULT nextval('spectator_report_id_seq'::regclass);


--
-- TOC entry 2135 (class 2604 OID 25212)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY team ALTER COLUMN id SET DEFAULT nextval('team_id_seq'::regclass);


--
-- TOC entry 2136 (class 2604 OID 25213)
-- Name: league; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY team ALTER COLUMN league SET DEFAULT nextval('team_league_seq'::regclass);


--
-- TOC entry 2153 (class 2604 OID 25414)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY team_sheet ALTER COLUMN id SET DEFAULT nextval('team_sheet_id_seq'::regclass);


--
-- TOC entry 2154 (class 2604 OID 25415)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY team_sheet ALTER COLUMN report_id SET DEFAULT nextval('team_sheet_report_id_seq'::regclass);


--
-- TOC entry 2163 (class 2604 OID 25497)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- TOC entry 2164 (class 2604 OID 25498)
-- Name: referee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user" ALTER COLUMN referee_id SET DEFAULT nextval('user_referee_id_seq'::regclass);


--
-- TOC entry 2369 (class 0 OID 25375)
-- Dependencies: 213
-- Data for Name: assistant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY assistant (id, home_score, away_score, comment, report_id) FROM stdin;
\.


--
-- TOC entry 2436 (class 0 OID 0)
-- Dependencies: 211
-- Name: assistant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('assistant_id_seq', 1, false);


--
-- TOC entry 2437 (class 0 OID 0)
-- Dependencies: 212
-- Name: assistant_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('assistant_report_id_seq', 1, false);


--
-- TOC entry 2361 (class 0 OID 25316)
-- Dependencies: 205
-- Data for Name: ball; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ball (id, provided, report_id) FROM stdin;
\.


--
-- TOC entry 2438 (class 0 OID 0)
-- Dependencies: 203
-- Name: ball_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ball_id_seq', 1, false);


--
-- TOC entry 2439 (class 0 OID 0)
-- Dependencies: 204
-- Name: ball_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ball_report_id_seq', 1, false);


--
-- TOC entry 2384 (class 0 OID 25462)
-- Dependencies: 228
-- Data for Name: captain_armband; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY captain_armband (id, report_id, home_away_both_neither) FROM stdin;
\.


--
-- TOC entry 2440 (class 0 OID 0)
-- Dependencies: 226
-- Name: captain_armband_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('captain_armband_id_seq', 1, false);


--
-- TOC entry 2441 (class 0 OID 0)
-- Dependencies: 227
-- Name: captain_armband_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('captain_armband_report_id_seq', 1, false);


--
-- TOC entry 2381 (class 0 OID 25443)
-- Dependencies: 225
-- Data for Name: captain_liaison; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY captain_liaison (id, home_score, away_score, comment, report_id) FROM stdin;
\.


--
-- TOC entry 2442 (class 0 OID 0)
-- Dependencies: 223
-- Name: captain_liaison_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('captain_liaison_id_seq', 1, false);


--
-- TOC entry 2443 (class 0 OID 0)
-- Dependencies: 224
-- Name: captain_liaison_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('captain_liaison_report_id_seq', 1, false);


--
-- TOC entry 2444 (class 0 OID 0)
-- Dependencies: 193
-- Name: changing_facilitiy_score_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('changing_facilitiy_score_id_seq', 1, false);


--
-- TOC entry 2445 (class 0 OID 0)
-- Dependencies: 194
-- Name: changing_facilitiy_score_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('changing_facilitiy_score_report_id_seq', 1, false);


--
-- TOC entry 2351 (class 0 OID 25249)
-- Dependencies: 195
-- Data for Name: changing_facility; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY changing_facility (id, report_id, score, comment) FROM stdin;
\.


--
-- TOC entry 2348 (class 0 OID 25233)
-- Dependencies: 192
-- Data for Name: competition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY competition (id, name, league) FROM stdin;
\.


--
-- TOC entry 2446 (class 0 OID 0)
-- Dependencies: 190
-- Name: competition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('competition_id_seq', 1, false);


--
-- TOC entry 2447 (class 0 OID 0)
-- Dependencies: 191
-- Name: competition_league_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('competition_league_seq', 1, false);


--
-- TOC entry 2378 (class 0 OID 25427)
-- Dependencies: 222
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contact (id, yes_no_club, report_id) FROM stdin;
\.


--
-- TOC entry 2448 (class 0 OID 0)
-- Dependencies: 220
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contact_id_seq', 1, false);


--
-- TOC entry 2449 (class 0 OID 0)
-- Dependencies: 221
-- Name: contact_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contact_report_id_seq', 1, false);


--
-- TOC entry 2372 (class 0 OID 25395)
-- Dependencies: 216
-- Data for Name: home_hospitality; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY home_hospitality (id, score, report_id) FROM stdin;
\.


--
-- TOC entry 2450 (class 0 OID 0)
-- Dependencies: 214
-- Name: home_hospitality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('home_hospitality_id_seq', 1, false);


--
-- TOC entry 2451 (class 0 OID 0)
-- Dependencies: 215
-- Name: home_hospitality_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('home_hospitality_report_id_seq', 1, false);


--
-- TOC entry 2354 (class 0 OID 25268)
-- Dependencies: 198
-- Data for Name: kick_off; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kick_off (id, report_id, late, how_late, fault) FROM stdin;
\.


--
-- TOC entry 2452 (class 0 OID 0)
-- Dependencies: 196
-- Name: late_kick_off_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('late_kick_off_id_seq', 1, false);


--
-- TOC entry 2453 (class 0 OID 0)
-- Dependencies: 197
-- Name: late_kick_off_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('late_kick_off_report_id_seq', 1, false);


--
-- TOC entry 2341 (class 0 OID 25187)
-- Dependencies: 185
-- Data for Name: league; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY league (id, name) FROM stdin;
\.


--
-- TOC entry 2454 (class 0 OID 0)
-- Dependencies: 184
-- Name: league_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('league_id_seq', 1, false);


--
-- TOC entry 2387 (class 0 OID 25478)
-- Dependencies: 231
-- Data for Name: overall_score; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY overall_score (id, report_id, home_score, away_score) FROM stdin;
\.


--
-- TOC entry 2455 (class 0 OID 0)
-- Dependencies: 229
-- Name: overall_score_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('overall_score_id_seq', 1, false);


--
-- TOC entry 2456 (class 0 OID 0)
-- Dependencies: 230
-- Name: overall_score_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('overall_score_report_id_seq', 1, false);


--
-- TOC entry 2336 (class 0 OID 25163)
-- Dependencies: 180
-- Data for Name: referee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY referee (id, first_name, last_name, level) FROM stdin;
\.


--
-- TOC entry 2457 (class 0 OID 0)
-- Dependencies: 181
-- Name: referee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('referee_id_seq', 1, false);


--
-- TOC entry 2339 (class 0 OID 25179)
-- Dependencies: 183
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY report (id, date, league, referee_id, home_team_id, away_team_id) FROM stdin;
\.


--
-- TOC entry 2458 (class 0 OID 0)
-- Dependencies: 210
-- Name: report_away_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('report_away_team_id_seq', 1, false);


--
-- TOC entry 2459 (class 0 OID 0)
-- Dependencies: 209
-- Name: report_home_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('report_home_team_id_seq', 1, false);


--
-- TOC entry 2460 (class 0 OID 0)
-- Dependencies: 182
-- Name: report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('report_id_seq', 1, false);


--
-- TOC entry 2461 (class 0 OID 0)
-- Dependencies: 186
-- Name: report_league_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('report_league_seq', 1, false);


--
-- TOC entry 2462 (class 0 OID 0)
-- Dependencies: 202
-- Name: report_referee_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('report_referee_seq', 1, false);


--
-- TOC entry 2364 (class 0 OID 25332)
-- Dependencies: 208
-- Data for Name: shirt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY shirt (id, report_id, did_wear) FROM stdin;
\.


--
-- TOC entry 2463 (class 0 OID 0)
-- Dependencies: 206
-- Name: shirt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('shirt_id_seq', 1, false);


--
-- TOC entry 2464 (class 0 OID 0)
-- Dependencies: 207
-- Name: shirt_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('shirt_report_id_seq', 1, false);


--
-- TOC entry 2357 (class 0 OID 25288)
-- Dependencies: 201
-- Data for Name: spectator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spectator (id, home_score, away_score, report_id, comment) FROM stdin;
\.


--
-- TOC entry 2465 (class 0 OID 0)
-- Dependencies: 199
-- Name: spectator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spectator_id_seq', 1, false);


--
-- TOC entry 2466 (class 0 OID 0)
-- Dependencies: 200
-- Name: spectator_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spectator_report_id_seq', 1, false);


--
-- TOC entry 2345 (class 0 OID 25209)
-- Dependencies: 189
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY team (id, name, league) FROM stdin;
\.


--
-- TOC entry 2467 (class 0 OID 0)
-- Dependencies: 187
-- Name: team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('team_id_seq', 1, false);


--
-- TOC entry 2468 (class 0 OID 0)
-- Dependencies: 188
-- Name: team_league_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('team_league_seq', 1, false);


--
-- TOC entry 2375 (class 0 OID 25411)
-- Dependencies: 219
-- Data for Name: team_sheet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY team_sheet (id, recieved, report_id) FROM stdin;
\.


--
-- TOC entry 2469 (class 0 OID 0)
-- Dependencies: 217
-- Name: team_sheet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('team_sheet_id_seq', 1, false);


--
-- TOC entry 2470 (class 0 OID 0)
-- Dependencies: 218
-- Name: team_sheet_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('team_sheet_report_id_seq', 1, false);


--
-- TOC entry 2390 (class 0 OID 25494)
-- Dependencies: 234
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "user" (id, referee_id, email, password) FROM stdin;
\.


--
-- TOC entry 2471 (class 0 OID 0)
-- Dependencies: 232
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_id_seq', 1, false);


--
-- TOC entry 2472 (class 0 OID 0)
-- Dependencies: 233
-- Name: user_referee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_referee_id_seq', 1, false);


--
-- TOC entry 2196 (class 2606 OID 25468)
-- Name: armband_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY captain_armband
    ADD CONSTRAINT armband_pkey PRIMARY KEY (id);


--
-- TOC entry 2186 (class 2606 OID 25384)
-- Name: assistant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assistant
    ADD CONSTRAINT assistant_pkey PRIMARY KEY (id);


--
-- TOC entry 2182 (class 2606 OID 25322)
-- Name: ball_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ball
    ADD CONSTRAINT ball_pkey PRIMARY KEY (id);


--
-- TOC entry 2194 (class 2606 OID 25452)
-- Name: captain_liaison_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY captain_liaison
    ADD CONSTRAINT captain_liaison_pkey PRIMARY KEY (id);


--
-- TOC entry 2174 (class 2606 OID 25239)
-- Name: comp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY competition
    ADD CONSTRAINT comp_pkey PRIMARY KEY (id);


--
-- TOC entry 2192 (class 2606 OID 25433)
-- Name: contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- TOC entry 2200 (class 2606 OID 25505)
-- Name: email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT email_unique UNIQUE (email);


--
-- TOC entry 2176 (class 2606 OID 25255)
-- Name: facility_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY changing_facility
    ADD CONSTRAINT facility_pkey PRIMARY KEY (id);


--
-- TOC entry 2188 (class 2606 OID 25401)
-- Name: hospitality_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY home_hospitality
    ADD CONSTRAINT hospitality_pkey PRIMARY KEY (id);


--
-- TOC entry 2178 (class 2606 OID 25277)
-- Name: kick_off_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kick_off
    ADD CONSTRAINT kick_off_pkey PRIMARY KEY (id);


--
-- TOC entry 2170 (class 2606 OID 25192)
-- Name: league_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY league
    ADD CONSTRAINT league_pkey PRIMARY KEY (id);


--
-- TOC entry 2198 (class 2606 OID 25484)
-- Name: overall_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY overall_score
    ADD CONSTRAINT overall_pkey PRIMARY KEY (id);


--
-- TOC entry 2166 (class 2606 OID 25173)
-- Name: ref_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY referee
    ADD CONSTRAINT ref_pk PRIMARY KEY (id);


--
-- TOC entry 2168 (class 2606 OID 25184)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2184 (class 2606 OID 25338)
-- Name: shirt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shirt
    ADD CONSTRAINT shirt_pkey PRIMARY KEY (id);


--
-- TOC entry 2180 (class 2606 OID 25294)
-- Name: spectator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spectator
    ADD CONSTRAINT spectator_pkey PRIMARY KEY (id);


--
-- TOC entry 2172 (class 2606 OID 25215)
-- Name: team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


--
-- TOC entry 2190 (class 2606 OID 25417)
-- Name: team_sheet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY team_sheet
    ADD CONSTRAINT team_sheet_pkey PRIMARY KEY (id);


--
-- TOC entry 2202 (class 2606 OID 25503)
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2206 (class 2606 OID 25363)
-- Name: away_team_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY report
    ADD CONSTRAINT away_team_fkey FOREIGN KEY (away_team_id) REFERENCES team(id);


--
-- TOC entry 2205 (class 2606 OID 25358)
-- Name: home_team_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY report
    ADD CONSTRAINT home_team_fkey FOREIGN KEY (home_team_id) REFERENCES team(id);


--
-- TOC entry 2203 (class 2606 OID 25200)
-- Name: league_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY report
    ADD CONSTRAINT league_fkey FOREIGN KEY (league) REFERENCES league(id);


--
-- TOC entry 2207 (class 2606 OID 25224)
-- Name: league_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY team
    ADD CONSTRAINT league_fkey FOREIGN KEY (league) REFERENCES league(id);


--
-- TOC entry 2208 (class 2606 OID 25240)
-- Name: league_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY competition
    ADD CONSTRAINT league_fkey FOREIGN KEY (league) REFERENCES league(id);


--
-- TOC entry 2204 (class 2606 OID 25307)
-- Name: referee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY report
    ADD CONSTRAINT referee_fkey FOREIGN KEY (referee_id) REFERENCES referee(id);


--
-- TOC entry 2221 (class 2606 OID 25506)
-- Name: referee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT referee_fkey FOREIGN KEY (referee_id) REFERENCES referee(id);


--
-- TOC entry 2209 (class 2606 OID 25256)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY changing_facility
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2210 (class 2606 OID 25278)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kick_off
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2211 (class 2606 OID 25295)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spectator
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2212 (class 2606 OID 25323)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ball
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2213 (class 2606 OID 25339)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY shirt
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2214 (class 2606 OID 25385)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assistant
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2215 (class 2606 OID 25402)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY home_hospitality
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2216 (class 2606 OID 25418)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY team_sheet
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2217 (class 2606 OID 25434)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2218 (class 2606 OID 25453)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY captain_liaison
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2219 (class 2606 OID 25469)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY captain_armband
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2220 (class 2606 OID 25485)
-- Name: report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY overall_score
    ADD CONSTRAINT report_fkey FOREIGN KEY (report_id) REFERENCES report(id);


--
-- TOC entry 2397 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-02-25 23:45:22

--
-- PostgreSQL database dump complete
--


-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.
-- Drop the database tournament initially
drop database tournament;
CREATE DATABASE tournament;
-- connect to database, this is command line instruction
\c tournament;

CREATE SCHEMA tournament01;

CREATE TABLE tournament01.player_records(
id  serial PRIMARY KEY ,
name text not null
);

CREATE TABLE tournament01.player_matches(
match_id serial PRIMARY KEY ,
winner_id INT REFERENCES tournament01.player_records(id),
looser_id INT REFERENCES tournament01.player_records(id)
);

CREATE VIEW players_standing AS
  SELECT
  id,
  name,
  (SELECT
  count(tournament01.player_matches.winner_id)
   from tournament01.player_matches WHERE
  tournament01.player_matches.winner_id = id) as wins,
  (select count(*) from tournament01.player_matches where
  id=tournament01.player_matches.winner_id or
  id=tournament01.player_matches.looser_id) as matches
  from tournament01.player_records left join tournament01.player_matches
  on tournament01.player_records.id = tournament01.player_matches.winner_id;




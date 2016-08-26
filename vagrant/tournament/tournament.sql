-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.
drop database tournament;
CREATE DATABASE tournament;
\c tournament;

CREATE SCHEMA tournament01;

CREATE TABLE tournament01.player_records(
id  serial PRIMARY KEY ,
name text not null
);

CREATE TABLE tournament01.player_matches(
winner_id INT REFERENCES tournament01.player_records(id),
looser_id INT REFERENCES tournament01.player_records(id)
);

CREATE VIEW players_standing AS
 SELECT
  id,
  name,
  count(tournament01.player_matches.winner_id) as wins,
 (select count(*) from tournament01.player_matches where id=tournament01.player_matches.winner_id or
    id=tournament01.player_matches.looser_id) as matches
   from tournament01.player_records left join tournament01.player_matches
    on tournament01.player_records.id = tournament01.player_matches.winner_id
      group by tournament01.player_records.id;




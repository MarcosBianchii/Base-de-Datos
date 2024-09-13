-- Active: 1724337432188@@127.0.0.1@5432@mundial

DROP TABLE IF EXISTS teams;

DROP TABLE IF EXISTS matches;

CREATE TABLE teams (
    team VARCHAR(30),
    players_used INT,
    avg_age FLOAT,
    possession FLOAT,
    games INT,
    goals INT,
    assists INT,
    cards_yellow INT,
    cards_red INT
);

CREATE TABLE matches (
    team1 VARCHAR(30),
    team2 VARCHAR(30),
    goals_team1 INT,
    goals_team2 INT,
    stage VARCHAR(30)
);
-- Active: 1724337432188@@127.0.0.1@5432@mundial

COPY teams
FROM '/teams.csv' DELIMITER ';' CSV HEADER ENCODING 'LATIN1'

COPY matches
FROM '/matches.csv' DELIMITER ';' CSV HEADER ENCODING 'LATIN1'
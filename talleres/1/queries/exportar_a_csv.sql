-- Active: 1724337432188@@127.0.0.1@5432@mundial

COPY teams TO '/teams_out.csv' DELIMITER ',' CSV HEADER;
-- no va a andar, porque no vas a tener permisos

-- en cambio, si te conectas al container y usas psql:
COPY ( SELECT * FROM teams ) TO '/teams_out.csv' CSV HEADER;
-- podes ver como te crea el csv en root.
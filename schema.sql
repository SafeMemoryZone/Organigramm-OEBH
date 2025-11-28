DROP SCHEMA IF EXISTS bundesheer CASCADE;
CREATE SCHEMA bundesheer;
SET search_path TO bundesheer;

CREATE TABLE branch (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE unit_type (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE location (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE unit (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    unit_code TEXT NOT NULL,
    branch_id INTEGER REFERENCES branch(id),
    unit_type_id INTEGER REFERENCES unit_type(id),
    location_id INTEGER REFERENCES location(id)
);

CREATE TABLE unit_relation (
    parent_id INTEGER REFERENCES unit(id),
    child_id INTEGER REFERENCES unit(id)
);

INSERT INTO branch (name) VALUES
('Heer'), ('Luftstreitkräfte'), ('Spezialeinsatzkräfte');

INSERT INTO unit_type (name) VALUES
('Ministerium'), ('Kommando'), ('Brigade'), ('Spezialeinheit');

INSERT INTO location (name) VALUES
('Wien'), ('Graz'), ('Linz'), ('Salzburg');

INSERT INTO unit (name, unit_code, branch_id, unit_type_id, location_id) VALUES
('Bundesministerium für Landesverteidigung', 'BMLV', 1, 1, 1),
('Streitkräfteführungskommando', 'SKF', 1, 2, 1),
('Jägerbrigade 6', 'JGBRIG6', 1, 3, 2),
('Panzergrenadierbrigade 4', 'PZGRBRIG4', 1, 3, 3),
('Luftkommando', 'LUFTKDO', 2, 2, 1),
('Jagdkommando', 'JAGDKDO', 3, 4, 4);

INSERT INTO unit_relation (parent_id, child_id) VALUES
(1, 2),
(2, 3),
(2, 4),
(1, 5),
(1, 6);

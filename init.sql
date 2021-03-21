CREATE DATABASE nonzerodatabase
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS nonzerotable (
  	id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
	name TEXT NOT NULL,
	age INT NOT NULL,
	address CHAR(50)
);

SELECT * FROM nonzerotable;

INSERT INTO nonzerotable (name, age, address) VALUES(
	'Joe',
	30,
	'home'
);

SELECT * FROM nonzerotable;

UPDATE nonzerotable
SET age=31
WHERE id='7f992255-7a4c-4223-a156-e1a9b2b890d5';

SELECT * FROM nonzerotable;

DELETE FROM nonzerotable
WHERE id='7f992255-7a4c-4223-a156-e1a9b2b890d5';

SELECT * FROM nonzerotable;

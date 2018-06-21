DROP TABLE IF EXISTS users,stash,tags,stash_tags CASCADE;
-- Leaving these in case we want to target DB destruction
-- DROP TABLE IF EXISTS users;
-- DROP TABLE IF EXISTS stash;
-- DROP TABLE IF EXISTS tags;
-- DROP TABLE IF EXISTS stash_tags;


-- This will almost certainly have to change if we implement an auth system
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(55),
    password_digest TEXT 
);


CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    tag varchar(255) NOT NULL
);

CREATE TABLE stash (
    id SERIAL PRIMARY KEY,
    stash_url varchar(255) NOT NULL,
    is_public BOOLEAN DEFAULT false,
    user_id INTEGER REFERENCES users(id)
);

CREATE TABLE stash_tags (
    id SERIAL PRIMARY KEY,
    tag_id INTEGER REFERENCES tags(id),
    stash_id INTEGER REFERENCES stash(id)
);








-- Taken from node_modules/connect-pg-simple/table.sql
--commenting until we agree to use connect-pg-simple
-- CREATE TABLE "session" (
--   "sid" varchar NOT NULL COLLATE "default",
-- 	"sess" json NOT NULL,
-- 	"expire" timestamp(6) NOT NULL
-- )
-- WITH (OIDS=FALSE);
-- ALTER TABLE "session" ADD CONSTRAINT "session_pkey" PRIMARY KEY ("sid") NOT DEFERRABLE INITIALLY IMMEDIATE;

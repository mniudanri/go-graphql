CREATE TABLE IF NOT EXISTS role (
    "id" bigint PRIMARY KEY,
    "role_name" VARCHAR UNIQUE NOT NULL,
    "description" VARCHAR NOT NULL
);
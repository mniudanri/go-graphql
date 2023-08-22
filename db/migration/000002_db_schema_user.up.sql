CREATE TABLE IF NOT EXISTS "users" (
    "id" bigint PRIMARY KEY,
    "username" VARCHAR NOT NULL,
    "password" VARCHAR NOT NULL,
    "is_active" boolean DEFAULT false,
    "role_id" bigint NOT NULL
);

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "role" ("id");
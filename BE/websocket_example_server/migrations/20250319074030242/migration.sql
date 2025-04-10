BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "my_user" (
    "id" bigserial PRIMARY KEY,
    "uid" text NOT NULL,
    "email" text NOT NULL,
    "name" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);


--
-- MIGRATION VERSION FOR websocket_example
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('websocket_example', '20250319074030242', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250319074030242', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;

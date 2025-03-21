BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "my_message" (
    "id" bigserial PRIMARY KEY,
    "text" text NOT NULL
);


--
-- MIGRATION VERSION FOR websocket_example
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('websocket_example', '20250318101243265', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250318101243265', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;

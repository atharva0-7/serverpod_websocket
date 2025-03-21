BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "my_message" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "my_message" (
    "id" bigserial PRIMARY KEY,
    "text" text NOT NULL,
    "senderId" text NOT NULL,
    "receiverId" text NOT NULL,
    "imageUrl" text NOT NULL
);


--
-- MIGRATION VERSION FOR websocket_example
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('websocket_example', '20250319102245946', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250319102245946', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;

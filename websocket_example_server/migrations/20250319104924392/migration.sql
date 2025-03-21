BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "my_message" DROP COLUMN "imageUrl";
ALTER TABLE "my_message" ADD COLUMN "imageUrl" bytea;
ALTER TABLE "my_message" ALTER COLUMN "text" DROP NOT NULL;

--
-- MIGRATION VERSION FOR websocket_example
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('websocket_example', '20250319104924392', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250319104924392', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;

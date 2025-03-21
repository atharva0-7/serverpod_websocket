BEGIN;


--
-- MIGRATION VERSION FOR websocket_example
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('websocket_example', '20250321073830686', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250321073830686', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;

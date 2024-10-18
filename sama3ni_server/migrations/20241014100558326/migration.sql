BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "task" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "photo" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone,
    "deletedAt" timestamp without time zone
);


--
-- MIGRATION VERSION FOR sama3ni
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('sama3ni', '20241014100558326', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241014100558326', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;

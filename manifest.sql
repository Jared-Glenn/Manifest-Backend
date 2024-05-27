\echo 'Delete and recreate manifest db?'
\prompt 'Return for yes or control-C to cancel > ' foo

DROP DATABASE IF EXISTS manifest;
CREATE DATABASE manifest;
\connect manifest

\i manifest-schema.sql
\i manifest-seed.sql

\echo 'Delete and recreate manifest_test db?'
\prompt 'Return for yes or control-C to cancel > ' foo

DROP DATABASE IF EXISTS manifest_test;
CREATE DATABASE manifest_test;
\connect manifest_test

\i manifest-schema.sql

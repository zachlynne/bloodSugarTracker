-- ********************************************************************************
-- This script creates the database users and grants them the necessary permissions
-- ********************************************************************************

CREATE USER bst_owner
WITH PASSWORD 'bloodsugartracker';

GRANT ALL
ON ALL TABLES IN SCHEMA public
TO bst_owner;

GRANT ALL
ON ALL SEQUENCES IN SCHEMA public
TO bst_owner;

CREATE USER bst_appuser
WITH PASSWORD 'bloodsugartracker';

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO bst_appuser;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO bst_appuser;

-- **************************************************************
-- This script destroys the database and associated users
-- **************************************************************

-- The following line terminates any active connections to the database so that it can be destroyed
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'blood_sugar_tracker';

DROP DATABASE blood_sugar_tracker;

DROP USER bst_owner;
DROP USER bst_appuser;

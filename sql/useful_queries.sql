-- running query statuses
SELECT datname, pid, state, query, age(clock_timestamp(), query_start) AS age 
FROM pg_stat_activity
WHERE state <> 'idle' 
    AND query NOT LIKE '% FROM pg_stat_activity %' 
ORDER BY age;

-- kill running process
select pg_cancel_backend(<pid of the process>)

-- search for fucntions                                                                                                                 
\df *regexp*                                                                                                                                                  
-- write query in editor and save                                                                                                                              
\e \i        

-- check psql version
SELECT current_setting('server_version_num');

-- vacuum command
VACUUM (VERBOSE, ANALYZE);

-- all databases and their sizes
select * from pg_user;

-- all tables and their size, with/without indexes
select datname, pg_size_pretty(pg_database_size(datname))
from pg_database
order by pg_database_size(datname) desc;

-- cache hit rates (should not be less than 0.99)
SELECT sum(heap_blks_read) as heap_read, sum(heap_blks_hit)  as heap_hit, (sum(heap_blks_hit) - sum(heap_blks_read)) / sum(heap_blks_hit) as ratio
FROM pg_statio_user_tables;

-- table index usage rates (should not be less than 0.99)
SELECT relname, 100 * idx_scan / (seq_scan + idx_scan) percent_of_times_index_used, n_live_tup rows_in_table
FROM pg_stat_user_tables 
ORDER BY n_live_tup DESC;

-- how many indexes are in cache
SELECT sum(idx_blks_read) as idx_read, sum(idx_blks_hit)  as idx_hit, (sum(idx_blks_hit) - sum(idx_blks_read)) / sum(idx_blks_hit) as ratio
FROM pg_statio_user_indexes;

-- Dump database on remote host to file
$ pg_dump -U username -h hostname databasename > dump.sql

-- Import dump into existing database
$ psql -d newdb -f dump.sql

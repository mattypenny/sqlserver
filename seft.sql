SELECT session_id,percent_complete '% done',
       DATEADD(MILLISECOND,estimated_completion_time,CURRENT_TIMESTAMP) Estimated_finish_time,
       (total_elapsed_time/1000)/60 Mins_Done ,
       DB_NAME(Database_id) Db ,command,
       -- sql_handle
       wait_type,
       CONVERT(varchar, DATEADD(ms, wait_time, 0), 114) wait_mins,
       wait_time
FROM sys.dm_exec_requests 
where status <> 'background'
and command <> 'task manager'

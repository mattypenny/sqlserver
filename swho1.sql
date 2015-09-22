SELECT es.host_name, 
       es.nt_user_name, 
       -- es.original_login_name,
       es.login_name, 
       es.login_time, 
       es.last_request_end_time, 
       es.[program_name]
FROM sys.dm_exec_sessions AS es WITH (NOLOCK) 
-- GROUP BY es.[program_name], es.[host_name], es.login_name  
where login_time > (select min( DATEADD(MINUTE, 10, login_time)) from sys.dm_exec_sessions)
ORDER BY  es.host_name, es.login_name, es.[program_name] OPTION (RECOMPILE);

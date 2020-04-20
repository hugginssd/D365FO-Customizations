--Author:Mafigu Huggins
--Tel:    +263 782 326 160
--Email:  mafiguhuggins@gmail.com



--Just in case if someone stumbles onto this thread then here is a bullet proof solution to SQL Server stuck in SINGLE USER MODE
--Get the process ID (spid) of the connection you need to kill
--Replace 'DBName' with the actual name of the DB

SELECT sd.[name], sp.spid, sp.login_time, sp.loginame 
FROM sysprocesses sp 
INNER JOIN sysdatabases sd on sp.dbid = sd.dbid  
WHERE sd.[name] = 'MY_DB_NAME'

--As an alternative, you can also use the command “sp_who” to get the “spid” of the open connection:

-- Or use this SP instead

exec sp_who

-- Then Execute the following and replace the [spid] and [DBName] with correct values

KILL SpidToKillGoesHere
GO

SET DEADLOCK_PRIORITY HIGH
GO

ALTER DATABASE [MY_DB_NAME] SET MULTI_USER WITH ROLLBACK IMMEDIATE
GO

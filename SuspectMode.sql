--Author: Mafigu Huggins
--Tel:    +263 782 326 160
--Email:  mafiguhuggins@gmail.com

--Resetting database from Suspect mode


EXEC sp_resetstatus [YourDatabase];
ALTER DATABASE [YourDatabase] SET EMERGENCY
DBCC checkdb([YourDatabase])
ALTER DATABASE [YourDatabase] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
DBCC CheckDB ([YourDatabase], REPAIR_ALLOW_DATA_LOSS)
ALTER DATABASE [YourDatabase] SET MULTI_USER
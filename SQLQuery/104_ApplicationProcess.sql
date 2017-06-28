

CREATE TABLE [dbo].[tblApplicationProcess](
	[AppProcessID] [nvarchar](50) NOT NULL,
	[ProcessName] [nvarchar](200) NULL,
	[ProcessDescription] [nvarchar](2000) NULL,
	[Stage] [int] NULL,
	[EntryBy] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AppProcessID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblApplicationProcess] ADD  DEFAULT (getdate()) FOR [EntryDate]
GO



-----------------------------------


CREATE procedure [dbo].[prInsertApplicationProcess]
@ProcessName nvarchar(200),
@ProcessDescription nvarchar(2000),
@Stage int,
@loginid nvarchar(100)
as
begin
declare @ApplicationProcessID as nvarchar(50)
declare @count as int
	begin tran
	set @count=0
 select @count =COUNT (1) from  dbo.tblApplicationProcess where Stage=@Stage
 
 if @count<>0
 GOTO ERR_HANDLER
 else
 begin
	set @ApplicationProcessID= newid()
	set @ApplicationProcessID= 'AppProcess-' + @ApplicationProcessID
		
	INSERT INTO [HRM].[dbo].[tblApplicationProcess]
           ([AppProcessID]
           ,[ProcessName]
           ,[ProcessDescription]
           ,[Stage]
           ,[EntryBy]
           ,[EntryDate])
     VALUES
           (@ApplicationProcessID
           ,@ProcessName
           ,@ProcessDescription
           ,@Stage
           ,@loginid
           ,getdate())
 end
		
commit tran
		return 1
ERR_HANDLER:
		rollback tran	
		return 0

	
end


GO


------------------------------------------


CREATE procedure [dbo].[spApplicationProcess]
as
begin	
	SELECT [AppProcessID]
      ,[ProcessName]
      ,[ProcessDescription]
      ,[Stage]
  FROM [HRM].[dbo].[tblApplicationProcess]
  
end



GO

-----------------------------------------------


CREATE procedure [dbo].[prUpdateApplicationProcess]
@AppProcessID nvarchar(50),
@ProcessName nvarchar(200),
@Description nvarchar(2000),
@Stage int
as
begin
	begin tran
	
	begin try
	
	
	UPDATE [HRM].[dbo].[tblApplicationProcess]
   SET [ProcessName] = @ProcessName
      ,[ProcessDescription] = @Description
      ,[Stage] = @Stage
 WHERE AppProcessID=@AppProcessID
		commit tran
	end try	
	begin catch
		rollback tran	
	end catch
end


GO



------------------------------------------------------



CREATE procedure [dbo].[prApplicationProcess]
(
@AppProcessID varchar(50)
)
as
begin	
	SELECT [AppProcessID]
      ,[ProcessName]
      ,[ProcessDescription]
      ,[Stage]
  FROM [HRM].[dbo].[tblApplicationProcess]
  Where [AppProcessID]=@AppProcessID
  
end



GO

----------------------------



create procedure [dbo].[prGetApplicationProcessDescription]
@AppProcessID nvarchar(100)

as

select ProcessDescription from dbo.tblApplicationProcess
where AppProcessID=@AppProcessID

GO


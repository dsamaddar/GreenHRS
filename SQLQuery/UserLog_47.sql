
CREATE TABLE [dbo].[tblUserLog](
	[LogID] [nvarchar](50) NOT NULL,
	[UserID] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[RegistrationID] [nvarchar](50) NULL,
	[IPAddress] [nvarchar](100) NULL,
	[EntryDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tblUserLog] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblUserLog]  WITH CHECK ADD  CONSTRAINT [FK_tblUserLog_tblRegisterUser] FOREIGN KEY([RegistrationID])
REFERENCES [dbo].[tblRegisterUser] ([RegistrationID])
GO

ALTER TABLE [dbo].[tblUserLog] CHECK CONSTRAINT [FK_tblUserLog_tblRegisterUser]
GO



insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentUserLogID',0)

GO





CREATE proc prUserLoginLogAdd 
@UserID nvarchar(50),
@PassWord nvarchar(50),
@IPAddress nvarchar(50),
@RegistrationID nvarchar(50)
as

begin	
	Declare @UserLogID as nvarchar(50)
	Declare @CurrentUserLog numeric(18,0)
	Declare @UserLogIDPrefix as nvarchar(8)
	
	
	set @UserLogIDPrefix='USR-LOG-'
	

	
begin tran	
		select @CurrentUserLog = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentUserLogID'
		set @CurrentUserLog=isnull(@CurrentUserLog,0)+1
		Select @UserLogID=dbo.generateID(@UserLogIDPrefix,@CurrentUserLog,8)		
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
		
		
		INSERT INTO [tblUserLog]
			   ([LogID]
			   ,[UserID]
			   ,[Password]
			   ,[RegistrationID]
			   ,[IPAddress]
			   ,[EntryDate])
		 VALUES
			   (@UserLogID
			   ,@UserID
			   ,@PassWord
			   ,@RegistrationID
			   ,@IPAddress
			   ,GETDATE())
		IF (@@ERROR <> 0) GOTO ERR_HANDLER

	update tblAppSettings set PropertyValue=@CurrentUserLog where PropertyName='CurrentUserLogID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

		
COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO
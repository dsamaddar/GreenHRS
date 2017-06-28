CREATE TABLE [dbo].[tblContactUs](
	[ContactUsID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNo] [nvarchar](50) NULL,
	[ValidationCode] [nvarchar](50) NULL,
	[Message] [nvarchar](2000) NULL,
	[IsReplyed] [bit] NULL Default 0,
	[ReplyDate] [datetime] NULL,
	[EntryBy] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_tblContactUs] PRIMARY KEY CLUSTERED 
(
	[ContactUsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblContactUs] ADD  CONSTRAINT [DF_tblContactUs_EntryDate]  DEFAULT (getdate()) FOR [EntryDate]
GO





insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentContactUsID',0)

GO


CREATE proc [dbo].[spInsertContactUs]
@Name nvarchar(200),
@Email nvarchar(50),
@PhoneNo nvarchar(50),
@ValidationCode nvarchar(50),
@Message nvarchar(2000),
@EntryBy nvarchar(50) 

as

begin
	Declare @ContactUsID nvarchar(50)
	Declare @CurrentContactUsID numeric(18,0)
	Declare @ContactUsIDPrefix as nvarchar(7)

	set @ContactUsIDPrefix='CNT-US-'

begin tran
	
	select @CurrentContactUsID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentContactUsID'
	
	set @CurrentContactUsID=isnull(@CurrentContactUsID,0)+1
	Select @ContactUsID=dbo.generateID(@ContactUsIDPrefix,@CurrentContactUsID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
		
	INSERT INTO [tblContactUs]([ContactUsID],[Name],[Email],PhoneNo,ValidationCode,[Message],EntryBy)
     VALUES(@ContactUsID,@Name,@Email,@PhoneNo,@ValidationCode,@Message,@EntryBy )


	update tblAppSettings set PropertyValue=@CurrentContactUsID where PropertyName='CurrentContactUsID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO


CREATE TABLE [dbo].[tblReplyMessages](
	[CanMsgReplyID] [nvarchar](50) NULL,
	[ContactUsID] [nvarchar](50) NULL,
	[Message] [nvarchar](2000) NULL,
	[EntryBy] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblReplyMessages]  WITH CHECK ADD  CONSTRAINT [FK_tblReplyMessages_tblContactUs] FOREIGN KEY([ContactUsID])
REFERENCES [dbo].[tblContactUs] ([ContactUsID])
GO

ALTER TABLE [dbo].[tblReplyMessages] CHECK CONSTRAINT [FK_tblReplyMessages_tblContactUs]
GO

ALTER TABLE [dbo].[tblReplyMessages] ADD  CONSTRAINT [DF_tblReplyMessages_EntryDate]  DEFAULT (getdate()) FOR [EntryDate]
GO



GO


insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentReplyedMsgID',0)

GO


CREATE proc [dbo].[spInsertReplyedMessage]
@ContactUsID nvarchar(50),
@Message nvarchar(2000),
@EntryBy nvarchar(50)
as 


begin
	Declare @CanMsgReplyID nvarchar(50)
	DECLARE @ExamOrder integer
	Declare @CurrentCanMsgReplyID numeric(18,0)
	Declare @CanMsgReplyIDPrefix as nvarchar(8)

	set @CanMsgReplyIDPrefix='REP-MSG-'

begin tran

	
	select @CurrentCanMsgReplyID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentReplyedMsgID'
	
	set @CurrentCanMsgReplyID=isnull(@CurrentCanMsgReplyID,0)+1
	Select @CanMsgReplyID=dbo.generateID(@CanMsgReplyIDPrefix,@CurrentCanMsgReplyID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	INSERT INTO [tblReplyMessages]
           ([CanMsgReplyID]
           ,[ContactUsID]
           ,[Message]
           ,[EntryBy]
           )
     VALUES
           (@CanMsgReplyID
           ,@ContactUsID
           ,@Message
           ,@EntryBy
           )
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
		
	update dbo.tblContactUs set IsReplyed=1, ReplyDate=GETDATE() where ContactUsID=@ContactUsID 
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	update tblAppSettings set PropertyValue=@CurrentCanMsgReplyID where PropertyName='CurrentReplyedMsgID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO


CREATE proc spGetCandidateMessage
as
begin
	 select Name,ContactUsID,Email,PhoneNo,[Message],convert(nvarchar,EntryDate ,106) EntryDate from dbo.tblContactUs where IsReplyed=0
 end 
 
 GO
 
 
CREATE PROC spGetMessageFeedBack
@EntryBy as nvarchar(50)
as
begin
	select tblContactUs.[Message] Query,convert(nvarchar,tblContactUs.EntryDate,106) as 'QueryDate'
	,tblReplyMessages.[Message] Feedback from tblContactUs
	inner join tblReplyMessages on tblReplyMessages.ContactUsID=tblContactUs.ContactUsID
	where tblContactUs.EntryBy=@EntryBy order by tblContactUs.EntryDate desc
end

GO

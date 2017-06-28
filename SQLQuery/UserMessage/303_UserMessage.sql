
insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentUserMessageID',0)

GO

-- drop table tblUserMessage
Create table tblUserMessage(
MessageID nvarchar(50) primary key,
UniqueUserID nvarchar(50),
MessageBody nvarchar(1000),
IsSMSSent bit default 0,
SMSSentDate datetime,
SMSSentBy nvarchar(50),
IsEMailSent bit default 0,
EmailSentDate datetime,
EmailSentBy nvarchar(50),
IsActive bit default 1,
IssuedBy nvarchar(50),
IssueDate datetime default getdate()
);

GO
-- drop proc spShowMessageByUser
Create proc spShowMessageByUser
@UniqueUserID nvarchar(50)
as
begin
	Select MessageID,MessageBody,IssuedBy,Convert(nvarchar,IssueDate,106) as 'IssueDate' from tblUserMessage
	Where UniqueUserID = @UniqueUserID
	Order by CONVERT(datetime,IssueDate) desc
end

GO

-- drop proc spInsertUserMessage
Create proc spInsertUserMessage
@UniqueUserID nvarchar(50),
@MessageBody nvarchar(1000),
@IssuedBy nvarchar(50)
as
begin
	Declare @MessageID as nvarchar(50)
	Declare @CurrentMessageID numeric(18,0)
	Declare @MessageIDPrefix as nvarchar(4)

	set @MessageIDPrefix='MSG-'

begin tran
	
	select @CurrentMessageID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentUserMessageID'
	
	set @CurrentMessageID=isnull(@CurrentMessageID,0)+1
	Select @MessageID=dbo.generateID(@MessageIDPrefix,@CurrentMessageID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	Insert into tblUserMessage(MessageID,UniqueUserID,MessageBody,IssuedBy)
	Values(@MessageID,@UniqueUserID,@MessageBody,@IssuedBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	update tblAppSettings set PropertyValue=@CurrentMessageID where PropertyName='CurrentUserMessageID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

-- exec spInsertUserMessage 'Can-00000002','Welcome to application process Your are requested. to fill up your profile properly. thanks Admin.ULC','dsamaddar'


insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentRegistrationID',0)
GO

-- drop table tblRegisterUser
CREATE table tblRegisterUser(
RegistrationID nvarchar(50) primary key,
UserName nvarchar(200),
UserID nvarchar(50),
Password nvarchar(50),
Email nvarchar(50),
DateOfBirth datetime,
MobileNumber nvarchar(20) unique(MobileNumber),
NationalID nvarchar(50) Unique(NationalID),
ValidationCode nvarchar(50),
IsActive bit default 1,
EntryDate datetime default getdate()
);

GO

Create proc spGetRegisteredUserList
as
begin
	Select distinct RegistrationID,UserName from tblRegisterUser
end

-- exec spGetRegisteredUserList

GO

Create function fnChkUserIDAlreadyExists(@UserID nvarchar(50))
returns bit
as
begin
	if exists(Select * from tblRegisterUser Where UserID=@UserID)
		return 1
	else
		return 0
	return 0
end

GO

Create proc spChkDuplicateUserID
@UserID nvarchar(50)
as
begin
	Select dbo.fnChkUserIDAlreadyExists(@UserID) as 'AlreadyExistsUserID'
end

-- exec spChkDuplicateUserID 'dsamaddar'

-- SElect dbo.fnChkUserIDAlreadyExists('dsamaddar')

Go

-- drop proc spInsertRegistrationInfo
Create proc spInsertRegistrationInfo
@UserName nvarchar(200),
@UserID nvarchar(50),
@Password nvarchar(50),
@Email nvarchar(50),
@DateOfBirth datetime,
@MobileNumber nvarchar(20),
@ValidationCode nvarchar(50),
@NationalID nvarchar(50)
as
begin
	
	Declare @WelComeMSG as nvarchar(300)
		
	Declare @RegistrationID nvarchar(50)
	Declare @CurrentRegistrationID numeric(18,0)
	Declare @RegistrationIDPrefix as nvarchar(4)

	set @RegistrationIDPrefix='REG-'
	Set @WelComeMSG = 'Welcome to ULC''s application process Your are requested to fill up your profile properly. thanks Admin.ULC'

begin tran
	
	select @CurrentRegistrationID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentRegistrationID'
	
	set @CurrentRegistrationID=isnull(@CurrentRegistrationID,0)+1
	Select @RegistrationID=dbo.generateID(@RegistrationIDPrefix,@CurrentRegistrationID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	Insert into tblRegisterUser(RegistrationID,UserName,UserID,Password,Email,DateOfBirth,MobileNumber,ValidationCode,NationalID)
	Values(@RegistrationID,@UserName,@UserID,@Password,@Email,@DateOfBirth,@MobileNumber,@ValidationCode,@NationalID)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	update tblAppSettings set PropertyValue=@CurrentRegistrationID where PropertyName='CurrentRegistrationID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	exec spInsertUserMessage @RegistrationID,@WelComeMSG,'ULC-Admin'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end


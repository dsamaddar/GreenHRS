USE [HRM]
GO
/****** Object:  StoredProcedure [dbo].[spInsertRegistrationInfo]    Script Date: 01/31/2013 15:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[spInsertRegistrationInfo]
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
	
	Declare @WelComeMSG as nvarchar(500)
		
	Declare @RegistrationID nvarchar(50)
	Declare @CurrentRegistrationID numeric(18,0)
	Declare @RegistrationIDPrefix as nvarchar(4)

	set @RegistrationIDPrefix='REG-'
	Set @WelComeMSG = 'Welcome to United Leasing online job application centre. Please find our detail recruitment process in "Application Process" menu. To submit your application, you have to create a profile or modify existing profile from "Create & Edit Profile" option. Attend Exam section is optional. You will be notified through message once we set an exam for you. - Thank you in advance from HR department. Best of Luck.'

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

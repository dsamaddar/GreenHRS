----------create view to login

-- drop view [vwAllUsers]
Create View [dbo].[vwAllUsers]
as
Select UserID as 'UserID',[Password] as 'Password',UserName,RegistrationID as 'UniqueUserID','Registered' as 'UserType' from tblRegisterUser Where IsActive=1
And RegistrationID not in (Select distinct RegistrationID from tblCandidateBasicInfo)
union all
SElect UserID as 'UserID',(Select password from tblRegisterUser Where RegistrationID=C.RegistrationID ) as 'Password',CandidateName as 'UserName',CandidateID as 'UniqueUserID','Candidate' as 'UserType' from tblCandidateBasicInfo C
union all
Select UserID as 'UserID',Password as 'Password',EmployeeName as 'UserName',EmployeeID as 'UniqueUserID',UserType as 'UserType' from tblEmployeeInfo

GO
-- Select * from [vwAllUsers]

--to login into the system

CREATE  procedure [dbo].[prLogin]
@UserID nvarchar(50),
@Password nvarchar(50),
@IP nvarchar(50)
as
begin
	Declare @isAuth as integer
	Declare @DefaultPage as nvarchar(50)
	Declare @username as nvarchar(100)
	--Declare @RegID as nvarchar(50)
	Declare @UniqueUserID as nvarchar(50)
	Declare @UserType as nvarchar(50)


	--if exists (Select UserID from dbo.tblRegisterUser where UserID=@UserID and [Password] COLLATE Latin1_General_CS_AS=@Password)
	--begin
	--	Select @username=UserName,@RegID=RegistrationID  from tblRegisterUser where UserID=@UserID
	--	set @isAuth=1
	--	--INSERT INTO tblLoginLog([UserID], [LoginTime], [LoginFrom])
	--	--values(@UserID,getdate(),@IP)

	--end
	--else
	--begin
	--	set @isAuth=0
	--end
	--set @username=isnull(@username,'')

	--Select @isAuth as isAuth,@username as username,'' as defaultpage,@RegID as RegistrationID
	
	
	if exists (Select UserID from dbo.vwAllUsers where UserID=@UserID and [Password] COLLATE Latin1_General_CS_AS=@Password)
	begin
		Select @username=UserName,@UniqueUserID=UniqueUserID,@UserType=UserType  from dbo.vwAllUsers where UserID=@UserID
		set @isAuth=1
	end
	
	else
	
	begin
		set @isAuth=0
	end
	set @username=isnull(@username,'')

	Select @isAuth as isAuth,@username as username,'' as defaultpage,@UniqueUserID as UniqueUserID,@UserType as UserType


end

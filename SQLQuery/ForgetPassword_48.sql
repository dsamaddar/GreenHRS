CREATE proc spForgetPassword
@Email nvarchar(50),
@DOB datetime
as
--exec spForgetPassword 'debu_mist@yahoo.com','11/22/1986'
begin
	select R.UserID as 'UserID',[Password] as 'Password',R.UserName as 'UserName',R .Email as 'Email',isnull(C.AlternateEmail,'') as 'AltEmail' ,CONVERT(nvarchar,R.DateOfBirth,106) as 'DOB'
	from tblRegisterUser R 
	left join tblCandidateBasicInfo C on C.RegistrationID=R.RegistrationID
	where convert(nvarchar, convert(datetime,R.DateOfBirth), 101) =convert(nvarchar, Convert(datetime,@DOB), 101) and (R .Email like '%'+@Email+'%' or C.AlternateEmail like '%'+@Email+'%' )
	
end
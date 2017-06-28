

CREATE  procedure [dbo].[spGetRegInfo]
@RegistrationID nvarchar(50)
as
begin
	
	Declare @MobileNumber as nvarchar(50)
	Declare @NationalID as nvarchar(100)


	
	select MobileNumber,NationalID from dbo.tblRegisterUser where RegistrationID=@RegistrationID
	

	--Select @MobileNumber as MobileNumber,@NationalID as NationalID
	
	Select @MobileNumber as MobileNumber,isnull(@NationalID,'') as NationalID


end

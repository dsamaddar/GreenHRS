

CREATE  procedure [dbo].[spGetRegInfo]
@UserID nvarchar(50)
as
begin
	
	Declare @MobileNumber as nvarchar(50)
	Declare @NationalID as nvarchar(100)


	
	select MobileNumber,NationalID from dbo.tblRegisterUser where UserID=@UserID 
	

	Select @MobileNumber as MobileNumber,@NationalID as NationalID


end

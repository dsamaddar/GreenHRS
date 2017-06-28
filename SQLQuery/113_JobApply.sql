

CREATE proc [dbo].[spInsertJobApply]
@CircularID nvarchar(50),
@CandidateID nvarchar(50),
@EntryBy nvarchar(50)
as
begin

	Declare @AppliedJobID nvarchar(50)
	Declare @CurrentAppliedJobID numeric(18,0)
	Declare @AppliedJobIDPrefix as nvarchar(13)

	set @AppliedJobIDPrefix='CAN-APP-'
	
begin tran
	
	select @CurrentAppliedJobID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentAppliedJobID'
	
	set @CurrentAppliedJobID=isnull(@CurrentAppliedJobID,0)+1
	Select @AppliedJobID=dbo.generateID(@AppliedJobIDPrefix,@CurrentAppliedJobID,8)	
		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	begin
		insert into dbo.tblAppliedJob(AppliedJobID,CircularID,CandidateID,CurrentStatus,EntryBy,EntryDate)
		values(@AppliedJobID,@CircularID,@CandidateID,'Applied',@EntryBy,GETDATE())
	end
	
	update tblAppSettings set PropertyValue=@CurrentAppliedJobID where PropertyName='CurrentAppliedJobID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	
	COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end


GO


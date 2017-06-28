CREATE proc spChangeStatusAfterScreening
@CandidateID nvarchar(50),
@Remarks nvarchar(500),
@ScreenedBy nvarchar(50)
as

begin

begin tran

	UPDATE tblAppliedJob set CurrentStatus='Rejected' where CandidateID=@CandidateID 
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	exec spInsertScreeningInterview @CandidateID,'',0,'','','',@Remarks,'Rejected',0,1,@ScreenedBy,'','',''
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	
COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end
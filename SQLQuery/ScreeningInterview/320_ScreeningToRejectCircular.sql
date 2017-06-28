


-- drop proc spGetAppliedJobListByCandidate
Alter proc spGetAppliedJobListByCandidate
@CandidateID nvarchar(50)
as
begin
	Select AppliedJobID,(Select JobTitle+' ( '+ CircularCode +' ) '  from tblJobCircular C Where C.CircularID=AJ.CircularID) as 'JobTitle'
	from tblAppliedJob AJ Where CandidateID=@CandidateID 
end

-- exec spGetAppliedJobListByCandidate 'Can-00000032'

GO

ALTER proc [dbo].[spChangeStatusAfterScreening]
@CandidateID nvarchar(50),
@Remarks nvarchar(500),
@ScreenedBy nvarchar(50),
@AppliedCircularToReject nvarchar(4000)
as

begin

begin tran

	-- If Not Applied To Any Job Then Assign "Without Circular" Job Circular
	if not exists( Select * from tblAppliedJob Where CandidateID=@CandidateID )
	begin
		Declare @CircularID as nvarchar(50)
		Set @CircularID = ''
		
		Select @CircularID=CircularID from tblJobCircular Where JobTitle='Without Circular'
		
		if @CircularID='' or @CircularID is null
		begin
			GOTO ERR_HANDLER
		end
		
		exec spInsertJobApply @CircularID,@CandidateID,@ScreenedBy
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
		
		UPDATE tblAppliedJob set CurrentStatus='Rejected',RejectedBy=@ScreenedBy,RejectedDate=GETDATE() 
		where CandidateID=@CandidateID 
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
		
	end 

	if @AppliedCircularToReject <> ''
	begin
		Declare @RejectedCirListIDtbl table(
		AppliedJobID nvarchar(50)
		);
		
		Insert Into @RejectedCirListIDtbl(AppliedJobID)
		SELECT Value 
   		FROM dbo.Split( ',', @AppliedCircularToReject )

		UPDATE tblAppliedJob set CurrentStatus='Rejected',RejectedBy=@ScreenedBy,RejectedDate=GETDATE() 
		where CandidateID=@CandidateID And AppliedJobID in ( Select Distinct AppliedJobID  from  @RejectedCirListIDtbl)
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
	end
	
	exec spInsertScreeningInterview @CandidateID,'',0,'','','',@Remarks,'Rejected',0,1,@ScreenedBy,'','','',''
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	
COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO


ALTER proc [dbo].[spInsertScreeningInterview]
@CandidateID nvarchar(50),
@InterviewMethod nvarchar(200),
@IsAnyOneKnownToOurInstitution bit,
@KnownDesignationID nvarchar(50),
@KnownPerson nvarchar(200),
@HowToKnowThePerson nvarchar(200),
@Remarks nvarchar(500),
@NextAction nvarchar(200),
@IsAccepted bit,
@IsRejected bit,
@ScreenedBy nvarchar(50),
@CanResMatchedInfoData nvarchar(4000),
@CanSuitableForInfoData nvarchar(4000),
@ScrMultipleQuesAnswerData nvarchar(4000),
@AppliedCircularToReject nvarchar(4000)
as
begin
	Declare @ScrInterviewID as nvarchar(50)
	Declare @CurrentScrInterviewID numeric(18,0)
	Declare @ScrInterviewIDPrefix as nvarchar(12)

	set @ScrInterviewIDPrefix='CAN-SCR-INT-'
	
	if @IsAnyOneKnownToOurInstitution = 0 
	begin
		Set @KnownDesignationID = null
		Set @KnownPerson = null 
	end
	
	Declare @ParamKnownDesignationID as nvarchar(50)
	Declare @ParamKnownPerson as nvarchar(200)
	Declare @ParamHowToKnowThePerson as nvarchar(200)
	
	if @KnownDesignationID = 'N\A'
	begin
		Set @ParamKnownDesignationID = null 
	end
	else
		Set @ParamKnownDesignationID = @KnownDesignationID 
	
	if @KnownPerson = 'N\A'
	begin
		Set @ParamKnownPerson = null
	end
	else
		Set @ParamKnownPerson = @KnownPerson
	
	If @HowToKnowThePerson = 'N\A'
	begin
		Set @ParamHowToKnowThePerson = null 
	end
	else
		Set @ParamHowToKnowThePerson = @HowToKnowThePerson 

begin tran
	
	select @CurrentScrInterviewID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentScrInterviewID'
	
	set @CurrentScrInterviewID=isnull(@CurrentScrInterviewID,0)+1
	Select @ScrInterviewID=dbo.generateID(@ScrInterviewIDPrefix,@CurrentScrInterviewID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	Insert Into tblScreeningInterview(ScrInterviewID,CandidateID,InterviewMethod,IsAnyOneKnownToOurInstitution,KnownDesignationID,
	KnownPerson,HowToKnowThePerson,Remarks,NextAction,IsAccepted,IsRejected,ScreenedBy)
	Values(@ScrInterviewID,@CandidateID,@InterviewMethod,@IsAnyOneKnownToOurInstitution,@ParamKnownDesignationID,
	@ParamKnownPerson,@ParamHowToKnowThePerson,@Remarks,@NextAction,@IsAccepted,@IsRejected,@ScreenedBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	-- Update Candidate Basic Info
	Update tblCandidateBasicInfo Set IsScreened=1,ScreenedDate=GETDATE(),ScreenedStatus=@NextAction,ScreenedBy=@ScreenedBy
	Where CandidateID=@CandidateID
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	-- Insert Responsibility Matched.
	Delete from tblCanResponsibilityMatched Where CandidateID=@CandidateID
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	exec spInsertCanResMatchedInfoList @CanResMatchedInfoData
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	-- Insert Suitable For Position
	Delete from tblCanSuitableFor Where CandidateID=@CandidateID
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	exec spInsertCanSuitableForInfoList @CanSuitableForInfoData
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	-- Multiple Question Options Selected.
	Delete From tblCanScrQuesOptionsSelected Where CandidateID=@CandidateID
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	exec spInsertCanScrQuesOptSelectedList @ScrMultipleQuesAnswerData
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	-- If Not Applied To Any Job Then Assign "Without Circular" Job Circular
	if not exists( Select * from tblAppliedJob Where CandidateID=@CandidateID )
	begin
		Declare @CircularID as nvarchar(50)
		Set @CircularID = ''
		
		Select @CircularID=CircularID from tblJobCircular Where JobTitle='Without Circular'
		
		if @CircularID='' or @CircularID is null
		begin
			GOTO ERR_HANDLER
		end
		
		exec spInsertJobApply @CircularID,@CandidateID,@ScreenedBy
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
	end 
	
	-- To Reject Applied Circular
	if @AppliedCircularToReject <> ''
	begin
		Declare @RejectedCirListIDtbl table(
		AppliedJobID nvarchar(50)
		);
		
		Insert Into @RejectedCirListIDtbl(AppliedJobID)
		SELECT Value 
   		FROM dbo.Split( ',', @AppliedCircularToReject )

		UPDATE tblAppliedJob set CurrentStatus='Rejected',RejectedBy=@ScreenedBy,RejectedDate=GETDATE() 
		where CandidateID=@CandidateID And AppliedJobID in ( Select Distinct AppliedJobID  from  @RejectedCirListIDtbl)
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
	end
	-- End Of To Reject Applied Circular
	
	update tblAppSettings set PropertyValue=@CurrentScrInterviewID where PropertyName='CurrentScrInterviewID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end


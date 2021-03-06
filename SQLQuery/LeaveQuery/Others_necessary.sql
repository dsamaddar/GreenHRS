
CREATE proc [dbo].[spAssignCandidateToIntPanel]
@Participant nvarchar(4000),
@CircularID nvarchar(50),
@IntTeamID nvarchar(50),
@InterviewDate datetime,
@EntryBy nvarchar(50)
as
begin
	Declare @InterviewTakerIDtbl table(
	IntTakerID nvarchar(50),
	Taken bit default 0
	);

begin tran
	
	Declare @JobTitle as nvarchar(200)
	Declare @IntTeamName as nvarchar(200)
	Declare @IntAssignmentMSG as nvarchar(500)
	Set @IntAssignmentMSG = ''
	Set @IntTeamName = ''
	Set @JobTitle = ''

	Insert Into @InterviewTakerIDtbl(IntTakerID)
	SELECT Value 
   	FROM dbo.Split( ',', @Participant ) AS s
   	ORDER BY s.[Value]
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Declare @IntTakerID as nvarchar(50)
	Declare @NCount as int 
	Set @NCount = 0

	Select @NCount=Count(*) from @InterviewTakerIDtbl 

	While @NCount > 0
	begin
		Select top 1 @IntTakerID=IntTakerID from @InterviewTakerIDtbl Where Taken=0

		Update tblAppliedJob Set CurrentStatus='InterviewAssigned' Where CandidateID=@IntTakerID And CircularID=@CircularID
		IF (@@ERROR <> 0) GOTO ERR_HANDLER

		exec spInsertInterviewCandidateInsert @IntTakerID,@CircularID,@IntTeamID,@InterviewDate,@EntryBy
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
		
		Select @JobTitle=JobTitle from tblJobCircular Where CircularID=@CircularID
		Select @IntTeamName=IntTeamName from tblInterViewTeam Where IntTeamID=@IntTeamID
		
		Set @IntAssignmentMSG = 'Dear Candidate You Have Been Assigned An Interview Dated : ('+ CONVERT(nvarchar,@InterviewDate,106)+'), For Circular: '+ isnull(@JobTitle,'N\A') + ', In Panel: ' + isnull(@IntTeamName,'N\A')+'.'
		
		exec spInsertUserMessage @IntTakerID,@IntAssignmentMSG,'ULC-Admin'
		IF (@@ERROR <> 0) GOTO ERR_HANDLER

		Set @NCount = @NCount -1
		Set @IntTakerID = ''
		
		Set @IntAssignmentMSG=''
		Set @JobTitle = ''
		Set @IntTeamName = ''
	end

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO
ALTER proc [dbo].[spAssignQuestionPaper]
@ExamID nvarchar(50),
@Participant nvarchar(4000),
@EntryPoint nvarchar(50),
@PreparedBy nvarchar(50)
as
begin
	Declare @ExamTakerIDtbl table(
	ExamTakerID nvarchar(50),
	Taken bit default 0
	);

	Declare @ExamName as nvarchar(200)
	Declare @ExamAssignmentMSG as nvarchar(500)
	
	Declare @ExamRollNo as nvarchar(50)
	Declare @CurrentExamRollNo numeric(18,0)
	Declare @ExamRollNoPrefix as nvarchar(2)

	set @ExamRollNoPrefix='RL'
	Set @ExamAssignmentMSG = ''
	Set @ExamName = ''

begin tran
	
	select @CurrentExamRollNo = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentExamRollNo'
	
	Insert Into @ExamTakerIDtbl(ExamTakerID)
	SELECT Value 
   	FROM dbo.Split( ',', @Participant ) AS s
   	ORDER BY s.[Value]
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	Declare @ExamTakerID nvarchar(50)
	Declare @NCount int 
	Set @NCount = 0

	Select @NCount=Count(*) from @ExamTakerIDtbl 

	While @NCount > 0
	begin
		Select top 1 @ExamTakerID=ExamTakerID from @ExamTakerIDtbl Where Taken=0

		set @CurrentExamRollNo=isnull(@CurrentExamRollNo,0)+1
		Select @ExamRollNo=dbo.generateID(@ExamRollNoPrefix,@CurrentExamRollNo,8)		
		IF (@@ERROR <> 0) GOTO ERR_HANDLER

		exec spAssignSingleUserQuestionPaper @ExamID,@ExamTakerID,@ExamRollNo,@EntryPoint,@PreparedBy
		IF (@@ERROR <> 0) GOTO ERR_HANDLER

		Update @ExamTakerIDtbl Set Taken=1 Where ExamTakerID=@ExamTakerID
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
		
		Select @ExamName = ExamName from tblExamDefinition Where ExamID=@ExamID
		
		Set @ExamAssignmentMSG = 'Dear Candidate You Have Been Assigned An Exam Named ( '+ ISNULL(@ExamName,'N\A')+' ). Use Roll No ( ' + isnull(@ExamRollNo,'N\A') + ' ). You Are Requested To Follow Instructions And Take The Exam.'
		
		exec spInsertUserMessage @ExamTakerID,@ExamAssignmentMSG,'ULC-Admin'
		IF (@@ERROR <> 0) GOTO ERR_HANDLER

		Set @NCount = @NCount -1
		Set @ExamTakerID = ''

	end

	update tblAppSettings set PropertyValue=@CurrentExamRollNo where PropertyName='CurrentExamRollNo'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

-- exec spAssignQuestionPaper 'EXAM-00000001','REG-00000001,REG-00000002','201204569859','dsamaddar'

GO
ALTER proc [dbo].[spGetCandidateWiseSummaryResult]
@CandidateID nvarchar(50)
as
begin
	Select Distinct ExamID,ExamRollNo,ExamName,ExamCode,TotalQuestion,TotalMarks,SUM(PositiveMarking) as 'PositiveMarking',
	SUM(NegativeMarking) as 'NegativeMarking',(SUM(PositiveMarking) - SUM(NegativeMarking)) as 'ObtainedMarks'
	from vwExamDefinition Where ExamTakerID=@CandidateID
	group by ExamID,ExamName,ExamRollNo,ExamCode,TotalQuestion,TotalMarks 
end

-- exec [spGetCandidateWiseSummaryResult] 'Can-00000010'


GO
ALTER proc [dbo].[spAssignSingleUserQuestionPaper]
@ExamID nvarchar(50),
@ExamTakerID nvarchar(50),
@ExamRollNo nvarchar(50),
@EntryPoint nvarchar(50),
@PreparedBy nvarchar(50)
as
begin
	Declare @ExamPaperIDtbl table(
	ExamPaperID nvarchar(50),
	Taken bit default 0
	);

begin tran

	Insert into @ExamPaperIDtbl(ExamPaperID)
	Select ExamPaperID from tblExamPaper Where ExamWiseSubjectID in 
		(     Select Distinct ExamWiseSubjectID from tblExamWiseSubject Where ExamID=@ExamID	)
	And IsActive=1 
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Declare @ExamPaperID as nvarchar(50)
	Declare @NCount as int
	Set @NCount = 0

	Select @NCount=count(*) from @ExamPaperIDtbl
	While @NCount > 0 
	begin
		Select top 1 @ExamPaperID=ExamPaperID from @ExamPaperIDtbl Where Taken=0
	
		exec spInsertQuestionPaper @ExamTakerID,@ExamPaperID,@ExamRollNo,@EntryPoint,@PreparedBy
		IF (@@ERROR <> 0) GOTO ERR_HANDLER

		Update @ExamPaperIDtbl Set Taken=1 Where ExamPaperID=@ExamPaperID
		IF (@@ERROR <> 0) GOTO ERR_HANDLER

		Set @NCount=@NCount-1
		Set @ExamPaperID=''
	end
		
COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end


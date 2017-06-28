
insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentQuestionPaperID',0)
GO
insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentExamRollNo',0)
GO

-- drop table tblQuestionPaper
Create table tblQuestionPaper(
QuestionPaperID nvarchar(50),
ExamTakerID nvarchar(50),
ExamPaperID nvarchar(50) foreign key references tblExamPaper(ExamPaperID),
ExamRollNo nvarchar(50),
StartTime datetime,
EndTime datetime,
GivenAnswer nvarchar(100),
GivenAnswerImage nvarchar(100),
IsActive bit default 1,
ExamTaken bit default 0,
FinalizedExam bit default 0,
TimeOuts bit default 0,
Status nvarchar(50),
EntryPoint nvarchar(50),
PreparedBy nvarchar(50),
PreparedDate datetime default getdate()
);

GO

-- drop proc spGetEntryPoints
Create proc spGetEntryPoints
as
begin
	Select Distinct EntryPoint From tblQuestionPaper order by EntryPoint desc
end

-- exec spGetEntryPoints
-- select * from tblQuestionPaper

GO


-- drop proc spGetAttendeesByEntryPoint
Create proc spGetAttendeesByEntryPoint
@EntryPoint nvarchar(50)
as
begin
	Select Distinct Q.ExamTakerID,U.UserName,Q.ExamRollNo,(Case Q.ExamTaken When 1 Then 'Yes' When 0 Then 'No' Else 'Unknown' end) as 'ExamTaken',
	Q.PreparedBy from tblQuestionPaper Q Inner Join vwAllUsers U 
	On Q.ExamTakerID=U.UserID Where EntryPoint=@EntryPoint
end

-- exec spGetAttendeesByEntryPoint '201210161756'

Go

-- drop proc spChkAlreadyAssignedAndExamNotTaken
Create proc spChkAlreadyAssignedAndExamNotTaken
@ExamTakerID nvarchar(50),
@ExamID nvarchar(50)
as
begin

	if exists (
	Select ExamPaperID from tblQuestionPaper Where ExamTakerID=@ExamTakerID
	And ExamPaperID In
	(
		Select ExamPaperID from tblExamPaper Where ExamWiseSubjectID in 
		(     Select Distinct ExamWiseSubjectID from tblExamWiseSubject Where ExamID=@ExamID	)
	)
	And ExamTaken = 0
	)
		Select '1' As 'AlreadyAssigned'
	else
		Select '0' As 'AlreadyAssigned'		
	
end

-- exec spChkAlreadyAssignedAndExamNotTaken 'REG-00000001','EXAM-00000001'
GO

/*
SELECT Value 
   FROM dbo.Split( ',', 'REG-00000001,REG-00000002' ) AS s
   ORDER BY s.[Value]

*/

CREATE FUNCTION dbo.Split(@Delimiter varchar(5), @List varchar(8000) ) 
RETURNS @TableOfValues table 
(  [Value] varchar(50)   ) 
AS 
BEGIN

DECLARE @LenString int 

WHILE len( @List ) > 0 
 BEGIN 
 
    SELECT @LenString = 
       (CASE charindex( @Delimiter, @List ) 
           WHEN 0 THEN len( @List ) 
           ELSE ( charindex( @Delimiter, @List ) -1 )
        END
       ) 
                        
    INSERT INTO @TableOfValues 
       SELECT substring( @List, 1, @LenString )
        
    SELECT @List = 
       (CASE ( len( @List ) - @LenString ) 
           WHEN 0 THEN '' 
           ELSE right( @List, len( @List ) - @LenString - 1 ) 
        END
       ) 
 END
  
RETURN 

END 

GO

-- drop proc spInsertQuestionPaper
Create proc spInsertQuestionPaper
@ExamTakerID nvarchar(50),
@ExamPaperID nvarchar(50),
@ExamRollNo nvarchar(50),
@EntryPoint nvarchar(50),
@PreparedBy nvarchar(50)
as
begin
	Declare @QuestionPaperID as nvarchar(50)
	Declare @CurrentQuestionPaperID numeric(18,0)
	Declare @QuestionPaperIDPrefix as nvarchar(11)

	set @QuestionPaperIDPrefix='QUES-PAPER-'

begin tran
	
	select @CurrentQuestionPaperID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentQuestionPaperID'
	
	set @CurrentQuestionPaperID=isnull(@CurrentQuestionPaperID,0)+1
	Select @QuestionPaperID=dbo.generateID(@QuestionPaperIDPrefix,@CurrentQuestionPaperID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblQuestionPaper(QuestionPaperID,ExamTakerID,ExamPaperID,ExamRollNo,EntryPoint,PreparedBy)
	Values(@QuestionPaperID,@ExamTakerID,@ExamPaperID,@ExamRollNo,@EntryPoint,@PreparedBy)

	update tblAppSettings set PropertyValue=@CurrentQuestionPaperID where PropertyName='CurrentQuestionPaperID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end


GO


-- drop proc spAssignSingleUserQuestionPaper
Create proc spAssignSingleUserQuestionPaper
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

GO


-- drop proc spAssignQuestionPaper
Create proc spAssignQuestionPaper
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

	Declare @ExamRollNo as nvarchar(50)
	Declare @CurrentExamRollNo numeric(18,0)
	Declare @ExamRollNoPrefix as nvarchar(2)

	set @ExamRollNoPrefix='RL'

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



-- drop proc spLoadQuestion
Create proc spLoadQuestion
@ExamRollNo nvarchar(50),
@Status nvarchar(50)
as
begin
	Select top 1 QuestionPaperID,Question,Images,Answer_A,Answer_A_Image,Answer_B,Answer_B_Image,Answer_C,Answer_C_Image,
	Answer_D,Answer_D_Image,Answer_E,Answer_E_Image from 	vwExamPaperWiseQuestion Where 
	ExamRollNo=@ExamRollNo And IsActive=1 And ExamTaken=1 And FinalizedExam=0 And Status=@Status
end

-- exec spLoadQuestion 'RL00000001','Skipped'

/*
Select * from tblSubjects
select * from tblQuestions
select * from tblExamDefinition
Select * from tblExamWiseSubject
Select * from tblExamPaper
Select * from tblQuestionPaper
*/

GO

-- drop view vwExamPaperWiseQuestion
Create View vwExamPaperWiseQuestion
as
Select QP.QuestionPaperID,QP.ExamTakerID,Q.Question,Q.QuestionID,Q.Images,Q.Answer_A,Q.Answer_A_Image,Q.Answer_B,Q.Answer_B_Image,Q.Answer_C,Q.Answer_C_Image,
Q.Answer_D,Q.Answer_D_Image,Q.Answer_E,Q.Answer_E_Image,QP.ExamRollNo,EWS.ExamID,QP.IsActive,QP.ExamTaken,QP.FinalizedExam,QP.Status,QP.GivenAnswer,QP.GivenAnswerImage,
S.SubjectID,S.SubjectName,EWS.PositiveMarkingPerQuestion,EWS.NegativeMarkingPerQuestion
from tblQuestions Q Inner Join tblExamPaper EP On Q.QuestionID=EP.QuestionID
Inner Join tblExamWiseSubject EWS On EP.ExamWiseSubjectID=EWS.ExamWiseSubjectID 
Inner Join tblSubjects S On EWS.SubjectID=S.SubjectID 
Inner Join tblQuestionPaper QP On EP.ExamPaperID=QP.ExamPaperID


-- Select * from vwExamPaperWiseQuestion

GO

-- drop proc spGetAvailableExamsByUserID
Create proc spGetAvailableExamsByUserID
@UserID nvarchar(50)
as
begin
	Declare @RegistrationID as nvarchar(50)

	Select @RegistrationID=UserID from vwAllUsers Where UniqueUserID=@UserID

	Select ExamID,ExamName from tblExamDefinition Where ExamID in
	(
	Select Distinct ExamID from vwExamPaperWiseQuestion Where IsActive=1 And ExamTaken=0 And FinalizedExam=0
	And ExamTakerID=@RegistrationID
	)
end

-- exec spGetAvailableExamsByUserID 'dsamaddar'

GO

-- drop proc spVerifyRollNo
Create proc spVerifyRollNo
@UserID nvarchar(50),
@ExamID nvarchar(50),
@ExamRollNo nvarchar(50)
as
begin

	Declare @RegistrationID as nvarchar(50)

	Select @RegistrationID=UserID from vwAllUsers Where UniqueUserID=@UserID

	if exists (
	Select Distinct ExamID from vwExamPaperWiseQuestion Where IsActive=1 And ExamTaken=0 And FinalizedExam=0
	And ExamTakerID=@RegistrationID And ExamID=@ExamID And ExamRollNo=@ExamRollNo
	)
	begin
		Select '1' as Verified
	end
	Else
	begin
		Select '0' as Verified
	end
end

-- exec spVerifyRollNo 'dsamaddar','EXAM-00000001','RL00000001'

GO

-- drop proc spStartQuiz
Create proc spStartQuiz
@ExamRollNo nvarchar(50)
as
begin
	Update tblQuestionPaper Set ExamTaken=1, Status='NotAnswered' Where ExamRollNo=@ExamRollNo

	Update tblQuestionPaper Set StartTime=Getdate() Where QuestionPaperID in (
	Select top 1 QuestionPaperID from vwExamPaperWiseQuestion Where 
	ExamRollNo=@ExamRollNo And IsActive=1 And ExamTaken=1 And FinalizedExam=0 And Status='NotAnswered'
	)
end

GO

-- drop proc spSkipQuestion
Create proc spSkipQuestion
@QuestionPaperID nvarchar(50),
@ExamRollNo nvarchar(50)
as
begin
	Update tblQuestionPaper Set Status='Skipped',EndTime=getdate() Where QuestionPaperID=@QuestionPaperID

	Update tblQuestionPaper Set StartTime=Getdate() Where QuestionPaperID in (
	Select top 1 QuestionPaperID from vwExamPaperWiseQuestion Where 
	ExamRollNo=@ExamRollNo And IsActive=1 And ExamTaken=1 And FinalizedExam=0 And Status='NotAnswered'
	)
end

GO

-- drop proc spLoadNextQuestion
Create proc spLoadNextQuestion
@QuestionPaperID nvarchar(50),
@GivenAnswer nvarchar(100),
@GivenAnswerImage nvarchar(100),
@ExamRollNo nvarchar(50)
as
begin
	Update tblQuestionPaper Set Status='Answered',EndTime=getdate(),GivenAnswer=@GivenAnswer,GivenAnswerImage=@GivenAnswerImage
	Where QuestionPaperID=@QuestionPaperID

	Update tblQuestionPaper Set StartTime=Getdate() Where QuestionPaperID in (
	Select top 1 QuestionPaperID from vwExamPaperWiseQuestion Where 
	ExamRollNo=@ExamRollNo And IsActive=1 And ExamTaken=1 And FinalizedExam=0 And Status='NotAnswered'
	)
end

GO

Create proc spFinalizedExam
@ExamRollNo nvarchar(50)
as
begin
	Update tblQuestionPaper Set FinalizedExam=1 Where ExamRollNo=@ExamRollNo
end

Go

-- drop proc spTimeOuts
Create proc spTimeOuts
@ExamRollNo nvarchar(50)
as
begin
	Update tblQuestionPaper Set TimeOuts=1 Where ExamRollNo=@ExamRollNo And Status in ('NotAnswered','Skipped')
end

GO

-- drop proc spShowExamResult
Create proc spShowExamResult
@ExamRollNo nvarchar(50)
as
begin
	Declare @Answered as int
	Declare @NotAnswered as int
	Declare @Skipped as int
	Declare @TotalQuestion as int
	Declare @TotalTime as int

	Declare @ExamID as nvarchar(50)
	Select @ExamID = ExamID from vwExamPaperWiseQuestion Where ExamRollNo=@ExamRollNo

	Select @Answered=count(*)  from tblQuestionPaper Where ExamRollNo=@ExamRollNo And Status='Answered'
	Select @NotAnswered=count(*)  from tblQuestionPaper Where ExamRollNo=@ExamRollNo And Status='NotAnswered'
	Select @Skipped=count(*)  from tblQuestionPaper Where ExamRollNo=@ExamRollNo And Status='Skipped'

	Select @Answered as 'Answered',@NotAnswered as 'NotAnswered',@Skipped as 'Skipped',
	TotalQuestion,TotalMarks,TotalTime,ExamName,ExamCode from tblExamDefinition Where ExamID=@ExamID
end

-- exec spShowExamResult 'RL00000030'



GO

-- drop proc spShowResultWithSubjectWiseMarking
Create proc spShowResultWithSubjectWiseMarking
@ExamRollNo nvarchar(50)
as
begin
	Select Distinct VW.SubjectName,VW.PositiveMarkingPerQuestion,VW.NegativeMarkingPerQuestion,
	(Select Count(*) from vwExamPaperWiseQuestion V Where ExamRollNo=@ExamRollNo And V.SubjectID=VW.SubjectID) as 'NoOfQuestions',
	(Select Count(*) from tblQuestions Q,vwExamPaperWiseQuestion V Where V.QuestionID=Q.QuestionID And Q.CorrectAnswre=V.GivenAnswer And Q.CorrectAnswre_Image= V.GivenAnswerImage And V.ExamRollNo=@ExamRollNo And VW.SubjectID=V.SubjectID And V.Status='Answered') as 'Correct'
	From vwExamPaperWiseQuestion VW
	Where Status='Answered' And ExamRollNo=@ExamRollNo
end

-- exec spShowResultWithSubjectWiseMarking 'RL00000030'

-- Select * from vwExamPaperWiseQuestion

GO

-- drop proc SpShowGradingSystemAsPerExam
Create proc SpShowGradingSystemAsPerExam
@ExamRollNo nvarchar(50)
as
begin
	Declare @GradingSystem as nvarchar(50)
	Declare @ExamID as nvarchar(50)
	Select @ExamID = ExamID from vwExamPaperWiseQuestion Where ExamRollNo=@ExamRollNo

	Select @GradingSystem=GradingSystem from tblExamDefinition Where ExamID=@ExamID

	If @GradingSystem = 'Default'
	begin
		exec spGetGradingSystem
	end
	else
	begin
		Select FromPercentage,ToPercentage,LetterGrade,GradePoint from tblExamWiseGradingSystem
		Where ExamID=@ExamID
	end

	
end

-- exec SpShowGradingSystemAsPerExam 'RL00000018'

GO

-- Select * from vwExamPaperWiseQuestion

-- drop view vwSubjectWiseExamStatus
Create view vwSubjectWiseExamStatus
as
Select Distinct VW.ExamRollNo,VW.SubjectName,VW.PositiveMarkingPerQuestion,VW.NegativeMarkingPerQuestion,
(Select Count(*) from vwExamPaperWiseQuestion V Where V.SubjectID=VW.SubjectID And V.ExamRollNo=VW.ExamRollNo And Status='Answered') as 'NoOfQuestions',
(Select Count(*) from tblQuestions Q,vwExamPaperWiseQuestion V Where V.QuestionID=Q.QuestionID And V.ExamRollNo=VW.ExamRollNo And Q.CorrectAnswre=V.GivenAnswer And Q.CorrectAnswre_Image= V.GivenAnswerImage And VW.SubjectID=V.SubjectID) as 'Correct'
From vwExamPaperWiseQuestion VW
Where Status='Answered'

-- Select * from vwSubjectWiseExamStatus Where ExamRollNo='RL00000018'

-- Select * from vwExamPaperWiseQuestion

GO

-- drop function fnShowGradingSystemAsPerExam
Create Function fnShowGradingSystemAsPerExam(@ExamRollNo nvarchar(50))
returns @GradingTbl table(
FromPercentage numeric(5,2),
ToPercentage numeric(5,2),
LetterGrade nvarchar(10),
Gradepoint numeric(3,2)
)
as
begin
	Declare @GradingSystem as nvarchar(50)
	Declare @ExamID as nvarchar(50)
	Select @ExamID = ExamID from vwExamPaperWiseQuestion Where ExamRollNo=@ExamRollNo

	Select @GradingSystem=GradingSystem from tblExamDefinition Where ExamID=@ExamID

	If @GradingSystem = 'Default'
	begin
		Insert Into @GradingTbl
		Select FromPercentage,ToPercentage,LetterGrade,GradePoint from tblGradingSystem
	end
	else
	begin
		Insert Into @GradingTbl
		Select FromPercentage,ToPercentage,LetterGrade,GradePoint from tblExamWiseGradingSystem
		Where ExamID=@ExamID
	end

	return 
end

-- Select * from dbo.fnShowGradingSystemAsPerExam('RL00000001')

GO

-- drop proc spGradeInfoByExamRollNo
Create proc spGradeInfoByExamRollNo
@ExamRollNo nvarchar(50)
as
begin
	Declare @ObtainedMarks as numeric(18,2)
	Declare @TotalMarks as numeric(18,2)
	

	Declare @ExamID as nvarchar(50)
	Select @ExamID = ExamID from vwExamPaperWiseQuestion Where ExamRollNo=@ExamRollNo	

	Select @TotalMarks = TotalMarks from tblExamDefinition Where ExamID=@ExamID

	Select @ObtainedMarks= Sum(Correct*PositiveMarkingPerQuestion) - sum((NoOfQuestions-Correct)*NegativeMarkingPerQuestion) from vwSubjectWiseExamStatus Where 
	ExamRollNo=@ExamRollNo

	if @ObtainedMarks < 0
	begin
		Set @ObtainedMarks = 0
	end

	Declare @GradingTbl table(
	FromPercentage numeric(5,2),
	ToPercentage numeric(5,2),
	LetterGrade nvarchar(10),
	Gradepoint numeric(3,2)
	);

	Insert into @GradingTbl 
	Select * from dbo.fnShowGradingSystemAsPerExam(@ExamRollNo)

	Select isnull(GradePoint,'0.00') as GradePoint,isnull(LetterGrade,'Unknown') as LetterGrade
	From @GradingTbl Where (@ObtainedMarks/@TotalMarks*100) between FromPercentage And ToPercentage
end

-- exec spGradeInfoByExamRollNo 'RL00000018'

-- Select * from vwSubjectWiseExamStatus
-- Select * from vwExamPaperWiseQuestion

GO

-- drop proc spGetRemainingQuestionStatus
Create proc spGetRemainingQuestionStatus
@ExamRollNo nvarchar(50),
@Status nvarchar(50)
as
begin
	Select Count(*) as 'Remaining' from tblQuestionPaper Where Status=@Status And ExamRollNo=@ExamRollNo
end

-- exec spGetRemainingQuestionStatus 'RL00000016','NotAnswered'
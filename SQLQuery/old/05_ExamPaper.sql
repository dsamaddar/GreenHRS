
insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentExamPaperID',0)

GO

-- drop table tblExamPaper
Create table tblExamPaper(
ExamPaperID nvarchar(50) Primary Key,
ExamWiseSubjectID nvarchar(50) foreign key references tblExamWiseSubject(ExamWiseSubjectID),
QuestionID nvarchar(50)  foreign key references tblQuestions(QuestionID),
IsActive bit default 1,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

-- drop proc spInsertExamPaper
Create proc spInsertExamPaper
@ExamWiseSubjectID nvarchar(50),
@QuestionID nvarchar(50),
@EntryBy nvarchar(50)
as
begin
	Declare @ExamPaperID as nvarchar(50)
	Declare @CurrentExamPaperID numeric(18,0)
	Declare @ExamPaperIDPrefix as nvarchar(11)

	set @ExamPaperIDPrefix='EXAM-PAPER-'

begin tran
	
	select @CurrentExamPaperID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentExamPaperID'
	
	set @CurrentExamPaperID=isnull(@CurrentExamPaperID,0)+1
	Select @ExamPaperID=dbo.generateID(@ExamPaperIDPrefix,@CurrentExamPaperID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert Into tblExamPaper(ExamPaperID,ExamWiseSubjectID,QuestionID,EntryBy)
	Values(@ExamPaperID,@ExamWiseSubjectID,@QuestionID,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	update tblAppSettings set PropertyValue=@CurrentExamPaperID where PropertyName='CurrentExamPaperID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end


GO

-- drop proc spGetExamWiseSubjectStatus
Create proc spGetExamWiseSubjectStatus
@ExamID nvarchar(50)
as
begin
	Select EWS.ExamWiseSubjectID,dbo.fnGetSubjectName(EWS.SubjectID) + ' ( ' +
	(Select convert(nvarchar,isnull(Count(*),0)) from tblExamPaper Where ExamWiseSubjectID=EWS.ExamWiseSubjectID And IsActive=1) + ' )' as 'SubjectName'
	from tblExamWiseSubject EWS Where ExamID=@ExamID
end

-- exec spGetExamWiseSubjectStatus 'EXAM-00000001'
/*
Select * from tblExamPaper

Select * from tblQuestions
*/

Go

-- drop proc spGetQuestionsByEWSID
Create proc spGetQuestionsByEWSID
@ExamWiseSubjectID nvarchar(50)
as
begin
	Declare @SubjectID nvarchar(50)

	Select @SubjectID = SubjectID from tblExamWiseSubject Where ExamWiseSubjectID=@ExamWiseSubjectID

	Select Q.QuestionID,Q.Question,Q.QuestionOrder,Q.DifficultyLevel,Convert(nvarchar,Q.EntryDate,106) as 'EntryDate',
	10.7 as 'Correct',40 as 'Wrong',20 as 'NotAnswered',20 as 'Skipped', EWS.PositiveMarkingPerQuestion
	from tblQuestions Q Inner Join tblExamWiseSubject EWS  On Q.SubjectID=EWS.SubjectID
	Where Q.SubjectID=@SubjectID And
	Q.QuestionID not in (Select Distinct QuestionID from tblExamPaper Where IsActive=1 And ExamWiseSubjectID=@ExamWiseSubjectID)
	
end

-- exec spGetQuestionsByEWSID 'EXAM-W-SUB-00000001'

-- Select * from tblExamWiseSubject

GO

-- drop proc spGetExamParameters
Create proc spGetExamParameters
@ExamID nvarchar(50)
as
begin
	Select TotalQuestion,TotalMarks,TotalTime,dbo.fnGetAllocationRemainingByExamID(@ExamID) as 'AllocationRemaining',
	dbo.fnGetAllocationQuesRemByExamID(@ExamID) as 'AllocatedQuestionRemaining'
	From tblExamDefinition
	Where ExamID=@ExamID
end

-- exec spGetExamParameters 'EXAM-00000001'

GO

-- drop function fnGetAllocationQuesRemByExamID
Create function fnGetAllocationQuesRemByExamID(@ExamID nvarchar(50))
returns int
as
begin
	Declare @TotalQuestion as int
	Declare @AllocatedQuestion as int

	Select @TotalQuestion=TotalQuestion from tblExamDefinition Where ExamID=@ExamID
	Select @AllocatedQuestion=Count(*) from tblExamPaper Where ExamWiseSubjectID in (
	Select ExamWiseSubjectID from tblExamWiseSubject Where ExamID=@ExamID
	) And IsActive=1

	Return @TotalQuestion-@AllocatedQuestion
end

-- Select dbo.fnGetAllocationQuesRemByExamID('EXAM-00000001')

Go

-- drop function fnGetAllocationRemainingByExamID
Create Function fnGetAllocationRemainingByExamID(@ExamID nvarchar(50))
returns numeric(18,2)
as
begin
	Declare @ExamWiseSubjectID as nvarchar(50)
	Declare @PositiveMarkingPerQuestion as numeric(4,2)
	Declare @NCount as int
	Declare @QCount as int
	Declare @Allocated as numeric(18,2)
	Declare @TotalMarks as numeric(18,2)

	Set @Allocated = 0
	Set @TotalMarks = 0

	Declare @ExamWiseSubjectTbl table(
	ExamWiseSubjectID nvarchar(50),
	Taken bit default 0
	);

	Set @PositiveMarkingPerQuestion=0

	Select @TotalMarks = TotalMarks from tblExamDefinition Where ExamID=@ExamID

	Insert Into @ExamWiseSubjectTbl(ExamWiseSubjectID)
	Select Distinct ExamWiseSubjectID from tblExamWiseSubject Where ExamID=@ExamID 

	Select @NCount=Count(*) from @ExamWiseSubjectTbl

	While @NCount <> 0
	begin
		Select Top 1 @ExamWiseSubjectID=ExamWiseSubjectID from @ExamWiseSubjectTbl Where Taken = 0

		Select @QCount = Count(*) from tblExamPaper Where ExamWiseSubjectID=@ExamWiseSubjectID And IsActive=1

		Select @PositiveMarkingPerQuestion = PositiveMarkingPerQuestion from tblExamWiseSubject Where ExamWiseSubjectID=@ExamWiseSubjectID
		
		Set @Allocated = @Allocated + @QCount*@PositiveMarkingPerQuestion
		
		Update @ExamWiseSubjectTbl Set Taken=1 Where ExamWiseSubjectID=@ExamWiseSubjectID
		Set @NCount = @NCount - 1
	end

	Return @TotalMarks-@Allocated
end

-- Select dbo.fnGetAllocationRemainingByExamID('EXAM-00000001')

GO

-- drop proc spGetExamWiseSubjectAssignment
Create proc spGetExamWiseSubjectAssignment
@ExamID nvarchar(50)
as
begin
	Select 'javascript:openWindow("frmExamSubWiseQuestionAllocation.aspx?EWSID='+ Cast(EWS.ExamWiseSubjectID as nvarchar) + '","Popup",900,600);' as 'ExamWiseSubjectID' ,dbo.fnGetSubjectName(EWS.SubjectID) + ' ( ' +
	(Select convert(nvarchar,isnull(Count(*),0)) from tblExamPaper Where ExamWiseSubjectID=EWS.ExamWiseSubjectID And IsActive=1) + ' * ' +
	Cast(EWS.PositiveMarkingPerQuestion as nvarchar) + ' = ' + cast( convert(numeric(18,2), EWS.PositiveMarkingPerQuestion*(Select convert(nvarchar,isnull(Count(*),0)) from tblExamPaper Where ExamWiseSubjectID=EWS.ExamWiseSubjectID And IsActive=1)) as nvarchar)
	 + ' )' as 'SubjectName'
	from tblExamWiseSubject EWS Where ExamID=@ExamID
end

-- exec spGetExamWiseSubjectAssignment 'EXAM-00000001'

GO

-- drop proc spGetExamSubWiseAllocatedQuestions
Create proc spGetExamSubWiseAllocatedQuestions
@ExamWiseSubjectID nvarchar(50)
as
begin
	Select Q.QuestionID,Q.Question,Q.QuestionOrder,Q.DifficultyLevel from tblQuestions Q
	Inner Join tblExamPaper E ON Q.QuestionID=E.QuestionID
	Where E.ExamWiseSubjectID = @ExamWiseSubjectID And E.IsActive=1
end

-- exec spGetExamSubWiseAllocatedQuestions 'EXAM-W-SUB-00000001'

-- Select * from tblExamPaper


GO

Create proc spInactiveExamWiseQuestion
@ExamWiseSubjectID nvarchar(50),
@QuestionID nvarchar(50)
as
begin
	
	UPDATE tblExamPaper Set IsActive=0 Where ExamWiseSubjectID=@ExamWiseSubjectID 
	And QuestionID=@QuestionID
	
end


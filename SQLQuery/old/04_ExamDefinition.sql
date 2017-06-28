

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentExamID',0)

GO
-- drop table tblExamDefinition
Create table tblExamDefinition(
ExamID nvarchar(50) Primary key,
ExamName nvarchar(200) unique(ExamName),
ExamCode nvarchar(50) unique(ExamCode),
PositiveMarkingPerQuestion numeric(4,2),
NegativeMarkingPerQuestion numeric(4,2),
SkipMarkingPerQuestion numeric(4,2),
NotAnsweredMarkingPerQuestion numeric(4,2),
TotalQuestion int,
TotalMarks numeric(18,2),
TotalTime int,
GradingSystem nvarchar(50),
IsActive bit default 1,
IsFinalized bit default 0,
IsApproved bit default 0,
ApprovedBy nvarchar(50),
ApprovalDate datetime,
ExamInstructions nvarchar(2000),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

-- drop proc spSubmitExamPaper
Create proc spFinalizeExam
@ExamID nvarchar(50)
as
begin
	Update tblExamDefinition Set IsFinalized=1 Where ExamID=@ExamID And IsFinalized=0
end


GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentExamWiseSubjectID',0)

GO

-- drop table tblExamWiseSubject
Create table tblExamWiseSubject(
ExamWiseSubjectID nvarchar(50) primary key,
ExamID nvarchar(50) foreign key references tblExamDefinition(ExamID),
SubjectID nvarchar(50) foreign key references tblSubjects(SubjectID),
PositiveMarkingPerQuestion numeric(4,2),
NegativeMarkingPerQuestion numeric(4,2),
SkipMarkingPerQuestion numeric(4,2),
NotAnsweredMarkingPerQuestion numeric(4,2),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

-- drop proc spInsertExamWiseSubject
Create proc spInsertExamWiseSubject
@ExamID nvarchar(50),
@SubjectID nvarchar(50),
@PositiveMarkingPerQuestion numeric(4,2),
@NegativeMarkingPerQuestion numeric(4,2),
@SkipMarkingPerQuestion numeric(4,2),
@NotAnsweredMarkingPerQuestion numeric(4,2),
@EntryBy nvarchar(50)
as
begin
	Declare @ExamWiseSubjectID as nvarchar(50)
	Declare @CurrentExamWiseSubjectID numeric(18,0)
	Declare @ExamWiseSubjectIDPrefix as nvarchar(11)

	set @ExamWiseSubjectIDPrefix='EXAM-W-SUB-'

begin tran
	
	select @CurrentExamWiseSubjectID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentExamWiseSubjectID'
	
	set @CurrentExamWiseSubjectID=isnull(@CurrentExamWiseSubjectID,0)+1
	Select @ExamWiseSubjectID=dbo.generateID(@ExamWiseSubjectIDPrefix,@CurrentExamWiseSubjectID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblExamWiseSubject(ExamWiseSubjectID,ExamID,SubjectID,PositiveMarkingPerQuestion,NegativeMarkingPerQuestion,
	SkipMarkingPerQuestion,NotAnsweredMarkingPerQuestion,EntryBy)
	Values(@ExamWiseSubjectID,@ExamID,@SubjectID,@PositiveMarkingPerQuestion,@NegativeMarkingPerQuestion,
	@SkipMarkingPerQuestion,@NotAnsweredMarkingPerQuestion,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	update tblAppSettings set PropertyValue=@CurrentExamWiseSubjectID where PropertyName='CurrentExamWiseSubjectID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end


insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentExamWiseGradingSystemID',0)


GO

-- drop table tblExamWiseGradingSystem
Create table tblExamWiseGradingSystem(
ExamGradingSystemID nvarchar(50) Primary Key,
ExamID nvarchar(50) foreign key references tblExamDefinition(ExamID),
FromPercentage numeric(5,2),
ToPercentage numeric(5,2),
LetterGrade nvarchar(10),
GradePoint numeric(3,2),
GradingExplanation nvarchar(500),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

-- drop proc spInsertExamWiseGradingSystem
Create proc spInsertExamWiseGradingSystem
@ExamID nvarchar(50),
@FromPercentage numeric(5,2),
@ToPercentage numeric(5,2),
@LetterGrade nvarchar(10),
@GradePoint numeric(3,2),
@GradingExplanation nvarchar(500),
@EntryBy nvarchar(50)
as
begin
	Declare @ExamGradingSystemID as nvarchar(50)
	Declare @CurrentExamGradingSystemID numeric(18,0)
	Declare @ExamGradingSystemIDPrefix as nvarchar(11)

	set @ExamGradingSystemIDPrefix='EXAM-W-GRAD-'

begin tran
	
	select @CurrentExamGradingSystemID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentExamWiseGradingSystemID'
	
	set @CurrentExamGradingSystemID=isnull(@CurrentExamGradingSystemID,0)+1
	Select @ExamGradingSystemID=dbo.generateID(@ExamGradingSystemIDPrefix,@CurrentExamGradingSystemID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblExamWiseGradingSystem(ExamGradingSystemID,ExamID,FromPercentage,ToPercentage,LetterGrade,GradePoint,GradingExplanation,EntryBy)
	Values(@ExamGradingSystemID,@ExamID,@FromPercentage,@ToPercentage,@LetterGrade,@GradePoint,@GradingExplanation,@EntryBy)
	
	update tblAppSettings set PropertyValue=@CurrentExamGradingSystemID where PropertyName='CurrentExamWiseGradingSystemID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

-- drop proc spInsertExamDefinition
Create proc spInsertExamDefinition
@ExamName nvarchar(200),
@ExamCode nvarchar(50),
@PositiveMarkingPerQuestion numeric(4,2),
@NegativeMarkingPerQuestion numeric(4,2),
@SkipMarkingPerQuestion numeric(4,2),
@NotAnsweredMarkingPerQuestion numeric(4,2),
@TotalQuestion int,
@TotalMarks numeric(18,2),
@TotalTime int,
@GradingSystem nvarchar(50),
@GradingSystemData as nvarchar(4000),
@ExamWiseSubjectData as nvarchar(4000),
@ExamInstructions nvarchar(2000),
@EntryBy nvarchar(50)
as
begin
	
	Declare @Index as int
	Declare @CurrentData as nvarchar(4000)
	Declare @RestData as nvarchar(4000)
	Declare @RestPortion as nvarchar(4000)	

	Declare @ExamID as nvarchar(50)
	Declare @CurrentExamID as numeric(18,0)
	Declare @ExamIDPrefix as nvarchar(5)

	set @ExamIDPrefix='EXAM-'

	Declare @FromPercentage as numeric(5,2)
	Declare @ToPercentage as numeric(5,2)
	Declare @LetterGrade as nvarchar(10)
	Declare @GradePoint as numeric(3,2)
	Declare @GradingExplanation nvarchar(500)

	Declare @SubjectID as nvarchar(50)
	Declare @SubWisePositiveMarkingPerQuestion as numeric(4,2)
	Declare @SubWiseNegativeMarkingPerQuestion as numeric(4,2)
	Declare @SubWiseSkipMarkingPerQuestion as numeric(4,2)
	Declare @SubWiseNotAnsweredMarkingPerQuestion as numeric(4,2)

begin tran
	
	select @CurrentExamID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentExamID'
	
	set @CurrentExamID=isnull(@CurrentExamID,0)+1
	Select @ExamID=dbo.generateID(@ExamIDPrefix,@CurrentExamID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert Into tblExamDefinition(ExamID,ExamName,ExamCode,PositiveMarkingPerQuestion,NegativeMarkingPerQuestion,SkipMarkingPerQuestion,
	NotAnsweredMarkingPerQuestion,TotalQuestion,TotalMarks,TotalTime,GradingSystem,ExamInstructions,EntryBy)
	Values(@ExamID,@ExamName,@ExamCode,@PositiveMarkingPerQuestion,@NegativeMarkingPerQuestion,@SkipMarkingPerQuestion,
	@NotAnsweredMarkingPerQuestion,@TotalQuestion,@TotalMarks,@TotalTime,'Customized',@ExamInstructions,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	-- Insert Exam Wise Grading Data
	
	set @RestData=@GradingSystemData
	while @RestData<>''
	begin
		set @Index=CHARINDEX('|',@RestData)
		set @CurrentData=substring(@RestData,1,@Index-1)
		set @RestData=substring(@RestData,@Index+1,len(@RestData))		
		
		set @RestPortion=@CurrentData
		
		set @Index=CHARINDEX('~',@RestPortion)		
		set @FromPercentage=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	
		
		set @Index=CHARINDEX('~',@RestPortion)		
		set @ToPercentage=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))
	
		set @Index=CHARINDEX('~',@RestPortion)		
		set @LetterGrade=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	

		set @Index=CHARINDEX('~',@RestPortion)		
		set @GradePoint=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	

		set @Index=CHARINDEX('~',@RestPortion)		
		set @GradingExplanation=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	
	
		Exec spInsertExamWiseGradingSystem @ExamID,@FromPercentage,@ToPercentage,@LetterGrade,@GradePoint,@GradingExplanation,@EntryBy
		IF (@@ERROR <> 0) GOTO ERR_HANDLER	
		
		Set @FromPercentage = 0
		Set @ToPercentage = 0
		Set @LetterGrade = ''
		Set @GradePoint = 0
				
	end

	Set @Index = 0
	Set @CurrentData = ''
	Set @RestData = ''
	Set @RestPortion = ''

	-- Insert Exam Wise Subject Info
	set @RestData=@ExamWiseSubjectData
	while @RestData<>''
	begin
		set @Index=CHARINDEX('|',@RestData)
		set @CurrentData=substring(@RestData,1,@Index-1)
		set @RestData=substring(@RestData,@Index+1,len(@RestData))		
		
		set @RestPortion=@CurrentData
		
		set @Index=CHARINDEX('~',@RestPortion)		
		set @SubjectID=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	
		
		set @Index=CHARINDEX('~',@RestPortion)		
		set @SubWisePositiveMarkingPerQuestion=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))
	
		set @Index=CHARINDEX('~',@RestPortion)		
		set @SubWiseNegativeMarkingPerQuestion=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	

		set @Index=CHARINDEX('~',@RestPortion)		
		set @SubWiseSkipMarkingPerQuestion=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	

		set @Index=CHARINDEX('~',@RestPortion)		
		set @SubWiseNotAnsweredMarkingPerQuestion=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	
	
		Exec spInsertExamWiseSubject @ExamID,@SubjectID,@SubWisePositiveMarkingPerQuestion,@SubWiseNegativeMarkingPerQuestion,@SubWiseSkipMarkingPerQuestion,@SubWiseNotAnsweredMarkingPerQuestion,@EntryBy
		IF (@@ERROR <> 0) GOTO ERR_HANDLER	
		
		Set @SubjectID = ''
		Set @SubWisePositiveMarkingPerQuestion = 0
		Set @SubWiseNegativeMarkingPerQuestion = 0
		Set @SubWiseSkipMarkingPerQuestion = 0
		Set @SubWiseNotAnsweredMarkingPerQuestion = 0
				
	end
	
	update tblAppSettings set PropertyValue=@CurrentExamID where PropertyName='CurrentExamID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end


-- Select * from tblExamDefinition

GO

Create proc spGetAvailableExams
as
begin
	Select Distinct ExamName,ExamID from tblExamDefinition Where IsActive=1
end

-- exec spGetAvailableExams

GO

Create function fnGetExamName(@ExamID nvarchar(50))
returns nvarchar(200)
as
begin
	Declare @ExamName as nvarchar(200)
	Select @ExamName=ExamName from tblExamDefinition Where ExamID=@ExamID

	Return @ExamName
end

-- Select dbo.fnGetExamName('EXAM-00000001')
Go

Create function fnGetSubjectName(@SubjectID nvarchar(50))
returns nvarchar(200)
as
begin
	Declare @SubjectName nvarchar(200)
	Select @SubjectName=SubjectName from tblSubjects Where SubjectID=@SubjectID

	return @SubjectName
end

-- Select dbo.fnGetSubjectName('SUB-00000006')

Go


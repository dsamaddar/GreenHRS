

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentQuestionID',0)

GO

-- drop table tblQuestions
Create table tblQuestions(
QuestionID nvarchar(50) Primary key,
SubjectID nvarchar(50) foreign key references tblSubjects(SubjectID),
Question nvarchar(500),
Images nvarchar(100),
Answer_A nvarchar(100),
Answer_A_Image nvarchar(100),
OptA_Partial int,
Answer_B nvarchar(100),
Answer_B_Image nvarchar(100),
OptB_Partial int,
Answer_C nvarchar(100),
Answer_C_Image nvarchar(100),
OptC_Partial int,
Answer_D nvarchar(100),
Answer_D_Image nvarchar(100),
OptD_Partial int,
Answer_E nvarchar(100),
Answer_E_Image nvarchar(100),
OptE_Partial int,
CorrectAnswre nvarchar(100),
CorrectAnswre_Image nvarchar(100),
AnswerExplanation nvarchar(500),
QuestionOrder int,
DifficultyLevel int,
HasPartialMarking bit,
IsActive bit default 0,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

-- drop proc spInsertQuestions
Create proc spInsertQuestions
@SubjectID nvarchar(50),
@Question nvarchar(500),
@Images nvarchar(100),
@Answer_A nvarchar(100),
@Answer_A_Image nvarchar(100),
@OptA_Partial int,
@Answer_B nvarchar(100),
@Answer_B_Image nvarchar(100),
@OptB_Partial int,
@Answer_C nvarchar(100),
@Answer_C_Image nvarchar(100),
@OptC_Partial int,
@Answer_D nvarchar(100),
@Answer_D_Image nvarchar(100),
@OptD_Partial int,
@Answer_E nvarchar(100),
@Answer_E_Image nvarchar(100),
@OptE_Partial int,
@CorrectAnswre nvarchar(100),
@CorrectAnswre_Image nvarchar(100),
@AnswerExplanation nvarchar(500),
@DifficultyLevel int,
@HasPartialMarking bit,
@EntryBy nvarchar(50)
as
begin
	
	Declare @QuestionOrder as int
	Declare @QuestionID as nvarchar(50)
	Declare @CurrentQuestionID numeric(18,0)
	Declare @QuestionIDPrefix as nvarchar(5)

	set @QuestionIDPrefix='QUES-'
	Set @QuestionOrder = 0

begin tran
	
	select @CurrentQuestionID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentQuestionID'
	
	set @CurrentQuestionID=isnull(@CurrentQuestionID,0)+1
	Select @QuestionID=dbo.generateID(@QuestionIDPrefix,@CurrentQuestionID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Select @QuestionOrder=Count(*) from tblQuestions Where SubjectID=@SubjectID
	Set @QuestionOrder = isnull(@QuestionOrder,0) + 1

	Insert into  tblQuestions(QuestionID,SubjectID,Question,Images,Answer_A,Answer_A_Image,OptA_Partial,Answer_B,Answer_B_Image,OptB_Partial,Answer_C,Answer_C_Image,OptC_Partial,Answer_D,
	Answer_D_Image,OptD_Partial,Answer_E,Answer_E_Image,OptE_Partial,CorrectAnswre,CorrectAnswre_Image,AnswerExplanation,QuestionOrder,DifficultyLevel,HasPartialMarking,EntryBy )
	Values(@QuestionID,@SubjectID,@Question,@Images,@Answer_A,@Answer_A_Image,@OptA_Partial,@Answer_B,@Answer_B_Image,@OptB_Partial,@Answer_C,@Answer_C_Image,@OptC_Partial,@Answer_D,
	@Answer_D_Image,@OptD_Partial,@Answer_E,@Answer_E_Image,@OptE_Partial,@CorrectAnswre,@CorrectAnswre_Image,@AnswerExplanation,@QuestionOrder,@DifficultyLevel,@HasPartialMarking,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	update tblAppSettings set PropertyValue=@CurrentQuestionID where PropertyName='CurrentQuestionID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

-- Select * from tblQuestions

Go

Create proc spGetQuestionInfoByQuestionID
@QuestionID nvarchar(50)
as
begin
	Select SubjectID,Question,Images,Answer_A,Answer_A_Image,Answer_B,Answer_B_Image,Answer_C,Answer_C_Image,Answer_D,
	Answer_D_Image,Answer_E,Answer_E_Image,CorrectAnswre,CorrectAnswre_Image,
	AnswerExplanation,QuestionOrder,DifficultyLevel,EntryBy,EntryDate 
	From tblQuestions Where QuestionID=@QuestionID
end

-- exec spGetQuestionInfoByQuestionID 'QUES-00000001'

GO

-- drop proc spGetAllQuestionsBySubID
Create proc spGetAllQuestionsBySubID
@SubjectID nvarchar(50)
as
begin
	Select QuestionID,Question,DifficultyLevel,Convert(nvarchar,EntryDate,106) as 'EntryDate'
	from tblQuestions Where SubjectID=@SubjectID
	Order by QuestionOrder
end

-- exec spGetAllQuestionsBySubID 'SUB-00000008'


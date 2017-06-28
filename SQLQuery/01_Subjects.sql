

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentSubjectID',0)


GO

-- drop table tblSubjects
Create table tblSubjects(
SubjectID nvarchar(50) Primary key,
SubjectName nvarchar(200) unique(SubjectName),
SubjectCode nvarchar(20) unique(SubjectCode),
IsActive bit default 1,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

-- Select * from tblSubjects

GO

-- drop proc spInsertSubjects
Create proc spInsertSubjects
@SubjectName nvarchar(200),
@SubjectCode nvarchar(20),
@EntryBy nvarchar(50)
as
begin
	Declare @SubjectID as nvarchar(50)
	Declare @CurrentSubjectID numeric(18,0)
	Declare @SubjectIDPrefix as nvarchar(4)

	set @SubjectIDPrefix='SUB-'

begin tran
	
	select @CurrentSubjectID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentSubjectID'
	
	set @CurrentSubjectID=isnull(@CurrentSubjectID,0)+1
	Select @SubjectID=dbo.generateID(@SubjectIDPrefix,@CurrentSubjectID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblSubjects(SubjectID,SubjectName,SubjectCode,EntryBy)
	Values(@SubjectID,@SubjectName,@SubjectCode,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	update tblAppSettings set PropertyValue=@CurrentSubjectID where PropertyName='CurrentSubjectID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO
exec spInsertSubjects 'Bangladesh & BD Economy','A-101','dsamaddar'

GO

exec spInsertSubjects 'Economics, Accounting & Finance','A-102','dsamaddar'

GO

exec spInsertSubjects 'Intelligence Quotient','A-103','dsamaddar'

GO

exec spInsertSubjects 'General Knowledge - International','A-104','dsamaddar'

GO

exec spInsertSubjects 'Computer','A-105','dsamaddar'

GO

Create proc spShowSubjects
as
begin
	Select Distinct SubjectID,SubjectName from tblSubjects Where IsActive=1
	Order by SubjectName
end

-- exec spShowSubjects

Go

-- drop proc spGetSubwiseQuestionOrder
Create proc spGetSubwiseQuestionOrder
@SubjectID nvarchar(50)
as
begin
	Declare @QuestionOrder as integer
	Set @QuestionOrder = 0

	Select @QuestionOrder=Count(*) from tblQuestions Where SubjectID=@SubjectID
	Set @QuestionOrder = isnull(@QuestionOrder,0) + 1

	Select @QuestionOrder as 'QuestionOrder'
end

--  exec spGetSubwiseQuestionOrder 'SUB-00000006'
GO
insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentIntAssessmentID',0)
GO

-- drop table tblIntAssessment
Create table tblIntAssessment(
IntAssessmentID nvarchar(50) primary key,
IntCandidateID nvarchar(50) foreign key references tblInterviewCandidates(IntCandidateID),
IntGradeID nvarchar(50) foreign key references tblIntGrade(IntGradeID),
DesignationID nvarchar(50) foreign key references tblDesignation(DesignationID),
DepartmentID nvarchar(50) foreign key references tblDepartment(DepartmentID),
ULCBranchID nvarchar(50) foreign key references tblULCBranch(ULCBranchID),
Observations nvarchar(1000),
MarksObtained numeric(4,2),
MarksOutOf numeric(4,2),
IntTakerID nvarchar(50) foreign key references tblEmployeeInfo(EmployeeID),
IntTakenDate datetime default getdate()
);

/*
Select * from tblIntGrade
Select * from tblDesignation
Select * from tblDepartment
Select * from tblULCBranch
Select * from tblInterviewCandidates
Select * from tblMandatoryIntQuestions
Select * from tblIntAssessment
*/

GO

-- drop view vwIntAssessment

Create view vwIntAssessment
as
select IA.IntAssessmentID,IC.IntCandidateID,IC.CandidateID,IC.CircularID,IG.GradeName,IG.GradePoint,isnull(D.DesignationName,'N\A') as 'Designation',
isnull(DEPT.DeptName,'N\A') as 'Department',isnull(BR.ULCBranchName,'N\A') as 'Branch',
IA.Observations,IA.MarksObtained,IA.MarksOutOf,EMP.EmployeeName,Convert(nvarchar,IA.IntTakenDate,106) as 'IntTakenDate'
from tblIntAssessment IA Inner Join tblInterviewCandidates IC On IA.IntCandidateID=IC.IntCandidateID 
Inner Join tblIntGrade IG On IA.IntGradeID=IG.IntGradeID
Inner Join tblEmployeeInfo EMP On IA.IntTakerID=EMP.EmployeeID
Left Join tblDesignation D On IA.DesignationID=D.DesignationID
Left Join tblDepartment DEPT On IA.DepartmentID = DEPT.DepartmentID
Left Join tblULCBranch BR On IA.ULCBranchID=BR.ULCBranchID

-- Select * from vwIntAssessment

GO
-- drop proc spShowIntAssessmentByCanID
Create proc spShowIntAssessmentByCanID
@CandidateID nvarchar(50),
@CircularID nvarchar(50)
as
begin
	Select IntAssessmentID,IntCandidateID,CandidateID,CircularID,GradeName,GradePoint,
	Designation,Department,Branch,Observations,MarksObtained,MarksOutOf,EmployeeName,IntTakenDate from vwIntAssessment Where CandidateID=@CandidateID And CircularID=@CircularID
end

-- exec spShowIntAssessmentByCanID 'Can-00000002','CIR-00000001'

GO
insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentIntAskedManQuesID',0)
GO

Create table tblIntAskedManQuestions(
IntAskedManQuesID nvarchar(50) primary key,
IntManQuestionID nvarchar(50) foreign key references tblMandatoryIntQuestions(IntManQuestionID)
);

GO

-- drop proc spInsertIntAskManQuestion
Create proc spInsertIntAskManQuestion
@IntManQuestionID nvarchar(50)
as
begin
	Declare @IntAskedManQuesID nvarchar(50)
	Declare @CurrentIntAskedManQuesID numeric(18,0)
	Declare @IntAskedManQuesIDPrefix as nvarchar(13)

	set @IntAskedManQuesIDPrefix='INT-ASK-QUES-'

begin tran

	select @CurrentIntAskedManQuesID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentIntAskedManQuesID'
	
	set @CurrentIntAskedManQuesID=isnull(@CurrentIntAskedManQuesID,0)+1
	Select @IntAskedManQuesID=dbo.generateID(@IntAskedManQuesIDPrefix,@CurrentIntAskedManQuesID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblIntAskedManQuestions(IntAskedManQuesID,IntManQuestionID)
	Values(@IntAskedManQuesID,@IntManQuestionID)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	update tblAppSettings set PropertyValue=@CurrentIntAskedManQuesID where PropertyName='CurrentIntAskedManQuesID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

-- drop proc spInsertIntAssessment
Create proc spInsertIntAssessment
@IntCandidateID nvarchar(50),
@IntGradeID nvarchar(50),
@DesignationID nvarchar(50),
@DepartmentID nvarchar(50),
@ULCBranchID nvarchar(50),
@Observations nvarchar(1000),
@MarksObtained numeric(4,2),
@MarksOutOf numeric(4,2),
@IntTakerID nvarchar(50),
@IntManQuestionIDList nvarchar(4000)
as
begin
	Declare @IntAssessmentID nvarchar(50)
	Declare @CurrentIntAssessmentID numeric(18,0)
	Declare @IntAssessmentIDPrefix as nvarchar(9)

	Declare @DesignationIDParam as nvarchar(50)
	Declare @DepartmentIDParam as nvarchar(50)
	Declare @ULCBranchIDParam as nvarchar(50)
	
	if @DesignationID='N\A'
		set @DesignationIDParam = null
	else
		set @DesignationIDParam = @DesignationID

	if @DepartmentID='N\A'
		set @DepartmentIDParam = null
	else
		set @DepartmentIDParam = @DepartmentID

	if @ULCBranchID='N\A'
		set @ULCBranchIDParam = null
	else
		set @ULCBranchIDParam = @ULCBranchID

	Declare @IntManQuesIDtbl table(
	IntManQuestionID nvarchar(50),
	Taken bit default 0
	);
	Declare @IntManQuestionID as nvarchar(50)

	set @IntAssessmentIDPrefix='INT-ASMT-'

begin tran
	
	select @CurrentIntAssessmentID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentIntAssessmentID'
	
	set @CurrentIntAssessmentID=isnull(@CurrentIntAssessmentID,0)+1
	Select @IntAssessmentID=dbo.generateID(@IntAssessmentIDPrefix,@CurrentIntAssessmentID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblIntAssessment(IntAssessmentID,IntCandidateID,IntGradeID,DesignationID,DepartmentID,ULCBranchID,Observations,MarksObtained,MarksOutOf,IntTakerID)
	Values(@IntAssessmentID,@IntCandidateID,@IntGradeID,@DesignationIDParam,@DepartmentIDParam,@ULCBranchIDParam,@Observations,@MarksObtained,@MarksOutOf,@IntTakerID )
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	-- Update Interview Candidates Info
	Update tblInterviewCandidates Set InterviewTaken=1,InterviewTakenDate=getdate() Where IntCandidateID=@IntCandidateID
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	-- Inserting Asked Question Int The Interview.
	
	if @IntManQuestionIDList <> ''
	begin
		Insert Into @IntManQuesIDtbl(IntManQuestionID)
		SELECT Value 
	   	FROM dbo.Split( ',', @IntManQuestionIDList ) AS s
	   	ORDER BY s.[Value]
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
		Declare @NCount as int
		Set @NCount=0
		
		Select @NCount=count(*) from @IntManQuesIDtbl Where Taken=0
	
		While @NCount > 0
		begin
			Select @IntManQuestionID=IntManQuestionID from @IntManQuesIDtbl Where Taken=0
			
			Exec spInsertIntAskManQuestion @IntManQuestionID
			IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
			Update @IntManQuesIDtbl Set Taken=1 Where IntManQuestionID=@IntManQuestionID
			IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
			Set @NCount = @NCount - 1
		end
	end
	
	update tblAppSettings set PropertyValue=@CurrentIntAssessmentID where PropertyName='CurrentIntAssessmentID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

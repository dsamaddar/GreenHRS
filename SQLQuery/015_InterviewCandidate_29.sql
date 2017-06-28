
GO
insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentIntCandidateID',0)
GO
-- drop table tblInterviewCandidates
Create table tblInterviewCandidates(
IntCandidateID nvarchar(50) primary key,
CandidateID nvarchar(50) foreign key references tblCandidateBasicInfo(CandidateID),
CircularID nvarchar(50) foreign key references tblJobCircular(CircularID),
IntTeamID nvarchar(50) foreign key references tblInterViewTeam(IntTeamID),
InterviewDate datetime,
InterviewTaken bit default 0,
InterviewTakenDate datetime,
EntryBy nvarchar(50),
EntryDate datetime
);

GO

-- drop proc spAssignCandidateToIntPanel
Create proc spAssignCandidateToIntPanel
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

		Set @NCount = @NCount -1
		Set @IntTakerID = ''
	end

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

-- drop proc spInsertInterviewCandidateInsert
Create proc spInsertInterviewCandidateInsert
@CandidateID nvarchar(50),
@CircularID nvarchar(50),
@IntTeamID nvarchar(50),
@InterviewDate datetime,
@EntryBy nvarchar(50)
as
begin
	Declare @IntCandidateID nvarchar(50)
	Declare @CurrentIntCandidateID numeric(18,0)
	Declare @IntCandidateIDPrefix as nvarchar(8)

	set @IntCandidateIDPrefix='INT-CAN-'

begin tran
	
	select @CurrentIntCandidateID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentIntCandidateID'
	
	set @CurrentIntCandidateID=isnull(@CurrentIntCandidateID,0)+1
	Select @IntCandidateID=dbo.generateID(@IntCandidateIDPrefix,@CurrentIntCandidateID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert Into tblInterviewCandidates(IntCandidateID,CandidateID,CircularID,IntTeamID,InterviewDate,EntryBy)
	Values(@IntCandidateID,@CandidateID,@CircularID,@IntTeamID,@InterviewDate,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentIntCandidateID where PropertyName='CurrentIntCandidateID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

Create proc spChqAlrdyAsndAndIntNotTaken
@CandidateID nvarchar(50),
@CircularID nvarchar(50),
@IntTeamID nvarchar(50)
as
begin
	If Exists (
		Select * from tblInterviewCandidates Where CandidateID=@CandidateID And 
		CircularID = @CircularID And IntTeamID = @IntTeamID
	)
		Select 1 as 'IntExists'
	Else
		Select 0 as 'IntExists'
end

-- exec spChqAlrdyAsndAndIntNotTaken 'Can-00000002','CIR-00000001','INT-TEAM-00000002'

GO
/*
Select * from tblInterviewCandidates
Select * from tblInterViewTeam
select * from vwAppliedCandidates
*/

GO

Create view vwAvailableInterview
as
Select IC.IntCandidateID,IC.CandidateID,IT.IntTeamID,IT.IntTeamName,vAC.CandidateName,vAC.PreDistrictName,vAC.PerDistrictName,vAC.HighestDegree,
vAC.Major,vAC.InstitutionName,vAC.JobTitle,vAC.Age,vAC.Gender from tblInterviewCandidates IC Inner Join vwAppliedCandidates vAC ON IC.CandidateID=vAC.CandidateID And IC.CircularID=vAC.CircularID
Inner Join tblInterViewTeam IT On IC.IntTeamID=IT.IntTeamID 
Where IC.InterviewTaken=0

-- Select * from vwAvailableInterview

GO

-- drop proc spGetIntCandidatesByIntTaker
Create proc spGetIntCandidatesByIntTaker
@EmployeeID nvarchar(50)
as
begin
	Select IntCandidateID,CandidateID,IntTeamID,IntTeamName,CandidateName,PreDistrictName,
	PerDistrictName,HighestDegree,Major,InstitutionName,JobTitle,Age,Gender 
	from vwAvailableInterview Where IntTeamID in (
	Select Distinct IntTeamID from tblInterViewPanel Where IntPanelMemberID=@EmployeeID
	)
	And IntCandidateID Not in (
	Select Distinct IntCandidateID from tblIntAssessment
	)
end

-- exec spGetIntCandidatesByIntTaker 'EMP-00000001'


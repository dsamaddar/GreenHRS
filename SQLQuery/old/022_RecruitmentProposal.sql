

/*
Select * from tblDepartment
Select * from tblULCBranch
Select * from tblDesignation
*/

GO
insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentProposalID',0)
GO

-- drop table tblRecruitmentProposal
Create table tblRecruitmentProposal(
ProposalID nvarchar(50) primary key,
IntCandidateID nvarchar(50) foreign key references tblInterviewCandidates(IntCandidateID),
CandidateID nvarchar(50) foreign key references tblCandidateBasicInfo(CandidateID),
CircularID nvarchar(50) foreign key references tblJobCircular(CircularID),
DepartmentID nvarchar(50) foreign key references tblDepartment(DepartmentID),
ULCBranchID nvarchar(50) foreign key references tblULCBranch(ULCBranchID),
DesignationID nvarchar(50) foreign key references tblDesignation(DesignationID),
EmployeeTypeID nvarchar(50) foreign key references tblEmployeeType(EmployeeTypeID),
Salary numeric(18,2),
ExpectedJoiningDate datetime,
EffectiveFrom datetime,
IsJoined bit default 0,
JoiningDate datetime,
IsApproved bit default 0,
ApprovedBy nvarchar(50),
ApprovalDate datetime,
Remarks nvarchar(1000),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

Create function fnGetThanaNameByID(@UpazilaID int)
returns nvarchar(100)
begin
	Declare @UpazilaName as nvarchar(100)
	Select @UpazilaName = UpazilaName from tblUpazila Where UpazilaID=@UpazilaID

	return @UpazilaName
end

-- Select dbo.fnGetThanaNameByID(2000)

GO
-- drop proc spInsertRecruitmentProposal
Create proc spInsertRecruitmentProposal
@IntCandidateID nvarchar(50),
@CandidateID nvarchar(50),
@CircularID nvarchar(50),
@DepartmentID nvarchar(50),
@ULCBranchID nvarchar(50),
@DesignationID nvarchar(50),
@EmployeeTypeID nvarchar(50),
@Salary numeric(18,2),
@ExpectedJoiningDate datetime,
@EffectiveFrom datetime,
@Remarks nvarchar(1000),
@EntryBy nvarchar(50)
as
begin
	Declare @CandidateName as nvarchar(100)
	Declare @DesignationName as nvarchar(200)
	Declare @District as nvarchar(100)
	Declare @Thana as nvarchar(100)
	Declare @Address as nvarchar(500)

	Declare @ProposalID as nvarchar(50)
	Declare @CurrentProposalID numeric(18,0)
	Declare @ProposalIDPrefix as nvarchar(8)

	set @ProposalIDPrefix='RECRUIT-'

begin tran
	
	select @CurrentProposalID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentProposalID'
	
	set @CurrentProposalID=isnull(@CurrentProposalID,0)+1
	Select @ProposalID=dbo.generateID(@ProposalIDPrefix,@CurrentProposalID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblRecruitmentProposal(ProposalID,IntCandidateID,CandidateID,CircularID,DepartmentID,ULCBranchID,DesignationID,
	Salary,ExpectedJoiningDate,Remarks,EntryBy)
	Values(@ProposalID,@IntCandidateID,@CandidateID,@CircularID,@DepartmentID,@ULCBranchID,@DesignationID,
	@Salary,@ExpectedJoiningDate,@Remarks,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentProposalID where PropertyName='CurrentProposalID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Update tblAppliedJob Set CurrentStatus='Recruited' Where CandidateID=@CandidateID And CircularID=@CircularID
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Select @CandidateName=CandidateName,@DesignationName=dbo.fnGetDistrictNameByID(PreDistrict),
	@Thana=dbo.fnGetThanaNameByID(PerThana),@Address=PresentAddress from tblCandidateBasicInfo Where CandidateID = @CandidateID
	Select @DesignationName = DesignationName from tblDesignation Where DesignationID=@DesignationID

	Select @CandidateName as 'CandidateName',@DesignationName as 'Designation'
	,CAST(DAY(@ExpectedJoiningDate) AS VARCHAR(2)) + ' ' + DATENAME(MM, @ExpectedJoiningDate) + ' ' + CAST(YEAR(@ExpectedJoiningDate) AS VARCHAR(4)) AS 'ExpedtedJoiningDate',
	@District as 'District',@Thana as 'Thana',@Address as 'Address',
	CAST(DAY(@EffectiveFrom) AS VARCHAR(2)) + ' ' + DATENAME(MM, @EffectiveFrom) + ' ' + CAST(YEAR(@EffectiveFrom) AS VARCHAR(4)) as 'EffectiveFrom'

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

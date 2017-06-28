ALTER proc [dbo].[spGetAvailableExamsByUserID]
@UserID nvarchar(50)
as
begin
	Declare @RegistrationID as nvarchar(50)

	Select @RegistrationID=UniqueUserID from vwAllUsers Where UserID=@UserID

	Select ExamID,ExamName from tblExamDefinition Where ExamID in
	(
	Select Distinct ExamID from vwExamPaperWiseQuestion Where IsActive=1 And ExamTaken=0 And FinalizedExam=0
	And ExamTakerID=@RegistrationID
	)
end

GO

ALTER proc [dbo].[spGetAttendeesByEntryPoint]
@EntryPoint nvarchar(50)
as
begin
	Select Distinct Q.ExamTakerID,U.UserName,Q.ExamRollNo,(Case Q.ExamTaken When 1 Then 'Yes' When 0 Then 'No' Else 'Unknown' end) as 'ExamTaken',
	Q.PreparedBy from tblQuestionPaper Q Inner Join vwAllUsers U 
	On Q.ExamTakerID=U.UniqueUserID Where EntryPoint=@EntryPoint
end

GO

ALTER proc [dbo].[spVerifyRollNo]
@UserID nvarchar(50),
@ExamID nvarchar(50),
@ExamRollNo nvarchar(50)
as
begin

	Declare @RegistrationID as nvarchar(50)

	Select @RegistrationID=UniqueUserID from vwAllUsers Where UserID=@UserID

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


GO

ALTER procedure [dbo].[spGetCandidateDetailsViewForRecuitment]
@CandidateID nvarchar(50)
as
--exec spGetCandidateDetailsViewForRecuitment 'Can-00000005'
SELECT [tblCandidateBasicInfo].[CandidateName] 
      ,[FathersName]
      ,[MothersName]
      ,[SpouseName]
      ,[Gender]
      ,[NIDNo]
      ,PassportNo 
      ,[Nationality]
      ,[Religion]
      ,[PresentAddress]
      --,[PreDistrict]
      ,(select DistrictName from dbo.tblDistrict where DistrictID=PreDistrict) [PreDistrict]
      ,(select UpazilaName from dbo.tblUpazila where UpazilaID=PreThana) [PreThana]
      ,[PermanentAddress]
      ,(select DistrictName from dbo.tblDistrict where DistrictID=PerDistrict) [PerDistrict]
      ,(select UpazilaName from dbo.tblUpazila where UpazilaID=PerThana) [PerThana]
      ,[HomePhoneNo]
      ,[PersonalPhoneNo]
      ,[OfficePhoneNo]
      ,[AlternateEmail]
      ,[CareerObjective]
      ,[YearOfExperience]
      ,ExpInMonth 
      ,dbo.getCommaseperatedval([PresentSalary]) as PresentSalary
      ,dbo.getCommaseperatedval([ExpectedSalary]) as ExpectedSalary
      ,(select JobType from dbo.tblJobType where JobTypeID=[LookingFor]) LookingFor
      ,(select ServiceType from dbo.tblServiceType where ServiceTypeID=AvailableFor) AvailableFor
      ,[ComputerLiteracy]
      ,[EnglishLanguageProficiency]
      ,isnull(tblPhotos.photos,'N\A') as 'photos'
     ,tblRegisterUser.Email 
      ,isnull(tblSignature.[Signature],'') as 'Signature'
       ,(select OccupationName from dbo.tblOccupation where OccupationID=FathersOccupation) FathersOccupation
      --,FathersOccupation
      ,(select OccupationName from dbo.tblOccupation where OccupationID=MothersOccupation) MothersOccupation
      ,(select OccupationName from dbo.tblOccupation where OccupationID=SpouseOccupation) SpouseOccupation
      --,MothersOccupation
      --,SpouseOccupation
      ,[NoOfChildrenAge] NoOfChildrenAge
      ,[SibblingsNameOccupation] SibblingsNameOccupation
      ,CONVERT(varchar, LastDrawnDate,106) LastDrawnDate
      ,Employeer
      ,(select DistrictName from dbo.tblDistrict where DistrictID=PreferredJobLocation) PreferredJobLocation
      ,(select RelName from dbo.tblRelationShipStatus where RelationshipID=RelationshipStatus) RelationshipStatus 
      ,(select BloodGroupName from dbo.tblBloodGroup where BloodGroupID=[tblCandidateBasicInfo].BloodGroupID ) BloodGroupName
      ,AboutYourself 
      ,SpecilizedIn 
  FROM [dbo].[tblCandidateBasicInfo] left join tblPhotos on tblPhotos.CandidateID=[tblCandidateBasicInfo].CandidateID
  left join dbo.tblRegisterUser on dbo.tblRegisterUser.RegistrationID=[tblCandidateBasicInfo].RegistrationID 
  left join tblSignature on tblSignature.CandidateID=tblCandidateBasicInfo.CandidateID
where [tblCandidateBasicInfo].[CandidateID]=@CandidateID 

GO

  Insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentAppliedJobID',0)

GO

ALTER proc [dbo].[spSearchApplicant]
@CircularID nvarchar(50),
@CandidateName nvarchar(200),
@InstitutionID nvarchar(50),
@PresentDistrictID int,
@PermanentDistrictID int,
@Gender nvarchar(50),
@AgeFrom int,
@AgeTo int
as
begin

	Declare @PreDistParam as nvarchar(10)
	Declare @PerDistParam as nvarchar(10)
	Declare @GenderParam as nvarchar(50)
	Declare @CandidateNameParam as nvarchar(200)
	Declare @InstitutionIDParam as nvarchar(50)

	if @PresentDistrictID=0
		set @PreDistParam = '%'
	else
		set @PreDistParam = convert(nvarchar,@PresentDistrictID)

	if @PermanentDistrictID=0
		set @PerDistParam ='%'
	else
		set @PerDistParam = convert(nvarchar,@PermanentDistrictID)

	if @Gender = '0'
		Set @GenderParam='%'
	else
		Set @GenderParam = @Gender+'%'

	if @CandidateName = ''
		Set @CandidateNameParam = '%'
	else
		Set @CandidateNameParam = '%'+@CandidateName+'%'
	
	if @InstitutionID='0'
		Set @InstitutionIDParam = '%'
	else
		Set @InstitutionIDParam = '%'+@InstitutionID+'%'


	Select * from vwAppliedCandidates Where CircularID=@CircularID And
	CandidateName like ''+@CandidateNameParam+'' And InstitutionID like ''+@InstitutionIDParam+'' And PreDistrict like ''+@PreDistParam+'' And 
	PerDistrict like ''+@PerDistParam+'' And Gender like ''+@GenderParam+'' And
	Age between @AgeFrom and @AgeTo And CurrentStatus='Applied'
		
end

-- exec spSearchApplicant 'CIR-00000001','','0',0,0,'0',20,60


GO

ALTER proc [dbo].[spFinallySelectedCandidates]
@IntGradeID nvarchar(50)
as
begin
	Declare @CircularID as nvarchar(50)
	Declare @CandidateID as nvarchar(50)
	
	Select @CandidateID=CandidateID,@CircularID=CircularID from tblInterviewCandidates
		Where IntCandidateID in (
		Select IntCandidateID from tblIntAssessment Where IntGradeID=@IntGradeID
		)
		And InterviewTaken=1
	
	Select distinct AC.AppliedJobID,IC.IntCandidateID,AC.CandidateID,AC.EntryDate,AC.CircularID,AC.ReviewedBy,AC.ReviewedDate,AC.RejectedBy,AC.RejectedDate,
	AC.CandidateName,AC.PerDistrictName,AC.PreDistrictName,AC.HighestDegree,AC.Major,AC.InstitutionName,AC.JobTitle,AC.Age,AC.Gender
	from vwAppliedCandidates AC Left Join tblInterviewCandidates IC On 
	AC.CandidateID = IC.CandidateID And AC.CircularID = IC.CircularID And IC.IntCandidateID 
	not in (Select Distinct IntCandidateID from tblRecruitmentProposal Where IntCandidateID is not null)
	Where AC.CandidateID=@CandidateID and AC.CircularID=@CircularID And IC.InterviewTaken=1
end


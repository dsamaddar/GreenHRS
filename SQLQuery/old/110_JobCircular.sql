insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentOrganizationID',0)
GO

-- drop table tblOrganizations
Create table tblOrganizations(
OrganizationID nvarchar(50) primary key,
OrgName nvarchar(50) Unique(OrgName),
OrgProfile nvarchar(500),
Country nvarchar(50),
Address nvarchar(500),
Telephone nvarchar(500),
Fax nvarchar(500),
Mobile nvarchar(500),
EntryBy nvarchar(50),
EntryDate datetime default getdate(),
);

GO

-- drop proc spInsertOrganizations
Create proc spInsertOrganizations
@OrgName nvarchar(50),
@OrgProfile nvarchar(500),
@Country nvarchar(50),
@Address nvarchar(500),
@Telephone nvarchar(500),
@Fax nvarchar(500),
@Mobile nvarchar(500),
@EntryBy nvarchar(50)
as
begin

	Declare @OrganizationID nvarchar(50)
	Declare @CurrentOrganizationID numeric(18,0)
	Declare @OrganizationIDPrefix as nvarchar(4)

	set @OrganizationIDPrefix='ORG-'

begin tran
	
	select @CurrentOrganizationID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentOrganizationID'
	
	set @CurrentOrganizationID=isnull(@CurrentOrganizationID,0)+1
	Select @OrganizationID=dbo.generateID(@OrganizationIDPrefix,@CurrentOrganizationID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblOrganizations(OrganizationID,OrgName,OrgProfile,Country,Address,Telephone,Fax,Mobile,EntryBy)
	Values(@OrganizationID,@OrgName,@OrgProfile,@Country,@Address,@Telephone,@Fax,@Mobile,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	update tblAppSettings set PropertyValue=@CurrentOrganizationID where PropertyName='CurrentOrganizationID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

exec spInsertOrganizations 'ULC','','','','','','',''

-- drop proc spUpdateOrgranizationInfo
Create proc spUpdateOrgranizationInfo
@OrganizationID nvarchar(50),
@OrgName nvarchar(50),
@OrgProfile nvarchar(500),
@Country nvarchar(50),
@Address nvarchar(500),
@Telephone nvarchar(500),
@Fax nvarchar(500),
@Mobile nvarchar(500)
as
begin
begin tran
	Update tblOrganizations Set OrgName=@OrgName,OrgProfile=@OrgProfile,Country=@Country,Address=@Address,
	Telephone=@Telephone,Fax=@Fax,Mobile=@Mobile Where OrganizationID = @OrganizationID
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

-- drop proc spShowOrgInfo
Create proc spShowOrgInfo
as
begin
	Select OrganizationID,OrgName,OrgProfile,Country,Address,Telephone,Fax,Mobile,EntryBy,EntryDate from tblOrganizations
end

GO

Create proc spShowOrgList
as
begin
	Select Distinct OrganizationID,OrgName from tblOrganizations
end

-- exec spShowOrgList

GO


insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentOrgBranchID',0)

GO

-- drop table tblOrgBranch
Create table tblOrgBranch(
BranchID nvarchar(50) primary key,
OrganizationID nvarchar(50) foreign key references tblOrganizations(OrganizationID),
BranchName nvarchar(200),
BranchAddress nvarchar(500),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

-- drop proc spInsertOrgBranch
Create proc spInsertOrgBranch
@OrganizationID nvarchar(50),
@BranchName nvarchar(200),
@BranchAddress nvarchar(500),
@EntryBy nvarchar(50)
as
begin

	Declare @BranchID nvarchar(50)
	Declare @CurrentBranchID numeric(18,0)
	Declare @BranchIDPrefix as nvarchar(9)

	set @BranchIDPrefix='ORG-BRID-'

begin tran
	
	select @CurrentBranchID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentOrgBranchID'
	
	set @CurrentBranchID=isnull(@CurrentBranchID,0)+1
	Select @BranchID=dbo.generateID(@BranchIDPrefix,@CurrentBranchID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblOrgBranch(BranchID,OrganizationID,BranchName,BranchAddress,EntryBy)
	Values(@BranchID,@OrganizationID,@BranchName,@BranchAddress,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	update tblAppSettings set PropertyValue=@CurrentBranchID where PropertyName='CurrentOrgBranchID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentJobCircularID',0)

GO
-- drop table tblJobCircular
Create table tblJobCircular(
CircularID nvarchar(50) primary key,
JobTitle nvarchar(500),
JobLocation nvarchar(50),
OrganizationID nvarchar(50) foreign key references tblOrganizations(OrganizationID),
DepartmentID nvarchar(50) foreign key references tblDepartment(DepartmentID),
JobDescription nvarchar(500),
JobResponsibility nvarchar(500),
SpecialSkillReq nvarchar(500),
AddiJobReq nvarchar(500),
EducationalReq nvarchar(500),
ExperienceReqInYrs int,
DutySchedule nvarchar(500),
SalaryAndBenefits nvarchar(500),
Vacancies int,
Competencies nvarchar(500),
CommunicationSkill nvarchar(500),
MinAgeLimit int,
MaxAgeLimit int,
ReportableTo nvarchar(200),
ApplyInstructions nvarchar(500),
CompanyAddress nvarchar(500),
TermsOfReferences nvarchar(500),
ClosingDate datetime,
IsActive bit default 1,
HeaderNote nvarchar(500),
FooterNote nvarchar(500),
MaxApplicant int,
HeaderImage nvarchar(200),
MiddleImage nvarchar(200),
FooterImage nvarchar(200),
Attachment nvarchar(200),
Status nvarchar(50),
Approved bit default 0,
ApprovedBy nvarchar(50),
ApprovalDate datetime,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO
-- drop proc spGetJobCircularList
Create proc spGetJobCircularList
as
begin
	Select distinct CircularID,JobTitle from tblJobCircular Where IsActive=1
end

GO
-- drop proc spInsertJobCircular
Create proc spInsertJobCircular
@JobTitle nvarchar(500),
@JobLocation nvarchar(50),
@OrganizationID nvarchar(50),
@DepartmentID nvarchar(50),
@JobDescription nvarchar(500),
@JobResponsibility nvarchar(500),
@SpecialSkillReq nvarchar(500),
@AddiJobReq nvarchar(500),
@EducationalReq nvarchar(500),
@ExperienceReqInYrs int,
@DutySchedule nvarchar(500),
@SalaryAndBenefits nvarchar(500),
@Vacancies int,
@Competencies nvarchar(500),
@CommunicationSkill nvarchar(500),
@MinAgeLimit int,
@MaxAgeLimit int,
@ReportableTo nvarchar(200),
@ApplyInstructions nvarchar(500),
@CompanyAddress nvarchar(500),
@TermsOfReferences nvarchar(500),
@ClosingDate datetime,
@HeaderNote nvarchar(500),
@FooterNote nvarchar(500),
@MaxApplicant int,
@HeaderImage nvarchar(200),
@MiddleImage nvarchar(200),
@FooterImage nvarchar(200),
@Attachment nvarchar(200),
@EntryBy nvarchar(50)
as
begin

	Declare @CircularID as nvarchar(50)
	Declare @CurrentCircularID numeric(18,0)
	Declare @CircularIDPrefix as nvarchar(4)

	set @CircularIDPrefix='CIR-'

begin tran
	
	select @CurrentCircularID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentJobCircularID'
	
	set @CurrentCircularID=isnull(@CurrentCircularID,0)+1
	Select @CircularID=dbo.generateID(@CircularIDPrefix,@CurrentCircularID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblJobCircular(CircularID,JobTitle,JobLocation,OrganizationID,DepartmentID,JobDescription,JobResponsibility,
	SpecialSkillReq,AddiJobReq,EducationalReq,ExperienceReqInYrs,DutySchedule,SalaryAndBenefits,Vacancies,Competencies,
	CommunicationSkill,MinAgeLimit,MaxAgeLimit,ReportableTo,ApplyInstructions,CompanyAddress,TermsOfReferences,ClosingDate,HeaderNote,
	FooterNote,MaxApplicant,HeaderImage,MiddleImage,FooterImage,Attachment,EntryBy)
	Values(@CircularID,@JobTitle,@JobLocation,@OrganizationID,@DepartmentID,@JobDescription,@JobResponsibility,
	@SpecialSkillReq,@AddiJobReq,@EducationalReq,@ExperienceReqInYrs,@DutySchedule,@SalaryAndBenefits,@Vacancies,@Competencies,
	@CommunicationSkill,@MinAgeLimit,@MaxAgeLimit,@ReportableTo,@ApplyInstructions,@CompanyAddress,@TermsOfReferences,@ClosingDate,@HeaderNote,
	@FooterNote,@MaxApplicant,@HeaderImage,@MiddleImage,@FooterImage,@Attachment,@EntryBy)
	
	update tblAppSettings set PropertyValue=@CurrentCircularID where PropertyName='CurrentJobCircularID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

------------------------


create procedure [dbo].[spGetJobList]
as

select CircularID,JobTitle from dbo.tblJobCircular

GO


------------------------------


-- drop proc spUpdateJobCircular
CREATE proc [dbo].[spUpdateJobCircular]
@CircularID nvarchar(50),
@JobTitle nvarchar(500),
@JobLocation nvarchar(50),
@OrganizationID nvarchar(50),
@DepartmentID nvarchar(50),
@JobDescription nvarchar(500),
@JobResponsibility nvarchar(500),
@SpecialSkillReq nvarchar(500),
@AddiJobReq nvarchar(500),
@EducationalReq nvarchar(500),
@ExperienceReqInYrs int,
@DutySchedule nvarchar(500),
@SalaryAndBenefits nvarchar(500),
@Vacancies int,
@Competencies nvarchar(500),
@CommunicationSkill nvarchar(500),
@MinAgeLimit int,
@MaxAgeLimit int,
@ReportableTo nvarchar(200),
@ApplyInstructions nvarchar(500),
@CompanyAddress nvarchar(500),
@TermsOfReferences nvarchar(500),
@ClosingDate datetime,
@HeaderNote nvarchar(500),
@FooterNote nvarchar(500),
@MaxApplicant int,
@HeaderImage nvarchar(200),
@MiddleImage nvarchar(200),
@FooterImage nvarchar(200),
@Attachment nvarchar(200)
as
begin

begin tran
	
UPDATE [dbo].[tblJobCircular]
   SET [JobTitle] = @JobTitle
      ,[JobLocation] = @JobLocation
      ,[OrganizationID] = @OrganizationID
      ,[DepartmentID] = @DepartmentID
      ,[JobDescription] = @JobDescription
      ,[JobResponsibility] = @JobResponsibility
      ,[SpecialSkillReq] = @SpecialSkillReq
      ,[AddiJobReq] = @AddiJobReq
      ,[EducationalReq] = @EducationalReq
      ,[ExperienceReqInYrs] = @ExperienceReqInYrs
      ,[DutySchedule] = @DutySchedule
      ,[SalaryAndBenefits] = @SalaryAndBenefits
      ,[Vacancies] = @Vacancies
      ,[Competencies] = @Competencies
      ,[CommunicationSkill] = @CommunicationSkill
      ,[MinAgeLimit] = @MinAgeLimit
      ,[MaxAgeLimit] = @MaxAgeLimit
      ,[ReportableTo] = @ReportableTo
      ,[ApplyInstructions] = @ApplyInstructions
      ,[CompanyAddress] = @CompanyAddress
      ,[TermsOfReferences] = @TermsOfReferences
      ,[ClosingDate] = @ClosingDate
      ,[HeaderNote] = @HeaderNote
      ,[FooterNote] = @FooterNote
      ,[MaxApplicant] = @MaxApplicant
      ,[HeaderImage] = @HeaderImage
      ,[MiddleImage] = @MiddleImage
      ,[FooterImage] = @FooterImage
      ,[Attachment] = @Attachment
			WHERE CircularID=@CircularID 

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO


------------------------------


ALTER procedure [dbo].[spGetJobDetails]
@CircularID nvarchar(50)
as
SELECT [JobTitle]
      ,[JobLocation]
      ,OrganizationID 
      ,DepartmentID 
      ,[JobDescription]
      ,[JobResponsibility]
      ,[SpecialSkillReq]
      ,[AddiJobReq]
      ,[EducationalReq]
      ,[ExperienceReqInYrs]
      ,[DutySchedule]
      ,[SalaryAndBenefits]
      ,[Vacancies]
      ,[Competencies]
      ,[CommunicationSkill]
      ,[MinAgeLimit]
      ,[MaxAgeLimit]
      ,[ReportableTo]
      ,[ApplyInstructions]
      ,[CompanyAddress]
      ,[TermsOfReferences]
      ,(convert(varchar,ClosingDate,106))[ClosingDate]
      ,[HeaderNote]
      ,[FooterNote]
      ,[MaxApplicant]
      ,[HeaderImage]
      ,[MiddleImage]
      ,[FooterImage]
      ,[Attachment]
      ,(select OrgName from tblOrganizations where OrganizationID=[tblJobCircular].OrganizationID )[Organization]
      ,(select DeptName from tblDepartment where DepartmentID=[tblJobCircular].DepartmentID )[Department]

  FROM [dbo].[tblJobCircular] where CircularID=@CircularID

--exec spGetJobDetails ''




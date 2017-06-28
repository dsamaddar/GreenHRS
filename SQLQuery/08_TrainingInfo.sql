insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentTrngSubjectID',0)

GO
-- drop table tblTrainingSubject
Create table tblTrainingSubject(
TrngSubjectID nvarchar(50) primary key,
TrngSubName nvarchar(200) Unique(TrngSubName),
TrngSubDescription nvarchar(50),
Objectives nvarchar(50),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

-- drop proc spInsertTrngSubject
Create proc spInsertTrngSubject
@TrngSubName nvarchar(500),
@TrngSubDescription nvarchar(50),
@Objectives nvarchar(50),
@EntryBy nvarchar(50)
as
begin
	Declare @TrngSubjectID nvarchar(50)
	Declare @CurrentTrngSubjectID numeric(18,0)
	Declare @TrngSubjectIDPrefix as nvarchar(9)

	set @TrngSubjectIDPrefix='TRNG-SUB-'

begin tran
	
	select @CurrentTrngSubjectID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentTrngSubjectID'
	
	set @CurrentTrngSubjectID=isnull(@CurrentTrngSubjectID,0)+1
	Select @TrngSubjectID=dbo.generateID(@TrngSubjectIDPrefix,@CurrentTrngSubjectID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblTrainingSubject(TrngSubjectID,TrngSubName,TrngSubDescription,Objectives,EntryBy)
	Values(@TrngSubjectID,@TrngSubName,@TrngSubDescription,@Objectives,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentTrngSubjectID where PropertyName='CurrentTrngSubjectID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

-- Select * from tblTrainingSubject

GO

-- drop proc spShowTrngSubjects
Create proc spShowTrngSubjects
as
begin
	Select distinct TrngSubjectID,TrngSubName from tblTrainingSubject
	Order by TrngSubName
end

-- exec spShowTrngSubjects

GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentTrngTypeID',0)
GO

-- drop table tblTrngType
Create table tblTrngType(
TrngTypeID nvarchar(50) primary key,
TrngType nvarchar(200) unique(TrngType),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

-- drop proc spInsertTrngType
Create proc spInsertTrngType
@TrngType nvarchar(200),
@EntryBy nvarchar(50)
as
begin
	Declare @TrngTypeID nvarchar(50)
	Declare @CurrentTrngTypeID numeric(18,0)
	Declare @TrngTypeIDPrefix as nvarchar(10)

	set @TrngTypeIDPrefix='TRNG-TYPE-'

begin tran
	
	select @CurrentTrngTypeID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentTrngTypeID'
	
	set @CurrentTrngTypeID=isnull(@CurrentTrngTypeID,0)+1
	Select @TrngTypeID=dbo.generateID(@TrngTypeIDPrefix,@CurrentTrngTypeID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblTrngType(TrngTypeID,TrngType,EntryBy)
	Values(@TrngTypeID,@TrngType,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentTrngTypeID where PropertyName='CurrentTrngTypeID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

-- Select * from tblTrngType

Create proc spShowTrngType
as
begin
	Select Distinct TrngTypeID,TrngType from tblTrngType Order by TrngType
end

GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentCourseLevelID',0)

GO

-- drop table tblCourseLevel
Create table tblCourseLevel(
CourseLevelID nvarchar(50) primary key,
CourseLevel nvarchar(200) unique(CourseLevel),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

-- drop proc spInsertCourseLevel
Create proc spInsertCourseLevel
@CourseLevel nvarchar(200),
@EntryBy nvarchar(50)
as
begin
	Declare @CourseLevelID nvarchar(50)
	Declare @CurrentCourseLevelID numeric(18,0)
	Declare @CourseLevelIDPrefix as nvarchar(13)

	set @CourseLevelIDPrefix='COURSE-LEVEL-'

begin tran
	
	select @CurrentCourseLevelID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentCourseLevelID'
	
	set @CurrentCourseLevelID=isnull(@CurrentCourseLevelID,0)+1
	Select @CourseLevelID=dbo.generateID(@CourseLevelIDPrefix,@CurrentCourseLevelID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblCourseLevel(CourseLevelID,CourseLevel,EntryBy)
	Values(@CourseLevelID,@CourseLevel,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentCourseLevelID where PropertyName='CurrentCourseLevelID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

-- Select * from tblCourseLevel
-- drop proc spShowCourseLevel
Create proc spShowCourseLevel
as
begin
	Select Distinct CourseLevelID,CourseLevel from tblCourseLevel
end


GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentADVTrainingID',0)

GO
-- drop table tblTrainingInfo
Create table tblTrainingInfo(
TrainingID nvarchar(50) primary key,
TrngSubjectID nvarchar(50) foreign key references tblTrainingSubject(TrngSubjectID),
TrainingDetails nvarchar(500),
TrngTypeID nvarchar(50) foreign key references tblTrngType(TrngTypeID),
CourseLevelID nvarchar(50) foreign key references tblCourseLevel(CourseLevelID),
TrainingInitiatedBy nvarchar(100),
CourseDuration nvarchar(500),
Duration nvarchar(500),
ClassesStartsOn datetime,
LastDateOfRegistration datetime,
ClassSchedule nvarchar(500),
HighLightsOfTheProgram nvarchar(2000),
CourseOutLine nvarchar(4000),
BenefitFromTheProgram nvarchar(2000),
HowToApply nvarchar(2000),
FeesPerAttendees numeric(18,2),
ResourcePerson nvarchar(200),
RPProfile nvarchar(1000),
OrganizationID nvarchar(50) foreign key references tblOrganizations(OrganizationID),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

-- drop proc spInsertTrainingInfo
Create proc spInsertTrainingInfo
@TrngSubjectID nvarchar(50),
@TrainingDetails nvarchar(500),
@TrngTypeID nvarchar(50),
@CourseLevelID nvarchar(50),
@TrainingInitiatedBy nvarchar(100),
@CourseDuration nvarchar(500),
@Duration nvarchar(500),
@ClassesStartsOn datetime,
@LastDateOfRegistration datetime,
@ClassSchedule nvarchar(500),
@HighLightsOfTheProgram nvarchar(2000),
@CourseOutLine nvarchar(4000),
@BenefitFromTheProgram nvarchar(2000),
@HowToApply nvarchar(2000),
@FeesPerAttendees numeric(18,2),
@ResourcePerson nvarchar(200),
@RPProfile nvarchar(1000),
@OrganizationID nvarchar(50),
@EntryBy nvarchar(50)
as
begin
	Declare @TrainingID nvarchar(50)
	Declare @CurrentTrainingID numeric(18,0)
	Declare @TrainingIDPrefix as nvarchar(5)

	set @TrainingIDPrefix='TRNG-'

begin tran
	
	select @CurrentTrainingID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentADVTrainingID'
	
	set @CurrentTrainingID=isnull(@CurrentTrainingID,0)+1
	Select @TrainingID=dbo.generateID(@TrainingIDPrefix,@CurrentTrainingID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblTrainingInfo(TrainingID,TrngSubjectID,TrainingDetails,TrngTypeID,CourseLevelID,TrainingInitiatedBy,CourseDuration,
	Duration,ClassesStartsOn,LastDateOfRegistration,ClassSchedule,HighLightsOfTheProgram,CourseOutLine,
	BenefitFromTheProgram,HowToApply,FeesPerAttendees,ResourcePerson,RPProfile,OrganizationID,EntryBy)
	Values(@TrainingID,@TrngSubjectID,@TrainingDetails,@TrngTypeID,@CourseLevelID,@TrainingInitiatedBy,@CourseDuration,@Duration,
	@ClassesStartsOn,@LastDateOfRegistration,@ClassSchedule,@HighLightsOfTheProgram,@CourseOutLine,@BenefitFromTheProgram,@HowToApply,@FeesPerAttendees,@ResourcePerson,@RPProfile,@OrganizationID,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentTrainingID where PropertyName='CurrentADVTrainingID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

-- drop proc spShowAvailableTraining
Create proc spShowAvailableTraining
as
begin
	Select TrainingID,TrainingDetails,Convert(nvarchar,LastDateOfRegistration,106) as RegDeadLine from tblTrainingInfo Where LastDateOfRegistration > getdate()
end

-- exec spShowAvailableTraining

GO

Create view vwTrainingDetails
as
Select T.TrainingID,TS.TrngSubName,T.TrainingDetails,TT.TrngType,CL.CourseLevel,T.TrainingInitiatedBy,T.CourseDuration,T.Duration,
T.ClassesStartsOn,T.LastDateOfRegistration,T.ClassSchedule,T.HighlightsOfTheProgram,T.CourseOutLine,T.BenefitFromTheProgram,T.HowToApply,
T.FeesPerAttendees,T.ResourcePerson,T.RPProfile,O.OrgName,T.EntryBy,T.EntryDate from tblTrainingInfo T Inner Join tblTrainingSubject TS On T.TrngSubjectID=TS.TrngSubjectID 
Inner Join tblTrngType TT On T.TrngTypeID=TT.TrngTypeID Inner Join tblCourseLevel CL On T.CourseLevelID=CL.CourseLevelID
Inner Join tblOrganizations O On T.OrganizationID=O.OrganizationID

-- Select * from vwTrainingDetails

GO

-- drop proc spShowTrainingDetailsByID
Create proc spShowTrainingDetailsByID
@TrainingID nvarchar(50)
as
begin
	Select TrainingID,TrngSubName,TrainingDetails,TrngType,CourseLevel,TrainingInitiatedBy,CourseDuration,
	Duration,Convert(nvarchar,ClassesStartsOn,106) as ClassesStartsOn,Convert(nvarchar,LastDateOfRegistration,106) as LastDateOfRegistration,
	ClassSchedule,HighlightsOfTheProgram,CourseOutLine,BenefitFromTheProgram,
	HowToApply,FeesPerAttendees,ResourcePerson,RPProfile,OrgName,EntryBy,EntryDate
	 from vwTrainingDetails Where TrainingID=@TrainingID
end

-- exec spShowTrainingDetailsByID 'TRNG-00000003'
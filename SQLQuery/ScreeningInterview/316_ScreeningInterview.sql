
Go

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentScrInterviewID',0)

GO

-- drop table tblScreeningInterview
Create table tblScreeningInterview(
ScrInterviewID nvarchar(50) primary key,
CandidateID nvarchar(50) foreign key references dbo.tblCandidateBasicInfo(CandidateID),
InterviewMethod nvarchar(200),
IsAnyOneKnownToOurInstitution bit default 0,
KnownDesignationID nvarchar(50) foreign key references tblDesignation(DesignationID),
KnownPerson nvarchar(200),
HowToKnowThePerson nvarchar(200),
Remarks nvarchar(500),
NextAction nvarchar(200),
IsAccepted bit default 0,
IsRejected bit default 0,
ScreenedBy nvarchar(50),
ScreenedDate datetime default getdate()
);

GO

-- drop proc spInsertScreeningInterview
Create proc spInsertScreeningInterview
@CandidateID nvarchar(50),
@InterviewMethod nvarchar(200),
@IsAnyOneKnownToOurInstitution bit,
@KnownDesignationID nvarchar(50),
@KnownPerson nvarchar(200),
@HowToKnowThePerson nvarchar(200),
@Remarks nvarchar(500),
@NextAction nvarchar(200),
@IsAccepted bit,
@IsRejected bit,
@ScreenedBy nvarchar(50),
@CanResMatchedInfoData nvarchar(4000),
@CanSuitableForInfoData nvarchar(4000),
@ScrMultipleQuesAnswerData nvarchar(4000)
as
begin
	Declare @ScrInterviewID as nvarchar(50)
	Declare @CurrentScrInterviewID numeric(18,0)
	Declare @ScrInterviewIDPrefix as nvarchar(12)

	set @ScrInterviewIDPrefix='CAN-SCR-INT-'
	
	if @IsAnyOneKnownToOurInstitution = 0 
	begin
		Set @KnownDesignationID = null
		Set @KnownPerson = null 
	end
	
	Declare @ParamKnownDesignationID as nvarchar(50)
	Declare @ParamKnownPerson as nvarchar(200)
	Declare @ParamHowToKnowThePerson as nvarchar(200)
	
	if @KnownDesignationID = 'N\A'
	begin
		Set @ParamKnownDesignationID = null 
	end
	else
		Set @ParamKnownDesignationID = @KnownDesignationID 
	
	if @KnownPerson = 'N\A'
	begin
		Set @ParamKnownPerson = null
	end
	else
		Set @ParamKnownPerson = @KnownPerson
	
	If @HowToKnowThePerson = 'N\A'
	begin
		Set @ParamHowToKnowThePerson = null 
	end
	else
		Set @ParamHowToKnowThePerson = @HowToKnowThePerson 

begin tran
	
	select @CurrentScrInterviewID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentScrInterviewID'
	
	set @CurrentScrInterviewID=isnull(@CurrentScrInterviewID,0)+1
	Select @ScrInterviewID=dbo.generateID(@ScrInterviewIDPrefix,@CurrentScrInterviewID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	Insert Into tblScreeningInterview(ScrInterviewID,CandidateID,InterviewMethod,IsAnyOneKnownToOurInstitution,KnownDesignationID,
	KnownPerson,HowToKnowThePerson,Remarks,NextAction,IsAccepted,IsRejected,ScreenedBy)
	Values(@ScrInterviewID,@CandidateID,@InterviewMethod,@IsAnyOneKnownToOurInstitution,@ParamKnownDesignationID,
	@ParamKnownPerson,@ParamHowToKnowThePerson,@Remarks,@NextAction,@IsAccepted,@IsRejected,@ScreenedBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	-- Update Candidate Basic Info
	Update tblCandidateBasicInfo Set IsScreened=1,ScreenedDate=GETDATE(),ScreenedStatus=@NextAction,ScreenedBy=@ScreenedBy
	Where CandidateID=@CandidateID
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	-- Insert Responsibility Matched.
	Delete from tblCanResponsibilityMatched Where CandidateID=@CandidateID
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	exec spInsertCanResMatchedInfoList @CanResMatchedInfoData
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	-- Insert Suitable For Position
	Delete from tblCanSuitableFor Where CandidateID=@CandidateID
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	exec spInsertCanSuitableForInfoList @CanSuitableForInfoData
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	-- Multiple Question Options Selected.
	Delete From tblCanScrQuesOptionsSelected Where CandidateID=@CandidateID
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	exec spInsertCanScrQuesOptSelectedList @ScrMultipleQuesAnswerData
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	-- If Not Applied To Any Job Then Assign "Without Circular" Job Circular
	if not exists( Select * from tblAppliedJob Where CandidateID=@CandidateID )
	begin
		Declare @CircularID as nvarchar(50)
		Set @CircularID = ''
		
		Select @CircularID=CircularID from tblJobCircular Where JobTitle='Without Circular'
		
		if @CircularID='' or @CircularID is null
		begin
			GOTO ERR_HANDLER
		end
		
		exec spInsertJobApply @CircularID,@CandidateID,@ScreenedBy
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
	end 
	
	update tblAppSettings set PropertyValue=@CurrentScrInterviewID where PropertyName='CurrentScrInterviewID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentCanScrQuesInfoID',0)

GO

-- drop table tblCanScrQuesInfo
Create table tblCanScrQuesInfo(
CanScrQuesInfoID nvarchar(50) primary key,
ScreeningQuesID nvarchar(50) foreign key references tblScreeningQuestion(ScreeningQuesID),
ScrQuesOptionID nvarchar(50) foreign key references tblScreeningQuesOptions(ScrQuesOptionID),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

-- drop proc spInsertCanSrcQuesInfo
Create proc spInsertCanSrcQuesInfo
@ScreeningQuesID nvarchar(50),
@ScrQuesOptionID nvarchar(50),
@EntryBy nvarchar(50)
as
begin
	Declare @CanScrQuesInfoID as nvarchar(50)
	Declare @CurrentCanScrQuesInfoID numeric(18,0)
	Declare @CanScrQuesInfoIDPrefix as nvarchar(13)

	set @CanScrQuesInfoIDPrefix='CAN-SCR-QUES-'

begin tran
	
	select @CurrentCanScrQuesInfoID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentCanScrQuesInfoID'
	
	set @CurrentCanScrQuesInfoID=isnull(@CurrentCanScrQuesInfoID,0)+1
	Select @ScreeningQuesID=dbo.generateID(@CanScrQuesInfoIDPrefix,@CurrentCanScrQuesInfoID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	Insert Into tblCanScrQuesInfo(CanScrQuesInfoID,ScreeningQuesID,ScrQuesOptionID,EntryBy)
	Values(@CanScrQuesInfoID,@ScreeningQuesID,@ScrQuesOptionID,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	update tblAppSettings set PropertyValue=@CurrentCanScrQuesInfoID where PropertyName='CurrentCanScrQuesInfoID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end


GO

-- drop proc spInsertCanScrQuesInfoList
Create proc spInsertCanScrQuesInfoList
@CanScrQuesInfoData nvarchar(4000)
as
begin
	Declare @Index as int
	Declare @CurrentData as nvarchar(4000)
	Declare @RestData as nvarchar(4000)
	Declare @RestPortion as nvarchar(4000)
	
	Declare @ScreeningQuesID nvarchar(50)
	Declare @ScrQuesOptionID nvarchar(50)
	Declare @EntryBy nvarchar(50)

begin tran
	set @RestData=@CanScrQuesInfoData
	while @RestData<>''
	begin
		set @Index=CHARINDEX('|',@RestData)
		set @CurrentData=substring(@RestData,1,@Index-1)
		set @RestData=substring(@RestData,@Index+1,len(@RestData))		
		
		set @RestPortion=@CurrentData
		
		set @Index=CHARINDEX('~',@RestPortion)		
		set @ScreeningQuesID=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	
		
		set @Index=CHARINDEX('~',@RestPortion)		
		set @ScrQuesOptionID=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	
		
		set @Index=CHARINDEX('~',@RestPortion)		
		set @EntryBy=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	
	
		exec spInsertCanSrcQuesInfo @ScreeningQuesID,@ScrQuesOptionID,@EntryBy
		IF (@@ERROR <> 0) GOTO ERR_HANDLER	
		
		Set @ScreeningQuesID = ''
		Set @ScreeningQuesID = ''
		Set @EntryBy = ''
						
	end
	
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

ALTER proc [dbo].[spGetScrInterviewInfo]
@CandidateID nvarchar(50)
as
begin
	Select InterviewMethod,IsAnyOneKnownToOurInstitution,isnull(KnownDesignationID,'N\A') as 'KnownDesignationID',
	isnull((Select DesignationName From tblDesignation Where DesignationID=KnownDesignationID),'N\A') as 'KnownDesignation',
	isnull(KnownPerson,'N\A') as 'KnownPerson',isnull(HowToKnowThePerson,'N\A') as 'HowToKnowThePerson',Remarks,NextAction,
	ScreenedBy,Convert(nvarchar,ScreenedDate,106) as 'ScreenedDate'
	from tblScreeningInterview Where CandidateID=@CandidateID
end

-- exec [spGetScrInterviewInfo] 'Can-00000002'

GO

ALTER proc [dbo].[spGetCandidateResMatched]
@CandidateID nvarchar(50)
as
begin
	Select D.DepartmentID,D.DeptName  from tblCanResponsibilityMatched MR Left Join tblDepartment D
	On D.DepartmentID=MR.DepartmentID  Where MR.CandidateID=@CandidateID
end

-- exec spGetCandidateResMatched 'Can-00000001'

GO

ALTER proc [dbo].[spGetCandidateSuitableFor]
@CandidateID nvarchar(50)
as
begin
	Select D.DepartmentID,D.DeptName  from tblCanSuitableFor SF Left Join tblDepartment D
	On  D.DepartmentID=SF.DepartmentID  Where SF.CandidateID=@CandidateID
end

-- exec spGetCandidateSuitableFor 'Can-00000001'
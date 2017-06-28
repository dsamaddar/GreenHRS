
GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentCanResMatchedID',0)

GO

-- drop table tblCanResponsibilityMatched
Create table tblCanResponsibilityMatched(
CanResMatchedID nvarchar(50) primary key,
CandidateID nvarchar(50) foreign key references tblCandidateBasicInfo(CandidateID),
DepartmentID nvarchar(50) foreign key references tblDepartment(DepartmentID),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

-- Select * from tblCanResponsibilityMatched

GO

-- drop proc spInsertCanResMatchedInfo
Create proc spInsertCanResMatchedInfo
@CandidateID nvarchar(50),
@DepartmentID nvarchar(50),
@EntryBy nvarchar(50)
as
begin
	Declare @CanResMatchedID as nvarchar(50)
	Declare @CurrentCanResMatchedID numeric(18,0)
	Declare @CanResMatchedIDPrefix as nvarchar(12)

	set @CanResMatchedIDPrefix='CAN-RES-MAT-'

begin tran
	
	select @CurrentCanResMatchedID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentCanResMatchedID'
	
	set @CurrentCanResMatchedID=isnull(@CurrentCanResMatchedID,0)+1
	Select @CanResMatchedID=dbo.generateID(@CanResMatchedIDPrefix,@CurrentCanResMatchedID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	Insert Into tblCanResponsibilityMatched(CanResMatchedID,CandidateID,DepartmentID,EntryBy)
	Values(@CanResMatchedID,@CandidateID,@DepartmentID,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	update tblAppSettings set PropertyValue=@CurrentCanResMatchedID where PropertyName='CurrentCanResMatchedID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

go

-- drop proc spInsertCanResMatchedInfoList
Create proc spInsertCanResMatchedInfoList
@CanResMatchedInfoData nvarchar(4000)
as
begin
	Declare @Index as int
	Declare @CurrentData as nvarchar(4000)
	Declare @RestData as nvarchar(4000)
	Declare @RestPortion as nvarchar(4000)
	
	Declare @CandidateID nvarchar(50)
	Declare @DepartmentID nvarchar(50)
	Declare @EntryBy nvarchar(50)
	
begin tran
	set @RestData=@CanResMatchedInfoData
	while @RestData<>''
	begin
		set @Index=CHARINDEX('|',@RestData)
		set @CurrentData=substring(@RestData,1,@Index-1)
		set @RestData=substring(@RestData,@Index+1,len(@RestData))		
		
		set @RestPortion=@CurrentData
		
		set @Index=CHARINDEX('~',@RestPortion)		
		set @CandidateID=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	
		
		set @Index=CHARINDEX('~',@RestPortion)		
		set @DepartmentID=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	
		
		set @Index=CHARINDEX('~',@RestPortion)		
		set @EntryBy=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	
			
		exec spInsertCanResMatchedInfo @CandidateID,@DepartmentID,@EntryBy
		IF (@@ERROR <> 0) GOTO ERR_HANDLER	
		
		--print 'SPID:-'+ @SpecializedID
		
		Set @CandidateID = ''
		Set @DepartmentID = ''
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

-- exec spInsertCanResMatchedInfoList 'Can-00000002~DEPT-00000013~rhossain~|Can-00000002~DEPT-00000007~rhossain~|Can-00000002~DEPT-00000009~rhossain~|Can-00000002~DEPT-00000001~rhossain~|'

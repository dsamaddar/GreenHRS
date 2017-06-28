

GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentCanSuitableForID',0)

GO

-- drop table tblCanSuitableFor
Create table tblCanSuitableFor(
CanSuitableForID nvarchar(50) primary key,
CandidateID nvarchar(50) foreign key references tblCandidateBasicInfo(CandidateID),
DepartmentID nvarchar(50) foreign key references  tblDepartment(DepartmentID),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

-- Select * from tblCanSuitableFor

GO

-- drop proc spInsertCanSuitableForInfo
Create proc spInsertCanSuitableForInfo
@CandidateID nvarchar(50),
@DepartmentID nvarchar(50),
@EntryBy nvarchar(50)
as
begin
	Declare @CanSuitableForID as nvarchar(50)
	Declare @CurrentCanSuitableForID numeric(18,0)
	Declare @CanSuitableForIDPrefix as nvarchar(12)

	set @CanSuitableForIDPrefix='CAN-RES-MAT-'

begin tran
	
	select @CurrentCanSuitableForID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentCanSuitableForID'
	
	set @CurrentCanSuitableForID=isnull(@CurrentCanSuitableForID,0)+1
	Select @CanSuitableForID=dbo.generateID(@CanSuitableForIDPrefix,@CurrentCanSuitableForID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	Insert Into tblCanSuitableFor(CanSuitableForID,CandidateID,DepartmentID,EntryBy)
	Values(@CanSuitableForID,@CandidateID,@DepartmentID,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	update tblAppSettings set PropertyValue=@CurrentCanSuitableForID where PropertyName='CurrentCanSuitableForID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

go

-- drop proc spInsertCanSuitableForInfoList
Create proc spInsertCanSuitableForInfoList
@CanSuitableForInfoData nvarchar(4000)
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
	set @RestData=@CanSuitableForInfoData
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
	
		exec spInsertCanSuitableForInfo @CandidateID,@DepartmentID,@EntryBy
		IF (@@ERROR <> 0) GOTO ERR_HANDLER	
		
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


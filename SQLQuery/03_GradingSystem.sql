
insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentGradSysTypeID',0)

GO

-- drop table tblGradingSystemType
Create table tblGradingSystemType(
GradSysTypeID nvarchar(50) primary key,
GradSysType nvarchar(200),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

-- drop proc spInsertGradingSystemType
Create Proc spInsertGradingSystemType
@GradSysType nvarchar(200),
@EntryBy nvarchar(50)
as
begin
	Declare @GradSysTypeID as nvarchar(50)
	Declare @CurrentGradSysTypeID numeric(18,0)
	Declare @GradSysTypeIDPrefix as nvarchar(13)

	set @GradSysTypeIDPrefix='GRAD-SYS-TYP-'

begin tran
	
	select @CurrentGradSysTypeID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentGradSysTypeID'
	
	set @CurrentGradSysTypeID=isnull(@CurrentGradSysTypeID,0)+1
	Select @GradSysTypeID=dbo.generateID(@GradSysTypeIDPrefix,@CurrentGradSysTypeID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblGradingSystemType(GradSysTypeID,GradSysType,EntryBy)
	Values(@GradSysTypeID,@GradSysType,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	update tblAppSettings set PropertyValue=@CurrentGradSysTypeID where PropertyName='CurrentGradSysTypeID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

-- drop proc spShowGradSysType
Create proc spShowGradSysType
as
begin
	Select Distinct GradSysTypeID,GradSysType from tblGradingSystemType
end

GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentGradingSystemID',0)

GO

-- drop table tblGradingSystem
Create table tblGradingSystem(
GradingSystemID nvarchar(50) Primary Key,
GradSysTypeID nvarchar(50) foreign key references tblGradingSystemType(GradSysTypeID),
FromPercentage numeric(5,2) unique(FromPercentage),
ToPercentage numeric(5,2) unique(ToPercentage),
LetterGrade nvarchar(100) unique(LetterGrade),
GradePoint numeric(3,2) unique(GradePoint),
GradingExplanation nvarchar(500),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

-- drop proc spInsertGradingSystem
Create proc spInsertGradingSystem
@GradSysTypeID nvarchar(50),
@FromPercentage numeric(5,2),
@ToPercentage numeric(5,2),
@LetterGrade nvarchar(100),
@GradePoint numeric(3,2),
@GradingExplanation nvarchar(500),
@EntryBy nvarchar(50)
as
begin

	Declare @GradingSystemID as nvarchar(50)
	Declare @CurrentGradingSystemID numeric(18,0)
	Declare @GradingSystemIDPrefix as nvarchar(9)

	set @GradingSystemIDPrefix='GRAD-SYS-'

begin tran
	
	select @CurrentGradingSystemID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentGradingSystemID'
	
	set @CurrentGradingSystemID=isnull(@CurrentGradingSystemID,0)+1
	Select @GradingSystemID=dbo.generateID(@GradingSystemIDPrefix,@CurrentGradingSystemID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblGradingSystem(GradingSystemID,GradSysTypeID,FromPercentage,ToPercentage,LetterGrade,GradePoint,GradingExplanation,EntryBy)
	Values(@GradingSystemID,@GradSysTypeID,@FromPercentage,@ToPercentage,@LetterGrade,@GradePoint,@GradingExplanation,@EntryBy)
	
	update tblAppSettings set PropertyValue=@CurrentGradingSystemID where PropertyName='CurrentGradingSystemID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO
-- drop proc spInsertTotalGradingSystem
create proc spInsertTotalGradingSystem
@GradSysTypeID nvarchar(50),
@GradingSystemData  nvarchar(4000),
@EntryBy nvarchar(50)
as
begin
	Declare @FromPercentage as numeric(5,2)
	Declare @ToPercentage as numeric(5,2)
	Declare @LetterGrade as nvarchar(10)
	Declare @GradePoint as numeric(3,2)
	Declare @GradingExplanation nvarchar(500)

	Declare @Index as int
	Declare @CurrentData as nvarchar(4000)
	Declare @RestData as nvarchar(4000)
	Declare @RestPortion as nvarchar(4000)

begin tran

	-- Clear Previous Data 
	Delete from tblGradingSystem Where GradSysTypeID=@GradSysTypeID
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	set @RestData=@GradingSystemData
	while @RestData<>''
	begin
		set @Index=CHARINDEX('|',@RestData)
		set @CurrentData=substring(@RestData,1,@Index-1)
		set @RestData=substring(@RestData,@Index+1,len(@RestData))		
		
		set @RestPortion=@CurrentData
		
		set @Index=CHARINDEX('~',@RestPortion)		
		set @FromPercentage=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	
		
		set @Index=CHARINDEX('~',@RestPortion)		
		set @ToPercentage=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))
	
		set @Index=CHARINDEX('~',@RestPortion)		
		set @LetterGrade=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	

		set @Index=CHARINDEX('~',@RestPortion)		
		set @GradePoint=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	

		set @Index=CHARINDEX('~',@RestPortion)		
		set @GradingExplanation=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	
	
		Exec spInsertGradingSystem @GradSysTypeID,@FromPercentage,@ToPercentage,@LetterGrade,@GradePoint,@GradingExplanation,@EntryBy
		IF (@@ERROR <> 0) GOTO ERR_HANDLER	
		
		Set @FromPercentage = 0
		Set @ToPercentage = 0
		Set @LetterGrade = ''
		Set @GradePoint = 0
				
	end
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO



-- drop proc spShowGradSysByTypeID
Create proc spShowGradSysByTypeID
@GradSysTypeID nvarchar(50)
as
begin
	Select GradingSystemID,GradSysTypeID,FromPercentage,ToPercentage,LetterGrade,GradePoint,isnull(GradingExplanation,'N\A') as GradingExplanation,
	EntryBy,EntryDate from tblGradingSystem Where GradSysTypeID=@GradSysTypeID
end

-- exec spInsertGradingSystem 0,29,'F',0.00,'dsamaddar'
-- exec spInsertGradingSystem 30,39,'D',1.00,'dsamaddar'
-- exec spInsertGradingSystem 40,49,'D+',1.50,'dsamaddar'
-- exec spInsertGradingSystem 50,59,'C',2.00,'dsamaddar'
-- exec spInsertGradingSystem 60,69,'C+',2.50,'dsamaddar'
-- exec spInsertGradingSystem 70,79,'B',3.00,'dsamaddar'
-- exec spInsertGradingSystem 80,89,'B+',3.50,'dsamaddar'
-- exec spInsertGradingSystem 90,100,'A',4.00,'dsamaddar'

-- Select * from tblGradingSystem

Go

Create proc spGetGradingSystem
as
begin
	Select FromPercentage,ToPercentage,LetterGrade,GradePoint From tblGradingSystem
	Order by Gradepoint
end

-- exec spGetGradingSystem

Go

-- drop proc spGetLetterGrades
Create proc spGetLetterGrades
as
begin
	Select Distinct LetterGrade from tblGradingSystem
	order by LetterGrade desc
end

-- exec spGetLetterGrades
GO

-- drop proc spGradingPoints
Create proc spGradingPoints
as
begin
	Select Distinct GradePoint from tblGradingSystem 
	Order by GradePoint 
end

-- exec spGradingPoints
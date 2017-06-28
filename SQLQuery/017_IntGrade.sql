
GO
insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentIntGradeID',0)
GO

-- drop table tblIntGrade
Create table tblIntGrade(
IntGradeID nvarchar(50) primary key,
GradeName nvarchar(200) unique(GradeName),
GradePoint numeric(3,2) unique(GradePoint),
IsActive bit default 1,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

Create proc spGetGradeInfoByID
@IntGradeID nvarchar(50)
as
begin
	Select GradeName,GradePoint,IsActive,EntryBy,EntryDate from tblIntGrade
	Where IntGradeID=@IntGradeID
end

GO

-- drop proc spShowIntGradeInfo
Create proc spShowIntGradeInfo
as
begin
	Select IntGradeID,GradeName,GradePoint,IsActive,EntryBy,EntryDate from tblIntGrade
end

GO

-- drop proc spShowIntGradeList
Create proc spShowIntGradeList
as
begin
	Select IntGradeID,GradeName+' ( '+Convert(nvarchar,GradePoint)+' )' as 'GradeName' from tblIntGrade Where IsActive=1
	order by GradePoint
end

-- exec spShowIntGradeList

GO

-- drop proc spInsertIntGrade
Create proc spInsertIntGrade
@GradeName nvarchar(200),
@GradePoint numeric(3,2),
@IsActive bit,
@EntryBy nvarchar(50)
as
begin
	Declare @IntGradeID nvarchar(50)
	Declare @CurrentIntGradeID numeric(18,0)
	Declare @IntGradeIDPrefix as nvarchar(8)

	set @IntGradeIDPrefix='INT-GRD-'

begin tran
	
	select @CurrentIntGradeID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentIntGradeID'
	
	set @CurrentIntGradeID=isnull(@CurrentIntGradeID,0)+1
	Select @IntGradeID=dbo.generateID(@IntGradeIDPrefix,@CurrentIntGradeID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	Insert into tblIntGrade(IntGradeID,GradeName,GradePoint,IsActive,EntryBy)
	Values(@IntGradeID,@GradeName,@GradePoint,@IsActive,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	update tblAppSettings set PropertyValue=@CurrentIntGradeID where PropertyName='CurrentIntGradeID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO


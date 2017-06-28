
insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentRelationTypeID',0)

GO
-- drop table tblRelationType
Create table tblRelationType(
RelationTypeID nvarchar(50) primary key,
RelationType nvarchar(200) unique(RelationType),
IsActive bit default 1,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

-- drop proc spShowRelationType
Create proc spShowRelationType
as
begin
	Select Distinct RelationTypeID,RelationType from tblRelationType Where IsActive=1
	Order by RelationType 
end

GO

-- drop proc spInsertRelationType
Create proc spInsertRelationType
@RelationType nvarchar(200),
@IsActive bit,
@EntryBy nvarchar(50)
as
begin
	Declare @RelationTypeID as nvarchar(50)
	Declare @CurrentRelationTypeID numeric(18,0)
	Declare @RelationTypeIDPrefix as nvarchar(11)

	set @RelationTypeIDPrefix='REL-TYPE-'

begin tran
	
	select @CurrentRelationTypeID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentRelationTypeID'
	
	set @CurrentRelationTypeID=isnull(@CurrentRelationTypeID,0)+1
	Select @RelationTypeID=dbo.generateID(@RelationTypeIDPrefix,@CurrentRelationTypeID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	Insert Into tblRelationType(RelationTypeID,RelationType,IsActive,EntryBy)
	Values(@RelationTypeID,@RelationType,@IsActive,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	update tblAppSettings set PropertyValue=@CurrentRelationTypeID where PropertyName='CurrentRelationTypeID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentRelativeID',0)

GO

Create table tblEmpRelatives(
RelativeID nvarchar(50) primary key,
EmployeeID nvarchar(50) foreign key references tblEmployeeInfo(EmployeeID),
RelationTypeID nvarchar(50) foreign key references tblRelationType(RelationTypeID),
NameOfRelative nvarchar(200),
DateOfBirth datetime,
RelAddress nvarchar(500),
Details nvarchar(1000),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

-- drop proc spInsertEmpRelatives
Create proc spInsertEmpRelatives
@EmployeeID nvarchar(50),
@RelationTypeID nvarchar(50),
@NameOfRelative nvarchar(200),
@DateOfBirth datetime,
@RelAddress nvarchar(500),
@Details nvarchar(1000),
@EntryBy nvarchar(50)
as
begin
	Declare @RelativeID as nvarchar(50)
	Declare @CurrentRelativeID numeric(18,0)
	Declare @RelativeIDPrefix as nvarchar(11)

	set @RelativeIDPrefix='REL-TYPE-'

begin tran
	
	select @CurrentRelativeID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentRelativeID'
	
	set @RelativeID=isnull(@CurrentRelativeID,0)+1
	Select @RelationTypeID=dbo.generateID(@RelativeIDPrefix,@CurrentRelativeID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	Insert into tblEmpRelatives(RelativeID,EmployeeID,RelationTypeID,NameOfRelative,DateOfBirth,RelAddress,Details,EntryBy)
	Values(@RelativeID,@EmployeeID,@RelationTypeID,@NameOfRelative,@DateOfBirth,@RelAddress,@Details,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	update tblAppSettings set PropertyValue=@CurrentRelativeID where PropertyName='CurrentRelativeID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

-- drop proc spShowEmpRelatives
Create proc spShowEmpRelatives
@EmployeeID nvarchar(50)
as
begin
	Select RelativeID,(Select RelationType from tblRelationType Where RelationTypeID=tblEmpRelatives.RelationTypeID ),
	NameOfRelative,CONVERT(nvarchar,DateOfBirth,106) as 'DateOfBirth',RelAddress,Details
	EntryBy from tblEmpRelatives Where EmployeeID=@EmployeeID 
end

GO


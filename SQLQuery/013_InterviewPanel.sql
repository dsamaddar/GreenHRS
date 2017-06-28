

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentIntTeamID',0)

GO
-- drop table tblInterViewTeam
Create table tblInterViewTeam(
IntTeamID nvarchar(50) primary key,
IntTeamName nvarchar(200) unique(IntTeamName),
IsActive bit default 1,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

Create proc spGetInterviewTeamList
as
begin
	Select IntTeamID,IntTeamName from tblInterViewTeam Where IsActive=1
end

GO

-- drop proc spInsertInterViewTeam
Create proc spInsertInterViewTeam
@IntTeamName nvarchar(200),
@IsActive bit,
@EntryBy nvarchar(50)
as
begin
	Declare @IntTeamID nvarchar(50)
	Declare @CurrentIntTeamID numeric(18,0)
	Declare @IntTeamIDPrefix as nvarchar(9)

	set @IntTeamIDPrefix='INT-TEAM-'

begin tran
	
	select @CurrentIntTeamID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentIntTeamID'
	
	set @CurrentIntTeamID=isnull(@CurrentIntTeamID,0)+1
	Select @IntTeamID=dbo.generateID(@IntTeamIDPrefix,@CurrentIntTeamID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert Into tblInterViewTeam(IntTeamID,IntTeamName,IsActive,EntryBy)
	Values(@IntTeamID,@IntTeamName,@IsActive,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentIntTeamID where PropertyName='CurrentIntTeamID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentIntMemberTypeID',0)

GO

-- drop table tblIntMemberType
Create table tblIntMemberType(
IntMemberTypeID nvarchar(50) primary key,
MemberType nvarchar(200) Unique(MemberType),
IsActive bit default 1,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);
GO

Create proc spGetMemberTypeList
as
begin
	Select distinct IntMemberTypeID,MemberType From tblIntMemberType Where IsActive=1
end

GO

-- drop proc spInsertIntMemberType
Create proc spInsertIntMemberType
@MemberType nvarchar(200),
@IsActive bit,
@EntryBy nvarchar(50)
as
begin
	Declare @IntMemberTypeID nvarchar(50)
	Declare @CurrentIntMemberTypeID numeric(18,0)
	Declare @IntMemberTypeIDPrefix as nvarchar(12)

	set @IntMemberTypeIDPrefix='INT-MEM-TYP-'

begin tran
	
	select @CurrentIntMemberTypeID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentIntMemberTypeID'
	
	set @CurrentIntMemberTypeID=isnull(@CurrentIntMemberTypeID,0)+1
	Select @IntMemberTypeID=dbo.generateID(@IntMemberTypeIDPrefix,@CurrentIntMemberTypeID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert Into tblIntMemberType(IntMemberTypeID,MemberType,IsActive,EntryBy)
	Values(@IntMemberTypeID,@MemberType,@IsActive,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentIntMemberTypeID where PropertyName='CurrentIntMemberTypeID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentIntPanelID',0)

GO

-- drop table tblInterViewPanel
Create table tblInterViewPanel(
IntPanelID nvarchar(50) Primary key,
IntTeamID nvarchar(50) foreign key references tblInterViewTeam(IntTeamID),
IntMemberTypeID nvarchar(50) foreign key references tblIntMemberType(IntMemberTypeID),
IntPanelMemberID nvarchar(50) foreign key references tblEmployeeInfo(EmployeeID),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

-- drop proc spInsertInterviewPanel
Create proc spInsertInterviewPanel
@IntTeamID nvarchar(50),
@IntMemberTypeID nvarchar(50),
@IntPanelMemberID nvarchar(50),
@EntryBy nvarchar(50)
as
begin
	Declare @IntPanelID nvarchar(50)
	Declare @CurrentIntPanelID numeric(18,0)
	Declare @IntPanelIDPrefix as nvarchar(8)

	set @IntPanelIDPrefix='INT-PNL-'

begin tran
	
	select @CurrentIntPanelID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentIntPanelID'
	
	set @CurrentIntPanelID=isnull(@CurrentIntPanelID,0)+1
	Select @IntPanelID=dbo.generateID(@IntPanelIDPrefix,@CurrentIntPanelID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert Into tblInterViewPanel(IntPanelID,IntTeamID,IntMemberTypeID,IntPanelMemberID,EntryBy)
	Values(@IntPanelID,@IntTeamID,@IntMemberTypeID,@IntPanelMemberID,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentIntPanelID where PropertyName='CurrentIntPanelID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

-- drop view vwInterviewPanel
Create View vwInterviewPanel
as
Select IVP.IntPanelID,IVT.IntTeamID,IVT.IntTeamName,vwEMP.EmployeeName,vwEMP.OfficialDesignation,vwEMP.DeptName,vwEMP.ULCBranchName,
IMT.MemberType
from tblInterViewPanel IVP Inner Join vwEmpInfo vwEMP On IVP.IntPanelMemberID=vwEMP.EmployeeID
Inner Join tblInterViewTeam IVT On IVP.IntTeamID=IVT.IntTeamID Inner Join tblIntMemberType IMT On IVP.IntMemberTypeID=IMT.IntMemberTypeID

-- Select * from vwInterviewPanel

GO

-- drop proc spGetIntPanelwiseMemberInfo
Create proc spGetIntPanelwiseMemberInfo
@IntTeamID nvarchar(50)
as
begin
	Select IntPanelID,IntTeamID,IntTeamName,EmployeeName,OfficialDesignation,DeptName,ULCBranchName,MemberType
	from vwInterviewPanel Where IntTeamID=@IntTeamID
end

GO

-- drop function fnEmpAlreadyExistsInTeam
Create function fnEmpAlreadyExistsInTeam(@IntTeamID nvarchar(50),@EmployeeID nvarchar(50))
returns int
as
begin
	If exists(
	Select * from tblInterViewPanel Where IntTeamID = @IntTeamID And IntPanelMemberID = @EmployeeID
	)
		return 1
	else
		return 0
	return 0
end

-- select dbo.fnEmpAlreadyExistsInTeam('INT-TEAM-00000001','EMP-00000001')

GO
-- drop proc spGetEmpAlreadyExistsInTeam
Create proc spGetEmpAlreadyExistsInTeam
@IntTeamID nvarchar(50),
@EmployeeID nvarchar(50)
as
begin
	Select dbo.fnEmpAlreadyExistsInTeam(@IntTeamID,@EmployeeID) as 'Exists'
end

-- exec spGetEmpAlreadyExistsInTeam 'INT-TEAM-00000001','EMP-00000001'

GO


GO
/*
Create view vwInterviewTeam
as
Select IntPanelID,IntTeamID,IntMemberTypeID,IntPanelMemberID,
from tblInterViewPanel Inner Join On 
*/



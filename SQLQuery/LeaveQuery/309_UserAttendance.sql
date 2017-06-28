
insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentLateAttCauseID',0)

GO

-- drop table tblLateAttCause
Create table tblLateAttCause(
LateAttCauseID nvarchar(50) primary key,
Cause nvarchar(200) unique(Cause),
IsDetailsMandatory bit default 0,
IsReportable bit default 0,
ReportableToDept nvarchar(50) foreign key references tblDepartment(DepartmentID),
IsActive bit default 1,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

-- drop proc spShowLateAttCauseList
Create proc spShowLateAttCauseList
as
begin
	Select distinct LateAttCauseID,Cause from tblLateAttCause Where IsActive=1 
	Order by Cause
end

GO

-- drop proc spInsertLateAttCause
Create proc spInsertLateAttCause
@Cause nvarchar(200),
@IsDetailsMandatory bit,
@IsReportable bit,
@ReportableToDept nvarchar(50),
@IsActive bit,
@EntryBy nvarchar(50)
as
begin
	Declare @LateAttCauseID as nvarchar(50)
	Declare @CurrentLateAttCauseID numeric(18,0)
	Declare @LateAttCauseIDPrefix as nvarchar(9)

	set @LateAttCauseIDPrefix='LATE-ATT-'

begin tran
	
	select @CurrentLateAttCauseID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentLateAttCauseID'
	
	set @CurrentLateAttCauseID=isnull(@CurrentLateAttCauseID,0)+1
	Select @LateAttCauseID=dbo.generateID(@LateAttCauseIDPrefix,@CurrentLateAttCauseID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	Insert Into tblLateAttCause(LateAttCauseID,Cause,IsDetailsMandatory,IsReportable,ReportableToDept,IsActive,EntryBy)
	Values(@LateAttCauseID,@Cause,@IsDetailsMandatory,@IsReportable,@ReportableToDept,@IsActive,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	update tblAppSettings set PropertyValue=@CurrentLateAttCauseID where PropertyName='CurrentLateAttCauseID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end
GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentUserAttendanceID',0)

GO

-- drop table tblUserAttendance
Create table tblUserAttendance(
UserAttendanceID nvarchar(50) primary key,
EmployeeID nvarchar(50) foreign key references tblEmployeeInfo(EmployeeID),
LogOnUserName nvarchar(50),
EntryTime datetime,
IpAddress nvarchar(50),
ValidEntryTime datetime,
ValidExitTime datetime,
WorkStation nvarchar(50),
LateAttCauseID nvarchar(50) foreign key references tblLateAttCause(LateAttCauseID),
Comment nvarchar(500),
IsOnLeave bit default 0,
LeaveReference nvarchar(50),
AttendanceStatus nvarchar(50),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

Go

-- drop proc spInsertUserAttendance
Create proc spInsertUserAttendance
@EmployeeID nvarchar(50),
@LogOnUserName nvarchar(50),
@EntryTime datetime,
@IpAddress nvarchar(50),
@ValidEntryTime datetime,
@ValidExitTime datetime,
@WorkStation nvarchar(50),
@LateAttCauseID nvarchar(50),
@Comment nvarchar(500),
@AttendanceStatus nvarchar(50),
@EntryBy nvarchar(50)
as
begin
	Declare @UserAttendanceID as nvarchar(50)
	Declare @CurrentUserAttendanceID numeric(18,0)
	Declare @UserAttendanceIDPrefix as nvarchar(8)

	set @UserAttendanceIDPrefix='USR-ATT-'

begin tran
	
	select @CurrentUserAttendanceID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentUserAttendanceID'
	
	set @CurrentUserAttendanceID=isnull(@CurrentUserAttendanceID,0)+1
	Select @UserAttendanceID=dbo.generateID(@UserAttendanceIDPrefix,@CurrentUserAttendanceID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	Insert into tblUserAttendance(UserAttendanceID,EmployeeID,LogOnUserName,EntryTime,IpAddress,WorkStation,LateAttCauseID,Comment,AttendanceStatus,EntryBy)
	Values(@UserAttendanceID,@EmployeeID,@LogOnUserName,@EntryTime,@IpAddress,@WorkStation,@LateAttCauseID,@Comment,@AttendanceStatus,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	update tblAppSettings set PropertyValue=@CurrentUserAttendanceID where PropertyName='CurrentUserAttendanceID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

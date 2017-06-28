
insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentLeaveTypeID',0)

GO

-- drop table tblLeaveType
Create table tblLeaveType(
LeaveTypeID nvarchar(50) primary key,
LeaveType nvarchar(50) unique(LeaveType),
OnlyForMale bit default 0,
OnlyForFemale bit default 0,
IsDedFrmLeaveBalance bit default 1,
IsActive bit default 1,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

-- Select * from tblLeaveType

GO

-- drop proc spInsertLeaveType
Create proc spInsertLeaveType
@LeaveType nvarchar(50),
@OnlyForMale bit,
@OnlyForFemale bit,
@IsDedFrmLeaveBalance bit,
@IsActive bit,
@EntryBy nvarchar(50)
as
begin
	Declare @LeaveTypeID as nvarchar(50)
	Declare @CurrentLeaveTypeID numeric(18,0)
	Declare @LeaveTypeIDPrefix as nvarchar(11)

	set @LeaveTypeIDPrefix='LEAVE-TYPE-'

begin tran
	
	select @CurrentLeaveTypeID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentLeaveTypeID'
	
	set @CurrentLeaveTypeID=isnull(@CurrentLeaveTypeID,0)+1
	Select @LeaveTypeID=dbo.generateID(@LeaveTypeIDPrefix,@CurrentLeaveTypeID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	Insert into tblLeaveType(LeaveTypeID,LeaveType,OnlyForMale,OnlyForFemale,IsActive,IsDedFrmLeaveBalance,EntryBy)
	Values(@LeaveTypeID,@LeaveType,@OnlyForMale,@OnlyForFemale,@IsActive,@IsDedFrmLeaveBalance,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	update tblAppSettings set PropertyValue=@CurrentLeaveTypeID where PropertyName='CurrentLeaveTypeID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

/* -- Need To Execute 
	exec spInsertLeaveType 'Annual Leave',1,1,1,'dsamaddar'
	exec spInsertLeaveType 'Maternity Leave',0,1,1,'dsamaddar'
	exec spInsertLeaveType 'Advance Leave',1,1,1,'dsamaddar'
*/

GO

-- drop proc spShowLeaveType
Create proc spShowLeaveType
as
begin
	Select LeaveTypeID,LeaveType,OnlyForMale,OnlyForFemale,IsDedFrmLeaveBalance,EntryBy,Convert(nvarchar,EntryDate,106) as 'EntryDate'
	from tblLeaveType Where IsActive=1 
	Order By LeaveType
end

-- exec spShowLeaveType

GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentLeaveRequestID',0)

GO

-- drop table tblLeaveRequest
Create table tblLeaveRequest(
LeaveRequestID nvarchar(50) primary key,
EmployeeID nvarchar(50) foreign key references tblEmployeeInfo(EmployeeID),
LeaveTypeID nvarchar(50) foreign key references tblLeaveType(LeaveTypeID),
LeaveFrom datetime,
LeaveTo datetime,
TotalDays int,
InBetweenHolidays int,
PurposeOfLeave nvarchar(500),
EmergencyAddress nvarchar(500),
EmergencyContactNo nvarchar(100),
EmergencyMailAddress nvarchar(100),
RecommenderID nvarchar(50) foreign key references tblEmployeeInfo(EmployeeID),
IsRecommended bit default 0,
RecommendedDate datetime,
ApproverID nvarchar(50) foreign key references tblEmployeeInfo(EmployeeID),
IsApproved bit default 0,
ApprovalDate datetime,
LeaveStatus nvarchar(50),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

-- drop proc spInsertLeaveRequest
Create proc spInsertLeaveRequest
@EmployeeID nvarchar(50),
@LeaveTypeID nvarchar(50),
@LeaveFrom datetime,
@LeaveTo datetime,
@TotalDays int,
@InBetweenHolidays int,
@PurposeOfLeave nvarchar(500),
@EmergencyAddress nvarchar(500),
@EmergencyContactNo nvarchar(100),
@EmergencyMailAddress nvarchar(100),
@RecommenderID nvarchar(50),
@ApproverID nvarchar(50),
@EntryBy nvarchar(50)
as
begin

	Declare @LeaveRequestID as nvarchar(50)
	Declare @CurrentLeaveRequestID numeric(18,0)
	Declare @LeaveRequestIDPrefix as nvarchar(10)

	set @LeaveRequestIDPrefix='LEAVE-REQ-'

begin tran
	
	select @CurrentLeaveRequestID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentLeaveRequestID'
	
	set @CurrentLeaveRequestID=isnull(@CurrentLeaveRequestID,0)+1
	Select @LeaveTypeID=dbo.generateID(@LeaveRequestIDPrefix,@CurrentLeaveRequestID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	Insert into tblLeaveRequest(LeaveRequestID,EmployeeID,LeaveTypeID,LeaveFrom,LeaveTo,TotalDays,InBetweenHolidays,
	PurposeOfLeave,EmergencyAddress,EmergencyContactNo,EmergencyMailAddress,RecommenderID,	ApproverID,EntryBy)
	Values(@LeaveRequestID,@EmployeeID,@LeaveTypeID,@LeaveFrom,@LeaveTo,@TotalDays,@InBetweenHolidays,
	@PurposeOfLeave,@EmergencyAddress,@EmergencyContactNo,@EmergencyMailAddress,@RecommenderID,	@ApproverID,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	update tblAppSettings set PropertyValue=@CurrentLeaveRequestID where PropertyName='CurrentLeaveRequestID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentLeaveBalanceID',0)

GO

Create table tblLeaveBalance(
LeaveBalanceID nvarchar(50) primary key,
EmployeeID nvarchar(50) foreign key references tblEmployeeInfo(EmployeeID),
TotalLeave int,
LeaveTaken int,
LeaveYear int,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

Create proc spShowLeaveBalanceByEmpID
@EmployeeID nvarchar(50),
@LeaveYear int
as
begin
	Select TotalLeave,LeaveTaken from tblLeaveBalance Where EmployeeID=@EmployeeID And LeaveYear=@LeaveYear
end

GO



CREATE proc [dbo].[spShowLeaveTypeGenderWise]
@EmployeeID nvarchar(50)
as
declare @Gender as nvarchar(50)
begin
	
	select @Gender=Gender from dbo.tblEmployeeBasicInfo where EmployeeID=@EmployeeID
	
	if @Gender='Male'
	begin
		Select LeaveTypeID,LeaveType
			from tblLeaveType Where IsActive=1 and OnlyForMale='True' 
			Order By LeaveType
	end
	if @Gender='Female'
	begin
		Select LeaveTypeID,LeaveType
			from tblLeaveType Where IsActive=1 and OnlyForFemale='True' 
			Order By LeaveType
	end
end


go


create proc spGetLeaveBalance
@EmployeeID nvarchar(50)
as
begin
	select TotalLeave,LeaveTaken from dbo.tblLeaveBalance where EmployeeID=@EmployeeID
end

--exec spGetLeaveBalance 'EMP-00000014'

go


create proc spChangeStatusForLeaveRequest
@LeaveRequestID nvarchar(50),
@TakenAction nvarchar(100)
as

begin
	update tblLeaveRequest set LeaveStatus=@TakenAction where LeaveRequestID=@LeaveRequestID
end

Go


CREATE Procedure spGetLeaveReqForApproval
@EmployeeID nvarchar(50)

as
begin
	select 
	LeaveRequestID,
   (select EmployeeName from tblEmployeeInfo where EmployeeID=tblLeaveRequest.EmployeeID) as EmployeeName
   ,tblLeaveRequest.EmployeeID as RequesterID
   ,convert(nvarchar,LeaveFrom,106) LeaveFrom
   ,convert(nvarchar,LeaveTo,106) LeaveTo
   ,TotalDays 
   ,InBetweenHolidays
   ,EntryDate
   ,(select EmployeeName from tblEmployeeInfo where EmployeeID=tblLeaveRequest.RecommenderID) as RecommenderName
   from tblLeaveRequest where (RecommenderID=@EmployeeID and LeaveStatus='Requested') or
   (ApproverID=@EmployeeID and (LeaveStatus='Requested' or LeaveStatus='Recommended')) 
end 

GO


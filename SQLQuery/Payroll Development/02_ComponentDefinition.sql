
Insert into tblAppSettings(PropertyName,PropertyValue)Values('CurrentComponentID',0)

GO

-- Select * from tblComponents
-- drop table tblComponents
Create table tblComponents(
ComponentID nvarchar(50) primary key,
ComponentName nvarchar(200) unique (ComponentName),
ComponentCode nvarchar(50),
CompValue numeric(18,2),
CompValDependentOn nvarchar(50),
CompRatio numeric(18,2),
Consolidated numeric(18,2),
IsGrossComponent bit default 0,
IsTaxable bit default 0,
TaxExemptionLimit numeric(18,2),
CompState nvarchar(50),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

alter proc spShowComponents
as
begin
	Select ComponentID,ComponentName,CompValue,ComponentCode,isnull(CompValDependentOn,'N\A') as 'CompValDependentOn',CompRatio,Consolidated,
	Case IsGrossComponent When 1 Then 'YES' else 'NO' end as 'GrossComponent',
	Case IsTaxable When 1 Then 'YES' else 'NO' end as 'Taxable',TaxExemptionLimit,CompState,
	EntryBy
	from tblComponents
end

-- exec spShowComponents

GO

alter proc spUpdateComponents
@ComponentID nvarchar(50),
@ComponentName nvarchar(200),
@ComponentCode nvarchar(50),
@CompValue numeric(18,2),
@CompValDependentOn nvarchar(50),
@CompRatio numeric(18,2),
@Consolidated numeric(18,2),
@IsGrossComponent bit,
@IsTaxable bit,
@TaxExemptionLimit numeric(18,2),
@CompState nvarchar(50),
@EntryBy nvarchar(50)
as
begin

	if @CompValDependentOn = 'N\A'
	begin
		set @CompValDependentOn = null 
	end

begin tran
	
	Update tblComponents Set ComponentName=@ComponentName,ComponentCode=@ComponentCode,CompValue=@CompValue,CompValDependentOn=@CompValDependentOn,
	CompRatio=@CompRatio,Consolidated=@Consolidated,IsGrossComponent=@IsGrossComponent,IsTaxable=@IsTaxable,
	TaxExemptionLimit=@TaxExemptionLimit,CompState=@CompState
	Where ComponentID=@ComponentID
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

alter proc spInsertComponents
@ComponentName nvarchar(200),
@ComponentCode nvarchar(50),
@CompValue numeric(18,2),
@CompValDependentOn nvarchar(50),
@CompRatio numeric(18,2),
@Consolidated numeric(18,2),
@IsGrossComponent bit,
@IsTaxable bit,
@TaxExemptionLimit numeric(18,2),
@CompState nvarchar(50),
@EntryBy nvarchar(50)
as
begin

	if @CompValDependentOn = 'N\A'
	begin
		set @CompValDependentOn = null 
	end

	Declare @ComponentID nvarchar(50)
	Declare @CurrentComponentID numeric(18,0)
	Declare @ComponentIDPrefix as nvarchar(4)

	set @ComponentIDPrefix='CMP-'

begin tran
	
	select @CurrentComponentID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentComponentID'
	
	set @CurrentComponentID=isnull(@CurrentComponentID,0)+1
	Select @ComponentID=dbo.generateID(@ComponentIDPrefix,@CurrentComponentID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblComponents(ComponentID,ComponentName,ComponentCode,CompValue,CompValDependentOn,CompRatio,Consolidated,IsGrossComponent,IsTaxable,TaxExemptionLimit,CompState,EntryBy)
	Values(@ComponentID,@ComponentName,@ComponentCode,@CompValue,@CompValDependentOn,@CompRatio,@Consolidated,@IsGrossComponent,@IsTaxable,@TaxExemptionLimit,@CompState,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	update tblAppSettings set PropertyValue=@CurrentComponentID where PropertyName='CurrentComponentID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

Insert into tblAppSettings(PropertyName,PropertyValue)Values('CurrentRoleComponentID',0)

GO

Select * from tblRoleWiseCompnent

-- drop table tblRoleWiseCompnent
Create table tblRoleWiseCompnent(
RoleComponentID nvarchar(50) primary key,
RoleName nvarchar(200) unique (RoleName),
Components nvarchar(1000),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

Create proc spGetRoleWiseComponentsList
@RoleComponentID nvarchar(50) 
as
begin
	
	Declare @Components as nvarchar(4000)
	Declare @ComponentTable table(
	ComponentID nvarchar(50)
	);
	
	Select @Components = Components from tblRoleWiseCompnent Where RoleComponentID=@RoleComponentID

	Insert into @ComponentTable(ComponentID)
	Select Value from dbo.Split(',',@Components)

	Select ComponentID,ComponentName from tblComponents Where ComponentID in (select distinct ComponentID from @ComponentTable)

end

-- exec spGetRoleWiseComponentsList 'R-CMP-00000003'

GO

Create proc spGetRoleWiseComponents
@RoleComponentID nvarchar(50) 
as
begin
	Select RoleName,Components from tblRoleWiseCompnent Where RoleComponentID=@RoleComponentID
end

GO

Create proc spShowRoleComponents
as
begin
	Select RoleComponentID,RoleName from tblRoleWiseCompnent order by RoleName 
end

GO

Create proc spUpdateRoleWiseComponent
@RoleComponentID nvarchar(50),
@RoleName nvarchar(200),
@Components nvarchar(1000)
as
begin
	
begin tran
	
	Update tblRoleWiseCompnent Set RoleName=@RoleName,Components=@Components 
	Where  RoleComponentID=@RoleComponentID
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end


GO

Create proc spInsertRoleWiseComponent
@RoleName nvarchar(200),
@Components nvarchar(1000),
@EntryBy nvarchar(50)
as
begin
	
	Declare @RoleComponentID nvarchar(50)
	Declare @CurrentRoleComponentID numeric(18,0)
	Declare @RoleComponentIDPrefix as nvarchar(6)

	set @RoleComponentIDPrefix='R-CMP-'

begin tran
	
	select @CurrentRoleComponentID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentRoleComponentID'
	
	set @CurrentRoleComponentID=isnull(@CurrentRoleComponentID,0)+1
	Select @RoleComponentID=dbo.generateID(@RoleComponentIDPrefix,@CurrentRoleComponentID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblRoleWiseCompnent(RoleComponentID,RoleName,Components,EntryBy)
	Values(@RoleComponentID,@RoleName,@Components,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	update tblAppSettings set PropertyValue=@CurrentRoleComponentID where PropertyName='CurrentRoleComponentID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

Insert into tblAppSettings(PropertyName,PropertyValue)Values('CurrentEmpComponentID',0)


GO

-- drop table tblEmployeeWiseComponents
Create table tblEmployeeWiseComponents(
EmpComponentID nvarchar(50) primary key,
EmployeeID nvarchar(50) foreign key references tblEmployeeInfo(EmployeeID),
RoleComponentID nvarchar(50)  foreign key references tblRoleWiseCompnent(RoleComponentID),
ComponentID nvarchar(50) foreign key references tblComponents(ComponentID),
CompValue numeric(18,2),
CompValDependentOn nvarchar(50),
CompRatio numeric(18,2),
Consolidated numeric(18,2),
IsGrossComponent bit,
IsTaxable bit,
TaxExemptionLimit numeric(18,2),
IsActive bit default 1,
CompState nvarchar(50),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

-- Select * from tblEmployeeWiseComponents

GO

alter proc spUpdateEmpWiseComponent
@EmpComponentID nvarchar(50),
@CompValue numeric(18,2),
@CompValDependentOn nvarchar(50),
@CompRatio numeric(18,2),
@Consolidated numeric(18,2),
@IsGrossComponent bit,
@IsTaxable bit,
@TaxExemptionLimit numeric(18,2),
@IsActive bit,
@CompState nvarchar(50)
as
begin
	Update tblEmployeeWiseComponents Set CompValue=@CompValue,CompValDependentOn=@CompValDependentOn,CompRatio=@CompRatio,
	Consolidated=@Consolidated,IsGrossComponent=@IsGrossComponent,IsTaxable=@IsTaxable,TaxExemptionLimit=@TaxExemptionLimit,
	IsActive=@IsActive,@CompState=@CompState
	Where EmpComponentID=@EmpComponentID
end

GO

alter proc spGetDetailsByEmpWiseComponentID
@EmpComponentID nvarchar(50)
as
begin
	Select C.ComponentName as 'ComponentName',EWC.CompValue as 'CompValue',Isnull(EWC.CompValDependentOn,'N\A') as 'CompValDependentOn',EWC.CompRatio as 'CompRatio',
	EWC.Consolidated as 'Consolidated',EWC.IsGrossComponent as 'IsGrossComponent',EWC.IsTaxable as 'IsTaxable',EWC.TaxExemptionLimit as 'TaxExemptionLimit',EWC.IsActive as 'IsActive',
	EWC.CompState as 'CompState'
	from tblEmployeeWiseComponents EWC left join tblComponents C On EWC.ComponentID=C.ComponentID Where EmpComponentID=@EmpComponentID
end

-- exec spGetDetailsByEmpWiseComponentID 'E-CMP-00000016'

GO

Create proc spShowEmpWiseComponents
@EmployeeID nvarchar(50)
as
begin
	Select 
	(Select RoleName from tblRoleWiseCompnent RWC Where RWC.RoleComponentID=EC.RoleComponentID) as 'Role',
	EC.EmpComponentID as 'EmpComponentID',	EC.ComponentID as 'ComponentID',
	C.ComponentName as 'Component' from tblEmployeeWiseComponents EC left join tblComponents C On EC.ComponentID=C.ComponentID
	Where EmployeeID=@EmployeeID
end

GO


alter proc spInsertEmployeeWiseComponents
@EmployeeID nvarchar(50),
@RoleComponentID nvarchar(50),
@ComponentIDList nvarchar(4000),
@EntryBy nvarchar(50)
as
begin
	
	Declare @EmpComponentID nvarchar(50)
	Declare @CurrentEmpComponentID numeric(18,0)
	Declare @EmpComponentIDPrefix as nvarchar(6)

	set @EmpComponentIDPrefix='E-CMP-'

	Declare @CompTable table(
	ComponentID nvarchar(50),
	ComponentName nvarchar(200),
	CompValue numeric(18,2),
	CompValDependentOn nvarchar(50),
	CompRatio numeric(18,2),
	Consolidated numeric(18,2),
	IsGrossComponent bit,
	IsTaxable bit,
	TaxExemptionLimit numeric(18,2),
	CompState nvarchar(50),
	IsTaken bit default 0
	)

	Declare @ComponentID as nvarchar(50)
	Declare @ComponentName as nvarchar(200)
	Declare @CompValue as numeric(18,2) 
	Declare @CompValDependentOn as nvarchar(50)
	Declare @CompRatio as numeric(18,2)
	Declare @Consolidated as numeric(18,2)
	Declare @IsGrossComponent as bit
	Declare @IsTaxable as bit
	Declare @TaxExemptionLimit numeric(18,2)
	Declare @CompState as nvarchar(50)

	Declare @ComponentTable table(
	ComponentID nvarchar(50)
	);
	
	Declare @Count as int
	Declare @NCount as int
	Set @Count=1
	Set @NCount=0
	
begin tran

	Insert into @ComponentTable(ComponentID)
	Select Value from dbo.Split(',',@ComponentIDList)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into @CompTable(ComponentID,ComponentName,CompValue,CompValDependentOn,CompRatio,Consolidated,IsGrossComponent,IsTaxable,TaxExemptionLimit,CompState)
	Select ComponentID,ComponentName,CompValue,CompValDependentOn,CompRatio,Consolidated,IsGrossComponent,IsTaxable,TaxExemptionLimit,CompState from tblComponents
	Where ComponentID in (Select distinct ComponentID from @ComponentTable)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Select @NCount=Count(*) from @CompTable

	select @CurrentEmpComponentID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentEmpComponentID'
	
	While @Count <= @NCount
	begin

			Select top 1 @ComponentID=ComponentID,@ComponentName=ComponentName,@CompValue=CompValue,@CompValDependentOn=CompValDependentOn,
			@CompRatio=CompRatio,@Consolidated=Consolidated,@IsGrossComponent=IsGrossComponent,@IsTaxable=IsTaxable,
			@TaxExemptionLimit=TaxExemptionLimit,@CompState=CompState
			from @CompTable Where IsTaken=0
					
			set @CurrentEmpComponentID=isnull(@CurrentEmpComponentID,0)+1
			Select @EmpComponentID=dbo.generateID(@EmpComponentIDPrefix,@CurrentEmpComponentID,8)		
			IF (@@ERROR <> 0) GOTO ERR_HANDLER

			if not exists(Select * from tblEmployeeWiseComponents Where EmployeeID=@EmployeeID And ComponentID=@ComponentID)
			begin
				Insert into tblEmployeeWiseComponents(EmpComponentID,EmployeeID,RoleComponentID,ComponentID,CompValue,CompValDependentOn,CompRatio,
				Consolidated,IsGrossComponent,IsTaxable,TaxExemptionLimit,CompState,EntryBy)
				Values(@EmpComponentID,@EmployeeID,@RoleComponentID,@ComponentID,@CompValue,@CompValDependentOn,@CompRatio,
				@Consolidated,@IsGrossComponent,@IsTaxable,@TaxExemptionLimit,@CompState,@EntryBy)
			end

			Update @CompTable Set IsTaken=1 Where ComponentID=@ComponentID

			Set @Count = @Count + 1
			Set @ComponentID = ''
			Set @ComponentName = ''
			Set @CompValue=0
			Set @CompValDependentOn=''
			Set @CompRatio=0
			Set @Consolidated=0
			Set @IsGrossComponent=0
			Set @IsTaxable=0
			Set @TaxExemptionLimit = 0
			Set @CompState = ''

	end

	update tblAppSettings set PropertyValue=@CurrentEmpComponentID where PropertyName='CurrentEmpComponentID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

GO
-- Select * from tblEmpSalSummary

-- drop table tblEmpSalSummary
Create table tblEmpSalSummary(
EmpSalSummaryID nvarchar(50) primary key,
EmployeeID nvarchar(50) foreign key references tblEmployeeInfo(EmployeeID),
DepartmentID nvarchar(50) foreign key references tblDepartment(DepartmentID),
DesignationID nvarchar(50) foreign key references tblDesignation(DesignationID),
ULCBranchID nvarchar(50) foreign key references tblULCBranch(ULCBranchID),
BankID nvarchar(50) foreign key references tblBank(BankID),
BranchID nvarchar(50) foreign key references tblBranch(BranchID),
BankAccountNo nvarchar(50),
BasicSalary numeric(18,2),
SalaryYear int,
SalaryMonth int,
ProcessingEntryPoint nvarchar(50),
PositiveComponent numeric(18,2),
NegativeComponent numeric(18,2),
HiddenComponent numeric(18,2),
LoanSettlement numeric(18,2),
TaxDeduction numeric(18,2),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

--Select * from tblULCBranch  

alter proc spUpdateEmpSalSummary
@EmpSalSummaryID nvarchar(50),
@EmployeeID nvarchar(50),
@DepartmentID nvarchar(50),
@DesignationID nvarchar(50),
@ULCBranchID nvarchar(50),
@BankID nvarchar(50),
@BranchID nvarchar(50),
@BankAccountNo nvarchar(50),
@BasicSalary numeric(18,2),
@SalaryYear int,
@SalaryMonth int,
@ProcessingEntryPoint nvarchar(50),
@PositiveComponent numeric(18,2),
@NegativeComponent numeric(18,2),
@HiddenComponent numeric(18,2),
@LoanSettlement numeric(18,2),
@TaxDeduction numeric(18,2),
@EntryBy nvarchar(50)
as
begin

begin tran

	Update tblEmpSalSummary Set EmployeeID=@EmployeeID,DepartmentID=@DepartmentID,DesignationID=@DesignationID,
	ULCBranchID=@ULCBranchID,BankID=@BankID,BranchID=@BranchID,BankAccountNo=@BankAccountNo,BasicSalary=@BasicSalary,
	SalaryYear=@SalaryYear,SalaryMonth=@SalaryMonth,ProcessingEntryPoint=@ProcessingEntryPoint,PositiveComponent=@PositiveComponent,
	NegativeComponent=@NegativeComponent,HiddenComponent=@HiddenComponent,LoanSettlement=@LoanSettlement,TaxDeduction=@TaxDeduction,
	EntryBy=@EntryBy
	Where EmpSalSummaryID=@EmpSalSummaryID
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

alter proc spInsertEmpSalSummary
@EmployeeID nvarchar(50),
@DepartmentID nvarchar(50),
@DesignationID nvarchar(50),
@ULCBranchID nvarchar(50),
@BankID nvarchar(50),
@BranchID nvarchar(50),
@BankAccountNo nvarchar(50),
@BasicSalary numeric(18,2),
@SalaryYear int,
@SalaryMonth int,
@ProcessingEntryPoint nvarchar(50),
@PositiveComponent numeric(18,2),
@NegativeComponent numeric(18,2),
@HiddenComponent numeric(18,2),
@LoanSettlement numeric(18,2),
@TaxDeduction numeric(18,2),
@EntryBy nvarchar(50)
as
begin
	
	Declare @EmpSalSummaryID nvarchar(50)
	Declare @CurrentEmpSalSummaryID numeric(18,0)
	Declare @EmpSalSummaryIDPrefix as nvarchar(8)

	set @EmpSalSummaryIDPrefix='E-SAL-S-'

begin tran
	
	select @CurrentEmpSalSummaryID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentEmpSalSummaryID'
	
	set @CurrentEmpSalSummaryID=isnull(@CurrentEmpSalSummaryID,0)+1
	Select @EmpSalSummaryID=dbo.generateID(@EmpSalSummaryIDPrefix,@CurrentEmpSalSummaryID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblEmpSalSummary(EmpSalSummaryID,EmployeeID,DepartmentID,DesignationID,ULCBranchID,BankID,BranchID,BankAccountNo,BasicSalary,SalaryYear,SalaryMonth,ProcessingEntryPoint,PositiveComponent,NegativeComponent,HiddenComponent,LoanSettlement,TaxDeduction,EntryBy)
	Values(@EmpSalSummaryID,@EmployeeID,@DepartmentID,@DesignationID,@ULCBranchID,@BankID,@BranchID,@BankAccountNo,@BasicSalary,@SalaryYear,@SalaryMonth,@ProcessingEntryPoint,@PositiveComponent,@NegativeComponent,@HiddenComponent,@LoanSettlement,@TaxDeduction,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	update tblAppSettings set PropertyValue=@CurrentEmpSalSummaryID where PropertyName='CurrentEmpSalSummaryID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

Insert into tblAppSettings(PropertyName,PropertyValue)Values('CurrentEmpSalaryID',0)


GO

-- drop table tblEmpSalary
Create table tblEmpSalary(
EmpSalaryID nvarchar(50) primary key,
EmployeeID nvarchar(50) foreign key references tblEmployeeInfo(EmployeeID),
EmpSalSummaryID nvarchar(50) foreign key references tblEmpSalSummary(EmpSalSummaryID),
ComponentID nvarchar(50) foreign key references tblComponents(ComponentID),
SalValue numeric(18,2),
CompStatus nvarchar(50),
IsGrossComponent bit,
SalaryMonth int,
SalaryYear int,
ProcessingEntryPoint nvarchar(50),
ProcessingDate datetime,
IsActive bit default 0,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

Select * from tblEmpSalary

GO

-- drop proc spShowSalaryByCompStatus
alter proc spShowEmpSalaryByCompStatus
@EmployeeID nvarchar(50),
@CompStatus nvarchar(50),
@SalaryYear int,
@SalaryMonth int
as
begin
	Select C.ComponentName,ES.SalValue from tblEmpSalary ES left Join tblComponents C On ES.ComponentID=C.ComponentID 
	Where ES.SalaryYear=@SalaryYear And ES.SalaryMonth=@SalaryMonth And ES.CompStatus like '%'+@CompStatus+'%'
	order by ES.SalValue desc
end

-- exec spShowSalaryByCompStatus 'EMP-00000020','Positive',2013,9

GO

alter proc spInsertEmpSalary
@EmployeeID nvarchar(50),
@EmpSalSummaryID nvarchar(50),
@ComponentID nvarchar(50),
@SalValue numeric(18,2),
@CompStatus nvarchar(50),
@IsGrossComponent bit,
@SalaryMonth int,
@SalaryYear int,
@ProcessingEntryPoint nvarchar(50),
@ProcessingDate datetime,
@EntryBy nvarchar(50)
as
begin

	Declare @EmpSalaryID nvarchar(50)
	Declare @CurrentEmpSalaryID numeric(18,0)
	Declare @EmpSalaryIDPrefix as nvarchar(4)

	set @EmpSalaryIDPrefix='SAL-'

begin tran
	
	select @CurrentEmpSalaryID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentEmpSalaryID'
	
	set @CurrentEmpSalaryID=isnull(@CurrentEmpSalaryID,0)+1
	Select @EmpSalaryID=dbo.generateID(@EmpSalaryIDPrefix,@CurrentEmpSalaryID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblEmpSalary(EmpSalaryID,EmployeeID,EmpSalSummaryID,ComponentID,SalValue,CompStatus,IsGrossComponent,SalaryMonth,SalaryYear,ProcessingEntryPoint,ProcessingDate,EntryBy)
	Values(@EmpSalaryID,@EmployeeID,@EmpSalSummaryID,@ComponentID,@SalValue,@CompStatus,@IsGrossComponent,@SalaryMonth,@SalaryYear,@ProcessingEntryPoint,@ProcessingDate,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	update tblAppSettings set PropertyValue=@CurrentEmpSalaryID where PropertyName='CurrentEmpSalaryID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

-- exec spProcessSalary 9,2013,'9/24/2013','EMP-00000020',1,1,1,0,'dsamaddar'

alter proc spProcessSalary
@SalaryMonth int,
@SalaryYear int,
@EffectiveDate datetime,
@EmployeeIDList nvarchar(4000),
@ProcessWithSalary bit,
@ProcessWithTaxDeduction bit,
@ProcessWithFestivalBonus bit,
@ProcessWithPerformanceBonus bit,
@EntryBy nvarchar(50)
as
begin
	
	Declare @EmployeeID as nvarchar(50)
	Declare @BasicSalary as numeric(18,2)
	Declare @Count as int
	Declare @NCount as int
	Declare @EWCCount as int
	Declare @EWCNCount as int
	Declare @ComponentID as nvarchar(50)
	Declare @CompValue as numeric(18,2) 
	Declare @CompValDependentOn as nvarchar(50)
	Declare @CompRatio as numeric(18,2)
	Declare @Consolidated as numeric(18,2)
	Declare @IsGrossComponent as bit
	Declare @IsTaxable as bit
	Declare @TaxExemptionLimit numeric(18,2)
	Declare @CompState as nvarchar(50)
	Declare @ItemizedSalary as numeric(18,2)
	Declare @EntryPoint as nvarchar(50)
	Declare @GrossCompValue as numeric(18,2)

	Declare @DepartmentID as nvarchar(50)
	Declare @DesignatoinID as nvarchar(50)
	Declare @ULCBranchID as nvarchar(50)
	Declare @BankID as nvarchar(50)
	Declare @BranchID as nvarchar(50)
	Declare @BankAccountNo as nvarchar(50)

	Declare @PositiveComponent as numeric(18,2)
	Declare @NegativeComponent as numeric(18,2)
	Declare @HiddenComponent as numeric(18,2)
	Declare @LoanSettlement as numeric(18,2)
	Declare @TaxDeduction as numeric(18,2)

	Set @PositiveComponent = 0
	Set @NegativeComponent = 0
	Set @HiddenComponent = 0
	Set @LoanSettlement = 0
	Set @TaxDeduction = 0

	Declare @EmpTbl as table(
	EmployeeID nvarchar(50),
	DepartmentID nvarchar(50),
	DesignatoinID nvarchar(50),
	ULCBranchID nvarchar(50),
	BankID nvarchar(50),
	BranchID nvarchar(50),
	BankAccountNo nvarchar(50),
	BasicSalary numeric(18,2),
	IsTaken bit default 0
	);

	Declare @EmpList as table(
	EmployeeID nvarchar(50)
	);

	Declare @EmpWComp as table(
	EmployeeID nvarchar(50),
	ComponentID nvarchar(50),
	CompValue numeric(18,2),
	CompValDependentOn nvarchar(50),
	CompRatio numeric(18,2),
	Consolidated numeric(18,2),
	IsGrossComponent bit,
	IsTaxable bit,
	TaxExemptionLimit numeric(18,2),
	CompState nvarchar(50),
	IsTaken bit default 0
	)

	Declare @EmpSalSummaryID nvarchar(50)
	Declare @CurrentEmpSalSummaryID numeric(18,0)
	Declare @EmpSalSummaryIDPrefix as nvarchar(8)

	set @EmpSalSummaryIDPrefix='E-SAL-S-'
		
	Set @Count = 1
	Set @NCount = 0
	Set @EWCCount = 1
	Set @EWCNCount = 0
	Set @ItemizedSalary = 0
	Set @EntryPoint = convert(nvarchar,getdate(),120)
	Set @GrossCompValue = 0

	Insert into @EmpList(EmployeeID)
	Select Value from dbo.Split(',',@EmployeeIDList)

	Insert into @EmpTbl(EmployeeID,DesignatoinID,DepartmentID,ULCBranchID,BankID,BranchID,BankAccountNo,BasicSalary)
	Select distinct EmployeeID,OfficialDesignationID,DepartmentID,ULCBranchID,BankID,BranchID,BankAccountNo,isnull(BasicSalary,0) from tblEmployeeInfo Where
	EmployeeID in ( Select distinct EmployeeID from @EmpList ) And isActive =1
	
begin tran

	select @CurrentEmpSalSummaryID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentEmpSalSummaryID'

	Select @NCount=Count(*) from @EmpTbl
	
	While @Count <= @NCount
	begin
		Select top 1 @EmployeeID=EmployeeID,@BasicSalary=BasicSalary,@DepartmentID=DepartmentID,@DesignatoinID=DesignatoinID,
		@ULCBranchID=ULCBranchID,@BankID=BankID,@BranchID=BranchID,@BankAccountNo=BankAccountNo from @EmpTbl Where IsTaken=0
		
		-- Getting EmployeeWise Components
		Insert into @EmpWComp(EmployeeID,ComponentID,CompValue,CompValDependentOn,CompRatio,Consolidated,IsGrossComponent,IsTaxable,TaxExemptionLimit,CompState)
		Select EmployeeID,ComponentID,CompValue,isnull(CompValDependentOn,'N\A'),CompRatio,Consolidated,IsGrossComponent,IsTaxable,TaxExemptionLimit,CompState
		from tblEmployeeWiseComponents Where EmployeeID=@EmployeeID And IsActive=1

		Select @EWCNCount=count(*) from @EmpWComp Where EmployeeID=@EmployeeID And IsTaken=0

		-- Summary Input
		set @CurrentEmpSalSummaryID=isnull(@CurrentEmpSalSummaryID,0)+1
		Select @EmpSalSummaryID=dbo.generateID(@EmpSalSummaryIDPrefix,@CurrentEmpSalSummaryID,8)		
		IF (@@ERROR <> 0) GOTO ERR_HANDLER

		Insert into tblEmpSalSummary(EmpSalSummaryID)Values(@EmpSalSummaryID)
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
		
		-- Iterate On Each Components
		While @EWCCount <= @EWCNCount
		begin
			Select top 1 @ComponentID=ComponentID,@CompValue=CompValue,@CompValDependentOn=CompValDependentOn,@CompRatio=CompRatio,
			@Consolidated=Consolidated,@IsGrossComponent=IsGrossComponent,@IsTaxable=IsTaxable,@TaxExemptionLimit=TaxExemptionLimit,@CompState=CompState
			from @EmpWComp Where EmployeeID=@EmployeeID And IsTaken=0
			IF (@@ERROR <> 0) GOTO ERR_HANDLER

			-- chq for components dependent on basic salary.
			if @CompValDependentOn = 'Basic'
			begin
				--Print 'CV:' + Convert(nvarchar,@CompValue) + ' Basic: '+ convert(nvarchar, @BasicSalary) 
				Set @ItemizedSalary = (@CompValue+@BasicSalary)*(@CompRatio/100) + @Consolidated
			end				
			-- Chq for Gross Component..
			else if @IsGrossComponent = 1 And @CompValDependentOn='N\A' 
				Set @ItemizedSalary = ( @CompValue*(@CompRatio/100) )  + @Consolidated
			else if @CompValDependentOn='Gross'
				begin
					Select @GrossCompValue=sum(SalValue) from tblEmpSalary Where IsGrossComponent=1 And ProcessingEntryPoint=@EntryPoint And SalaryYear=@SalaryYear And SalaryMonth=@SalaryMonth 
					Set @ItemizedSalary = (@CompValue+@GrossCompValue)*(@CompRatio/100) + @Consolidated
				end
			else
				Set @ItemizedSalary = ( @CompValue*(@CompRatio/100) )  + @Consolidated
					
			-- Chq for dependent on Gross Component..
			-- chq. for General components -independent.
			
			if @CompState = 'Positive' And @ProcessWithSalary = 1
			begin
				Set @PositiveComponent = @PositiveComponent + @ItemizedSalary
				exec spInsertEmpSalary @EmployeeID,@EmpSalSummaryID,@ComponentID,@ItemizedSalary,@CompState,@IsGrossComponent,@SalaryMonth,@SalaryYear,@EntryPoint,@EffectiveDate,@EntryBy
				IF (@@ERROR <> 0) GOTO ERR_HANDLER
			end
			else if  @CompState = 'Negative' And @ProcessWithSalary = 1
			begin
				Set @NegativeComponent = @NegativeComponent + @ItemizedSalary
				exec spInsertEmpSalary @EmployeeID,@EmpSalSummaryID,@ComponentID,@ItemizedSalary,@CompState,@IsGrossComponent,@SalaryMonth,@SalaryYear,@EntryPoint,@EffectiveDate,@EntryBy
				IF (@@ERROR <> 0) GOTO ERR_HANDLER
			end
			else if @CompState = 'Hidden' And @ProcessWithSalary = 1
			begin
				Set @HiddenComponent = @HiddenComponent + @ItemizedSalary
				exec spInsertEmpSalary @EmployeeID,@EmpSalSummaryID,@ComponentID,@ItemizedSalary,@CompState,@IsGrossComponent,@SalaryMonth,@SalaryYear,@EntryPoint,@EffectiveDate,@EntryBy
				IF (@@ERROR <> 0) GOTO ERR_HANDLER
			end
			else if @CompState = 'Festival Bonus'
			begin
				if @ProcessWithFestivalBonus = 1 
				begin
					Set @PositiveComponent = @PositiveComponent + @ItemizedSalary
					exec spInsertEmpSalary @EmployeeID,@EmpSalSummaryID,@ComponentID,@ItemizedSalary,@CompState,@IsGrossComponent,@SalaryMonth,@SalaryYear,@EntryPoint,@EffectiveDate,@EntryBy
				IF (@@ERROR <> 0) GOTO ERR_HANDLER
				end
			end
			else if  @CompState = 'Performance Bonus'
			begin
				if @ProcessWithPerformanceBonus = 1 
				begin
					Set @PositiveComponent = @PositiveComponent + @ItemizedSalary
					exec spInsertEmpSalary @EmployeeID,@EmpSalSummaryID,@ComponentID,@ItemizedSalary,@CompState,@IsGrossComponent,@SalaryMonth,@SalaryYear,@EntryPoint,@EffectiveDate,@EntryBy
					IF (@@ERROR <> 0) GOTO ERR_HANDLER
				end
			end

			Update @EmpWComp Set IsTaken=1 Where EmployeeID=@EmployeeID And ComponentID=@ComponentID And IsTaken=0
			IF (@@ERROR <> 0) GOTO ERR_HANDLER

			Set @ComponentID = ''
			Set @CompValue=0
			Set @CompValDependentOn=''
			Set @CompRatio=0
			Set @Consolidated=0
			Set @IsGrossComponent=0
			Set @IsTaxable=0
			Set @TaxExemptionLimit = 0
			Set @CompState = ''
			Set @GrossCompValue = 0
			Set @EWCCount = @EWCCount + 1
		end
		-- End of Iterate On Each Components

		--exec spInsertEmpSalSummary @EmployeeID,@DepartmentID,@DesignatoinID,@ULCBranchID,@BankID,@BranchID,@BankAccountNo,@BasicSalary,@SalaryYear,@SalaryMonth,@PositiveComponent,@NegativeComponent,@HiddenComponent,@LoanSettlement,@TaxDeduction,@EntryBy
		exec spUpdateEmpSalSummary @EmpSalSummaryID,@EmployeeID,@DepartmentID,@DesignatoinID,@ULCBranchID,@BankID,@BranchID,@BankAccountNo,@BasicSalary,@SalaryYear,@SalaryMonth,@EntryPoint,@PositiveComponent,@NegativeComponent,@HiddenComponent,@LoanSettlement,@TaxDeduction,@EntryBy
		IF (@@ERROR <> 0) GOTO ERR_HANDLER

		Update @EmpTbl Set IsTaken=1 Where EmployeeID=@EmployeeID
		IF (@@ERROR <> 0) GOTO ERR_HANDLER

		update tblAppSettings set PropertyValue=@CurrentEmpSalSummaryID where PropertyName='CurrentEmpSalSummaryID'
		IF (@@ERROR <> 0) GOTO ERR_HANDLER

		Set @EmployeeID = ''
		Set @BasicSalary = 0
		Set @EWCNCount = 0
		Set @EWCCount = 1
		Set @Count = @Count + 1

		Set @PositiveComponent = 0
		Set @NegativeComponent = 0
		Set @HiddenComponent = 0
		Set @LoanSettlement = 0

		Set @DepartmentID = ''
		Set @DesignatoinID = ''
		Set @ULCBranchID = ''
		Set @BankID = ''
		Set @BranchID = ''
		Set @BankAccountNo = ''
		Set @EmpSalSummaryID = ''


	end
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0
ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

Insert into tblAppSettings(PropertyName,PropertyValue)Values('CurrentEmpSalSummaryID',0)

GO




alter proc spGetEmpWiseLoanAcc
@EmployeeID nvarchar(50)
as
begin
	Select EmpLoanAccountID,EmployeeID,BenefitID,BenefitType,LoanAmount,Tenure,InterestRate,
	Convert(nvarchar,ReimbursementDate,106) as 'ReimbursementDate',
	Case IsAdjustableFromSalary When 1 Then 'YES' else 'NO' end as 'SalaryAdjustment',
	Case IsAbatementApplicable When 1 Then 'YES' else 'NO' end as 'AbatementApplicable',
	Case IsDepreciatedAutomatically When 1 Then 'YES' else 'NO' end as 'Depreciable',
	LoanStatus
	from tblEmpLoanAccount 	Where EmployeeID=@EmployeeID 
end

-- exec spGetEmpWiseLoanAcc 'EMP-00000022'

GO

alter proc spGetEmpLoanAmtzInfo
@EmpLoanAccountID nvarchar(50)
as
begin
	Select AmortizationID,Convert(nvarchar,PaymentDate,106) as 'PaymentDate',PaymentAmount,PrincipalPayment,InterestPayment,Abatement,Outstanding,
	Case IsAdjusted When 1 Then 'YES' else 'NO' end as 'IsAdjusted',PrincipalAdjusted,InterestAdjusted,Convert(nvarchar,AdjustmentDate,106) as 'AdjustmentDate',
	isnull(PmntStatus,'N\A') as 'PmntStatus'
	from tblLoanAmortization Where IsActive=1 And IsClosed=0 And EmpLoanAccountID=@EmpLoanAccountID
	order by convert(datetime,PaymentDate) asc
end

-- exec spGetEmpLoanAmtzInfo 'L-ACC-00000005'

Select * from tblLoanAmortization Where EmpLoanAccountID='L-ACC-00000002'

GO

alter proc spHRLoanDayEnd
@DayEndDate datetime
as
begin
	
	Declare @EmpLoanAccountID as nvarchar(50)
	Declare @IsAbatementApplicable as bit
	Declare @IsDepreciatedAutomatically as bit

	Declare @EmpLAcc table(
	EmpLoanAccountID nvarchar(50),
	IsAbatementApplicable bit,
	IsDepreciatedAutomatically bit,
	Taken bit default 0
	);

begin tran

	Insert into @EmpLAcc(EmpLoanAccountID,IsAbatementApplicable,	IsDepreciatedAutomatically)
	Select EmpLoanAccountID,IsAbatementApplicable,IsDepreciatedAutomatically from tblEmpLoanAccount Where LoanStatus='Active'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Declare @Count as int
	Declare @NCount as int
	Set @Count = 1
	Set @NCount = 0

	Select @NCount=count(*) from @EmpLAcc

	While @Count <= @NCount
	begin
		Select top 1 @EmpLoanAccountID=EmpLoanAccountID,@IsAbatementApplicable=IsAbatementApplicable,@IsDepreciatedAutomatically=IsDepreciatedAutomatically
		from @EmpLAcc Where Taken=0

		if @IsDepreciatedAutomatically = 1 
		begin
			Update tblLoanAmortization Set PmntStatus='Depreciated',PrincipalAdjusted=PrincipalPayment , InterestAdjusted=InterestPayment,IsAdjusted=1,AdjustmentDate=@DayEndDate,
			AdjustmentRemarks='Depreciated By System'
			Where PmntStatus in ('Receivable','Due','Overdue') And PaymentDate <= @DayEndDate
			And EmpLoanAccountID=@EmpLoanAccountID
			IF (@@ERROR <> 0) GOTO ERR_HANDLER
		end

		update @EmpLAcc Set Taken=1 Where EmpLoanAccountID=@EmpLoanAccountID
		IF (@@ERROR <> 0) GOTO ERR_HANDLER

		Set @Count = @Count + 1

		Set @EmpLoanAccountID = ''
		Set @IsAbatementApplicable = 0
		Set @IsDepreciatedAutomatically = 0 
		
	end
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

-- Select * from tblLoanAmortization
-- Select * from tblEmpLoanAccount 

-- exec spHRLoanDayEnd '10/1/2013'
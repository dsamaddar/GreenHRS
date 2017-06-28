

Create table tblProvidentFund(
ProvidentFundID nvarchar(50) primary key,
EmployeeID nvarchar(50) foreign key references tblEmployeeInfo(EmployeeID),
SalMonth int,
SalYear int,
EmpContribution numeric(18,2),
CreditedIntEmp numeric(18,2),
ComContribution numeric(18,2),
CreditedIntCom numeric(18,2),
ProcessDate datetime,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

Select * from tblProvidentFund

GO

Create table tblLoanAgainstProvidentFund(
LoanProvidentFundID nvarchar(50) primary key,
EmployeeID nvarchar(50) foreign key references tblEmployeeInfo(EmployeeID),
LoanAmount numeric(18,2),
IsApproved bit default 0,
ApprovedBy nvarchar(50),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

/*Gratuity Calculation*/
-- drop proc spGratuityCalculation
alter proc spGratuityCalculation
@AsOnDate datetime
as
begin

	Select EmployeeID,EmployeeName,EmpCode,
	isnull((select DesignationName from tblDesignation D Where D.DesignationID = tblEmployeeInfo.OfficialDesignationID),'N\A') as 'Designatgion',
	isnull((Select ULCBranchName from tblULCBranch B Where B.ULCBranchID= tblEmployeeInfo.ULCBranchID),'N\A') as 'Branch',
	isnull(BasicSalary,0) as 'BasicSalary',
	
	convert(nvarchar,ConfirmationDate,106) as 'ConfirmedOn',
	case When  dbo.fnGetAgeCY(ConfirmationDate,@AsOnDate) < 0 Then 0 Else dbo.fnGetAgeCY(ConfirmationDate,@AsOnDate) end as 'Year',
	dbo.fnGetAgeCM(ConfirmationDate,@AsOnDate) as 'Month',
	dbo.fnGetRateOfGratuity(dbo.fnGetAgeCY(ConfirmationDate,@AsOnDate),	dbo.fnGetAgeCM(ConfirmationDate,@AsOnDate)) as 'RateOfGratuity',
	dbo.fnGetGratuityValue(dbo.fnGetAgeCY(ConfirmationDate,@AsOnDate),
	dbo.fnGetAgeCM(ConfirmationDate,@AsOnDate),isnull(BasicSalary,0)) as 'GratuityValue'
	from tblEmployeeInfo Where 
	ConfirmationDate is not null 
	And ConfirmationDate <= @AsOnDate
	--And datediff(yy,ConfirmationDate,@AsOnDate)>5 
	And isActive=1  And IsResigned=0 And ConfirmationDate > '1/1/1991'
	order by ConfirmationDate asc ,EmpCode

end

-- exec spGratuityCalculation '3/8/2020'

GO

Select dbo.fnGetGratuityValue(0,8,32000)

GO

Create function fnGetRateOfGratuity(@GYear int, @GMonth int)
returns numeric(18,2)
as
begin

	Declare @RateOfGratuity as numeric(5,2)

	if (@GYear*0.1) > 2.0
	begin
		Set @RateOfGratuity = 2.0
	end
	else
	begin
		if (@GYear*0.1) <= 0
		begin
			Set @RateOfGratuity = 0.1
		end
		else
		begin
			Set @RateOfGratuity = (@GYear*0.1)
		end
		
	end

	return @RateOfGratuity
end

GO

alter function fnGetGratuityValue(@GYear int, @GMonth int,@SalBasic numeric(18,2))
returns numeric(18,2)
as
begin
	
	Declare @GratuityValue as numeric(18,2)
	Declare @MonthComponent as numeric(18,2)

	Declare @YearComponent as numeric(5,2)

	if (@GYear*0.1) > 2.0
	begin
		Set @YearComponent = 2.0
	end
	else
	begin
		if (@GYear*0.1) <= 0
		begin
			Set @YearComponent = 0.1
		end
		else
		begin
			Set @YearComponent = (@GYear*0.1)
		end
		
	end

	Set @GratuityValue = @GYear * @YearComponent * @SalBasic

	Set @GratuityValue = @GratuityValue + ( @GMonth * ( @SalBasic * @YearComponent) )/12

	return @GratuityValue

end

GO

Create function fnGetAgeCM(@DOB datetime,@Today datetime)
returns int
as
begin

	
	DECLARE @tmpdate datetime, @years int, @months int, @days int
	Declare @Result as nvarchar(100)
	SELECT @tmpdate = @DOB

	SELECT @years = DATEDIFF(yy, @tmpdate, @Today) - CASE WHEN (MONTH(@DOB) > MONTH(@Today)) OR (MONTH(@DOB) = MONTH(@Today) AND DAY(@DOB) > DAY(@Today)) THEN 1 ELSE 0 END
	SELECT @tmpdate = DATEADD(yy, @years, @tmpdate)
	SELECT @months = DATEDIFF(m, @tmpdate, @Today) - CASE WHEN DAY(@DOB) > DAY(@Today) THEN 1 ELSE 0 END
	SELECT @tmpdate = DATEADD(m, @months, @tmpdate)
	SELECT @days = DATEDIFF(d, @tmpdate, @Today)
	
	Set @Result = Convert(nvarchar,@years) + ' Years ' + convert(nvarchar,@months) + ' Months ' + convert(nvarchar,@days) + ' Days ' 
	
	return @months
end

GO

Create function fnGetAgeCY(@DOB datetime,@Today datetime)
returns int
as
begin

	
	DECLARE @tmpdate datetime, @years int, @months int, @days int
	Declare @Result as nvarchar(100)
	SELECT @tmpdate = @DOB

	SELECT @years = DATEDIFF(yy, @tmpdate, @Today) - CASE WHEN (MONTH(@DOB) > MONTH(@Today)) OR (MONTH(@DOB) = MONTH(@Today) AND DAY(@DOB) > DAY(@Today)) THEN 1 ELSE 0 END
	SELECT @tmpdate = DATEADD(yy, @years, @tmpdate)
	SELECT @months = DATEDIFF(m, @tmpdate, @Today) - CASE WHEN DAY(@DOB) > DAY(@Today) THEN 1 ELSE 0 END
	SELECT @tmpdate = DATEADD(m, @months, @tmpdate)
	SELECT @days = DATEDIFF(d, @tmpdate, @Today)
	
	Set @Result = Convert(nvarchar,@years) + ' Years ' + convert(nvarchar,@months) + ' Months ' + convert(nvarchar,@days) + ' Days ' 
	
	return @years
end

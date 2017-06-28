
-- exec spTaxForecasting 'EMP-00000020'

Create proc spTaxForecasting
@EmployeeID nvarchar(50),
@SalaryYear int,
@SalaryMonth int
as
begin
	Select * from tblEmpSalary Where EmployeeID=@EmployeeID

	Declare @EmpSalComp table (
	ComponentID nvarchar(50),
	SalValue numeric(18,2),
	CompStatus nvarchar(50)
	);

	Insert into @EmpSalComp(ComponentID,SalValue,CompStatus)
	Select ComponentID,SalValue,CompStatus from tblEmpSalary Where EmployeeID=@EmployeeID
	And SalaryYear=@SalaryYear And SalaryMonth=@SalaryMonth
	
end
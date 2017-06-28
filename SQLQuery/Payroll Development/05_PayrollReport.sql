
Create proc spGetSalaryReport
@SalaryYear int,
@SalaryMonth int
as
begin
	Select  ES.EmployeeID,vEMP.EmployeeName,vEMP.EmpCode,ES.DepartmentID,vEMP.DeptName,ES.DesignationID,vEMP.OfficialDesignation,ES.ULCBranchID,vEMP.ULCBranchName,
	ES.BankID,vEMP.BankName,ES.BranchID,vEMP.BranchName,ES.BankAccountNo,ES.BasicSalary,ES.ProcessingEntryPoint,
	(ES.PositiveComponent-ES.NegativeComponent-ES.LoanSettlement-ES.TaxDeduction) as 'SalaryAmount',
	ES.SalaryYear,
	Case ES.Salarymonth  When 1 Then 'January' When 2 Then 'February'When 3 Then 'March' When 4 Then 'April'  When 5 Then 'May' When 6 Then 'June' When 7 then 'July' When 8 Then 'August' When 9 Then 'September' When 10 Then 'October' When 11 Then 'November' When 12 Then 'December' else 'N\A' end as 'Month'
	from tblEmpSalSummary ES Left Join vwEmpInfo vEMP on ES.EmployeeID=vEMP.EmployeeID
	Where SalaryYear=@SalaryYear And SalaryMonth=@SalaryMonth 
end

GO


SElect * from vwEmpInfo

Select * from tblComponents

Select * from tblEmpSalary ES Left Join tblComponents C On ES.ComponentID=C.ComponentID

Declare @SalaryYear as int
Declare @SalaryMonth as int
set @SalaryYear = 2013
Set @SalaryMonth = 9

select
(Select sum(SalValue) from tblEmpSalary Where ComponentID in (Select ComponentID from tblComponents Where ComponentCode='Basic') And SalaryYear=@SalaryYear And SalaryMonth=@SalaryMonth ) as 'Basic',
(Select sum(SalValue) from tblEmpSalary Where ComponentID in (Select ComponentID from tblComponents Where ComponentCode='House Rent') And SalaryYear=@SalaryYear And SalaryMonth=@SalaryMonth ) as 'House Rent',
(Select sum(SalValue) from tblEmpSalary Where ComponentID in (Select ComponentID from tblComponents Where ComponentCode='Transport') And SalaryYear=@SalaryYear And SalaryMonth=@SalaryMonth ) as 'Transport' ,
(Select sum(SalValue) from tblEmpSalary Where ComponentID in (Select ComponentID from tblComponents Where ComponentCode='Festival Bonus') And SalaryYear=@SalaryYear And SalaryMonth=@SalaryMonth ) as 'Festival Bonus' ,
isnull((Select sum(SalValue) from tblEmpSalary Where ComponentID in (Select ComponentID from tblComponents Where ComponentCode='PB') And SalaryYear=@SalaryYear And SalaryMonth=@SalaryMonth ),0) as 'PB',
(Select sum(SalValue) from tblEmpSalary Where ComponentID in (Select ComponentID from tblComponents Where ComponentCode='Utility') And SalaryYear=@SalaryYear And SalaryMonth=@SalaryMonth ) as 'Utility',
(Select sum(SalValue) from tblEmpSalary Where ComponentID in (Select ComponentID from tblComponents Where ComponentCode='Medical Allowance') And SalaryYear=@SalaryYear And SalaryMonth=@SalaryMonth ) as 'Medical Allowance',
(Select sum(SalValue) from tblEmpSalary Where ComponentID in (Select ComponentID from tblComponents Where ComponentCode='PF Contribution') And SalaryYear=@SalaryYear And SalaryMonth=@SalaryMonth ) as 'PF Contribution',
(Select sum(SalValue) from tblEmpSalary Where ComponentID in (Select ComponentID from tblComponents Where ComponentCode='Festival Component') And SalaryYear=@SalaryYear And SalaryMonth=@SalaryMonth ) as 'Festival Component'






Select ComponentID from tblComponents Where ComponentCode='Utility'

Select ComponentID from tblComponents Where ComponentCode='Festival Component'




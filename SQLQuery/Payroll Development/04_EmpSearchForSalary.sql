

Create proc spSearchEmpByTypeCode
@EmpTypeCode nvarchar(50)
as
begin
	Select distinct EmployeeID,EmployeeName,
	(Select intOrder from tblDesignation D Where D.DesignationID=tblEmployeeInfo.OfficialDesignationID) 
	from tblEmployeeInfo Where EmpTypeCode=@EmpTypeCode And isActive=1
	order by (3) desc
end

-- exec spSearchEmpByTypeCode 'EMP'

Select * from tblDesignation 
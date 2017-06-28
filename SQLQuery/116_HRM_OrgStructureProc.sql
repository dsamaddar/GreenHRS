

Select * from [vwEmpInfo]

-- drop proc spShowOrgStructure
Create proc spShowOrgStructure
@DesignationID nvarchar(50),
@DepartmentID nvarchar(50)
as
begin
	Select EmployeeID,EmployeeName,OfficialDesignation,FunctionalDesignation,DeptName,
	(Select photos from tblEmployeeBasicInfo EB Where EB.EmployeeID = VwE.EmployeeID) as 'Photos'
	from vwEmpInfo VwE
	Where (VwE.FunctionalDesignationID like '%'+@DesignationID+'%' or VwE.OfficialDesignationID like '%'+@DesignationID+'%' )
	and VwE.DepartmentID=@DepartmentID
end

-- exec spShowOrgStructure 'DESIG-00000007','DEPT-00000001'
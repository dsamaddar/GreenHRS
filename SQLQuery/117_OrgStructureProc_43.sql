
-- SElect * from vwEmpInfo
GO
-- drop view vwOrgStructure
create view vwOrgStructure
as
Select EmployeeID,EmployeeName,EmpTypeID,EmployeeTypeName,JoiningDate,OfficialDesignation,OfficialDesignationID,(Select intOrder  from tblDesignation D Where D.DesignationID = VwE.OfficialDesignationID) as 'OfficialDesigOrder',
FunctionalDesignation,FunctionalDesignationID,(Select intOrder  from tblDesignation D Where D.DesignationID= VwE.FunctionalDesignationID) as 'FunctionalDesigOrder',
DeptName,DepartmentID,ULCBranchID,isActive,(Select photos from tblEmployeeBasicInfo EB Where EB.EmployeeID = VwE.EmployeeID) as 'Photos'
from vwEmpInfo VwE

GO

-- drop proc spShowOrgStructure
Create proc spShowOrgStructure
@EmployeeTypeID nvarchar(50),
@DesignationID nvarchar(50),
@DepartmentID nvarchar(50),
@ULCBranchID nvarchar(50),
@IsActive bit
as
begin
	Declare @EmployeeTypeIDParam as nvarchar(50)
	Declare @DesignationIDParam as nvarchar(50)
	Declare @DepartmentIDParam as nvarchar(50)
	Declare @ULCBranchIDParam as nvarchar(50)
	
	if @EmployeeTypeID = 'N\A'
		Set @EmployeeTypeIDParam = '%'
	else
		Set @EmployeeTypeIDParam = '%'+ @EmployeeTypeID +'%'
		
	if @DesignationID = 'N\A'
		Set @DesignationIDParam = '%'
	else
		Set @DesignationIDParam = '%'+ @DesignationID +'%'
		
	if @DepartmentID = 'N\A'
		Set @DepartmentIDParam = '%'
	else
		Set @DepartmentIDParam = '%'+ @DepartmentID +'%'
		
	if @ULCBranchID = 'N\A'
		Set @ULCBranchIDParam = '%'
	else
		Set @ULCBranchIDParam = '%'+ @ULCBranchID +'%'
		
	Select EmployeeID,EmployeeName,OfficialDesignation,FunctionalDesignation,DeptName,photos
	from vwOrgStructure 
	Where (FunctionalDesignationID like @DesignationIDParam or OfficialDesignationID like @DesignationIDParam )
	And DepartmentID like @DepartmentIDParam And @DesignationID like @DesignationIDParam
	And ULCBranchID like @ULCBranchIDParam And isActive=@IsActive
	And EmpTypeID like @EmployeeTypeIDParam
	order by OfficialDesigOrder desc, FunctionalDesigOrder desc,JoiningDate asc
end

-- exec spShowOrgStructure 'N\A','N\A','N\A','N\A',1

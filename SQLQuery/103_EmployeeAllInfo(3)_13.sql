

CREATE function [dbo].[fnGetDesignationName](@DesignationID nvarchar(50))
returns nvarchar(200)
as
begin
	Declare @DesignationName nvarchar(200)
	Select @DesignationName=DesignationName from dbo.tblDesignation Where DesignationID=@DesignationID

	return @DesignationName
end



GO




CREATE function [dbo].[fnGetSupervisorName](@SupervisorID nvarchar(50))
returns nvarchar(200)
as
begin
	Declare @SupervisorName nvarchar(200)
	Select @SupervisorName=EmployeeName from dbo.tblEmployeeInfo Where EmployeeID=@SupervisorID

	return @SupervisorName
end



GO




CREATE view [dbo].[vwEmpInfo]
as

SELECT tblEmployeeInfo.[EmployeeID]
      ,tblEmployeeInfo.[EmployeeName]
      ,tblEmployeeInfo.[EmpCode]
      ,tblEmployeeInfo .[EmpTypeID]
      ,tblEmployeeType.[EmployeeTypeName]
      ,tblEmployeeInfo.[DateOfBirth]
      ,tblEmployeeInfo.[JoiningDate]
      ,tblEmployeeInfo.[ConfirmationDate]
      ,tblEmployeeInfo.[PromotionDate]
      ,tblEmployeeInfo.[ContractExpiryDate]
      ,tblEmployeeInfo.[ContractRenewalDate]
      ,tblEmployeeInfo .DepartmentID 
      ,tblEmployeeInfo .ULCBranchID 
      ,tblTerminationType.[TerminationTypeName] 
      ,tblEmployeeInfo.[TerminationDate]
      ,tblEmployeeInfo.[RemarksOnTermination]
      ,tblEmployeeInfo .OfficialDesignationID 
      ,tblEmployeeInfo .JoiningDesignationID 
      ,tblEmployeeInfo .FunctionalDesignationID 
	  ,[dbo].[fnGetDesignationName](JoiningDesignationID) as JoiningDesignation
	  ,[dbo].[fnGetDesignationName](OfficialDesignationID) as OfficialDesignation
	  ,[dbo].[fnGetDesignationName](FunctionalDesignationID) as  FunctionalDesignation
      ,tblDepartment.[DeptName]
      ,tblULCBranch.ULCBranchName
     ,[dbo].[fnGetSupervisorName]([CurrentSupervisor]) CurrentSupervisorName
      ,tblEmployeeInfo.[JDno]
      ,tblEmployeeInfo.[Status]
      ,tblBank.[BankName]
      ,tblBranch.[BranchName]
      ,tblEmployeeInfo.[BankAccountNo]
      ,tblEmployeeInfo.[EntryExamScore]
      ,tblEmployeeInfo.[PromotionalExamScore]
      ,[tblEmployeeInfo].[isActive]
      ,[tblEmployeeInfo].[EntryBy]
      ,[tblEmployeeInfo].[EntryDate]
  FROM [HRM].[dbo].[tblEmployeeInfo]  inner join dbo.tblEmployeeType on tblEmployeeInfo.EmpTypeID=dbo.tblEmployeeType.EmployeeTypeID
  right join dbo.tblTerminationType on [tblEmployeeInfo].TerminationTypeID =tblTerminationType.TerminationTypeID 
  inner join dbo.tblDepartment on dbo.tblDepartment.DepartmentID=tblEmployeeInfo.DepartmentID
  inner join dbo.tblULCBranch on dbo.tblULCBranch.ULCBranchID=tblEmployeeInfo.ULCBranchID
  inner join tblBank on tblBank.BankID=tblEmployeeInfo.BankID
  inner join tblBranch on tblEmployeeInfo.BranchID=dbo.tblBranch.BranchID
  where tblEmployeeInfo.[EmployeeName]<>''


  



GO







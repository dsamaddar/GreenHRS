
CREATE proc [dbo].[spGetAvailableJob]
as
begin
Declare @DateToday as datetime

select @DateToday=GETDATE() 

SELECT [CircularID]
      ,[JobTitle]
      ,[JobLocation]
      ,(select DeptName from dbo.tblDepartment where tblDepartment.[DepartmentID]=tblJobCircular.DepartmentID) DeptName
      ,(convert(varchar,ClosingDate,106)) [ClosingDate]
      ,[EntryDate]
  FROM [dbo].[tblJobCircular] where IsActive=1 and ClosingDate>=@DateToday
  
  end

--exec spGetAvailableJob
GO


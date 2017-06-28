
CREATE proc [dbo].[spGetAvailableJob]
as
begin

Declare @DateToday as date

select @DateToday =CAST (GETDATE() as date)

SELECT [CircularID]
      ,[JobTitle]
      ,[JobLocation]
      ,(select DeptName from dbo.tblDepartment where tblDepartment.[DepartmentID]=tblJobCircular.DepartmentID) DeptName
      ,(convert(varchar,ClosingDate,106)) [ClosingDate]
      ,[EntryDate]
  FROM [tblJobCircular] where IsActive=1 and CAST(tblJobCircular.ClosingDate as date) >= @DateToday

--Declare @DateToday as datetime

--select @DateToday= CONVERT(nvarchar, DATEADD(dd,1, GETDATE() ),106)

--SELECT [CircularID]
 --     ,[JobTitle]
  --    ,[JobLocation]
  --    ,(select DeptName from dbo.tblDepartment where tblDepartment.[DepartmentID]=tblJobCircular.DepartmentID) DeptName
  --    ,(convert(varchar,ClosingDate,106)) [ClosingDate]
  --    ,[EntryDate]
  --FROM [dbo].[tblJobCircular] where IsActive=1 and ClosingDate >= @DateToday
  
end

--exec spGetAvailableJob

--select * from [tblJobCircular] where IsActive=1

GO


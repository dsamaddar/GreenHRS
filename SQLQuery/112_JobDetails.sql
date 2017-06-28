
CREATE procedure [dbo].[spGetJobDetails]
@CircularID nvarchar(50)
as
SELECT [JobTitle]
      ,[JobLocation]
      ,(select OrgName from tblOrganizations where OrganizationID=[tblJobCircular].OrganizationID )[Organization]
      ,(select DeptName from tblDepartment where DepartmentID=[tblJobCircular].DepartmentID )[Department]
      ,[JobDescription]
      ,[JobResponsibility]
      ,[SpecialSkillReq]
      ,[AddiJobReq]
      ,[EducationalReq]
      ,[ExperienceReqInYrs]
      ,[DutySchedule]
      ,[SalaryAndBenefits]
      ,[Vacancies]
      ,[Competencies]
      ,[CommunicationSkill]
      ,[MinAgeLimit]
      ,[MaxAgeLimit]
      ,[ReportableTo]
      ,[ApplyInstructions]
      ,[CompanyAddress]
      ,[TermsOfReferences]
      ,(convert(varchar,ClosingDate,106))[ClosingDate]
      ,[HeaderNote]
      ,[FooterNote]
      ,[MaxApplicant]
      ,[HeaderImage]
      ,[MiddleImage]
      ,[FooterImage]
      ,[Attachment]
  FROM [dbo].[tblJobCircular] where CircularID=@CircularID

--exec spGetJobDetails ''
GO


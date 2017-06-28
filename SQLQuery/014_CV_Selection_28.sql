
-- drop view vwEduInfo
CREATE VIEW [dbo].[vwEduInfo]
AS
SELECT ED.CandidateID, EX.ExamName, EX.ExamID, EX.ExamOrder,INS.InstitutionID,Ins.InstitutionName
FROM    dbo.tblCandidateEducationInfo AS ED INNER JOIN
        dbo.tblExamName AS EX ON ED.ExamID = EX.ExamID
	Inner Join tblInstitutionName INS On INS.InstitutionID=ED.InstitutionID

GO

-- drop function fnGetHighestDegree
create function [dbo].[fnGetHighestDegree](@CandidateID nvarchar(50))
returns nvarchar(200)
as
begin
	Declare @ExamID nvarchar(50)
	declare @ExamName varchar(200)
	Select top 1 @ExamID=ExamID from vwEduInfo Where CandidateID=@CandidateID
	order by ExamOrder desc
	
	select @ExamName=ExamName from dbo.tblExamName where ExamID=@ExamID
	
	return @ExamName
end

-- Select dbo.fnGetHighestDegree('Can-00000002')
GO

-- drop function getMajorName
CREATE function [dbo].[getMajorName](@CandidateID varchar(50))
returns nvarchar(200)
as
begin

	declare @ExamID as nvarchar(50)
	declare @ExamName as varchar(200)
	declare @Major as varchar
	declare @subject as varchar(200)
	
	Select top 1 @ExamID=ExamID from vwEduInfo Where CandidateID=@CandidateID
	order by ExamOrder desc
						
	select @subject=MajorType from tblMajorType inner join tblCandidateEducationInfo 
	on tblMajorType.MajorTypeID=tblCandidateEducationInfo.Major
	where dbo.tblCandidateEducationInfo.ExamID=@ExamID
	
	return @subject
		 
end

GO

-- drop function getInstitutionName
CREATE function [dbo].[getInstitutionName](@CandidateID varchar(50))
returns nvarchar(100)
as
begin

	declare @ExamID as nvarchar(50)
	declare @InstitutionName as varchar(200)
	
	Select top 1 @ExamID=ExamID from vwEduInfo Where CandidateID=@CandidateID order by ExamOrder desc
				
	Select @InstitutionName= InstitutionName from tblInstitutionName Where InstitutionID in (
	select InstitutionID from tblCandidateEducationInfo
	where dbo.tblCandidateEducationInfo.ExamID=@ExamID
	)
	
	return @InstitutionName 
end

GO
-- drop function getHighestInstitutionID
CREATE function [dbo].[getHighestInstitutionID](@CandidateID varchar(50))
returns nvarchar(50)
as
begin

	declare @ExamID as nvarchar(50)
	declare @InstitutionID as varchar(200)
	
	Select top 1 @ExamID=ExamID from vwEduInfo Where CandidateID=@CandidateID order by ExamOrder desc
				
	Select @InstitutionID = InstitutionID from tblCandidateEducationInfo where ExamID=@ExamID
	
	
	return @InstitutionID 
end


GO

-- drop proc spSummaryOfJobCircular
Create proc spSummaryOfJobCircular
@CircularID nvarchar(50)
as
begin
	Declare @TotalApplicant as int
	Declare @TotalRecruitment as int
	Declare @TotalExamTaker as int
	Declare @TotalRejectedCV as int
	Declare @RemainingCV as int
	Declare @TotalInterviewTaken as int
	
	Select  @TotalApplicant=count(distinct CandidateID) from tblAppliedJob Where CircularID=@CircularID
	Set @TotalRecruitment = 0
	Set @TotalExamTaker = 0
	Set @TotalRejectedCV = 0
	Set @RemainingCV = 0
	Set @TotalInterviewTaken = 0

	Select @TotalApplicant as 'TotalApplicant',@TotalRecruitment as 'TotalRecruitment',@TotalExamTaker as 'TotalExamTaker',
	@TotalRejectedCV as 'TotalRejectedCV',@RemainingCV as 'RemainingCV',@TotalInterviewTaken as 'TotalInterviewTaken'
end

-- exec spSummaryOfJobCircular 'CIR-00000001'

GO

Create function fnGetDistrictNameByID(@DistrictID int)
returns nvarchar(200)
as
begin
	Declare @DistrictName as nvarchar(200)
	select @DistrictName = DistrictName from tblDistrict Where DistrictID=@DistrictID
	
	return @DistrictName
end

GO

-- drop view vwAppliedCandidates
Create view vwAppliedCandidates
as
select distinct AJ.AppliedJobID,CB.CandidateID,convert(varchar,AJ.EntryDate,106)EntryDate,AJ.CircularID,AJ.ReviewedBy,Convert(nvarchar,AJ.ReviewedDate,106) as 'ReviewedDate'
	,AJ.RejectedBy,Convert(nvarchar,AJ.RejectedDate,106) as 'RejectedDate'
	,CB.CandidateName,CB.PreDistrict,dbo.fnGetDistrictNameByID(CB.PreDistrict) as 'PreDistrictName',
	CB.PerDistrict,dbo.fnGetDistrictNameByID(CB.PerDistrict)  as 'PerDistrictName',isnull(dbo.fnGetHighestDegree(AJ.CandidateID),'N\A') as 'HighestDegree'
	,isnull(dbo.getMajorName(AJ.CandidateID),'N\A') Major,isnull(dbo.getHighestInstitutionID(AJ.CandidateID),'N\A') as 'InstitutionID',
	isnull(dbo.getInstitutionName(AJ.CandidateID),'N\A') as 'InstitutionName',
	JC.JobTitle,AJ.CurrentStatus,datediff(yyyy,RU.DateOfBirth,getdate()) as 'Age',CB.Gender
	from dbo.tblAppliedJob AJ
	left join dbo.tblCandidateBasicInfo CB on AJ.CandidateID = CB.CandidateID
	left join dbo.tblCandidateEducationInfo CE on CE.CandidateID = CB.CandidateID
	inner join dbo.tblJobCircular JC on JC.CircularID = AJ.CircularID
	Inner Join dbo.tblRegisterUser RU On RU.RegistrationID=CB.RegistrationID
	
-- select * from vwAppliedCandidates

GO

-- drop proc spCVGetForAppliedJobByID
create procedure spCVGetForAppliedJobByID
@CircularID nvarchar(50),
@CurrentStatus nvarchar(50)
as
begin	
	Select AppliedJobID,CircularID,CandidateID,EntryDate,CandidateName,PreDistrictName,PerDistrictName,HighestDegree,
	Major,InstitutionName,JobTitle from vwAppliedCandidates Where CircularID=@CircularID And CurrentStatus=@CurrentStatus
end
-- exec spCVGetForAppliedJobByID 'CIR-00000002'

GO
-- drop proc spGetDistricts
Create proc spGetDistricts
as
begin
	SELECT DISTINCT [DistrictName], [DistrictID] FROM [tblDistrict] ORDER BY [DistrictName]
end

GO

--CREATE proc [dbo].[spInsertInstitutionName]
--@InstitutionName nvarchar(500),
--@IsActive integer,
--@EntryBy nvarchar(50)
--as 
--INSERT INTO [HRM].[dbo].[tblInstitutionName]
--           ([InstitutionName]
--           ,[isActive]
--           ,[EntryBy]
--           )
--     VALUES
--           (@InstitutionName
--           ,@IsActive
--           ,@EntryBy)
           
--GO
           
--CREATE proc [dbo].[spGetInstitutionList]
--as
--SELECT [InstitutionID],[InstitutionName]  FROM [HRM].[dbo].[tblInstitutionName] where isActive=1

--GO
-- select * from vwAppliedCandidates

-- drop proc spSearchApplicant
create proc spSearchApplicant
@CircularID nvarchar(50),
@CandidateName nvarchar(200),
@InstitutionID nvarchar(50),
@PresentDistrictID int,
@PermanentDistrictID int,
@Gender nvarchar(50),
@AgeFrom int,
@AgeTo int
as
begin

	Declare @PreDistParam as nvarchar(10)
	Declare @PerDistParam as nvarchar(10)
	Declare @GenderParam as nvarchar(50)
	Declare @CandidateNameParam as nvarchar(200)
	Declare @InstitutionIDParam as nvarchar(50)

	if @PresentDistrictID=0
		set @PreDistParam = '%'
	else
		set @PreDistParam = convert(nvarchar,@PresentDistrictID)

	if @PermanentDistrictID=0
		set @PerDistParam ='%'
	else
		set @PerDistParam = convert(nvarchar,@PermanentDistrictID)

	if @Gender = '0'
		Set @GenderParam='%'
	else
		Set @GenderParam = @Gender+'%'

	if @CandidateName = ''
		Set @CandidateNameParam = '%'
	else
		Set @CandidateNameParam = '%'+@CandidateName+'%'
	
	if @InstitutionID='0'
		Set @InstitutionIDParam = '%'
	else
		Set @InstitutionIDParam = '%'+@InstitutionID+'%'


	Select * from vwAppliedCandidates Where CircularID=@CircularID And
	CandidateName like ''+@CandidateNameParam+'' And InstitutionID like ''+@InstitutionIDParam+'' And PreDistrict like ''+@PreDistParam+'' And 
	PerDistrict like ''+@PerDistParam+'' And Gender like ''+@GenderParam+'' And
	Age between @AgeFrom and @AgeTo
		
end

-- exec spSearchApplicant 'CIR-00000001','','0',0,0,'0',20,60

GO



-- drop proc spGetReviewdCVByCircularID
Create proc spGetReviewdCVByCircularID
@CircularID nvarchar(50)
as
begin
	Select AppliedJobID,CircularID,CandidateID,EntryDate,CandidateName,PreDistrictName,PerDistrictName,HighestDegree,
	Major,InstitutionName,JobTitle,ReviewedBy,ReviewedDate
	from vwAppliedCandidates Where CircularID=@CircularID And CurrentStatus='Reviewed'
	
end

-- exec spGetReviewdCVByCircularID 'CIR-00000001'

GO

-- drop proc spGetRejectedCVByCircularID
Create proc spGetRejectedCVByCircularID
@CircularID nvarchar(50)
as
begin
	Select AppliedJobID,CircularID,CandidateID,EntryDate,CandidateName,PreDistrictName,PerDistrictName,HighestDegree,
	Major,InstitutionName,JobTitle,RejectedBy,RejectedDate
	from vwAppliedCandidates Where CircularID=@CircularID And CurrentStatus='Rejected'
	
end

-- exec spGetReviewdCVByCircularID 'CIR-00000002'

GO
-- drop proc spSearchEmployee
Create proc spSearchEmployee
@EmployeeName nvarchar(200),
@DepartmentID nvarchar(50),
@OfficialDesignationID nvarchar(50),
@ULCBranchID nvarchar(50)
as
begin
	Declare @EmpNameParam as nvarchar(200)
	Declare @DeptIDParam as nvarchar(50)
	Declare @OffDesigIDParam as nvarchar(50)
	Declare @ULCBranchIDParam as nvarchar(50)

	If @EmployeeName = ''
		Set @EmpNameParam = '%'
	Else
		Set @EmpNameParam = '%'+ @EmployeeName +'%'
	
	If @DepartmentID = '0'
		Set @DeptIDParam = '%'
	Else
		Set @DeptIDParam = '%'+ @DepartmentID +'%'

	If @OfficialDesignationID = '0'
		Set @OffDesigIDParam = '%'
	Else
		Set @OffDesigIDParam = '%'+ @OfficialDesignationID +'%'

	If @ULCBranchID = '0'
		Set @ULCBranchIDParam = '%'
	Else
		Set @ULCBranchIDParam = '%'+ @ULCBranchID +'%'


	Select EmployeeID,EmployeeName,EmpCode,DeptName,OfficialDesignation,ULCBranchName from vwEmpInfo Where EmployeeName like @EmpNameParam And OfficialDesignationID like @OffDesigIDParam
	And DepartmentID like @DeptIDParam And ULCBranchID like @ULCBranchIDParam
end

-- exec spSearchEmployee '','0','0','0'

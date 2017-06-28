
GO


-- Select dbo.fnGetSubjectIDByCandidate('Can-00000002')
Create function fnGetSubjectIDByCandidate( @CandidateID as nvarchar(50))
returns nvarchar(1000)
as
begin
	Declare @Major as nvarchar(50)
	Declare @Str as nvarchar(Max)
	Declare @Count as int
	Declare @NCount as int
	Set @Count = 0
	Set @NCount = 0
	Set @Str = ''
	
	Declare @EduTable table(
	MajorID int identity(1,1),
	Major nvarchar(50),
	Taken bit default 0
	);
	
	Insert Into @EduTable(Major)
	Select Major from tblCandidateEducationInfo  Where CandidateID=@CandidateID
	
	Select @Count = COUNT(*) from @EduTable
	
	While @NCount <= @Count
	begin
		
		Select top 1 @Major=Major from @EduTable Where Taken=0 
		
		Set @Str= @Str + ''+ @Major + ','
		
		Update @EduTable Set Taken=1 Where MajorID = @NCount
		
		Set @NCount = @NCount + 1
				
	end
	
	return @Str
end

GO

-- drop view vwUnAppliedCandidates
Alter view vwUnAppliedCandidates
As
SELECT DISTINCT 
'N\A' As AppliedJobID, CB.CandidateID, CONVERT(varchar, CB.SubmissionDate, 106) AS EntryDate, 'N\A' CircularID,'N\A' As ReviewedBy, CONVERT(nvarchar, '1/1/1900', 106) 
AS ReviewedDate, 'N\A' RejectedBy, CONVERT(nvarchar, '1/1/1900', 106) AS RejectedDate, CB.CandidateName, CB.PreDistrict, 
dbo.fnGetDistrictNameByID(CB.PreDistrict) AS PreDistrictName, CB.PerDistrict, dbo.fnGetDistrictNameByID(CB.PerDistrict) AS PerDistrictName, 
ISNULL(dbo.fnGetHighestDegree(CB.CandidateID), N'N\A') AS HighestDegree, ISNULL(dbo.getMajorName(CB.CandidateID), N'N\A') AS Major, 
ISNULL(dbo.getHighestInstitutionID(CB.CandidateID), N'N\A') AS InstitutionID, ISNULL(dbo.getInstitutionName(CB.CandidateID), N'N\A') AS InstitutionName, 'N\A' AS JobTitle, 
'Not-Applied' as CurrentStatus, DATEDIFF(yyyy, RU.DateOfBirth, GETDATE()) AS Age, CB.Gender,CB.IsSubmitted,CB.SubmissionDate,CB.IsScreened,CB.ScreenedBy,CB.ScreenedDate,
CB.Religion,CB.YearOfExperience,dbo.fnGetSubjectIDByCandidate(CB.CandidateID) as 'MajorTypeID'
FROM  tblCandidateBasicInfo CB LEFT OUTER JOIN
tblCandidateEducationInfo AS CE ON CE.CandidateID = CB.CandidateID
INNER JOIN
tblRegisterUser AS RU ON RU.RegistrationID = CB.RegistrationID
Where CB.CandidateID Not in (Select distinct CandidateID from tblAppliedJob )
And CB.IsSubmitted=1 And CB.IsScreened = 0 
GO

-- select * from vwUnAppliedCandidates

-- Select * from tblAppliedJob

Alter view vwAppliedCandidatesForScreening
As
SELECT DISTINCT 
AJ.AppliedJobID, CB.CandidateID, CONVERT(varchar, AJ.EntryDate, 106) AS EntryDate, AJ.CircularID, AJ.ReviewedBy, CONVERT(nvarchar, AJ.ReviewedDate, 106) 
AS ReviewedDate, AJ.RejectedBy, CONVERT(nvarchar, AJ.RejectedDate, 106) AS RejectedDate, CB.CandidateName, CB.PreDistrict, 
dbo.fnGetDistrictNameByID(CB.PreDistrict) AS PreDistrictName, CB.PerDistrict, dbo.fnGetDistrictNameByID(CB.PerDistrict) AS PerDistrictName, 
ISNULL(dbo.fnGetHighestDegree(CB.CandidateID), N'N\A') AS HighestDegree, ISNULL(dbo.getMajorName(CB.CandidateID), N'N\A') AS Major, 
ISNULL(dbo.getHighestInstitutionID(CB.CandidateID), N'N\A') AS InstitutionID, ISNULL(dbo.getInstitutionName(CB.CandidateID), N'N\A') AS InstitutionName, JC.JobTitle, 
AJ.CurrentStatus, DATEDIFF(yyyy, RU.DateOfBirth, GETDATE()) AS Age, CB.Gender,CB.IsSubmitted,CB.SubmissionDate,CB.IsScreened,CB.ScreenedBy,CB.ScreenedDate,
CB.Religion,CB.YearOfExperience,dbo.fnGetSubjectIDByCandidate(CB.CandidateID)  as 'MajorTypeID'
FROM  tblAppliedJob AS AJ LEFT OUTER JOIN
tblCandidateBasicInfo AS CB ON AJ.CandidateID = CB.CandidateID LEFT OUTER JOIN
tblCandidateEducationInfo AS CE ON CE.CandidateID = CB.CandidateID INNER JOIN
tblJobCircular AS JC ON JC.CircularID = AJ.CircularID INNER JOIN
tblRegisterUser AS RU ON RU.RegistrationID = CB.RegistrationID
Where CB.IsScreened = 0 

-- select * from vwAppliedCandidatesForScreening

GO

Alter view vwAppliedCandidates
As
SELECT DISTINCT 
AJ.AppliedJobID, CB.CandidateID, CONVERT(varchar, AJ.EntryDate, 106) AS EntryDate, AJ.CircularID, AJ.ReviewedBy, CONVERT(nvarchar, AJ.ReviewedDate, 106) 
AS ReviewedDate, AJ.RejectedBy, CONVERT(nvarchar, AJ.RejectedDate, 106) AS RejectedDate, CB.CandidateName, CB.PreDistrict, 
dbo.fnGetDistrictNameByID(CB.PreDistrict) AS PreDistrictName, CB.PerDistrict, dbo.fnGetDistrictNameByID(CB.PerDistrict) AS PerDistrictName, 
ISNULL(dbo.fnGetHighestDegree(AJ.CandidateID), N'N\A') AS HighestDegree, ISNULL(dbo.getMajorName(CB.CandidateID), N'N\A') AS Major, 
ISNULL(dbo.getHighestInstitutionID(AJ.CandidateID), N'N\A') AS InstitutionID, ISNULL(dbo.getInstitutionName(CB.CandidateID), N'N\A') AS InstitutionName, JC.JobTitle, 
AJ.CurrentStatus, DATEDIFF(yyyy, RU.DateOfBirth, GETDATE()) AS Age, CB.Gender,CB.IsSubmitted,CB.SubmissionDate,CB.IsScreened,CB.ScreenedBy,CB.ScreenedDate,
CB.Religion,CB.YearOfExperience,dbo.fnGetSubjectIDByCandidate(CB.CandidateID)  as 'MajorTypeID'
FROM  tblAppliedJob AS AJ LEFT OUTER JOIN
tblCandidateBasicInfo AS CB ON AJ.CandidateID = CB.CandidateID LEFT OUTER JOIN
tblCandidateEducationInfo AS CE ON CE.CandidateID = CB.CandidateID INNER JOIN
tblJobCircular AS JC ON JC.CircularID = AJ.CircularID INNER JOIN
tblRegisterUser AS RU ON RU.RegistrationID = CB.RegistrationID
Where CB.IsScreened = 1 And CB.IsRejected=0 

-- Select * from vwAppliedCandidates

GO
Alter View vwEduInfo
As
SELECT     ED.CandidateID, EX.ExamName, EX.ExamID, EX.ExamOrder, INS.InstitutionID, 
Case INS.InstitutionName
when 'Others' Then 'Others ( '+ ED.OtherInstitutionName +' )'
Else INS.InstitutionName
End As InstitutionName
FROM         dbo.tblCandidateEducationInfo AS ED INNER JOIN
                      dbo.tblExamName AS EX ON ED.ExamID = EX.ExamID INNER JOIN
                      dbo.tblInstitutionName AS INS ON INS.InstitutionID = ED.InstitutionID
                      
-- select * from vwEduInfo

GO

ALTER function [dbo].[getInstitutionName](@CandidateID varchar(50))
returns nvarchar(100)
as
begin

	declare @ExamID as nvarchar(50)
	declare @InstitutionName as varchar(200)
	
	Select top 1 @ExamID=ExamID from vwEduInfo Where CandidateID=@CandidateID order by ExamOrder desc
				
	Select @InstitutionName= InstitutionName from tblInstitutionName Where InstitutionID in (
	select InstitutionID from tblCandidateEducationInfo
	where dbo.tblCandidateEducationInfo.ExamID=@ExamID And CandidateID=@CandidateID
	)
	
	return @InstitutionName 
end

GO

/*
Select * from tblCandidateBasicInfo

Select * from tblCandidateEducationInfo

Select * from vwAppliedCandidates

Select * from tblCandidateEducationInfo
*/

GO

-- drop proc spCVGetForScreening
Alter proc spCVGetForScreening
@CircularID nvarchar(50),
@CurrentStatus nvarchar(50)
as
begin
	if @CurrentStatus <> 'N\A'
	begin
		Select AppliedJobID,CircularID,CandidateID,EntryDate,CandidateName,PreDistrictName,PerDistrictName,HighestDegree,
	Major,InstitutionName,JobTitle from vwAppliedCandidatesForScreening Where CircularID=@CircularID And CurrentStatus=@CurrentStatus
	And IsScreened=0 
	end
	else
	begin
		Select AppliedJobID,CircularID,CandidateID,EntryDate,CandidateName,PreDistrictName,PerDistrictName,HighestDegree,
		Major,InstitutionName,JobTitle  from vwUnAppliedCandidates 
	end
	
end

-- exec spCVGetForScreening 'N\A','N\A'

GO

-- Select * from vwAppliedCandidates

GO

ALTER proc [dbo].[spShowMessageByUser]
@UniqueUserID nvarchar(50)
as
begin

	Declare @RegistrationID as nvarchar(50)
	Set @RegistrationID = ''
	
	Select @RegistrationID = isnull(RegistrationID,'N\A') from tblCandidateBasicInfo Where CandidateID=@UniqueUserID

 Select * from 
	(
	Select MessageID,MessageBody,IssuedBy,Convert(nvarchar,IssueDate,106) as 'IssueDate' from tblUserMessage
	Where UniqueUserID = @UniqueUserID
--	Order by CONVERT(datetime,IssueDate) desc
	
	Union
	
	Select MessageID,MessageBody,IssuedBy,Convert(nvarchar,IssueDate,106) as 'IssueDate' from tblUserMessage
	Where UniqueUserID = @RegistrationID
	)
	as A Order by CONVERT(datetime,IssueDate) desc
	
end

GO

-- drop proc spSearchApplicantForScreening
Alter proc spSearchApplicantForScreening
@CircularID nvarchar(50),
@CandidateName nvarchar(200),
@InstitutionID nvarchar(50),
@PresentDistrictID int,
@PermanentDistrictID int,
@Gender nvarchar(50),
@AgeFrom int,
@AgeTo int,
@Religion nvarchar(50),
@YearOfExperience int,
@SpecializedID nvarchar(4000),
@MajorTypeID nvarchar(50)
as
begin

	Declare @PreDistParam as nvarchar(10)
	Declare @PerDistParam as nvarchar(10)
	Declare @GenderParam as nvarchar(50)
	Declare @CandidateNameParam as nvarchar(200)
	Declare @InstitutionIDParam as nvarchar(50)
	
	Declare @ReligionParam as nvarchar(50)
	Declare @MajorTypeIDParam as nvarchar(50)

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
	
	if @Religion = 'N\A'
		Set @ReligionParam = '%'
	else
		Set @ReligionParam =  '%'+ @Religion +'%'
	
	if @MajorTypeID = '0'
		Set @MajorTypeIDParam = '%'
	else
		Set @MajorTypeIDParam =  '%'+ @MajorTypeID +'%'
		
	Print @ReligionParam
	if @CircularID <> 'N\A'
	begin
		Select * from vwAppliedCandidatesForScreening Where CircularID=@CircularID And
		CandidateName like ''+@CandidateNameParam+'' And InstitutionID like ''+@InstitutionIDParam+'' And PreDistrict like ''+@PreDistParam+'' And 
		PerDistrict like ''+@PerDistParam+'' And Gender like ''+@GenderParam+'' And
		Age between @AgeFrom and @AgeTo And CurrentStatus='Applied'
		And Religion like ''+@ReligionParam+'' And YearOfExperience >= @YearOfExperience
		And MajorTypeID like ''+ @MajorTypeIDParam +''
	end
	else
	begin
		Select * from vwUnAppliedCandidates Where CircularID=@CircularID And
		CandidateName like ''+@CandidateNameParam+'' And InstitutionID like ''+@InstitutionIDParam+'' And PreDistrict like ''+@PreDistParam+'' And 
		PerDistrict like ''+@PerDistParam+'' And Gender like ''+@GenderParam+'' And
		Age between @AgeFrom and @AgeTo And CurrentStatus='Not-Applied'
		And Religion like ''+@ReligionParam+'' And YearOfExperience >= @YearOfExperience
		And MajorTypeID like ''+ @MajorTypeIDParam +''
		
	end
	
end

-- exec spSearchApplicantForScreening 'N\A','','0','0','0','0',20,60,'Hindu',0,'','0'

GO

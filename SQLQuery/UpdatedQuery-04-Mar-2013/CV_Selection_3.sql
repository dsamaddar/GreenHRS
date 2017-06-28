
Create view vwAppliedCandidatesScr
SELECT DISTINCT 
                      AJ.AppliedJobID, CB.CandidateID, CONVERT(varchar, AJ.EntryDate, 106) AS EntryDate, AJ.CircularID, AJ.ReviewedBy, CONVERT(nvarchar, AJ.ReviewedDate, 106) 
                      AS ReviewedDate, AJ.RejectedBy, CONVERT(nvarchar, AJ.RejectedDate, 106) AS RejectedDate, CB.CandidateName, CB.PreDistrict, 
                      dbo.fnGetDistrictNameByID(CB.PreDistrict) AS PreDistrictName, CB.PerDistrict, dbo.fnGetDistrictNameByID(CB.PerDistrict) AS PerDistrictName, 
                      ISNULL(dbo.fnGetHighestDegree(AJ.CandidateID), N'N\A') AS HighestDegree, ISNULL(dbo.getMajorName(CB.CandidateID), N'N\A') AS Major, 
                      ISNULL(dbo.getHighestInstitutionID(AJ.CandidateID), N'N\A') AS InstitutionID, ISNULL(dbo.getInstitutionName(CB.CandidateID), N'N\A') AS InstitutionName, JC.JobTitle, 
                      AJ.CurrentStatus, DATEDIFF(yyyy, RU.DateOfBirth, GETDATE()) AS Age, CB.Gender, CB.IsSubmitted, CB.SubmissionDate, CB.IsScreened, CB.ScreenedBy, 
                      CB.ScreenedDate, CB.Religion, CB.YearOfExperience, dbo.fnGetSubjectIDByCandidate(CB.CandidateID) AS MajorTypeID
FROM         dbo.tblAppliedJob AS AJ LEFT OUTER JOIN
                      dbo.tblCandidateBasicInfo AS CB ON AJ.CandidateID = CB.CandidateID LEFT OUTER JOIN
                      dbo.tblCandidateEducationInfo AS CE ON CE.CandidateID = CB.CandidateID INNER JOIN
                      dbo.tblJobCircular AS JC ON JC.CircularID = AJ.CircularID INNER JOIN
                      dbo.tblRegisterUser AS RU ON RU.RegistrationID = CB.RegistrationID
WHERE     (CB.IsScreened = 1) AND (CB.IsRejected = 0)

GO
 
 
-- drop view vwAppliedCandidates
Alter view vwAppliedCandidates
as
select distinct AJ.AppliedJobID,CB.CandidateID,convert(varchar,AJ.EntryDate,106)EntryDate,AJ.CircularID,AJ.ReviewedBy,Convert(nvarchar,AJ.ReviewedDate,106) as 'ReviewedDate'
	,AJ.RejectedBy,Convert(nvarchar,AJ.RejectedDate,106) as 'RejectedDate'
	,CB.CandidateName,CB.PreDistrict,dbo.fnGetDistrictNameByID(CB.PreDistrict) as 'PreDistrictName',
	CB.PerDistrict,dbo.fnGetDistrictNameByID(CB.PerDistrict)  as 'PerDistrictName',isnull(dbo.fnGetHighestDegree(AJ.CandidateID),'N\A') as 'HighestDegree'
	,isnull(dbo.getMajorName(AJ.CandidateID),'N\A') Major,isnull(dbo.getHighestInstitutionID(AJ.CandidateID),'N\A') as 'InstitutionID',
	isnull(dbo.getInstitutionName(AJ.CandidateID),'N\A') as 'InstitutionName',
	JC.JobTitle,AJ.CurrentStatus,datediff(yyyy,RU.DateOfBirth,getdate()) as 'Age',CB.Gender,
	CB.IsScreened,CB.ScreenedBy,isnull(convert(nvarchar,CB.ScreenedDate,106),'N\A') as 'ScreenedDate'
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
	And IsScreened=1 
end
-- exec spCVGetForAppliedJobByID 'CIR-00000002'

GO

ALTER procedure [dbo].[spCVGetForAppliedJobByID]
@CircularID nvarchar(50),
@CurrentStatus nvarchar(50)
as
begin	
	Select AppliedJobID,CircularID,CandidateID,EntryDate,CandidateName,PreDistrictName,PerDistrictName,HighestDegree,
	Major,InstitutionName,JobTitle from vwAppliedCandidates Where CircularID=@CircularID And CurrentStatus=@CurrentStatus
	order by Convert(datetime, EntryDate)
end

-- exec spCVGetForAppliedJobByID 'CIR-00000002','Applied'

GO

ALTER proc [dbo].[spGetIntCandidatesByIntTaker]
@EmployeeID nvarchar(50)
as
begin
	Select IntCandidateID,CandidateID,IntTeamID,IntTeamName,CandidateName,PreDistrictName,
	PerDistrictName,HighestDegree,Major,InstitutionName,JobTitle,Age,Gender 
	from vwAvailableInterview Where IntTeamID in (
	Select Distinct IntTeamID from tblInterViewPanel Where IntPanelMemberID=@EmployeeID
	)
	And IntCandidateID Not in (
	Select Distinct IntCandidateID from tblIntAssessment
	)
end

-- exec [spGetIntCandidatesByIntTaker] 'EMP-00000005'

Select Distinct IntTeamID from tblInterViewPanel Where IntPanelMemberID='EMP-00000005'
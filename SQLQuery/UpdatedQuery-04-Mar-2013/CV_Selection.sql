
Select * from vwAppliedCandidates

GO

ALTER proc [dbo].[spGetReviewdCVByCircularID]
@CircularID nvarchar(50)
as
begin
	Select AppliedJobID,CircularID,CandidateID,EntryDate,CandidateName,PreDistrictName,PerDistrictName,HighestDegree,
	Major,InstitutionName,JobTitle,ReviewedBy,ReviewedDate,CurrentStatus 
	from vwAppliedCandidates Where CircularID=@CircularID And CurrentStatus='Reviewed' And IsScreened=1
	order by Convert(datetime,EntryDate)
end

-- exec spGetReviewdCVByCircularID 'CIR-00000001'

GO

ALTER proc [dbo].[spGetRejectedCVByCircularID]
@CircularID nvarchar(50)
as
begin
	Select AppliedJobID,CircularID,CandidateID,EntryDate,CandidateName,PreDistrictName,PerDistrictName,HighestDegree,
	Major,InstitutionName,JobTitle,RejectedBy,RejectedDate,CurrentStatus 
	from vwAppliedCandidates Where CircularID=@CircularID And CurrentStatus='Rejected' And IsScreened=1
	order by Convert(datetime, EntryDate )
	
end

-- exec spGetRejectedCVByCircularID 'CIR-00000001'

GO

ALTER proc [dbo].[spGetExamAssignedCandidate]
@CircularID nvarchar(50)
as
begin
	Select AppliedJobID,CircularID,CandidateID,EntryDate,CandidateName,PreDistrictName,PerDistrictName,HighestDegree,
	Major,InstitutionName,JobTitle,ReviewedBy,ReviewedDate,CurrentStatus 
	from vwAppliedCandidates Where CircularID=@CircularID And IsScreened=1 
	And CandidateID in (Select distinct ExamTakerID from tblQuestionPaper Where IsActive=1 And ExamTaken=1)
	order by Convert(datetime,EntryDate )
end

-- exec spGetExamAssignedCandidate 'CIR-00000001'

Select * from tblAppliedJob  Where CircularID= 'CIR-00000001'

GO

Alter proc [dbo].[spInterviewedCandidates]
@CircularID nvarchar(50),
@IntGradeID nvarchar(50)
as
begin
	Select distinct AC.AppliedJobID,IC.IntCandidateID,AC.CandidateID,AC.EntryDate,AC.CircularID,AC.ReviewedBy,AC.ReviewedDate,AC.RejectedBy,AC.RejectedDate,
	AC.CandidateName,AC.PerDistrictName,AC.PreDistrictName,AC.HighestDegree,AC.Major,AC.InstitutionName,AC.JobTitle,AC.Age,AC.Gender,AC.CurrentStatus 
	from vwAppliedCandidates AC Left Join tblInterviewCandidates IC On 
	AC.CandidateID = IC.CandidateID And AC.CircularID = @CircularID And IC.IntCandidateID 
	not in (Select Distinct IntCandidateID from tblRecruitmentProposal Where IntCandidateID is not null)
	left Join tblIntAssessment IA On IC.IntCandidateID= IA.IntCandidateID 
	Where AC.CircularID=@CircularID And IC.InterviewTaken=1 And
	IA.IntGradeID=@IntGradeID And IsScreened=1
	order by  AC.EntryDate
end

--  exec spInterviewedCandidates 'CIR-00000001'

GO

ALTER proc [dbo].[spChqAlrdyAsndAndIntNotTaken]
@CandidateID nvarchar(50),
@CircularID nvarchar(50),
@IntTeamID nvarchar(50)
as
begin
	If Exists (
		Select * from tblInterviewCandidates Where CandidateID=@CandidateID And 
		CircularID = @CircularID And IntTeamID = @IntTeamID And InterviewTaken= 0 
	)
		Select 1 as 'IntExists'
	Else
		Select 0 as 'IntExists'
end

-- exec spChqAlrdyAsndAndIntNotTaken 'Can-00000002','CIR-00000001','INT-TEAM-00000002'

GO

ALTER proc [dbo].[spCVGetForScreening]
@CircularID nvarchar(50),
@CurrentStatus nvarchar(50)
as
begin
	if @CurrentStatus <> 'N\A'
	begin
		Select AppliedJobID,CircularID,CandidateID,EntryDate,CandidateName,PreDistrictName,PerDistrictName,HighestDegree,
	Major,InstitutionName,JobTitle from vwAppliedCandidatesForScreening Where CircularID=@CircularID And CurrentStatus=@CurrentStatus
	And IsScreened=0
	order by convert(datetime,EntryDate )
	end
	else
	begin
		Select AppliedJobID,CircularID,CandidateID,EntryDate,CandidateName,PreDistrictName,PerDistrictName,HighestDegree,
		Major,InstitutionName,JobTitle  from vwUnAppliedCandidates
		order by convert(datetime,EntryDate)
	end
	
end

-- exec spCVGetForScreening 'N\A'

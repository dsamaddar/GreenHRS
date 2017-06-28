
-- drop proc spGetPendingIntCandidateList
Create proc spGetPendingIntCandidateList
@CircularID nvarchar(50)
as
begin
	Select distinct AC.AppliedJobID,IC.IntCandidateID,AC.CandidateID,AC.EntryDate,AC.CircularID,AC.ReviewedBy,AC.ReviewedDate,AC.RejectedBy,AC.RejectedDate,
	AC.CandidateName,AC.PerDistrictName,AC.PreDistrictName,AC.HighestDegree,AC.Major,AC.InstitutionName,AC.JobTitle,AC.Age,AC.Gender,AC.CurrentStatus 
	from vwAppliedCandidates AC Left Join tblInterviewCandidates IC On 
	AC.CandidateID = IC.CandidateID And AC.CircularID = @CircularID And IC.IntCandidateID 
	not in (Select Distinct IntCandidateID from tblRecruitmentProposal Where IntCandidateID is not null)
	left Join tblIntAssessment IA On IC.IntCandidateID= IA.IntCandidateID 
	Where AC.CircularID=@CircularID And IC.InterviewTaken=0 And IsScreened=1
	order by  AC.EntryDate
end

-- exec spGetPendingIntCandidateList 'CIR-00000001'

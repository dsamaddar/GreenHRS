
-- drop proc spFinallySelectedCandidates
Create proc spFinallySelectedCandidates
@IntGradeID nvarchar(50)
as
begin
	Declare @CircularID as nvarchar(50)
	Declare @CandidateID as nvarchar(50)
	
	Select @CandidateID=CandidateID,@CircularID=CircularID from tblInterviewCandidates
		Where IntCandidateID in (
		Select IntCandidateID from tblIntAssessment Where IntGradeID=@IntGradeID
		)
		And InterviewTaken=1
	
	Select distinct AC.AppliedJobID,IC.IntCandidateID,AC.CandidateID,AC.EntryDate,AC.CircularID,AC.ReviewedBy,AC.ReviewedDate,AC.RejectedBy,AC.RejectedDate,
	AC.CandidateName,AC.PerDistrictName,AC.PreDistrictName,AC.HighestDegree,AC.Major,AC.InstitutionName,AC.JobTitle,AC.Age,AC.Gender
	from vwAppliedCandidates AC Left Join tblInterviewCandidates IC On 
	AC.CandidateID = IC.CandidateID And AC.CircularID = IC.CircularID And IC.IntCandidateID 
	not in (Select Distinct IntCandidateID from tblRecruitmentProposal)
	Where AC.CandidateID=@CandidateID and AC.CircularID=@CircularID And IC.InterviewTaken=1
end

-- exec spFinallySelectedCandidates

 -- Select * from vwAppliedCandidates


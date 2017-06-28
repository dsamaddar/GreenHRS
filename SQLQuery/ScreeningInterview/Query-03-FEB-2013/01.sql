
GO

-- drop proc spGetCandidateResMatched
Create proc spGetCandidateResMatched
@CandidateID nvarchar(50)
as
begin
	Select CS.SpecilizedID,CS.SpecilizedName  from tblCanResponsibilityMatched MR Left Join tblSpecilizedSector CS
	On CS.SpecilizedID=MR.SpecilizedID  Where MR.CandidateID=@CandidateID
end

-- exec spGetCandidateResMatched 'Can-00000007'

GO

Create proc spGetCandidateSuitableFor
@CandidateID nvarchar(50)
as
begin
	Select CS.SpecilizedID,CS.SpecilizedName  from tblCanSuitableFor SF Left Join tblSpecilizedSector CS
	On CS.SpecilizedID=SF.SpecilizedID  Where SF.CandidateID=@CandidateID
end

-- exec spGetCandidateSuitableFor 'Can-00000013'

GO

-- drop proc spGetScrInterviewInfo
Create proc spGetScrInterviewInfo
@CandidateID nvarchar(50)
as
begin
	Select InterviewMethod,IsAnyOneKnownToOurInstitution,KnownDesignationID,KnownPerson,Remarks,NextAction,
	ScreenedBy,Convert(nvarchar,ScreenedDate,106) as 'ScreenedDate'
	from tblScreeningInterview Where CandidateID=@CandidateID
end

-- exec spGetScrInterviewInfo 'Can-00000013'

GO

Create proc spShowCanScrQuesOptionsSelected
@CandidateID nvarchar(50)
as
begin
	Select SQ.Question,SQO.Options  from tblCanScrQuesOptionsSelected CSQ Inner Join tblScreeningQuestion SQ 
	On CSQ.ScreeningQuesID=SQ.ScreeningQuesID 
	Inner Join tblScreeningQuesOptions SQO On SQO.ScrQuesOptionID= CSQ.ScrQuesOptionID 
	Where CSQ.CandidateID=@CandidateID
end

-- exec spShowCanScrQuesOptionsSelected 'Can-00000013'



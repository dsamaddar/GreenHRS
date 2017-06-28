
-- drop proc spGetExamAssignedCandidate
Create proc spGetExamAssignedCandidate
@CircularID nvarchar(50)
as
begin
	Select AppliedJobID,CircularID,CandidateID,EntryDate,CandidateName,PreDistrictName,PerDistrictName,HighestDegree,
	Major,InstitutionName,JobTitle,ReviewedBy,ReviewedDate
	from vwAppliedCandidates Where CircularID=@CircularID 
	And CandidateID in (Select distinct ExamTakerID from tblQuestionPaper Where IsActive=1 And ExamTaken=1)
end

-- exec spGetExamAssignedCandidate 'CIR-00000001'

GO
-- drop view vwExamDefinition
Create view vwExamDefinition
as
Select ED.ExamID,ED.ExamName,ED.TotalQuestion, ED.TotalMarks, ED.TotalTime, ED.ExamCode,
SUB.SubjectID ,SUB.SubjectName,SUB.SubjectCode,
EWS.PositiveMarkingPerQuestion ,EWS.NegativeMarkingPerQuestion ,EWS.SkipMarkingPerQuestion,EWS.NotAnsweredMarkingPerQuestion,
QP.ExamTakerID,QP.ExamRollNo,Q.QuestionID,
case 
 When QP.GivenAnswer=Q.CorrectAnswre And QP.GivenAnswerImage=Q.CorrectAnswre_Image Then EWS.PositiveMarkingPerQuestion
 else 0
end as 'PositiveMarking',
Case
	When QP.GivenAnswer <> Q.CorrectAnswre  or QP.GivenAnswerImage <> Q.CorrectAnswre_Image Then EWS.NegativeMarkingPerQuestion 
	else 0
end as 'NegativeMarking'

from tblExamDefinition ED
Inner join tblExamWiseSubject EWS On EWS.ExamID=ED.ExamID
Inner Join tblSubjects SUB On SUB.SubjectID=EWS.SubjectID
Inner Join tblExamPaper EP On EP.ExamWiseSubjectID= EWS.ExamWiseSubjectID
Inner Join tblQuestionPaper QP On QP.ExamPaperID = EP.ExamPaperID
Inner Join tblQuestions Q On Q.QuestionID= EP.QuestionID 
Where QP.IsActive=1 And QP.ExamTaken=1

-- Select * from vwExamDefinition

/*
Select * from tblExamPaper
select * from tblQuestions
Select * from tblQuestionPaper
*/




GO
-- drop proc spGetCandidateWiseSummaryResult
Create proc spGetCandidateWiseSummaryResult
@CandidateID nvarchar(50)
as
begin
	Select Distinct ExamID,ExamName,ExamCode,TotalQuestion,TotalMarks,SUM(PositiveMarking) as 'PositiveMarking',
	SUM(NegativeMarking) as 'NegativeMarking',(SUM(PositiveMarking) - SUM(NegativeMarking)) as 'ObtainedMarks'
	from vwExamDefinition Where ExamTakerID=@CandidateID
	group by ExamID,ExamName,ExamCode,TotalQuestion,TotalMarks
end

-- exec spGetCandidateWiseSummaryResult 'Can-00000005'
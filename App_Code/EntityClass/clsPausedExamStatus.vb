Imports Microsoft.VisualBasic

Public Class clsPausedExamStatus

    Dim _ExamRollNo As String

    Public Property ExamRollNo() As String
        Get
            Return _ExamRollNo
        End Get
        Set(ByVal value As String)
            _ExamRollNo = value
        End Set
    End Property

    Dim _QuestionLeft, _TimeTaken, _SkippedQuestion As Integer

    Public Property QuestionLeft() As Integer
        Get
            Return _QuestionLeft
        End Get
        Set(ByVal value As Integer)
            _QuestionLeft = value
        End Set
    End Property

    Public Property TimeTaken() As Integer
        Get
            Return _TimeTaken
        End Get
        Set(ByVal value As Integer)
            _TimeTaken = value
        End Set
    End Property

    Public Property SkippedQuestion() As Integer
        Get
            Return _SkippedQuestion
        End Get
        Set(ByVal value As Integer)
            _SkippedQuestion = value
        End Set
    End Property

End Class

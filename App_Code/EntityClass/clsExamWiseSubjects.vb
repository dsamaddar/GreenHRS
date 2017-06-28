Imports Microsoft.VisualBasic

Public Class clsExamWiseSubjects

    Dim _ExamWiseSubjectID, _ExamID, _SubjectID, _EntryBy As String

    Public Property ExamWiseSubjectID() As String
        Get
            Return _ExamWiseSubjectID
        End Get
        Set(ByVal value As String)
            _ExamWiseSubjectID = value
        End Set
    End Property

    Public Property ExamID() As String
        Get
            Return _ExamID
        End Get
        Set(ByVal value As String)
            _ExamID = value
        End Set
    End Property

    Public Property SubjectID() As String
        Get
            Return _SubjectID
        End Get
        Set(ByVal value As String)
            _SubjectID = value
        End Set
    End Property

    Public Property EntryBy() As String
        Get
            Return _EntryBy
        End Get
        Set(ByVal value As String)
            _EntryBy = value
        End Set
    End Property

    Dim _AllocatedQuestion As Integer

    Public Property AllocatedQuestion() As Integer
        Get
            Return _AllocatedQuestion
        End Get
        Set(ByVal value As Integer)
            _AllocatedQuestion = value
        End Set
    End Property

    Dim _PositiveMarkingPerQuestion, _NegativeMarkingPerQuestion, _SkipMarkingPerQuestion, _NotAnsweredMarkingPerQuestion, _QuePickPercentage As Double

    Public Property PositiveMarkingPerQuestion() As Double
        Get
            Return _PositiveMarkingPerQuestion
        End Get
        Set(ByVal value As Double)
            _PositiveMarkingPerQuestion = value
        End Set
    End Property

    Public Property NegativeMarkingPerQuestion() As Double
        Get
            Return _NegativeMarkingPerQuestion
        End Get
        Set(ByVal value As Double)
            _NegativeMarkingPerQuestion = value
        End Set
    End Property

    Public Property SkipMarkingPerQuestion() As Double
        Get
            Return _SkipMarkingPerQuestion
        End Get
        Set(ByVal value As Double)
            _SkipMarkingPerQuestion = value
        End Set
    End Property

    Public Property NotAnsweredMarkingPerQuestion() As Double
        Get
            Return _NotAnsweredMarkingPerQuestion
        End Get
        Set(ByVal value As Double)
            _NotAnsweredMarkingPerQuestion = value
        End Set
    End Property

    Public Property QuePickPercentage() As Double
        Get
            Return _QuePickPercentage
        End Get
        Set(ByVal value As Double)
            _QuePickPercentage = value
        End Set
    End Property

    Dim _EntryDate As DateTime

    Public Property EntryDate() As DateTime
        Get
            Return _EntryDate
        End Get
        Set(ByVal value As DateTime)
            _EntryDate = value
        End Set
    End Property

End Class

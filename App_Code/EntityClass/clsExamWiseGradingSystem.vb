Imports Microsoft.VisualBasic

Public Class clsExamWiseGradingSystem

    Dim _ExamGradingSystemID, _ExamID, _LetterGrade, _GradingExplanation, _EntryBy As String

    Public Property ExamGradingSystemID() As String
        Get
            Return _ExamGradingSystemID
        End Get
        Set(ByVal value As String)
            _ExamGradingSystemID = value
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

    Public Property LetterGrade() As String
        Get
            Return _LetterGrade
        End Get
        Set(ByVal value As String)
            _LetterGrade = value
        End Set
    End Property

    Public Property GradingExplanation() As String
        Get
            Return _GradingExplanation
        End Get
        Set(ByVal value As String)
            _GradingExplanation = value
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

    Dim _FromPercentage, _ToPercentage, _GradePoint As Double

    Public Property FromPercentage() As Double
        Get
            Return _FromPercentage
        End Get
        Set(ByVal value As Double)
            _FromPercentage = value
        End Set
    End Property

    Public Property ToPercentage() As Double
        Get
            Return _ToPercentage
        End Get
        Set(ByVal value As Double)
            _ToPercentage = value
        End Set
    End Property

    Public Property GradePoint() As Double
        Get
            Return _GradePoint
        End Get
        Set(ByVal value As Double)
            _GradePoint = value
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

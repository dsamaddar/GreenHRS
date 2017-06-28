Imports Microsoft.VisualBasic

Public Class clsExam

    Dim _ExamID, _ExamName, _ExamCode, _GradingSystem, _EntryBy, _GradingSystemData, _ExamWiseSubjectData, _ExamInstructions As String

    Public Property ExamID() As String
        Get
            Return _ExamID
        End Get
        Set(ByVal value As String)
            _ExamID = value
        End Set
    End Property

    Public Property ExamName() As String
        Get
            Return _ExamName
        End Get
        Set(ByVal value As String)
            _ExamName = value
        End Set
    End Property

    Public Property ExamCode() As String
        Get
            Return _ExamCode
        End Get
        Set(ByVal value As String)
            _ExamCode = value
        End Set
    End Property

    Public Property GradingSystem() As String
        Get
            Return _GradingSystem
        End Get
        Set(ByVal value As String)
            _GradingSystem = value
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

    Public Property GradingSystemData() As String
        Get
            Return _GradingSystemData
        End Get
        Set(ByVal value As String)
            _GradingSystemData = value
        End Set
    End Property

    Public Property ExamWiseSubjectData() As String
        Get
            Return _ExamWiseSubjectData
        End Get
        Set(ByVal value As String)
            _ExamWiseSubjectData = value
        End Set
    End Property

    Public Property ExamInstructions() As String
        Get
            Return _ExamInstructions
        End Get
        Set(ByVal value As String)
            _ExamInstructions = value
        End Set
    End Property

    Dim _PositiveMarkingPerQuestion, _NegativeMarkingPerQuestion, _SkipMarkingPerQuestion, _NotAnsweredMarkingPerQuestion, _TotalMarks, _AllocationRemaining As Double

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

    Public Property TotalMarks() As Double
        Get
            Return _TotalMarks
        End Get
        Set(ByVal value As Double)
            _TotalMarks = value
        End Set
    End Property

    Public Property AllocationRemaining() As Double
        Get
            Return _AllocationRemaining
        End Get
        Set(ByVal value As Double)
            _AllocationRemaining = value
        End Set
    End Property

    Dim _TotalQuestion, _TotalTime, _AllocatedQuestionRemaining As Integer

    Public Property TotalQuestion() As Integer
        Get
            Return _TotalQuestion
        End Get
        Set(ByVal value As Integer)
            _TotalQuestion = value
        End Set
    End Property

    Public Property TotalTime() As Integer
        Get
            Return _TotalTime
        End Get
        Set(ByVal value As Integer)
            _TotalTime = value
        End Set
    End Property

    Public Property AllocatedQuestionRemaining() As Integer
        Get
            Return _AllocatedQuestionRemaining
        End Get
        Set(ByVal value As Integer)
            _AllocatedQuestionRemaining = value
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

    Dim _IsDynamic, _IsActive As Boolean

    Public Property IsDynamic() As Boolean
        Get
            Return _IsDynamic
        End Get
        Set(ByVal value As Boolean)
            _IsDynamic = value
        End Set
    End Property

    Public Property IsActive() As Boolean
        Get
            Return _IsActive
        End Get
        Set(ByVal value As Boolean)
            _IsActive = value
        End Set
    End Property

End Class

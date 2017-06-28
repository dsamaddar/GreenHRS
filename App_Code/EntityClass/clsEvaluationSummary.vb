Imports Microsoft.VisualBasic

Public Class clsEvaluationSummary

    Dim _EmpEvaluationSummaryID, _PerformanceRatingID, _PerformanceRatingSecID, _EmployeeID, _Remarks, _PrimaryEvaluator, _SecondaryEvaluator, _Disagreement As String

    Public Property EmpEvaluationSummaryID() As String
        Get
            Return _EmpEvaluationSummaryID
        End Get
        Set(ByVal value As String)
            _EmpEvaluationSummaryID = value
        End Set
    End Property

    Public Property PerformanceRatingID() As String
        Get
            Return _PerformanceRatingID
        End Get
        Set(ByVal value As String)
            _PerformanceRatingID = value
        End Set
    End Property

    Public Property PerformanceRatingSecID() As String
        Get
            Return _PerformanceRatingSecID
        End Get
        Set(ByVal value As String)
            _PerformanceRatingSecID = value
        End Set
    End Property

    Public Property EmployeeID() As String
        Get
            Return _EmployeeID
        End Get
        Set(ByVal value As String)
            _EmployeeID = value
        End Set
    End Property

    Public Property Remarks() As String
        Get
            Return _Remarks
        End Get
        Set(ByVal value As String)
            _Remarks = value
        End Set
    End Property

    Public Property PrimaryEvaluator() As String
        Get
            Return _PrimaryEvaluator
        End Get
        Set(ByVal value As String)
            _PrimaryEvaluator = value
        End Set
    End Property

    Public Property SecondaryEvaluator() As String
        Get
            Return _SecondaryEvaluator
        End Get
        Set(ByVal value As String)
            _SecondaryEvaluator = value
        End Set
    End Property

    Public Property Disagreement() As String
        Get
            Return _Disagreement
        End Get
        Set(ByVal value As String)
            _Disagreement = value
        End Set
    End Property

    Dim _EvaluationFrom, _EvaluationTo, _PrimaryEvalTime, _SecondaryEvalTime As DateTime

    Public Property EvaluationFrom() As DateTime
        Get
            Return _EvaluationFrom
        End Get
        Set(ByVal value As DateTime)
            _EvaluationFrom = value
        End Set
    End Property

    Public Property EvaluationTo() As DateTime
        Get
            Return _EvaluationTo
        End Get
        Set(ByVal value As DateTime)
            _EvaluationTo = value
        End Set
    End Property

    Public Property PrimaryEvalTime() As DateTime
        Get
            Return _PrimaryEvalTime
        End Get
        Set(ByVal value As DateTime)
            _PrimaryEvalTime = value
        End Set
    End Property

    Public Property SecondaryEvalTime() As DateTime
        Get
            Return _SecondaryEvalTime
        End Get
        Set(ByVal value As DateTime)
            _SecondaryEvalTime = value
        End Set
    End Property

    Dim _EvaluationYear As Integer

    Public Property EvaluationYear() As Integer
        Get
            Return _EvaluationYear
        End Get
        Set(ByVal value As Integer)
            _EvaluationYear = value
        End Set
    End Property


    Dim _IsSecEvalNeeded, _RecForBonus, _RecForProgression, _RecForBonusSec, _RecForProgressionSec As Boolean

    Public Property IsSecEvalNeeded() As Boolean
        Get
            Return _IsSecEvalNeeded
        End Get
        Set(ByVal value As Boolean)
            _IsSecEvalNeeded = value
        End Set
    End Property

    Public Property RecForBonus() As Boolean
        Get
            Return _RecForBonus
        End Get
        Set(ByVal value As Boolean)
            _RecForBonus = value
        End Set
    End Property

    Public Property RecForProgression() As Boolean
        Get
            Return _RecForProgression
        End Get
        Set(ByVal value As Boolean)
            _RecForProgression = value
        End Set
    End Property

    Public Property RecForBonusSec() As Boolean
        Get
            Return _RecForBonusSec
        End Get
        Set(ByVal value As Boolean)
            _RecForBonusSec = value
        End Set
    End Property

    Public Property RecForProgressionSec() As Boolean
        Get
            Return _RecForProgressionSec
        End Get
        Set(ByVal value As Boolean)
            _RecForProgressionSec = value
        End Set
    End Property

End Class

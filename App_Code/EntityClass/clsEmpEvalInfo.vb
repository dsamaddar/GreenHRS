Imports Microsoft.VisualBasic

Public Class clsEmpEvalInfo

    Dim _EmpEvaluationID, _EmpEvaluationSummaryID, _PerformanceFactorID, _PrimaryEvalGrading, _SecondaryEvalGrading, _EvaluationType, _GradingValue As String

    Public Property EmpEvaluationID() As String
        Get
            Return _EmpEvaluationID
        End Get
        Set(ByVal value As String)
            _EmpEvaluationID = value
        End Set
    End Property

    Public Property EmpEvaluationSummaryID() As String
        Get
            Return _EmpEvaluationSummaryID
        End Get
        Set(ByVal value As String)
            _EmpEvaluationSummaryID = value
        End Set
    End Property

    Public Property PerformanceFactorID() As String
        Get
            Return _PerformanceFactorID
        End Get
        Set(ByVal value As String)
            _PerformanceFactorID = value
        End Set
    End Property

    Public Property PrimaryEvalGrading() As String
        Get
            Return _PrimaryEvalGrading
        End Get
        Set(ByVal value As String)
            _PrimaryEvalGrading = value
        End Set
    End Property

    Public Property SecondaryEvalGrading() As String
        Get
            Return _SecondaryEvalGrading
        End Get
        Set(ByVal value As String)
            _SecondaryEvalGrading = value
        End Set
    End Property

    Public Property EvaluationType() As String
        Get
            Return _EvaluationType
        End Get
        Set(ByVal value As String)
            _EvaluationType = value
        End Set
    End Property

    Public Property GradingValue() As String
        Get
            Return _GradingValue
        End Get
        Set(ByVal value As String)
            _GradingValue = value
        End Set
    End Property

End Class

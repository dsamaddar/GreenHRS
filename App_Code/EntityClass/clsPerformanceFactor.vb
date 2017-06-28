Imports Microsoft.VisualBasic

Public Class clsPerformanceFactor

    Dim _PerformanceFactorID, _EvaluationGroupID, _PerformancePartID, _PerformanceTitle, _Explanation, _EntryBy As String

    Public Property PerformanceFactorID() As String
        Get
            Return _PerformanceFactorID
        End Get
        Set(ByVal value As String)
            _PerformanceFactorID = value
        End Set
    End Property

    Public Property EvaluationGroupID() As String
        Get
            Return _EvaluationGroupID
        End Get
        Set(ByVal value As String)
            _EvaluationGroupID = value
        End Set
    End Property

    Public Property PerformancePartID() As String
        Get
            Return _PerformancePartID
        End Get
        Set(ByVal value As String)
            _PerformancePartID = value
        End Set
    End Property

    Public Property PerformanceTitle() As String
        Get
            Return _PerformanceTitle
        End Get
        Set(ByVal value As String)
            _PerformanceTitle = value
        End Set
    End Property

    Public Property Explanation() As String
        Get
            Return _Explanation
        End Get
        Set(ByVal value As String)
            _Explanation = value
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

    Dim _ViewOrder As Integer

    Public Property ViewOrder() As Integer
        Get
            Return _ViewOrder
        End Get
        Set(ByVal value As Integer)
            _ViewOrder = value
        End Set
    End Property

    Dim _IsActive As Boolean

    Public Property IsActive() As Boolean
        Get
            Return _IsActive
        End Get
        Set(ByVal value As Boolean)
            _IsActive = value
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

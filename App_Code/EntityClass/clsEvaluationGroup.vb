Imports Microsoft.VisualBasic

Public Class clsEvaluationGroup

    Dim _EvaluationGroupID, _EvaluationGroup, _EntryBy As String

    Public Property EvaluationGroupID() As String
        Get
            Return _EvaluationGroupID
        End Get
        Set(ByVal value As String)
            _EvaluationGroupID = value
        End Set
    End Property

    Public Property EvaluationGroup() As String
        Get
            Return _EvaluationGroup
        End Get
        Set(ByVal value As String)
            _EvaluationGroup = value
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

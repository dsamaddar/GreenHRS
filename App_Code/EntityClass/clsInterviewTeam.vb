Imports Microsoft.VisualBasic

Public Class clsInterviewTeam

    Dim _IntTeamID, _IntTeamName, _EntryBy As String

    Public Property IntTeamID() As String
        Get
            Return _IntTeamID
        End Get
        Set(ByVal value As String)
            _IntTeamID = value
        End Set
    End Property

    Public Property IntTeamName() As String
        Get
            Return _IntTeamName
        End Get
        Set(ByVal value As String)
            _IntTeamName = value
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

    Dim _EntryDate As DateTime

    Public Property EntryDate() As DateTime
        Get
            Return _EntryDate
        End Get
        Set(ByVal value As DateTime)
            _EntryDate = value
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

End Class

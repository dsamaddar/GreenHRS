Imports Microsoft.VisualBasic

Public Class clsInterviewPanel

    Dim _IntPanelID, _IntTeamID, _IntMemberTypeID, _IntPanelMemberID, _EntryBy As String

    Public Property IntPanelID() As String
        Get
            Return _IntPanelID
        End Get
        Set(ByVal value As String)
            _IntPanelID = value
        End Set
    End Property

    Public Property IntTeamID() As String
        Get
            Return _IntTeamID
        End Get
        Set(ByVal value As String)
            _IntTeamID = value
        End Set
    End Property

    Public Property IntMemberTypeID() As String
        Get
            Return _IntMemberTypeID
        End Get
        Set(ByVal value As String)
            _IntMemberTypeID = value
        End Set
    End Property

    Public Property IntPanelMemberID() As String
        Get
            Return _IntPanelMemberID
        End Get
        Set(ByVal value As String)
            _IntPanelMemberID = value
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

End Class

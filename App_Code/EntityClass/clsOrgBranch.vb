Imports Microsoft.VisualBasic

Public Class clsOrgBranch

    Dim _BranchID, _OrganizationID, _BranchName, _BranchAddress, _EntryBy As String

    Public Property BranchID() As String
        Get
            Return _BranchID
        End Get
        Set(ByVal value As String)
            _BranchID = value
        End Set
    End Property

    Public Property OrganizationID() As String
        Get
            Return _OrganizationID
        End Get
        Set(ByVal value As String)
            _OrganizationID = value
        End Set
    End Property

    Public Property BranchName() As String
        Get
            Return _BranchName
        End Get
        Set(ByVal value As String)
            _BranchName = value
        End Set
    End Property

    Public Property BranchAddress() As String
        Get
            Return _BranchAddress
        End Get
        Set(ByVal value As String)
            _BranchAddress = value
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

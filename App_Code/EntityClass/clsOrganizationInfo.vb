Imports Microsoft.VisualBasic

Public Class clsOrganizationInfo

    Dim _OrganizationID, _OrgName, _OrgProfile, _Country, _Address, _EntryBy, _Telephone, _Fax, _Mobile As String

    Public Property OrganizationID() As String
        Get
            Return _OrganizationID
        End Get
        Set(ByVal value As String)
            _OrganizationID = value
        End Set
    End Property

    Public Property OrgName() As String
        Get
            Return _OrgName
        End Get
        Set(ByVal value As String)
            _OrgName = value
        End Set
    End Property

    Public Property OrgProfile() As String
        Get
            Return _OrgProfile
        End Get
        Set(ByVal value As String)
            _OrgProfile = value
        End Set
    End Property

    Public Property Country() As String
        Get
            Return _Country
        End Get
        Set(ByVal value As String)
            _Country = value
        End Set
    End Property

    Public Property Address() As String
        Get
            Return _Address
        End Get
        Set(ByVal value As String)
            _Address = value
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

    Public Property Telephone() As String
        Get
            Return _Telephone
        End Get
        Set(ByVal value As String)
            _Telephone = value
        End Set
    End Property

    Public Property Fax() As String
        Get
            Return _Fax
        End Get
        Set(ByVal value As String)
            _Fax = value
        End Set
    End Property

    Public Property Mobile() As String
        Get
            Return _Mobile
        End Get
        Set(ByVal value As String)
            _Mobile = value
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

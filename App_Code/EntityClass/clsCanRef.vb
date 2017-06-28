Imports Microsoft.VisualBasic

Public Class clsCanRef
    Dim _Name, _Designation, _OrganizationName, _Address, _MobileNo, _Email, _RefRelationName, _RefRelationID As String

    Public Property Name() As String
        Get
            Return _Name
        End Get
        Set(ByVal value As String)
            _Name = value
        End Set
    End Property

    Public Property Designation() As String
        Get
            Return _Designation
        End Get
        Set(ByVal value As String)
            _Designation = value
        End Set
    End Property

    Public Property OrganizationName() As String
        Get
            Return _OrganizationName
        End Get
        Set(ByVal value As String)
            _OrganizationName = value
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
    Public Property MobileNo() As String
        Get
            Return _MobileNo
        End Get
        Set(ByVal value As String)
            _MobileNo = value
        End Set
    End Property
    Public Property Email() As String
        Get
            Return _Email
        End Get
        Set(ByVal value As String)
            _Email = value
        End Set
    End Property
    Public Property RefRelationName() As String
        Get
            Return _RefRelationName
        End Get
        Set(ByVal value As String)
            _RefRelationName = value
        End Set
    End Property
    Public Property RefRelationID() As String
        Get
            Return _RefRelationID
        End Get
        Set(ByVal value As String)
            _RefRelationID = value
        End Set
    End Property
End Class

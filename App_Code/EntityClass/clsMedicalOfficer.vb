Imports Microsoft.VisualBasic

Public Class clsMedicalOfficer

    Dim _MedOffID, _MedOfficerName, _Organization, _Branch, _Designation, _Address_HouseNo, _Address_Road, _Address_Telephone, _Address_Mobile, _EntryBy As String

    Public Property MedOffID() As String
        Get
            Return _MedOffID
        End Get
        Set(ByVal value As String)
            _MedOffID = value
        End Set
    End Property

    Public Property MedOfficerName() As String
        Get
            Return _MedOfficerName
        End Get
        Set(ByVal value As String)
            _MedOfficerName = value
        End Set
    End Property

    Public Property Organization() As String
        Get
            Return _Organization
        End Get
        Set(ByVal value As String)
            _Organization = value
        End Set
    End Property

    Public Property Branch() As String
        Get
            Return _Branch
        End Get
        Set(ByVal value As String)
            _Branch = value
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

    Public Property Address_HouseNo() As String
        Get
            Return _Address_HouseNo
        End Get
        Set(ByVal value As String)
            _Address_HouseNo = value
        End Set
    End Property

    Public Property Address_Road() As String
        Get
            Return _Address_Road
        End Get
        Set(ByVal value As String)
            _Address_Road = value
        End Set
    End Property

    Public Property Address_Telephone() As String
        Get
            Return _Address_Telephone
        End Get
        Set(ByVal value As String)
            _Address_Telephone = value
        End Set
    End Property

    Public Property Address_Mobile() As String
        Get
            Return _Address_Mobile
        End Get
        Set(ByVal value As String)
            _Address_Mobile = value
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

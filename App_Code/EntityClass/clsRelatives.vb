Imports Microsoft.VisualBasic

Public Class clsRelatives

    Dim _RelativeID, _Gender, _EmployeeID, _RelationTypeID, _NameOfRelative, _DateOfBirth, _RelAddress, _Details, _ContactNumber, _FamilyInsuranceNo, _EntryBy As String

    Public Property FamilyInsuranceNo() As String
        Get
            Return _FamilyInsuranceNo
        End Get
        Set(ByVal value As String)
            _FamilyInsuranceNo = value
        End Set
    End Property

    Public Property RelativeID() As String
        Get
            Return _RelativeID
        End Get
        Set(ByVal value As String)
            _RelativeID = value
        End Set
    End Property

    Public Property Gender() As String
        Get
            Return _Gender
        End Get
        Set(ByVal value As String)
            _Gender = value
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

    Public Property RelationTypeID() As String
        Get
            Return _RelationTypeID
        End Get
        Set(ByVal value As String)
            _RelationTypeID = value
        End Set
    End Property

    Public Property NameOfRelative() As String
        Get
            Return _NameOfRelative
        End Get
        Set(ByVal value As String)
            _NameOfRelative = value
        End Set
    End Property

    Public Property DateOfBirth() As String
        Get
            Return _DateOfBirth
        End Get
        Set(ByVal value As String)
            _DateOfBirth = value
        End Set
    End Property

    Public Property RelAddress() As String
        Get
            Return _RelAddress
        End Get
        Set(ByVal value As String)
            _RelAddress = value
        End Set
    End Property

    Public Property Details() As String
        Get
            Return _Details
        End Get
        Set(ByVal value As String)
            _Details = value
        End Set
    End Property

    Public Property ContactNumber() As String
        Get
            Return _ContactNumber
        End Get
        Set(ByVal value As String)
            _ContactNumber = value
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

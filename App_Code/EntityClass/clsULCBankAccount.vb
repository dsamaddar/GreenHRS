Imports Microsoft.VisualBasic

Public Class clsULCBankAccount

    Dim _ULCBankAccID, _BankID, _BranchID, _AccountNo, _AccountCode, _AccountType, _AddressingPerson, _Address_HouseNo, _Address_RoadNo, _Address_Post, _EntryBy As String

    Public Property ULCBankAccID() As String
        Get
            Return _ULCBankAccID
        End Get
        Set(ByVal value As String)
            _ULCBankAccID = value
        End Set
    End Property

    Public Property BankID() As String
        Get
            Return _BankID
        End Get
        Set(ByVal value As String)
            _BankID = value
        End Set
    End Property

    Public Property BranchID() As String
        Get
            Return _BranchID
        End Get
        Set(ByVal value As String)
            _BranchID = value
        End Set
    End Property

    Public Property AccountNo() As String
        Get
            Return _AccountNo
        End Get
        Set(ByVal value As String)
            _AccountNo = value
        End Set
    End Property

    Public Property AccountCode() As String
        Get
            Return _AccountCode
        End Get
        Set(ByVal value As String)
            _AccountCode = value
        End Set
    End Property

    Public Property AccountType() As String
        Get
            Return _AccountType
        End Get
        Set(ByVal value As String)
            _AccountType = value
        End Set
    End Property

    Public Property AddressingPerson() As String
        Get
            Return _AddressingPerson
        End Get
        Set(ByVal value As String)
            _AddressingPerson = value
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

    Public Property Address_RoadNo() As String
        Get
            Return _Address_RoadNo
        End Get
        Set(ByVal value As String)
            _Address_RoadNo = value
        End Set
    End Property

    Public Property Address_Post() As String
        Get
            Return _Address_Post
        End Get
        Set(ByVal value As String)
            _Address_Post = value
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

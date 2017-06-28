Imports Microsoft.VisualBasic

Public Class clsRegister

    Dim _RegistrationID, _UserName, _UserID, _Password, _Email, _MobileNumber, _ValidationCode, _NationalID As String

    Public Property RegistrationID() As String
        Get
            Return _RegistrationID
        End Get
        Set(ByVal value As String)
            _RegistrationID = value
        End Set
    End Property

    Public Property UserName() As String
        Get
            Return _UserName
        End Get
        Set(ByVal value As String)
            _UserName = value
        End Set
    End Property

    Public Property UserID() As String
        Get
            Return _UserID
        End Get
        Set(ByVal value As String)
            _UserID = value
        End Set
    End Property

    Public Property Password() As String
        Get
            Return _Password
        End Get
        Set(ByVal value As String)
            _Password = value
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

    Public Property MobileNumber() As String
        Get
            Return _MobileNumber
        End Get
        Set(ByVal value As String)
            _MobileNumber = value
        End Set
    End Property

    Public Property ValidationCode() As String
        Get
            Return _ValidationCode
        End Get
        Set(ByVal value As String)
            _ValidationCode = value
        End Set
    End Property

    Public Property NationalID() As String
        Get
            Return _NationalID
        End Get
        Set(ByVal value As String)
            _NationalID = value
        End Set
    End Property

    Dim _DateOfBirth, _EntryDate As DateTime

    Public Property DateOfBirth() As DateTime
        Get
            Return _DateOfBirth
        End Get
        Set(ByVal value As DateTime)
            _DateOfBirth = value
        End Set
    End Property

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

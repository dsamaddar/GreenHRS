Imports Microsoft.VisualBasic

Public Class clsContactUs
    Dim _Name, _Email, _PhoneNo, _ValidationCode, _Message, _EntryBy As String
    Dim _ContactUsID, _RepMessage As String

    Public Property ContactUsID() As String
        Get
            Return _ContactUsID
        End Get
        Set(ByVal value As String)
            _ContactUsID = value
        End Set
    End Property
    Public Property RepMessage() As String
        Get
            Return _RepMessage
        End Get
        Set(ByVal value As String)
            _RepMessage = value
        End Set
    End Property
    Public Property Name() As String
        Get
            Return _Name
        End Get
        Set(ByVal value As String)
            _Name = value
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

    Public Property PhoneNo() As String
        Get
            Return _PhoneNo
        End Get
        Set(ByVal value As String)
            _PhoneNo = value
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
    Public Property Message() As String
        Get
            Return _Message
        End Get
        Set(ByVal value As String)
            _Message = value
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
End Class

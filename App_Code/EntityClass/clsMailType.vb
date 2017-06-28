Imports Microsoft.VisualBasic

Public Class clsMailType
    Dim _MailTypeID, _MailType, _EntryBy As String
    Dim _IsActive As Boolean

    Public Property MailTypeID() As String
        Get
            Return _MailTypeID
        End Get
        Set(ByVal value As String)
            _MailTypeID = value
        End Set
    End Property

    Public Property MailType() As String
        Get
            Return _MailType
        End Get
        Set(ByVal value As String)
            _MailType = value
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

    Public Property IsActive() As Boolean
        Get
            Return _IsActive
        End Get
        Set(ByVal value As Boolean)
            _IsActive = value
        End Set
    End Property
End Class

Imports Microsoft.VisualBasic

Public Class clsUserMessage

    Dim _MessageID, _UniqueUserID, _MessageBody, _IssuedBy, _SMSSentBy, _EmailSentBy As String

    Public Property MessageID() As String
        Get
            Return _MessageID
        End Get
        Set(ByVal value As String)
            _MessageID = value
        End Set
    End Property

    Public Property UniqueUserID() As String
        Get
            Return _UniqueUserID
        End Get
        Set(ByVal value As String)
            _UniqueUserID = value
        End Set
    End Property

    Public Property MessageBody() As String
        Get
            Return _MessageBody
        End Get
        Set(ByVal value As String)
            _MessageBody = value
        End Set
    End Property

    Public Property IssuedBy() As String
        Get
            Return _IssuedBy
        End Get
        Set(ByVal value As String)
            _IssuedBy = value
        End Set
    End Property

    Public Property SMSSentBy() As String
        Get
            Return _SMSSentBy
        End Get
        Set(ByVal value As String)
            _SMSSentBy = value
        End Set
    End Property

    Public Property EmailSentBy() As String
        Get
            Return _EmailSentBy
        End Get
        Set(ByVal value As String)
            _EmailSentBy = value
        End Set
    End Property


    Dim _IsSMSSent, _IsEMailSent, _IsActive As Boolean

    Public Property IsSMSSent() As Boolean
        Get
            Return _IsSMSSent
        End Get
        Set(ByVal value As Boolean)
            _IsSMSSent = value
        End Set
    End Property

    Public Property IsEMailSent() As Boolean
        Get
            Return _IsEMailSent
        End Get
        Set(ByVal value As Boolean)
            _IsEMailSent = value
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


    Dim _IssueDate, _SMSSentDate, _EmailSentDate As DateTime

    Public Property IssueDate() As DateTime
        Get
            Return _IssueDate
        End Get
        Set(ByVal value As DateTime)
            _IssueDate = value
        End Set
    End Property

    Public Property SMSSentDate() As DateTime
        Get
            Return _SMSSentDate
        End Get
        Set(ByVal value As DateTime)
            _SMSSentDate = value
        End Set
    End Property

    Public Property EmailSentDate() As DateTime
        Get
            Return _EmailSentDate
        End Get
        Set(ByVal value As DateTime)
            _EmailSentDate = value
        End Set
    End Property

End Class

Imports Microsoft.VisualBasic

Public Class clsSMSService

    Dim _SMSID, _Name, _UniqueUserID, _Category, _ContactNumber, _Sender, _SMSContent, _SMSContentList, _Participant, _NotifiedBy, _Dept, _MessageIDList As String

    Public Property SMSID() As String
        Get
            Return _SMSID
        End Get
        Set(ByVal value As String)
            _SMSID = value
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

    Public Property UniqueUserID() As String
        Get
            Return _UniqueUserID
        End Get
        Set(ByVal value As String)
            _UniqueUserID = value
        End Set
    End Property

    Public Property Category() As String
        Get
            Return _Category
        End Get
        Set(ByVal value As String)
            _Category = value
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

    Public Property Sender() As String
        Get
            Return _Sender
        End Get
        Set(ByVal value As String)
            _Sender = value
        End Set
    End Property

    Public Property SMSContent() As String
        Get
            Return _SMSContent
        End Get
        Set(ByVal value As String)
            _SMSContent = value
        End Set
    End Property

    Public Property SMSContentList() As String
        Get
            Return _SMSContentList
        End Get
        Set(ByVal value As String)
            _SMSContentList = value
        End Set
    End Property

    Public Property Participant() As String
        Get
            Return _Participant
        End Get
        Set(ByVal value As String)
            _Participant = value
        End Set
    End Property

    Public Property NotifiedBy() As String
        Get
            Return _NotifiedBy
        End Get
        Set(ByVal value As String)
            _NotifiedBy = value
        End Set
    End Property

    Public Property Dept() As String
        Get
            Return _Dept
        End Get
        Set(ByVal value As String)
            _Dept = value
        End Set
    End Property

    Public Property MessageIDList() As String
        Get
            Return _MessageIDList
        End Get
        Set(ByVal value As String)
            _MessageIDList = value
        End Set
    End Property

    Dim _DeliveredOn, _SentOn, _SubmittedOn As DateTime

    Public Property DeliveredOn() As DateTime
        Get
            Return _DeliveredOn
        End Get
        Set(ByVal value As DateTime)
            _DeliveredOn = value
        End Set
    End Property

    Public Property SentOn() As DateTime
        Get
            Return _SentOn
        End Get
        Set(ByVal value As DateTime)
            _SentOn = value
        End Set
    End Property

    Public Property SubmittedOn() As DateTime
        Get
            Return _SubmittedOn
        End Get
        Set(ByVal value As DateTime)
            _SubmittedOn = value
        End Set
    End Property

    Dim _Accepted, _IsSent, _IsSubmitted As Boolean

    Public Property Accepted() As Boolean
        Get
            Return _Accepted
        End Get
        Set(ByVal value As Boolean)
            _Accepted = value
        End Set
    End Property

    Public Property IsSent() As Boolean
        Get
            Return _IsSent
        End Get
        Set(ByVal value As Boolean)
            _IsSent = value
        End Set
    End Property

    Public Property IsSubmitted() As Boolean
        Get
            Return _IsSubmitted
        End Get
        Set(ByVal value As Boolean)
            _IsSubmitted = value
        End Set
    End Property

    Dim _CMGSNumber As Integer

    Public Property CMGSNumber() As Integer
        Get
            Return _CMGSNumber
        End Get
        Set(ByVal value As Integer)
            _CMGSNumber = value
        End Set
    End Property

End Class

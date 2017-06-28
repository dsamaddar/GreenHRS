Imports Microsoft.VisualBasic

Public Class clsCandidateMailInfo

    Dim _CandidateName, _Email, _AlternateEmail, _CircularCode, _Title As String

    Public Property CandidateName() As String
        Get
            Return _CandidateName
        End Get
        Set(ByVal value As String)
            _CandidateName = value
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

    Public Property AlternateEmail() As String
        Get
            Return _AlternateEmail
        End Get
        Set(ByVal value As String)
            _AlternateEmail = value
        End Set
    End Property
    Public Property CircularCode() As String
        Get
            Return _CircularCode
        End Get
        Set(ByVal value As String)
            _CircularCode = value
        End Set
    End Property
    Public Property Title() As String
        Get
            Return _Title
        End Get
        Set(ByVal value As String)
            _Title = value
        End Set
    End Property
End Class

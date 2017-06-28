Imports Microsoft.VisualBasic

Public Class clsCandidateResponse

    Dim _CanResponseID, _CandidateID, _CommunicationMethod, _Options, _Remarks, _AssessedBy As String

    Public Property CanResponseID() As String
        Get
            Return _CanResponseID
        End Get
        Set(ByVal value As String)
            _CanResponseID = value
        End Set
    End Property

    Public Property CandidateID() As String
        Get
            Return _CandidateID
        End Get
        Set(ByVal value As String)
            _CandidateID = value
        End Set
    End Property

    Public Property CommunicationMethod() As String
        Get
            Return _CommunicationMethod
        End Get
        Set(ByVal value As String)
            _CommunicationMethod = value
        End Set
    End Property

    Public Property Options() As String
        Get
            Return _Options
        End Get
        Set(ByVal value As String)
            _Options = value
        End Set
    End Property

    Public Property Remarks() As String
        Get
            Return _Remarks
        End Get
        Set(ByVal value As String)
            _Remarks = value
        End Set
    End Property

    Public Property AssessedBy() As String
        Get
            Return _AssessedBy
        End Get
        Set(ByVal value As String)
            _AssessedBy = value
        End Set
    End Property

    Dim _AssessmentDate As DateTime

    Public Property AssessmentDate() As Date
        Get
            Return _AssessmentDate
        End Get
        Set(ByVal value As Date)
            _AssessmentDate = value
        End Set
    End Property

End Class

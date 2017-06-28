Imports Microsoft.VisualBasic

Public Class clsInterviewCandidate

    Dim _IntCandidateID, _CandidateID, _CircularID, _IntTeamID, _ULCBranchID, _EntryBy, _RejectedBy, _RejectionRemarks, _Participant As String

    Public Property IntCandidateID() As String
        Get
            Return _IntCandidateID
        End Get
        Set(ByVal value As String)
            _IntCandidateID = value
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

    Public Property CircularID() As String
        Get
            Return _CircularID
        End Get
        Set(ByVal value As String)
            _CircularID = value
        End Set
    End Property

    Public Property IntTeamID() As String
        Get
            Return _IntTeamID
        End Get
        Set(ByVal value As String)
            _IntTeamID = value
        End Set
    End Property

    Public Property ULCBranchID() As String
        Get
            Return _ULCBranchID
        End Get
        Set(ByVal value As String)
            _ULCBranchID = value
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

    Public Property RejectedBy() As String
        Get
            Return _RejectedBy
        End Get
        Set(ByVal value As String)
            _RejectedBy = value
        End Set
    End Property

    Public Property RejectionRemarks() As String
        Get
            Return _RejectionRemarks
        End Get
        Set(ByVal value As String)
            _RejectionRemarks = value
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

    Dim _InterviewDate, _InterviewTakenDate, _EntryDate As Date

    Public Property InterviewDate() As DateTime
        Get
            Return _InterviewDate
        End Get
        Set(ByVal value As DateTime)
            _InterviewDate = value
        End Set
    End Property

    Public Property InterviewTakenDate() As DateTime
        Get
            Return _InterviewTakenDate
        End Get
        Set(ByVal value As DateTime)
            _InterviewTakenDate = value
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

    Dim _InterviewTaken As Boolean

    Public Property InterviewTaken() As Boolean
        Get
            Return _InterviewTaken
        End Get
        Set(ByVal value As Boolean)
            _InterviewTaken = value
        End Set
    End Property

End Class

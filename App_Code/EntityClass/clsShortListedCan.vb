Imports Microsoft.VisualBasic

Public Class clsShortListedCan

    Dim _ShortListedCandidateID, _CircularID, _IntCandidateID, _CandidateID, _RecruitmentTypeID, _ULCBranchID, _EntryBy As String

    Public Property ShortListedCandidateID() As String
        Get
            Return _ShortListedCandidateID
        End Get
        Set(ByVal value As String)
            _ShortListedCandidateID = value
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

    Public Property RecruitmentTypeID() As String
        Get
            Return _RecruitmentTypeID
        End Get
        Set(ByVal value As String)
            _RecruitmentTypeID = value
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

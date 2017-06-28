Imports Microsoft.VisualBasic

Public Class clsCanRecruitmentTag

    Dim _CanRecruitmentTagID, _CandidateID, _RecruitmentTypeID, _EntryBy, _TagList As String

    Public Property CanRecruitmentTagID() As String
        Get
            Return _CanRecruitmentTagID
        End Get
        Set(ByVal value As String)
            _CanRecruitmentTagID = value
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

    Public Property EntryBy() As String
        Get
            Return _EntryBy
        End Get
        Set(ByVal value As String)
            _EntryBy = value
        End Set
    End Property

    Public Property TagList() As String
        Get
            Return _TagList
        End Get
        Set(ByVal value As String)
            _TagList = value
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

Imports Microsoft.VisualBasic

Public Class clsRecruitmentType

    Dim _RecruitmentTypeID, _RecruitmentType, _RecruitmentTypeCode, _Prerequisite, _Sourcing, _InterviewPanel, _EntryBy As String

    Public Property RecruitmentTypeID() As String
        Get
            Return _RecruitmentTypeID
        End Get
        Set(ByVal value As String)
            _RecruitmentTypeID = value
        End Set
    End Property

    Public Property RecruitmentType() As String
        Get
            Return _RecruitmentType
        End Get
        Set(ByVal value As String)
            _RecruitmentType = value
        End Set
    End Property

    Public Property RecruitmentTypeCode() As String
        Get
            Return _RecruitmentTypeCode
        End Get
        Set(ByVal value As String)
            _RecruitmentTypeCode = value
        End Set
    End Property

    Public Property Prerequisite() As String
        Get
            Return _Prerequisite
        End Get
        Set(ByVal value As String)
            _Prerequisite = value
        End Set
    End Property

    Public Property Sourcing() As String
        Get
            Return _Sourcing
        End Get
        Set(ByVal value As String)
            _Sourcing = value
        End Set
    End Property

    Public Property InterviewPanel() As String
        Get
            Return _InterviewPanel
        End Get
        Set(ByVal value As String)
            _InterviewPanel = value
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

    Dim _IsActive As Boolean

    Public Property IsActive() As Boolean
        Get
            Return _IsActive
        End Get
        Set(ByVal value As Boolean)
            _IsActive = value
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

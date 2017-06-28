Imports Microsoft.VisualBasic

Public Class clsScreeningInterview

    Dim _ScrInterviewID, _CandidateID, _InterviewMethod, _KnownDesignation, _KnownDesignationID, _KnownPerson, _HowToKnowThePerson, _Remarks, _
    _NextAction, _ScreenedBy, _CanSuitableForInfoData, _CanResMatchedInfoData, _ScrMultipleQuesAnswerData, _AppliedCircularToReject, _SuitableForRec As String

    Public Property ScrInterviewID() As String
        Get
            Return _ScrInterviewID
        End Get
        Set(ByVal value As String)
            _ScrInterviewID = value
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

    Public Property InterviewMethod() As String
        Get
            Return _InterviewMethod
        End Get
        Set(ByVal value As String)
            _InterviewMethod = value
        End Set
    End Property

    Public Property KnownDesignation() As String
        Get
            Return _KnownDesignation
        End Get
        Set(ByVal value As String)
            _KnownDesignation = value
        End Set
    End Property

    Public Property KnownDesignationID() As String
        Get
            Return _KnownDesignationID
        End Get
        Set(ByVal value As String)
            _KnownDesignationID = value
        End Set
    End Property

    Public Property KnownPerson() As String
        Get
            Return _KnownPerson
        End Get
        Set(ByVal value As String)
            _KnownPerson = value
        End Set
    End Property

    Public Property HowToKnowThePerson() As String
        Get
            Return _HowToKnowThePerson
        End Get
        Set(ByVal value As String)
            _HowToKnowThePerson = value
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

    Public Property NextAction() As String
        Get
            Return _NextAction
        End Get
        Set(ByVal value As String)
            _NextAction = value
        End Set
    End Property

    Public Property ScreenedBy() As String
        Get
            Return _ScreenedBy
        End Get
        Set(ByVal value As String)
            _ScreenedBy = value
        End Set
    End Property

    Public Property CanSuitableForInfoData() As String
        Get
            Return _CanSuitableForInfoData
        End Get
        Set(ByVal value As String)
            _CanSuitableForInfoData = value
        End Set
    End Property

    Public Property CanResMatchedInfoData() As String
        Get
            Return _CanResMatchedInfoData
        End Get
        Set(ByVal value As String)
            _CanResMatchedInfoData = value
        End Set
    End Property

    Public Property ScrMultipleQuesAnswerData() As String
        Get
            Return _ScrMultipleQuesAnswerData
        End Get
        Set(ByVal value As String)
            _ScrMultipleQuesAnswerData = value
        End Set
    End Property

    Public Property AppliedCircularToReject() As String
        Get
            Return _AppliedCircularToReject
        End Get
        Set(ByVal value As String)
            _AppliedCircularToReject = value
        End Set
    End Property

    Public Property SuitableForRec() As String
        Get
            Return _SuitableForRec
        End Get
        Set(ByVal value As String)
            _SuitableForRec = value
        End Set
    End Property

    Dim _IsAnyOneKnownToOurInstitution, _IsAccepted, _IsRejected As Boolean

    Public Property IsAnyOneKnownToOurInstitution() As Boolean
        Get
            Return _IsAnyOneKnownToOurInstitution
        End Get
        Set(ByVal value As Boolean)
            _IsAnyOneKnownToOurInstitution = value
        End Set
    End Property

    Public Property IsAccepted() As Boolean
        Get
            Return _IsAccepted
        End Get
        Set(ByVal value As Boolean)
            _IsAccepted = value
        End Set
    End Property

    Public Property IsRejected() As Boolean
        Get
            Return _IsRejected
        End Get
        Set(ByVal value As Boolean)
            _IsRejected = value
        End Set
    End Property

    Dim _ScreenedDate As DateTime

    Public Property ScreenedDate() As DateTime
        Get
            Return _ScreenedDate
        End Get
        Set(ByVal value As DateTime)
            _ScreenedDate = value
        End Set
    End Property

End Class

Imports Microsoft.VisualBasic

Public Class clsIntCandidateAssessment

    Dim _CandidateID, _CircularID, _IntAssessmentID, _IntCandidateID, _IntGradeID, _DesignationID, _DepartmentID, _ULCBranchID, _Observations, _
    _IntTakerID, _IntManQuestionIDList, _AttendeeList, _SuitableForRec, _IntReviewList, _SuitableForRegion, _SuitableForBranch, _EntryBy As String

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

    Public Property IntAssessmentID() As String
        Get
            Return _IntAssessmentID
        End Get
        Set(ByVal value As String)
            _IntAssessmentID = value
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

    Public Property IntGradeID() As String
        Get
            Return _IntGradeID
        End Get
        Set(ByVal value As String)
            _IntGradeID = value
        End Set
    End Property

    Public Property DesignationID() As String
        Get
            Return _DesignationID
        End Get
        Set(ByVal value As String)
            _DesignationID = value
        End Set
    End Property

    Public Property DepartmentID() As String
        Get
            Return _DepartmentID
        End Get
        Set(ByVal value As String)
            _DepartmentID = value
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

    Public Property Observations() As String
        Get
            Return _Observations
        End Get
        Set(ByVal value As String)
            _Observations = value
        End Set
    End Property

    Public Property IntTakerID() As String
        Get
            Return _IntTakerID
        End Get
        Set(ByVal value As String)
            _IntTakerID = value
        End Set
    End Property

    Public Property IntManQuestionIDList() As String
        Get
            Return _IntManQuestionIDList
        End Get
        Set(ByVal value As String)
            _IntManQuestionIDList = value
        End Set
    End Property

    Public Property AttendeeList() As String
        Get
            Return _AttendeeList
        End Get
        Set(ByVal value As String)
            _AttendeeList = value
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

    Public Property IntReviewList() As String
        Get
            Return _IntReviewList
        End Get
        Set(ByVal value As String)
            _IntReviewList = value
        End Set
    End Property

    Public Property SuitableForRegion() As String
        Get
            Return _SuitableForRegion
        End Get
        Set(ByVal value As String)
            _SuitableForRegion = value
        End Set
    End Property

    Public Property SuitableForBranch() As String
        Get
            Return _SuitableForBranch
        End Get
        Set(ByVal value As String)
            _SuitableForBranch = value
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

    Dim _MarksObtained, _MarksOutOf, _Grading As Double

    Public Property MarksObtained() As Double
        Get
            Return _MarksObtained
        End Get
        Set(ByVal value As Double)
            _MarksObtained = value
        End Set
    End Property

    Public Property MarksOutOf() As Double
        Get
            Return _MarksOutOf
        End Get
        Set(ByVal value As Double)
            _MarksOutOf = value
        End Set
    End Property

    Public Property Grading() As Double
        Get
            Return _Grading
        End Get
        Set(ByVal value As Double)
            _Grading = value
        End Set
    End Property

    Dim _IntTakenDate As DateTime

    Public Property IntTakenDate() As DateTime
        Get
            Return _IntTakenDate
        End Get
        Set(ByVal value As DateTime)
            _IntTakenDate = value
        End Set
    End Property

    Dim _IsSuitableAnyWhere As Boolean

    Public Property IsSuitableAnyWhere() As Boolean
        Get
            Return _IsSuitableAnyWhere
        End Get
        Set(ByVal value As Boolean)
            _IsSuitableAnyWhere = value
        End Set
    End Property

End Class

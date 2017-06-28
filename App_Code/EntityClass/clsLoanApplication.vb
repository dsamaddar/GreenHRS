Imports Microsoft.VisualBasic

Public Class clsLoanApplication

    Dim _BenefitID, _LoanApplicationID, _BenefitTypeID, _EmployeeID, _Recommender, _RecommendationRemarks, _ApprovedBy, _ApproverRemarks, _
    _RejectedBy, _RejectionRemarks, _LoanStatus, _Attachment, _EntryBy, _LoanAppEvent, _AppStatus As String

    Public Property BenefitID() As String
        Get
            Return _BenefitID
        End Get
        Set(ByVal value As String)
            _BenefitID = value
        End Set
    End Property

    Public Property LoanApplicationID() As String
        Get
            Return _LoanApplicationID
        End Get
        Set(ByVal value As String)
            _LoanApplicationID = value
        End Set
    End Property

    Public Property BenefitTypeID() As String
        Get
            Return _BenefitTypeID
        End Get
        Set(ByVal value As String)
            _BenefitTypeID = value
        End Set
    End Property

    Public Property EmployeeID() As String
        Get
            Return _EmployeeID
        End Get
        Set(ByVal value As String)
            _EmployeeID = value
        End Set
    End Property

    Public Property Recommender() As String
        Get
            Return _Recommender
        End Get
        Set(ByVal value As String)
            _Recommender = value
        End Set
    End Property

    Public Property RecommendationRemarks() As String
        Get
            Return _RecommendationRemarks
        End Get
        Set(ByVal value As String)
            _RecommendationRemarks = value
        End Set
    End Property

    Public Property ApprovedBy() As String
        Get
            Return _ApprovedBy
        End Get
        Set(ByVal value As String)
            _ApprovedBy = value
        End Set
    End Property

    Public Property ApproverRemarks() As String
        Get
            Return _ApproverRemarks
        End Get
        Set(ByVal value As String)
            _ApproverRemarks = value
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

    Public Property LoanStatus() As String
        Get
            Return _LoanStatus
        End Get
        Set(ByVal value As String)
            _LoanStatus = value
        End Set
    End Property

    Public Property Attachment() As String
        Get
            Return _Attachment
        End Get
        Set(ByVal value As String)
            _Attachment = value
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

    Public Property LoanAppEvent() As String
        Get
            Return _LoanAppEvent
        End Get
        Set(ByVal value As String)
            _LoanAppEvent = value
        End Set
    End Property

    Public Property AppStatus() As String
        Get
            Return _AppStatus
        End Get
        Set(ByVal value As String)
            _AppStatus = value
        End Set
    End Property

    Dim _LoanAmount As Double

    Public Property LoanAmount() As Double
        Get
            Return _LoanAmount
        End Get
        Set(ByVal value As Double)
            _LoanAmount = value
        End Set
    End Property

    Dim _IsApproved, _IsRejected, _IsRecommended As Boolean

    Public Property IsApproved() As Boolean
        Get
            Return _IsApproved
        End Get
        Set(ByVal value As Boolean)
            _IsApproved = value
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

    Public Property IsRecommended() As Boolean
        Get
            Return _IsRecommended
        End Get
        Set(ByVal value As Boolean)
            _IsRecommended = value
        End Set
    End Property

    Dim _RecommendationDate, _ApprovalDate, _RejectionDate, _EntryDate As DateTime

    Public Property RecommendationDate() As DateTime
        Get
            Return _RecommendationDate
        End Get
        Set(ByVal value As DateTime)
            _RecommendationDate = value
        End Set
    End Property

    Public Property ApprovalDate() As DateTime
        Get
            Return _ApprovalDate
        End Get
        Set(ByVal value As DateTime)
            _ApprovalDate = value
        End Set
    End Property

    Public Property RejectionDate() As DateTime
        Get
            Return _RejectionDate
        End Get
        Set(ByVal value As DateTime)
            _RejectionDate = value
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

End Class

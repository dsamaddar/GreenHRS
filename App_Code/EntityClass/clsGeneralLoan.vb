Imports Microsoft.VisualBasic

Public Class clsGeneralLoan

    Dim _GenLoanID, _EmployeeID, _BenefitTypeID, _Attachmen, _GenLoanType, _EntryBy, _Attachment, _PerformedByID, _Remarks, _EventName As String

    Public Property GenLoanID() As String
        Get
            Return _GenLoanID
        End Get
        Set(ByVal value As String)
            _GenLoanID = value
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

    Public Property BenefitTypeID() As String
        Get
            Return _BenefitTypeID
        End Get
        Set(ByVal value As String)
            _BenefitTypeID = value
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

    Public Property GenLoanType() As String
        Get
            Return _GenLoanType
        End Get
        Set(ByVal value As String)
            _GenLoanType = value
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

    Public Property PerformedByID() As String
        Get
            Return _PerformedByID
        End Get
        Set(ByVal value As String)
            _PerformedByID = value
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

    Public Property EventName() As String
        Get
            Return _EventName
        End Get
        Set(ByVal value As String)
            _EventName = value
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

    Dim _ReimbursementDate, _AmortizationDate, _EntryDate As DateTime

    Public Property ReimbursementDate() As DateTime
        Get
            Return _ReimbursementDate
        End Get
        Set(ByVal value As DateTime)
            _ReimbursementDate = value
        End Set
    End Property

    Public Property AmortizationDate() As DateTime
        Get
            Return _AmortizationDate
        End Get
        Set(ByVal value As DateTime)
            _AmortizationDate = value
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

    Dim _IsInsuranceRequired, _IsAmortized As Boolean

    Public Property IsInsuranceRequired() As Boolean
        Get
            Return _IsInsuranceRequired
        End Get
        Set(ByVal value As Boolean)
            _IsInsuranceRequired = value
        End Set
    End Property

    Public Property IsAmortized() As Boolean
        Get
            Return _IsAmortized
        End Get
        Set(ByVal value As Boolean)
            _IsAmortized = value
        End Set
    End Property

End Class

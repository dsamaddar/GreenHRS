Imports Microsoft.VisualBasic

Public Class clsEmpLoanAccount

    Dim _EmpLoanAccountID, _EmployeeID, _BenefitID, _BenefitTypeID, _BenefitType, _AdjustmentSource, _LoanStatus, _EntryBy, _
    _Amortization, _AdjustmentRemarks As String

    Public Property EmpLoanAccountID() As String
        Get
            Return _EmpLoanAccountID
        End Get
        Set(ByVal value As String)
            _EmpLoanAccountID = value
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

    Public Property BenefitID() As String
        Get
            Return _BenefitID
        End Get
        Set(ByVal value As String)
            _BenefitID = value
        End Set
    End Property

    Public Property BenefitType() As String
        Get
            Return _BenefitType
        End Get
        Set(ByVal value As String)
            _BenefitType = value
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

    Public Property AdjustmentSource() As String
        Get
            Return _AdjustmentSource
        End Get
        Set(ByVal value As String)
            _AdjustmentSource = value
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

    Public Property EntryBy() As String
        Get
            Return _EntryBy
        End Get
        Set(ByVal value As String)
            _EntryBy = value
        End Set
    End Property

    Public Property Amortization() As String
        Get
            Return _Amortization
        End Get
        Set(ByVal value As String)
            _Amortization = value
        End Set
    End Property

    Public Property AdjustmentRemarks() As String
        Get
            Return _AdjustmentRemarks
        End Get
        Set(ByVal value As String)
            _AdjustmentRemarks = value
        End Set
    End Property

    Dim _LoanAmount, _InterestRate, _SettlementAmount As Double

    Public Property LoanAmount() As Double
        Get
            Return _LoanAmount
        End Get
        Set(ByVal value As Double)
            _LoanAmount = value
        End Set
    End Property

    Public Property InterestRate() As Double
        Get
            Return _InterestRate
        End Get
        Set(ByVal value As Double)
            _InterestRate = value
        End Set
    End Property

    Public Property SettlementAmount() As Double
        Get
            Return _SettlementAmount
        End Get
        Set(ByVal value As Double)
            _SettlementAmount = value
        End Set
    End Property

    Dim _Tenure As Integer

    Public Property Tenure() As Integer
        Get
            Return _Tenure
        End Get
        Set(ByVal value As Integer)
            _Tenure = value
        End Set
    End Property

    Dim _ReimbursementDate, _EntryDate, _AdjustmentDate As DateTime

    Public Property ReimbursementDate() As DateTime
        Get
            Return _ReimbursementDate
        End Get
        Set(ByVal value As DateTime)
            _ReimbursementDate = value
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

    Public Property AdjustmentDate() As DateTime
        Get
            Return _AdjustmentDate
        End Get
        Set(ByVal value As DateTime)
            _AdjustmentDate = value
        End Set
    End Property

    Dim _IsAdjustableFromSalary, _IsAbatementApplicable, _IsDepreciatedAutomatically As Boolean

    Public Property IsAdjustableFromSalary() As Boolean
        Get
            Return _IsAdjustableFromSalary
        End Get
        Set(ByVal value As Boolean)
            _IsAdjustableFromSalary = value
        End Set
    End Property

    Public Property IsAbatementApplicable() As Boolean
        Get
            Return _IsAbatementApplicable
        End Get
        Set(ByVal value As Boolean)
            _IsAbatementApplicable = value
        End Set
    End Property

    Public Property IsDepreciatedAutomatically() As Boolean
        Get
            Return _IsDepreciatedAutomatically
        End Get
        Set(ByVal value As Boolean)
            _IsDepreciatedAutomatically = value
        End Set
    End Property

End Class

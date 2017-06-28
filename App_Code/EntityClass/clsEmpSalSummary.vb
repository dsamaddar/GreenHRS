Imports Microsoft.VisualBasic

Public Class clsEmpSalSummary

    Dim _EmployeeID, _EmpCode, _DepartmentID, _Department, _DesignationID, _Designation, _ULCBranchID, _ULCBranch, _BankID, _Bank, _BranchID, _Branch, _BankAccountNo, _ProcessingEntryPoint, _EntryBy As String

    Public Property EmployeeID() As String
        Get
            Return _EmployeeID
        End Get
        Set(ByVal value As String)
            _EmployeeID = value
        End Set
    End Property

    Public Property EmpCode() As String
        Get
            Return _EmpCode
        End Get
        Set(ByVal value As String)
            _EmpCode = value
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

    Public Property Department() As String
        Get
            Return _Department
        End Get
        Set(ByVal value As String)
            _Department = value
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

    Public Property Designation() As String
        Get
            Return _Designation
        End Get
        Set(ByVal value As String)
            _Designation = value
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

    Public Property ULCBranch() As String
        Get
            Return _ULCBranch
        End Get
        Set(ByVal value As String)
            _ULCBranch = value
        End Set
    End Property

    Public Property BankID() As String
        Get
            Return _BankID
        End Get
        Set(ByVal value As String)
            _BankID = value
        End Set
    End Property

    Public Property Bank() As String
        Get
            Return _Bank
        End Get
        Set(ByVal value As String)
            _Bank = value
        End Set
    End Property

    Public Property BranchID() As String
        Get
            Return _BranchID
        End Get
        Set(ByVal value As String)
            _BranchID = value
        End Set
    End Property

    Public Property Branch() As String
        Get
            Return _Branch
        End Get
        Set(ByVal value As String)
            _Branch = value
        End Set
    End Property

    Public Property BankAccountNo() As String
        Get
            Return _BankAccountNo
        End Get
        Set(ByVal value As String)
            _BankAccountNo = value
        End Set
    End Property

    Public Property ProcessingEntryPoint() As String
        Get
            Return _ProcessingEntryPoint
        End Get
        Set(ByVal value As String)
            _ProcessingEntryPoint = value
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

    Dim _BasicSalary, _Salary, _PositiveComponent, _NegativeComponent, _HiddenComponent, _LoanSettlement, _TaxDeduction As Double

    Public Property BasicSalary() As Double
        Get
            Return _BasicSalary
        End Get
        Set(ByVal value As Double)
            _BasicSalary = value
        End Set
    End Property

    Public Property Salary() As Double
        Get
            Return _Salary
        End Get
        Set(ByVal value As Double)
            _Salary = value
        End Set
    End Property

    Public Property PositiveComponent() As Double
        Get
            Return _PositiveComponent
        End Get
        Set(ByVal value As Double)
            _PositiveComponent = value
        End Set
    End Property

    Public Property NegativeComponent() As Double
        Get
            Return _NegativeComponent
        End Get
        Set(ByVal value As Double)
            _NegativeComponent = value
        End Set
    End Property

    Public Property HiddenComponent() As Double
        Get
            Return _HiddenComponent
        End Get
        Set(ByVal value As Double)
            _HiddenComponent = value
        End Set
    End Property

    Public Property LoanSettlement() As Double
        Get
            Return _LoanSettlement
        End Get
        Set(ByVal value As Double)
            _LoanSettlement = value
        End Set
    End Property

    Public Property TaxDeduction() As Double
        Get
            Return _TaxDeduction
        End Get
        Set(ByVal value As Double)
            _TaxDeduction = value
        End Set
    End Property

    Dim _SalaryYear, _SalaryMonth As Integer

    Public Property SalaryYear() As Integer
        Get
            Return _SalaryYear
        End Get
        Set(ByVal value As Integer)
            _SalaryYear = value
        End Set
    End Property

    Public Property SalaryMonth() As Integer
        Get
            Return _SalaryMonth
        End Get
        Set(ByVal value As Integer)
            _SalaryMonth = value
        End Set
    End Property

    Dim _EffectiveDate, _SalStartDate, _SalEndDate As DateTime

    Public Property EffectiveDate() As DateTime
        Get
            Return _EffectiveDate
        End Get
        Set(ByVal value As DateTime)
            _EffectiveDate = value
        End Set
    End Property

    Public Property SalStartDate() As DateTime
        Get
            Return _SalStartDate
        End Get
        Set(ByVal value As DateTime)
            _SalStartDate = value
        End Set
    End Property

    Public Property SalEndDate() As DateTime
        Get
            Return _SalEndDate
        End Get
        Set(ByVal value As DateTime)
            _SalEndDate = value
        End Set
    End Property

    Dim _IsFullMonthlySalary, _IsSalaryProcessed, _IsTDProcessed, _IsFBProcessed, _IsPBProcessed As Boolean

    Public Property IsFullMonthlySalary() As Boolean
        Get
            Return _IsFullMonthlySalary
        End Get
        Set(ByVal value As Boolean)
            _IsFullMonthlySalary = value
        End Set
    End Property

    Public Property IsSalaryProcessed() As Boolean
        Get
            Return _IsSalaryProcessed
        End Get
        Set(ByVal value As Boolean)
            _IsSalaryProcessed = value
        End Set
    End Property

    Public Property IsTDProcessed() As Boolean
        Get
            Return _IsTDProcessed
        End Get
        Set(ByVal value As Boolean)
            _IsTDProcessed = value
        End Set
    End Property

    Public Property IsFBProcessed() As Boolean
        Get
            Return _IsFBProcessed
        End Get
        Set(ByVal value As Boolean)
            _IsFBProcessed = value
        End Set
    End Property

    Public Property IsPBProcessed() As Boolean
        Get
            Return _IsPBProcessed
        End Get
        Set(ByVal value As Boolean)
            _IsPBProcessed = value
        End Set
    End Property

End Class

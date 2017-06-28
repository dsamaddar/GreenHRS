Imports Microsoft.VisualBasic

Public Class clsSalaryProcess

    Dim _EmployeeIDList, _EntryBy As String

    Public Property EmployeeIDList() As String
        Get
            Return _EmployeeIDList
        End Get
        Set(ByVal value As String)
            _EmployeeIDList = value
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

    Dim _IsFullMonthlySalary, _ProcessWithSalary, _ProcessWithTaxDeduction, _ProcessWithFestivalBonus, _ProcessWithPerformanceBonus As Boolean

    Public Property IsFullMonthlySalary() As Boolean
        Get
            Return _IsFullMonthlySalary
        End Get
        Set(ByVal value As Boolean)
            _IsFullMonthlySalary = value
        End Set
    End Property

    Public Property ProcessWithSalary() As Boolean
        Get
            Return _ProcessWithSalary
        End Get
        Set(ByVal value As Boolean)
            _ProcessWithSalary = value
        End Set
    End Property

    Public Property ProcessWithTaxDeduction() As Boolean
        Get
            Return _ProcessWithTaxDeduction
        End Get
        Set(ByVal value As Boolean)
            _ProcessWithTaxDeduction = value
        End Set
    End Property

    Public Property ProcessWithFestivalBonus() As Boolean
        Get
            Return _ProcessWithFestivalBonus
        End Get
        Set(ByVal value As Boolean)
            _ProcessWithFestivalBonus = value
        End Set
    End Property

    Public Property ProcessWithPerformanceBonus() As Boolean
        Get
            Return _ProcessWithPerformanceBonus
        End Get
        Set(ByVal value As Boolean)
            _ProcessWithPerformanceBonus = value
        End Set
    End Property

End Class

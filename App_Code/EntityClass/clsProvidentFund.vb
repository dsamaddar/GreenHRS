Imports Microsoft.VisualBasic

Public Class clsProvidentFund

    Dim _ProvidentFundID, _EmpCode, _EmployeeID, _Remarks, _EntryBy, _EntryPoint As String

    Public Property ProvidentFundID() As String
        Get
            Return _ProvidentFundID
        End Get
        Set(ByVal value As String)
            _ProvidentFundID = value
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

    Public Property EmployeeID() As String
        Get
            Return _EmployeeID
        End Get
        Set(ByVal value As String)
            _EmployeeID = value
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

    Public Property EntryBy() As String
        Get
            Return _EntryBy
        End Get
        Set(ByVal value As String)
            _EntryBy = value
        End Set
    End Property

    Public Property EntryPoint() As String
        Get
            Return _EntryPoint
        End Get
        Set(ByVal value As String)
            _EntryPoint = value
        End Set
    End Property

    Dim _SalMonth, _SalYear As Integer

    Public Property SalMonth() As Integer
        Get
            Return _SalMonth
        End Get
        Set(ByVal value As Integer)
            _SalMonth = value
        End Set
    End Property

    Public Property SalYear() As Integer
        Get
            Return _SalYear
        End Get
        Set(ByVal value As Integer)
            _SalYear = value
        End Set
    End Property

    Dim _EmpContribution, _CreditedIntEmp, _ComContribution, _CreditedIntCom As Double

    Public Property EmpContribution() As Double
        Get
            Return _EmpContribution
        End Get
        Set(ByVal value As Double)
            _EmpContribution = value
        End Set
    End Property

    Public Property CreditedIntEmp() As Double
        Get
            Return _CreditedIntEmp
        End Get
        Set(ByVal value As Double)
            _CreditedIntEmp = value
        End Set
    End Property

    Public Property ComContribution() As Double
        Get
            Return _ComContribution
        End Get
        Set(ByVal value As Double)
            _ComContribution = value
        End Set
    End Property

    Public Property CreditedIntCom() As Double
        Get
            Return _CreditedIntCom
        End Get
        Set(ByVal value As Double)
            _CreditedIntCom = value
        End Set
    End Property

    Dim _ProcessDate, _EntryDate As DateTime

    Public Property ProcessDate() As DateTime
        Get
            Return _ProcessDate
        End Get
        Set(ByVal value As DateTime)
            _ProcessDate = value
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

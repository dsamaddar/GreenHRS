Imports Microsoft.VisualBasic

Public Class clsEmpSalary

    Dim _EmpSalaryID, _EmployeeID, _ComponentID, _CompStatus, _ProcessingEntryPoint, _EntryBy As String

    Public Property EmpSalaryID() As String
        Get
            Return _EmpSalaryID
        End Get
        Set(ByVal value As String)
            _EmpSalaryID = value
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

    Public Property ComponentID() As String
        Get
            Return _ComponentID
        End Get
        Set(ByVal value As String)
            _ComponentID = value
        End Set
    End Property

    Public Property CompStatus() As String
        Get
            Return _CompStatus
        End Get
        Set(ByVal value As String)
            _CompStatus = value
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

    Dim _SalValue As Double

    Public Property SalValue() As Double
        Get
            Return _SalValue
        End Get
        Set(ByVal value As Double)
            _SalValue = value
        End Set
    End Property

    Dim _IsGrossComponent, _IsActive As Boolean

    Public Property IsGrossComponent() As Boolean
        Get
            Return _IsGrossComponent
        End Get
        Set(ByVal value As Boolean)
            _IsGrossComponent = value
        End Set
    End Property

    Public Property IsActive() As Boolean
        Get
            Return _IsActive
        End Get
        Set(ByVal value As Boolean)
            _IsActive = value
        End Set
    End Property

    Dim _SalaryMonth, _SalaryYear As Integer

    Public Property SalaryMonth() As Integer
        Get
            Return _SalaryMonth
        End Get
        Set(ByVal value As Integer)
            _SalaryMonth = value
        End Set
    End Property

    Public Property SalaryYear() As Integer
        Get
            Return _SalaryYear
        End Get
        Set(ByVal value As Integer)
            _SalaryYear = value
        End Set
    End Property

    Dim _ProcessingDate, _EntryDate As DateTime

    Public Property ProcessingDate() As DateTime
        Get
            Return _ProcessingDate
        End Get
        Set(ByVal value As DateTime)
            _ProcessingDate = value
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

Imports Microsoft.VisualBasic

Public Class clsTransportAllowance

    Dim _TransportAllowanceID, _EmployeeID, _EmpList, _DesignationID, _DepartmentID, _BankID, _AccountNo, _EntryPoint, _EntryBy As String

    Public Property TransportAllowanceID() As String
        Get
            Return _TransportAllowanceID
        End Get
        Set(ByVal value As String)
            _TransportAllowanceID = value
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

    Public Property EmpList() As String
        Get
            Return _EmpList
        End Get
        Set(ByVal value As String)
            _EmpList = value
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

    Public Property BankID() As String
        Get
            Return _BankID
        End Get
        Set(ByVal value As String)
            _BankID = value
        End Set
    End Property

    Public Property AccountNo() As String
        Get
            Return _AccountNo
        End Get
        Set(ByVal value As String)
            _AccountNo = value
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

    Public Property EntryBy() As String
        Get
            Return _EntryBy
        End Get
        Set(ByVal value As String)
            _EntryBy = value
        End Set
    End Property

    Dim _SalaryYear, _SalaryMonth, _Fuel As Integer

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

    Public Property Fuel() As String
        Get
            Return _Fuel
        End Get
        Set(ByVal value As String)
            _Fuel = value
        End Set
    End Property

    Dim _DriverAllowance, _VehicleMaintenance, _CarSubsidy, _FuelPricePreLtr As Double

    Public Property DriverAllowance() As Double
        Get
            Return _DriverAllowance
        End Get
        Set(ByVal value As Double)
            _DriverAllowance = value
        End Set
    End Property

    Public Property VehicleMaintenance() As Double
        Get
            Return _VehicleMaintenance
        End Get
        Set(ByVal value As Double)
            _VehicleMaintenance = value
        End Set
    End Property

    Public Property CarSubsidy() As Double
        Get
            Return _CarSubsidy
        End Get
        Set(ByVal value As Double)
            _CarSubsidy = value
        End Set
    End Property

    Public Property FuelPricePreLtr() As Double
        Get
            Return _FuelPricePreLtr
        End Get
        Set(ByVal value As Double)
            _FuelPricePreLtr = value
        End Set
    End Property

    Dim _DateFrom, _DateTo, _EntryDate As DateTime

    Public Property DateFrom() As DateTime
        Get
            Return _DateFrom
        End Get
        Set(ByVal value As DateTime)
            _DateFrom = value
        End Set
    End Property

    Public Property DateTo() As DateTime
        Get
            Return _DateTo
        End Get
        Set(ByVal value As DateTime)
            _DateTo = value
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

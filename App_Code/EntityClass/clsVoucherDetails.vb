Imports Microsoft.VisualBasic

Public Class clsVoucherDetails

    Dim _VoucherID, _VoucherNo, _AccountCode, _AccountType, _EmployeeID, _ULCBranchID, _DesignationID, _DepartmentID, _Reference, _ReferenceType, _EmpTypeList As String

    Public Property VoucherID() As String
        Get
            Return _VoucherID
        End Get
        Set(ByVal value As String)
            _VoucherID = value
        End Set
    End Property

    Public Property VoucherNo() As String
        Get
            Return _VoucherNo
        End Get
        Set(ByVal value As String)
            _VoucherNo = value
        End Set
    End Property

    Public Property AccountCode() As String
        Get
            Return _AccountCode
        End Get
        Set(ByVal value As String)
            _AccountCode = value
        End Set
    End Property

    Public Property AccountType() As String
        Get
            Return _AccountType
        End Get
        Set(ByVal value As String)
            _AccountType = value
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

    Public Property ULCBranchID() As String
        Get
            Return _ULCBranchID
        End Get
        Set(ByVal value As String)
            _ULCBranchID = value
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

    Public Property Reference() As String
        Get
            Return _Reference
        End Get
        Set(ByVal value As String)
            _Reference = value
        End Set
    End Property

    Public Property ReferenceType() As String
        Get
            Return _ReferenceType
        End Get
        Set(ByVal value As String)
            _ReferenceType = value
        End Set
    End Property

    Public Property EmpTypeList() As String
        Get
            Return _EmpTypeList
        End Get
        Set(ByVal value As String)
            _EmpTypeList = value
        End Set
    End Property

    Dim _EntryNo, _SalaryMonth, _SalaryYear As Integer

    Public Property EntryNo() As Integer
        Get
            Return _EntryNo
        End Get
        Set(ByVal value As Integer)
            _EntryNo = value
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

    Public Property SalaryYear() As Integer
        Get
            Return _SalaryYear
        End Get
        Set(ByVal value As Integer)
            _SalaryYear = value
        End Set
    End Property

    Dim _Debit, _Credit As Double

    Public Property Debit() As Double
        Get
            Return _Debit
        End Get
        Set(ByVal value As Double)
            _Debit = value
        End Set
    End Property

    Public Property Credit() As Double
        Get
            Return _Credit
        End Get
        Set(ByVal value As Double)
            _Credit = value
        End Set
    End Property

End Class

Imports Microsoft.VisualBasic

Public Class clsEmpKPI

    Dim _EmpKPIID, _EmployeeJDID, _JobDescriptionID, _KPIDetail As String

    Public Property EmpKPIID() As String
        Get
            Return _EmpKPIID
        End Get
        Set(ByVal value As String)
            _EmpKPIID = value
        End Set
    End Property

    Public Property EmployeeJDID() As String
        Get
            Return _EmployeeJDID
        End Get
        Set(ByVal value As String)
            _EmployeeJDID = value
        End Set
    End Property

    Public Property JobDescriptionID() As String
        Get
            Return _JobDescriptionID
        End Get
        Set(ByVal value As String)
            _JobDescriptionID = value
        End Set
    End Property

    Public Property KPIDetail() As String
        Get
            Return _KPIDetail
        End Get
        Set(ByVal value As String)
            _KPIDetail = value
        End Set
    End Property

End Class

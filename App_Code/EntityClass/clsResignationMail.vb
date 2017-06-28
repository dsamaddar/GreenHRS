Imports Microsoft.VisualBasic

Public Class clsResignationMail

    Dim _EmployeeName, _EmpMailAdr, _SupervisorMailAdr As String

    Public Property EmployeeName() As String
        Get
            Return _EmployeeName
        End Get
        Set(ByVal value As String)
            _EmployeeName = value
        End Set
    End Property

    Public Property EmpMailAdr() As String
        Get
            Return _EmpMailAdr
        End Get
        Set(ByVal value As String)
            _EmpMailAdr = value
        End Set
    End Property

    Public Property SupervisorMailAdr() As String
        Get
            Return _SupervisorMailAdr
        End Get
        Set(ByVal value As String)
            _SupervisorMailAdr = value
        End Set
    End Property

End Class

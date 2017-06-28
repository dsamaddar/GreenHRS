Imports Microsoft.VisualBasic

Public Class clsEmpKeyRes

    Dim _EmpkeyResID, _EmployeeJDID, _JobDescriptionID, _KeyResTypeID, _JobDetail As String

    Public Property EmpkeyResID() As String
        Get
            Return _EmpkeyResID
        End Get
        Set(ByVal value As String)
            _EmpkeyResID = value
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

    Public Property KeyResTypeID() As String
        Get
            Return _KeyResTypeID
        End Get
        Set(ByVal value As String)
            _KeyResTypeID = value
        End Set
    End Property

    Public Property JobDetail() As String
        Get
            Return _JobDetail
        End Get
        Set(ByVal value As String)
            _JobDetail = value
        End Set
    End Property

End Class

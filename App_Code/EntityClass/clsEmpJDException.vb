Imports Microsoft.VisualBasic

Public Class clsEmpJDException

    Dim _EmpJDExceptionID, _EmployeeJDID, _JobDescriptionID, _ExceptionDetail As String

    Public Property EmpJDExceptionID() As String
        Get
            Return _EmpJDExceptionID
        End Get
        Set(ByVal value As String)
            _EmpJDExceptionID = value
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

    Public Property ExceptionDetail() As String
        Get
            Return _ExceptionDetail
        End Get
        Set(ByVal value As String)
            _ExceptionDetail = value
        End Set
    End Property

End Class

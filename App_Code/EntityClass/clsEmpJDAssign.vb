Imports Microsoft.VisualBasic

Public Class clsEmpJDAssign
    Dim _EmployeeJDID, _EmployeeID, _JobDescriptionID, _AssignedBy As String

    Dim _IssueDate, _EffectiveDate, _AssignDate As DateTime

    Public Property EmployeeJDID() As String
        Get
            Return _EmployeeJDID
        End Get
        Set(ByVal value As String)
            _EmployeeJDID = value
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

    Public Property JobDescriptionID() As String
        Get
            Return _JobDescriptionID
        End Get
        Set(ByVal value As String)
            _JobDescriptionID = value
        End Set
    End Property

    Public Property IssueDate() As DateTime
        Get
            Return _IssueDate
        End Get
        Set(ByVal value As DateTime)
            _IssueDate = value
        End Set
    End Property

    Public Property EffectiveDate() As DateTime
        Get
            Return _EffectiveDate
        End Get
        Set(ByVal value As DateTime)
            _EffectiveDate = value
        End Set
    End Property

    Public Property AssignedBy() As String
        Get
            Return _AssignedBy
        End Get
        Set(ByVal value As String)
            _AssignedBy = value
        End Set
    End Property

    Public Property AssignDate() As DateTime
        Get
            Return _AssignDate
        End Get
        Set(ByVal value As DateTime)
            _AssignDate = value
        End Set
    End Property
End Class

Imports Microsoft.VisualBasic

Public Class clsEmployeeJD

    Dim _EmployeeJDID, _EmployeeID, _JobDescriptionID, _AssignedBy As String

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

    Public Property AssignedBy() As String
        Get
            Return _AssignedBy
        End Get
        Set(ByVal value As String)
            _AssignedBy = value
        End Set
    End Property

    Dim _IsAccepted, _IsActive As Boolean

    Public Property IsAccepted() As Boolean
        Get
            Return _IsAccepted
        End Get
        Set(ByVal value As Boolean)
            _IsAccepted = value
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

    Dim _IssueDate, _EffectiveDate, _AssignDate, _AcceptanceDate As DateTime

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

    Public Property AssignDate() As DateTime
        Get
            Return _AssignDate
        End Get
        Set(ByVal value As DateTime)
            _AssignDate = value
        End Set
    End Property

    Public Property AcceptanceDate() As DateTime
        Get
            Return _AcceptanceDate
        End Get
        Set(ByVal value As DateTime)
            _AcceptanceDate = value
        End Set
    End Property

End Class

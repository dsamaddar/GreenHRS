Imports Microsoft.VisualBasic

Public Class clsDeptTransfer

    Dim _DeptTransferID, _EmployeeID, _OldDepartment, _PrevSupervisor, _NewDepartment, _NewSupervisor, _IssuedBy As String

    Public Property DeptTransferID() As String
        Get
            Return _DeptTransferID
        End Get
        Set(ByVal value As String)
            _DeptTransferID = value
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

    Public Property OldDepartment() As String
        Get
            Return _OldDepartment
        End Get
        Set(ByVal value As String)
            _OldDepartment = value
        End Set
    End Property

    Public Property PrevSupervisor() As String
        Get
            Return _PrevSupervisor
        End Get
        Set(ByVal value As String)
            _PrevSupervisor = value
        End Set
    End Property

    Public Property NewDepartment() As String
        Get
            Return _NewDepartment
        End Get
        Set(ByVal value As String)
            _NewDepartment = value
        End Set
    End Property

    Public Property NewSupervisor() As String
        Get
            Return _NewSupervisor
        End Get
        Set(ByVal value As String)
            _NewSupervisor = value
        End Set
    End Property

    Public Property IssuedBy() As String
        Get
            Return _IssuedBy
        End Get
        Set(ByVal value As String)
            _IssuedBy = value
        End Set
    End Property

    Dim _EffectiveDate, _UpdateDate, _IssuedDate As DateTime

    Public Property EffectiveDate() As DateTime
        Get
            Return _EffectiveDate
        End Get
        Set(ByVal value As DateTime)
            _EffectiveDate = value
        End Set
    End Property

    Public Property UpdateDate() As DateTime
        Get
            Return _UpdateDate
        End Get
        Set(ByVal value As DateTime)
            _UpdateDate = value
        End Set
    End Property

    Public Property IssuedDate() As DateTime
        Get
            Return _IssuedDate
        End Get
        Set(ByVal value As DateTime)
            _IssuedDate = value
        End Set
    End Property

    Dim _IsSystemUpdated As Boolean

    Public Property IsSystemUpdated() As Boolean
        Get
            Return _IsSystemUpdated
        End Get
        Set(ByVal value As Boolean)
            _IsSystemUpdated = value
        End Set
    End Property

End Class

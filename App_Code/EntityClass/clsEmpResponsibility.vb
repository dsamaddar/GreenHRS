Imports Microsoft.VisualBasic

Public Class clsEmpResponsibility

    Dim _EmpResponsibilityID, _EmployeeID, _DepartmentID, _OfficialDesignationID, _FunctionalDesignationID, _MajorTask, _Remarks, _EntryBy, _RevokedCause, _RevokedBy As String

    Public Property EmpResponsibilityID() As String
        Get
            Return _EmpResponsibilityID
        End Get
        Set(ByVal value As String)
            _EmpResponsibilityID = value
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

    Public Property DepartmentID() As String
        Get
            Return _DepartmentID
        End Get
        Set(ByVal value As String)
            _DepartmentID = value
        End Set
    End Property

    Public Property OfficialDesignationID() As String
        Get
            Return _OfficialDesignationID
        End Get
        Set(ByVal value As String)
            _OfficialDesignationID = value
        End Set
    End Property

    Public Property FunctionalDesignationID() As String
        Get
            Return _FunctionalDesignationID
        End Get
        Set(ByVal value As String)
            _FunctionalDesignationID = value
        End Set
    End Property

    Public Property MajorTask() As String
        Get
            Return _MajorTask
        End Get
        Set(ByVal value As String)
            _MajorTask = value
        End Set
    End Property

    Public Property Remarks() As String
        Get
            Return _Remarks
        End Get
        Set(ByVal value As String)
            _Remarks = value
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

    Public Property RevokedCause() As String
        Get
            Return _RevokedCause
        End Get
        Set(ByVal value As String)
            _RevokedCause = value
        End Set
    End Property

    Public Property RevokedBy() As String
        Get
            Return _RevokedBy
        End Get
        Set(ByVal value As String)
            _RevokedBy = value
        End Set
    End Property

    Dim _EffectiveDate, _EntryDate, _RevokeDate As DateTime

    Public Property EffectiveDate() As DateTime
        Get
            Return _EffectiveDate
        End Get
        Set(ByVal value As DateTime)
            _EffectiveDate = value
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

    Public Property RevokeDate() As DateTime
        Get
            Return _RevokeDate
        End Get
        Set(ByVal value As DateTime)
            _RevokeDate = value
        End Set
    End Property

    Dim _IsRevoked As Boolean

    Public Property IsRevoked() As Boolean
        Get
            Return _IsRevoked
        End Get
        Set(ByVal value As Boolean)
            _IsRevoked = value
        End Set
    End Property

End Class

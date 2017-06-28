Imports Microsoft.VisualBasic

Public Class clsSearchOrgStructure

    Dim _EmpIDOrName, _EmployeeTypeID, _DesignationID, _FunctionalDesignationID, _DepartmentID, _ULCBranchID, _Religion, _BloodGroupID, _Gender, _ActualBirthDay, _ActualBirthMonth, _CurrentSupervisor As String

    Public Property EmpIDOrName() As String
        Get
            Return _EmpIDOrName
        End Get
        Set(ByVal value As String)
            _EmpIDOrName = value
        End Set
    End Property

    Public Property EmployeeTypeID() As String
        Get
            Return _EmployeeTypeID
        End Get
        Set(ByVal value As String)
            _EmployeeTypeID = value
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

    Public Property FunctionalDesignationID() As String
        Get
            Return _FunctionalDesignationID
        End Get
        Set(ByVal value As String)
            _FunctionalDesignationID = value
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

    Public Property ULCBranchID() As String
        Get
            Return _ULCBranchID
        End Get
        Set(ByVal value As String)
            _ULCBranchID = value
        End Set
    End Property

    Public Property Religion() As String
        Get
            Return _Religion
        End Get
        Set(ByVal value As String)
            _Religion = value
        End Set
    End Property

    Public Property ActualBirthDay() As String
        Get
            Return _ActualBirthDay
        End Get
        Set(ByVal value As String)
            _ActualBirthDay = value
        End Set
    End Property

    Public Property ActualBirthMonth() As String
        Get
            Return _ActualBirthMonth
        End Get
        Set(ByVal value As String)
            _ActualBirthMonth = value
        End Set
    End Property

    Public Property BloodGroupID() As String
        Get
            Return _BloodGroupID
        End Get
        Set(ByVal value As String)
            _BloodGroupID = value
        End Set
    End Property

    Public Property Gender() As String
        Get
            Return _Gender
        End Get
        Set(ByVal value As String)
            _Gender = value
        End Set
    End Property

    Public Property CurrentSupervisor() As String
        Get
            Return _CurrentSupervisor
        End Get
        Set(ByVal value As String)
            _CurrentSupervisor = value
        End Set
    End Property

    Dim _IsActive As Boolean

    Public Property IsActive() As Boolean
        Get
            Return _IsActive
        End Get
        Set(ByVal value As Boolean)
            _IsActive = value
        End Set
    End Property

    Dim _PerDistrict As Integer

    Public Property PerDistrict() As Integer
        Get
            Return _PerDistrict
        End Get
        Set(ByVal value As Integer)
            _PerDistrict = value
        End Set
    End Property

    Dim _JoiningDate, _JoiningDateTo As DateTime

    Public Property JoiningDate() As DateTime
        Get
            Return _JoiningDate
        End Get
        Set(ByVal value As DateTime)
            _JoiningDate = value
        End Set
    End Property

    Public Property JoiningDateTo() As DateTime
        Get
            Return _JoiningDateTo
        End Get
        Set(ByVal value As DateTime)
            _JoiningDateTo = value
        End Set
    End Property

End Class

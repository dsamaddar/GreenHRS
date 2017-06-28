Imports Microsoft.VisualBasic

Public Class clsMail
    Dim _EmployeeName, _OfficialDesignationName, _FunctionalDesignationName, _DeptName, _ULCBranchName, _JoiningDate, _Photos As String
    Dim _OldDesigName, _NewDesigName, _EffectiveDate, _SpouseName, _Gender, _DateOfBirth As String

    Public Property SpouseName() As String
        Get
            Return _SpouseName
        End Get
        Set(ByVal value As String)
            _SpouseName = value
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

    Public Property DateOfBirth() As String
        Get
            Return _DateOfBirth
        End Get
        Set(ByVal value As String)
            _DateOfBirth = value
        End Set
    End Property

    Public Property OldDesigName() As String
        Get
            Return _OldDesigName
        End Get
        Set(ByVal value As String)
            _OldDesigName = value
        End Set
    End Property

    Public Property NewDesigName() As String
        Get
            Return _NewDesigName
        End Get
        Set(ByVal value As String)
            _NewDesigName = value
        End Set
    End Property

    Public Property EffectiveDate() As String
        Get
            Return _EffectiveDate
        End Get
        Set(ByVal value As String)
            _EffectiveDate = value
        End Set
    End Property
    Public Property EmployeeName() As String
        Get
            Return _EmployeeName
        End Get
        Set(ByVal value As String)
            _EmployeeName = value
        End Set
    End Property
    Public Property OfficialDesignationName() As String
        Get
            Return _OfficialDesignationName
        End Get
        Set(ByVal value As String)
            _OfficialDesignationName = value
        End Set
    End Property
    Public Property FunctionalDesignationName() As String
        Get
            Return _FunctionalDesignationName
        End Get
        Set(ByVal value As String)
            _FunctionalDesignationName = value
        End Set
    End Property
    Public Property DeptName() As String
        Get
            Return _DeptName
        End Get
        Set(ByVal value As String)
            _DeptName = value
        End Set
    End Property
    Public Property ULCBranchName() As String
        Get
            Return _ULCBranchName
        End Get
        Set(ByVal value As String)
            _ULCBranchName = value
        End Set
    End Property
    Public Property JoiningDate() As String
        Get
            Return _JoiningDate
        End Get
        Set(ByVal value As String)
            _JoiningDate = value
        End Set
    End Property
    Public Property Photos() As String
        Get
            Return _Photos
        End Get
        Set(ByVal value As String)
            _Photos = value
        End Set
    End Property

End Class

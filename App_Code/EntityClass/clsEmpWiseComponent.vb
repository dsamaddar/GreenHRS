Imports Microsoft.VisualBasic

Public Class clsEmpWiseComponent

    Dim _EmpComponentID, _EmployeeID, _RoleComponentID, _ComponentID, _CompValDependentOn, _EntryBy, _ComponentIDList, _ComponentName, _CompState As String

    Public Property EmpComponentID() As String
        Get
            Return _EmpComponentID
        End Get
        Set(ByVal value As String)
            _EmpComponentID = value
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

    Public Property RoleComponentID() As String
        Get
            Return _RoleComponentID
        End Get
        Set(ByVal value As String)
            _RoleComponentID = value
        End Set
    End Property

    Public Property ComponentID() As String
        Get
            Return _ComponentID
        End Get
        Set(ByVal value As String)
            _ComponentID = value
        End Set
    End Property

    Public Property CompValDependentOn() As String
        Get
            Return _CompValDependentOn
        End Get
        Set(ByVal value As String)
            _CompValDependentOn = value
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

    Public Property ComponentIDList() As String
        Get
            Return _ComponentIDList
        End Get
        Set(ByVal value As String)
            _ComponentIDList = value
        End Set
    End Property

    Public Property ComponentName() As String
        Get
            Return _ComponentName
        End Get
        Set(ByVal value As String)
            _ComponentName = value
        End Set
    End Property

    Public Property CompState() As String
        Get
            Return _CompState
        End Get
        Set(ByVal value As String)
            _CompState = value
        End Set
    End Property

    Dim _CompValue, _CompRatio, _Consolidated, _TaxExemptionLimit As Double

    Public Property CompValue() As Double
        Get
            Return _CompValue
        End Get
        Set(ByVal value As Double)
            _CompValue = value
        End Set
    End Property

    Public Property CompRatio() As Double
        Get
            Return _CompRatio
        End Get
        Set(ByVal value As Double)
            _CompRatio = value
        End Set
    End Property

    Public Property Consolidated() As Double
        Get
            Return _Consolidated
        End Get
        Set(ByVal value As Double)
            _Consolidated = value
        End Set
    End Property

    Public Property TaxExemptionLimit() As Double
        Get
            Return _TaxExemptionLimit
        End Get
        Set(ByVal value As Double)
            _TaxExemptionLimit = value
        End Set
    End Property

    Dim _IsMonthlyComponent, _IsGrossComponent, _IsTaxable, _IsActive As Boolean

    Public Property IsMonthlyComponent() As Boolean
        Get
            Return _IsMonthlyComponent
        End Get
        Set(ByVal value As Boolean)
            _IsMonthlyComponent = value
        End Set
    End Property

    Public Property IsGrossComponent() As Boolean
        Get
            Return _IsGrossComponent
        End Get
        Set(ByVal value As Boolean)
            _IsGrossComponent = value
        End Set
    End Property

    Public Property IsTaxable() As Boolean
        Get
            Return _IsTaxable
        End Get
        Set(ByVal value As Boolean)
            _IsTaxable = value
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

    Dim _EntryDate As DateTime

    Public Property EntryDate() As DateTime
        Get
            Return _EntryDate
        End Get
        Set(ByVal value As DateTime)
            _EntryDate = value
        End Set
    End Property

End Class

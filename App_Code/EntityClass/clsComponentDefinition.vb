Imports Microsoft.VisualBasic

Public Class clsComponentDefinition

    Dim _ComponentID, _ComponentName, _ComponentCode, _CompValDependentOn, _CompState, _AccountCode, _EntryBy As String

    Public Property ComponentID() As String
        Get
            Return _ComponentID
        End Get
        Set(ByVal value As String)
            _ComponentID = value
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

    Public Property ComponentCode() As String
        Get
            Return _ComponentCode
        End Get
        Set(ByVal value As String)
            _ComponentCode = value
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

    Public Property CompState() As String
        Get
            Return _CompState
        End Get
        Set(ByVal value As String)
            _CompState = value
        End Set
    End Property

    Public Property AccountCode() As String
        Get
            Return _AccountCode
        End Get
        Set(ByVal value As String)
            _AccountCode = value
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

    Dim _IsGrossComponent, _IsTaxable, _IsMonthlyComponent As Boolean

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

    Public Property IsMonthlyComponent() As Boolean
        Get
            Return _IsMonthlyComponent
        End Get
        Set(ByVal value As Boolean)
            _IsMonthlyComponent = value
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

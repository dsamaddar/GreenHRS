Imports Microsoft.VisualBasic

Public Class clsEmployee
    Dim _DesignationName, _DesignationID, _HealthPlanID, _DesignationLabel, _DesignationType, _isActive, _EntryBy, _EvaluationGroupID, _EvaluationGroup As String

    Public Property EvaluationGroupID() As String
        Get
            Return _EvaluationGroupID
        End Get
        Set(ByVal value As String)
            _EvaluationGroupID = value
        End Set
    End Property

    Public Property EvaluationGroup() As String
        Get
            Return _EvaluationGroup
        End Get
        Set(ByVal value As String)
            _EvaluationGroup = value
        End Set
    End Property

    Dim _intOrder, _Fuel, _NoticePeriod As Integer

    Public Property Fuel() As Integer
        Get
            Return _Fuel
        End Get
        Set(ByVal value As Integer)
            _Fuel = value
        End Set
    End Property

    Public Property NoticePeriod() As Integer
        Get
            Return _NoticePeriod
        End Get
        Set(ByVal value As Integer)
            _NoticePeriod = value
        End Set
    End Property

    Dim _DriverAllowance, _VehicleMaintenance, _CarSubsidy, _MobileAllowance, _TransportAllowance As Double

    Public Property VehicleMaintenance() As Double
        Get
            Return _VehicleMaintenance
        End Get
        Set(ByVal value As Double)
            _VehicleMaintenance = value
        End Set
    End Property

    Public Property CarSubsidy() As Double
        Get
            Return _CarSubsidy
        End Get
        Set(ByVal value As Double)
            _CarSubsidy = value
        End Set
    End Property

    Public Property MobileAllowance() As Double
        Get
            Return _MobileAllowance
        End Get
        Set(ByVal value As Double)
            _MobileAllowance = value
        End Set
    End Property

    Public Property TransportAllowance() As Double
        Get
            Return _TransportAllowance
        End Get
        Set(ByVal value As Double)
            _TransportAllowance = value
        End Set
    End Property

    Public Property DriverAllowance() As String
        Get
            Return _DriverAllowance
        End Get
        Set(ByVal value As String)
            _DriverAllowance = value
        End Set
    End Property

    Public Property DesignationName() As String
        Get
            Return _DesignationName
        End Get
        Set(ByVal value As String)
            _DesignationName = value
        End Set
    End Property

    Public Property DesignationLabel() As String
        Get
            Return _DesignationLabel
        End Get
        Set(ByVal value As String)
            _DesignationLabel = value
        End Set
    End Property

    Public Property HealthPlanID() As String
        Get
            Return _HealthPlanID
        End Get
        Set(ByVal value As String)
            _HealthPlanID = value
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

    Public Property DesignationType() As String
        Get
            Return _DesignationType
        End Get
        Set(ByVal value As String)
            _DesignationType = value
        End Set
    End Property

    Public Property isActive() As String
        Get
            Return _isActive
        End Get
        Set(ByVal value As String)
            _isActive = value
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

    Public Property intOrder() As String
        Get
            Return _intOrder
        End Get
        Set(ByVal value As String)
            _intOrder = value
        End Set
    End Property

End Class

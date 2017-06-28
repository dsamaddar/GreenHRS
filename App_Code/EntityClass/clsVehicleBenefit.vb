Imports Microsoft.VisualBasic

Public Class clsVehicleBenefit

    Dim _VehicleBenefitID, _EmployeeID, _BenefitTypeID, _VehicleType, _Brand, _YearModel, _EngineNo, _ChasisNo, _CurrentOwner, _
    _PreviousOwner, _RegistrationNo, _RemarksOnVehicle, _BenefitStatus, _VehicleAttachment, _EntryBy, _PerformedByID, _Remarks, _
    _VehicleCondition, _EventName As String

    Public Property VehicleBenefitID() As String
        Get
            Return _VehicleBenefitID
        End Get
        Set(ByVal value As String)
            _VehicleBenefitID = value
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

    Public Property BenefitTypeID() As String
        Get
            Return _BenefitTypeID
        End Get
        Set(ByVal value As String)
            _BenefitTypeID = value
        End Set
    End Property

    Public Property VehicleType() As String
        Get
            Return _VehicleType
        End Get
        Set(ByVal value As String)
            _VehicleType = value
        End Set
    End Property

    Public Property Brand() As String
        Get
            Return _Brand
        End Get
        Set(ByVal value As String)
            _Brand = value
        End Set
    End Property

    Public Property YearModel() As String
        Get
            Return _YearModel
        End Get
        Set(ByVal value As String)
            _YearModel = value
        End Set
    End Property

    Public Property EngineNo() As String
        Get
            Return _EngineNo
        End Get
        Set(ByVal value As String)
            _EngineNo = value
        End Set
    End Property

    Public Property ChasisNo() As String
        Get
            Return _ChasisNo
        End Get
        Set(ByVal value As String)
            _ChasisNo = value
        End Set
    End Property

    Public Property CurrentOwner() As String
        Get
            Return _CurrentOwner
        End Get
        Set(ByVal value As String)
            _CurrentOwner = value
        End Set
    End Property

    Public Property PreviousOwner() As String
        Get
            Return _PreviousOwner
        End Get
        Set(ByVal value As String)
            _PreviousOwner = value
        End Set
    End Property

    Public Property RegistrationNo() As String
        Get
            Return _RegistrationNo
        End Get
        Set(ByVal value As String)
            _RegistrationNo = value
        End Set
    End Property

    Public Property BenefitStatus() As String
        Get
            Return _BenefitStatus
        End Get
        Set(ByVal value As String)
            _BenefitStatus = value
        End Set
    End Property

    Public Property VehicleAttachment() As String
        Get
            Return _VehicleAttachment
        End Get
        Set(ByVal value As String)
            _VehicleAttachment = value
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

    Public Property PerformedByID() As String
        Get
            Return _PerformedByID
        End Get
        Set(ByVal value As String)
            _PerformedByID = value
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

    Public Property VehicleCondition() As String
        Get
            Return _VehicleCondition
        End Get
        Set(ByVal value As String)
            _VehicleCondition = value
        End Set
    End Property

    Public Property EventName() As String
        Get
            Return _EventName
        End Get
        Set(ByVal value As String)
            _EventName = value
        End Set
    End Property

    Dim _VehicleCost, _LoanAmount, _InstallmentAmnt As Double

    Public Property VehicleCost() As String
        Get
            Return _VehicleCost
        End Get
        Set(ByVal value As String)
            _VehicleCost = value
        End Set
    End Property

    Public Property LoanAmount() As Double
        Get
            Return _LoanAmount
        End Get
        Set(ByVal value As Double)
            _LoanAmount = value
        End Set
    End Property

    Public Property InstallmentAmnt() As Double
        Get
            Return _InstallmentAmnt
        End Get
        Set(ByVal value As Double)
            _InstallmentAmnt = value
        End Set
    End Property

    Public Property RemarksOnVehicle() As String
        Get
            Return _RemarksOnVehicle
        End Get
        Set(ByVal value As String)
            _RemarksOnVehicle = value
        End Set
    End Property

    Dim _OwnershipTransferDate, _RegistrationDate, _AmortizationDate, _EntryDate, _ReimbursementDate As DateTime

    Public Property OwnershipTransferDate() As DateTime
        Get
            Return _OwnershipTransferDate
        End Get
        Set(ByVal value As DateTime)
            _OwnershipTransferDate = value
        End Set
    End Property

    Public Property RegistrationDate() As DateTime
        Get
            Return _RegistrationDate
        End Get
        Set(ByVal value As DateTime)
            _RegistrationDate = value
        End Set
    End Property

    Public Property AmortizationDate() As DateTime
        Get
            Return _AmortizationDate
        End Get
        Set(ByVal value As DateTime)
            _AmortizationDate = value
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

    Public Property ReimbursementDate() As DateTime
        Get
            Return _ReimbursementDate
        End Get
        Set(ByVal value As DateTime)
            _ReimbursementDate = value
        End Set
    End Property

    Dim _IsAmortized, _IsInsuranceRequired As Boolean

    Public Property IsAmortized() As Boolean
        Get
            Return _IsAmortized
        End Get
        Set(ByVal value As Boolean)
            _IsAmortized = value
        End Set
    End Property

    Public Property IsInsuranceRequired() As Boolean
        Get
            Return _IsInsuranceRequired
        End Get
        Set(ByVal value As Boolean)
            _IsInsuranceRequired = value
        End Set
    End Property

End Class

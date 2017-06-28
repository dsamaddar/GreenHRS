Imports Microsoft.VisualBasic

Public Class clsMobileBenefit
    Dim _MobileBenefitID, _EmployeeID, _BenefitTypeID, _IMEINo, _Brand, _ModelNo, _SIMNo, _MobileAttachment, _RemarksOnMobile, _EntryBy, _
    _PerformedByID, _Remarks, _EventName, _Entitlement As String
    Dim _DateOfPurchse, _DateOfReimbursement, _EntryDate As DateTime
    Dim _MobileCost As Decimal
    Dim _IsInsuranceRequired, _IsPrimaryApproved As Boolean

    Public Property MobileBenefitID() As String
        Get
            Return _MobileBenefitID
        End Get
        Set(ByVal value As String)
            _MobileBenefitID = value
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

    Public Property IMEINo() As String
        Get
            Return _IMEINo
        End Get
        Set(ByVal value As String)
            _IMEINo = value
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

    Public Property ModelNo() As String
        Get
            Return _ModelNo
        End Get
        Set(ByVal value As String)
            _ModelNo = value
        End Set
    End Property

    Public Property SIMNo() As String
        Get
            Return _SIMNo
        End Get
        Set(ByVal value As String)
            _SIMNo = value
        End Set
    End Property

    Public Property MobileAttachment() As String
        Get
            Return _MobileAttachment
        End Get
        Set(ByVal value As String)
            _MobileAttachment = value
        End Set
    End Property

    Public Property RemarksOnMobile() As String
        Get
            Return _RemarksOnMobile
        End Get
        Set(ByVal value As String)
            _RemarksOnMobile = value
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

    Public Property EventName() As String
        Get
            Return _EventName
        End Get
        Set(ByVal value As String)
            _EventName = value
        End Set
    End Property

    Public Property Entitlement() As String
        Get
            Return _Entitlement
        End Get
        Set(ByVal value As String)
            _Entitlement = value
        End Set
    End Property

    Public Property DateOfPurchse() As DateTime
        Get
            Return _DateOfPurchse
        End Get
        Set(ByVal value As DateTime)
            _DateOfPurchse = value
        End Set
    End Property

    Public Property DateOfReimbursement() As DateTime
        Get
            Return _DateOfReimbursement
        End Get
        Set(ByVal value As DateTime)
            _DateOfReimbursement = value
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

    Public Property MobileCost() As Decimal
        Get
            Return _MobileCost
        End Get
        Set(ByVal value As Decimal)
            _MobileCost = value
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

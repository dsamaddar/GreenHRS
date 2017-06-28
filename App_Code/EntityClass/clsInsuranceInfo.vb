Imports Microsoft.VisualBasic

Public Class clsInsuranceInfo
    Dim _InsuranceID, _EmployeeID, _EmpLoanAccountID, _BenefitID, _BenefitType, _InsuranceType, _InsuranceWith, _InsuranceNo, _InsuranceAttachment, _EntryBy As String
    Dim _InsuranceStartDate, _InsuranceRenewalDate As DateTime
    Dim _InsuredValue As Decimal

    Public Property InsuranceID() As String
        Get
            Return _InsuranceID
        End Get
        Set(ByVal value As String)
            _InsuranceID = value
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

    Public Property EmpLoanAccountID() As String
        Get
            Return _EmpLoanAccountID
        End Get
        Set(ByVal value As String)
            _EmpLoanAccountID = value
        End Set
    End Property

    Public Property BenefitID() As String
        Get
            Return _BenefitID
        End Get
        Set(ByVal value As String)
            _BenefitID = value
        End Set
    End Property

    Public Property BenefitType() As String
        Get
            Return _BenefitType
        End Get
        Set(ByVal value As String)
            _BenefitType = value
        End Set
    End Property

    Public Property InsuranceType() As String
        Get
            Return _InsuranceType
        End Get
        Set(ByVal value As String)
            _InsuranceType = value
        End Set
    End Property

    Public Property InsuranceWith() As String
        Get
            Return _InsuranceWith
        End Get
        Set(ByVal value As String)
            _InsuranceWith = value
        End Set
    End Property

    Public Property InsuranceNo() As String
        Get
            Return _InsuranceNo
        End Get
        Set(ByVal value As String)
            _InsuranceNo = value
        End Set
    End Property

    Public Property InsuranceAttachment() As String
        Get
            Return _InsuranceAttachment
        End Get
        Set(ByVal value As String)
            _InsuranceAttachment = value
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

    Public Property InsuranceStartDate() As DateTime
        Get
            Return _InsuranceStartDate
        End Get
        Set(ByVal value As DateTime)
            _InsuranceStartDate = value
        End Set
    End Property

    Public Property InsuranceRenewalDate() As DateTime
        Get
            Return _InsuranceRenewalDate
        End Get
        Set(ByVal value As DateTime)
            _InsuranceRenewalDate = value
        End Set
    End Property

    Public Property InsuredValue() As Decimal
        Get
            Return _InsuredValue
        End Get
        Set(ByVal value As Decimal)
            _InsuredValue = value
        End Set
    End Property
End Class

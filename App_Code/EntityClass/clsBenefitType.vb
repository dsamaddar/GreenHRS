Imports Microsoft.VisualBasic

Public Class clsBenefitType

    Dim _BenefitTypeID, _BenefitType, _BenefitCode, _AccountCode, _PrimaryApprover, _ApproverID, _EntryBy As String

    Public Property BenefitTypeID() As String
        Get
            Return _BenefitTypeID
        End Get
        Set(ByVal value As String)
            _BenefitTypeID = value
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

    Public Property BenefitCode() As String
        Get
            Return _BenefitCode
        End Get
        Set(ByVal value As String)
            _BenefitCode = value
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

    Public Property PrimaryApprover() As String
        Get
            Return _PrimaryApprover
        End Get
        Set(ByVal value As String)
            _PrimaryApprover = value
        End Set
    End Property

    Public Property ApproverID() As String
        Get
            Return _ApproverID
        End Get
        Set(ByVal value As String)
            _ApproverID = value
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

    Dim _DepreciationYear As Integer

    Public Property DepreciationYear() As Integer
        Get
            Return _DepreciationYear
        End Get
        Set(ByVal value As Integer)
            _DepreciationYear = value
        End Set
    End Property

    Dim _InterestRate As Double

    Public Property InterestRate() As Double
        Get
            Return _InterestRate
        End Get
        Set(ByVal value As Double)
            _InterestRate = value
        End Set
    End Property

    Dim _IsAdjustableFromSalary, _IsAbatementApplicable, _IsDepreciatedAutomatically, _IsActive As Boolean

    Public Property IsAdjustableFromSalary() As Boolean
        Get
            Return _IsAdjustableFromSalary
        End Get
        Set(ByVal value As Boolean)
            _IsAdjustableFromSalary = value
        End Set
    End Property

    Public Property IsAbatementApplicable() As Boolean
        Get
            Return _IsAbatementApplicable
        End Get
        Set(ByVal value As Boolean)
            _IsAbatementApplicable = value
        End Set
    End Property

    Public Property IsDepreciatedAutomatically() As Boolean
        Get
            Return _IsDepreciatedAutomatically
        End Get
        Set(ByVal value As Boolean)
            _IsDepreciatedAutomatically = value
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

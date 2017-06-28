Imports Microsoft.VisualBasic

Public Class clsEmployeeInfo

    Dim _EmployeeID, _EmployeeName, _UserID, _Password, _UserType, _EmpCode, _EmpTypeID, _TerminationTypeID, _RemarksOnTermination, _JoiningDesignationID, _OfficialDesignationID As String
    Dim _FunctionalDesignationID, _DepartmentID, _ULCBranchID, _CurrentSupervisor, _JDno, _Status, _BankID, _BranchID, _BankAccountNo, _Email As String
    Dim _DateOfBirth, _JoiningDate, _ProbationEffectiveDate, _ConfirmationDate, _PromotionDate, _ContractExpiryDate, _ContractRenewalDate, _TerminationDate As DateTime
    Dim _LeaveApprover, _LeaveRecommender, _AttendanceID, _EntryBy As String

    Dim _SecondaryBankID, _SecondaryBranchID, _SecondaryBankAccountNo As String
    Dim _Fuel, _DriverAllowance, _VehicleMaintenance, _CarSubsidy As Double
    Dim _ProbationPeriod As Integer

    Public Property SecondaryBankID() As String
        Get
            Return _SecondaryBankID
        End Get
        Set(ByVal value As String)
            _SecondaryBankID = value
        End Set
    End Property

    Public Property SecondaryBranchID() As String
        Get
            Return _SecondaryBranchID
        End Get
        Set(ByVal value As String)
            _SecondaryBranchID = value
        End Set
    End Property

    Public Property SecondaryBankAccountNo() As String
        Get
            Return _SecondaryBankAccountNo
        End Get
        Set(ByVal value As String)
            _SecondaryBankAccountNo = value
        End Set
    End Property

    Public Property Fuel() As Double
        Get
            Return _Fuel
        End Get
        Set(ByVal value As Double)
            _Fuel = value
        End Set
    End Property

    Public Property DriverAllowance() As Double
        Get
            Return _DriverAllowance
        End Get
        Set(ByVal value As Double)
            _DriverAllowance = value
        End Set
    End Property

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

    Public Property EmployeeID() As String
        Get
            Return _EmployeeID
        End Get
        Set(ByVal value As String)
            _EmployeeID = value
        End Set
    End Property

    Public Property Email() As String
        Get
            Return _Email
        End Get
        Set(ByVal value As String)
            _Email = value
        End Set
    End Property

    Public Property LeaveApprover() As String
        Get
            Return _LeaveApprover
        End Get
        Set(ByVal value As String)
            _LeaveApprover = value
        End Set
    End Property

    Public Property LeaveRecommender() As String
        Get
            Return _LeaveRecommender
        End Get
        Set(ByVal value As String)
            _LeaveRecommender = value
        End Set
    End Property

    Dim _isActive, _IsEligibleForExternalTA, _AutoAdvTaxDeduction, _IsPermittedToShowOwn, _IsPermittedToShowOthers, _IncludedInPayroll As Boolean

    Public Property isActive() As Boolean
        Get
            Return _isActive
        End Get
        Set(ByVal value As Boolean)
            _isActive = value
        End Set
    End Property

    Public Property IsEligibleForExternalTA() As Boolean
        Get
            Return _IsEligibleForExternalTA
        End Get
        Set(ByVal value As Boolean)
            _IsEligibleForExternalTA = value
        End Set
    End Property

    Public Property AutoAdvTaxDeduction() As Boolean
        Get
            Return _AutoAdvTaxDeduction
        End Get
        Set(ByVal value As Boolean)
            _AutoAdvTaxDeduction = value
        End Set
    End Property

    Public Property IsPermittedToShowOwn() As Boolean
        Get
            Return _IsPermittedToShowOwn
        End Get
        Set(ByVal value As Boolean)
            _IsPermittedToShowOwn = value
        End Set
    End Property

    Public Property IsPermittedToShowOthers() As Boolean
        Get
            Return _IsPermittedToShowOthers
        End Get
        Set(ByVal value As Boolean)
            _IsPermittedToShowOthers = value
        End Set
    End Property

    Public Property IncludedInPayroll() As Boolean
        Get
            Return _IncludedInPayroll
        End Get
        Set(ByVal value As Boolean)
            _IncludedInPayroll = value
        End Set
    End Property

    Public Property UserID() As String
        Get
            Return _UserID
        End Get
        Set(ByVal value As String)
            _UserID = value
        End Set
    End Property

    Public Property Password() As String
        Get
            Return _Password
        End Get
        Set(ByVal value As String)
            _Password = value
        End Set
    End Property

    Public Property UserType() As String
        Get
            Return _UserType
        End Get
        Set(ByVal value As String)
            _UserType = value
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

    Public Property EmpCode() As String
        Get
            Return _EmpCode
        End Get
        Set(ByVal value As String)
            _EmpCode = value
        End Set
    End Property

    Public Property EmpTypeID() As String
        Get
            Return _EmpTypeID
        End Get
        Set(ByVal value As String)
            _EmpTypeID = value
        End Set
    End Property

    Public Property TerminationTypeID() As String
        Get
            Return _TerminationTypeID
        End Get
        Set(ByVal value As String)
            _TerminationTypeID = value
        End Set
    End Property

    Public Property RemarksOnTermination() As String
        Get
            Return _RemarksOnTermination
        End Get
        Set(ByVal value As String)
            _RemarksOnTermination = value
        End Set
    End Property

    Public Property JoiningDesignationID() As String
        Get
            Return _JoiningDesignationID
        End Get
        Set(ByVal value As String)
            _JoiningDesignationID = value
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

    Public Property CurrentSupervisor() As String
        Get
            Return _CurrentSupervisor
        End Get
        Set(ByVal value As String)
            _CurrentSupervisor = value
        End Set
    End Property

    Public Property JDno() As String
        Get
            Return _JDno
        End Get
        Set(ByVal value As String)
            _JDno = value
        End Set
    End Property

    Public Property Status() As String
        Get
            Return _Status
        End Get
        Set(ByVal value As String)
            _Status = value
        End Set
    End Property

    Public Property BankID() As String
        Get
            Return _BankID
        End Get
        Set(ByVal value As String)
            _BankID = value
        End Set
    End Property

    Public Property BranchID() As String
        Get
            Return _BranchID
        End Get
        Set(ByVal value As String)
            _BranchID = value
        End Set
    End Property

    Public Property BankAccountNo() As String
        Get
            Return _BankAccountNo
        End Get
        Set(ByVal value As String)
            _BankAccountNo = value
        End Set
    End Property

    Public Property AttendanceID() As String
        Get
            Return _AttendanceID
        End Get
        Set(ByVal value As String)
            _AttendanceID = value
        End Set
    End Property

    Public Property DateOfBirth() As DateTime
        Get
            Return _DateOfBirth
        End Get
        Set(ByVal value As DateTime)
            _DateOfBirth = value
        End Set
    End Property

    Public Property JoiningDate() As DateTime
        Get
            Return _JoiningDate
        End Get
        Set(ByVal value As DateTime)
            _JoiningDate = value
        End Set
    End Property

    Public Property ProbationEffectiveDate() As DateTime
        Get
            Return _ProbationEffectiveDate
        End Get
        Set(ByVal value As DateTime)
            _ProbationEffectiveDate = value
        End Set
    End Property

    Public Property ConfirmationDate() As DateTime
        Get
            Return _ConfirmationDate
        End Get
        Set(ByVal value As DateTime)
            _ConfirmationDate = value
        End Set
    End Property

    Public Property PromotionDate() As DateTime
        Get
            Return _PromotionDate
        End Get
        Set(ByVal value As DateTime)
            _PromotionDate = value
        End Set
    End Property

    Public Property ContractExpiryDate() As DateTime
        Get
            Return _ContractExpiryDate
        End Get
        Set(ByVal value As DateTime)
            _ContractExpiryDate = value
        End Set
    End Property

    Public Property ContractRenewalDate() As DateTime
        Get
            Return _ContractRenewalDate
        End Get
        Set(ByVal value As DateTime)
            _ContractRenewalDate = value
        End Set
    End Property

    Public Property TerminationDate() As DateTime
        Get
            Return _TerminationDate
        End Get
        Set(ByVal value As DateTime)
            _TerminationDate = value
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

    Dim _BasicSalary, _EntryExamScore, _PromotionalExamScore As Double

    Public Property BasicSalary() As Double
        Get
            Return _BasicSalary
        End Get
        Set(ByVal value As Double)
            _BasicSalary = value
        End Set
    End Property

    Public Property EntryExamScore() As Double
        Get
            Return _EntryExamScore
        End Get
        Set(ByVal value As Double)
            _EntryExamScore = value
        End Set
    End Property

    Public Property PromotionalExamScore() As Double
        Get
            Return _PromotionalExamScore
        End Get
        Set(ByVal value As Double)
            _PromotionalExamScore = value
        End Set
    End Property

    Public Property ProbationPeriod() As Integer
        Get
            Return _ProbationPeriod
        End Get
        Set(ByVal value As Integer)
            _ProbationPeriod = value
        End Set
    End Property

End Class

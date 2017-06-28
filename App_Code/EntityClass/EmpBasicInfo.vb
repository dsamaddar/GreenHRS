Imports Microsoft.VisualBasic

Public Class EmpBasicInfo
    Dim _CandidateID, _Name, _FatherName, _Attachment, _BloodGroupID, _Signature, _RelationshipStatus, _FathersOccupation, _MotherName, _MothersOccupation, _SpouseName, _SpouseOccupation, _NoOfChildrenAge, _SibblingsNameOccupation, _Gender, _NIDNo, _Nationality, _Religion, _PresentAddress, _PermanentAddress, _Email As String
    Dim _PreDistrict, _PreThana, _PerDistrict, _PerThana, _MobileNumber, _OfficePhone, _OfficeExtension, _AltEMail, _Documents, _EmployeeID, _EmpCode, _ApproverID, _RecommenderID As String
    Dim _IsChangeMadeToDocumentUploads As Boolean
    Dim _EmmergencyConPerName, _EmmerConPerPhone, _RelWithImmerConPer, _OfficialDesignation, _FunctionalDesignation, _CurrentSupervisor, _InsuranceNo, _TinNo, _PassportNo, _DrivingLicenseNo As String
    Dim _JoiningDate, _ConfirmationDate, _DateOfBirth As DateTime
    Dim _ActualBirthDate, _ActualBirthMonth, _DepartmentName, _EmployeeTypeName, _ServiceLength, _ULCBranchName, _BankID, _BranchID, _BankAccountNo, _HealthPlanID, _EntryBy As String
    Dim _PrimaryEvaluator, _SecondaryEvaluator As String

    Public Property SecondaryEvaluator() As String
        Get
            Return _SecondaryEvaluator
        End Get
        Set(ByVal value As String)
            _SecondaryEvaluator = value
        End Set
    End Property

    Public Property PrimaryEvaluator() As String
        Get
            Return _PrimaryEvaluator
        End Get
        Set(ByVal value As String)
            _PrimaryEvaluator = value
        End Set
    End Property

    Public Property CandidateID() As String
        Get
            Return _CandidateID
        End Get
        Set(ByVal value As String)
            _CandidateID = value
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

    Public Property RecommenderID() As String
        Get
            Return _RecommenderID
        End Get
        Set(ByVal value As String)
            _RecommenderID = value
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

    Public Property HealthPlanID() As String
        Get
            Return _HealthPlanID
        End Get
        Set(ByVal value As String)
            _HealthPlanID = value
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

    Public Property BranchID() As String
        Get
            Return _BranchID
        End Get
        Set(ByVal value As String)
            _BranchID = value
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

    Public Property ULCBranchName() As String
        Get
            Return _ULCBranchName
        End Get
        Set(ByVal value As String)
            _ULCBranchName = value
        End Set
    End Property

    Public Property ServiceLength() As String
        Get
            Return _ServiceLength
        End Get
        Set(ByVal value As String)
            _ServiceLength = value
        End Set
    End Property

    Public Property EmployeeTypeName() As String
        Get
            Return _EmployeeTypeName
        End Get
        Set(ByVal value As String)
            _EmployeeTypeName = value
        End Set
    End Property

    Public Property DepartmentName() As String
        Get
            Return _DepartmentName
        End Get
        Set(ByVal value As String)
            _DepartmentName = value
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

    Public Property EmployeeID() As String
        Get
            Return _EmployeeID
        End Get
        Set(ByVal value As String)
            _EmployeeID = value
        End Set
    End Property

    Public Property Documents() As String
        Get
            Return _Documents
        End Get
        Set(ByVal value As String)
            _Documents = value
        End Set
    End Property

    Public Property IsChangeMadeToDocumentUploads() As String
        Get
            Return _IsChangeMadeToDocumentUploads
        End Get
        Set(ByVal value As String)
            _IsChangeMadeToDocumentUploads = value
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

    Public Property Attachment() As String
        Get
            Return _Attachment
        End Get
        Set(ByVal value As String)
            _Attachment = value
        End Set
    End Property

    Public Property Signature() As String
        Get
            Return _Signature
        End Get
        Set(ByVal value As String)
            _Signature = value
        End Set
    End Property

    Public Property RelationshipStatus() As String
        Get
            Return _RelationshipStatus
        End Get
        Set(ByVal value As String)
            _RelationshipStatus = value
        End Set
    End Property

    Public Property Name() As String
        Get
            Return _Name
        End Get
        Set(ByVal value As String)
            _Name = value
        End Set
    End Property

    Public Property FatherName() As String
        Get
            Return _FatherName
        End Get
        Set(ByVal value As String)
            _FatherName = value
        End Set
    End Property

    Public Property FathersOccupation() As String
        Get
            Return _FathersOccupation
        End Get
        Set(ByVal value As String)
            _FathersOccupation = value
        End Set
    End Property

    Public Property MotherName() As String
        Get
            Return _MotherName
        End Get
        Set(ByVal value As String)
            _MotherName = value
        End Set
    End Property

    Public Property MothersOccupation() As String
        Get
            Return _MothersOccupation
        End Get
        Set(ByVal value As String)
            _MothersOccupation = value
        End Set
    End Property

    Public Property SpouseName() As String
        Get
            Return _SpouseName
        End Get
        Set(ByVal value As String)
            _SpouseName = value
        End Set
    End Property

    Public Property SpouseOccupation() As String
        Get
            Return _SpouseOccupation
        End Get
        Set(ByVal value As String)
            _SpouseOccupation = value
        End Set
    End Property

    Public Property NoOfChildrenAge() As String
        Get
            Return _NoOfChildrenAge
        End Get
        Set(ByVal value As String)
            _NoOfChildrenAge = value
        End Set
    End Property

    Public Property SibblingsNameOccupation() As String
        Get
            Return _SibblingsNameOccupation
        End Get
        Set(ByVal value As String)
            _SibblingsNameOccupation = value
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

    Public Property NIDNo() As String
        Get
            Return _NIDNo
        End Get
        Set(ByVal value As String)
            _NIDNo = value
        End Set
    End Property

    Public Property Nationality() As String
        Get
            Return _Nationality
        End Get
        Set(ByVal value As String)
            _Nationality = value
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

    Public Property PresentAddress() As String
        Get
            Return _PresentAddress
        End Get
        Set(ByVal value As String)
            _PresentAddress = value
        End Set
    End Property

    Public Property PreDistrict() As String
        Get
            Return _PreDistrict
        End Get
        Set(ByVal value As String)
            _PreDistrict = value
        End Set
    End Property

    Public Property PreThana() As String
        Get
            Return _PreThana
        End Get
        Set(ByVal value As String)
            _PreThana = value
        End Set
    End Property

    Public Property PermanentAddress() As String
        Get
            Return _PermanentAddress
        End Get
        Set(ByVal value As String)
            _PermanentAddress = value
        End Set
    End Property

    Public Property PerDistrict() As String
        Get
            Return _PerDistrict
        End Get
        Set(ByVal value As String)
            _PerDistrict = value
        End Set
    End Property

    Public Property PerThana() As String
        Get
            Return _PerThana
        End Get
        Set(ByVal value As String)
            _PerThana = value
        End Set
    End Property

    Public Property MobileNumber() As String
        Get
            Return _MobileNumber
        End Get
        Set(ByVal value As String)
            _MobileNumber = value
        End Set
    End Property

    Public Property OfficePhone() As String
        Get
            Return _OfficePhone
        End Get
        Set(ByVal value As String)
            _OfficePhone = value
        End Set
    End Property

    Public Property OfficeExtension() As String
        Get
            Return _OfficeExtension
        End Get
        Set(ByVal value As String)
            _OfficeExtension = value
        End Set
    End Property

    Public Property EMail() As String
        Get
            Return _Email
        End Get
        Set(ByVal value As String)
            _Email = value
        End Set
    End Property

    Public Property AltEMail() As String
        Get
            Return _AltEMail
        End Get
        Set(ByVal value As String)
            _AltEMail = value
        End Set
    End Property

    Public Property EmmergencyConPerName() As String
        Get
            Return _EmmergencyConPerName
        End Get
        Set(ByVal value As String)
            _EmmergencyConPerName = value
        End Set
    End Property

    Public Property EmmerConPerPhone() As String
        Get
            Return _EmmerConPerPhone
        End Get
        Set(ByVal value As String)
            _EmmerConPerPhone = value
        End Set
    End Property

    Public Property RelWithImmerConPer() As String
        Get
            Return _RelWithImmerConPer
        End Get
        Set(ByVal value As String)
            _RelWithImmerConPer = value
        End Set
    End Property

    Public Property TinNo() As String
        Get
            Return _TinNo
        End Get
        Set(ByVal value As String)
            _TinNo = value
        End Set
    End Property

    Public Property PassportNo() As String
        Get
            Return _PassportNo
        End Get
        Set(ByVal value As String)
            _PassportNo = value
        End Set
    End Property

    Public Property DrivingLicenseNo() As String
        Get
            Return _DrivingLicenseNo
        End Get
        Set(ByVal value As String)
            _DrivingLicenseNo = value
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

    Public Property ConfirmationDate() As DateTime
        Get
            Return _ConfirmationDate
        End Get
        Set(ByVal value As DateTime)
            _ConfirmationDate = value
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

    Public Property OfficialDesignation() As String
        Get
            Return _OfficialDesignation
        End Get
        Set(ByVal value As String)
            _OfficialDesignation = value
        End Set
    End Property

    Public Property FunctionalDesignation() As String
        Get
            Return _FunctionalDesignation
        End Get
        Set(ByVal value As String)
            _FunctionalDesignation = value
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

    Public Property ActualBirthDate() As String
        Get
            Return _ActualBirthDate
        End Get
        Set(ByVal value As String)
            _ActualBirthDate = value
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

    Public Property EntryBy() As String
        Get
            Return _EntryBy
        End Get
        Set(ByVal value As String)
            _EntryBy = value
        End Set
    End Property
End Class

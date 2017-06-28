Imports Microsoft.VisualBasic

Public Class CanBasicInfo
    Dim _Name, _FatherName, _DOB, _Attachment, _Signature, _RelationshipStatus, _FathersOccupation, _MotherName, _MothersOccupation, _SpouseName, _SpouseOccupation, _NoOfChildrenAge, _SibblingsNameOccupation, _Gender, _NIDNo, _Nationality, _Religion, _PresentAddress, _PermanentAddress, _CurrentLocation, _ComputerLiteracy As String
    Dim _HomePhoneNo, _PreDistrict, _BloodGroupID, _PreThana, _PerDistrict, _PerThana, _MobileNumber, _OfficePhoneNo, _PreferredJobLocation, _Employeer, _EMail, _AltEMail, _CareerObjective, _LookingFor, _AvailableFor, _UserID, _Password, _EnglishProficiency As String
    Dim _DateOfBirth, _LastDrawnDate As DateTime
    Dim _PresentSalary, _ExpectedSalary As Decimal
    Dim _AboutYourself, _SpecilizedIn, _Documents, _PassportNo As String
    Dim _YearOfExperience, _ExpInMonth As Integer
    Dim _IsChangeMadeToDocumentUploads As Boolean
    Public Property PassportNo() As String
        Get
            Return _PassportNo
        End Get
        Set(ByVal value As String)
            _PassportNo = value
        End Set
    End Property
    Public Property DOB() As String
        Get
            Return _DOB
        End Get
        Set(ByVal value As String)
            _DOB = value
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

    Public Property Employeer() As String
        Get
            Return _Employeer
        End Get
        Set(ByVal value As String)
            _Employeer = value
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
    Public Property PreferredJobLocation() As String
        Get
            Return _PreferredJobLocation
        End Get
        Set(ByVal value As String)
            _PreferredJobLocation = value
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


    Public Property ComputerLiteracy() As String
        Get
            Return _ComputerLiteracy
        End Get
        Set(ByVal value As String)
            _ComputerLiteracy = value
        End Set
    End Property
    Public Property HomePhoneNo() As String
        Get
            Return _HomePhoneNo
        End Get
        Set(ByVal value As String)
            _HomePhoneNo = value
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
    Public Property OfficePhoneNo() As String
        Get
            Return _OfficePhoneNo
        End Get
        Set(ByVal value As String)
            _OfficePhoneNo = value
        End Set
    End Property
    Public Property EMail() As String
        Get
            Return _EMail
        End Get
        Set(ByVal value As String)
            _EMail = value
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
    Public Property CareerObjective() As String
        Get
            Return _CareerObjective
        End Get
        Set(ByVal value As String)
            _CareerObjective = value
        End Set
    End Property
    Public Property LookingFor() As String
        Get
            Return _LookingFor
        End Get
        Set(ByVal value As String)
            _LookingFor = value
        End Set
    End Property
    Public Property AvailableFor() As String
        Get
            Return _AvailableFor
        End Get
        Set(ByVal value As String)
            _AvailableFor = value
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
    Public Property EnglishProficiency() As String
        Get
            Return _EnglishProficiency
        End Get
        Set(ByVal value As String)
            _EnglishProficiency = value
        End Set
    End Property
    Public Property YearOfExperience() As Integer
        Get
            Return _YearOfExperience
        End Get
        Set(ByVal value As Integer)
            _YearOfExperience = value
        End Set
    End Property
    Public Property ExpInMonth() As Integer
        Get
            Return _ExpInMonth
        End Get
        Set(ByVal value As Integer)
            _ExpInMonth = value
        End Set
    End Property
    Public Property PresentSalary() As Decimal
        Get
            Return _PresentSalary
        End Get
        Set(ByVal value As Decimal)
            _PresentSalary = value
        End Set
    End Property
    Public Property ExpectedSalary() As Decimal
        Get
            Return _ExpectedSalary
        End Get
        Set(ByVal value As Decimal)
            _ExpectedSalary = value
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
    Public Property LastDrawnDate() As DateTime
        Get
            Return _LastDrawnDate
        End Get
        Set(ByVal value As DateTime)
            _LastDrawnDate = value
        End Set
    End Property

    Public Property AboutYourself() As String
        Get
            Return _AboutYourself
        End Get
        Set(ByVal value As String)
            _AboutYourself = value
        End Set
    End Property

    Public Property SpecilizedIn() As String
        Get
            Return _SpecilizedIn
        End Get
        Set(ByVal value As String)
            _SpecilizedIn = value
        End Set
    End Property
End Class


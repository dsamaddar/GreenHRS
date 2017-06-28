Imports Microsoft.VisualBasic

Public Class clsJobCircular

    Dim _CircularID, _JobTitle, _CircularCode, _JobLocation, _OrganizationID, _DepartmentID, _JobDescription, _JobResponsibility, _SpecialSkillReq, _AddiJobReq As String

    Public Property CircularID() As String
        Get
            Return _CircularID
        End Get
        Set(ByVal value As String)
            _CircularID = value
        End Set
    End Property

    Public Property JobTitle() As String
        Get
            Return _JobTitle
        End Get
        Set(ByVal value As String)
            _JobTitle = value
        End Set
    End Property
    Public Property CircularCode() As String
        Get
            Return _CircularCode
        End Get
        Set(ByVal value As String)
            _CircularCode = value
        End Set
    End Property

    Public Property JobLocation() As String
        Get
            Return _JobLocation
        End Get
        Set(ByVal value As String)
            _JobLocation = value
        End Set
    End Property

    Public Property OrganizationID() As String
        Get
            Return _OrganizationID
        End Get
        Set(ByVal value As String)
            _OrganizationID = value
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

    Public Property JobDescription() As String
        Get
            Return _JobDescription
        End Get
        Set(ByVal value As String)
            _JobDescription = value
        End Set
    End Property

    Public Property JobResponsibility() As String
        Get
            Return _JobResponsibility
        End Get
        Set(ByVal value As String)
            _JobResponsibility = value
        End Set
    End Property

    Public Property SpecialSkillReq() As String
        Get
            Return _SpecialSkillReq
        End Get
        Set(ByVal value As String)
            _SpecialSkillReq = value
        End Set
    End Property

    Public Property AddiJobReq() As String
        Get
            Return _AddiJobReq
        End Get
        Set(ByVal value As String)
            _AddiJobReq = value
        End Set
    End Property

    Dim _EducationalReq, _DutySchedule, _SalaryAndBenefits, _Competencies, _CommunicationSkill, _ReportableTo, _ApplyInstructions, _CompanyAddress, _TermsOfReferences As String

    Public Property EducationalReq() As String
        Get
            Return _EducationalReq
        End Get
        Set(ByVal value As String)
            _EducationalReq = value
        End Set
    End Property

    Public Property DutySchedule() As String
        Get
            Return _DutySchedule
        End Get
        Set(ByVal value As String)
            _DutySchedule = value
        End Set
    End Property

    Public Property SalaryAndBenefits() As String
        Get
            Return _SalaryAndBenefits
        End Get
        Set(ByVal value As String)
            _SalaryAndBenefits = value
        End Set
    End Property

    Public Property Competencies() As String
        Get
            Return _Competencies
        End Get
        Set(ByVal value As String)
            _Competencies = value
        End Set
    End Property

    Public Property CommunicationSkill() As String
        Get
            Return _CommunicationSkill
        End Get
        Set(ByVal value As String)
            _CommunicationSkill = value
        End Set
    End Property

    Public Property ReportableTo() As String
        Get
            Return _ReportableTo
        End Get
        Set(ByVal value As String)
            _ReportableTo = value
        End Set
    End Property

    Public Property ApplyInstructions() As String
        Get
            Return _ApplyInstructions
        End Get
        Set(ByVal value As String)
            _ApplyInstructions = value
        End Set
    End Property

    Public Property CompanyAddress() As String
        Get
            Return _CompanyAddress
        End Get
        Set(ByVal value As String)
            _CompanyAddress = value
        End Set
    End Property

    Public Property TermsOfReferences() As String
        Get
            Return _TermsOfReferences
        End Get
        Set(ByVal value As String)
            _TermsOfReferences = value
        End Set
    End Property

    Dim _HeaderNote, _FooterNote, _HeaderImage, _MiddleImage, _FooterImage, _Attachment, _Status, _ApprovedBy, _EntryBy As String

    Public Property HeaderNote() As String
        Get
            Return _HeaderNote
        End Get
        Set(ByVal value As String)
            _HeaderNote = value
        End Set
    End Property

    Public Property FooterNote() As String
        Get
            Return _FooterNote
        End Get
        Set(ByVal value As String)
            _FooterNote = value
        End Set
    End Property

    Public Property HeaderImage() As String
        Get
            Return _HeaderImage
        End Get
        Set(ByVal value As String)
            _HeaderImage = value
        End Set
    End Property

    Public Property MiddleImage() As String
        Get
            Return _MiddleImage
        End Get
        Set(ByVal value As String)
            _MiddleImage = value
        End Set
    End Property

    Public Property FooterImage() As String
        Get
            Return _FooterImage
        End Get
        Set(ByVal value As String)
            _FooterImage = value
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

    Public Property Status() As String
        Get
            Return _Status
        End Get
        Set(ByVal value As String)
            _Status = value
        End Set
    End Property

    Public Property ApprovedBy() As String
        Get
            Return _ApprovedBy
        End Get
        Set(ByVal value As String)
            _ApprovedBy = value
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

    Dim _ExperienceReqInYrs, _Vacancies, _MinAgeLimit, _MaxAgeLimit, _MaxApplicant As Integer

    Public Property ExperienceReqInYrs() As Integer
        Get
            Return _ExperienceReqInYrs
        End Get
        Set(ByVal value As Integer)
            _ExperienceReqInYrs = value
        End Set
    End Property

    Public Property Vacancies() As Integer
        Get
            Return _Vacancies
        End Get
        Set(ByVal value As Integer)
            _Vacancies = value
        End Set
    End Property

    Public Property MinAgeLimit() As Integer
        Get
            Return _MinAgeLimit
        End Get
        Set(ByVal value As Integer)
            _MinAgeLimit = value
        End Set
    End Property

    Public Property MaxAgeLimit() As Integer
        Get
            Return _MaxAgeLimit
        End Get
        Set(ByVal value As Integer)
            _MaxAgeLimit = value
        End Set
    End Property

    Public Property MaxApplicant() As Integer
        Get
            Return _MaxApplicant
        End Get
        Set(ByVal value As Integer)
            _MaxApplicant = value
        End Set
    End Property

    Dim _ClosingDate, _ApprovalDate, _EntryDate As DateTime

    Public Property ClosingDate() As DateTime
        Get
            Return _ClosingDate
        End Get
        Set(ByVal value As DateTime)
            _ClosingDate = value
        End Set
    End Property

    Public Property ApprovalDate() As DateTime
        Get
            Return _ApprovalDate
        End Get
        Set(ByVal value As DateTime)
            _ApprovalDate = value
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

    Dim _Approved, _IsActive As Boolean

    Public Property Approved() As Boolean
        Get
            Return _Approved
        End Get
        Set(ByVal value As Boolean)
            _Approved = value
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

End Class

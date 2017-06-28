Imports Microsoft.VisualBasic

Public Class clsResignation

    Dim _ResignationID, _EmployeeID, _EmployeeName, _Photo, _EmpCode, _DepartmentID, _Department, _CurrentSupervisor, _Supervisor, _ULCBranchID, _Branch, _ReasonOfResignation, _FeedbackAboutCompany, _SupervisorComment, _EntryBy, _Status As String

    Public Property ResignationID() As String
        Get
            Return _ResignationID
        End Get
        Set(ByVal value As String)
            _ResignationID = value
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

    Public Property EmployeeName() As String
        Get
            Return _EmployeeName
        End Get
        Set(ByVal value As String)
            _EmployeeName = value
        End Set
    End Property

    Public Property Photo() As String
        Get
            Return _Photo
        End Get
        Set(ByVal value As String)
            _Photo = value
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

    Public Property DepartmentID() As String
        Get
            Return _DepartmentID
        End Get
        Set(ByVal value As String)
            _DepartmentID = value
        End Set
    End Property

    Public Property Department() As String
        Get
            Return _Department
        End Get
        Set(ByVal value As String)
            _Department = value
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

    Public Property Supervisor() As String
        Get
            Return _Supervisor
        End Get
        Set(ByVal value As String)
            _Supervisor = value
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

    Public Property Branch() As String
        Get
            Return _Branch
        End Get
        Set(ByVal value As String)
            _Branch = value
        End Set
    End Property

    Public Property ReasonOfResignation() As String
        Get
            Return _ReasonOfResignation
        End Get
        Set(ByVal value As String)
            _ReasonOfResignation = value
        End Set
    End Property

    Public Property FeedbackAboutCompany() As String
        Get
            Return _FeedbackAboutCompany
        End Get
        Set(ByVal value As String)
            _FeedbackAboutCompany = value
        End Set
    End Property

    Public Property SupervisorComment() As String
        Get
            Return _SupervisorComment
        End Get
        Set(ByVal value As String)
            _SupervisorComment = value
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

    Public Property Status() As String
        Get
            Return _Status
        End Get
        Set(ByVal value As String)
            _Status = value
        End Set
    End Property

    Dim _DateOfJoining, _DateOfConfirmation, _DateOfBirth, _EffectiveDate, _ProposedEffectiveDate, _SupervisorApprovalDate, _HRHODApprovalDate, _ReleasedDate, _EntryDate As DateTime

    Public Property DateOfJoining() As DateTime
        Get
            Return _DateOfJoining
        End Get
        Set(ByVal value As DateTime)
            _DateOfJoining = value
        End Set
    End Property

    Public Property DateOfConfirmation() As DateTime
        Get
            Return _DateOfConfirmation
        End Get
        Set(ByVal value As DateTime)
            _DateOfConfirmation = value
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

    Public Property EffectiveDate() As DateTime
        Get
            Return _EffectiveDate
        End Get
        Set(ByVal value As DateTime)
            _EffectiveDate = value
        End Set
    End Property

    Public Property ProposedEffectiveDate() As DateTime
        Get
            Return _ProposedEffectiveDate
        End Get
        Set(ByVal value As DateTime)
            _ProposedEffectiveDate = value
        End Set
    End Property

    Public Property SupervisorApprovalDate() As DateTime
        Get
            Return _SupervisorApprovalDate
        End Get
        Set(ByVal value As DateTime)
            _SupervisorApprovalDate = value
        End Set
    End Property

    Public Property HRHODApprovalDate() As DateTime
        Get
            Return _HRHODApprovalDate
        End Get
        Set(ByVal value As DateTime)
            _HRHODApprovalDate = value
        End Set
    End Property

    Public Property ReleasedDate() As DateTime
        Get
            Return _ReleasedDate
        End Get
        Set(ByVal value As DateTime)
            _ReleasedDate = value
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

    Dim _IsSupervisorApproved, _IsReleased, _IsHRHODApproved As Boolean

    Public Property IsSupervisorApproved() As Boolean
        Get
            Return _IsSupervisorApproved
        End Get
        Set(ByVal value As Boolean)
            _IsSupervisorApproved = value
        End Set
    End Property

    Public Property IsReleased() As Boolean
        Get
            Return _IsReleased
        End Get
        Set(ByVal value As Boolean)
            _IsReleased = value
        End Set
    End Property

    Public Property IsHRHODApproved() As Boolean
        Get
            Return _IsHRHODApproved
        End Get
        Set(ByVal value As Boolean)
            _IsHRHODApproved = value
        End Set
    End Property

End Class

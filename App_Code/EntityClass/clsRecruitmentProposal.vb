Imports Microsoft.VisualBasic

Public Class clsRecruitmentProposal

    Dim _IntCandidateID, _ProposalID, _CandidateID, _CircularID, _DepartmentID, _ULCBranchID, _DesignationID, _EmployeeTypeID, _Remarks, _EntryBy, _ApprovedBy As String

    Public Property IntCandidateID() As String
        Get
            Return _IntCandidateID
        End Get
        Set(ByVal value As String)
            _IntCandidateID = value
        End Set
    End Property

    Public Property ProposalID() As String
        Get
            Return _ProposalID
        End Get
        Set(ByVal value As String)
            _ProposalID = value
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

    Public Property CircularID() As String
        Get
            Return _CircularID
        End Get
        Set(ByVal value As String)
            _CircularID = value
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

    Public Property DesignationID() As String
        Get
            Return _DesignationID
        End Get
        Set(ByVal value As String)
            _DesignationID = value
        End Set
    End Property

    Public Property EmployeeTypeID() As String
        Get
            Return _EmployeeTypeID
        End Get
        Set(ByVal value As String)
            _EmployeeTypeID = value
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

    Public Property EntryBy() As String
        Get
            Return _EntryBy
        End Get
        Set(ByVal value As String)
            _EntryBy = value
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

    Dim _Salary, _LocalConveyance As Double

    Public Property Salary() As Double
        Get
            Return _Salary
        End Get
        Set(ByVal value As Double)
            _Salary = value
        End Set
    End Property

    Public Property LocalConveyance() As Double
        Get
            Return _LocalConveyance
        End Get
        Set(ByVal value As Double)
            _LocalConveyance = value
        End Set
    End Property

    Dim _ExpectedJoiningDate, _JoiningDate, _EntryDate, _ApprovalDate, _EffectiveFrom, _EffectiveTo As DateTime

    Public Property ExpectedJoiningDate() As DateTime
        Get
            Return _ExpectedJoiningDate
        End Get
        Set(ByVal value As DateTime)
            _ExpectedJoiningDate = value
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

    Public Property EntryDate() As DateTime
        Get
            Return _EntryDate
        End Get
        Set(ByVal value As DateTime)
            _EntryDate = value
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

    Public Property EffectiveFrom() As DateTime
        Get
            Return _EffectiveFrom
        End Get
        Set(ByVal value As DateTime)
            _EffectiveFrom = value
        End Set
    End Property

    Public Property EffectiveTo() As DateTime
        Get
            Return _EffectiveTo
        End Get
        Set(ByVal value As DateTime)
            _EffectiveTo = value
        End Set
    End Property

    Dim _IsJoined, _IsApproved As Boolean

    Public Property IsJoined() As Boolean
        Get
            Return _IsJoined
        End Get
        Set(ByVal value As Boolean)
            _IsJoined = value
        End Set
    End Property

    Public Property IsApproved() As Boolean
        Get
            Return _IsApproved
        End Get
        Set(ByVal value As Boolean)
            _IsApproved = value
        End Set
    End Property

    Dim _Period As Integer

    Public Property Period() As Integer
        Get
            Return _Period
        End Get
        Set(ByVal value As Integer)
            _Period = value
        End Set
    End Property

End Class

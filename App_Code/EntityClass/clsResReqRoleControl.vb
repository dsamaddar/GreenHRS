Imports Microsoft.VisualBasic

Public Class clsResReqRoleControl

    Dim _ResReqControlID, _ResReqControlIDList, _EmployeeID, _RecruitmentTypeID, _EntryBy As String

    Public Property ResReqControlID() As String
        Get
            Return _ResReqControlID
        End Get
        Set(ByVal value As String)
            _ResReqControlID = value
        End Set
    End Property

    Public Property ResReqControlIDList() As String
        Get
            Return _ResReqControlIDList
        End Get
        Set(ByVal value As String)
            _ResReqControlIDList = value
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

    Public Property RecruitmentTypeID() As String
        Get
            Return _RecruitmentTypeID
        End Get
        Set(ByVal value As String)
            _RecruitmentTypeID = value
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

    Dim _CanRequest, _CanApprove As Boolean

    Public Property CanRequest() As Boolean
        Get
            Return _CanRequest
        End Get
        Set(ByVal value As Boolean)
            _CanRequest = value
        End Set
    End Property

    Public Property CanApprove() As Boolean
        Get
            Return _CanApprove
        End Get
        Set(ByVal value As Boolean)
            _CanApprove = value
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

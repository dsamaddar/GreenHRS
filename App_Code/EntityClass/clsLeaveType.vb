Imports Microsoft.VisualBasic

Public Class clsLeaveType

    Dim _LeaveTypeID, _LeaveType, _EntryBy As String

    Public Property LeaveTypeID() As String
        Get
            Return _LeaveTypeID
        End Get
        Set(ByVal value As String)
            _LeaveTypeID = value
        End Set
    End Property

    Public Property LeaveType() As String
        Get
            Return _LeaveType
        End Get
        Set(ByVal value As String)
            _LeaveType = value
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

    Dim _OnlyForMale, _OnlyForFemale, _IsDedFrmLeaveBalance, _IsActive As Boolean

    Public Property OnlyForMale() As Boolean
        Get
            Return _OnlyForMale
        End Get
        Set(ByVal value As Boolean)
            _OnlyForMale = value
        End Set
    End Property

    Public Property OnlyForFemale() As Boolean
        Get
            Return _OnlyForFemale
        End Get
        Set(ByVal value As Boolean)
            _OnlyForFemale = value
        End Set
    End Property

    Public Property IsDedFrmLeaveBalance() As Boolean
        Get
            Return _IsDedFrmLeaveBalance
        End Get
        Set(ByVal value As Boolean)
            _IsDedFrmLeaveBalance = value
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

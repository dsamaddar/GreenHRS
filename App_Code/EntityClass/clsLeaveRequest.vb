Imports Microsoft.VisualBasic

Public Class clsLeaveRequest

    Dim _EmployeeID, _LeaveRequestID, _AppLeaveRejectionID, _ActionType, _ActorRemarks, _ActedBy, _Remarks, _LeaveTypeID, _PurposeOfLeave, _EmergencyAddress, _EmergencyContactNo, _EmergencyMailAddress, _RecommenderID, _ApproverID, _EventName, _EntryBy As String

    Public Property EmployeeID() As String
        Get
            Return _EmployeeID
        End Get
        Set(ByVal value As String)
            _EmployeeID = value
        End Set
    End Property

    Public Property LeaveRequestID() As String
        Get
            Return _LeaveRequestID
        End Get
        Set(ByVal value As String)
            _LeaveRequestID = value
        End Set
    End Property

    Public Property AppLeaveRejectionID() As String
        Get
            Return _AppLeaveRejectionID
        End Get
        Set(ByVal value As String)
            _AppLeaveRejectionID = value
        End Set
    End Property

    Public Property ActionType() As String
        Get
            Return _ActionType
        End Get
        Set(ByVal value As String)
            _ActionType = value
        End Set
    End Property

    Public Property ActorRemarks() As String
        Get
            Return _ActorRemarks
        End Get
        Set(ByVal value As String)
            _ActorRemarks = value
        End Set
    End Property

    Public Property ActedBy() As String
        Get
            Return _ActedBy
        End Get
        Set(ByVal value As String)
            _ActedBy = value
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

    Public Property LeaveTypeID() As String
        Get
            Return _LeaveTypeID
        End Get
        Set(ByVal value As String)
            _LeaveTypeID = value
        End Set
    End Property

    Public Property PurposeOfLeave() As String
        Get
            Return _PurposeOfLeave
        End Get
        Set(ByVal value As String)
            _PurposeOfLeave = value
        End Set
    End Property

    Public Property EmergencyAddress() As String
        Get
            Return _EmergencyAddress
        End Get
        Set(ByVal value As String)
            _EmergencyAddress = value
        End Set
    End Property

    Public Property EmergencyContactNo() As String
        Get
            Return _EmergencyContactNo
        End Get
        Set(ByVal value As String)
            _EmergencyContactNo = value
        End Set
    End Property

    Public Property EmergencyMailAddress() As String
        Get
            Return _EmergencyMailAddress
        End Get
        Set(ByVal value As String)
            _EmergencyMailAddress = value
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

    Public Property ApproverID() As String
        Get
            Return _ApproverID
        End Get
        Set(ByVal value As String)
            _ApproverID = value
        End Set
    End Property

    Public Property EventName() As String
        Get
            Return _EventName
        End Get
        Set(ByVal value As String)
            _EventName = value
        End Set
    End Property

    Dim _TotalDays, _TotalWorkingDays, _InBetweenHolidays As Integer

    Public Property TotalDays() As Integer
        Get
            Return _TotalDays
        End Get
        Set(ByVal value As Integer)
            _TotalDays = value
        End Set
    End Property

    Public Property TotalWorkingDays() As Integer
        Get
            Return _TotalWorkingDays
        End Get
        Set(ByVal value As Integer)
            _TotalWorkingDays = value
        End Set
    End Property

    Public Property InBetweenHolidays() As Integer
        Get
            Return _InBetweenHolidays
        End Get
        Set(ByVal value As Integer)
            _InBetweenHolidays = value
        End Set
    End Property

    Dim _LeaveFrom, _LeaveTo, _RequestedOn As DateTime

    Public Property LeaveFrom() As DateTime
        Get
            Return _LeaveFrom
        End Get
        Set(ByVal value As DateTime)
            _LeaveFrom = value
        End Set
    End Property

    Public Property LeaveTo() As DateTime
        Get
            Return _LeaveTo
        End Get
        Set(ByVal value As DateTime)
            _LeaveTo = value
        End Set
    End Property

    Public Property RequestedOn() As DateTime
        Get
            Return _RequestedOn
        End Get
        Set(ByVal value As DateTime)
            _RequestedOn = value
        End Set
    End Property

End Class

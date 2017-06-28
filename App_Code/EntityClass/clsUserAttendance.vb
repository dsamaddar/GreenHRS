Imports Microsoft.VisualBasic

Public Class clsUserAttendance

    Dim _UserAttendanceID, _EmpList, _IdealLogTimeText, _UserID, _EmployeeID, _AttendanceID, _AttendanceIDList, _UserIDList, _WorkStation, _Remarks, _DocumentReference, _EntryBy As String

    Public Property UserAttendanceID() As String
        Get
            Return _UserAttendanceID
        End Get
        Set(ByVal value As String)
            _UserAttendanceID = value
        End Set
    End Property

    Public Property EmpList() As String
        Get
            Return _EmpList
        End Get
        Set(ByVal value As String)
            _EmpList = value
        End Set
    End Property

    Public Property IdealLogTimeText() As String
        Get
            Return _IdealLogTimeText
        End Get
        Set(ByVal value As String)
            _IdealLogTimeText = value
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

    Public Property EmployeeID() As String
        Get
            Return _EmployeeID
        End Get
        Set(ByVal value As String)
            _EmployeeID = value
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

    Public Property AttendanceIDList() As String
        Get
            Return _AttendanceIDList
        End Get
        Set(ByVal value As String)
            _AttendanceIDList = value
        End Set
    End Property

    Public Property UserIDList() As String
        Get
            Return _UserIDList
        End Get
        Set(ByVal value As String)
            _UserIDList = value
        End Set
    End Property

    Public Property WorkStation() As String
        Get
            Return _WorkStation
        End Get
        Set(ByVal value As String)
            _WorkStation = value
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

    Public Property DocumentReference() As String
        Get
            Return _DocumentReference
        End Get
        Set(ByVal value As String)
            _DocumentReference = value
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

    Dim _LogIndex, _MaxLogIndex As Long

    Public Property LogIndex() As Long
        Get
            Return _LogIndex
        End Get
        Set(ByVal value As Long)
            _LogIndex = value
        End Set
    End Property

    Public Property MaxLogIndex() As Long
        Get
            Return _MaxLogIndex
        End Get
        Set(ByVal value As Long)
            _MaxLogIndex = value
        End Set
    End Property

    Dim _LogTime, _IdealLogTime, _DateFrom, _DateTo, _MaxLogTime, _AbsentDate As DateTime

    Public Property LogTime() As DateTime
        Get
            Return _LogTime
        End Get
        Set(ByVal value As DateTime)
            _LogTime = value
        End Set
    End Property

    Public Property IdealLogTime() As DateTime
        Get
            Return _IdealLogTime
        End Get
        Set(ByVal value As DateTime)
            _IdealLogTime = value
        End Set
    End Property

    Public Property DateFrom() As DateTime
        Get
            Return _DateFrom
        End Get
        Set(ByVal value As DateTime)
            _DateFrom = value
        End Set
    End Property

    Public Property DateTo() As DateTime
        Get
            Return _DateTo
        End Get
        Set(ByVal value As DateTime)
            _DateTo = value
        End Set
    End Property

    Public Property MaxLogTime() As DateTime
        Get
            Return _MaxLogTime
        End Get
        Set(ByVal value As DateTime)
            _MaxLogTime = value
        End Set
    End Property

    Public Property AbsentDate() As DateTime
        Get
            Return _AbsentDate
        End Get
        Set(ByVal value As DateTime)
            _AbsentDate = value
        End Set
    End Property

    Dim _NodeID As Integer

    Public Property NodeID() As Integer
        Get
            Return _NodeID
        End Get
        Set(ByVal value As Integer)
            _NodeID = value
        End Set
    End Property

End Class

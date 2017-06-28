Imports Microsoft.VisualBasic

Public Class clsLateAttendanceCause

    Dim _LateAttCauseID, _Cause, _EntryBy, _ReportableToDept As String

    Public Property LateAttCauseID() As String
        Get
            Return _LateAttCauseID
        End Get
        Set(ByVal value As String)
            _LateAttCauseID = value
        End Set
    End Property

    Public Property Cause() As String
        Get
            Return _Cause
        End Get
        Set(ByVal value As String)
            _Cause = value
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

    Public Property ReportableToDept() As String
        Get
            Return _ReportableToDept
        End Get
        Set(ByVal value As String)
            _ReportableToDept = value
        End Set
    End Property

    Dim _IsReportable, _IsDetailsMandatory, _IsActive As Boolean

    Public Property IsReportable() As Boolean
        Get
            Return _IsReportable
        End Get
        Set(ByVal value As Boolean)
            _IsReportable = value
        End Set
    End Property

    Public Property IsDetailsMandatory() As Boolean
        Get
            Return _IsDetailsMandatory
        End Get
        Set(ByVal value As Boolean)
            _IsDetailsMandatory = value
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

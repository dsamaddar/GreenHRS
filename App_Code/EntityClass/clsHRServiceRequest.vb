Imports Microsoft.VisualBasic

Public Class clsHRServiceRequest

    Dim _EmployeeName, _EmployeeID, _HRServiceIssueID, _HRService, _HRServiceID, _Remarks, _ServiceProvider, _ServiceProviderRemarks, _RejectionRemarks, _RejectedBy, _ServiceStatus, _EntryBy, _ServiceEvent, _IsServiceProvidedEX, _IsRejectedEX As String

    Public Property EmployeeName() As String
        Get
            Return _EmployeeName
        End Get
        Set(ByVal value As String)
            _EmployeeName = value
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

    Public Property HRServiceIssueID() As String
        Get
            Return _HRServiceIssueID
        End Get
        Set(ByVal value As String)
            _HRServiceIssueID = value
        End Set
    End Property

    Public Property HRService() As String
        Get
            Return _HRService
        End Get
        Set(ByVal value As String)
            _HRService = value
        End Set
    End Property

    Public Property HRServiceID() As String
        Get
            Return _HRServiceID
        End Get
        Set(ByVal value As String)
            _HRServiceID = value
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

    Public Property ServiceProvider() As String
        Get
            Return _ServiceProvider
        End Get
        Set(ByVal value As String)
            _ServiceProvider = value
        End Set
    End Property

    Public Property ServiceProviderRemarks() As String
        Get
            Return _ServiceProviderRemarks
        End Get
        Set(ByVal value As String)
            _ServiceProviderRemarks = value
        End Set
    End Property

    Public Property RejectionRemarks() As String
        Get
            Return _RejectionRemarks
        End Get
        Set(ByVal value As String)
            _RejectionRemarks = value
        End Set
    End Property

    Public Property RejectedBy() As String
        Get
            Return _RejectedBy
        End Get
        Set(ByVal value As String)
            _RejectedBy = value
        End Set
    End Property

    Public Property ServiceStatus() As String
        Get
            Return _ServiceStatus
        End Get
        Set(ByVal value As String)
            _ServiceStatus = value
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

    Public Property ServiceEvent() As String
        Get
            Return _ServiceEvent
        End Get
        Set(ByVal value As String)
            _ServiceEvent = value
        End Set
    End Property

    Public Property IsServiceProvidedEX() As String
        Get
            Return _IsServiceProvidedEX
        End Get
        Set(ByVal value As String)
            _IsServiceProvidedEX = value
        End Set
    End Property

    Public Property IsRejectedEX() As String
        Get
            Return _IsRejectedEX
        End Get
        Set(ByVal value As String)
            _IsRejectedEX = value
        End Set
    End Property

    Dim _EffectiveDate, _ServingDate, _RejectionDate, _EntryDate As DateTime

    Public Property EffectiveDate() As DateTime
        Get
            Return _EffectiveDate
        End Get
        Set(ByVal value As DateTime)
            _EffectiveDate = value
        End Set
    End Property

    Public Property ServingDate() As DateTime
        Get
            Return _ServingDate
        End Get
        Set(ByVal value As DateTime)
            _ServingDate = value
        End Set
    End Property

    Public Property RejectionDate() As DateTime
        Get
            Return _RejectionDate
        End Get
        Set(ByVal value As DateTime)
            _RejectionDate = value
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

    Dim _IsServiceProvided, _IsRejected As Boolean

    Public Property IsServiceProvided() As Boolean
        Get
            Return _IsServiceProvided
        End Get
        Set(ByVal value As Boolean)
            _IsServiceProvided = value
        End Set
    End Property

   

    Public Property IsRejected() As Boolean
        Get
            Return _IsRejected
        End Get
        Set(ByVal value As Boolean)
            _IsRejected = value
        End Set
    End Property

End Class

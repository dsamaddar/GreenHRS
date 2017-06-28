Imports Microsoft.VisualBasic

Public Class clsHRServices

    Dim _HRServiceID, _HRService, _HRServiceReqInstruction, _EntryBy As String

    Public Property HRServiceID() As String
        Get
            Return _HRServiceID
        End Get
        Set(ByVal value As String)
            _HRServiceID = value
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

    Public Property HRServiceReqInstruction() As String
        Get
            Return _HRServiceReqInstruction
        End Get
        Set(ByVal value As String)
            _HRServiceReqInstruction = value
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

    Dim _SeqPriority As Integer

    Public Property SeqPriority() As Integer
        Get
            Return _SeqPriority
        End Get
        Set(ByVal value As Integer)
            _SeqPriority = value
        End Set
    End Property

    Dim _IsActive As Boolean

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

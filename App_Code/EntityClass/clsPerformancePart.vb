Imports Microsoft.VisualBasic

Public Class clsPerformancePart

    Dim _PerformancePartID, _PerformancePart, _EntryBy As String

    Public Property PerformancePartID() As String
        Get
            Return _PerformancePartID
        End Get
        Set(ByVal value As String)
            _PerformancePartID = value
        End Set
    End Property

    Public Property PerformancePart() As String
        Get
            Return _PerformancePart
        End Get
        Set(ByVal value As String)
            _PerformancePart = value
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

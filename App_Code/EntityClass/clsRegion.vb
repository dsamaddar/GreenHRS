Imports Microsoft.VisualBasic

Public Class clsRegion

    Dim _RegionID, _Region, _EntryBy As String

    Public Property RegionID() As String
        Get
            Return _RegionID
        End Get
        Set(ByVal value As String)
            _RegionID = value
        End Set
    End Property

    Public Property Region() As String
        Get
            Return _Region
        End Get
        Set(ByVal value As String)
            _Region = value
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

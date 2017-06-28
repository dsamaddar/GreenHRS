Imports Microsoft.VisualBasic

Public Class clsULCBranch

    Dim _ULCBranchID, _ULCBranchName, _BranchLocation, _RegionID, _EntryBy As String

    Public Property ULCBranchID() As String
        Get
            Return _ULCBranchID
        End Get
        Set(ByVal value As String)
            _ULCBranchID = value
        End Set
    End Property

    Public Property ULCBranchName() As String
        Get
            Return _ULCBranchName
        End Get
        Set(ByVal value As String)
            _ULCBranchName = value
        End Set
    End Property

    Public Property BranchLocation() As String
        Get
            Return _BranchLocation
        End Get
        Set(ByVal value As String)
            _BranchLocation = value
        End Set
    End Property

    Public Property RegionID() As String
        Get
            Return _RegionID
        End Get
        Set(ByVal value As String)
            _RegionID = value
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

    Dim _isActive As Boolean

    Public Property isActive() As Boolean
        Get
            Return _isActive
        End Get
        Set(ByVal value As Boolean)
            _isActive = value
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

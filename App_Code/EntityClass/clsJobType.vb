Imports Microsoft.VisualBasic

Public Class clsJobType

    Dim _JobTypeID, _JobType, _EntryBy As String

    Public Property JobTypeID() As String
        Get
            Return _JobTypeID
        End Get
        Set(ByVal value As String)
            _JobTypeID = value
        End Set
    End Property

    Public Property JobType() As String
        Get
            Return _JobType
        End Get
        Set(ByVal value As String)
            _JobType = value
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

    Public Property EntryDate() As String
        Get
            Return _EntryDate
        End Get
        Set(ByVal value As String)
            _EntryDate = value
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


End Class

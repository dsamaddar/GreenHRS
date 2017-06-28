Imports Microsoft.VisualBasic

Public Class clsExternalTestType

    Dim _ExternalTestTypeID, _ExternalTest, _Details, _EntryBy As String

    Public Property ExternalTestTypeID() As String
        Get
            Return _ExternalTestTypeID
        End Get
        Set(ByVal value As String)
            _ExternalTestTypeID = value
        End Set
    End Property

    Public Property ExternalTest() As String
        Get
            Return _ExternalTest
        End Get
        Set(ByVal value As String)
            _ExternalTest = value
        End Set
    End Property

    Public Property Details() As String
        Get
            Return _Details
        End Get
        Set(ByVal value As String)
            _Details = value
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

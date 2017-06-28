Imports Microsoft.VisualBasic

Public Class clsTrainingType

    Dim _TrngTypeID, _TrngType, _EntryBy As String

    Public Property TrngTypeID() As String
        Get
            Return _TrngTypeID
        End Get
        Set(ByVal value As String)
            _TrngTypeID = value
        End Set
    End Property

    Public Property TrngType() As String
        Get
            Return _TrngType
        End Get
        Set(ByVal value As String)
            _TrngType = value
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

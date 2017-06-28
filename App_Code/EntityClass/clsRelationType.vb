Imports Microsoft.VisualBasic

Public Class clsRelationType

    Dim _RelationTypeID, _RelationType, _EntryBy As String

    Public Property RelationTypeID() As String
        Get
            Return _RelationTypeID
        End Get
        Set(ByVal value As String)
            _RelationTypeID = value
        End Set
    End Property

    Public Property RelationType() As String
        Get
            Return _RelationType
        End Get
        Set(ByVal value As String)
            _RelationType = value
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

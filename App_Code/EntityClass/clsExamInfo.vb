Imports Microsoft.VisualBasic

Public Class clsExamInfo
    Dim _DegreeNameID, _DegreeName, _EntryBy, _Order As String

    Public Property DegreeNameID() As String
        Get
            Return _DegreeNameID
        End Get
        Set(ByVal value As String)
            _DegreeNameID = value
        End Set
    End Property

    Public Property DegreeName() As String
        Get
            Return _DegreeName
        End Get
        Set(ByVal value As String)
            _DegreeName = value
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
    Public Property Order() As String
        Get
            Return _Order
        End Get
        Set(ByVal value As String)
            _Order = value
        End Set
    End Property
End Class

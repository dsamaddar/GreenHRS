Imports Microsoft.VisualBasic

Public Class clsIntGrade

    Dim _IntGradeID, _GradeName, _EntryBy As String

    Public Property IntGradeID() As String
        Get
            Return _IntGradeID
        End Get
        Set(ByVal value As String)
            _IntGradeID = value
        End Set
    End Property

    Public Property GradeName() As String
        Get
            Return _GradeName
        End Get
        Set(ByVal value As String)
            _GradeName = value
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

    Dim _GradePoint As Double

    Public Property GradePoint() As Double
        Get
            Return _GradePoint
        End Get
        Set(ByVal value As Double)
            _GradePoint = value
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

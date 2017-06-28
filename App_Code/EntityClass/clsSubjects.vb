Imports Microsoft.VisualBasic

Public Class clsSubjects

    Dim _SubjectID, _SubjectName, _SubjectCode, _EntryBy As String

    Public Property SubjectID() As String
        Get
            Return _SubjectID
        End Get
        Set(ByVal value As String)
            _SubjectID = value
        End Set
    End Property

    Public Property SubjectName() As String
        Get
            Return _SubjectName
        End Get
        Set(ByVal value As String)
            _SubjectName = value
        End Set
    End Property

    Public Property SubjectCode() As String
        Get
            Return _SubjectCode
        End Get
        Set(ByVal value As String)
            _SubjectCode = value
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

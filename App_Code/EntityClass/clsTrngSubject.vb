Imports Microsoft.VisualBasic

Public Class clsTrngSubject

    Dim _TrngSubjectID, _TrngSubName, _TrngSubDescription, _Objectives, _EntryBy As String

    Public Property TrngSubjectID() As String
        Get
            Return _TrngSubjectID
        End Get
        Set(ByVal value As String)
            _TrngSubjectID = value
        End Set
    End Property

    Public Property TrngSubName() As String
        Get
            Return _TrngSubName
        End Get
        Set(ByVal value As String)
            _TrngSubName = value
        End Set
    End Property

    Public Property TrngSubDescription() As String
        Get
            Return _TrngSubDescription
        End Get
        Set(ByVal value As String)
            _TrngSubDescription = value
        End Set
    End Property

    Public Property Objectives() As String
        Get
            Return _Objectives
        End Get
        Set(ByVal value As String)
            _Objectives = value
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

End Class

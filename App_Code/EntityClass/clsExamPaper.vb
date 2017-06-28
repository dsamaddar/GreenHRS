Imports Microsoft.VisualBasic

Public Class clsExamPaper

    Dim _ExamPaperID, _ExamWiseSubjectID, _QuestionID, _EntryBy As String

    Public Property ExamPaperID() As String
        Get
            Return _ExamPaperID
        End Get
        Set(ByVal value As String)
            _ExamPaperID = value
        End Set
    End Property

    Public Property ExamWiseSubjectID() As String
        Get
            Return _ExamWiseSubjectID
        End Get
        Set(ByVal value As String)
            _ExamWiseSubjectID = value
        End Set
    End Property

    Public Property QuestionID() As String
        Get
            Return _QuestionID
        End Get
        Set(ByVal value As String)
            _QuestionID = value
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

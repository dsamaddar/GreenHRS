Imports Microsoft.VisualBasic

Public Class clsIntManQuestion

    Dim _IntManQuestionID, _Question, _EntryBy As String

    Public Property IntManQuestionID() As String
        Get
            Return _IntManQuestionID
        End Get
        Set(ByVal value As String)
            _IntManQuestionID = value
        End Set
    End Property

    Public Property Question() As String
        Get
            Return _Question
        End Get
        Set(ByVal value As String)
            _Question = value
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

    Dim _QuestionOrder As Integer

    Public Property QuestionOrder() As Integer
        Get
            Return _QuestionOrder
        End Get
        Set(ByVal value As Integer)
            _QuestionOrder = value
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

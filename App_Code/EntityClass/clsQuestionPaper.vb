Imports Microsoft.VisualBasic

Public Class clsQuestionPaper

    Dim _ExamID, _QuestionPaperID, _ExamTakerID, _CircularID, _ExamPaperID, _ExamTakenStr, _ExamRollNo, _EntryPoint, _ULCBranchID, _PreparedBy, _Participant, _Status, _GivenAnswer, _GivenAnswerImage As String

    Public Property ExamID() As String
        Get
            Return _ExamID
        End Get
        Set(ByVal value As String)
            _ExamID = value
        End Set
    End Property

    Public Property QuestionPaperID() As String
        Get
            Return _QuestionPaperID
        End Get
        Set(ByVal value As String)
            _QuestionPaperID = value
        End Set
    End Property

    Public Property ExamTakerID() As String
        Get
            Return _ExamTakerID
        End Get
        Set(ByVal value As String)
            _ExamTakerID = value
        End Set
    End Property

    Public Property CircularID() As String
        Get
            Return _CircularID
        End Get
        Set(ByVal value As String)
            _CircularID = value
        End Set
    End Property

    Public Property ExamRollNo() As String
        Get
            Return _ExamRollNo
        End Get
        Set(ByVal value As String)
            _ExamRollNo = value
        End Set
    End Property

    Public Property ExamTakenStr() As String
        Get
            Return _ExamTakenStr
        End Get
        Set(ByVal value As String)
            _ExamTakenStr = value
        End Set
    End Property

    Public Property EntryPoint() As String
        Get
            Return _EntryPoint
        End Get
        Set(ByVal value As String)
            _EntryPoint = value
        End Set
    End Property

    Public Property ULCBranchID() As String
        Get
            Return _ULCBranchID
        End Get
        Set(ByVal value As String)
            _ULCBranchID = value
        End Set
    End Property

    Public Property PreparedBy() As String
        Get
            Return _PreparedBy
        End Get
        Set(ByVal value As String)
            _PreparedBy = value
        End Set
    End Property

    Public Property Participant() As String
        Get
            Return _Participant
        End Get
        Set(ByVal value As String)
            _Participant = value
        End Set
    End Property

    Public Property Status() As String
        Get
            Return _Status
        End Get
        Set(ByVal value As String)
            _Status = value
        End Set
    End Property

    Public Property GivenAnswer() As String
        Get
            Return _GivenAnswer
        End Get
        Set(ByVal value As String)
            _GivenAnswer = value
        End Set
    End Property

    Public Property GivenAnswerImage() As String
        Get
            Return _GivenAnswerImage
        End Get
        Set(ByVal value As String)
            _GivenAnswerImage = value
        End Set
    End Property

    Dim _StartTime, _EndTime, _PreparedDate, _EffectiveDate As DateTime

    Public Property StartTime() As DateTime
        Get
            Return _StartTime
        End Get
        Set(ByVal value As DateTime)
            _StartTime = value
        End Set
    End Property

    Public Property EndTime() As DateTime
        Get
            Return _EndTime
        End Get
        Set(ByVal value As DateTime)
            _EndTime = value
        End Set
    End Property

    Public Property PreparedDate() As DateTime
        Get
            Return _PreparedDate
        End Get
        Set(ByVal value As DateTime)
            _PreparedDate = value
        End Set
    End Property

    Public Property EffectiveDate() As DateTime
        Get
            Return _EffectiveDate
        End Get
        Set(ByVal value As DateTime)
            _EffectiveDate = value
        End Set
    End Property

    Dim _IsActive, _ExamTaken, _FinalizedExam, _TimeOuts As Boolean

    Public Property IsActive() As Boolean
        Get
            Return _IsActive
        End Get
        Set(ByVal value As Boolean)
            _IsActive = value
        End Set
    End Property

    Public Property ExamTaken() As Boolean
        Get
            Return _ExamTaken
        End Get
        Set(ByVal value As Boolean)
            _ExamTaken = value
        End Set
    End Property

    Public Property FinalizedExam() As Boolean
        Get
            Return _FinalizedExam
        End Get
        Set(ByVal value As Boolean)
            _FinalizedExam = value
        End Set
    End Property

    Public Property TimeOuts() As Boolean
        Get
            Return _TimeOuts
        End Get
        Set(ByVal value As Boolean)
            _TimeOuts = value
        End Set
    End Property

End Class

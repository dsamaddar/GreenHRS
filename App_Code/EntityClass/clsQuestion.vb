Imports Microsoft.VisualBasic

Public Class clsQuestion

    Dim _QuestionID, _SubjectID, _Question, _Images, _Answer_A, _Answer_A_Image, _Answer_B, _Answer_B_Image, _Answer_C, _Answer_C_Image, _Answer_D, _Answer_D_Image, _Answer_E, _Answer_E_Image, _DifficultyLevelStr As String

    Public Property QuestionID() As String
        Get
            Return _QuestionID
        End Get
        Set(ByVal value As String)
            _QuestionID = value
        End Set
    End Property

    Public Property SubjectID() As String
        Get
            Return _SubjectID
        End Get
        Set(ByVal value As String)
            _SubjectID = value
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

    Public Property Images() As String
        Get
            Return _Images
        End Get
        Set(ByVal value As String)
            _Images = value
        End Set
    End Property

    Public Property Answer_A() As String
        Get
            Return _Answer_A
        End Get
        Set(ByVal value As String)
            _Answer_A = value
        End Set
    End Property

    Public Property Answer_A_Image() As String
        Get
            Return _Answer_A_Image
        End Get
        Set(ByVal value As String)
            _Answer_A_Image = value
        End Set
    End Property

    Public Property Answer_B() As String
        Get
            Return _Answer_B
        End Get
        Set(ByVal value As String)
            _Answer_B = value
        End Set
    End Property

    Public Property Answer_B_Image() As String
        Get
            Return _Answer_B_Image
        End Get
        Set(ByVal value As String)
            _Answer_B_Image = value
        End Set
    End Property

    Public Property Answer_C() As String
        Get
            Return _Answer_C
        End Get
        Set(ByVal value As String)
            _Answer_C = value
        End Set
    End Property

    Public Property Answer_C_Image() As String
        Get
            Return _Answer_C_Image
        End Get
        Set(ByVal value As String)
            _Answer_C_Image = value
        End Set
    End Property

    Public Property Answer_D() As String
        Get
            Return _Answer_D
        End Get
        Set(ByVal value As String)
            _Answer_D = value
        End Set
    End Property

    Public Property Answer_D_Image() As String
        Get
            Return _Answer_D_Image
        End Get
        Set(ByVal value As String)
            _Answer_D_Image = value
        End Set
    End Property

    Public Property Answer_E() As String
        Get
            Return _Answer_E
        End Get
        Set(ByVal value As String)
            _Answer_E = value
        End Set
    End Property

    Public Property Answer_E_Image() As String
        Get
            Return _Answer_E_Image
        End Get
        Set(ByVal value As String)
            _Answer_E_Image = value
        End Set
    End Property

    Public Property DifficultyLevelStr() As String
        Get
            Return _DifficultyLevelStr
        End Get
        Set(ByVal value As String)
            _DifficultyLevelStr = value
        End Set
    End Property

    Dim _CorrectAnswre, _CorrectAnswre_Image, _AnswerExplanation, _EntryBy As String

    Public Property CorrectAnswre() As String
        Get
            Return _CorrectAnswre
        End Get
        Set(ByVal value As String)
            _CorrectAnswre = value
        End Set
    End Property

    Public Property CorrectAnswre_Image() As String
        Get
            Return _CorrectAnswre_Image
        End Get
        Set(ByVal value As String)
            _CorrectAnswre_Image = value
        End Set
    End Property

    Public Property AnswerExplanation() As String
        Get
            Return _AnswerExplanation
        End Get
        Set(ByVal value As String)
            _AnswerExplanation = value
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

    Dim _QuestionOrder, _DifficultyLevel, _OptA_Partial, _OptB_Partial, _OptC_Partial, _OptD_Partial, _OptE_Partial, _NoOfActiveQuestion, _NoOfInActiveQuestion As Integer

    Public Property QuestionOrder() As Integer
        Get
            Return _QuestionOrder
        End Get
        Set(ByVal value As Integer)
            _QuestionOrder = value
        End Set
    End Property

    Public Property DifficultyLevel() As Integer
        Get
            Return _DifficultyLevel
        End Get
        Set(ByVal value As Integer)
            _DifficultyLevel = value
        End Set
    End Property

    Public Property OptA_Partial() As Integer
        Get
            Return _OptA_Partial
        End Get
        Set(ByVal value As Integer)
            _OptA_Partial = value
        End Set
    End Property

    Public Property OptB_Partial() As Integer
        Get
            Return _OptB_Partial
        End Get
        Set(ByVal value As Integer)
            _OptB_Partial = value
        End Set
    End Property

    Public Property OptC_Partial() As Integer
        Get
            Return _OptC_Partial
        End Get
        Set(ByVal value As Integer)
            _OptC_Partial = value
        End Set
    End Property

    Public Property OptD_Partial() As Integer
        Get
            Return _OptD_Partial
        End Get
        Set(ByVal value As Integer)
            _OptD_Partial = value
        End Set
    End Property

    Public Property OptE_Partial() As Integer
        Get
            Return _OptE_Partial
        End Get
        Set(ByVal value As Integer)
            _OptE_Partial = value
        End Set
    End Property

    Public Property NoOfActiveQuestion() As Integer
        Get
            Return _NoOfActiveQuestion
        End Get
        Set(ByVal value As Integer)
            _NoOfActiveQuestion = value
        End Set
    End Property

    Public Property NoOfInActiveQuestion() As Integer
        Get
            Return _NoOfInActiveQuestion
        End Get
        Set(ByVal value As Integer)
            _NoOfInActiveQuestion = value
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

    Dim _HasPartialMarking As Boolean

    Public Property HasPartialMarking() As Boolean
        Get
            Return _HasPartialMarking
        End Get
        Set(ByVal value As Boolean)
            _HasPartialMarking = value
        End Set
    End Property

    Dim _IsQuestionImagesChanged, _IsAnswer_A_Image_Changed, _IsAnswer_B_Image_Changed, _IsAnswer_C_Image_Changed, _IsAnswer_D_Image_Changed, _
    _IsAnswer_E_Image_Changed, _IsCorrectAnswre_Image_Changed, _IsActive As Boolean

    Public Property IsQuestionImagesChanged() As Boolean
        Get
            Return _IsQuestionImagesChanged
        End Get
        Set(ByVal value As Boolean)
            _IsQuestionImagesChanged = value
        End Set
    End Property

    Public Property IsAnswer_A_Image_Changed() As Boolean
        Get
            Return _IsAnswer_A_Image_Changed
        End Get
        Set(ByVal value As Boolean)
            _IsAnswer_A_Image_Changed = value
        End Set
    End Property

    Public Property IsAnswer_B_Image_Changed() As Boolean
        Get
            Return _IsAnswer_B_Image_Changed
        End Get
        Set(ByVal value As Boolean)
            _IsAnswer_B_Image_Changed = value
        End Set
    End Property

    Public Property IsAnswer_C_Image_Changed() As Boolean
        Get
            Return _IsAnswer_C_Image_Changed
        End Get
        Set(ByVal value As Boolean)
            _IsAnswer_C_Image_Changed = value
        End Set
    End Property

    Public Property IsAnswer_D_Image_Changed() As Boolean
        Get
            Return _IsAnswer_D_Image_Changed
        End Get
        Set(ByVal value As Boolean)
            _IsAnswer_D_Image_Changed = value
        End Set
    End Property

    Public Property IsAnswer_E_Image_Changed() As Boolean
        Get
            Return _IsAnswer_E_Image_Changed
        End Get
        Set(ByVal value As Boolean)
            _IsAnswer_E_Image_Changed = value
        End Set
    End Property

    Public Property IsCorrectAnswre_Image_Changed() As Boolean
        Get
            Return _IsCorrectAnswre_Image_Changed
        End Get
        Set(ByVal value As Boolean)
            _IsCorrectAnswre_Image_Changed = value
        End Set
    End Property

    Public Property IsActive() As Boolean
        Get
            Return _IsActive
        End Get
        Set(ByVal value As Boolean)
            _IsActive = value
        End Set
    End Property

End Class

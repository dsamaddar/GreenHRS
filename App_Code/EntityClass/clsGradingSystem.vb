Imports Microsoft.VisualBasic

Public Class clsGradingSystem

    Dim _GradingSystemID, _LetterGrade, _GradingExplanation, _GradingType, _EntryBy, _GradingSystemData, _GradSysTypeID As String

    Public Property GradingSystemID() As String
        Get
            Return _GradingSystemID
        End Get
        Set(ByVal value As String)
            _GradingSystemID = value
        End Set
    End Property

    Public Property LetterGrade() As String
        Get
            Return _LetterGrade
        End Get
        Set(ByVal value As String)
            _LetterGrade = value
        End Set
    End Property

    Public Property GradingType() As String
        Get
            Return _GradingType
        End Get
        Set(ByVal value As String)
            _GradingType = value
        End Set
    End Property

    Public Property GradingExplanation() As String
        Get
            Return _GradingExplanation
        End Get
        Set(ByVal value As String)
            _GradingExplanation = value
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

    Public Property GradingSystemData() As String
        Get
            Return _GradingSystemData
        End Get
        Set(ByVal value As String)
            _GradingSystemData = value
        End Set
    End Property

    Public Property GradSysTypeID() As String
        Get
            Return _GradSysTypeID
        End Get
        Set(ByVal value As String)
            _GradSysTypeID = value
        End Set
    End Property

    Dim _FromPercentage, _ToPercentage, _GradePoint As Double

    Public Property FromPercentage() As Double
        Get
            Return _FromPercentage
        End Get
        Set(ByVal value As Double)
            _FromPercentage = value
        End Set
    End Property

    Public Property ToPercentage() As Double
        Get
            Return _ToPercentage
        End Get
        Set(ByVal value As Double)
            _ToPercentage = value
        End Set
    End Property

    Public Property GradePoint() As Double
        Get
            Return _GradePoint
        End Get
        Set(ByVal value As Double)
            _GradePoint = value
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

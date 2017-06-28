Imports Microsoft.VisualBasic

Public Class clsSummaryJobCircular

    Dim _TotalApplicant, _TotalRecruitment, _TotalExamTaker, _TotalRejectedCV, _RemainingCV, _TotalInterviewTaken As Integer

    Public Property TotalApplicant() As Integer
        Get
            Return _TotalApplicant
        End Get
        Set(ByVal value As Integer)
            _TotalApplicant = value
        End Set
    End Property

    Public Property TotalRecruitment() As Integer
        Get
            Return _TotalRecruitment
        End Get
        Set(ByVal value As Integer)
            _TotalRecruitment = value
        End Set
    End Property

    Public Property TotalExamTaker() As Integer
        Get
            Return _TotalExamTaker
        End Get
        Set(ByVal value As Integer)
            _TotalExamTaker = value
        End Set
    End Property

    Public Property TotalRejectedCV() As Integer
        Get
            Return _TotalRejectedCV
        End Get
        Set(ByVal value As Integer)
            _TotalRejectedCV = value
        End Set
    End Property

    Public Property RemainingCV() As Integer
        Get
            Return _RemainingCV
        End Get
        Set(ByVal value As Integer)
            _RemainingCV = value
        End Set
    End Property

    Public Property TotalInterviewTaken() As Integer
        Get
            Return _TotalInterviewTaken
        End Get
        Set(ByVal value As Integer)
            _TotalInterviewTaken = value
        End Set
    End Property

End Class

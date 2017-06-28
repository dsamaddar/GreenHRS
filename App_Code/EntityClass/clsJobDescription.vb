Imports Microsoft.VisualBasic

Public Class clsJobDescription
    Dim _JobDescriptionNo, _JobTitle, _JDGoal As String
    Dim _LastModifiedDate As DateTime

    Public Property JobDescriptionNo() As String
        Get
            Return _JobDescriptionNo
        End Get
        Set(ByVal value As String)
            _JobDescriptionNo = value
        End Set
    End Property

    Public Property JobTitle() As String
        Get
            Return _JobTitle
        End Get
        Set(ByVal value As String)
            _JobTitle = value
        End Set
    End Property

    Public Property JDGoal() As String
        Get
            Return _JDGoal
        End Get
        Set(ByVal value As String)
            _JDGoal = value
        End Set
    End Property
    Public Property LastModifiedDate() As DateTime
        Get
            Return _LastModifiedDate
        End Get
        Set(ByVal value As DateTime)
            _LastModifiedDate = value
        End Set
    End Property
End Class

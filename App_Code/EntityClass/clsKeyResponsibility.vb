Imports Microsoft.VisualBasic

Public Class clsKeyResponsibility
    Dim _KeyResTypeID, _KeyResponsibilityTypeName, _JobDetail As String

    Public Property KeyResTypeID() As String
        Get
            Return _KeyResTypeID
        End Get
        Set(ByVal value As String)
            _KeyResTypeID = value
        End Set
    End Property
    Public Property KeyResponsibilityTypeName() As String
        Get
            Return _KeyResponsibilityTypeName
        End Get
        Set(ByVal value As String)
            _KeyResponsibilityTypeName = value
        End Set
    End Property
    Public Property JobDetail() As String
        Get
            Return _JobDetail
        End Get
        Set(ByVal value As String)
            _JobDetail = value
        End Set
    End Property
End Class

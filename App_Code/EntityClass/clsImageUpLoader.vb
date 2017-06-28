Imports Microsoft.VisualBasic

Public Class clsImageUpLoader

    Dim _Successful As Integer

    Public Property Successful() As Integer
        Get
            Return _Successful
        End Get
        Set(ByVal value As Integer)
            _Successful = value
        End Set
    End Property

    Dim _ImageName As String

    Public Property ImageName() As String
        Get
            Return _ImageName
        End Get
        Set(ByVal value As String)
            _ImageName = value
        End Set
    End Property

End Class

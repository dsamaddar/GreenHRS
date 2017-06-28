Imports Microsoft.VisualBasic

Public Class clsDistrict

    Dim _DivisionID, _DistrictID As Integer

    Public Property DivisionID() As Integer
        Get
            Return _DivisionID
        End Get
        Set(ByVal value As Integer)
            _DivisionID = value
        End Set
    End Property

    Public Property DistrictID() As Integer
        Get
            Return _DistrictID
        End Get
        Set(ByVal value As Integer)
            _DistrictID = value
        End Set
    End Property


    Dim _DistrictName, _EntryUser As String

    Public Property DistrictName() As String
        Get
            Return _DistrictName
        End Get
        Set(ByVal value As String)
            _DistrictName = value
        End Set
    End Property

    Public Property EntryUser() As String
        Get
            Return _EntryUser
        End Get
        Set(ByVal value As String)
            _EntryUser = value
        End Set
    End Property

End Class

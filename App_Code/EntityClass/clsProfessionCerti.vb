Imports Microsoft.VisualBasic

Public Class clsProfessionCerti
    Dim _CertificationName, _InstituteName, _Location As String
    Dim _DateFrom, _DateTo As DateTime
    Dim _NeverExpire As Integer
    Public Property CertificationName() As String
        Get
            Return _CertificationName
        End Get
        Set(ByVal value As String)
            _CertificationName = value
        End Set
    End Property

    Public Property InstituteName() As String
        Get
            Return _InstituteName
        End Get
        Set(ByVal value As String)
            _InstituteName = value
        End Set
    End Property

    Public Property Location() As String
        Get
            Return _Location
        End Get
        Set(ByVal value As String)
            _Location = value
        End Set
    End Property
    Public Property DateFrom() As DateTime
        Get
            Return _DateFrom
        End Get
        Set(ByVal value As DateTime)
            _DateFrom = value
        End Set
    End Property
    Public Property DateTo() As DateTime
        Get
            Return _DateTo
        End Get
        Set(ByVal value As DateTime)
            _DateTo = value
        End Set
    End Property
    Public Property NeverExpire() As Boolean
        Get
            Return _NeverExpire
        End Get
        Set(ByVal value As Boolean)
            _NeverExpire = value
        End Set
    End Property
End Class

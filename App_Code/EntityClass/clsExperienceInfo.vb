Imports Microsoft.VisualBasic

Public Class clsExperienceInfo
    Dim _CompanyName, _OfficialDesig, _FuncDesig, _Department, _Responsibilities, _CompanyAddress, _CompanyConNo As String
    Dim _DateFrom, _DateTo As DateTime
    Dim _TillDate As Boolean

    Public Property CompanyAddress() As String
        Get
            Return _CompanyAddress
        End Get
        Set(ByVal value As String)
            _CompanyAddress = value
        End Set
    End Property
    Public Property CompanyConNo() As String
        Get
            Return _CompanyConNo
        End Get
        Set(ByVal value As String)
            _CompanyConNo = value
        End Set
    End Property
    Public Property CompanyName() As String
        Get
            Return _CompanyName
        End Get
        Set(ByVal value As String)
            _CompanyName = value
        End Set
    End Property

    Public Property OfficialDesig() As String
        Get
            Return _OfficialDesig
        End Get
        Set(ByVal value As String)
            _OfficialDesig = value
        End Set
    End Property
    Public Property FuncDesig() As String
        Get
            Return _FuncDesig
        End Get
        Set(ByVal value As String)
            _FuncDesig = value
        End Set
    End Property

    Public Property Department() As String
        Get
            Return _Department
        End Get
        Set(ByVal value As String)
            _Department = value
        End Set
    End Property
    Public Property Responsibilities() As String
        Get
            Return _Responsibilities
        End Get
        Set(ByVal value As String)
            _Responsibilities = value
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
    Public Property TillDate() As Boolean
        Get
            Return _TillDate
        End Get
        Set(ByVal value As Boolean)
            _TillDate = value
        End Set
    End Property
End Class

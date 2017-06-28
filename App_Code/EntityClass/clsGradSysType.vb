Imports Microsoft.VisualBasic

Public Class clsGradSysType

    Dim _GradSysTypeID, _GradSysType, _EntryBy As String

    Public Property GradSysTypeID() As String
        Get
            Return _GradSysTypeID
        End Get
        Set(ByVal value As String)
            _GradSysTypeID = value
        End Set
    End Property

    Public Property GradSysType() As String
        Get
            Return _GradSysType
        End Get
        Set(ByVal value As String)
            _GradSysType = value
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

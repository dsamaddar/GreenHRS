Imports Microsoft.VisualBasic

Public Class clsRoleWiseComponent

    Dim _RoleComponentID, _RoleName, _Components, _EntryBy As String

    Public Property RoleComponentID() As String
        Get
            Return _RoleComponentID
        End Get
        Set(ByVal value As String)
            _RoleComponentID = value
        End Set
    End Property

    Public Property RoleName() As String
        Get
            Return _RoleName
        End Get
        Set(ByVal value As String)
            _RoleName = value
        End Set
    End Property

    Public Property Components() As String
        Get
            Return _Components
        End Get
        Set(ByVal value As String)
            _Components = value
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

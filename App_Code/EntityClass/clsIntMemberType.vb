Imports Microsoft.VisualBasic

Public Class clsIntMemberType

    Dim _IntMemberTypeID, _MemberType, _EntryBy As String

    Public Property IntMemberTypeID() As String
        Get
            Return _IntMemberTypeID
        End Get
        Set(ByVal value As String)
            _IntMemberTypeID = value
        End Set
    End Property

    Public Property MemberType() As String
        Get
            Return _MemberType
        End Get
        Set(ByVal value As String)
            _MemberType = value
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

    Dim _IsActive As Boolean

    Public Property IsActive() As Boolean
        Get
            Return _IsActive
        End Get
        Set(ByVal value As Boolean)
            _IsActive = value
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

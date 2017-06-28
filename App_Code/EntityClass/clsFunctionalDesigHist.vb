Imports Microsoft.VisualBasic

Public Class clsFunctionalDesigHist
    Dim _FuncDesigHistID, _EmployeeID, _OldFuncDesigID, _NewFuncDesigID, _ApprovalAttachment, _IssuedBy, _Remarks As String

    Public Property FuncDesigHistID() As String
        Get
            Return _FuncDesigHistID
        End Get
        Set(ByVal value As String)
            _FuncDesigHistID = value
        End Set
    End Property

    Public Property Remarks() As String
        Get
            Return _Remarks
        End Get
        Set(ByVal value As String)
            _Remarks = value
        End Set
    End Property

    Public Property EmployeeID() As String
        Get
            Return _EmployeeID
        End Get
        Set(ByVal value As String)
            _EmployeeID = value
        End Set
    End Property

    Public Property OldFuncDesigID() As String
        Get
            Return _OldFuncDesigID
        End Get
        Set(ByVal value As String)
            _OldFuncDesigID = value
        End Set
    End Property

    Public Property NewFuncDesigID() As String
        Get
            Return _NewFuncDesigID
        End Get
        Set(ByVal value As String)
            _NewFuncDesigID = value
        End Set
    End Property

    Public Property ApprovalAttachment() As String
        Get
            Return _ApprovalAttachment
        End Get
        Set(ByVal value As String)
            _ApprovalAttachment = value
        End Set
    End Property

    Public Property IssuedBy() As String
        Get
            Return _IssuedBy
        End Get
        Set(ByVal value As String)
            _IssuedBy = value
        End Set
    End Property

    Dim _EffectiveDate, _UpdateDate, _IssuedDate As DateTime

    Public Property EffectiveDate() As DateTime
        Get
            Return _EffectiveDate
        End Get
        Set(ByVal value As DateTime)
            _EffectiveDate = value
        End Set
    End Property

    Public Property UpdateDate() As DateTime
        Get
            Return _UpdateDate
        End Get
        Set(ByVal value As DateTime)
            _UpdateDate = value
        End Set
    End Property

    Public Property IssuedDate() As DateTime
        Get
            Return _IssuedDate
        End Get
        Set(ByVal value As DateTime)
            _IssuedDate = value
        End Set
    End Property

    Dim _IsSystemUpdated As Boolean

    Public Property IsSystemUpdated() As Boolean
        Get
            Return _IsSystemUpdated
        End Get
        Set(ByVal value As Boolean)
            _IsSystemUpdated = value
        End Set
    End Property

End Class

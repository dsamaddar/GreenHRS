Imports Microsoft.VisualBasic

Public Class clsPromotionHistory

    Dim _PromoHistID, _EmployeeID, _OldDesignation, _NewDesignation, _ApprovalAttachment, _IssuedBy, _EvaluationSummary As String

    Public Property PromoHistID() As String
        Get
            Return _PromoHistID
        End Get
        Set(ByVal value As String)
            _PromoHistID = value
        End Set
    End Property

    Public Property EvaluationSummary() As String
        Get
            Return _EvaluationSummary
        End Get
        Set(ByVal value As String)
            _EvaluationSummary = value
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

    Public Property OldDesignation() As String
        Get
            Return _OldDesignation
        End Get
        Set(ByVal value As String)
            _OldDesignation = value
        End Set
    End Property

    Public Property NewDesignation() As String
        Get
            Return _NewDesignation
        End Get
        Set(ByVal value As String)
            _NewDesignation = value
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

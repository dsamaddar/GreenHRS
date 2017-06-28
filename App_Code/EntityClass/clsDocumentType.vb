Imports Microsoft.VisualBasic

Public Class clsDocumentType

    Dim _DocTypeID, _DocTypeFor, _DocumentType, _DocumentCategory, _PerformanceCriteria, _EntryBy As String

    Public Property DocTypeID() As String
        Get
            Return _DocTypeID
        End Get
        Set(ByVal value As String)
            _DocTypeID = value
        End Set
    End Property

    Public Property DocTypeFor() As String
        Get
            Return _DocTypeFor
        End Get
        Set(ByVal value As String)
            _DocTypeFor = value
        End Set
    End Property

    Public Property DocumentType() As String
        Get
            Return _DocumentType
        End Get
        Set(ByVal value As String)
            _DocumentType = value
        End Set
    End Property

    Public Property DocumentCategory() As String
        Get
            Return _DocumentCategory
        End Get
        Set(ByVal value As String)
            _DocumentCategory = value
        End Set
    End Property

    Public Property PerformanceCriteria() As String
        Get
            Return _PerformanceCriteria
        End Get
        Set(ByVal value As String)
            _PerformanceCriteria = value
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

    Dim _IsMandatory, _IsActive, _IsPerformanceFactor As Boolean

    Public Property IsMandatory() As Boolean
        Get
            Return _IsMandatory
        End Get
        Set(ByVal value As Boolean)
            _IsMandatory = value
        End Set
    End Property

    Public Property IsActive() As Boolean
        Get
            Return _IsActive
        End Get
        Set(ByVal value As Boolean)
            _IsActive = value
        End Set
    End Property

    Public Property IsPerformanceFactor() As Boolean
        Get
            Return _IsPerformanceFactor
        End Get
        Set(ByVal value As Boolean)
            _IsPerformanceFactor = value
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

Imports Microsoft.VisualBasic

Public Class clsDocumentList

    Dim _DocListID, _DocTypeID, _UniqueUserID, _DocumentName, _FileName, _Remarks, _UploadedBy As String

    Public Property DocListID() As String
        Get
            Return _DocListID
        End Get
        Set(ByVal value As String)
            _DocListID = value
        End Set
    End Property

    Public Property DocTypeID() As String
        Get
            Return _DocTypeID
        End Get
        Set(ByVal value As String)
            _DocTypeID = value
        End Set
    End Property

    Public Property UniqueUserID() As String
        Get
            Return _UniqueUserID
        End Get
        Set(ByVal value As String)
            _UniqueUserID = value
        End Set
    End Property

    Public Property DocumentName() As String
        Get
            Return _DocumentName
        End Get
        Set(ByVal value As String)
            _DocumentName = value
        End Set
    End Property

    Public Property FileName() As String
        Get
            Return _FileName
        End Get
        Set(ByVal value As String)
            _FileName = value
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

    Public Property UploadedBy() As String
        Get
            Return _UploadedBy
        End Get
        Set(ByVal value As String)
            _UploadedBy = value
        End Set
    End Property

    Dim _EntryDate, _IssueDate, _EffectiveDate As DateTime

    Public Property EntryDate() As DateTime
        Get
            Return _EntryDate
        End Get
        Set(ByVal value As DateTime)
            _EntryDate = value
        End Set
    End Property

    Public Property IssueDate() As DateTime
        Get
            Return _IssueDate
        End Get
        Set(ByVal value As DateTime)
            _IssueDate = value
        End Set
    End Property

    Public Property EffectiveDate() As DateTime
        Get
            Return _EffectiveDate
        End Get
        Set(ByVal value As DateTime)
            _EffectiveDate = value
        End Set
    End Property

End Class

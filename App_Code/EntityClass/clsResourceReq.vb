Imports Microsoft.VisualBasic

Public Class clsResourceReq

    Dim _ResourceReqID, _ULCBranchID, _RecruitmentTypeID, _Remarks, _SubmittedBy, _EntryBy, _ProvidedBy, _ProviderRemarks, _ProvidedStatus, _ApproverID As String

    Public Property ResourceReqID() As String
        Get
            Return _ResourceReqID
        End Get
        Set(ByVal value As String)
            _ResourceReqID = value
        End Set
    End Property

    Public Property ULCBranchID() As String
        Get
            Return _ULCBranchID
        End Get
        Set(ByVal value As String)
            _ULCBranchID = value
        End Set
    End Property

    Public Property RecruitmentTypeID() As String
        Get
            Return _RecruitmentTypeID
        End Get
        Set(ByVal value As String)
            _RecruitmentTypeID = value
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

    Public Property SubmittedBy() As String
        Get
            Return _SubmittedBy
        End Get
        Set(ByVal value As String)
            _SubmittedBy = value
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

    Public Property ProvidedBy() As String
        Get
            Return _ProvidedBy
        End Get
        Set(ByVal value As String)
            _ProvidedBy = value
        End Set
    End Property

    Public Property ProviderRemarks() As String
        Get
            Return _ProviderRemarks
        End Get
        Set(ByVal value As String)
            _ProviderRemarks = value
        End Set
    End Property

    Public Property ProvidedStatus() As String
        Get
            Return _ProvidedStatus
        End Get
        Set(ByVal value As String)
            _ProvidedStatus = value
        End Set
    End Property

    Public Property ApproverID() As String
        Get
            Return _ApproverID
        End Get
        Set(ByVal value As String)
            _ApproverID = value
        End Set
    End Property

    Dim _ReqNoOfResource, _ProvidedNoOfResource As Integer

    Public Property ReqNoOfResource() As Integer
        Get
            Return _ReqNoOfResource
        End Get
        Set(ByVal value As Integer)
            _ReqNoOfResource = value
        End Set
    End Property

    Public Property ProvidedNoOfResource() As Integer
        Get
            Return _ProvidedNoOfResource
        End Get
        Set(ByVal value As Integer)
            _ProvidedNoOfResource = value
        End Set
    End Property

    Dim _IsReqProvided As Boolean

    Public Property IsReqProvided() As Boolean
        Get
            Return _IsReqProvided
        End Get
        Set(ByVal value As Boolean)
            _IsReqProvided = value
        End Set
    End Property

    Dim _EntryDate, _ProvidedOn, _ApprovalDate As DateTime

    Public Property EntryDate() As DateTime
        Get
            Return _EntryDate
        End Get
        Set(ByVal value As DateTime)
            _EntryDate = value
        End Set
    End Property

    Public Property ProvidedOn() As DateTime
        Get
            Return _ProvidedOn
        End Get
        Set(ByVal value As DateTime)
            _ProvidedOn = value
        End Set
    End Property

    Public Property ApprovalDate() As DateTime
        Get
            Return _ApprovalDate
        End Get
        Set(ByVal value As DateTime)
            _ApprovalDate = value
        End Set
    End Property

End Class

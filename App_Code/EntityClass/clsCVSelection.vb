Imports Microsoft.VisualBasic

Public Class clsCVSelection

    Dim _CandidateName, _InstitutionID, _Gender, _CircularID, _Religion, _SpecializedID, _MajorTypeID, _RejectionRemarks As String

    Public Property CandidateName() As String
        Get
            Return _CandidateName
        End Get
        Set(ByVal value As String)
            _CandidateName = value
        End Set
    End Property

    Public Property InstitutionID() As String
        Get
            Return _InstitutionID
        End Get
        Set(ByVal value As String)
            _InstitutionID = value
        End Set
    End Property

    Public Property Gender() As String
        Get
            Return _Gender
        End Get
        Set(ByVal value As String)
            _Gender = value
        End Set
    End Property

    Public Property CircularID() As String
        Get
            Return _CircularID
        End Get
        Set(ByVal value As String)
            _CircularID = value
        End Set
    End Property

    Public Property Religion() As String
        Get
            Return _Religion
        End Get
        Set(ByVal value As String)
            _Religion = value
        End Set
    End Property

    Public Property SpecializedID() As String
        Get
            Return _SpecializedID
        End Get
        Set(ByVal value As String)
            _SpecializedID = value
        End Set
    End Property

    Public Property MajorTypeID() As String
        Get
            Return _MajorTypeID
        End Get
        Set(ByVal value As String)
            _MajorTypeID = value
        End Set
    End Property

    Public Property RejectionRemarks() As String
        Get
            Return _RejectionRemarks
        End Get
        Set(ByVal value As String)
            _RejectionRemarks = value
        End Set
    End Property

    Dim _PresentDistrictID, _PermanentDistrictID, _AgeFrom, _AgeTo, _YearOfExperience As Integer

    Public Property PresentDistrictID() As Integer
        Get
            Return _PresentDistrictID
        End Get
        Set(ByVal value As Integer)
            _PresentDistrictID = value
        End Set
    End Property

    Public Property PermanentDistrictID() As Integer
        Get
            Return _PermanentDistrictID
        End Get
        Set(ByVal value As Integer)
            _PermanentDistrictID = value
        End Set
    End Property

    Public Property AgeFrom() As Integer
        Get
            Return _AgeFrom
        End Get
        Set(ByVal value As Integer)
            _AgeFrom = value
        End Set
    End Property

    Public Property AgeTo() As Integer
        Get
            Return _AgeTo
        End Get
        Set(ByVal value As Integer)
            _AgeTo = value
        End Set
    End Property

    Public Property YearOfExperience() As String
        Get
            Return _YearOfExperience
        End Get
        Set(ByVal value As String)
            _YearOfExperience = value
        End Set
    End Property

End Class

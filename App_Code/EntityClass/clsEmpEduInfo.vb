﻿Imports Microsoft.VisualBasic

Public Class clsEmpEduInfo
    Dim _DegreeType, _ExamName, _Major, _MajorID, _ExamID, _InstitutionID, _InstitutionName, _ResultType, _Result, _OtherInstitutionName As String
    Dim _PassingYear As Integer
    Dim _OutOf As Decimal

    Public Property DegreeType() As String
        Get
            Return _DegreeType
        End Get
        Set(ByVal value As String)
            _DegreeType = value
        End Set
    End Property
    Public Property ExamName() As String
        Get
            Return _ExamName
        End Get
        Set(ByVal value As String)
            _ExamName = value
        End Set
    End Property

    Public Property Major() As String
        Get
            Return _Major
        End Get
        Set(ByVal value As String)
            _Major = value
        End Set
    End Property
    Public Property MajorID() As String
        Get
            Return _MajorID
        End Get
        Set(ByVal value As String)
            _MajorID = value
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
    Public Property InstitutionName() As String
        Get
            Return _InstitutionName
        End Get
        Set(ByVal value As String)
            _InstitutionName = value
        End Set
    End Property

    Public Property ResultType() As String
        Get
            Return _ResultType
        End Get
        Set(ByVal value As String)
            _ResultType = value
        End Set
    End Property

    Public Property Result() As String
        Get
            Return _Result
        End Get
        Set(ByVal value As String)
            _Result = value
        End Set
    End Property
    Public Property OtherInstitutionName() As String
        Get
            Return _OtherInstitutionName
        End Get
        Set(ByVal value As String)
            _OtherInstitutionName = value
        End Set
    End Property
    Public Property PassingYear() As Integer
        Get
            Return _PassingYear
        End Get
        Set(ByVal value As Integer)
            _PassingYear = value
        End Set
    End Property
    Public Property ExamID() As String
        Get
            Return _ExamID
        End Get
        Set(ByVal value As String)
            _ExamID = value
        End Set
    End Property
    Public Property OutOf() As Decimal
        Get
            Return _OutOf
        End Get
        Set(ByVal value As Decimal)
            _OutOf = value
        End Set
    End Property

End Class

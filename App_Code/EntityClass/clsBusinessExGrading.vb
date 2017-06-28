Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsBusinessExGrading

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    Dim _BusinessExGradID, _EmpCode, _EmployeeID, _FinalGrade, _EntryBy As String

    Public Property BusinessExGradID() As String
        Get
            Return _BusinessExGradID
        End Get
        Set(ByVal value As String)
            _BusinessExGradID = value
        End Set
    End Property

    Public Property EmpCode() As String
        Get
            Return _EmpCode
        End Get
        Set(ByVal value As String)
            _EmpCode = value
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

    Public Property FinalGrade() As String
        Get
            Return _FinalGrade
        End Get
        Set(ByVal value As String)
            _FinalGrade = value
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

    Dim _EvaluationYear As Integer

    Public Property EvaluationYear() As Integer
        Get
            Return _EvaluationYear
        End Get
        Set(ByVal value As Integer)
            _EvaluationYear = value
        End Set
    End Property

    Dim _longTerm, _LongTermBusiness, _CreditSales, _DistributorFinance, _Overdue, _Classification As Double

    Public Property longTerm() As Double
        Get
            Return _longTerm
        End Get
        Set(ByVal value As Double)
            _longTerm = value
        End Set
    End Property

    Public Property LongTermBusiness() As Double
        Get
            Return _LongTermBusiness
        End Get
        Set(ByVal value As Double)
            _LongTermBusiness = value
        End Set
    End Property

    Public Property CreditSales() As Double
        Get
            Return _CreditSales
        End Get
        Set(ByVal value As Double)
            _CreditSales = value
        End Set
    End Property

    Public Property DistributorFinance() As Double
        Get
            Return _DistributorFinance
        End Get
        Set(ByVal value As Double)
            _DistributorFinance = value
        End Set
    End Property

    Public Property Overdue() As Double
        Get
            Return _Overdue
        End Get
        Set(ByVal value As Double)
            _Overdue = value
        End Set
    End Property

    Public Property Classification() As Double
        Get
            Return _Classification
        End Get
        Set(ByVal value As Double)
            _Classification = value
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

#Region " Insert Business Executive Grading "

    Public Function fnInsertBusinessExGrading(ByVal BusinessExGrad As clsBusinessExGrading) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertBusinessExGrading", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmpCode", BusinessExGrad.EmpCode)
            cmd.Parameters.AddWithValue("@EvaluationYear", BusinessExGrad.EvaluationYear)
            cmd.Parameters.AddWithValue("@longTerm", BusinessExGrad.longTerm)
            cmd.Parameters.AddWithValue("@LongTermBusiness", BusinessExGrad.LongTermBusiness)
            cmd.Parameters.AddWithValue("@CreditSales", BusinessExGrad.CreditSales)
            cmd.Parameters.AddWithValue("@DistributorFinance", BusinessExGrad.DistributorFinance)
            cmd.Parameters.AddWithValue("@Overdue", BusinessExGrad.Overdue)
            cmd.Parameters.AddWithValue("@Classification", BusinessExGrad.Classification)
            cmd.Parameters.AddWithValue("@FinalGrade", BusinessExGrad.FinalGrade)
            cmd.Parameters.AddWithValue("@EntryBy", BusinessExGrad.EntryBy)
            cmd.ExecuteNonQuery()
            con.Close()
            Return 1
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function
#End Region

#Region " Get Business Ex Grading By Emp "

    Public Function fnGetBusinessExGradingByEmp(ByVal BusinessExGrad As clsBusinessExGrading) As DataSet

        Dim sp As String = "spGetBusinessExGradingByEmp"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", BusinessExGrad.EmployeeID)
                cmd.Parameters.AddWithValue("@EvaluationYear", BusinessExGrad.EvaluationYear)
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()
                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

End Class

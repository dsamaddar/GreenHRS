Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class clsTaxRateDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Tax Rate "
    Public Function fnInsertTaxRate(ByVal TaxRate As clsTaxRate) As clsResult

        Dim result As New clsResult()
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertTaxRate", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@Value", TaxRate.Value)
            cmd.Parameters.AddWithValue("@Gender", TaxRate.Gender)
            cmd.Parameters.AddWithValue("@Rate", TaxRate.Rate)
            cmd.Parameters.AddWithValue("@RateOrder", TaxRate.RateOrder)
            cmd.Parameters.AddWithValue("@AgeLimit", TaxRate.AgeLimit)
            cmd.Parameters.AddWithValue("@TaxText", TaxRate.TaxText)
            cmd.Parameters.AddWithValue("@TaxYear", TaxRate.TaxYear)
            cmd.Parameters.AddWithValue("@EntryBy", TaxRate.EntryBy)
            cmd.ExecuteNonQuery()
            con.Close()
            result.Success = True
            result.Message = "Inserted Successfully."
            Return result
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If

            result.Success = True
            result.Message = ex.Message

            Return result
        End Try
    End Function
#End Region

#Region " Update Tax Slab "
    Public Function fnUpdateTaxSlab(ByVal TaxRate As clsTaxRate) As clsResult

        Dim result As New clsResult()

        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateTaxSlab", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@SLNo", TaxRate.SLNo)
            cmd.Parameters.AddWithValue("@Value", TaxRate.Value)
            cmd.Parameters.AddWithValue("@Gender", TaxRate.Gender)
            cmd.Parameters.AddWithValue("@Rate", TaxRate.Rate)
            cmd.Parameters.AddWithValue("@RateOrder", TaxRate.RateOrder)
            cmd.Parameters.AddWithValue("@AgeLimit", TaxRate.AgeLimit)
            cmd.Parameters.AddWithValue("@TaxText", TaxRate.TaxText)
            cmd.Parameters.AddWithValue("@TaxYear", TaxRate.TaxYear)
            cmd.Parameters.AddWithValue("@EntryBy", TaxRate.EntryBy)
            cmd.ExecuteNonQuery()
            con.Close()
            result.Success = True
            result.Message = "Updated Successfully."
            Return result
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            result.Success = True
            result.Message = ex.Message

            Return result
        End Try
    End Function
#End Region

#Region " Get Details Tax Slab Info "

    Public Function fnGetDetailsTaxSlabInfo() As DataSet
        Dim sp As String = "spGetDetailsTaxSlabInfo"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
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

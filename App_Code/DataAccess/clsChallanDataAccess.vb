Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsChallanDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Challan No "

    Public Function fnInsertChallanNo(ByVal Challan As clsChallan) As clsResult
        Dim Result As New clsResult()
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertChallanNo", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ChallanNo", Challan.ChallanNo)
            cmd.Parameters.AddWithValue("@TDSAmount", Challan.TDSAmount)
            cmd.Parameters.AddWithValue("@ChallanDate", Challan.ChallanDate)
            cmd.Parameters.AddWithValue("@TaxYear", Challan.TaxYear)
            cmd.Parameters.AddWithValue("@EntryBy", Challan.EntryBy)
            cmd.ExecuteNonQuery()
            con.Close()
            Result.Success = True
            Result.Message = "Inserted Successfully."
            Return Result
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Result.Success = False
            Result.Message = "Error Found" & ex.Message
            Return Result
        End Try
    End Function

#End Region

#Region " Update Challan No "

    Public Function fnUpdateChallanNo(ByVal Challan As clsChallan) As clsResult
        Dim Result As New clsResult()
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateChallanNo", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ChallanID", Challan.ChallanID)
            cmd.Parameters.AddWithValue("@ChallanNo", Challan.ChallanNo)
            cmd.Parameters.AddWithValue("@TDSAmount", Challan.TDSAmount)
            cmd.Parameters.AddWithValue("@ChallanDate", Challan.ChallanDate)
            cmd.Parameters.AddWithValue("@TaxYear", Challan.TaxYear)
            cmd.Parameters.AddWithValue("@EntryBy", Challan.EntryBy)
            cmd.ExecuteNonQuery()
            con.Close()
            Result.Success = True
            Result.Message = "Updated Successfully."
            Return Result
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Result.Success = False
            Result.Message = "Error Found" & ex.Message
            Return Result
        End Try
    End Function

#End Region

#Region " Get All Challan Info "

    Public Function fnGetAllChallanInfo() As DataSet
        Dim sp As String = "spGetAllChallanInfo"
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

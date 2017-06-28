Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsFuelPriceDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Fuel Price "
    Public Function fnInsertFuelPrice(ByVal FuelPrice As clsFuelPrice) As clsResult
        Dim result As New clsResult()
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertFuelPrice", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@PricePerLtr", FuelPrice.PricePerLtr)
            cmd.Parameters.AddWithValue("@EffectiveDate", FuelPrice.EffectiveDate)
            cmd.Parameters.AddWithValue("@EntryBy", FuelPrice.EntryBy)
            cmd.ExecuteNonQuery()
            con.Close()
            result.Message = "Inserted Successfully."
            result.Success = True
            Return result
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If

            result.Message = ex.Message
            result.Success = False

            Return result
        End Try
    End Function

#End Region

#Region " Update Fuel Price "
    Public Function fnUpdateFuelPrice(ByVal FuelPrice As clsFuelPrice) As clsResult
        Dim result As New clsResult()
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateFuelPrice", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@FuelPriceID", FuelPrice.FuelPriceID)
            cmd.Parameters.AddWithValue("@PricePerLtr", FuelPrice.PricePerLtr)
            cmd.Parameters.AddWithValue("@EffectiveDate", FuelPrice.EffectiveDate)
            cmd.Parameters.AddWithValue("@EntryBy", FuelPrice.EntryBy)
            cmd.ExecuteNonQuery()
            con.Close()
            result.Message = "Updated Successfully."
            result.Success = True
            Return result
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If

            result.Message = ex.Message
            result.Success = False

            Return result
        End Try
    End Function

#End Region

#Region " Get Fuel Price List "

    Public Function fnGetFuelPriceList() As DataSet

        Dim sp As String = "spGetFuelPriceList"
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

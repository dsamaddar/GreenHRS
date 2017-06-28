Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsResReqRoleControlDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Update Res Req Role Control "

    Public Function fnUpdateResReqRoleControl(ByVal ResReqCtrl As clsResReqRoleControl) As clsResult
        Dim Result As New clsResult()
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateResReqRoleControl", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", ResReqCtrl.EmployeeID)
            cmd.Parameters.AddWithValue("@ResReqControlIDList", ResReqCtrl.ResReqControlIDList)
            cmd.Parameters.AddWithValue("@EntryBy", ResReqCtrl.EntryBy)
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

#Region " Get Res Req Ctrl By ID For Emp "

    Public Function fnGetResReqCtrlByIDForEmp(ByVal ResReqCtrl As clsResReqRoleControl) As clsResReqRoleControl
        Dim sp As String = "spGetResReqCtrlByIDForEmp"
        Dim dr As SqlDataReader
        Try
            con.Open()

            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@RecruitmentTypeID", ResReqCtrl.RecruitmentTypeID)
                cmd.Parameters.AddWithValue("@EmployeeID", ResReqCtrl.EmployeeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    ResReqCtrl.RecruitmentTypeID = dr.Item("RecruitmentTypeID")
                    ResReqCtrl.CanRequest = dr.Item("CanRequest")
                    ResReqCtrl.CanApprove = dr.Item("CanApprove")
                End While
                con.Close()

                Return ResReqCtrl
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

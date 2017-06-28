Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsResignationMailDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Get Mail Address By Emp ID "

    Public Function fnGetMailAddressByEmpID(ByVal EmployeeID As String) As clsResignationMail

        Dim sp As String = "spGetMailAddressByEmpID"

        Dim ResignationMail As New clsResignationMail()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                Dim dr As SqlDataReader = cmd.ExecuteReader()
                While dr.Read()
                    ResignationMail.EmployeeName = dr.Item("EmployeeName")
                    ResignationMail.EmpMailAdr = dr.Item("EmpMailAdr")
                    ResignationMail.SupervisorMailAdr = dr.Item("SupervisorMailAdr")
                End While
                con.Close()
                Return ResignationMail

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

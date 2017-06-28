Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System
Imports System.Collections
Imports System.Linq
Imports System.Xml.Linq
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Script.Services

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
 <ScriptService()> _
Public Class WebService
    Inherits System.Web.Services.WebService

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    <WebMethod()> _
    Public Function HelloWorld() As String
        Return "Hello World"
    End Function

    <WebMethod()> _
     Public Function fnGetBranchNameAjax(ByVal BankID As String) As DataSet

        Dim sp As String = "spGetBranchName"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@BankID", BankID)
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

    <WebMethod()> _
    Public Function PopulateUpazillaName(ByVal DistrictID As Integer) As ArrayList
        Dim sp As String = "spGetUpazillaName"
        Dim list As ArrayList = New ArrayList
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@DistrictID", DistrictID)
                Dim dr As SqlDataReader = cmd.ExecuteReader()
                While dr.Read()
                    list.Add(New ListItem(dr("UpazilaName").ToString, dr("UpazilaID").ToString))
                End While
                con.Close()

                Return list
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

    <WebMethod()> _
    Public Function PopulateBankBranchName(ByVal BankID As String) As ArrayList

        Dim sp As String = "spGetBranchName"
        Dim list As ArrayList = New ArrayList
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@BankID", BankID)
                Dim dr As SqlDataReader = cmd.ExecuteReader()
                While dr.Read()
                    list.Add(New ListItem(dr("BranchName").ToString, dr("BranchID").ToString))
                End While
                con.Close()

                Return list
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

    <WebMethod()> _
    Public Function fnReportHRServicesIssue(ByVal HRServiceID As String, ByVal EmployeeID As String, ByVal ServiceStatus As String, ByVal IsServiceProvided As String) As List(Of clsHRServiceRequest)

        Dim sp As String = "spReportHRServicesIssue"
        Dim lst As New List(Of clsHRServiceRequest)
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@HRServiceID", HRServiceID)
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                cmd.Parameters.AddWithValue("@ServiceStatus", ServiceStatus)
                cmd.Parameters.AddWithValue("@IsServiceProvided", IsServiceProvided)
                Dim dr As SqlDataReader = cmd.ExecuteReader()
                While dr.Read()
                    Dim ServIssue As New clsHRServiceRequest()

                    ServIssue.HRService = dr.Item("HRService")
                    ServIssue.EmployeeName = dr.Item("EmployeeName")
                    ServIssue.EffectiveDate = dr.Item("EffectiveDate")
                    ServIssue.Remarks = dr.Item("Remarks")
                    ServIssue.IsServiceProvidedEX = dr.Item("IsServiceProvided")
                    ServIssue.ServiceProvider = dr.Item("ServiceProvider")
                    ServIssue.ServiceProviderRemarks = dr.Item("ServiceProviderRemarks")
                    ServIssue.ServingDate = dr.Item("ServingDate")
                    ServIssue.IsRejectedEX = dr.Item("IsRejected")
                    ServIssue.RejectedBy = dr.Item("RejectedBy")
                    ServIssue.RejectionRemarks = dr.Item("RejectionRemarks")
                    ServIssue.RejectionDate = dr.Item("RejectionDate")
                    ServIssue.ServiceStatus = dr.Item("ServiceStatus")
                    lst.Add(ServIssue)

                End While
                con.Close()
                Return lst
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function


End Class

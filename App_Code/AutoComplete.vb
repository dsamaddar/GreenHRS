Imports System
Imports System.Collections
Imports System.Linq
Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Xml.Linq
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class AutoComplete
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function HelloWorld() As String
        Return "Hello World"
    End Function

    'Dim cn As New SqlClient.SqlConnection()
    Dim ds As New DataSet
    Dim dt As New DataTable

    <WebMethod()> _
    Public Function GetGradeLetterList(ByVal prefixText As String, ByVal count As Integer) As String()

        'ADO.Net
        Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Dim cmd As New SqlClient.SqlCommand
        cmd.Connection = con
        cmd.CommandType = CommandType.Text

        cmd.CommandText = "select * From tblGradingSystem Where LetterGrade like @myParameter"
        cmd.Parameters.AddWithValue("@myParameter", "%" + prefixText + "%")

        Try
            con.Open()
            cmd.ExecuteNonQuery()
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(ds)
        Catch ex As Exception
        Finally
            con.Close()
        End Try

        dt = ds.Tables(0)

        'Then return List of string(txtItems) as result

        Dim txtItems As New List(Of String)
        Dim dbValues As String

        For Each row As DataRow In dt.Rows

            ''String From DataBase(dbValues)
            dbValues = row("LetterGrade").ToString()
            'dbValues = dbValues.ToLower()
            txtItems.Add(dbValues)

        Next

        Return txtItems.ToArray()

    End Function

    Dim cn As New SqlClient.SqlConnection()

    <WebMethod()> _
 Public Function GetCompletionList(ByVal prefixText As String, ByVal count As Integer) As String()

        'ADO.Net
        Dim strCn As String = "data source=192.168.1.166;Initial Catalog=HRM;Integrated Security=True"
        cn.ConnectionString = strCn
        Dim cmd As New SqlClient.SqlCommand
        cmd.Connection = cn
        cmd.CommandType = CommandType.Text
        'Compare String From Textbox(prefixText) AND String From Column in DataBase(CompanyName)
        'If String from DataBase is equal to String from TextBox(prefixText) then add it to return ItemList
        '-----I Defined a parameter instead of passing value directly to prevent sql injection--------'
        cmd.CommandText = "select * From tblGradingSystem Where LetterGrade like @myParameter"
        cmd.Parameters.AddWithValue("@myParameter", "%" + prefixText + "%")

        Try
            cn.Open()
            cmd.ExecuteNonQuery()
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(ds)
        Catch ex As Exception
        Finally
            cn.Close()
        End Try

        dt = ds.Tables(0)

        'Then return List of string(txtItems) as result
        Dim txtItems As New List(Of String)
        Dim dbValues As String

        For Each row As DataRow In dt.Rows
            ''String From DataBase(dbValues)
            dbValues = row("LetterGrade").ToString()
            ' dbValues = dbValues.ToLower()
            txtItems.Add(dbValues)
        Next

        Return txtItems.ToArray()

    End Function




End Class

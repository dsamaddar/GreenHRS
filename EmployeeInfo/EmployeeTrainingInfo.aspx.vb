Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.OleDb
Imports System.Data.Common
Imports System.IO
Imports System.Math
Imports System.Configuration
Imports System.Web.UI
Partial Class EmployeeInfo_EmployeeTrainingInfo
    Inherits System.Web.UI.Page
    Dim TrainingInformation As New clsEmployeeAllInfoDataAccess()


    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click

        Dim EmployeeID As String
        EmployeeID = Session("EmployeeID")

        If EmployeeID = "" Or EmployeeID = "Nothing" Then
            grdTraining.DataSource = ""
            grdTraining.DataBind()
            Exit Sub
        End If


        Dim CandidateTrainInfo As String = ""
        Dim isoTrainingParts As String = ""

        Dim dtTrainingInfo As DataTable = New DataTable()
        dtTrainingInfo = Session("EmployeeTrainingInfo")

        Dim TraInfo As New ClsTrainingInfo()
        For Each rw As DataRow In dtTrainingInfo.Rows
            TraInfo.TrainingName = rw.Item("TrainingName")
            TraInfo.InstituteName = rw.Item("InstituteName")
            TraInfo.Country = rw.Item("CountryID")
            TraInfo.TrainingYear = rw.Item("TrainingYear")
            TraInfo.DateFrom = rw.Item("DateFrom")
            TraInfo.DateTo = rw.Item("DateTo")

            isoTrainingParts = isoTrainingParts & TraInfo.TrainingName & "~" & TraInfo.InstituteName & "~" & TraInfo.Country & "~" & TraInfo.TrainingYear & "~" & TraInfo.DateFrom & "~" & TraInfo.DateTo & "~|"
        Next

        Dim Check As Integer = clsEmployeeAllInfoDataAccess.SubmitTrainingInformation(EmployeeID, isoTrainingParts)
        If Check = 1 Then
            MessageBox("Inserted Successfully")
            Response.Redirect("EmployeeTrainingInfo.aspx")
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Function FormatTrainingInfo() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("TrainingName", System.Type.GetType("System.String"))
        dt.Columns.Add("InstituteName", System.Type.GetType("System.String"))
        dt.Columns.Add("CountryID", System.Type.GetType("System.String"))
        dt.Columns.Add("Country", System.Type.GetType("System.String"))
        dt.Columns.Add("TrainingYear", System.Type.GetType("System.Double"))
        dt.Columns.Add("DateFrom", System.Type.GetType("System.DateTime"))
        dt.Columns.Add("DateTo", System.Type.GetType("System.DateTime"))
        Return dt
    End Function

    Protected Sub btnTrainingAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTrainingAdd.Click
        Try
            If ddlCountry.SelectedValue = "-Select-" Then
                MessageBox("Select Country Name")
                Exit Sub
            End If

            If ddlTrainingYear.SelectedValue = "YYYY" Then
                MessageBox("Select Training Year")
                Exit Sub
            End If


            Dim TrainingInfo As New ClsTrainingInfo()

            TrainingInfo.TrainingName = txtTrainingName.Text
            TrainingInfo.InstituteName = txtInstitutionName.Text
            TrainingInfo.CountryID = ddlCountry.SelectedValue
            TrainingInfo.Country = ddlCountry.SelectedItem.ToString()
            TrainingInfo.TrainingYear = Convert.ToInt16(ddlTrainingYear.SelectedValue)
            TrainingInfo.DateFrom = dtDateFrom.Text
            TrainingInfo.DateTo = dtDateTo.Text

            Dim dt As DataTable = GetTrainingData(TrainingInfo)
            Session("EmployeeTrainingInfo") = dt

            grdTraining.DataSource = dt
            grdTraining.DataBind()
            ClearTrainingData()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub
    Protected Function GetTrainingData(ByVal TrainingInfo As ClsTrainingInfo) As DataTable

        Dim dtTrainingInfo = Session("EmployeeTrainingInfo")

        'If (CheckDuplicateEducationEntry() = 0) Then
        '    Return dtTrainingInfo
        'End If
        Dim dr As DataRow
        dr = dtTrainingInfo.NewRow()
        dr("TrainingName") = TrainingInfo.TrainingName
        dr("InstituteName") = TrainingInfo.InstituteName
        dr("CountryID") = TrainingInfo.CountryID
        dr("Country") = TrainingInfo.Country
        dr("TrainingYear") = TrainingInfo.TrainingYear
        dr("DateFrom") = String.Format("{0:dd MMM yyyy}", TrainingInfo.DateFrom)
        dr("DateTo") = String.Format("{0:dd MMM yyyy}", TrainingInfo.DateTo)

        dtTrainingInfo.Rows.Add(dr)
        dtTrainingInfo.AcceptChanges()
        btnSave.Enabled = True
        Return dtTrainingInfo

    End Function
    Protected Sub ClearTrainingData()
        txtTrainingName.Text = ""
        txtInstitutionName.Text = ""
        ddlCountry.SelectedIndex = -1
        ddlTrainingYear.SelectedIndex = -1
        dtDateFrom.Text = ""
        dtDateTo.Text = ""
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            Dim lblMessage As String
            lblMessage = Request.QueryString("Message")
            If lblMessage <> "" Then
                lblRedirectMsg.Text = lblMessage
            End If

            btnSave.Enabled = False
            Dim EmployeeID As String
            EmployeeID = Session("EmployeeID")

            Dim EmpCount As Integer = Common.EmployeeBasicCount(EmployeeID)

            If EmpCount = 0 Then
                Dim msg As String = "Please Insert Basic Information First"
                Response.Redirect("EmployeeBasicInfo.aspx?Message=" + msg)
            End If


            Dim EmpEduCount As Integer = Common.EmployeeEduCount(EmployeeID)

            If EmpEduCount = 0 Then
                Dim msg As String = "Please Insert Education Information"
                Response.Redirect("EmployeeEducationInfo.aspx?Message=" + msg)
            End If


            Dim dtTrainingInfo As DataTable = New DataTable()
            dtTrainingInfo = FormatTrainingInfo()
            Session("EmployeeTrainingInfo") = dtTrainingInfo

            If EmployeeID = "" Or EmployeeID = "Nothing" Then
                Exit Sub
            End If

            dtTrainingInfo = TrainingInformation.fnGetTrainingInformation(EmployeeID).Tables(0)
            grdTraining.DataSource = dtTrainingInfo
            grdTraining.DataBind()
            Session("EmployeeTrainingInfo") = dtTrainingInfo
        End If
    End Sub

    Protected Sub grdTraining_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdTraining.RowDeleting
        btnSave.Enabled = True
        Dim i As Integer
        Dim dtTrainingInfo As DataTable = New DataTable()

        dtTrainingInfo = Session("EmployeeTrainingInfo")

        i = e.RowIndex

        dtTrainingInfo.Rows(i).Delete()
        dtTrainingInfo.AcceptChanges()
        grdTraining.DataSource = dtTrainingInfo
        grdTraining.DataBind()
        If dtTrainingInfo.Rows.Count = 0 Then
            btnSave.Enabled = False
        End If
    End Sub
End Class

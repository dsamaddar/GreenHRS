Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.OleDb
Imports System.Data.Common
Imports System.IO
Imports System.Math
Imports System.Configuration
Imports System.Web.UI
Partial Class EmployeeInfo_EmployeeExperienceInfo
    Inherits System.Web.UI.Page
    Dim ExperienceInformation As New clsEmployeeAllInfoDataAccess()


    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click

        Dim EmployeeID As String
        EmployeeID = Session("EmployeeID")

        If EmployeeID = "" Or EmployeeID = "Nothing" Then
            grdExperience.DataSource = ""
            grdExperience.DataBind()
            Exit Sub
        End If

        Dim ExperienceExperiInfo As String = ""
        Dim isoExperienceParts As String = ""

        Dim dtExperienceInfo As DataTable = New DataTable()
        dtExperienceInfo = Session("EmployeeExperienceInfo")

        Dim ExperiInfo As New clsEmpExpInfo()
        For Each rw As DataRow In dtExperienceInfo.Rows
            ExperiInfo.CompanyName = rw.Item("CompanyName")
            ExperiInfo.PositionHeld = rw.Item("PositionHeld")
            ExperiInfo.Department = rw.Item("Department")
            ExperiInfo.Responsibilities = rw.Item("Responsibilities")
            ExperiInfo.DateFrom = rw.Item("DateFrom")
            'ExperiInfo.DateTo = rw.Item("DateTo")
            If rw.Item("DateTo") = "" Then
                ExperiInfo.DateTo = "1911-01-01"
            Else
                ExperiInfo.DateTo = rw.Item("DateTo")
            End If

            If rw.Item("TillDate") = "Till Date" Then
                ExperiInfo.TillDate = True
            Else
                ExperiInfo.TillDate = False
            End If

            isoExperienceParts = isoExperienceParts & ExperiInfo.CompanyName & "~" & ExperiInfo.PositionHeld & "~" & ExperiInfo.Department & "~" & ExperiInfo.Responsibilities & "~" & ExperiInfo.DateFrom & "~" & ExperiInfo.DateTo & "~" & ExperiInfo.TillDate & "~|"
        Next

        Dim Check As Integer = clsEmployeeAllInfoDataAccess.SubmitExperienceInformation(EmployeeID, isoExperienceParts)
        If Check = 1 Then
            MessageBox("Inserted Successfully")
            Response.Redirect("EmployeeExperienceInfo.aspx")
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

    Protected Sub btnExperience_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExperience.Click
        Try

            Dim EmpExpInfo As New clsEmpExpInfo()

            EmpExpInfo.CompanyName = txtCompanyName.Text
            EmpExpInfo.PositionHeld = txtPositionName.Text
            'CandidateExperienceInfo.DepartmentID = ddlDepartment.SelectedValue
            EmpExpInfo.Department = txtDepartment.Text
            EmpExpInfo.Responsibilities = txtResponsibilities.Text
            EmpExpInfo.DateFrom = Convert.ToDateTime(dtDateFm.Text)
            'EmpExpInfo.DateTo = Convert.ToDateTime(dtDatTo.Text)

            EmpExpInfo.TillDate = chkTillDate.Checked

            If chkTillDate.Checked = True Then
                EmpExpInfo.DateTo = "1911-01-01"
            Else
                EmpExpInfo.DateTo = dtDatTo.Text
            End If

            Dim dt As DataTable = GetExperienceData(EmpExpInfo)
            Session("EmployeeExperienceInfo") = dt

            grdExperience.DataSource = dt
            grdExperience.DataBind()
            ClearExperienceData()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub
    Protected Function GetExperienceData(ByVal EmpExpInfo As clsEmpExpInfo) As DataTable

        Dim dtExperienceInfo = Session("EmployeeExperienceInfo")

        Dim dr As DataRow
        dr = dtExperienceInfo.NewRow()
        dr("CompanyName") = EmpExpInfo.CompanyName
        dr("PositionHeld") = EmpExpInfo.PositionHeld
        dr("Department") = EmpExpInfo.Department
        dr("Responsibilities") = EmpExpInfo.Responsibilities
        dr("DateFrom") = String.Format("{0:dd MMM yyyy}", EmpExpInfo.DateFrom)
        'dr("DateTo") = String.Format("{0:dd MMM yyyy}", EmpExpInfo.DateTo)
        If EmpExpInfo.TillDate = True Then
            dr("DateTo") = ""
        Else
            dr("DateTo") = String.Format("{0:dd MMM yyyy}", EmpExpInfo.DateTo)
        End If

        If EmpExpInfo.TillDate = True Then
            dr("TillDate") = "Till Date"
        Else
            dr("TillDate") = ""
        End If

        dtExperienceInfo.Rows.Add(dr)
        dtExperienceInfo.AcceptChanges()
        btnSave.Enabled = True
        Return dtExperienceInfo

    End Function
    Protected Sub ClearExperienceData()
        txtCompanyName.Text = ""
        txtPositionName.Text = ""
        txtDepartment.Text = ""
        txtResponsibilities.Text = ""
        dtDateFm.Text = ""
        dtDatTo.Text = ""
        chkTillDate.Checked = False
        dtDatTo.Visible = True
    End Sub

    Protected Function FormatExperienceInfo() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("CompanyName", System.Type.GetType("System.String"))
        dt.Columns.Add("PositionHeld", System.Type.GetType("System.String"))
        dt.Columns.Add("Department", System.Type.GetType("System.String"))
        dt.Columns.Add("Responsibilities", System.Type.GetType("System.String"))
        dt.Columns.Add("DateFrom", System.Type.GetType("System.DateTime"))
        dt.Columns.Add("DateTo", System.Type.GetType("System.DateTime"))
        dt.Columns.Add("TillDate", GetType(Boolean))
        Return dt
    End Function

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


            Dim dtExperienceInfo As DataTable = New DataTable()
            dtExperienceInfo = FormatExperienceInfo()
            Session("EmployeeExperienceInfo") = dtExperienceInfo

            If EmployeeID = "" Or EmployeeID = "Nothing" Then
                Exit Sub
            End If

            dtExperienceInfo = ExperienceInformation.fnGetExperienceInformation(EmployeeID).Tables(0)
            grdExperience.DataSource = dtExperienceInfo
            grdExperience.DataBind()
            Session("EmployeeExperienceInfo") = dtExperienceInfo

        End If
    End Sub

    Protected Sub grdExperience_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdExperience.RowDeleting
        btnSave.Enabled = True
        Dim i As Integer
        Dim dtExperienceInfo As DataTable = New DataTable()

        dtExperienceInfo = Session("EmployeeExperienceInfo")

        i = e.RowIndex

        dtExperienceInfo.Rows(i).Delete()
        dtExperienceInfo.AcceptChanges()
        grdExperience.DataSource = dtExperienceInfo
        grdExperience.DataBind()
        If dtExperienceInfo.Rows.Count = 0 Then
            btnSave.Enabled = False
        End If
    End Sub
    Protected Sub chkTillDate_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkTillDate.CheckedChanged
        If chkTillDate.Checked = True Then
            dtDatTo.Visible = False
            dtDatTo_ReqFieldValidator.Visible = False
        Else
            dtDatTo.Visible = True
            dtDatTo_ReqFieldValidator.Visible = True
        End If
    End Sub
End Class

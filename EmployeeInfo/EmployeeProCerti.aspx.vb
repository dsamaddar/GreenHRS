Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.OleDb
Imports System.Data.Common
Imports System.IO
Imports System.Math
Imports System.Configuration
Imports System.Web.UI
Partial Class EmployeeInfo_EmployeeProCerti
    Inherits System.Web.UI.Page
    Dim ProExpInformation As New clsEmployeeAllInfoDataAccess()

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

            btnSubmit.Enabled = False
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


            Dim dtProfessionalCertificationInfo As DataTable = New DataTable()
            dtProfessionalCertificationInfo = FormatProfessionalCertificationInfo()
            Session("EmployeeProfessionalCertificationInfo") = dtProfessionalCertificationInfo

            If EmployeeID = "" Or EmployeeID = "Nothing" Then
                Exit Sub
            End If

            dtProfessionalCertificationInfo = ProExpInformation.fnGetProCertificationInformation(EmployeeID).Tables(0)
            grdCertification.DataSource = dtProfessionalCertificationInfo
            grdCertification.DataBind()
            Session("EmployeeProfessionalCertificationInfo") = dtProfessionalCertificationInfo
        End If
    End Sub
    Protected Function FormatProfessionalCertificationInfo() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("CertificationName", System.Type.GetType("System.String"))
        dt.Columns.Add("InstituteName", System.Type.GetType("System.String"))
        dt.Columns.Add("Location", System.Type.GetType("System.String"))
        dt.Columns.Add("DateFrom", System.Type.GetType("System.DateTime"))
        dt.Columns.Add("DateTo", System.Type.GetType("System.DateTime"))
        dt.Columns.Add("NeverExpire", GetType(Boolean))
        Return dt
    End Function
    Protected Sub btnAddCerti_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddCerti.Click
        Try
            Dim ProfessionCerti As New clsEmpProCerti()

            ProfessionCerti.CertificationName = txtCertificationName.Text
            ProfessionCerti.InstituteName = txtInstitutionName.Text
            ProfessionCerti.Location = txtLocation.Text
            ProfessionCerti.DateFrom = dtDateFrom.Text
            'ProfessionCerti.DateTo = dtDateTo.Text
            ProfessionCerti.NeverExpire = chkNeverExpire.Checked

            If chkNeverExpire.Checked = True Then
                ProfessionCerti.DateTo = "1911-01-01"
            Else
                ProfessionCerti.DateTo = dtDateTo.Text

            End If

            Dim dt As DataTable = GetProfessionalCertificationData(ProfessionCerti)
            Session("EmployeeProfessionalCertificationInfo") = dt

            grdCertification.DataSource = dt
            grdCertification.DataBind()
            ClearProfessionalCertificationData()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub
    Protected Function GetProfessionalCertificationData(ByVal ProfessionCerti As clsEmpProCerti) As DataTable

        Dim dtProfessionalCertificationInfo = Session("EmployeeProfessionalCertificationInfo")

        Dim dr As DataRow
        dr = dtProfessionalCertificationInfo.NewRow()
        dr("CertificationName") = ProfessionCerti.CertificationName
        dr("InstituteName") = ProfessionCerti.InstituteName
        dr("Location") = ProfessionCerti.Location
        'dr("DateFrom") = String.Format("{0:dd MMM yyyy}", ProfessionCerti.DateFrom)
        'dr("DateTo") = String.Format("{0:dd MMM yyyy}", ProfessionCerti.DateTo)
        dr("IssuingDate") = String.Format("{0:dd MMM yyyy}", ProfessionCerti.DateFrom)

        If ProfessionCerti.NeverExpire = True Then
            dr("ExpireDate") = ""
        Else
            dr("ExpireDate") = String.Format("{0:dd MMM yyyy}", ProfessionCerti.DateTo)
        End If

        If ProfessionCerti.NeverExpire = True Then
            dr("NeverExpire") = "Never Expire"
        Else
            dr("NeverExpire") = ""
        End If


        dtProfessionalCertificationInfo.Rows.Add(dr)
        dtProfessionalCertificationInfo.AcceptChanges()
        btnSubmit.Enabled = True
        Return dtProfessionalCertificationInfo

    End Function
    Protected Sub ClearProfessionalCertificationData()
        txtCertificationName.Text = ""
        txtInstitutionName.Text = ""
        txtLocation.Text = ""
        dtDateFrom.Text = ""
        dtDateTo.Text = ""
        chkNeverExpire.Checked = False
        dtDateTo.Visible = True
    End Sub
    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click


        Dim EmployeeID As String
        EmployeeID = Session("EmployeeID")

        If EmployeeID = "" Or EmployeeID = "Nothing" Then
            grdCertification.DataSource = ""
            grdCertification.DataBind()
            Exit Sub
        End If


        Dim CandidateProfessionalCertificationInfo As String = ""
        Dim isoProfessionalCertificationParts As String = ""

        Dim dtProfessionalCertificationInfo As DataTable = New DataTable()
        dtProfessionalCertificationInfo = Session("EmployeeProfessionalCertificationInfo")

        Dim ProInfo As New clsEmpProCerti()
        For Each rw As DataRow In dtProfessionalCertificationInfo.Rows
            ProInfo.CertificationName = rw.Item("CertificationName")
            ProInfo.InstituteName = rw.Item("InstituteName")
            ProInfo.Location = rw.Item("Location")
            'ProInfo.DateFrom = rw.Item("DateFrom")
            'ProInfo.DateTo = rw.Item("DateTo")

            ProInfo.DateFrom = rw.Item("IssuingDate")

            If rw.Item("ExpireDate") = "" Then
                ProInfo.DateTo = "1911-01-01"
            Else
                ProInfo.DateTo = rw.Item("ExpireDate")
            End If

            If rw.Item("NeverExpire") = "Never Expire" Then
                ProInfo.NeverExpire = True
            Else
                ProInfo.NeverExpire = False
            End If

            isoProfessionalCertificationParts = isoProfessionalCertificationParts & ProInfo.CertificationName & "~" & ProInfo.InstituteName & "~" & ProInfo.Location & "~" & ProInfo.DateFrom & "~" & ProInfo.DateTo & "~" & ProInfo.NeverExpire & "~|"
        Next

        Dim Check As Integer = ProExpInformation.SubmitOtherInformation(EmployeeID, isoProfessionalCertificationParts)
        If Check = 1 Then
            MessageBox("Inserted Successfully")
            Response.Redirect("EmployeeProCerti.aspx")
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub grdCertification_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdCertification.RowDeleting
        btnSubmit.Enabled = True
        Dim i As Integer
        Dim dtProfessionalCertificationInfo As DataTable = New DataTable()

        dtProfessionalCertificationInfo = Session("EmployeeProfessionalCertificationInfo")

        i = e.RowIndex

        dtProfessionalCertificationInfo.Rows(i).Delete()
        dtProfessionalCertificationInfo.AcceptChanges()
        grdCertification.DataSource = dtProfessionalCertificationInfo
        grdCertification.DataBind()
        If dtProfessionalCertificationInfo.Rows.Count = 0 Then
            btnSubmit.Enabled = False
        End If
    End Sub
    Protected Sub chkNeverExpire_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkNeverExpire.CheckedChanged

        If chkNeverExpire.Checked = True Then
            dtDateTo.Visible = False
            RequiredFieldValidator2.Enabled = False
        Else
            dtDateTo.Visible = True
            RequiredFieldValidator2.Enabled = True
        End If


    End Sub
End Class

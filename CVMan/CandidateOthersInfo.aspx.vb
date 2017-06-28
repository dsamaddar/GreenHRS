Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.OleDb
Imports System.Data.Common
Imports System.IO
Imports System.Math
Imports System.Configuration
Imports System.Web.UI
Partial Class CandidateOthersInfo
    Inherits System.Web.UI.Page
    Dim EducationInformation As New clsCanEduDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            btnSubmit.Enabled = False
            Dim Message As String = ""
            Dim msg As String = ""
            Dim CandidateID As String
            CandidateID = Session("CandidateID")

            Dim UserID As String
            Dim UserName As String
            UserID = Session("LoginUserID")
            UserName = Session("UserName")


            Dim CanCount As Integer = Common.CandidateCount(UserID)

            If CanCount = 0 Then
                msg = "Please Insert Basic Information First"
                Response.Redirect("HRMCandidateBasicInfo.aspx?Message=" + msg)
            End If


            Dim CanEduCount As Integer = Common.CandidateEducationCount(CandidateID)

            If CanEduCount = 0 Then
                msg = "Please Insert Education Information First"
                Response.Redirect("CandidateEducationInfo.aspx?Message=" + msg)
            End If


            Dim YearOfExp As Double

            Dim YrExp As Double = EducationInformation.CandidateExperirnce(CandidateID, YearOfExp)

            If YrExp <> 0 Then
                Dim CanExpCount As Integer = Common.CandidateExperienceCount(CandidateID)

                If CanExpCount = 0 Then
                    msg = "Please Insert Experience Information as Your Year of Experience is " + YrExp.ToString()
                    Response.Redirect("CandidateExperienceInfo.aspx?Message=" + msg)
                End If
            End If



            Dim dtProfessionalCertificationInfo As DataTable = New DataTable()
            dtProfessionalCertificationInfo = FormatProfessionalCertificationInfo()
            Session("CandidateProfessionalCertificationInfo") = dtProfessionalCertificationInfo


            Dim count As Integer = Common.CandidateCount(UserID)

            If count = 0 Then
                Exit Sub
            Else

                dtProfessionalCertificationInfo = EducationInformation.fnGetProCertificationInformation(CandidateID).Tables(0)
                grdCertification.DataSource = dtProfessionalCertificationInfo
                grdCertification.DataBind()
                Session("CandidateProfessionalCertificationInfo") = dtProfessionalCertificationInfo
            End If
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
            Dim Checkdate As Boolean
            If drpDay.SelectedValue = "DD" Or drpMonth.SelectedValue = "MM" Or drpYear.SelectedValue = "YYYY" Then
                MessageBox("Select Issuing Date Parameter Correctly.")
                Exit Sub
            End If

            If chkNeverExpire.Checked = False Then
                If drpDayTo.SelectedValue = "DD" Or drpMonthTo.SelectedValue = "MM" Or drpYearTo.SelectedValue = "YYYY" Then
                    MessageBox("Select Expire Date Parameter Correctly.")
                    Exit Sub
                End If

            End If


            Dim CandidateProfessionCerti As New clsProfessionCerti()

            CandidateProfessionCerti.CertificationName = txtCertificationName.Text
            CandidateProfessionCerti.InstituteName = txtInstitutionName.Text
            CandidateProfessionCerti.Location = txtLocation.Text
            'CandidateProfessionCerti.DateFrom = dtDateFrom.Text
            Checkdate = IsDate(drpMonth.SelectedValue + "/" + drpDay.SelectedValue + "/" + drpYear.SelectedValue)
            If Checkdate = False Then
                MessageBox("Please Enter a Valid ISSUING DATE")
                Exit Sub
            End If
            CandidateProfessionCerti.DateFrom = drpMonth.SelectedValue + "/" + drpDay.SelectedValue + "/" + drpYear.SelectedValue

            CandidateProfessionCerti.NeverExpire = chkNeverExpire.Checked

            If chkNeverExpire.Checked = True Then
                CandidateProfessionCerti.DateTo = "1911-01-01"
            Else
                'CandidateProfessionCerti.DateTo = dtDateTo.Text
                Checkdate = IsDate(drpMonthTo.SelectedValue + "/" + drpDayTo.SelectedValue + "/" + drpYearTo.SelectedValue)
                If Checkdate = False Then
                    MessageBox("Please Enter a Valid EXPIRE DATE")
                    Exit Sub
                End If
                CandidateProfessionCerti.DateTo = drpMonthTo.SelectedValue + "/" + drpDayTo.SelectedValue + "/" + drpYearTo.SelectedValue
            End If

            Dim dt As DataTable = GetProfessionalCertificationData(CandidateProfessionCerti)
            Session("CandidateProfessionalCertificationInfo") = dt

            grdCertification.DataSource = dt
            grdCertification.DataBind()
            ClearProfessionalCertificationData()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub
    Protected Function GetProfessionalCertificationData(ByVal CandidateProfessionCerti As clsProfessionCerti) As DataTable

        Dim dtProfessionalCertificationInfo = Session("CandidateProfessionalCertificationInfo")

        Dim dr As DataRow
        dr = dtProfessionalCertificationInfo.NewRow()
        dr("CertificationName") = CandidateProfessionCerti.CertificationName
        dr("InstituteName") = CandidateProfessionCerti.InstituteName
        dr("Location") = CandidateProfessionCerti.Location
        dr("IssuingDate") = String.Format("{0:dd MMM yyyy}", CandidateProfessionCerti.DateFrom)

        If CandidateProfessionCerti.NeverExpire = True Then
            dr("ExpireDate") = ""
        Else
            dr("ExpireDate") = String.Format("{0:dd MMM yyyy}", CandidateProfessionCerti.DateTo)
        End If

        If CandidateProfessionCerti.NeverExpire = True Then
            dr("NeverExpire") = "Never Expire"
        Else
            dr("NeverExpire") = ""
        End If

        ' dr("NeverExpire") = CandidateProfessionCerti.NeverExpire

        dtProfessionalCertificationInfo.Rows.Add(dr)
        dtProfessionalCertificationInfo.AcceptChanges()
        btnSubmit.Enabled = True
        Return dtProfessionalCertificationInfo

    End Function
    Protected Sub ClearProfessionalCertificationData()
        txtCertificationName.Text = ""
        txtInstitutionName.Text = ""
        txtLocation.Text = ""
        drpDay.SelectedIndex = -1
        drpMonth.SelectedIndex = -1
        drpYear.SelectedIndex = -1
        drpDayTo.SelectedIndex = -1
        drpMonthTo.SelectedIndex = -1
        drpYearTo.SelectedIndex = -1
        chkNeverExpire.Checked = False
        drpMonthTo.Visible = True
        drpDayTo.Visible = True
        drpYearTo.Visible = True
    End Sub
    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click


        Dim UserID As String
        UserID = Session("LoginUserID")

        Dim CandidateProfessionalCertificationInfo As String = ""
        Dim isoProfessionalCertificationParts As String = ""

        Dim dtProfessionalCertificationInfo As DataTable = New DataTable()
        dtProfessionalCertificationInfo = Session("CandidateProfessionalCertificationInfo")

        Dim ProInfo As New clsProfessionCerti()
        For Each rw As DataRow In dtProfessionalCertificationInfo.Rows
            ProInfo.CertificationName = rw.Item("CertificationName")
            ProInfo.InstituteName = rw.Item("InstituteName")
            ProInfo.Location = rw.Item("Location")
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
            'ProInfo.NeverExpire = rw.Item("NeverExpire")

            isoProfessionalCertificationParts = isoProfessionalCertificationParts & ProInfo.CertificationName & "~" & ProInfo.InstituteName & "~" & ProInfo.Location & "~" & ProInfo.DateFrom & "~" & ProInfo.DateTo & "~" & ProInfo.NeverExpire & "~|"
        Next

        Dim count As Integer = clsCanEduDataAccess.CandidateCount(UserID)
        If count = 0 Then
            MessageBox("Insert Basic Information first")
            grdCertification.DataSource = ""
            grdCertification.DataBind()
            Exit Sub
        End If

        Dim Check As Integer = clsCanEduDataAccess.SubmitOtherInformation(UserID, isoProfessionalCertificationParts)
        If Check = 1 Then
            MessageBox("Inserted Successfully")
            Response.Redirect("CandidateOthersInfo.aspx")
            btnSubmit.Enabled = False
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub grdCertification_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdCertification.RowDeleting
        btnSubmit.Enabled = True
        Dim i As Integer
        Dim dtProfessionalCertificationInfo As DataTable = New DataTable()

        dtProfessionalCertificationInfo = Session("CandidateProfessionalCertificationInfo")

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
            'dtDateTo.Visible = False
            'RequiredFieldValidator2.Enabled = False
            drpMonthTo.Visible = False
            drpDayTo.Visible = False
            drpYearTo.Visible = False
        Else
            'dtDateTo.Visible = True
            'RequiredFieldValidator2.Enabled = True
            drpMonthTo.Visible = True
            drpDayTo.Visible = True
            drpYearTo.Visible = True
        End If


    End Sub
    Protected Sub btnNextPage_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNextPage.Click
        Response.Redirect("CandidateReferenceInfo.aspx")
    End Sub
End Class

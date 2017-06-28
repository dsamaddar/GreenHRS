Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.OleDb
Imports System.Data.Common
Imports System.IO
Imports System.Math
Imports System.Configuration
Imports System.Web.UI
Partial Class CandidateExperienceInfo
    Inherits System.Web.UI.Page
    Dim EducationInformation As New clsCanEduDataAccess()


    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click

        Dim UserID As String
        UserID = Session("LoginUserID")

        Dim CandidateID = Session("CandidateID")

        Dim RegistrationID As String
        RegistrationID = Session("RegistrationID")

        Dim CandidateExperiInfo As String = ""
        Dim isoExperienceParts As String = ""

        Dim dtExperienceInfo As DataTable = New DataTable()
        dtExperienceInfo = Session("CandidateExperienceInfo")

        Dim ExperiInfo As New clsExperienceInfo()

        Try

            For Each rw As DataRow In dtExperienceInfo.Rows
                ExperiInfo.CompanyName = rw.Item("CompanyName")
                ExperiInfo.OfficialDesig = rw.Item("OfficialDesig")
                ExperiInfo.FuncDesig = rw.Item("FuncDesig")
                ExperiInfo.Department = rw.Item("Department")
                ExperiInfo.Responsibilities = rw.Item("Responsibilities")
                ExperiInfo.CompanyAddress = rw.Item("CompanyAddress")
                ExperiInfo.CompanyConNo = rw.Item("CompanyConNo")
                ExperiInfo.DateFrom = rw.Item("DateFrom")
                'ExperiInfo.DateTo = rw.Item("DateTo")
                If rw.Item("DateTo") = "" Then
                    ExperiInfo.DateTo = "1911-01-01"
                Else
                    ExperiInfo.DateTo = rw.Item("DateTo")
                End If

                If rw.Item("TillDate") = "Till Now" Then
                    ExperiInfo.TillDate = True
                Else
                    ExperiInfo.TillDate = False
                End If

                isoExperienceParts = isoExperienceParts & ExperiInfo.CompanyName & "~" & ExperiInfo.OfficialDesig & "~" & ExperiInfo.FuncDesig & "~" & ExperiInfo.Department & "~" & ExperiInfo.Responsibilities & "~" & ExperiInfo.CompanyAddress & "~" & ExperiInfo.CompanyConNo & "~" & ExperiInfo.DateFrom & "~" & ExperiInfo.DateTo & "~" & ExperiInfo.TillDate & "~|"
            Next

            Dim count As Integer = clsCanEduDataAccess.CandidateCount(RegistrationID)
            If count = 0 Then
                MessageBox("Insert Basic Information first")
                grdExperience.DataSource = ""
                grdExperience.DataBind()
                Exit Sub
            End If


            Dim Check As Integer = clsCanEduDataAccess.SubmitExperienceInformation(CandidateID, isoExperienceParts)
            If Check = 1 Then
                MessageBox("Inserted Successfully")
                btnSave.Enabled = False

                Response.Redirect("~/CVMan/CandidateEducationInfo.aspx")
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

     
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnExperience_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExperience.Click
        Try
            Dim Checkdate As Boolean
            If drpDay.SelectedValue = "DD" Or drpMonth.SelectedValue = "MM" Or drpYear.SelectedValue = "YYYY" Then
                MessageBox("Select Date From Parameter Correctly.")
                Exit Sub
            End If

            If chkTillDate.Checked = False Then
                If drpDayTo.SelectedValue = "DD" Or drpMonthTo.SelectedValue = "MM" Or drpYearTo.SelectedValue = "YYYY" Then
                    MessageBox("Select Date To Parameter Correctly.")
                    Exit Sub
                End If

            End If

            Dim CandidateExperienceInfo As New clsExperienceInfo()

            CandidateExperienceInfo.CompanyName = Common.CheckAsciiValue(txtCompanyName.Text)
            CandidateExperienceInfo.OfficialDesig = Common.CheckAsciiValue(txtOfficialDesig.Text)
            CandidateExperienceInfo.FuncDesig = Common.CheckAsciiValue(txtFunctionalDesig.Text)
            CandidateExperienceInfo.Department = Common.CheckAsciiValue(txtDepartment.Text)
            CandidateExperienceInfo.Responsibilities = Common.CheckAsciiValue(txtResponsibilities.Text)
            CandidateExperienceInfo.CompanyAddress = Common.CheckAsciiValue(txtAddress.Text)
            CandidateExperienceInfo.CompanyConNo = Common.CheckAsciiValue(txtContactNo.Text)
            'CandidateExperienceInfo.DateFrom = (dtDateFm.Text)
            Checkdate = IsDate(drpMonth.SelectedValue + "/" + drpDay.SelectedValue + "/" + drpYear.SelectedValue)
            If Checkdate = False Then
                MessageBox("Please Enter a Valid date in DATE FROM")
                Exit Sub
            End If
            CandidateExperienceInfo.DateFrom = drpMonth.SelectedValue + "/" + drpDay.SelectedValue + "/" + drpYear.SelectedValue
            ' CandidateExperienceInfo.DateTo = (dtDatTo.Text)

            CandidateExperienceInfo.TillDate = chkTillDate.Checked

            If chkTillDate.Checked = True Then
                CandidateExperienceInfo.DateTo = "1911-01-01"
            Else
                'CandidateExperienceInfo.DateTo = dtDatTo.Text
                Checkdate = IsDate(drpMonthTo.SelectedValue + "/" + drpDayTo.SelectedValue + "/" + drpYearTo.SelectedValue)
                If Checkdate = False Then
                    MessageBox("Please Enter a Valid date in DATE TO")
                    Exit Sub
                End If
                CandidateExperienceInfo.DateTo = drpMonthTo.SelectedValue + "/" + drpDayTo.SelectedValue + "/" + drpYearTo.SelectedValue
            End If


            If chkTillDate.Checked = False Then
                Dim Result As Integer = DateTime.Compare(CandidateExperienceInfo.DateFrom, CandidateExperienceInfo.DateTo)
                If Result > 0 Then
                    MessageBox("DATE FROM should be earlier or equal to DATE TO")
                    Exit Sub
                End If
            End If

            Dim dt As DataTable = GetExperienceData(CandidateExperienceInfo)
            Session("CandidateExperienceInfo") = dt

            grdExperience.DataSource = dt
            grdExperience.DataBind()
            ClearExperienceData()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub
    Protected Function GetExperienceData(ByVal CandidateExperienceInfo As clsExperienceInfo) As DataTable

        Dim dtExperienceInfo = Session("CandidateExperienceInfo")

        'If (CheckDuplicateEducationEntry() = 0) Then
        '    Return dtTrainingInfo
        'End If
        Dim dr As DataRow
        dr = dtExperienceInfo.NewRow()
        dr("CompanyName") = CandidateExperienceInfo.CompanyName
        dr("OfficialDesig") = CandidateExperienceInfo.OfficialDesig
        dr("FuncDesig") = CandidateExperienceInfo.FuncDesig
        dr("Department") = CandidateExperienceInfo.Department
        dr("Responsibilities") = CandidateExperienceInfo.Responsibilities
        dr("CompanyAddress") = CandidateExperienceInfo.CompanyAddress
        dr("CompanyConNo") = CandidateExperienceInfo.CompanyConNo
        dr("DateFrom") = String.Format("{0:dd MMM yyyy}", CandidateExperienceInfo.DateFrom)
        'dr("DateTo") = String.Format("{0:dd MMM yyyy}", CandidateExperienceInfo.DateTo)

        If CandidateExperienceInfo.TillDate = True Then
            dr("DateTo") = ""
        Else
            dr("DateTo") = String.Format("{0:dd MMM yyyy}", CandidateExperienceInfo.DateTo)
        End If

        If CandidateExperienceInfo.TillDate = True Then
            dr("TillDate") = "Till Now"
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
        txtOfficialDesig.Text = ""
        txtFunctionalDesig.Text = ""
        txtDepartment.Text = ""
        txtResponsibilities.Text = ""
        txtAddress.Text = ""
        txtContactNo.Text = ""
        drpDay.SelectedIndex = -1
        drpMonth.SelectedIndex = -1
        drpYear.SelectedIndex = -1
        drpDayTo.SelectedIndex = -1
        drpMonthTo.SelectedIndex = -1
        drpYearTo.SelectedIndex = -1
        chkTillDate.Checked = False
        drpMonthTo.Visible = True
        drpDayTo.Visible = True
        drpYearTo.Visible = True
    End Sub

    Protected Function FormatExperienceInfo() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("CompanyName", System.Type.GetType("System.String"))
        dt.Columns.Add("OfficialDesig", System.Type.GetType("System.String"))
        dt.Columns.Add("FuncDesig", System.Type.GetType("System.String"))
        dt.Columns.Add("Department", System.Type.GetType("System.String"))
        dt.Columns.Add("Responsibilities", System.Type.GetType("System.String"))
        dt.Columns.Add("CompanyAddress", System.Type.GetType("System.String"))
        dt.Columns.Add("CompanyNo", System.Type.GetType("System.String"))
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

            Dim Secmsg As String = Request.QueryString("msg")

            If Secmsg <> 1 Then
                Session("Message") = ""
            End If
            'lblMessage = Request.QueryString("Message")
            lblMessage = Session("Message")

            If lblMessage <> "" Then
                lblRedirectMsg.Text = lblMessage
                forMessage.Visible = False
            End If

            btnSave.Enabled = False
            Dim Message As String = ""
            Dim msg As String = ""
            Dim CandidateID As String
            CandidateID = Session("CandidateID")

            Dim Status As Boolean = clsCanBasicDataAccess.PresentStatus(CandidateID)

            If Status = True Then
                ' btnExperience.Enabled = False
            End If

            Dim UserID As String
            Dim UserName As String
            UserID = Session("LoginUserID")
            UserName = Session("UserName")

            Dim RegistrationID As String
            RegistrationID = Session("RegistrationID")


            Dim CanCount As Integer = Common.CandidateCount(RegistrationID)

            If CanCount = 0 Then
                'msg = "Please Insert Basic Information First"
                'Response.Redirect("HRMCandidateBasicInfo.aspx?Message=" + msg)
                Session("Message") = "Please Insert Basic Information First"
                Response.Redirect("HRMCandidateBasicInfo.aspx?msg=1")
            End If

            Dim YearOfExp As Double

            If lblMessage = "" Then
                Dim YrExp As Double = EducationInformation.CandidateExperirnce(CandidateID, YearOfExp)

                If YrExp <> 0 Then
                    lblMessageForExp.Text = "Please Insert Experience Information as You Have Experience"
                Else
                    lblMessageForExp.Text = "Please skip this page as you have no experience."
                End If

            End If


            Dim dtExperienceInfo As DataTable = New DataTable()
            dtExperienceInfo = FormatExperienceInfo()
            Session("CandidateExperienceInfo") = dtExperienceInfo


            Dim count As Integer = Common.CandidateCount(RegistrationID)

            If count = 0 Then
                Exit Sub
            Else
                dtExperienceInfo = EducationInformation.fnGetExperienceInformation(CandidateID).Tables(0)
                grdExperience.DataSource = dtExperienceInfo
                grdExperience.DataBind()
                Session("CandidateExperienceInfo") = dtExperienceInfo

                If dtExperienceInfo.Rows.Count <> 0 Then
                    lblMessageForExp.Text = ""
                    forMessage.Visible = False
                End If

            End If

        End If
    End Sub

    Protected Sub grdExperience_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdExperience.RowDeleting
        btnSave.Enabled = True
        Dim i As Integer
        Dim dtExperienceInfo As DataTable = New DataTable()

        dtExperienceInfo = Session("CandidateExperienceInfo")

        i = e.RowIndex

        dtExperienceInfo.Rows(i).Delete()
        dtExperienceInfo.AcceptChanges()
        grdExperience.DataSource = dtExperienceInfo
        grdExperience.DataBind()

        Dim CandidateID As String
        CandidateID = Session("CandidateID")

        Dim Status As Boolean = clsCanBasicDataAccess.PresentStatus(CandidateID)

        If Status = True Then
            'btnSave.Enabled = False
        End If

        If dtExperienceInfo.Rows.Count = 0 Then
            btnSave.Enabled = False
        End If
    End Sub

    Protected Sub chkTillDate_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkTillDate.CheckedChanged
        If chkTillDate.Checked = True Then
            drpMonthTo.Visible = False
            drpDayTo.Visible = False
            drpYearTo.Visible = False
            'dtDatTo.Visible = False
            'dtDatTo_ReqFieldValidator.Visible = False
        Else
            drpMonthTo.Visible = True
            drpDayTo.Visible = True
            drpYearTo.Visible = True
            'dtDatTo.Visible = True
            'dtDatTo_ReqFieldValidator.Visible = True
        End If
    End Sub

End Class

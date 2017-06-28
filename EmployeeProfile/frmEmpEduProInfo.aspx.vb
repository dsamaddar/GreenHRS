Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.OleDb
Imports System.Data.Common
Imports System.Net
Imports System.IO
Imports System.Math
Imports System.Configuration
Imports System.Web.UI

Partial Class EmployeeProfile_frmEmpEduProInfo
    Inherits System.Web.UI.Page
    Dim EducationInformation As New clsEmployeeAllInfoDataAccess()
    Dim EmployeeData As New clsEmpBasicProfileDataAccess()

#Region "Education"

    Protected Sub btnNext_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNext.Click

        Dim UserID As String
        UserID = Session("LoginUserID")

        Dim EmployeeID = Session("EmployeeID")

        Dim RegistrationID As String
        RegistrationID = Session("RegistrationID")

        If grdEducation.Rows.Count <= 0 Then
            MessageBox("An Exam Must Have At Least One Subject.")
            Exit Sub
        End If

        Dim EmployeeEduInfo As String = ""
        Dim isoParts As String = ""

        Dim dtEducationInfo As DataTable = New DataTable()
        dtEducationInfo = Session("EmployeeEduInfo")

        Dim EduInfo As New clsEmpEduInfo()
        For Each rw As DataRow In dtEducationInfo.Rows
            EduInfo.DegreeType = rw.Item("DegreeType")
            EduInfo.ExamID = rw.Item("ExamID")
            EduInfo.MajorID = rw.Item("MajorID")
            EduInfo.PassingYear = rw.Item("PassingYear")
            EduInfo.InstitutionID = rw.Item("InstitutionID")
            EduInfo.OtherInstitutionName = rw.Item("OtherInstitutionName")
            EduInfo.ResultType = rw.Item("ResultType")
            EduInfo.Result = rw.Item("Result")

            If rw.Item("OutOf") = "N\A" Then
                EduInfo.OutOf = 0
            Else
                EduInfo.OutOf = rw.Item("OutOf")
            End If


            isoParts = isoParts & EduInfo.DegreeType & "~" & EduInfo.ExamID & "~" & EduInfo.MajorID & "~" & EduInfo.PassingYear & "~" & EduInfo.InstitutionID & "~" & EduInfo.OtherInstitutionName & "~" & EduInfo.ResultType & "~" & EduInfo.Result & "~" & EduInfo.OutOf & "~|"
        Next

        Dim count As Integer = EducationInformation.EmployeeCount(EmployeeID)
        If count = 0 Then
            'MessageBox("Insert Basic Information first")
            grdEducation.DataSource = ""
            grdEducation.DataBind()
            Exit Sub
        End If

        If btnAddInstitution.Text = "Insert" Then
            MessageBox("Insert Institution Name")
            Exit Sub
        End If


        'Dim Check As Integer = EducationInformation.SubmitEducationInformation(EmployeeID, isoParts)
        Dim Check As Integer = EducationInformation.SubmitEducationInformation(lblHolder.Text, isoParts)
        If Check = 1 Then
            MessageBox("Inserted Successfully")
            btnNext.Enabled = False
            'Response.Redirect("~/EmployeeInfo/EmployeeTrainingInfo.aspx")
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Function FormatEducationInfo() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("DegreeType", System.Type.GetType("System.String"))
        dt.Columns.Add("ExamID", System.Type.GetType("System.String"))
        dt.Columns.Add("ExamName", System.Type.GetType("System.String"))
        dt.Columns.Add("MajorID", System.Type.GetType("System.String"))
        dt.Columns.Add("Major", System.Type.GetType("System.String"))
        dt.Columns.Add("PassingYear", System.Type.GetType("System.Double"))
        dt.Columns.Add("InstitutionID", System.Type.GetType("System.String"))
        dt.Columns.Add("InstitutionName", System.Type.GetType("System.String"))
        dt.Columns.Add("OtherInstitutionName", System.Type.GetType("System.String"))
        dt.Columns.Add("ResultType", System.Type.GetType("System.String"))
        dt.Columns.Add("Result", System.Type.GetType("System.String"))
        dt.Columns.Add("OutOf", System.Type.GetType("System.Decimal"))
        Return dt
    End Function

    Protected Sub btnAddEdu_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddEdu.Click
        Try
            If ddlMajor.SelectedValue = "-Select-" Then
                MessageBox("Select Major Name")
                Exit Sub
            End If

            If ddlPassingYear.SelectedValue = "YYYY" Then
                MessageBox("Select Passing Year")
                Exit Sub
            End If

            If ddlResultType.SelectedValue = "-Select-" Then
                MessageBox("Select Result Type")
                Exit Sub
            End If

            Dim EmpEduInfo As New clsEmpEduInfo()

            EmpEduInfo.DegreeType = rdoDegreeType.SelectedValue
            EmpEduInfo.ExamID = ddlExamName.SelectedValue
            EmpEduInfo.ExamName = ddlExamName.SelectedItem.ToString()
            EmpEduInfo.MajorID = ddlMajor.SelectedValue
            EmpEduInfo.Major = ddlMajor.SelectedItem.ToString()
            EmpEduInfo.PassingYear = Convert.ToInt16(ddlPassingYear.SelectedValue)
            EmpEduInfo.InstitutionID = ddlBoard.SelectedValue
            EmpEduInfo.InstitutionName = ddlBoard.SelectedItem.ToString()
            EmpEduInfo.OtherInstitutionName = Common.CheckAsciiValue(txtOtherInsName.Text)
            EmpEduInfo.ResultType = ddlResultType.SelectedValue

            If EmpEduInfo.ResultType = "GPA" Then
                EmpEduInfo.Result = txtResult.Text
                EmpEduInfo.OutOf = txtOutOf.Text

                If EmpEduInfo.Result > EmpEduInfo.OutOf Then
                    MessageBox("Result should be less than or Equal to Out of")
                    Exit Sub
                End If

            ElseIf EmpEduInfo.ResultType = "Division" Then
                EmpEduInfo.Result = ddlDivision.SelectedValue
                EmpEduInfo.OutOf = "0"

            ElseIf EmpEduInfo.ResultType = "Appeared" Then
                EmpEduInfo.Result = ""
                EmpEduInfo.OutOf = "0"
            End If

            Dim dt As DataTable = GetEducationData(EmpEduInfo)
            Session("EmployeeEduInfo") = dt

            grdEducation.DataSource = dt
            grdEducation.DataBind()
            ClearEducationData()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Function GetEducationData(ByVal EmpEduInfo As clsEmpEduInfo) As DataTable

        Dim dtEducationInfo = Session("EmployeeEduInfo")

        If (CheckDuplicateEducationEntry() = 0) Then
            lblErrorMessageOnEDU.Text = "You Can't Insert Duplicate Exam Name."
            Return dtEducationInfo
        End If
        Dim dr As DataRow
        dr = dtEducationInfo.NewRow()
        dr("DegreeType") = EmpEduInfo.DegreeType
        dr("ExamID") = EmpEduInfo.ExamID
        dr("ExamName") = EmpEduInfo.ExamName
        dr("MajorID") = EmpEduInfo.MajorID
        dr("Major") = EmpEduInfo.Major
        dr("PassingYear") = EmpEduInfo.PassingYear
        dr("InstitutionID") = EmpEduInfo.InstitutionID
        dr("InstitutionName") = EmpEduInfo.InstitutionName
        dr("OtherInstitutionName") = EmpEduInfo.OtherInstitutionName
        dr("ResultType") = EmpEduInfo.ResultType
        dr("Result") = EmpEduInfo.Result

        If EmpEduInfo.InstitutionName = "Others" Then
            dr("InstitutionName") = EmpEduInfo.InstitutionName + "(" + EmpEduInfo.OtherInstitutionName + ")"
        Else
            dr("OtherInstitutionName") = "N\A"
        End If
        If EmpEduInfo.OutOf = 0 Then
            dr("OutOf") = "N\A"
        Else
            dr("OutOf") = EmpEduInfo.OutOf
        End If

        dtEducationInfo.Rows.Add(dr)
        dtEducationInfo.AcceptChanges()

        btnNext.Enabled = True
        ForGPA.Visible = False
        ForDivision.Visible = False
        idForOthers.Visible = False
        Return dtEducationInfo
    End Function

    Public Function CheckDuplicateEducationEntry() As Integer
        Dim lbl As System.Web.UI.WebControls.Label
        For Each rw As GridViewRow In grdEducation.Rows
            lbl = rw.FindControl("lblExamName")
            If lbl.Text = Nothing Then
                Return 0
            End If
            If ddlExamName.SelectedItem.ToString() = lbl.Text Then
                MessageBox("You Can't Insert Duplicate Exam Name.")
                Return 0
            End If
        Next
        Return 1
    End Function

    Protected Sub ClearEducationData()
        'rdoDegreeType.SelectedIndex = -1
        ddlExamName.SelectedIndex = -1
        ddlMajor.SelectedIndex = -1
        ddlPassingYear.SelectedIndex = -1
        ddlBoard.SelectedIndex = -1
        ddlResultType.SelectedIndex = -1
        txtResult.Text = ""
        ddlDivision.SelectedIndex = -1
        txtOutOf.Text = ""
    End Sub

    Protected Sub ddlResultType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlResultType.SelectedIndexChanged
        If ddlResultType.SelectedValue = "GPA" Then
            ForGPA.Visible = True
            ForDivision.Visible = False
        ElseIf ddlResultType.SelectedValue = "Division" Then
            ForGPA.Visible = False
            ForDivision.Visible = True
        Else
            ForGPA.Visible = False
            ForDivision.Visible = False
        End If
        SetFocus(grdEducation)
    End Sub

    Protected Sub grdEducation_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdEducation.RowDeleting

        btnNext.Enabled = True
        Dim i As Integer
        Dim dtEducationInfo As DataTable = New DataTable()

        dtEducationInfo = Session("EmployeeEduInfo")

        i = e.RowIndex

        dtEducationInfo.Rows(i).Delete()
        dtEducationInfo.AcceptChanges()
        grdEducation.DataSource = dtEducationInfo
        grdEducation.DataBind()

        Dim EmployeeID As String
        EmployeeID = Session("EmployeeID")

        'Dim Status As Boolean = clsCanBasicDataAccess.PresentStatus(CandidateID)

        'If Status = True Then
        '    btnNext.Enabled = False
        'End If

        If dtEducationInfo.Rows.Count = 0 Then
            btnNext.Enabled = False
        End If

    End Sub

    Protected Sub btnAddInstitution_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddInstitution.Click
        Dim UserID As String
        UserID = Session("LoginUserID")

        If btnAddInstitution.Text = "ADD" Then
            lblInstitutionAdd.Visible = True
            btnAddInstitution.Text = "Insert"
        Else
            Dim InstitutionName As String
            Dim EntryBy As String
            Dim IsActive As Integer = 1

            'idAddIns.Visible = False

            InstitutionName = txtBoard.Text
            EntryBy = UserID

            If InstitutionName = "" Then
                Exit Sub
            End If


            Dim check As Integer = EducationInformation.AddInstitutionName(InstitutionName, 1, EntryBy)

            If check = 1 Then
                MessageBox("Inserted")
                txtBoard.Text = ""
                ShowInstitutionList()
                lblInstitutionAdd.Visible = False
                btnAddInstitution.Text = "ADD"
            Else
                MessageBox("Error Found")
            End If
        End If

    End Sub

    Protected Sub ShowInstitutionList()
        ddlBoard.DataTextField = "InstitutionName"
        ddlBoard.DataValueField = "InstitutionID"
        ddlBoard.DataSource = EducationInformation.fnGetInstitutionList()
        ddlBoard.DataBind()
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        lblInstitutionAdd.Visible = False
        btnAddInstitution.Text = "ADD"
    End Sub

    Protected Sub ddlBoard_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlBoard.SelectedIndexChanged
        If ddlBoard.SelectedItem.Text = "Others" Then
            idForOthers.Visible = True
        Else
            idForOthers.Visible = False
        End If

        SetFocus(grdEducation)
    End Sub

    Protected Sub rdoDegreeType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdoDegreeType.SelectedIndexChanged
        If rdoDegreeType.SelectedValue = "Foreign" Then
            ddlBoard.SelectedIndex = ddlBoard.Items.IndexOf(ddlBoard.Items.FindByText("Others"))
            ddlBoard.Enabled = False
            idForOthers.Visible = True
        Else
            ShowInstitutionList()
            ddlBoard.Enabled = True
            idForOthers.Visible = False
        End If
        SetFocus(grdEducation)
    End Sub

#End Region

#Region "ProCerti"
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

            Dim EmployeeProfessionCerti As New clsEmpProCerti()

            EmployeeProfessionCerti.CertificationName = Common.CheckAsciiValue(txtCertificationName.Text)
            EmployeeProfessionCerti.InstituteName = Common.CheckAsciiValue(txtInstitutionName.Text)
            EmployeeProfessionCerti.Location = Common.CheckAsciiValue(txtLocation.Text)
            Checkdate = IsDate(drpMonth.SelectedValue + "/" + drpDay.SelectedValue + "/" + drpYear.SelectedValue)

            If Checkdate = False Then
                MessageBox("Please Enter a Valid ISSUING DATE")
                Exit Sub
            End If
            EmployeeProfessionCerti.DateFrom = drpMonth.SelectedValue + "/" + drpDay.SelectedValue + "/" + drpYear.SelectedValue

            EmployeeProfessionCerti.NeverExpire = chkNeverExpire.Checked

            If chkNeverExpire.Checked = True Then
                EmployeeProfessionCerti.DateTo = "1911-01-01"
            Else
                Checkdate = IsDate(drpMonthTo.SelectedValue + "/" + drpDayTo.SelectedValue + "/" + drpYearTo.SelectedValue)
                If Checkdate = False Then
                    MessageBox("Please Enter a Valid EXPIRE DATE")
                    Exit Sub
                End If
                EmployeeProfessionCerti.DateTo = drpMonthTo.SelectedValue + "/" + drpDayTo.SelectedValue + "/" + drpYearTo.SelectedValue
            End If

            Dim dt As DataTable = GetProfessionalCertificationData(EmployeeProfessionCerti)
            Session("EmployeeProfessionalCertificationInfo") = dt

            grdCertification.DataSource = dt
            grdCertification.DataBind()
            ClearProfessionalCertificationData()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Function GetProfessionalCertificationData(ByVal EmployeeProfessionCerti As clsEmpProCerti) As DataTable

        Dim dtProfessionalCertificationInfo = Session("EmployeeProfessionalCertificationInfo")

        Dim dr As DataRow
        dr = dtProfessionalCertificationInfo.NewRow()
        dr("CertificationName") = EmployeeProfessionCerti.CertificationName
        dr("InstituteName") = EmployeeProfessionCerti.InstituteName
        dr("Location") = EmployeeProfessionCerti.Location
        dr("IssuingDate") = String.Format("{0:dd MMM yyyy}", EmployeeProfessionCerti.DateFrom)

        If EmployeeProfessionCerti.NeverExpire = True Then
            dr("ExpireDate") = ""
        Else
            dr("ExpireDate") = String.Format("{0:dd MMM yyyy}", EmployeeProfessionCerti.DateTo)
        End If

        If EmployeeProfessionCerti.NeverExpire = True Then
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

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Dim UserID As String
        UserID = Session("LoginUserID")

        Dim EmployeeID = Session("EmployeeID")

        Dim RegistrationID As String
        RegistrationID = Session("RegistrationID")


        Dim EmployeeProfessionalCertificationInfo As String = ""
        Dim isoProfessionalCertificationParts As String = ""

        Dim dtProfessionalCertificationInfo As DataTable = New DataTable()
        dtProfessionalCertificationInfo = Session("EmployeeProfessionalCertificationInfo")

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

            isoProfessionalCertificationParts = isoProfessionalCertificationParts & ProInfo.CertificationName & "~" & ProInfo.InstituteName & "~" & ProInfo.Location & "~" & ProInfo.DateFrom & "~" & ProInfo.DateTo & "~" & ProInfo.NeverExpire & "~|"
        Next

        'Dim Check As Integer = EducationInformation.SubmitOtherInformation(EmployeeID, isoProfessionalCertificationParts)
        Dim Check As Integer = EducationInformation.SubmitOtherInformation(lblHolder.Text, isoProfessionalCertificationParts)
        If Check = 1 Then
            MessageBox("Inserted Successfully")
            btnSubmit.Enabled = False
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


        Dim EmployeeID As String
        EmployeeID = Session("EmployeeID")

        Dim Status As Boolean = clsCanBasicDataAccess.PresentStatus(lblHolder.Text)

        If Status = True Then
            btnSubmit.Enabled = False
        End If

        If dtProfessionalCertificationInfo.Rows.Count = 0 Then
            btnSubmit.Enabled = False
        End If
    End Sub

    Protected Sub chkNeverExpire_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkNeverExpire.CheckedChanged
        If chkNeverExpire.Checked = True Then
            drpMonthTo.Visible = False
            drpDayTo.Visible = False
            drpYearTo.Visible = False
        Else
            drpMonthTo.Visible = True
            drpDayTo.Visible = True
            drpYearTo.Visible = True
        End If
    End Sub

#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If
        If Not IsPostBack Then
            Dim LoginUserId As String = Session("UniqueUserID")

            Dim ToWhomProShow As String = Session("ToWhomProShow")
            lblHolder.Text = ToWhomProShow

            getBasicProfileInfo(ToWhomProShow)

            If LoginUserId = ToWhomProShow Then
                Dim Check As Boolean = EducationInformation.CheckPermissionForOwnInfo(LoginUserId)
                If Check = True Then
                    pnlEmpProfCertificationInfo.Visible = True
                    pnlAnyProfCertification.Visible = True
                    pnlCertification.Visible = True
                    pnlProfCertSave.Visible = True
                    pnlEduInfo.Visible = True
                    pnlEducation.Visible = True
                    pnlEduQuaSave.Visible = True
                Else
                    pnlEmpProfCertificationInfo.Visible = False
                    pnlAnyProfCertification.Visible = False
                    pnlCertification.Visible = True
                    pnlProfCertSave.Visible = False
                    pnlEduInfo.Visible = False
                    pnlEducation.Visible = True
                    pnlEduQuaSave.Visible = False
                End If
            Else
                Dim Check As Boolean = EducationInformation.CheckPermissionForOthers(LoginUserId)
                If Check = True Then
                    pnlEmpProfCertificationInfo.Visible = True
                    pnlAnyProfCertification.Visible = True
                    pnlCertification.Visible = True
                    pnlProfCertSave.Visible = True
                    pnlEduInfo.Visible = True
                    pnlEducation.Visible = True
                    pnlEduQuaSave.Visible = True
                Else
                    pnlEmpProfCertificationInfo.Visible = False
                    pnlAnyProfCertification.Visible = False
                    pnlCertification.Visible = True
                    pnlProfCertSave.Visible = False
                    pnlEduInfo.Visible = False
                    pnlEducation.Visible = True
                    pnlEduQuaSave.Visible = False
                End If
            End If

            btnAddInstitution.Enabled = False

            'pnlEmpProfCertificationInfo.Visible = False
            'pnlCertification.Visible = False
            rdbtnIsProfessionalCertificationExists.SelectedIndex = 1

            '' Chq. If Any Information Exists related To Prof. Certification thn show

            Dim Secmsg As String = Request.QueryString("msg")

            If Secmsg <> 1 Then
                Session("Message") = ""
            End If

            Dim lblMessage As String

            lblMessage = Session("Message")

            Dim UserID As String
            Dim UserName As String
            UserID = Session("LoginUserID")
            UserName = Session("UserName")
            Dim EmployeeID As String
            EmployeeID = Session("EmployeeID")

            Dim Message As String = ""
            Dim msg As String = ""

            Dim EmpCount As Integer = EducationInformation.EmployeeCount(lblHolder.Text)

            'If EmpCount = 0 Then
            '    Session("Message") = "Please Insert Basic Information First"
            '    Response.Redirect("EmployeeBasicInfo.aspx?msg=1")
            'End If

            btnNext.Enabled = False
            idForOthers.Visible = False

            lblInstitutionAdd.Visible = False
            ShowInstitutionList()

            getMajorName()
            getExamName()
            getInstitutionName()

            If ddlResultType.SelectedValue = "-Select-" Then
                ForGPA.Visible = False
                ForDivision.Visible = False
            End If


            Dim dtEducationInfo As DataTable = New DataTable()
            dtEducationInfo = FormatEducationInfo()
            Session("EmployeeEduInfo") = dtEducationInfo



            Dim count As Integer = EducationInformation.EmployeeCount(lblHolder.Text)

            If count = 0 Then
                Exit Sub
            Else
                dtEducationInfo = EducationInformation.fnGetEducationInformation(lblHolder.Text).Tables(0)
                grdEducation.DataSource = dtEducationInfo
                grdEducation.DataBind()
                Session("EmployeeEduInfo") = dtEducationInfo

            End If

            btnSubmit.Enabled = False
            Dim dtProfessionalCertificationInfo As DataTable = New DataTable()
            dtProfessionalCertificationInfo = FormatProfessionalCertificationInfo()
            Session("EmployeeProfessionalCertificationInfo") = dtProfessionalCertificationInfo


            If count = 0 Then
                Exit Sub
            Else

                dtProfessionalCertificationInfo = EducationInformation.fnGetProCertificationInformation(lblHolder.Text).Tables(0)
                grdCertification.DataSource = dtProfessionalCertificationInfo
                grdCertification.DataBind()
                Session("EmployeeProfessionalCertificationInfo") = dtProfessionalCertificationInfo

                'If dtProfessionalCertificationInfo.Rows.Count <> 0 Then
                '    rdbtnIsProfessionalCertificationExists.SelectedValue = "YES"
                '    pnlEmpProfCertificationInfo.Visible = True
                '    pnlCertification.Visible = True
                'End If
            End If

            rdoDegreeType.SelectedIndex = 0
        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub rdbtnIsProfessionalCertificationExists_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdbtnIsProfessionalCertificationExists.SelectedIndexChanged
        If rdbtnIsProfessionalCertificationExists.SelectedValue = "YES" Then
            pnlEmpProfCertificationInfo.Visible = True
            pnlCertification.Visible = True
        Else
            pnlEmpProfCertificationInfo.Visible = False
            pnlCertification.Visible = False
        End If
    End Sub

    Protected Sub getExamName()
        ddlExamName.DataValueField = "ExamID"
        ddlExamName.DataTextField = "ExamName"
        ddlExamName.DataSource = EducationInformation.fnGetExamName()
        ddlExamName.DataBind()
    End Sub

    Protected Sub getMajorName()
        ddlMajor.DataValueField = "MajorTypeID"
        ddlMajor.DataTextField = "MajorType"
        ddlMajor.DataSource = EducationInformation.fnGetMajorName()
        ddlMajor.DataBind()

        ddlMajor.Items.Insert(0, "-Select-")
    End Sub

    Protected Sub getInstitutionName()
        ddlBoard.DataValueField = "InstitutionID"
        ddlBoard.DataTextField = "InstitutionName"
        ddlBoard.DataSource = EducationInformation.fnGetInstituteName()
        ddlBoard.DataBind()
    End Sub

    Protected Sub getBasicProfileInfo(ByVal EmployeeId As String)
        Dim EmpBasicProfile As New EmpBasicInfo()
        EmpBasicProfile = EmployeeData.fnGetBasicProfile(EmployeeId)

        Dim pnlEmpSummary As Panel
        Master.FindControl("pnlEmpSummary")
        pnlEmpSummary = Master.FindControl("pnlEmpSummary")

        Dim lblEmployeeName, lblEmployeeID, lblOfficialDesignation, lblFunctionalDesignation, lblDepartment, lblSupervisorName, lblEmployeeType, lblServiceLength, lblLocation As Label
        Dim imgEmployee As Image
        Dim hpLnkCanProfile As New HyperLink

        lblEmployeeName = pnlEmpSummary.FindControl("lblEmployeeName")
        lblEmployeeID = pnlEmpSummary.FindControl("lblEmployeeID")
        lblOfficialDesignation = pnlEmpSummary.FindControl("lblOfficialDesignation")
        lblFunctionalDesignation = pnlEmpSummary.FindControl("lblFunctionalDesignation")
        lblDepartment = pnlEmpSummary.FindControl("lblDepartment")
        lblSupervisorName = pnlEmpSummary.FindControl("lblSupervisorName")
        lblEmployeeType = pnlEmpSummary.FindControl("lblEmployeeType")
        lblServiceLength = pnlEmpSummary.FindControl("lblServiceLength")
        lblLocation = pnlEmpSummary.FindControl("lblLocation")
        imgEmployee = pnlEmpSummary.FindControl("imgEmployee")
        hpLnkCanProfile = pnlEmpSummary.FindControl("hpLnkCanProfile")

        lblEmployeeName.Text = EmpBasicProfile.Name
        lblEmployeeID.Text = EmpBasicProfile.EmpCode
        lblOfficialDesignation.Text = EmpBasicProfile.OfficialDesignation
        lblFunctionalDesignation.Text = EmpBasicProfile.FunctionalDesignation
        lblDepartment.Text = EmpBasicProfile.DepartmentName
        lblSupervisorName.Text = EmpBasicProfile.CurrentSupervisor
        lblEmployeeType.Text = EmpBasicProfile.EmployeeTypeName
        lblServiceLength.Text = EmpBasicProfile.ServiceLength
        lblLocation.Text = EmpBasicProfile.ULCBranchName
        hpLnkCanProfile.NavigateUrl = "../RecuitmentCVView.aspx?CandidateID=" + EmpBasicProfile.CandidateID

        If EmpBasicProfile.Attachment = "" Then
            imgEmployee.ImageUrl = ""
        Else
            ShowImage(ConfigurationManager.AppSettings("AttachmentsShow") & EmpBasicProfile.Attachment, "imgEmployee")
        End If

        'lblImg.Text = imgEmployee.ImageUrl
    End Sub

    Protected Sub ShowImage(ByVal UrlStr As String, ByVal ControlName As String)
        Dim tClient As WebClient = New WebClient
        Dim memStrmPic As MemoryStream = New MemoryStream(tClient.DownloadData(UrlStr))
        Dim bytesPic As Byte() = memStrmPic.ToArray()
        Dim base64StringPic As String = Convert.ToBase64String(bytesPic, 0, bytesPic.Length)

        Dim imgCtrl As System.Web.UI.WebControls.Image = Master.FindControl(ControlName)
        imgCtrl.ImageUrl = "data:image/png;base64," & base64StringPic
        memStrmPic.Dispose()
    End Sub

End Class

Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.OleDb
Imports System.Data.Common
Imports System.IO
Imports System.Math
Imports System.Configuration
Imports System.Web.UI
Partial Class CandidateTrainingInfo
    Inherits System.Web.UI.Page

    Dim EducationInformation As New clsCanEduDataAccess()


    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click

        Dim UserID As String
        UserID = Session("LoginUserID")

        Dim CandidateID = Session("CandidateID")

        Dim RegistrationID As String
        RegistrationID = Session("RegistrationID")

        Dim CandidateTrainInfo As String = ""
        Dim isoTrainingParts As String = ""

        Dim dtTrainingInfo As DataTable = New DataTable()
        dtTrainingInfo = Session("CandidateTrainingInfo")

        Dim TraInfo As New ClsTrainingInfo()
        For Each rw As DataRow In dtTrainingInfo.Rows
            TraInfo.TrainingName = rw.Item("TrainingName")
            TraInfo.InstituteName = rw.Item("InstituteName")
            TraInfo.Country = rw.Item("CountryID")
            TraInfo.TrainingYear = rw.Item("TrainingYear")
            TraInfo.TotalTrainingDay = rw.Item("TotalTrainingDay")
            TraInfo.DateFrom = rw.Item("DateFrom")
            TraInfo.DateTo = rw.Item("DateTo")

            isoTrainingParts = isoTrainingParts & TraInfo.TrainingName & "~" & TraInfo.InstituteName & "~" & TraInfo.Country & "~" & TraInfo.TrainingYear & "~" & TraInfo.TotalTrainingDay & "~" & TraInfo.DateFrom & "~" & TraInfo.DateTo & "~|"
        Next


        Dim count As Integer = clsCanEduDataAccess.CandidateCount(RegistrationID)
        If count = 0 Then
            MessageBox("Insert Basic Information first")
            grdTraining.DataSource = ""
            grdTraining.DataBind()
            Exit Sub
        End If

        Dim Check As Integer = clsCanEduDataAccess.SubmitTrainingInformation(CandidateID, isoTrainingParts)
        If Check = 1 Then
            MessageBox("Inserted Successfully")
            btnSave.Enabled = False
            Response.Redirect("~/CVMan/CandidateReferenceInfo.aspx")
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
        dt.Columns.Add("TotalTrainingDay", GetType(Integer))
        dt.Columns.Add("DateFrom", System.Type.GetType("System.DateTime"))
        dt.Columns.Add("DateTo", System.Type.GetType("System.DateTime"))
        Return dt
    End Function

    Protected Sub btnTrainingAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTrainingAdd.Click
        Try
            Dim Checkdate As Boolean
            If ddlCountry.SelectedValue = "-Select-" Then
                MessageBox("Select Country Name")
                Exit Sub
            End If

            If ddlTrainingYear.SelectedValue = "YYYY" Then
                MessageBox("Select Training Year")
                Exit Sub
            End If

            If drpDay.SelectedValue = "DD" Or drpMonth.SelectedValue = "MM" Or drpYear.SelectedValue = "YYYY" Then
                MessageBox("Select Date From Parameter Correctly.")
                Exit Sub
            End If

            If drpDayTo.SelectedValue = "DD" Or drpMonthTo.SelectedValue = "MM" Or drpYearTo.SelectedValue = "YYYY" Then
                MessageBox("Select Date To Parameter Correctly.")
                Exit Sub
            End If


            Dim CandidateTrainingInfo As New ClsTrainingInfo()

            CandidateTrainingInfo.TrainingName = Common.CheckAsciiValue(txtTrainingName.Text)
            CandidateTrainingInfo.InstituteName = Common.CheckAsciiValue(txtInstitutionName.Text)
            CandidateTrainingInfo.CountryID = ddlCountry.SelectedValue
            CandidateTrainingInfo.Country = ddlCountry.SelectedItem.ToString()
            CandidateTrainingInfo.TrainingYear = Convert.ToInt16(ddlTrainingYear.SelectedValue)
            CandidateTrainingInfo.TotalTrainingDay = txtTrainingDays.Text
            'CandidateTrainingInfo.DateFrom = dtDateFrom.Text

            Checkdate = IsDate(drpMonth.SelectedValue + "/" + drpDay.SelectedValue + "/" + drpYear.SelectedValue)
            If Checkdate = False Then
                MessageBox("Please Enter a Valid date in DATE FROM")
                Exit Sub
            End If
            CandidateTrainingInfo.DateFrom = drpMonth.SelectedValue + "/" + drpDay.SelectedValue + "/" + drpYear.SelectedValue
            
            'CandidateTrainingInfo.DateTo = dtDateTo.Text


            Checkdate = IsDate(drpMonthTo.SelectedValue + "/" + drpDayTo.SelectedValue + "/" + drpYearTo.SelectedValue)
            If Checkdate = False Then
                MessageBox("Please Enter a Valid date in DATE TO")
                Exit Sub
            End If
            CandidateTrainingInfo.DateTo = drpMonthTo.SelectedValue + "/" + drpDayTo.SelectedValue + "/" + drpYearTo.SelectedValue

            Dim Result As Integer = DateTime.Compare(CandidateTrainingInfo.DateFrom, CandidateTrainingInfo.DateTo)
            If Result > 0 Then
                MessageBox("DATE FROM should be earlier or equal to DATE TO")
                Exit Sub
            End If
            
            Dim dt As DataTable = GetTrainingData(CandidateTrainingInfo)
            Session("CandidateTrainingInfo") = dt

            grdTraining.DataSource = dt
            grdTraining.DataBind()
            ClearTrainingData()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub
    Protected Function GetTrainingData(ByVal CandidateTrainingInfo As ClsTrainingInfo) As DataTable

        Dim dtTrainingInfo = Session("CandidateTrainingInfo")

        'If (CheckDuplicateEducationEntry() = 0) Then
        '    Return dtTrainingInfo
        'End If
        Dim dr As DataRow
        dr = dtTrainingInfo.NewRow()
        dr("TrainingName") = CandidateTrainingInfo.TrainingName
        dr("InstituteName") = CandidateTrainingInfo.InstituteName
        dr("CountryID") = CandidateTrainingInfo.CountryID
        dr("Country") = CandidateTrainingInfo.Country
        dr("TrainingYear") = CandidateTrainingInfo.TrainingYear
        dr("TotalTrainingDay") = CandidateTrainingInfo.TotalTrainingDay
        dr("DateFrom") = String.Format("{0:dd MMM yyyy}", CandidateTrainingInfo.DateFrom)
        dr("DateTo") = String.Format("{0:dd MMM yyyy}", CandidateTrainingInfo.DateTo)

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
        drpDay.SelectedIndex = -1
        drpMonth.SelectedIndex = -1
        drpYear.SelectedIndex = -1
        drpDayTo.SelectedIndex = -1
        drpMonthTo.SelectedIndex = -1
        drpYearTo.SelectedIndex = -1
        txtTrainingDays.Text = ""
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If
        If Not IsPostBack Then

            pnlTrainingGrid.Visible = False
            pnlCanTrainingInfo.Visible = False
            rdbtnIstrainingExists.SelectedIndex = 1


            Dim Message As String = ""
            Dim msg As String = ""
            btnSave.Enabled = False
            Dim CandidateID As String
            CandidateID = Session("CandidateID")

            Dim Status As Boolean = clsCanBasicDataAccess.PresentStatus(CandidateID)

            If Status = True Then
                'btnTrainingAdd.Enabled = False
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

            Dim YrExp As Double = EducationInformation.CandidateExperirnce(CandidateID, YearOfExp)

            If YrExp <> 0 Then
                Dim CanExpCount As Integer = Common.CandidateExperienceCount(CandidateID)

                If CanExpCount = 0 Then
                    'msg = "Please Insert Experience Information as Your Year of Experience is " + YrExp.ToString()
                    'msg = "Please Insert Experience Information as You Have Experience"
                    'Response.Redirect("CandidateExperienceInfo.aspx?Message=" + msg)
                    Session("Message") = "Please Insert Experience Information as You Have Experience"
                    Response.Redirect("CandidateExperienceInfo.aspx?msg=1")
                End If
            End If


            Dim CanEduCount As Integer = Common.CandidateEducationCount(CandidateID)

            If CanEduCount = 0 Then
                'msg = "Please Insert Education Information First"
                Session("Message") = "Please Insert Education Information"
                Response.Redirect("CandidateEducationInfo.aspx?msg=1")
            End If



            Dim dtTrainingInfo As DataTable = New DataTable()
            dtTrainingInfo = FormatTrainingInfo()
            Session("CandidateTrainingInfo") = dtTrainingInfo


            Dim count As Integer = Common.CandidateCount(RegistrationID)

            If count = 0 Then
                Exit Sub
            Else
                dtTrainingInfo = EducationInformation.fnGetTrainingInformation(CandidateID).Tables(0)
                grdTraining.DataSource = dtTrainingInfo
                grdTraining.DataBind()
                Session("CandidateTrainingInfo") = dtTrainingInfo
                If dtTrainingInfo.Rows.Count <> 0 Then
                    rdbtnIstrainingExists.SelectedValue = "YES"
                    pnlCanTrainingInfo.Visible = True
                    pnlTrainingGrid.Visible = True
                End If
            End If
        End If
    End Sub

    Protected Sub grdTraining_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdTraining.RowDeleting
        btnSave.Enabled = True
        Dim i As Integer
        Dim dtTrainingInfo As DataTable = New DataTable()

        dtTrainingInfo = Session("CandidateTrainingInfo")

        i = e.RowIndex

        dtTrainingInfo.Rows(i).Delete()
        dtTrainingInfo.AcceptChanges()
        grdTraining.DataSource = dtTrainingInfo
        grdTraining.DataBind()

        Dim CandidateID As String
        CandidateID = Session("CandidateID")

        Dim Status As Boolean = clsCanBasicDataAccess.PresentStatus(CandidateID)

        If Status = True Then
            btnSave.Enabled = False
        End If

        If dtTrainingInfo.Rows.Count = 0 Then
            btnSave.Enabled = False
        End If
    End Sub

   
    Protected Sub rdbtnIstrainingExists_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdbtnIstrainingExists.SelectedIndexChanged
        If rdbtnIstrainingExists.SelectedValue = "YES" Then
            pnlCanTrainingInfo.Visible = True
            pnlTrainingGrid.Visible = True
        Else
            pnlCanTrainingInfo.Visible = False
            pnlTrainingGrid.Visible = False
        End If
    End Sub

End Class

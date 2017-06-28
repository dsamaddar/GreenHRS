Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class frmEmpTrainingReport
    Inherits System.Web.UI.Page

    Dim TrngSubData As New clsTrngSubjectDataAccess()
    Dim TrngTypeData As New clsTrainingTypeDataAccess()
    Dim EmpTrngData As New clsEmpTrngDataAccess()
    Dim EmpInfoData As New clsEmployeeInfoDataAccess()

    Protected Sub btnProcessReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcessReport.Click
        Dim TrngInfo As New clsEmpTrngInfo()

        TrngInfo.EmployeeID = drpEmpList.SelectedValue
        TrngInfo.TrngTypeID = drpAvailableTrainingType.SelectedValue
        TrngInfo.TrngSubjectID = drpAvailableTrngSubject.SelectedValue
        TrngInfo.TrngTopicID = ddlTrainingTopic.SelectedValue
        TrngInfo.Country = drpCountry.SelectedValue
        TrngInfo.OrganizedBy = ddlOrganizedBy.SelectedValue

        If txtStartsOn.Text = "" Then
            TrngInfo.StartsOn = "1/1/1900"
        Else
            TrngInfo.StartsOn = Convert.ToDateTime(txtStartsOn.Text)
        End If

        If txtEndsOn.Text = "" Then
            TrngInfo.EndsOn = "1/1/1900"
        Else
            TrngInfo.EndsOn = Convert.ToDateTime(txtEndsOn.Text)
        End If

        TrngInfo.IsCanceled = IIf(drpCanceled.SelectedValue = "0", False, True)

        grdEmpTrngReport.DataSource = EmpTrngData.fnGetTrngReport(TrngInfo)
        grdEmpTrngReport.DataBind()

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowTrngSubList()
            ShowTrngTypeList()
            ShowEmpList()
            getTrainingTopic(drpAvailableTrngSubject.SelectedValue)
            txtStartsOn.Text = "1/1/2000"
            txtEndsOn.Text = Now.Date
        End If
    End Sub

    Protected Sub ShowEmpList()
        drpEmpList.DataTextField = "EmployeeName"
        drpEmpList.DataValueField = "EmployeeID"
        drpEmpList.DataSource = EmpInfoData.fnGetEmployeeList()
        drpEmpList.DataBind()

        Dim A As New ListItem
        A.Text = "N\A"
        A.Value = "N\A"

        drpEmpList.Items.Insert(0, A)
    End Sub

    Protected Sub ShowTrngTypeList()
        drpAvailableTrainingType.DataTextField = "TrngType"
        drpAvailableTrainingType.DataValueField = "TrngTypeID"
        drpAvailableTrainingType.DataSource = TrngTypeData.fnShowTrngType()
        drpAvailableTrainingType.DataBind()

        Dim A As New ListItem
        A.Text = "N\A"
        A.Value = "N\A"

        drpAvailableTrainingType.Items.Insert(0, A)

    End Sub

    Protected Sub ShowTrngSubList()
        drpAvailableTrngSubject.DataTextField = "TrngSubName"
        drpAvailableTrngSubject.DataValueField = "TrngSubjectID"
        drpAvailableTrngSubject.DataSource = TrngSubData.fnShowTrngSubjects()
        drpAvailableTrngSubject.DataBind()

        Dim A As New ListItem
        A.Text = "N\A"
        A.Value = "N\A"

        drpAvailableTrngSubject.Items.Insert(0, A)
    End Sub

    Protected Sub ShowOrganizationList(ByVal CountryName As String)
        ddlOrganizedBy.DataTextField = "OrgName"
        ddlOrganizedBy.DataValueField = "OrganizationID"
        ddlOrganizedBy.DataSource = TrngTypeData.fnShowOrganizationList(CountryName)
        ddlOrganizedBy.DataBind()

        Dim A As New ListItem
        A.Text = "N\A"
        A.Value = "N\A"

        ddlOrganizedBy.Items.Insert(0, A)
    End Sub

    Protected Sub drpAvailableTrngSubject_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpAvailableTrngSubject.SelectedIndexChanged
        getTrainingTopic(drpAvailableTrngSubject.SelectedValue)
    End Sub

    Protected Sub getTrainingTopic(ByVal TrngSubjectID As String)
        ddlTrainingTopic.DataTextField = "TrngTopic"
        ddlTrainingTopic.DataValueField = "TrainingTopicID"
        ddlTrainingTopic.DataSource = TrngTypeData.fnShowTrngTopicBySubjectID(TrngSubjectID)
        ddlTrainingTopic.DataBind()

        Dim A As New ListItem
        A.Text = "N\A"
        A.Value = "N\A"

        ddlTrainingTopic.Items.Insert(0, A)
    End Sub

    Protected Sub drpCountry_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpCountry.SelectedIndexChanged
        ShowOrganizationList(drpCountry.SelectedValue)
    End Sub

    Protected Sub imgBtnExportResult_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnExportResult.Click
        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim TrngInfo As New clsEmpTrngInfo()

        TrngInfo.EmployeeID = drpEmpList.SelectedValue
        TrngInfo.TrngTypeID = drpAvailableTrainingType.SelectedValue
        TrngInfo.TrngSubjectID = drpAvailableTrngSubject.SelectedValue
        TrngInfo.TrngTopicID = IIf(ddlTrainingTopic.Items.Count = 0, "N\A", ddlOrganizedBy.SelectedValue)
        TrngInfo.Country = drpCountry.SelectedValue
        TrngInfo.OrganizedBy = IIf(ddlOrganizedBy.Items.Count = 0, "N\A", ddlOrganizedBy.SelectedValue)
        TrngInfo.StartsOn = IIf(txtStartsOn.Text = "", "1/1/1900", Convert.ToDateTime(txtStartsOn.Text))
        TrngInfo.EndsOn = IIf(txtEndsOn.Text = "", "1/1/1900", Convert.ToDateTime(txtEndsOn.Text))
        TrngInfo.IsCanceled = IIf(drpCanceled.SelectedValue = "0", False, True)

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try
            f = "~/Reports/"
            folder = Server.MapPath(f)
            repName = folder & "TrainingReport.rpt"
            myReport.Load(repName)

            retArr = conStr.Split(";")
            serverArr = retArr(0).Split("=")
            dbArr = retArr(1).Split("=")
            usrArr = retArr(2).Split("=")
            pwdArr = retArr(3).Split("=")

            serverName = serverArr(1)
            uid = usrArr(1)
            pwd = pwdArr(1)
            dbName = dbArr(1)

            myReport.SetDatabaseLogon(uid, pwd, serverName, dbName)

            Dim parameters As CrystalDecisions.Web.Parameter = New CrystalDecisions.Web.Parameter()
            myReport.SetParameterValue("@EmployeeID", TrngInfo.EmployeeID)
            myReport.SetParameterValue("@TrngTypeID", TrngInfo.TrngTypeID)
            myReport.SetParameterValue("@TrngSubjectID", TrngInfo.TrngSubjectID)
            myReport.SetParameterValue("@TrngTopicID", TrngInfo.TrngTopicID)
            myReport.SetParameterValue("@Country", TrngInfo.Country)
            myReport.SetParameterValue("@OrganizedBy", TrngInfo.OrganizedBy)
            myReport.SetParameterValue("@StartsOn", TrngInfo.StartsOn)
            myReport.SetParameterValue("@EndsOn", TrngInfo.EndsOn)
            myReport.SetParameterValue("@IsCanceled", TrngInfo.IsCanceled)
            myReport.ExportToHttpResponse(ExportFormatType.WordForWindows, Response, True, "ExportedReport")
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Response.Redirect("frmEmpTrainingReport.aspx")
    End Sub

End Class

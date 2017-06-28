Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class Recruitment_frmRecProposalMedReport
    Inherits System.Web.UI.Page

    Dim CVSelectionData As New clsCVSelectionDataAccess()
    Dim MedicalOffData As New clsMedOfficerDataAccess()

    Protected Sub btnJoiningLetter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnJoiningLetter.Click
        If hdFldCandidateID.Value = "" Then
            MessageBox("Select A Candidate First.")
            Exit Sub
        End If

        If Trim(txtReferenceNo.Text) = "" Then
            MessageBox("Reference No. Requied.")
            Exit Sub
        End If

        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try
            f = "~/Payroll/Report/"
            folder = Server.MapPath(f)
            repName = folder & "rptJoiningLetter.rpt"
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
            myReport.SetParameterValue("@RefNo", txtReferenceNo.Text)
            myReport.SetParameterValue("@AppointmentRefNo", txtAppointmentRefNo.Text)
            myReport.SetParameterValue("@CandidateID", hdFldCandidateID.Value)
            myReport.ExportToHttpResponse(ExportFormatType.WordForWindows, Response, True, "ExportedReport")
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetFinallySelectedCandidateList()
            ShowMedicalOffList()
        End If
    End Sub

    Protected Sub ShowMedicalOffList()
        drpMedOffList.DataTextField = "MedOfficerName"
        drpMedOffList.DataValueField = "MedOffID"
        drpMedOffList.DataSource = MedicalOffData.fnShowActiveMedicalOffList()
        drpMedOffList.DataBind()
    End Sub

    Protected Sub GetFinallySelectedCandidateList()
        grdInterviewCompletedCandidates.DataSource = CVSelectionData.fnSelectedCandidatesForEmployment()
        grdInterviewCompletedCandidates.DataBind()
    End Sub

    Protected Sub btnProcessMedToEmp_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcessMedToEmp.Click
        If hdFldCandidateID.Value = "" Then
            MessageBox("Select A Candidate First.")
            Exit Sub
        End If

        If Trim(txtReferenceNo.Text) = "" Then
            MessageBox("Reference No. Requied.")
            Exit Sub
        End If

        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try
            f = "~/Payroll/Report/"
            folder = Server.MapPath(f)
            repName = folder & "rptMedExamLetterToEmp.rpt"
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
            myReport.SetParameterValue("@CandidateID", hdFldCandidateID.Value)
            myReport.SetParameterValue("@RefNo", txtReferenceNo.Text)
            myReport.SetParameterValue("@AppointmentRefNo", txtAppointmentRefNo.Text)
            myReport.SetParameterValue("@MedOffID", drpMedOffList.SelectedValue)
            myReport.SetParameterValue("@AppointmentDate", txtAppointmentDate.Text)
            myReport.ExportToHttpResponse(ExportFormatType.WordForWindows, Response, True, "ExportedReport")
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

    Protected Sub btnProcessMedToDoc_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcessMedToDoc.Click
        If hdFldCandidateID.Value = "" Then
            MessageBox("Select A Candidate First.")
            Exit Sub
        End If

        If Trim(txtReferenceNo.Text) = "" Then
            MessageBox("Reference No. Requied.")
            Exit Sub
        End If

        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try
            f = "~/Payroll/Report/"
            folder = Server.MapPath(f)
            repName = folder & "rptMedExamLetterToDoc.rpt"
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
            myReport.SetParameterValue("@CandidateID", hdFldCandidateID.Value)
            myReport.SetParameterValue("@RefNo", txtReferenceNo.Text)
            myReport.SetParameterValue("@AppointmentRefNo", txtAppointmentRefNo.Text)
            myReport.SetParameterValue("@MedOffID", drpMedOffList.SelectedValue)
            myReport.SetParameterValue("@AppointmentDate", txtAppointmentDate.Text)
            myReport.ExportToHttpResponse(ExportFormatType.WordForWindows, Response, True, "ExportedReport")
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub grdInterviewCompletedCandidates_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdInterviewCompletedCandidates.SelectedIndexChanged
        Dim lblCandidateID As New Label()
        lblCandidateID = grdInterviewCompletedCandidates.SelectedRow.FindControl("lblCandidateID")
        hdFldCandidateID.Value = lblCandidateID.Text
    End Sub

End Class

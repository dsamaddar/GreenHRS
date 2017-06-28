Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
Imports System.Net.Mail

Partial Class LeaveManagement_frmEmpAbsentMail
    Inherits System.Web.UI.Page

    Dim EmpData As New clsEmployeeInfoDataAccess()
    Dim ResignationMailData As New clsResignationMailDataAccess()

    Protected Sub chkSelectAll_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim chkSelectAll, chkSelectEmployee As New CheckBox
        chkSelectAll = grdActiveEmpList.HeaderRow.FindControl("chkSelectAll")

        If chkSelectAll.Checked = True Then
            For Each rw As GridViewRow In grdActiveEmpList.Rows
                chkSelectEmployee = rw.FindControl("chkSelectEmployee")
                chkSelectEmployee.Checked = True
            Next
        Else
            For Each rw As GridViewRow In grdActiveEmpList.Rows
                chkSelectEmployee = rw.FindControl("chkSelectEmployee")
                chkSelectEmployee.Checked = False
            Next
        End If
       

    End Sub

    Protected Sub btnSentAbsentMail_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSentAbsentMail.Click
        Dim chkSelectEmployee As New CheckBox
        Dim lblEmployeeID, lblEmpCode, lblEmail, lblEmployeeName As New Label
        Dim StartDate, EndDate As DateTime
        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String
        Dim ExportFileName As String = ""
        Dim InValidEmailStr As String = ""

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        StartDate = Convert.ToDateTime(txtStartDate.Text)
        EndDate = Convert.ToDateTime(txtEndDate.Text)

        For Each rw As GridViewRow In grdActiveEmpList.Rows
            chkSelectEmployee = rw.FindControl("chkSelectEmployee")
            If chkSelectEmployee.Checked = True Then
                lblEmployeeID = rw.FindControl("lblEmployeeID")
                lblEmpCode = rw.FindControl("lblEmpCode")
                lblEmail = rw.FindControl("lblEmail")
                lblEmployeeName = rw.FindControl("lblEmployeeName")

                If lblEmail.Text = "" Then
                    InValidEmailStr += lblEmployeeName.Text
                Else
                    Try
                        f = "~/Reports/"
                        folder = Server.MapPath(f)
                        repName = folder & "EmpAbsentReport.rpt"
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
                        myReport.SetParameterValue("@EmployeeID", lblEmployeeID.Text)
                        myReport.SetParameterValue("@DateFrom", Convert.ToDateTime(StartDate))
                        myReport.SetParameterValue("@DateTo", Convert.ToDateTime(EndDate))

                        ExportFileName = lblEmpCode.Text + "-" + Now.Ticks.ToString() + ".pdf"
                        Dim CrDiskFileDestinationOptions As New DiskFileDestinationOptions
                        CrDiskFileDestinationOptions.DiskFileName = Server.MapPath("~/Attachments/LeaveFile/") + ExportFileName

                        Dim CrExportOptions As New ExportOptions()
                        Dim CrFormatTypeOptions As New PdfRtfWordFormatOptions()
                        CrExportOptions = myReport.ExportOptions
                        CrExportOptions.ExportDestinationType = ExportDestinationType.DiskFile
                        CrExportOptions.ExportFormatType = ExportFormatType.PortableDocFormat
                        CrExportOptions.DestinationOptions = CrDiskFileDestinationOptions
                        CrExportOptions.FormatOptions = CrFormatTypeOptions
                        myReport.Export(CrExportOptions)

                        Dim ResignationMail As clsResignationMail = ResignationMailData.fnGetMailAddressByEmpID(lblEmployeeID.Text)
                        SendMail(lblEmployeeName.Text, ExportFileName, lblEmpCode.Text, lblEmail.Text, ResignationMail.SupervisorMailAdr)

                    Catch ex As Exception
                        MessageBox(ex.Message)
                    End Try

                End If

            End If
        Next

        If InValidEmailStr <> "" Then
            MessageBox("Some Of the Selected Employees Have Invalid Email Address\n" + InValidEmailStr)
        End If


    End Sub

    Protected Sub SendMail(ByVal UserName As String, ByVal FileName As String, ByVal EmpCode As String, ByVal Email As String, ByVal SupervisorMail As String)
        Dim sb As StringBuilder = New StringBuilder()

        Dim mail As New Net.Mail.MailMessage()
        Dim dt As DateTime = Now.Date

        Dim ThisYear As String = Now.Year.ToString()
        Dim NextYear As String = (Now.Year + 1).ToString()

        mail.Bcc.Add("Debayan@ulc.com")
        mail.Bcc.Add("tamim@ulc.com")
        mail.CC.Add(SupervisorMail)
        mail.From = New MailAddress("Career@ulc.com.bd")
        mail.To.Add(Email)
        mail.Subject = "GreenHRS: Absent Report-" + dt.ToString("MMMM") + "," + Now.Year.ToString() + "-" + EmpCode
        Dim at As Attachment = New Attachment(Server.MapPath("~/Attachments/LeaveFile/") + FileName)
        mail.Attachments.Add(at)
        sb.Append("<html><head></head><body><table border=0> <tr><td><b>")
        sb.Append("Dear " + UserName + ",")
        sb.Append("</b></td></br></br></tr>")
        sb.Append("<tr><td></td></tr>")
        sb.Append("<tr><td></td></tr>")
        sb.Append("<tr><td>Please find your absent list attached herewith for the year " + ThisYear + "</td></tr>")
        sb.Append("<tr><td>If you were present on a day which shows you as absent, please send your confirmation to Md. Mozidul Haque, General Admin by 20th January " + NextYear + " (CC to Tamim Ahmed, System Admin).</td></tr>")
        sb.Append("<tr><td>Following documents must be attached along with your reply mail as a confirmation of your presence :</td></tr>")
        sb.Append("<tr><td>1.	Any mail send using your mail ID.</td></tr>")
        sb.Append("<tr><td>OR</td></tr>")
        sb.Append("<tr><td>2.	Any input or approval in NetAp/ECC/Chaser.</td></tr>")
        sb.Append("<tr><td>** After 20th January " + NextYear + ", reconciliation will be closed and  the list will be considered as final absent data and your leave will be accordingly deducted </td></tr>")
        sb.Append("<tr><td></td></tr>")
        sb.Append("<tr><td>")
        sb.Append("</td></br></br></tr>")
        sb.Append("<tr><td></td></tr>")
        sb.Append("<tr><td></td></tr>")
        sb.Append("<tr><td>")
        sb.Append("Regards,</td></tr><tr><td>")
        sb.Append("Human Resource</td></tr>")
        sb.Append("<tr><td>United Finance</td></br></br></tr>")
        sb.Append("</body></html>")
        mail.Body = sb.ToString()
        mail.IsBodyHtml = True
        Dim smtp As New SmtpClient("192.168.1.232", 25)
        smtp.Send(mail)
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub


    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearForm()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetAllActiveEmpList()

            Dim Year As Integer = Now.Year
            txtStartDate.Text = "1/1/" + Year.ToString()
            txtEndDate.Text = Now.Date
        End If
    End Sub

    Protected Sub GetAllActiveEmpList()
        grdActiveEmpList.DataSource = EmpData.fnGetEmpInfoListActive()
        grdActiveEmpList.DataBind()
    End Sub

    Protected Sub ClearForm()
        Dim chkSelectAll, chkSelectEmployee As New CheckBox
        chkSelectAll = grdActiveEmpList.HeaderRow.FindControl("chkSelectAll")

        chkSelectAll.Checked = False

        For Each rw As GridViewRow In grdActiveEmpList.Rows
            chkSelectEmployee = rw.FindControl("chkSelectEmployee")
            chkSelectEmployee.Checked = False
        Next
    End Sub

End Class

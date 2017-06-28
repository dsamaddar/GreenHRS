Imports System.Net.Mail

Partial Class EmployeeInfo_frmEMPJDAcceptance
    Inherits System.Web.UI.Page

    Dim JDData As New clsJobDescriptionDataAccess()
    Dim EmpData As New clsEmployeeInfoDataAccess()
    Dim EmpJDData As New clsEmployeeJDDataAccess()
    Dim EmpJDExceptionData As New clsEmpJDExceptionDataAccess()
    Dim EmpKPIData As New clsEmpKPIDataAccess()
    Dim EmpKeyResData As New clsEmpKeyResDataAccess()
    Dim ResignationMailData As New clsResignationMailDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim JobDescriptionID, EmployeeJDID As String

            JobDescriptionID = Request.QueryString("JobDescriptionID")
            EmployeeJDID = Request.QueryString("EmployeeJDID")

            Session("EmployeeJDID") = EmployeeJDID


            Dim EmpJDException As New clsEmpJDException()
            Dim EmpKeyRes As New clsEmpKeyRes()
            Dim EmpKPI As New clsEmpKPI()

            Dim JobDescription As New clsJobDescription()

            EmpJDException.EmployeeJDID = EmployeeJDID
            EmpJDException.JobDescriptionID = JobDescriptionID

            ShowEmpExceptionInfo(EmpJDException)

            EmpKeyRes.EmployeeJDID = EmployeeJDID
            EmpKeyRes.JobDescriptionID = JobDescriptionID

            ShowEmpKeyResInfo(EmpKeyRes)

            EmpKPI.EmployeeJDID = EmployeeJDID
            EmpKPI.JobDescriptionID = JobDescriptionID

            ShowEmpKPIInfo(EmpKPI)

            Dim EmployeeID As String = ""
            EmployeeID = Session("ToWhomProShow")

            JobDescription = JDData.fnGetJobDescriptionByID(JobDescriptionID)

            lblJDNo.Text = JobDescription.JobDescriptionNo
            lblJobTitle.Text = JobDescription.JobTitle
            lblModifiedDate.Text = JobDescription.LastModifiedDate
            lblJDGoal.Text = JobDescription.JDGoal

            If Session("UniqueUserID") = Session("ToWhomProShow") Then
                btnJDAcc.Enabled = True
            Else
                btnJDAcc.Enabled = False
            End If



            Dim EmpJD As New clsEmployeeJD()
            EmpJD.EmployeeID = EmployeeID
            EmpJD.JobDescriptionID = JobDescriptionID
            Dim IsAccepted As Boolean = EmpJDData.fnEmpJDIsAccepted(EmployeeJDID)

            If IsAccepted = True Then
                btnJDAcc.Enabled = False
                idLabel.Visible = True
                idLabel.Text = "Already Accepted"
            Else
                If Session("UniqueUserID") = Session("ToWhomProShow") Then
                    btnJDAcc.Enabled = True
                End If
                idLabel.Text = ""
                idLabel.Visible = False
            End If

         
        End If
    End Sub

    Protected Sub ShowEmpExceptionInfo(ByVal EmpJDException As clsEmpJDException)
        grdException.DataSource = EmpJDExceptionData.fnShowEmpException(EmpJDException)
        grdException.DataBind()
    End Sub

    Protected Sub ShowEmpKeyResInfo(ByVal EmpKeyRes As clsEmpKeyRes)
        grdKeyResInfo.DataSource = EmpKeyResData.fnShowEmpKeyRes(EmpKeyRes)
        grdKeyResInfo.DataBind()
    End Sub

    Protected Sub ShowEmpKPIInfo(ByVal EmpKPI As clsEmpKPI)
        grdKPI.DataSource = EmpKPIData.fnShowEmpKPI(EmpKPI)
        grdKPI.DataBind()
    End Sub

    Protected Sub btnJDAcc_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnJDAcc.Click
        Dim JobDescriptionID As String

        JobDescriptionID = Request.QueryString("JobDescriptionID")

        Dim EmployeeID As String = ""
        EmployeeID = Session("EmployeeID")

        Dim Check As Integer = EmpData.fnInsertJDAcceptance(Session("EmployeeJDID"), JobDescriptionID, EmployeeID)

        If Check = 1 Then
            MessageBox("Accepted.")
            btnJDAcc.Enabled = False
            idLabel.Visible = True
            idLabel.Text = "Already Accepted"
            SendJDAcceptedMail()
        Else
            MessageBox("Error Found.")
            btnJDAcc.Enabled = True
            idLabel.Text = ""
            idLabel.Visible = False
        End If

    End Sub

    Protected Sub SendJDAcceptedMail()
        Dim sb As StringBuilder = New StringBuilder()
        Dim mail As New Net.Mail.MailMessage()

        Dim ResignationMail As clsResignationMail = ResignationMailData.fnGetMailAddressByEmpID(Session("UniqueUserID"))

        mail.To.Add(ResignationMail.SupervisorMailAdr)
        mail.Bcc.Add("Debayan@ulc.com")
        mail.From = New MailAddress(ResignationMail.EmpMailAdr)
        mail.Subject = "GreenHRS: JD Accepted"
        sb.Append("</br></br><html><head></head>")
        sb.Append(ResignationMail.EmployeeName + " has accepted the assigned JD (" + lblJobTitle.Text + ")")
        sb.Append("</html>")
        mail.Body = sb.ToString()
        mail.IsBodyHtml = True
        Dim smtp As New SmtpClient("192.168.1.242", 25)
        smtp.Send(mail)
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub
End Class

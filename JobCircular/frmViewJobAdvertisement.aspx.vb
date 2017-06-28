Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.OleDb
Imports System.Data.Common
Imports System.IO
Imports System.Math
Imports System.Configuration
Imports System.Web.UI
Imports System.Net.Mail

Partial Class JobCircular_frmViewJobAdvertisement
    Inherits System.Web.UI.Page

    Dim JobCircular As New clsJobCircularDataAccess()
    Dim CanMailInfoData As New clsCandidateMailInfoDataAccess()



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then

            Dim CandidateID As String = ""

            CandidateID = Session("CandidateID")

            If CandidateID = "" Then
                Response.Redirect("~/frmCandidateHome.aspx?flag=1")
            End If

            Dim Check As Boolean = clsCanBasicDataAccess.PresentStatus(CandidateID)

            If Check = False Then
                Response.Redirect("~/frmCandidateHome.aspx?flag=1")
            End If

            Dim dtJobCircular As DataTable = New DataTable()

            dtJobCircular = JobCircular.fnGeAvailableJobs.Tables(0)
            grdJobCircular.DataSource = dtJobCircular
            grdJobCircular.DataBind()

            idAvailableJob.Visible = False

            Dim CircularID As String
            Dim lblCircularID As New System.Web.UI.WebControls.Label
            Dim lblAlreadyApplied As New System.Web.UI.WebControls.Label
            Dim ImageButton2 As New System.Web.UI.WebControls.ImageButton

            For Each rw As GridViewRow In grdJobCircular.Rows


                lblCircularID = rw.FindControl("lblCircularID")
                CircularID = lblCircularID.Text

                ImageButton2 = rw.FindControl("ImageButton2")

                lblAlreadyApplied = rw.FindControl("lblAlreadyApplied")

                Dim count As Integer = clsJobCircularDataAccess.CandidateAppliedJobCount(CircularID, CandidateID)
                If count <> 0 Then
                    ImageButton2.Visible = False
                    'lblAlreadyApplied.Text = "Already Applied"
                    lblAlreadyApplied.Text = "&#x2713"
                    lblAlreadyApplied.Visible = True
                End If

            Next

            'Dim UserID As String
            'Dim CandidateID As String
            'UserID = Session("LoginUserID")
            'CandidateID = Common.GetCandidateID(UserID)


            'Dim countCandidate As Integer = Common.CandidateCount(UserID)

            'If countCandidate = 0 Then
            '    MessageBox("Please Insert your basic information")
            '    Exit Sub
            'Else
            '    Dim Message As String = Common.GetMessage(CandidateID)

            '    If Message <> "N\A" Then
            '        MessageBox(Message)
            '        Exit Sub
            '    End If
            'End If



            'Dim flag As String
            'flag = Request.QueryString("flag")

            'If flag = "1" Then
            '    MessageBox("Already applied for this post")
            'ElseIf flag = "2" Then
            '    MessageBox("Applied Successfully")
            'End If
        End If
    End Sub

    Protected Sub grdJobCircular_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdJobCircular.RowDataBound
        Try
            e.Row.Cells(0).Visible = False
        Catch ex As Exception
        End Try
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub grdJobCircular_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdJobCircular.SelectedIndexChanged
        'Dim CircularID As String
        'CircularID = Request.QueryString("CircularID")
        Dim RegistrationID As String
        RegistrationID = Session("RegistrationID")


        Dim lblCircularID As New System.Web.UI.WebControls.Label()
        lblCircularID = grdJobCircular.SelectedRow.FindControl("lblCircularID")


        Dim UserID As String

        Dim CircularIDForApplying As String
        CircularIDForApplying = lblCircularID.Text

        Dim CandidateID As String
        Dim flag As Double = 0
        UserID = Session("LoginUserID")
        'CircularID = Request.QueryString("CircularID")
        CandidateID = Common.GetCandidateID(RegistrationID)


        Dim Status As Boolean = clsCanBasicDataAccess.PresentStatus(CandidateID)

        If Status = False Then
            MessageBox("Please Submit Your Profile")
            Exit Sub
        End If


        Dim count As Integer = clsJobCircularDataAccess.CandidateAppliedJobCount(CircularIDForApplying, CandidateID)

        If count <> 0 Then
            MessageBox("Already applied for this post")
        Else

            Dim countCandidate As Integer = Common.CandidateCount(RegistrationID)

            If countCandidate = 0 Then
                MessageBox("Please Insert your basic information")
                Exit Sub
            Else
                Dim Message As String = Common.GetMessage(CandidateID)

                If Message <> "" Then
                    MessageBox(Message)
                    Exit Sub
                End If
            End If


            Dim Check As Integer = JobCircular.ApplyJobInsert(CircularIDForApplying, CandidateID, UserID)
            If Check = 1 Then
                MessageBox("Applied Successfully")
                Dim dtJobCircular As DataTable = New DataTable()

                dtJobCircular = JobCircular.fnGeAvailableJobs.Tables(0)
                grdJobCircular.DataSource = dtJobCircular
                grdJobCircular.DataBind()

                'Dim CircularID As String
                'Dim lblCircularID As New System.Web.UI.WebControls.Label
                Dim lblAlreadyApplied As New System.Web.UI.WebControls.Label
                Dim ImageButton2 As New System.Web.UI.WebControls.ImageButton
                Dim CircularID As String

                For Each rw As GridViewRow In grdJobCircular.Rows


                    lblCircularID = rw.FindControl("lblCircularID")
                    CircularID = lblCircularID.Text

                    ImageButton2 = rw.FindControl("ImageButton2")

                    lblAlreadyApplied = rw.FindControl("lblAlreadyApplied")

                    count = clsJobCircularDataAccess.CandidateAppliedJobCount(CircularID, CandidateID)
                    If count <> 0 Then
                        ImageButton2.Visible = False
                        'lblAlreadyApplied.Text = "Already Applied"
                        lblAlreadyApplied.Text = "&#x2713"
                        lblAlreadyApplied.Visible = True
                    End If

                Next

                Dim CanMailInfo As clsCandidateMailInfo = CanMailInfoData.fnGetCanMailingInfoAfterAppJob(CandidateID, CircularIDForApplying)

                Dim CandidateName As String = CanMailInfo.CandidateName
                Dim CandidateEmailAddr As String = CanMailInfo.Email
                Dim CandidateAltEmailAddr As String = CanMailInfo.AlternateEmail
                Dim CircularCode As String = CanMailInfo.CircularCode
                Dim Title As String = CanMailInfo.Title

                Dim sb As StringBuilder = New StringBuilder()
                Dim mail As New Net.Mail.MailMessage()
                If CandidateEmailAddr <> "" Then ' Original E-Mail Addr
                    mail.To.Add(CandidateEmailAddr)
                End If
                If CandidateAltEmailAddr <> "" Then ' Alternate E-Mail Addr
                    mail.To.Add(CandidateAltEmailAddr)
                End If
                mail.Bcc.Add("Debayan@ulc.com")
                mail.Bcc.Add("tahmed1@ulc.com")
                mail.From = New MailAddress("Career@ulc.com.bd")
                mail.Subject = "United Leasing Recruitment Services"
                sb.Append("<html><head></head><body><table border=0> <tr><td><b>")
                sb.Append("Dear " + CandidateName + ",")
                sb.Append("</b></td></br></br></tr>")
                sb.Append("<tr><td></td></tr>")
                sb.Append("<tr><td></td></tr>")
                sb.Append("<tr><td>")
                sb.Append("Thank you for your application to Job # <b>" + CircularCode + "</b> for the position of title <b>" + Title + "</b>.</br>")
                sb.Append("This is to confirm that your application was received and is being reviewed with regards to this vacancy.")
                sb.Append("</td></br></br></tr>")
                sb.Append("<tr><td></td></tr>")
                sb.Append("<tr><td></td></tr>")
                sb.Append("<tr><td>")
                sb.Append("Regards,</td></tr><tr><td>")
                sb.Append("Human Resource</td></tr>")
                sb.Append("<tr><td>United Finance</td></br></br></tr>")
                sb.Append("<tr><td></td></tr>")
                sb.Append("<tr><td><b>NOTE: THIS MESSAGE IS SYSTEM GENERATED.  YOU CANNOT REPLY TO THIS MESSAGE.</b></td></tr>")
                sb.Append("</body></html>")
                mail.Body = sb.ToString()
                mail.IsBodyHtml = True
                Dim smtp As New SmtpClient("192.168.1.242", 25)
                smtp.Send(mail)


            Else
                MessageBox("Error Found.")
            End If
        End If
    End Sub

    Protected Sub rdoInterested_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdoInterested.SelectedIndexChanged
        If rdoInterested.SelectedValue = "Interested" Then
            idAvailableJob.Visible = True
        Else
            idAvailableJob.Visible = False
        End If
    End Sub
End Class

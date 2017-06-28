Imports System
Imports System.IO
Imports System.Drawing
Imports System.Net.Mail

Partial Class Mail_MailSend
    Inherits System.Web.UI.Page

    Dim MailSettingsData As New clsMailSettingsDataAccess()

    Protected Sub btnGenerate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGenerate.Click
        'ForDesignationChange()
        'SendMailForJoining()
        HappyNewsForNewBorn()
    End Sub

    Protected Sub HappyNewsForNewBorn()
        Dim MailProperty As New clsMailProperty()
        Dim SendMail As New clsMail()

        ' Dim UserID As String = Session("LoginUserID")

        MailProperty = MailSettingsData.fnGetPropertyByType("MAIL-TYPE-00000002")

        Dim sb As StringBuilder = New StringBuilder()
        Dim mail As New Net.Mail.MailMessage()


        Dim strForTo As String
        Dim strArrForTo() As String
        Dim count As Integer
        strForTo = MailProperty.MailTo.Replace(" ", "")
        strArrForTo = strForTo.Split(";")
        For count = 0 To strArrForTo.Length - 1
            If strArrForTo(count) <> "" Then
                mail.To.Add(strArrForTo(count))
            End If
        Next


        Dim strForBCC As String
        Dim strArrForBCC() As String
        Dim countBCC As Integer
        strForBCC = MailProperty.MailBCC.Replace(" ", "")
        strArrForBCC = strForBCC.Split(";")
        For countBCC = 0 To strArrForBCC.Length - 1
            If strArrForBCC(countBCC) <> "" Then
                mail.Bcc.Add(strArrForBCC(countBCC))
            End If
        Next

        Dim strForCC As String
        Dim strArrForCC() As String
        Dim countCC As Integer
        strForCC = MailProperty.MailCC.Replace(" ", "")
        strArrForCC = strForCC.Split(";")
        For countCC = 0 To strArrForCC.Length - 1
            If strArrForCC(countCC) <> "" Then
                mail.CC.Add(strArrForCC(countCC))
            End If
        Next


        Dim chk As System.Web.UI.WebControls.CheckBox
        Dim lblMailID As System.Web.UI.WebControls.Label
        Dim lblEmployeeID As System.Web.UI.WebControls.Label
        Dim MailID As String = ""
        Dim EmployeeID As String
        Dim Information As String = ""


        mail.From = New MailAddress(MailProperty.MailFrom)
        mail.Subject = MailProperty.MailSubject
        'sb.Append("Dear All,</br></br>")
        sb.Append("<html><head></head>")
        sb.Append("<body>")
       

        For Each rw As GridViewRow In grdSendMail.Rows
            chk = rw.FindControl("chkSelect")
            If chk.Checked = True Then
                lblMailID = rw.FindControl("lblMailID")
                MailID = lblMailID.Text
                lblEmployeeID = rw.FindControl("lblEmployeeID")
                EmployeeID = lblEmployeeID.Text

                SendMail = MailSettingsData.fnGetInfoMailNewBornBaby(MailID, EmployeeID)

                sb.Append("<table border=0>")

                sb.Append("<tr><td align='center'><b>" + MailProperty.MailHeader + "</b></td></tr>")
                sb.Append("<tr><td>Dear All,</br></br></td></tr>")
                sb.Append("<tr>")
                sb.Append("<td>")
                sb.Append("<b>" + SendMail.EmployeeName + "</b>")
                sb.Append("   (  " + SendMail.OfficialDesignationName + "  , " + SendMail.ULCBranchName + " )  and ")
                sb.Append("<b>" + SendMail.SpouseName + "</b>")
                sb.Append(" has become parent of a baby (" + SendMail.Gender + ")  on " + SendMail.DateOfBirth)
                sb.Append("</br>")
                sb.Append("Both (mother & baby) are fine.")
                sb.Append("</td></tr>")
                sb.Append("<tr><td></td></tr>")
                sb.Append("</table>")

            End If
        Next

        sb.Append("<table border=0> <tr><td></br>")
        sb.Append("Best Regards,</td></tr><tr><td>")
        sb.Append("Human Resource</td></tr>")
        sb.Append("<tr><td>United Finance</td></tr>")
        sb.Append("<tr><td></td></tr>")
        sb.Append("</table>")

        sb.Append("</body>")
        sb.Append("</html>")
        mail.Body = sb.ToString()
        mail.IsBodyHtml = True
        Dim smtp As New SmtpClient("192.168.1.242", 25)
        smtp.Send(mail)
    End Sub

    Protected Sub ForDesignationChange()
        Dim MailProperty As New clsMailProperty()
        Dim SendMail As New clsMail()

        ' Dim UserID As String = Session("LoginUserID")

        MailProperty = MailSettingsData.fnGetPropertyByType("MAIL-TYPE-00000003")

        Dim sb As StringBuilder = New StringBuilder()
        Dim mail As New Net.Mail.MailMessage()


        Dim strForTo As String
        Dim strArrForTo() As String
        Dim count As Integer
        strForTo = MailProperty.MailTo.Replace(" ", "")
        strArrForTo = strForTo.Split(";")
        For count = 0 To strArrForTo.Length - 1
            If strArrForTo(count) <> "" Then
                mail.To.Add(strArrForTo(count))
            End If
        Next


        Dim strForBCC As String
        Dim strArrForBCC() As String
        Dim countBCC As Integer
        strForBCC = MailProperty.MailBCC.Replace(" ", "")
        strArrForBCC = strForBCC.Split(";")
        For countBCC = 0 To strArrForBCC.Length - 1
            If strArrForBCC(countBCC) <> "" Then
                mail.Bcc.Add(strArrForBCC(countBCC))
            End If
        Next

        Dim strForCC As String
        Dim strArrForCC() As String
        Dim countCC As Integer
        strForCC = MailProperty.MailCC.Replace(" ", "")
        strArrForCC = strForCC.Split(";")
        For countCC = 0 To strArrForCC.Length - 1
            If strArrForCC(countCC) <> "" Then
                mail.CC.Add(strArrForCC(countCC))
            End If
        Next


        Dim chk As System.Web.UI.WebControls.CheckBox
        Dim lblMailID As System.Web.UI.WebControls.Label
        Dim lblEmployeeID As System.Web.UI.WebControls.Label
        Dim MailID As String = ""
        Dim EmployeeID As String
        Dim Information As String = ""


        mail.From = New MailAddress(MailProperty.MailFrom)
        mail.Subject = MailProperty.MailSubject
        sb.Append(MailProperty.MailHeader)
        sb.Append("</br></br>")
        sb.Append("<html><head></head>")
        sb.Append("<body>")
        sb.Append("<table style='border-width:2px;border-style:solid' >")
        sb.Append("<tr>")
        sb.Append("<th>Photos</th>")
        sb.Append("<th>Name</th>")
        sb.Append("<th>Previous Functional Designation</th>")
        sb.Append("<th>New Functional Designation</th>")
        sb.Append("<th>Effective Date</th>")
        sb.Append("</tr>")
        sb.Append("<tr>")

        For Each rw As GridViewRow In grdSendMail.Rows
            chk = rw.FindControl("chkSelect")
            If chk.Checked = True Then
                lblMailID = rw.FindControl("lblMailID")
                MailID = lblMailID.Text
                lblEmployeeID = rw.FindControl("lblEmployeeID")
                EmployeeID = lblEmployeeID.Text

                SendMail = MailSettingsData.fnGetInfoMailDesigChange(MailID, EmployeeID)

                sb.Append("<td>")
                sb.Append(" <img src ='../Attachments/" & SendMail.Photos & "'  width ='150px'/>")
                sb.Append("</td>")

                sb.Append("<td>")
                sb.Append("" & SendMail.EmployeeName & "")
                sb.Append("</td>")

                sb.Append("<td>")
                sb.Append("" & SendMail.OldDesigName & "")
                sb.Append("</td>")

                sb.Append("<td>")
                sb.Append("" & SendMail.NewDesigName & "")
                sb.Append("</td>")
 
                sb.Append("<td>")
                sb.Append("" & SendMail.EffectiveDate & "")
                sb.Append("</td>")

                sb.Append("</tr>")

            End If
        Next
        sb.Append("</table>")
        sb.Append("</body>")
        sb.Append("</html>")
        mail.Body = sb.ToString()
        mail.IsBodyHtml = True
        Dim smtp As New SmtpClient("192.168.1.242", 25)
        smtp.Send(mail)
    End Sub

    Protected Sub SendMailForJoining()
        Dim MailProperty As New clsMailProperty()
        Dim SendMail As New clsMail()

        ' Dim UserID As String = Session("LoginUserID")

        MailProperty = MailSettingsData.fnGetPropertyByType("MAIL-TYPE-00000001")

        Dim sb As StringBuilder = New StringBuilder()
        Dim mail As New Net.Mail.MailMessage()


        Dim strForTo As String
        Dim strArrForTo() As String
        Dim count As Integer
        strForTo = MailProperty.MailTo.Replace(" ", "")
        strArrForTo = strForTo.Split(";")
        For count = 0 To strArrForTo.Length - 1
            If strArrForTo(count) <> "" Then
                mail.To.Add(strArrForTo(count))
            End If
        Next


        Dim strForBCC As String
        Dim strArrForBCC() As String
        Dim countBCC As Integer
        strForBCC = MailProperty.MailBCC.Replace(" ", "")
        strArrForBCC = strForBCC.Split(";")
        For countBCC = 0 To strArrForBCC.Length - 1
            If strArrForBCC(countBCC) <> "" Then
                mail.Bcc.Add(strArrForBCC(countBCC))
            End If
        Next

        Dim strForCC As String
        Dim strArrForCC() As String
        Dim countCC As Integer
        strForCC = MailProperty.MailCC.Replace(" ", "")
        strArrForCC = strForCC.Split(";")
        For countCC = 0 To strArrForCC.Length - 1
            If strArrForCC(countCC) <> "" Then
                mail.CC.Add(strArrForCC(countCC))
            End If
        Next


        Dim chk As System.Web.UI.WebControls.CheckBox
        Dim lblMailID As System.Web.UI.WebControls.Label
        Dim lblEmployeeID As System.Web.UI.WebControls.Label
        Dim MailID As String = ""
        Dim EmployeeID As String
        Dim Information As String = ""


        mail.From = New MailAddress(MailProperty.MailFrom)
        mail.Subject = MailProperty.MailSubject
        sb.Append(MailProperty.MailHeader)
        sb.Append("</br></br>")
        sb.Append("<html><head></head>")
        sb.Append("<body>")
        sb.Append("<table style='border-width:2px;border-style:solid' >")
        sb.Append("<tr>")
        sb.Append("<th>Photos</th>")
        sb.Append("<th>Details</th>")
        sb.Append("<th>Joining Date</th>")
        sb.Append("</tr>")
        sb.Append("<tr>")

        For Each rw As GridViewRow In grdSendMail.Rows
            chk = rw.FindControl("chkSelect")
            If chk.Checked = True Then
                lblMailID = rw.FindControl("lblMailID")
                MailID = lblMailID.Text
                lblEmployeeID = rw.FindControl("lblEmployeeID")
                EmployeeID = lblEmployeeID.Text

                SendMail = MailSettingsData.fnGetInformationToSendMail(MailID, EmployeeID)

                sb.Append("<td>")
                sb.Append(" <img src ='../Attachments/" & SendMail.Photos & "'  width ='150px'/>")
                sb.Append("</td>")

                sb.Append("<td>")
                sb.Append("<table id='tblMail' runat='server'>")
                sb.Append("<tr>")
                sb.Append("<td>")
                sb.Append("<b>Name:</b>")
                sb.Append("</td>")
                sb.Append("<td>")
                sb.Append("" & SendMail.EmployeeName & "")
                sb.Append("</td>")
                sb.Append("</tr>")
                sb.Append("<tr>")
                sb.Append("<td>")
                sb.Append("<b>Department:</b>")
                sb.Append("</td>")
                sb.Append("<td>")
                sb.Append("" & SendMail.DeptName & "")
                sb.Append("</td>")
                sb.Append("</tr>")
                sb.Append("<tr>")
                sb.Append("<td>")
                sb.Append("<b>Designation:</b>")
                sb.Append("</td>")
                sb.Append("<td>")
                sb.Append("" & SendMail.OfficialDesignationName & "")
                sb.Append("</td>")
                sb.Append("</tr>")
                sb.Append("</table>")
                sb.Append("</td>")

                sb.Append("<td>")
                sb.Append("" & SendMail.JoiningDate & "")
                sb.Append("</td>")

                sb.Append("</tr>")

            End If
        Next
        sb.Append("</table>")
        sb.Append("</body>")
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetListForSendMail()
        End If
    End Sub

    Protected Sub GetListForSendMail()
        grdSendMail.DataSource = MailSettingsData.fnGeListToSendMail()
        grdSendMail.DataBind()
    End Sub
End Class

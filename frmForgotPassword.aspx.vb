Imports System
Imports System.IO
Imports System.Drawing
Imports System.Net.Mail


Partial Class frmForgotPassword
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        If drpDay.SelectedValue = "DD" Or drpMonth.SelectedValue = "MM" Or drpYear.SelectedValue = "YYYY" Then
            MessageBox("Select Date Parameter Correctly.")
            Exit Sub
        End If

        If txtValidationCode.Text <> Session("FgtCheckCode") Then
            txtValidationCode.Text = ""
            MessageBox("Invalid Code.")
            Exit Sub
        End If


        Dim UserID As String = ""
        Dim Password As String = ""
        Dim Name As String = ""
        Dim EmailToMail As String = ""
        Dim AltEmail As String = ""
        Dim Email As String = txtMailAddress.Text
        Dim DOB As DateTime = drpMonth.SelectedValue + "/" + drpDay.SelectedValue + "/" + drpYear.SelectedValue

        Common.fnForgetPassword(Email, DOB, UserID, Password, Name, EmailToMail, AltEmail)

        If UserID = "" And Password = "" Then
            MessageBox("No Information Found Related to This Query")
            Exit Sub
        Else
            lblMsg.Text = "Dear " + Name + ",  Your UserID = <b style=""color: red; font-weight: bold;"">" + UserID + "</b>  and  Password = <b style=""color: red; font-weight: bold;"">" + Password + "</b>"
            pnlUserIDPasswdRetrieve.Visible = False
            pnlMessageForUser.Visible = True

            Dim sb As StringBuilder = New StringBuilder()
            Dim mail As New Net.Mail.MailMessage()
            If EmailToMail <> "" Then ' Original E-Mail Addr
                mail.To.Add(EmailToMail)
            End If
            If AltEmail <> "" Then ' Alternate E-Mail Addr
                mail.To.Add(AltEmail)
            End If
            mail.Bcc.Add("Debayan@ulc.com")
            mail.Bcc.Add("tahmed1@ulc.com")
            mail.From = New MailAddress("Career@ulc.com.bd")
            mail.Subject = "United Leasing Recruitment Services"
            sb.Append("<html><head></head><body><table border=0> <tr><td><b>")
            sb.Append("Dear " + Name + ",")
            sb.Append("</b></td></br></br></tr>")
            sb.Append("<tr><td></td></tr>")
            sb.Append("<tr><td></td></tr>")
            sb.Append("<tr><td>")
            sb.Append("Your UserID is <b style=""color: red; font-weight: bold;"">" + UserID + "</b>  and  Password is <b style=""color: red; font-weight: bold;"">" + Password + "</b>.</br>")
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

        End If

    End Sub

    Protected Function CreateRandomCode(ByVal CodeCount As Integer) As String
        Dim allChar As String = "0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,!,@,#,$,%,&,*,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z"
        Dim allCharArray() As String = allChar.Split(",")
        Dim RandomCode As String = ""
        Dim t As Integer = 0
        Dim rand As Random = New Random()

        For i = 0 To CodeCount - 1
            t = rand.Next(69)
            RandomCode += allCharArray(t)
        Next

        Return RandomCode
    End Function

    Protected Sub CreateImage(ByVal CheckCode As String)
        Dim image As System.Drawing.Bitmap = New System.Drawing.Bitmap(Convert.ToInt32(CheckCode.Length * 30), 50)
        Dim g As Graphics = Graphics.FromImage(image)

        Try
            'Dim font As Font = New System.Drawing.Font("Critical Mass", 25, System.Drawing.FontStyle.Italic)
            Dim font As Font = New System.Drawing.Font("Verdana", 25, System.Drawing.FontStyle.Italic)
            Dim brush As System.Drawing.Drawing2D.LinearGradientBrush = New System.Drawing.Drawing2D.LinearGradientBrush(New Rectangle(0, 0, image.Width, image.Height), Color.Blue, Color.DarkRed, 1.2F, True)
            g.DrawString(CheckCode, font, New SolidBrush(Color.Red), 2, 2)

            g.DrawRectangle(New Pen(Color.Silver), 0, 0, image.Width - 1, image.Height - 1)

            Dim ms As System.IO.MemoryStream = New System.IO.MemoryStream()

            Dim ImageName As String = "C-" + Now.Ticks.ToString()

            Dim saveImagePath As String = Server.MapPath("Sources/Code/") + ImageName + ".Gif"
            image.Save(saveImagePath)

            If File.Exists(saveImagePath) Then
                imgValidation.ImageUrl = "~/Sources/Code/" + ImageName + ".Gif"
            Else
                MessageBox("File Not Found.")
            End If

            'Response.ClearContent()
            'Response.ContentType = "image/Gif"
            'Response.BinaryWrite(ms.ToArray())

        Catch ex As Exception
            MessageBox(ex.Message)
        Finally
            g.Dispose()
            image.Dispose()
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("FgtCheckCode") = ""
            Dim CheckCode As String = CreateRandomCode(8)
            Session("FgtCheckCode") = CheckCode
            CreateImage(CheckCode)
            SetFocus(txtMailAddress)
        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub


    Protected Sub imgBtnRefreshCode_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnRefreshCode.Click
        ForRefereshing()
    End Sub

    Protected Sub ForRefereshing()
        Dim CheckCode As String = CreateRandomCode(8)
        Session("FgtCheckCode") = CheckCode
        CreateImage(CheckCode)
    End Sub

End Class

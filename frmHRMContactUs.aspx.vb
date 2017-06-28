Imports System
Imports System.IO
Imports System.Drawing
Imports System.Net.Mail


Partial Class frmHRMContactUs
    Inherits System.Web.UI.Page

    Dim ContactUsData As New clsContactUsDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If
        If Not IsPostBack Then
            Dim CheckCode As String = CreateRandomCode(6)
            Session("CheckCode") = CheckCode
            CreateImage(CheckCode)
            SetFocus(txtName)
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
        Dim CheckCode As String = CreateRandomCode(6)
        Session("CheckCode") = CheckCode
        CreateImage(CheckCode)
    End Sub

    Protected Sub ClearData()
        txtName.Text = ""
        txtEmailAddress.Text = ""
        txtPhoneNumber.Text = ""
        txtImageCode.Text = ""
        txtMessage.Text = ""

        ForRefereshing()
    End Sub

    Protected Sub imgBtnSendMessage_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnSendMessage.Click
        Dim ContactUs As New clsContactUs()

        Dim UserID As String = Session("LoginUserID")

        ContactUs.Name = txtName.Text
        ContactUs.Email = txtEmailAddress.Text
        ContactUs.PhoneNo = txtPhoneNumber.Text
        ContactUs.ValidationCode = txtImageCode.Text
        If txtImageCode.Text <> Session("CheckCode") Then
            txtImageCode.Text = ""
            MessageBox("Invalid Code.")
            Exit Sub
        End If

        ContactUs.Message = Common.CheckAsciiValue(txtMessage.Text)
        ContactUs.EntryBy = UserID

        Dim Check As Integer = ContactUsData.fnInsertContactUsInfo(ContactUs)

        If Check = 1 Then
            MessageBox("Thanks for your comments / observations.")
            Dim sb As StringBuilder = New StringBuilder()
            Dim mail As New Net.Mail.MailMessage()

            mail.To.Add("Career@ulc.com.bd")
            mail.To.Add("mmumu@ulc.com")
            mail.To.Add("mbrashid@ulc.com")
            mail.Bcc.Add("Debayan@ulc.com")
            mail.From = New MailAddress(ContactUs.Email)
            mail.Subject = "Candidate Query In ULC's Job Application Process:"
            sb.Append("Message From Candidate:</br></br><html><head></head><table style='border-width:2px;border-style:solid' >")
            sb.Append("<tr>")
            sb.Append("<th>Name</th>")
            sb.Append("<th>Email</th>")
            sb.Append("<th>Phone</th>")
            sb.Append("<th>Message</th>")
            sb.Append("</tr>")
            sb.Append("<tr><td></td><td></td><td></td><td></td></tr>")
            sb.Append("<tr><td>" + ContactUs.Name + "</td>")
            sb.Append("<td>" + ContactUs.Email + "</td>")
            sb.Append("<td>" + ContactUs.PhoneNo + "</td>")
            sb.Append("<td>" + ContactUs.Message + "</td></tr>")
            sb.Append("<tr><td></td><td></td><td></td><td></td></tr>")
            sb.Append("</table>")
            sb.Append("</html>")
            mail.Body = sb.ToString()
            mail.IsBodyHtml = True
            Dim smtp As New SmtpClient("192.168.1.242", 25)
            smtp.Send(mail)
            ClearData()
        Else
            MessageBox("Error Found.")
        End If
    End Sub

End Class

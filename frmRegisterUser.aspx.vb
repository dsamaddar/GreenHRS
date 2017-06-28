Imports System
Imports System.IO
Imports System.Drawing

Partial Class frmRegisterUser
    Inherits System.Web.UI.Page

    Dim RegisterData As New clsRegisterDataAccess()

    Protected Sub txtUserID_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtUserID.TextChanged
        Dim Check As Boolean = RegisterData.fnChkDuplicateUserID(txtUserID.Text)

        If Check = True Then
            txtUserID.Text = ""
            MessageBox("UserID already Exists.")
            txtUserID.Focus()
        Else
            txtPassword.Focus()
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

            Dim ImageName As String = Now.Ticks.ToString()
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

            Dim CheckCode As String = CreateRandomCode(8)
            Session("CheckCode") = CheckCode
            CreateImage(CheckCode)

            pnlRegistrationInstruction.Visible = False

            'txtImageCode.Text = Session("CheckCode")
            'imgValidation.ImageUrl = Server.MapPath("~Sources/Code/") + "634876421893967619.Gif"
        End If

        txtConfirmPassword.Attributes.Add("onpaste", "JavaScript: DisableCopyPaste();")
        txtPassword.Attributes.Add("oncopy", "JavaScript: DisableCopyPaste();")

    End Sub

    Protected Sub btnRegister_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRegister.Click

        lblRegistrationInstrcution.Text = ""

        txtUserID.Text = Trim(txtUserID.Text)
        txtPassword.Text = Trim(txtPassword.Text)
        txtConfirmPassword.Text = Trim(txtConfirmPassword.Text)

        If txtPassword.Text = "" Or txtConfirmPassword.Text = "" Or txtUserID.Text = "" Then
            MessageBox("UserID Or Password Field Can't be Left Blank.")
            Exit Sub
        End If

        If txtUserID.Text.Contains(" ") Then
            MessageBox("Avoid Using Blank Spaces In UserID")
            txtUserID.Text = ""
            Exit Sub
        End If

        If txtPassword.Text.Contains(" ") Then
            MessageBox("Avoid Using Blank Spaces In Password")
            txtPassword.Text = ""
            Exit Sub
        End If

        If txtUserID.Text.Length < 6 Or txtUserID.Text.Length > 15 Then
            txtUserID.Text = ""
            MessageBox("User ID Length Must Be Between 6 to 15.")
            Exit Sub
        End If

        If txtPassword.Text.Length < 6 Or txtPassword.Text.Length > 15 Then
            txtPassword.Text = ""
            txtConfirmPassword.Text = ""
            MessageBox("Password Length Must Be Between 6 to 15.")
            Exit Sub
        End If

        If txtPassword.Text <> txtConfirmPassword.Text Then
            txtPassword.Text = ""
            txtConfirmPassword.Text = ""
            MessageBox("Password Mismatch. Input Correctly.")
        End If

        If txtImageCode.Text <> Session("CheckCode") Then
            txtImageCode.Text = ""
            MessageBox("Invalid Code.")
            Exit Sub
        End If

        If drpDay.SelectedValue = "DD" Or drpMonth.SelectedValue = "MM" Or drpYear.SelectedValue = "YYYY" Then
            MessageBox("Select Date Parameter Correctly.")
            Exit Sub
        End If

        Dim CheckB As Boolean = RegisterData.fnChkDuplicateUserID(txtUserID.Text)

        If CheckB = True Then
            txtUserID.Text = ""
            MessageBox("UserID already Exists.")
            txtUserID.Focus()
            Exit Sub
        End If

        Dim CheckC As Boolean = RegisterData.fnChkDuplicateNID(txtNationalID.Text)

        If CheckC = True Then
            txtNationalID.Text = ""
            MessageBox("National ID/Birth Registration ID already Exists.")
            txtNationalID.Focus()
            Exit Sub
        End If

        Dim Register As New clsRegister()

        Register.UserName = Trim(txtUserName.Text)
        Register.UserID = Trim(txtUserID.Text)
        Register.Password = txtPassword.Text
        Register.Email = txtEMail.Text
        Register.DateOfBirth = drpMonth.SelectedValue + "/" + drpDay.SelectedValue + "/" + drpYear.SelectedValue
        Register.MobileNumber = txtMobileNumberPrefix.Text + txtMobileNumber.Text
        Register.ValidationCode = Session("CheckCode").ToString()

        If txtNationalID.Text = "" Then
            Register.NationalID = "N\A"
        Else
            Register.NationalID = txtNationalID.Text
        End If

        Dim check As Integer = RegisterData.fnInsertRegistrationInfo(Register)

        If check = 1 Then
            MessageBox("Registered Successfully.")
            ClearRegInfo()
            lblRegistrationInstrcution.Text = "Dear " + Register.UserName + " , Congratulations for your new user id. To apply for a job, please login below to create a new job application."
            pnlRegistrationInstruction.Visible = True
            pnlRegisterUser.Visible = False
            'Response.Redirect("~/Login.aspx")
        Else
            MessageBox("Error Found.")
        End If


    End Sub

    Protected Sub ClearRegInfo()
        txtUserID.Text = ""
        txtUserName.Text = ""
        txtPassword.Text = ""
        txtConfirmPassword.Text = ""
        txtEMail.Text = ""
        txtNationalID.Text = ""
        txtMobileNumber.Text = ""
        drpDay.SelectedIndex = -1
        drpMonth.SelectedIndex = -1
        drpYear.SelectedIndex = -1
        txtImageCode.Text = ""
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub txtConfirmPassword_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtConfirmPassword.TextChanged
        'If txtPassword.Text <> txtConfirmPassword.Text Then
        '    txtConfirmPassword.Text = ""
        '    MessageBox("Password Mismatch. Input Correctly.")
        'End If
    End Sub

    Protected Sub imgBtnRefreshCode_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnRefreshCode.Click
        Dim CheckCode As String = CreateRandomCode(8)
        Session("CheckCode") = CheckCode
        CreateImage(CheckCode)

        'txtImageCode.Text = Session("CheckCode")
    End Sub
End Class

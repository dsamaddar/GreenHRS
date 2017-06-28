Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
Imports System.Net.Mail

Partial Class LeaveManagement_frmEmpPrimaryWarningAbsentMail
    Inherits System.Web.UI.Page

    Dim EmpData As New clsEmployeeInfoDataAccess()
    Dim ResignationMailData As New clsResignationMailDataAccess()
    Dim UserAttData As New clsUserAttendanceDataAccess()

    Protected Sub chkSelectAll_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim chkSelectAll, chkSelectEmployee As New CheckBox
        chkSelectAll = grdTodaysAbsentEmpList.HeaderRow.FindControl("chkSelectAll")

        If chkSelectAll.Checked = True Then
            For Each rw As GridViewRow In grdTodaysAbsentEmpList.Rows
                chkSelectEmployee = rw.FindControl("chkSelectEmployee")
                chkSelectEmployee.Checked = True
            Next
        Else
            For Each rw As GridViewRow In grdTodaysAbsentEmpList.Rows
                chkSelectEmployee = rw.FindControl("chkSelectEmployee")
                chkSelectEmployee.Checked = False
            Next
        End If
    End Sub

    Protected Sub btnSentAbsentMail_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSentAbsentMail.Click

        Dim chkSelectEmployee As New CheckBox
        Dim lblEmployeeID As New Label
        Dim MailProp As New clsMailProperty()
        Dim Exists As Boolean = False

        For Each rw As GridViewRow In grdTodaysAbsentEmpList.Rows
            chkSelectEmployee = rw.FindControl("chkSelectEmployee")
            If chkSelectEmployee.Checked = True Then
                lblEmployeeID = rw.FindControl("lblEmployeeID")
                MailProp = UserAttData.fnGetMailForPrimaryWarningAbs(lblEmployeeID.Text)
                SendMail(MailProp)
                Exists = True
                chkSelectEmployee.Checked = False
            End If
        Next

        If Exists = False Then
            MessageBox("Select An Employee First.")
        Else
            MessageBox("Mail Sent Successfully.")
        End If

    End Sub

    Protected Sub SendMail(ByVal MailProp As clsMailProperty)
        Dim mail As New Net.Mail.MailMessage()
        Dim TestArray() As String

        Try
            mail.From = New MailAddress(MailProp.MailFrom)

            TestArray = Split(MailProp.MailTo, ";")
            For i As Integer = 0 To TestArray.Length - 1
                If TestArray(i) <> "" Then
                    mail.To.Add(TestArray(i))
                End If
            Next
            TestArray = Nothing

            TestArray = Split(MailProp.MailCC, ";")
            For i As Integer = 0 To TestArray.Length - 1
                If TestArray(i) <> "" Then
                    mail.CC.Add(TestArray(i))
                End If
            Next
            TestArray = Nothing

            TestArray = Split(MailProp.MailBCC, ";")
            For i As Integer = 0 To TestArray.Length - 1
                If TestArray(i) <> "" Then
                    mail.Bcc.Add(TestArray(i))
                End If
            Next
            TestArray = Nothing

            mail.Subject = MailProp.MailSubject
            mail.Body = MailProp.MailBody
            mail.IsBodyHtml = True
            mail.Priority = MailPriority.High
            Dim smtp As New SmtpClient(MailProp.SMTPServer, MailProp.SMTPPort)
            smtp.Send(mail)
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

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearForm()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetTodaysAbsentEmpList()
        End If
    End Sub

    Protected Sub GetTodaysAbsentEmpList()
        grdTodaysAbsentEmpList.DataSource = UserAttData.fnGetPrimaryWarningAbsentEmpList()
        grdTodaysAbsentEmpList.DataBind()
    End Sub

    Protected Sub GetAllActiveEmpList()
        grdTodaysAbsentEmpList.DataSource = EmpData.fnGetEmpInfoListActive()
        grdTodaysAbsentEmpList.DataBind()
    End Sub

    Protected Sub ClearForm()
        Dim chkSelectAll, chkSelectEmployee As New CheckBox
        chkSelectAll = grdTodaysAbsentEmpList.HeaderRow.FindControl("chkSelectAll")

        chkSelectAll.Checked = False

        For Each rw As GridViewRow In grdTodaysAbsentEmpList.Rows
            chkSelectEmployee = rw.FindControl("chkSelectEmployee")
            chkSelectEmployee.Checked = False
        Next
    End Sub

End Class

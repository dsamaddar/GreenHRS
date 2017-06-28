Imports System
Imports System.Data
Imports System.Net.Mail

Partial Class EmployeeProfile_frmResourceReq
    Inherits System.Web.UI.Page

    Dim EmployeeData As New clsEmpBasicProfileDataAccess()
    Dim ResReqData As New clsResourceReqDataAccess()
    Dim RecTypeData As New clsRecruitmentTypeDataAccess()
    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Dim ResReq As New clsResourceReq()

        Try
            If drpResourceTypeList.Items.Count = 0 Then
                MessageBox("Select recruitment type from the list.")
                Exit Sub
            End If

            ResReq.RecruitmentTypeID = drpResourceTypeList.SelectedValue
            ResReq.ULCBranchID = drpULCBranch.SelectedValue
            ResReq.ReqNoOfResource = Convert.ToInt32(drpNoOfResource.SelectedValue)
            ResReq.Remarks = txtRemarks.Text
            ResReq.SubmittedBy = Session("ToWhomProShow")
            ResReq.EntryBy = Session("LoginUserID")

            Dim MailProp As clsMailProperty = ResReqData.fnInsertResourceReq(ResReq)

            If Not MailProp Is Nothing Then
                MessageBox("Submitted Successfully")
                SendResourceReqMail(MailProp)
                ClearForm()
                GetResReqDetails(Session("ToWhomProShow"))
            Else
                MessageBox("Error Found.")
            End If


        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub ClearForm()
        txtRemarks.Text = ""
        drpNoOfResource.SelectedIndex = -1
        drpResourceTypeList.SelectedIndex = -1
        drpULCBranch.SelectedIndex = -1
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim LoginUserId As String = Session("UniqueUserID")
            getBasicProfileInfo(Session("ToWhomProShow"))
            GetRecruitmentTypeList()
            GetResReqDetails(Session("ToWhomProShow"))
            ShowULCBranch()
        End If
    End Sub

    Protected Sub ShowULCBranch()
        drpULCBranch.DataTextField = "ULCBranchName"
        drpULCBranch.DataValueField = "ULCBranchID"
        drpULCBranch.DataSource = EmployeeInfoData.fnGetULCBranch()
        drpULCBranch.DataBind()
    End Sub

    Protected Sub GetResReqDetails(ByVal SubmittedBy As String)
        grdResourceReq.DataSource = ResReqData.fnGetResourceReqByUser(SubmittedBy)
        grdResourceReq.DataBind()
    End Sub

    Protected Sub GetRecruitmentTypeList()
        drpResourceTypeList.DataTextField = "RecruitmentType"
        drpResourceTypeList.DataValueField = "RecruitmentTypeID"
        drpResourceTypeList.DataSource = RecTypeData.fnGetRecTypeListForEmp(Session("UniqueUserID"))
        drpResourceTypeList.DataBind()
    End Sub

    Protected Sub getBasicProfileInfo(ByVal EmployeeId As String)
        Dim EmpBasicProfile As New EmpBasicInfo()
        EmpBasicProfile = EmployeeData.fnGetBasicProfile(EmployeeId)

        Dim pnlEmpSummary As Panel
        Master.FindControl("pnlEmpSummary")
        pnlEmpSummary = Master.FindControl("pnlEmpSummary")

        Dim lblEmployeeName, lblEmployeeID, lblOfficialDesignation, lblFunctionalDesignation, lblDepartment, lblSupervisorName, lblEmployeeType, lblServiceLength, lblLocation As Label
        Dim imgEmployee As Image
        Dim hpLnkCanProfile As New HyperLink

        lblEmployeeName = pnlEmpSummary.FindControl("lblEmployeeName")
        lblEmployeeID = pnlEmpSummary.FindControl("lblEmployeeID")
        lblOfficialDesignation = pnlEmpSummary.FindControl("lblOfficialDesignation")
        lblFunctionalDesignation = pnlEmpSummary.FindControl("lblFunctionalDesignation")
        lblDepartment = pnlEmpSummary.FindControl("lblDepartment")
        lblSupervisorName = pnlEmpSummary.FindControl("lblSupervisorName")
        lblEmployeeType = pnlEmpSummary.FindControl("lblEmployeeType")
        lblServiceLength = pnlEmpSummary.FindControl("lblServiceLength")
        lblLocation = pnlEmpSummary.FindControl("lblLocation")
        imgEmployee = pnlEmpSummary.FindControl("imgEmployee")
        hpLnkCanProfile = pnlEmpSummary.FindControl("hpLnkCanProfile")

        lblEmployeeName.Text = EmpBasicProfile.Name
        lblEmployeeID.Text = EmpBasicProfile.EmpCode
        lblOfficialDesignation.Text = EmpBasicProfile.OfficialDesignation
        lblFunctionalDesignation.Text = EmpBasicProfile.FunctionalDesignation
        lblDepartment.Text = EmpBasicProfile.DepartmentName
        lblSupervisorName.Text = EmpBasicProfile.CurrentSupervisor
        lblEmployeeType.Text = EmpBasicProfile.EmployeeTypeName
        lblServiceLength.Text = EmpBasicProfile.ServiceLength
        lblLocation.Text = EmpBasicProfile.ULCBranchName
        hpLnkCanProfile.NavigateUrl = "../RecuitmentCVView.aspx?CandidateID=" + EmpBasicProfile.CandidateID

        imgEmployee.ImageUrl = "~/Attachments/" + EmpBasicProfile.Attachment

        'lblImg.Text = imgEmployee.ImageUrl
    End Sub

    Protected Sub SendResourceReqMail(ByVal MailProp As clsMailProperty)
        Dim mail As New Net.Mail.MailMessage()
        Try
            mail.From = New MailAddress(MailProp.MailFrom)
            mail.To.Add(MailProp.MailTo)
            mail.CC.Add(MailProp.MailCC)
            mail.Bcc.Add(MailProp.MailBCC)
            mail.Subject = MailProp.MailSubject
            mail.Body = MailProp.MailBody
            mail.IsBodyHtml = True
            Dim smtp As New SmtpClient("192.168.1.232", 25)
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

End Class

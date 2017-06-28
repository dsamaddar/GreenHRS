Imports System.Net.Mail

Partial Class Settings_frmEmpJDActivation
    Inherits System.Web.UI.Page

    Dim DeptData As New clsDepartmentDataAccess()
    Dim EmployeeData As New clsEmpBasicProfileDataAccess()
    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim EmpJDData As New clsEmployeeJDDataAccess()
    Dim EmpJDAssignData As New clsEmpJDAssignDataAccess()
    Dim ResignationMailData As New clsResignationMailDataAccess()

    Dim TotalEmpCount As Integer = 0

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        Dim OrgSrchStr As New clsSearchOrgStructure()

        Try
            OrgSrchStr.EmpIDOrName = txtEmpIDOrName.Text
            OrgSrchStr.EmployeeTypeID = drpEmployeeType.SelectedValue

            If drpSelectDesignation.SelectedIndex = 0 Then
                OrgSrchStr.DesignationID = "N\A"
            Else
                OrgSrchStr.DesignationID = drpSelectDesignation.SelectedValue
            End If

            If drpSelectDepartment.SelectedIndex = 0 Then
                OrgSrchStr.DepartmentID = "N\A"
            Else
                OrgSrchStr.DepartmentID = drpSelectDepartment.SelectedValue
            End If

            If drpULCBranch.SelectedIndex = 0 Then
                OrgSrchStr.ULCBranchID = "N\A"
            Else
                OrgSrchStr.ULCBranchID = drpULCBranch.SelectedValue
            End If

            OrgSrchStr.IsActive = drpEmployeeStatus.SelectedValue
            If rdbtnGender.SelectedIndex = -1 Then
                OrgSrchStr.Gender = "N\A"
            Else
                OrgSrchStr.Gender = rdbtnGender.SelectedValue
            End If

            OrgSrchStr.BloodGroupID = ddlBloodGrp.SelectedValue
            OrgSrchStr.PerDistrict = Convert.ToInt32(ddlPerDistrict.SelectedValue)

            grdEmployeeList.DataSource = EmployeeInfoData.fnSearchEmployeeForEdit(OrgSrchStr)
            grdEmployeeList.DataBind()

            grdEmployeeList.SelectedIndex = -1

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

    Protected Sub GetJDByEmpID(ByVal EmployeeID As String)
        grdExistingJDList.DataSource = EmpJDData.fnGetEmpJDByID(EmployeeID)
        grdExistingJDList.DataBind()
    End Sub

    Protected Sub ShowULCBranch()
        drpULCBranch.DataTextField = "ULCBranchName"
        drpULCBranch.DataValueField = "ULCBranchID"
        drpULCBranch.DataSource = EmployeeInfoData.fnGetULCBranch()
        drpULCBranch.DataBind()
    End Sub

    Protected Sub ShowDesignationOfficial()
        drpSelectDesignation.DataTextField = "DesignationName"
        drpSelectDesignation.DataValueField = "DesignationID"
        drpSelectDesignation.DataSource = EmployeeInfoData.fnGetOfficialDesignation()
        drpSelectDesignation.DataBind()
    End Sub

    Protected Sub getBloodGroup()
        ddlBloodGrp.DataTextField = "BloodGroupName"
        ddlBloodGrp.DataValueField = "BloodGroupID"
        ddlBloodGrp.DataSource = EmployeeData.fnGetBloodGroup()
        ddlBloodGrp.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "N\A"
        ddlBloodGrp.Items.Insert(0, A)
    End Sub

    Protected Sub geDistrictName()
        ddlPerDistrict.DataTextField = "DistrictName"
        ddlPerDistrict.DataValueField = "DistrictID"
        ddlPerDistrict.DataSource = EmployeeData.getDistrictName()
        ddlPerDistrict.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "0"
        ddlPerDistrict.Items.Insert(0, A)
    End Sub

    Protected Sub ShowDepertment()
        drpSelectDepartment.DataTextField = "DeptName"
        drpSelectDepartment.DataValueField = "DepartmentID"
        drpSelectDepartment.DataSource = DeptData.fnGetDeptList()
        drpSelectDepartment.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowULCBranch()
            ShowDesignationOfficial()
            getBloodGroup()
            geDistrictName()
            ShowDepertment()
            ShowJDNo()

            btnAssign.Visible = True
            btnUpdateJD.Visible = False
        End If
    End Sub

    Protected Sub btnUpdateJD_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateJD.Click
        Dim EmpJD As New clsEmployeeJD()

        EmpJD.EmployeeJDID = hdFldEmpJDID.Value
        EmpJD.IssueDate = txtIssueDate.Text
        EmpJD.EffectiveDate = txtEffectiveDate.Text

        If drpJDStatus.SelectedValue = "1" Then
            EmpJD.IsActive = True
        Else
            EmpJD.IsActive = False
        End If

        Dim Check As Integer = EmpJDData.fnUpdateEmpJDInfo(EmpJD)

        If Check = 1 Then
            MessageBox("Updated Successfully.")
            GetJDByEmpID(hdFldEmployeeID.Value)
            ClearJDForm()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ClearJDForm()
        txtIssueDate.Text = ""
        txtEffectiveDate.Text = ""
        hdFldEmpJDID.Value = ""
        drpJDStatus.SelectedIndex = -1
    End Sub

    Protected Sub btnAssign_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAssign.Click
        Dim EmpJDAssign As New clsEmpJDAssign()
        Try

            If drpJD.SelectedIndex = 0 Then
                MessageBox("Select Proper JD First.")
                Exit Sub
            End If

            '' Chq. If JD is Already Assigned.
            Dim Assigned As Boolean = False
            Dim EmpJD As New clsEmployeeJD()
            EmpJD.EmployeeID = hdFldEmployeeID.Value
            EmpJD.JobDescriptionID = drpJD.SelectedValue
            Assigned = EmpJDData.fnChqEmpJDAlreadyAssigned(EmpJD)
            If Assigned = True Then
                MessageBox("JD Already Assigned.")
                Exit Sub
            End If
            ''

            EmpJDAssign.JobDescriptionID = drpJD.SelectedValue
            EmpJDAssign.IssueDate = txtIssueDate.Text
            EmpJDAssign.EffectiveDate = txtEffectiveDate.Text
            EmpJDAssign.EmployeeID = hdFldEmployeeID.Value
            EmpJDAssign.AssignedBy = Session("LoginUserID")

            Dim Check As Integer = EmpJDAssignData.fnInsertEmpJDAssign(EmpJDAssign)

            If Check = 1 Then
                MessageBox("Assigned Successfully.")
                SendJDAssignmentMail()
                GetJDByEmpID(hdFldEmployeeID.Value)
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub SendJDAssignmentMail()
        Dim sb As StringBuilder = New StringBuilder()
        Dim mail As New Net.Mail.MailMessage()

        Dim ResignationMail As clsResignationMail = ResignationMailData.fnGetMailAddressByEmpID(Session("ToWhomProShow"))

        mail.To.Add(ResignationMail.EmpMailAdr)
        mail.CC.Add(ResignationMail.SupervisorMailAdr)
        mail.Bcc.Add("Debayan@ulc.com")

        Dim JDAssignee As clsResignationMail = ResignationMailData.fnGetMailAddressByEmpID(Session("UniqueUserID"))
        mail.From = New MailAddress(JDAssignee.EmpMailAdr)
        mail.Subject = "GreenHRS: JD Assigned"
        sb.Append("</br></br><html><head></head>")
        sb.Append("You have been assigned a JD from your supervisor. Please review the assigned JD through your personal account in GreenHRS and accept accordingly. For any confusion regarding the JD, you can communicate with your supervisor.")
        sb.Append("<table style='border-width:2px;border-style:solid' >")
        sb.Append("<tr>")
        sb.Append("<th>Employee</th>")
        sb.Append("<th>Assigned JD</th>")
        sb.Append("<th>Issue Date</th>")
        sb.Append("<th>Effective Date</th>")

        sb.Append("</tr>")
        sb.Append("<tr><td></td><td></td><td></td><td></td></tr>")
        sb.Append("<tr><td>" + ResignationMail.EmployeeName + "</td>")
        sb.Append("<td>" + drpJD.SelectedItem.ToString() + "</td>")
        sb.Append("<td>" + Convert.ToDateTime(txtIssueDate.Text).Date + "</td>")
        sb.Append("<td>" + Convert.ToDateTime(txtEffectiveDate.Text).Date + "</td></tr>")
        sb.Append("<tr><td></td><td></td><td></td><td></td></tr>")
        sb.Append("</table>")
        sb.Append("</html>")
        mail.Body = sb.ToString()
        mail.IsBodyHtml = True
        Dim smtp As New SmtpClient("192.168.1.232", 25)
        smtp.Send(mail)
    End Sub

    Protected Sub btnCancelEmpJDAssign_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelEmpJDAssign.Click

    End Sub

    Protected Sub grdExistingJDList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdExistingJDList.SelectedIndexChanged
        Dim lblEmployeeJDID, lblIssueDate, lblEffectiveDate, lblIsActive As New Label

        lblEmployeeJDID = grdExistingJDList.SelectedRow.FindControl("lblEmployeeJDID")
        lblIssueDate = grdExistingJDList.SelectedRow.FindControl("lblIssueDate")
        lblEffectiveDate = grdExistingJDList.SelectedRow.FindControl("lblEffectiveDate")
        lblIsActive = grdExistingJDList.SelectedRow.FindControl("lblIsActive")

        txtIssueDate.Text = Convert.ToDateTime(lblIssueDate.Text)
        txtEffectiveDate.Text = Convert.ToDateTime(lblEffectiveDate.Text)
        hdFldEmpJDID.Value = lblEmployeeJDID.Text

        If lblIsActive.Text = "YES" Then
            drpJDStatus.SelectedValue = "1"
        Else
            drpJDStatus.SelectedValue = "0"
        End If

        btnAssign.Visible = False
        btnUpdateJD.Visible = True
    End Sub

    Protected Sub ShowJDNo()
        drpJD.DataTextField = "JDName"
        drpJD.DataValueField = "JobDescriptionID"
        drpJD.DataSource = EmployeeInfoData.fnGetJDList()
        drpJD.DataBind()
        drpJD.Items.Insert(0, "-Select-")
    End Sub

    Protected Sub grdEmployeeList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdEmployeeList.SelectedIndexChanged
        Dim lblEmployeeID As New Label
        lblEmployeeID = grdEmployeeList.SelectedRow.FindControl("lblEmployeeID")
        hdFldEmployeeID.Value = lblEmployeeID.Text
        GetJDByEmpID(lblEmployeeID.Text)
    End Sub

End Class

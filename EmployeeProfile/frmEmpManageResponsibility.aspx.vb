Imports System.Net
Imports System.IO

Partial Class EmployeeProfile_frmEmpManageResponsibility
    Inherits System.Web.UI.Page

    Dim EmployeeData As New clsEmpBasicProfileDataAccess()
    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim DeptData As New clsDepartmentDataAccess()
    Dim EmpResData As New clsEmpResponsibilityDataAccess()
    Dim EducationInformation As New clsEmployeeAllInfoDataAccess()


    Protected Sub btnAssignResponsibility_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAssignResponsibility.Click

        Dim EmpRes As New clsEmpResponsibility()

        Try
            EmpRes.DepartmentID = ddlDepartment.SelectedValue
            EmpRes.EffectiveDate = Convert.ToDateTime(txtEffectiveDate.Text)
            EmpRes.EmployeeID = Session("ToWhomProShow")
            EmpRes.OfficialDesignationID = ddlOfficialDesignation.SelectedValue
            EmpRes.FunctionalDesignationID = ddlFunctionalDesignation.SelectedValue
            EmpRes.MajorTask = txtMajorTask.Text
            EmpRes.Remarks = txtRemarks.Text
            EmpRes.EntryBy = Session("LoginUserID")

            Dim Check As Integer = EmpResData.fnInsertBranchTransfer(EmpRes)

            If Check = 1 Then
                MessageBox("Responsibility Assigned.")
                ClearForm()
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
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

        If EmpBasicProfile.Attachment = "" Then
            imgEmployee.ImageUrl = ""
        Else
            ShowImage(ConfigurationManager.AppSettings("AttachmentsShow") & EmpBasicProfile.Attachment, "imgEmployee")
        End If

    End Sub

    Protected Sub ShowImage(ByVal UrlStr As String, ByVal ControlName As String)
        Dim tClient As WebClient = New WebClient
        Dim memStrmPic As MemoryStream = New MemoryStream(tClient.DownloadData(UrlStr))
        Dim bytesPic As Byte() = memStrmPic.ToArray()
        Dim base64StringPic As String = Convert.ToBase64String(bytesPic, 0, bytesPic.Length)

        Dim imgCtrl As System.Web.UI.WebControls.Image = Master.FindControl(ControlName)
        imgCtrl.ImageUrl = "data:image/png;base64," & base64StringPic
        memStrmPic.Dispose()
    End Sub

    Protected Sub ClearForm()

        txtEffectiveDate.Text = ""
        txtMajorTask.Text = ""
        txtRemarks.Text = ""

        ddlDepartment.SelectedIndex = -1
        ddlFunctionalDesignation.SelectedIndex = -1
        ddlOfficialDesignation.SelectedIndex = -1

        grdAssignedResponsibility.DataSource = ""
        grdAssignedResponsibility.DataBind()

        ShowEmpResponsibility(Session("ToWhomProShow"))

    End Sub

    Protected Sub ShowEmpResponsibility(ByVal EmployeeID As String)
        grdAssignedResponsibility.DataSource = EmpResData.fnShowEmpResponsibility(EmployeeID)
        grdAssignedResponsibility.DataBind()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub ShowDesignationFunc()
        ddlFunctionalDesignation.DataTextField = "DesignationName"
        ddlFunctionalDesignation.DataValueField = "DesignationID"
        ddlFunctionalDesignation.DataSource = EmployeeInfoData.fnGetFunctionalDesignation()
        ddlFunctionalDesignation.DataBind()
    End Sub

    Protected Sub ShowDesignationOfficial()
        ddlOfficialDesignation.DataTextField = "DesignationName"
        ddlOfficialDesignation.DataValueField = "DesignationID"
        ddlOfficialDesignation.DataSource = EmployeeData.fnGetOfficialDesignation()
        ddlOfficialDesignation.DataBind()
    End Sub

    Protected Sub ShowDepertment()
        ddlDepartment.DataTextField = "DeptName"
        ddlDepartment.DataValueField = "DepartmentID"
        ddlDepartment.DataSource = DeptData.fnGetDeptList()
        ddlDepartment.DataBind()
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearForm()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim LoginUserId As String = Session("UniqueUserID")
            Dim ToWhomProShow As String = Request.QueryString("EmployeeID")

            If ToWhomProShow = "" Then
                ToWhomProShow = Session("ToWhomProShow")
            End If

            lblHolder.Text = ToWhomProShow

            If LoginUserId = ToWhomProShow Then
                Dim Check As Boolean = EducationInformation.CheckPermissionForOwnInfo(LoginUserId)
                If Check = True Then
                    pnlAssignResponsibility.Visible = True
                    pnlRevokeResponsibility.Visible = True
                Else
                    pnlAssignResponsibility.Visible = False
                    pnlRevokeResponsibility.Visible = False
                End If
            Else
                Dim Check As Boolean = EducationInformation.CheckPermissionForOthers(LoginUserId)
                If Check = True Then
                    pnlAssignResponsibility.Visible = True
                    pnlRevokeResponsibility.Visible = True
                Else
                    pnlAssignResponsibility.Visible = False
                    pnlRevokeResponsibility.Visible = False
                End If
            End If

            Try
                ShowDesignationFunc()
                ShowDesignationOfficial()
                ShowDepertment()

                getBasicProfileInfo(ToWhomProShow)
                ShowEmpResponsibility(ToWhomProShow)

                pnlRevokeResponsibility.Visible = False
            Catch ex As Exception
                MessageBox(ex.Message)
            End Try
        End If
    End Sub

    Protected Sub btnRevokeResponsibility_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRevokeResponsibility.Click

        Dim EmpRes As New clsEmpResponsibility()

        EmpRes.EmpResponsibilityID = hdFldAssignedResponsibilityID.Value
        EmpRes.RevokedBy = Session("LoginUserID")
        EmpRes.RevokeDate = Convert.ToDateTime(txtRevokeDate.Text)
        EmpRes.RevokedCause = txtRevokeCause.Text

        Dim Check As Integer = EmpResData.fnRevokeResponsibility(EmpRes)

        If Check = 1 Then
            MessageBox("Responsibility Revoked.")
            ClearRevokeForm()
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Sub ClearRevokeForm()
        txtRevokeCause.Text = ""
        txtRevokeDate.Text = ""
        pnlRevokeResponsibility.Visible = False

        grdAssignedResponsibility.SelectedIndex = -1

        grdAssignedResponsibility.DataSource = ""
        grdAssignedResponsibility.DataBind()

        ShowEmpResponsibility(Session("ToWhomProShow"))

    End Sub

    Protected Sub btnCancelRevokeRes_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelRevokeRes.Click
        ClearRevokeForm()
    End Sub

    Protected Sub grdAssignedResponsibility_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdAssignedResponsibility.SelectedIndexChanged

        Dim lblEmpResponsibilityID, lblIsRevoked As Label

        lblIsRevoked = grdAssignedResponsibility.SelectedRow.FindControl("lblIsRevoked")
        lblEmpResponsibilityID = grdAssignedResponsibility.SelectedRow.FindControl("lblEmpResponsibilityID")
        hdFldAssignedResponsibilityID.Value = lblEmpResponsibilityID.Text

        If lblIsRevoked.Text = "YES" Then
            MessageBox("Responsibility Already Revoked.")
            pnlRevokeResponsibility.Visible = False
        Else
            If Session("UniqueUserID") = lblHolder.Text Then
                Dim Check As Boolean = EducationInformation.CheckPermissionForOwnInfo(Session("UniqueUserID"))
                If Check = True Then
                    pnlRevokeResponsibility.Visible = True
                Else
                    pnlRevokeResponsibility.Visible = False
                End If
            Else
                Dim Check As Boolean = EducationInformation.CheckPermissionForOthers(Session("UniqueUserID"))
                If Check = True Then
                    pnlRevokeResponsibility.Visible = True
                Else
                    pnlRevokeResponsibility.Visible = False
                End If
            End If
            ' pnlRevokeResponsibility.Visible = True
        End If

    End Sub

End Class

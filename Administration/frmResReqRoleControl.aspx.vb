
Partial Class Administration_frmResReqRoleControl
    Inherits System.Web.UI.Page

    Dim EmpInfoData As New clsEmployeeInfoDataAccess()
    Dim RecTypeData As New clsRecruitmentTypeDataAccess()
    Dim ResReqCtrlData As New clsResReqRoleControlDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetEmpList()
            GetAllRecTypes()
        End If
    End Sub

    Protected Sub GetAllRecTypes()
        grdResourceTypes.DataSource = RecTypeData.fnGetRecTypeList()
        grdResourceTypes.DataBind()
    End Sub

    Protected Sub GetEmpList()
        drpEmployeeList.DataTextField = "EmployeeName"
        drpEmployeeList.DataValueField = "EmployeeID"
        drpEmployeeList.DataSource = EmpInfoData.fnGetEmployeeList()
        drpEmployeeList.DataBind()
    End Sub

    Protected Sub drpEmployeeList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpEmployeeList.SelectedIndexChanged
        ClearSelection()

        Dim lblRecruitmentTypeID As New Label
        Dim chkCanRequest, chkCanApprove As New CheckBox
        Dim ResReqCtrl As New clsResReqRoleControl()

        For Each rw As GridViewRow In grdResourceTypes.Rows
            lblRecruitmentTypeID = rw.FindControl("lblRecruitmentTypeID")
            chkCanRequest = rw.FindControl("chkCanRequest")
            chkCanApprove = rw.FindControl("chkCanApprove")
            chkCanRequest.Checked = False
            chkCanApprove.Checked = False

            ResReqCtrl.EmployeeID = drpEmployeeList.SelectedValue
            ResReqCtrl.RecruitmentTypeID = lblRecruitmentTypeID.Text
            ResReqCtrl = ResReqCtrlData.fnGetResReqCtrlByIDForEmp(ResReqCtrl)

            If ResReqCtrl.CanRequest = True Then
                chkCanRequest.Checked = True
            End If

            If ResReqCtrl.CanApprove = True Then
                chkCanApprove.Checked = True
            End If

            ResReqCtrl.CanRequest = False
            ResReqCtrl.CanApprove = False
        Next

    End Sub

    Protected Sub ClearSelection()

        Dim chkCanRequest, chkCanApprove As New CheckBox
        For Each rw As GridViewRow In grdResourceTypes.Rows
            chkCanRequest = rw.FindControl("chkCanRequest")
            chkCanApprove = rw.FindControl("chkCanApprove")
            chkCanRequest.Checked = False
            chkCanApprove.Checked = False
        Next

    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Dim ResReqControlIDList As String = ""
        Dim CanRequest As Boolean = 0
        Dim CanApprove As Boolean = 0
        Dim lblRecruitmentTypeID As New Label
        Dim chkCanRequest, chkCanApprove As New CheckBox
        Dim ResReqCtrl As New clsResReqRoleControl()
        Dim result As New clsResult()

        For Each rw As GridViewRow In grdResourceTypes.Rows
            lblRecruitmentTypeID = rw.FindControl("lblRecruitmentTypeID")
            chkCanRequest = rw.FindControl("chkCanRequest")
            chkCanApprove = rw.FindControl("chkCanApprove")

            If chkCanRequest.Checked = True Then
                CanRequest = True
            Else
                CanRequest = False
            End If

            If chkCanApprove.Checked = True Then
                CanApprove = True
            Else
                CanApprove = False
            End If

            If CanRequest = True Or CanApprove = True Then
                ResReqControlIDList = ResReqControlIDList + lblRecruitmentTypeID.Text + "~" + CanRequest.ToString() + "~" + CanApprove.ToString() + "~|"
            End If

        Next

        ResReqCtrl.EmployeeID = drpEmployeeList.SelectedValue
        ResReqCtrl.ResReqControlIDList = ResReqControlIDList
        ResReqCtrl.EntryBy = Session("LoginUserID")

        result = ResReqCtrlData.fnUpdateResReqRoleControl(ResReqCtrl)
        MessageBox(result.Message)
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

End Class


Partial Class InterviewPanel_frmInterviewSettings
    Inherits System.Web.UI.Page

    Dim IntTeamData As New clsInterviewTeamDataAccess()
    Dim IntMemberTypeData As New clsIntmemberTypeDataAccess()
    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim DeptData As New clsDepartmentDataAccess()
    Dim IntPanelData As New clsInterviewPanelDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            lblNewMemberType.Visible = False
            lblNewIntTeam.Visible = False
            btnCancelToInsertNewMemberType.Visible = False
            btnCancelToInsertNewIntTeam.Visible = False

            GetInterviewTeamList()
            GetIntPanelMemberInfo()
            GetMemberTypeList()
            ShowDepertment()
            ShowULCBranch()
            ShowDesignationOfficial()
        End If
    End Sub

    Protected Sub ShowDesignationOfficial()
        drpDesignation.DataTextField = "DesignationName"
        drpDesignation.DataValueField = "DesignationID"
        drpDesignation.DataSource = EmployeeInfoData.fnGetOfficialDesignation()
        drpDesignation.DataBind()

        Dim A As New ListItem()
        A.Text = "-Select-"
        A.Value = "0"
        drpDesignation.Items.Insert(0, A)
    End Sub

    Protected Sub ShowDepertment()
        drpAvailableDepartment.DataTextField = "DeptName"
        drpAvailableDepartment.DataValueField = "DepartmentID"
        drpAvailableDepartment.DataSource = DeptData.fnGetDeptList()
        drpAvailableDepartment.DataBind()

        Dim A As New ListItem()
        A.Text = "-Select-"
        A.Value = "0"
        drpAvailableDepartment.Items.Insert(0, A)
    End Sub

    Protected Sub ShowULCBranch()
        drpAvailableBranch.DataTextField = "ULCBranchName"
        drpAvailableBranch.DataValueField = "ULCBranchID"
        drpAvailableBranch.DataSource = EmployeeInfoData.fnGetULCBranch()
        drpAvailableBranch.DataBind()

        Dim A As New ListItem()
        A.Text = "-Select-"
        A.Value = "0"
        drpAvailableBranch.Items.Insert(0, A)
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnNewIntTeam_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNewIntTeam.Click
        Dim IntTeamInfo As New clsInterviewTeam()
        If btnNewIntTeam.Text = "..." Then
            btnNewIntTeam.Text = "Insert"
            lblNewIntTeam.Visible = True
            btnNewIntTeam.ValidationGroup = "IntTeam"
            btnCancelToInsertNewIntTeam.Visible = True
        Else
            If txtNewIntTeam.Text = "" Then
                MessageBox("InPut Organization Type")
            Else

                If chkIsIntTeamActive.Checked = True Then
                    IntTeamInfo.IsActive = True
                Else
                    IntTeamInfo.IsActive = False
                End If

                IntTeamInfo.IntTeamName = txtNewIntTeam.Text
                IntTeamInfo.EntryBy = Session("LoginUserID")
                Dim check As Integer = IntTeamData.fnInsertInterViewTeam(IntTeamInfo)

                If check = 1 Then
                    MessageBox("Inserted Successfully.")
                    GetInterviewTeamList()
                    btnNewIntTeam.Text = ""
                    chkIsIntTeamActive.Checked = False
                    lblNewIntTeam.Visible = False
                    btnNewIntTeam.Text = "..."
                    btnNewIntTeam.ValidationGroup = ""
                Else
                    MessageBox("Error Found.")
                End If

            End If

        End If
    End Sub

    Protected Sub GetInterviewTeamList()
        drpAvailableIntTeamList.DataTextField = "IntTeamName"
        drpAvailableIntTeamList.DataValueField = "IntTeamID"
        drpAvailableIntTeamList.DataSource = IntTeamData.fnGetInterviewTeamList()
        drpAvailableIntTeamList.DataBind()
    End Sub

    Protected Sub GetMemberTypeList()
        drpIntPnlMemberType.DataTextField = "MemberType"
        drpIntPnlMemberType.DataValueField = "IntMemberTypeID"
        drpIntPnlMemberType.DataSource = IntMemberTypeData.fnGetMemberTypeList()
        drpIntPnlMemberType.DataBind()
    End Sub

    Protected Sub btnCancelToInsertNewIntTeam_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelToInsertNewIntTeam.Click
        btnCancelToInsertNewIntTeam.Visible = False
        lblNewIntTeam.Visible = False
        txtNewIntTeam.Text = ""
        chkIsIntTeamActive.Checked = False
        btnNewIntTeam.Text = "..."
    End Sub

    Protected Sub btnNewMemberType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNewMemberType.Click
        Dim IntMemberType As New clsIntMemberType()

        If btnNewMemberType.Text = "..." Then
            btnNewMemberType.Text = "Insert"
            lblNewMemberType.Visible = True
            btnNewMemberType.ValidationGroup = "IntMemberType"
            btnCancelToInsertNewMemberType.Visible = True
        Else
            If txtNewIntMemberType.Text = "" Then
                MessageBox("InPut member Type")
            Else

                If chkIsActiveIntMemberType.Checked = True Then
                    IntMemberType.IsActive = True
                Else
                    IntMemberType.IsActive = False
                End If

                IntMemberType.MemberType = txtNewIntMemberType.Text
                IntMemberType.EntryBy = Session("LoginUserID")

                Dim check As Integer = IntMemberTypeData.fnInsertIntMemberType(IntMemberType)

                If check = 1 Then
                    MessageBox("Inserted Successfully.")
                    GetMemberTypeList()
                    btnNewMemberType.Text = ""
                    chkIsActiveIntMemberType.Checked = False
                    lblNewMemberType.Visible = False
                    btnNewMemberType.Text = "..."
                    btnNewMemberType.ValidationGroup = ""
                    btnCancelToInsertNewMemberType.Visible = False
                Else
                    MessageBox("Error Found.")
                End If

            End If

        End If
    End Sub

    Protected Sub btnCancelToInsertNewMemberType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelToInsertNewMemberType.Click
        btnCancelToInsertNewMemberType.Visible = False
        lblNewMemberType.Visible = False
        txtNewIntMemberType.Text = ""
        chkIsActiveIntMemberType.Checked = False
        btnNewMemberType.Text = "..."
    End Sub

    Protected Sub btnAddIntTeamMember_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddIntTeamMember.Click
        Dim IntPanelInfo As New clsInterviewPanel()
        Dim LeastSelected As Boolean = False
        Dim EmployeeIDList As String = ""
        Dim AlreadyExistsEmpList As String = ""

        Dim lblEmployeeID As New System.Web.UI.WebControls.Label()
        Dim lblEmployeeName As New System.Web.UI.WebControls.Label()

        Dim chkSelectEmployee As New System.Web.UI.WebControls.CheckBox()
        For Each rw As GridViewRow In grdEmployee.Rows
            chkSelectEmployee = rw.FindControl("chkSelectEmployee")
            If chkSelectEmployee.Checked = True Then
                LeastSelected = True
                Exit For
            End If
        Next

        If LeastSelected = False Then
            MessageBox("Select At Least One Employee To Add As a Member.")
            Exit Sub
        End If

        For Each rw As GridViewRow In grdEmployee.Rows
            chkSelectEmployee = rw.FindControl("chkSelectEmployee")
            If chkSelectEmployee.Checked = True Then
                lblEmployeeID = rw.FindControl("lblEmployeeID")
                lblEmployeeName = rw.FindControl("lblEmployeeName")
                IntPanelInfo.IntTeamID = drpAvailableIntTeamList.SelectedValue
                IntPanelInfo.IntPanelMemberID = lblEmployeeID.Text
                Dim AlreadyExists As Integer = IntPanelData.fnGetEmpAlreadyExistsInTeam(IntPanelInfo)
                If AlreadyExists = 1 Then
                    chkSelectEmployee.Checked = False
                    AlreadyExistsEmpList += lblEmployeeName.Text + ","
                End If
            End If
        Next

        If AlreadyExistsEmpList <> "" Then
            MessageBox("Listed Employees Can't Be Selected.(Already Exists)" + AlreadyExistsEmpList)
        End If

        For Each rw As GridViewRow In grdEmployee.Rows
            chkSelectEmployee = rw.FindControl("chkSelectEmployee")
            If chkSelectEmployee.Checked = True Then
                lblEmployeeID = rw.FindControl("lblEmployeeID")
                EmployeeIDList += lblEmployeeID.Text + ","
            End If
        Next

        If EmployeeIDList <> "" Then
            EmployeeIDList = EmployeeIDList.Remove(Len(EmployeeIDList) - 1, 1)
        Else
            MessageBox("You Have No More Selected Employees.")
            Exit Sub
        End If

        IntPanelInfo.IntTeamID = drpAvailableIntTeamList.SelectedValue
        IntPanelInfo.IntMemberTypeID = drpIntPnlMemberType.SelectedValue
        IntPanelInfo.IntPanelMemberID = EmployeeIDList
        IntPanelInfo.EntryBy = Session("LoginUserID")

        Dim Check As Integer = IntPanelData.fnInsertInterviewPanel(IntPanelInfo)

        If Check = 1 Then
            MessageBox("Inserted.")
            GetIntPanelMemberInfo()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub GetIntPanelMemberInfo()
        Dim IntPanelInfo As New clsInterviewPanel()
        IntPanelInfo.IntTeamID = drpAvailableIntTeamList.SelectedValue
        grdExistingTeamMember.DataSource = IntPanelData.fnGetIntPanelwiseMemberInfo(IntPanelInfo)
        grdExistingTeamMember.DataBind()
    End Sub

    Protected Sub btnCancelToAddMember_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelToAddMember.Click
        
    End Sub

    Protected Sub btnSearchEmployee_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchEmployee.Click

        Dim EmpInfo As New clsEmployeeInfo()

        EmpInfo.EmployeeName = txtEmployeeName.Text
        EmpInfo.DepartmentID = drpAvailableDepartment.SelectedValue
        EmpInfo.OfficialDesignationID = drpDesignation.SelectedValue
        EmpInfo.ULCBranchID = drpAvailableBranch.SelectedValue

        grdEmployee.DataSource = EmployeeInfoData.fnSearchEmployee(EmpInfo)
        grdEmployee.DataBind()
    End Sub

    Protected Sub drpAvailableIntTeamList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpAvailableIntTeamList.SelectedIndexChanged
        GetIntPanelMemberInfo()
    End Sub
End Class

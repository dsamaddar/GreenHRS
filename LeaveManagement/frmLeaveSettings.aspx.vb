
Partial Class LeaveManagement_frmLeaveSettings
    Inherits System.Web.UI.Page

    Dim LeaveTypeData As New clsLeaveTypeDataAccess()

    Protected Sub btnInsertLeaveType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertLeaveType.Click

        Dim LeaveType As New clsLeaveType()

        LeaveType.LeaveType = txtLeaveType.Text
        If chkOnlyForMale.Checked = True Then
            LeaveType.OnlyForMale = True
        Else
            LeaveType.OnlyForMale = False
        End If

        If chkOnlyForFemale.Checked = True Then
            LeaveType.OnlyForFemale = True
        Else
            LeaveType.OnlyForFemale = False
        End If

        If chkIsDeductibleFromLeaveBalance.Checked = True Then
            LeaveType.IsDedFrmLeaveBalance = True
        Else
            LeaveType.IsDedFrmLeaveBalance = False
        End If

        If chkIsLeaveTypeActive.Checked = True Then
            LeaveType.IsActive = True
        Else
            LeaveType.IsActive = False
        End If

        LeaveType.EntryBy = Session("LoginUserID")

        Dim Check As Integer = LeaveTypeData.fnInsertLeaveType(LeaveType)

        If Check = 1 Then
            MessageBox("Inserted Successfully.")
            ClearForm()
            ShowLeaveType()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Private Sub ShowLeaveType()
        grdLeaveType.DataSource = LeaveTypeData.fnShowLeaveType()
        grdLeaveType.DataBind()
    End Sub

    Private Sub ClearForm()
        txtLeaveType.Text = ""
        chkIsLeaveTypeActive.Checked = False
        chkOnlyForFemale.Checked = False
        chkOnlyForMale.Checked = False
        chkIsDeductibleFromLeaveBalance.Checked = False

        btnUpdate.Enabled = False
        btnInsertLeaveType.Enabled = True
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim MenuIDs As String

        MenuIDs = Session("PermittedMenus")

        If InStr(MenuIDs, "LeaveSettings~") = 0 Then
            Response.Redirect("~\frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            ShowLeaveType()
            btnUpdate.Enabled = False
        End If
    End Sub

    Protected Sub grdLeaveType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdLeaveType.SelectedIndexChanged
        Dim lblLeaveTypeID As New System.Web.UI.WebControls.Label()
        Dim LeaveTypeID As String
        lblLeaveTypeID = grdLeaveType.SelectedRow.FindControl("lblLeaveTypeID")

        LeaveTypeID = Convert.ToString(lblLeaveTypeID.Text)

        Dim LeaveType As New clsLeaveType()

        LeaveType = LeaveTypeData.fnGetLeaveSettingsByID(LeaveTypeID)

        txtLeaveType.Text = LeaveType.LeaveType
        chkOnlyForMale.Checked = LeaveType.OnlyForMale
        chkOnlyForFemale.Checked = LeaveType.OnlyForFemale
        chkIsDeductibleFromLeaveBalance.Checked = LeaveType.IsDedFrmLeaveBalance
        chkIsLeaveTypeActive.Checked = LeaveType.IsActive

        btnUpdate.Enabled = True
        btnInsertLeaveType.Enabled = False

    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Dim LeaveType As New clsLeaveType()

        Dim lblLeaveTypeID As New System.Web.UI.WebControls.Label()
        lblLeaveTypeID = grdLeaveType.SelectedRow.FindControl("lblLeaveTypeID")

        LeaveType.LeaveTypeID = Convert.ToString(lblLeaveTypeID.Text)

        LeaveType.LeaveType = txtLeaveType.Text

        If chkOnlyForMale.Checked = True Then
            LeaveType.OnlyForMale = True
        Else
            LeaveType.OnlyForMale = False
        End If

        If chkOnlyForFemale.Checked = True Then
            LeaveType.OnlyForFemale = True
        Else
            LeaveType.OnlyForFemale = False
        End If

        If chkIsDeductibleFromLeaveBalance.Checked = True Then
            LeaveType.IsDedFrmLeaveBalance = True
        Else
            LeaveType.IsDedFrmLeaveBalance = False
        End If

        If chkIsLeaveTypeActive.Checked = True Then
            LeaveType.IsActive = True
        Else
            LeaveType.IsActive = False
        End If


        Dim Check As Integer = LeaveTypeData.fnUpdateLeaveType(LeaveType)

        If Check = 1 Then
            MessageBox("Updated Successfully.")
            ClearForm()
            ShowLeaveType()
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        btnInsertLeaveType.Enabled = True
        btnUpdate.Enabled = False
        ClearForm()

        grdLeaveType.SelectedIndex = -1
    End Sub
End Class

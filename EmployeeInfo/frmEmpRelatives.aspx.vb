
Partial Class EmployeeInfo_frmEmpRelatives
    Inherits System.Web.UI.Page

    Dim RelativeData As New clsEmpRelativesDataAccess()
    Dim RelationTypeData As New clsRelativeTypeDataAccess()

    Protected Sub btnInsertRelative_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertRelative.Click

        Dim RelativeInfo As New clsRelatives()
        Dim Check As Integer = 0

        Dim EmployeeID As String = Session("UniqueUserID")
        RelativeInfo.RelativeID = hdfldRelativeID.Value
        RelativeInfo.EmployeeID = EmployeeID
        RelativeInfo.RelationTypeID = drpSelectRelativeType.SelectedValue
        RelativeInfo.NameOfRelative = txtNameOfRelative.Text
        RelativeInfo.DateOfBirth = Convert.ToDateTime(txtDateOfBirth.Text)
        RelativeInfo.RelAddress = txtAddress.Text
        RelativeInfo.Details = txtDetails.Text
        RelativeInfo.EntryBy = Session("LoginUserID")

        If btnInsertRelative.Text = "Insert" Then
            Check = RelativeData.fnInsertEmpRelatives(RelativeInfo)

            If Check = 1 Then
                MessageBox("Inserted Successfully.")
                ClearForm()
                ShowRelativeInfo(EmployeeID)
            Else
                MessageBox("Error Found.")
            End If

        Else
            Check = RelativeData.fnUpdateEmpRelatives(RelativeInfo)

            If Check = 1 Then
                MessageBox("Updated Successfully.")
                ClearForm()
                btnInsertRelative.Text = "Insert"
                grdRelativesInfo.SelectedIndex = -1
                ShowRelativeInfo(EmployeeID)
            Else
                MessageBox("Error Found.")
            End If
        End If
    End Sub

    Protected Sub ClearForm()
        drpSelectRelativeType.SelectedIndex = -1
        txtNameOfRelative.Text = ""
        txtDateOfBirth.Text = ""
        txtAddress.Text = ""
        txtDetails.Text = ""
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            Try
                Dim EmployeeID As String = Session("UniqueUserID")

                Dim EmpCount As Integer = Common.EmployeeBasicCount(EmployeeID)

                If EmpCount = 0 Then
                    Dim msg As String = "Please Insert Basic Information First"
                    Response.Redirect("EmployeeBasicInfo.aspx?Message=" + msg)
                End If


                Dim EmpEduCount As Integer = Common.EmployeeEduCount(EmployeeID)

                If EmpEduCount = 0 Then
                    Dim msg As String = "Please Insert Education Information"
                    Response.Redirect("EmployeeEducationInfo.aspx?Message=" + msg)
                End If



                ShowRelativeInfo(EmployeeID)
                ShowRelationType()
                lblNewRelationType.Visible = False
                btnCancelInsertNewRelationType.Visible = False
            Catch ex As Exception
                MessageBox(ex.Message)
            End Try


        End If
    End Sub

    Protected Sub ShowRelationType()
        drpSelectRelativeType.DataValueField = "RelationTypeID"
        drpSelectRelativeType.DataTextField = "RelationType"
        drpSelectRelativeType.DataSource = RelationTypeData.fnShowRelationType()
        drpSelectRelativeType.DataBind()
    End Sub

    Protected Sub ShowRelativeInfo(ByVal EmployeeID As String)
        grdRelativesInfo.DataSource = RelativeData.fnShowEmpRelatives(EmployeeID)
        grdRelativesInfo.DataBind()
    End Sub

    Protected Sub btnNewRelationType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNewRelationType.Click

        Dim RelationType As New clsRelationType()

        If btnNewRelationType.Text = "..." Then
            btnNewRelationType.Text = "Insert"
            lblNewRelationType.Visible = True
            btnNewRelationType.ValidationGroup = "RelationType"
            btnCancelInsertNewRelationType.Visible = True
        Else
            If txtRelationType.Text = "" Then
                MessageBox("InPut Relation Type")
            Else

                If chkRelationTypeIsActive.Checked = True Then
                    RelationType.IsActive = True
                Else
                    RelationType.IsActive = False
                End If

                RelationType.RelationType = txtRelationType.Text
                RelationType.IsActive = True
                RelationType.EntryBy = Session("LoginUserID")

                Dim check As Integer = RelationTypeData.fnInsertRelationType(RelationType)

                If check = 1 Then
                    MessageBox("Inserted Successfully.")
                    ShowRelationType()
                    txtRelationType.Text = ""
                    lblNewRelationType.Visible = False
                    btnCancelInsertNewRelationType.Visible = False
                    btnNewRelationType.Text = "..."
                    btnNewRelationType.ValidationGroup = ""
                    chkRelationTypeIsActive.Checked = False
                Else
                    MessageBox("Error Found.")
                End If

            End If

        End If
    End Sub

    Protected Sub btnCancelInsertNewRelationType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelInsertNewRelationType.Click
        btnNewRelationType.Text = "..."
        lblNewRelationType.Visible = False
        btnCancelInsertNewRelationType.Visible = False
    End Sub

    Protected Sub grdRelativesInfo_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdRelativesInfo.SelectedIndexChanged

        Dim lblRelativeID As New System.Web.UI.WebControls.Label()
        Dim lblRelationTypeID As New System.Web.UI.WebControls.Label()
        Dim lblNameOfRelative As New System.Web.UI.WebControls.Label()
        Dim lblDateOfBirth As New System.Web.UI.WebControls.Label()
        Dim lblRelAddress As New System.Web.UI.WebControls.Label()
        Dim lblDetails As New System.Web.UI.WebControls.Label()

        lblRelativeID = grdRelativesInfo.SelectedRow.FindControl("lblRelativeID")
        lblRelationTypeID = grdRelativesInfo.SelectedRow.FindControl("lblRelationTypeID")
        lblNameOfRelative = grdRelativesInfo.SelectedRow.FindControl("lblNameOfRelative")
        lblDateOfBirth = grdRelativesInfo.SelectedRow.FindControl("lblDateOfBirth")
        lblRelAddress = grdRelativesInfo.SelectedRow.FindControl("lblRelAddress")
        lblDetails = grdRelativesInfo.SelectedRow.FindControl("lblDetails")

        hdfldRelativeID.Value = lblRelativeID.Text
        drpSelectRelativeType.SelectedValue = lblRelationTypeID.Text
        txtDateOfBirth.Text = Convert.ToDateTime(lblDateOfBirth.Text)
        txtNameOfRelative.Text = lblNameOfRelative.Text
        txtAddress.Text = lblRelAddress.Text
        txtDetails.Text = lblDetails.Text

        btnInsertRelative.Text = "Update"

    End Sub

    Protected Sub btnCancelSelection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelSelection.Click

        If grdRelativesInfo.Rows.Count > 0 Then
            grdRelativesInfo.SelectedIndex = -1
        End If

        txtAddress.Text = ""
        txtDateOfBirth.Text = ""
        txtDetails.Text = ""
        txtNameOfRelative.Text = ""
        drpSelectRelativeType.SelectedIndex = -1

        btnInsertRelative.Text = "Insert"

    End Sub

End Class

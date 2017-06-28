
Partial Class Administration_frmRecruitmentTypeDef
    Inherits System.Web.UI.Page

    Dim RecTypeData As New clsRecruitmentTypeDataAccess()

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Dim RecType As New clsRecruitmentType()

        RecType.RecruitmentType = txtRecruitmentType.Text
        RecType.RecruitmentTypeCode = txtRecruitmentTypeCode.Text
        RecType.Prerequisite = txtPrerequisite.Text
        RecType.Sourcing = txtSourcing.Text
        RecType.InterviewPanel = txtInterviewPanel.Text

        If chkIsActive.Checked = True Then
            RecType.IsActive = True
        Else
            RecType.IsActive = False
        End If

        RecType.EntryBy = Session("LoginUserID")

        Dim Check As Integer = RecTypeData.fnInsertRecruitmentType(RecType)

        If Check = 1 Then
            MessageBox("Inserted Successfully.")
            ClearForm()
            GetRecTypeDetails()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Dim RecType As New clsRecruitmentType()

        RecType.RecruitmentTypeID = hdFldRecruitmentTypeID.Value
        RecType.RecruitmentType = txtRecruitmentType.Text
        RecType.RecruitmentTypeCode = txtRecruitmentTypeCode.Text
        RecType.Prerequisite = txtPrerequisite.Text
        RecType.Sourcing = txtSourcing.Text
        RecType.InterviewPanel = txtInterviewPanel.Text

        If chkIsActive.Checked = True Then
            RecType.IsActive = True
        Else
            RecType.IsActive = False
        End If

        RecType.EntryBy = Session("LoginUserID")

        Dim Check As Integer = RecTypeData.fnUpdateRecruitmentType(RecType)

        If Check = 1 Then
            MessageBox("Updated Successfully.")
            ClearForm()
            GetRecTypeDetails()
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearForm()
    End Sub

    Protected Sub ClearForm()
        txtInterviewPanel.Text = ""
        txtPrerequisite.Text = ""
        txtRecruitmentType.Text = ""
        txtRecruitmentTypeCode.Text = ""
        txtSourcing.Text = ""

        chkIsActive.Checked = False

        btnSubmit.Enabled = True
        btnUpdate.Enabled = False

        If grdRecruitmentTypeDef.Rows.Count > 0 Then
            grdRecruitmentTypeDef.SelectedIndex = -1
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetRecTypeDetails()
            btnSubmit.Enabled = True
            btnUpdate.Enabled = False
        End If
    End Sub

    Protected Sub GetRecTypeDetails()
        grdRecruitmentTypeDef.DataSource = RecTypeData.fnGetRecTypeDetails()
        grdRecruitmentTypeDef.DataBind()
    End Sub

    Protected Sub grdRecruitmentTypeDef_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdRecruitmentTypeDef.SelectedIndexChanged

        Dim lblRecruitmentTypeID, lblRecruitmentType, lblRecruitmentTypeCode, lblPrerequisite, lblSourcing, lblInterviewPanel, lblIsActive As New Label()

        lblRecruitmentTypeID = grdRecruitmentTypeDef.SelectedRow.FindControl("lblRecruitmentTypeID")
        lblRecruitmentType = grdRecruitmentTypeDef.SelectedRow.FindControl("lblRecruitmentType")
        lblRecruitmentTypeCode = grdRecruitmentTypeDef.SelectedRow.FindControl("lblRecruitmentTypeCode")
        lblPrerequisite = grdRecruitmentTypeDef.SelectedRow.FindControl("lblPrerequisite")
        lblSourcing = grdRecruitmentTypeDef.SelectedRow.FindControl("lblSourcing")
        lblInterviewPanel = grdRecruitmentTypeDef.SelectedRow.FindControl("lblInterviewPanel")
        lblIsActive = grdRecruitmentTypeDef.SelectedRow.FindControl("lblIsActive")


        hdFldRecruitmentTypeID.Value = lblRecruitmentTypeID.Text
        txtInterviewPanel.Text = lblInterviewPanel.Text
        txtPrerequisite.Text = lblPrerequisite.Text
        txtRecruitmentType.Text = lblRecruitmentType.Text
        txtRecruitmentTypeCode.Text = lblRecruitmentTypeCode.Text
        txtSourcing.Text = lblSourcing.Text

        If lblIsActive.Text = "YES" Then
            chkIsActive.Checked = True
        Else
            chkIsActive.Checked = False
        End If

        btnSubmit.Enabled = False
        btnUpdate.Enabled = True


    End Sub
End Class

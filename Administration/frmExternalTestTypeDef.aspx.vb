
Partial Class Administration_frmExternalTestTypeDef
    Inherits System.Web.UI.Page

    Dim ExternalTestData As New clsExternalTestTypeDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetExterTestType()

            btnSubmit.Enabled = True
            btnUpdate.Enabled = False
        End If
    End Sub

    Protected Sub GetExterTestType()
        grdExternalTestTypeDetails.DataSource = ExternalTestData.fnGetExternalTestTypeDetails()
        grdExternalTestTypeDetails.DataBind()
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Dim ExternalTestType As New clsExternalTestType()

        ExternalTestType.ExternalTest = txtTestType.Text
        ExternalTestType.Details = txtTestTypeDetails.Text

        If chkIsActive.Checked = True Then
            ExternalTestType.IsActive = True
        Else
            ExternalTestType.IsActive = False
        End If

        ExternalTestType.EntryBy = Session("LoginUserID")

        Dim check As Integer = ExternalTestData.fnInsertExternalTestType(ExternalTestType)

        If check = 1 Then
            MessageBox("Test Type Inserted.")
            GetExterTestType()
            ClearForm()
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
        Dim ExternalTestType As New clsExternalTestType()

        If hdFldExternalTestTypeID.Value = "" Then
            MessageBox("Select An Item First.")
            Exit Sub
        End If

        Try
            ExternalTestType.ExternalTestTypeID = hdFldExternalTestTypeID.Value
            ExternalTestType.ExternalTest = txtTestType.Text
            ExternalTestType.Details = txtTestTypeDetails.Text

            If chkIsActive.Checked = True Then
                ExternalTestType.IsActive = True
            Else
                ExternalTestType.IsActive = False
            End If

            ExternalTestType.EntryBy = Session("LoginUserID")

            Dim check As Integer = ExternalTestData.fnUpdateExternalTestType(ExternalTestType)

            If check = 1 Then
                MessageBox("Test Type Updated.")
                GetExterTestType()
                ClearForm()
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
        
    End Sub

    Protected Sub ClearForm()
        hdFldExternalTestTypeID.Value = ""
        txtTestType.Text = ""
        txtTestTypeDetails.Text = ""
        chkIsActive.Checked = True

        If grdExternalTestTypeDetails.Rows.Count > 0 Then
            grdExternalTestTypeDetails.SelectedIndex = -1
        End If

        btnSubmit.Enabled = True
        btnUpdate.Enabled = False

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearForm()
    End Sub

    Protected Sub grdExternalTestTypeDetails_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdExternalTestTypeDetails.SelectedIndexChanged
        Dim lblExternalTestTypeID, lblExternalTest, lblDetails, lblIsActive As New Label

        lblExternalTestTypeID = grdExternalTestTypeDetails.SelectedRow.FindControl("lblExternalTestTypeID")
        lblExternalTest = grdExternalTestTypeDetails.SelectedRow.FindControl("lblExternalTest")
        lblDetails = grdExternalTestTypeDetails.SelectedRow.FindControl("lblDetails")
        lblIsActive = grdExternalTestTypeDetails.SelectedRow.FindControl("lblIsActive")

        hdFldExternalTestTypeID.Value = lblExternalTestTypeID.Text
        txtTestType.Text = lblExternalTest.Text
        txtTestTypeDetails.Text = lblDetails.Text
        If lblIsActive.Text = "YES" Then
            chkIsActive.Checked = True
        Else
            chkIsActive.Checked = False
        End If

        btnUpdate.Enabled = True
        btnSubmit.Enabled = False

    End Sub

End Class

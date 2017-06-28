
Partial Class Mail_frmMailSettings
    Inherits System.Web.UI.Page

    Dim MailSettingsData As New clsMailSettingsDataAccess()

    Protected Sub btnInsertMailType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertMailType.Click
        Dim UserID As String
        UserID = Session("LoginUserID")

        Dim MailType As New clsMailType()

        MailType.MailType = txtTypeName.Text

        If chkIsActive.Checked = True Then
            MailType.IsActive = True
        Else
            MailType.IsActive = False
        End If

        MailType.EntryBy = UserID

        Dim check As Integer = MailSettingsData.fnInsertMailType(MailType)

        If check = 1 Then
            CleearMailType()
            ShowMailTypeList()
            MessageBox("Inserted.")
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub btnCancelSelection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelSelection.Click
        CleearMailType()
    End Sub

    Protected Sub CleearMailType()
        txtTypeName.Text = ""
        chkIsActive.Checked = False
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowMailTypeList()
            ShowMailTypeActiveList()
        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub ShowMailTypeList()
        drpAvailableMailType.DataTextField = "MailType"
        drpAvailableMailType.DataValueField = "MailTypeID"
        drpAvailableMailType.DataSource = MailSettingsData.fnGetMailTypeList()
        drpAvailableMailType.DataBind()
    End Sub

    Protected Sub btnPropertyAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPropertyAdd.Click
        Dim UserID As String
        UserID = Session("LoginUserID")

        Dim MailProperty As New clsMailProperty()

        MailProperty.MailTypeID = drpMailType.SelectedValue
        If drpMailType.SelectedValue = "-Select-" Then
            MessageBox("Select Mail Type")
            Exit Sub
        End If
        MailProperty.MailSubject = txtMailSubject.Text
        MailProperty.MailBody = txtMailBody.Text
        MailProperty.MailFrom = txtMailFrom.Text
        MailProperty.MailTo = txtMailTo.Text
        MailProperty.MailCC = txtCC.Text
        MailProperty.MailBCC = txtBCC.Text
        MailProperty.MailHeader = txtMailHeader.Text
        MailProperty.MailFooter = txtMailFooter.Text

        If IsAutomated.Checked = True Then
            MailProperty.IsAutomated = True
        Else
            MailProperty.IsAutomated = False
        End If

        If IsPropertyActive.Checked = True Then
            MailProperty.IsActive = True
        Else
            MailProperty.IsActive = False
        End If

        MailProperty.EntryBy = UserID

        Dim check As Integer = MailSettingsData.fnInsertMailProperty(MailProperty)

        If check = 1 Then
            CleearMailType()
            ClearMailProperty()
            MessageBox("Inserted.")
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Sub btnAddTo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddTo.Click
        txtMailTo.Text = txtMailTo.Text + txtEmailAddress.Text + " ; "
        txtEmailAddress.Text = ""
    End Sub

    Protected Sub btnToCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnToCancel.Click
        txtMailTo.Text = ""
    End Sub

    Protected Sub btnAddBCC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddBCC.Click
        txtBCC.Text = txtBCC.Text + txtEmailAddress.Text + " ; "
        txtEmailAddress.Text = ""
    End Sub

    Protected Sub btnCancelBCC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelBCC.Click
        txtBCC.Text = ""
    End Sub

    Protected Sub btnAddCC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddCC.Click
        txtCC.Text = txtCC.Text + txtEmailAddress.Text + " ; "
        txtEmailAddress.Text = ""
    End Sub

    Protected Sub btnCancelCC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelCC.Click
        txtCC.Text = ""
    End Sub

    Protected Sub btnPropertyCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPropertyCancel.Click
        ClearMailProperty()
    End Sub

    Protected Sub ClearMailProperty()
        drpMailType.SelectedIndex = 0
        txtMailSubject.Text = ""
        txtMailBody.Text = ""
        txtMailFrom.Text = ""
        txtEmailAddress.Text = ""
        txtMailTo.Text = ""
        txtCC.Text = ""
        txtBCC.Text = ""
        txtMailHeader.Text = ""
        txtMailFooter.Text = ""
        IsAutomated.Checked = False
        IsPropertyActive.Checked = False
    End Sub

    Protected Sub ShowMailTypeActiveList()
        drpMailType.DataTextField = "MailType"
        drpMailType.DataValueField = "MailTypeID"
        drpMailType.DataSource = MailSettingsData.fnGetMailTypeActiveList()
        drpMailType.DataBind()

        drpMailType.Items.Insert(0, "-Select-")
    End Sub

    Protected Sub drpMailType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpMailType.SelectedIndexChanged
        Dim MailProperty As New clsMailProperty()

        MailProperty = MailSettingsData.fnGetPropertyByType(drpMailType.SelectedValue)

        drpMailType.SelectedValue = MailProperty.MailTypeID
        txtMailSubject.Text = MailProperty.MailSubject
        txtMailBody.Text = MailProperty.MailBody
        txtMailFrom.Text = MailProperty.MailFrom
        txtMailTo.Text = MailProperty.MailTo
        txtCC.Text = MailProperty.MailCC
        txtBCC.Text = MailProperty.MailBCC
        txtMailHeader.Text = MailProperty.MailHeader
        txtMailFooter.Text = MailProperty.MailFooter
        IsAutomated.Checked = MailProperty.IsAutomated
        IsPropertyActive.Checked = MailProperty.IsActive
    End Sub
End Class

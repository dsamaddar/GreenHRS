
Partial Class Payroll_frmSalGenerationPermission
    Inherits System.Web.UI.Page

    Dim SalGenData As New clsSalGenPermissionDataAccess()
    Dim EmpInfoData As New clsEmployeeInfoDataAccess()

    Protected Sub drpEmpList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpEmpList.SelectedIndexChanged

        If drpEmpList.SelectedValue = "N\A" Then
            MessageBox("Select An Employee")
            ClearForm()
            Exit Sub
        End If

        btnAdd.Enabled = True
        btnRemove.Enabled = True
        ShowAllData(drpEmpList.SelectedValue)

    End Sub

    Protected Sub ShowAllData(ByVal EmployeeID As String)
        lstBxPermittedDesignation.DataTextField = "DesignationName"
        lstBxPermittedDesignation.DataValueField = "SalGenPermissionID"
        lstBxPermittedDesignation.DataSource = SalGenData.fnGetUserWiseSalGenPermission(EmployeeID)
        lstBxPermittedDesignation.DataBind()

        lstBxYetToAddDesignation.DataTextField = "DesignationName"
        lstBxYetToAddDesignation.DataValueField = "DesignationID"
        lstBxYetToAddDesignation.DataSource = SalGenData.fnGetSalGenPerYetToAdd(EmployeeID)
        lstBxYetToAddDesignation.DataBind()
    End Sub

    Protected Sub ClearForm()
        lstBxPermittedDesignation.DataSource = ""
        lstBxPermittedDesignation.DataBind()

        lstBxYetToAddDesignation.DataSource = ""
        lstBxYetToAddDesignation.DataBind()

        btnAdd.Enabled = False
        btnRemove.Enabled = False
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowUserList()
            GetSalGenEmpList()
            btnAdd.Enabled = False
            btnRemove.Enabled = False
        End If
    End Sub

    Protected Sub GetSalGenEmpList()
        drpEmpList.DataTextField = "EmployeeName"
        drpEmpList.DataValueField = "EmployeeID"
        drpEmpList.DataSource = SalGenData.fnGetSalGenPermittedEmpList()
        drpEmpList.DataBind()

        Dim A As New ListItem
        A.Text = "N\A"
        A.Value = "N\A"

        drpEmpList.Items.Insert(0, A)
    End Sub

    Protected Sub ShowUserList()
        drpUserList.DataTextField = "EmployeeName"
        drpUserList.DataValueField = "EmployeeID"
        drpUserList.DataSource = EmpInfoData.fnGetEmployeeList()
        drpUserList.DataBind()

        Dim A As New ListItem()

        A.Text = "N\A"
        A.Value = "N\A"

        drpUserList.Items.Insert(0, A)
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        If drpEmpList.SelectedValue = "N\A" Then
            MessageBox("Select An Employee")
            Exit Sub
        End If

        If lstBxYetToAddDesignation.SelectedIndex = -1 Then
            MessageBox("Select A Designation For New Permission")
            Exit Sub
        End If

        Dim SalGenPer As New clsSalGenPermission()
        SalGenPer.DesignationID = lstBxYetToAddDesignation.SelectedValue
        SalGenPer.EmployeeID = drpEmpList.SelectedValue
        SalGenPer.EntryBy = Session("LoginUserID")

        Dim Check As Integer = SalGenData.fnInsertSalGenPermission(SalGenPer)

        If Check = 1 Then
            ShowAllData(drpEmpList.SelectedValue)
            MessageBox("Inserted Successfully.")
        Else
            MessageBox("Error Found: e.g. Cann't Insert Duplicate Designation")
        End If

    End Sub

    Protected Sub btnRemove_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRemove.Click
        If drpEmpList.SelectedValue = "N\A" Then
            MessageBox("Select An Employee")
            Exit Sub
        End If

        If lstBxPermittedDesignation.SelectedIndex = -1 Then
            MessageBox("Select A Designation To Revoke")
            Exit Sub
        End If

        Dim SalGenPer As New clsSalGenPermission()
        SalGenPer.SalGenPermissionID = lstBxPermittedDesignation.SelectedValue
        SalGenPer.EntryBy = Session("LoginUserID")

        Dim Check As Integer = SalGenData.fnRevokeSalGenPermission(SalGenPer)

        If Check = 1 Then
            ShowAllData(drpEmpList.SelectedValue)
            MessageBox("Permission Revoked Successfully.")
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Sub btnAddEmpToSalGenPer_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddEmpToSalGenPer.Click

        Dim Exists As Boolean = False
        For Each itm As ListItem In drpEmpList.Items
            If itm.Value = drpUserList.SelectedValue Then
                MessageBox("Already Exists In The List.")
                Exists = True
            End If
        Next

        If Exists = False Then
            Dim A As New ListItem
            A.Text = drpUserList.SelectedItem.Text
            A.Value = drpUserList.SelectedValue
            drpEmpList.Items.Insert(drpEmpList.Items.Count, A)
        End If

    End Sub
End Class

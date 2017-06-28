
Partial Class LeaveManagement_frmAttSettlementFinal
    Inherits System.Web.UI.Page

    Dim UsrAttData As New clsUserAttendanceDataAccess()
    Dim EmpInfoData As New clsEmployeeInfoDataAccess()

    Protected Sub btnProcessReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcessReport.Click

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'Dim MenuIDs As String

            'MenuIDs = Session("PermittedMenus")

            'If InStr(MenuIDs, "AttSettFinal~") = 0 Then
            '    Response.Redirect("~\frmHRMLogin.aspx")
            'End If

            If Not IsPostBack Then
                ShowUserList()
            End If
        End If
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

End Class

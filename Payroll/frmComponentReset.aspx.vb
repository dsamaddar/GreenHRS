
Partial Class Payroll_frmComponentReset
    Inherits System.Web.UI.Page

    Dim CompData As New clsComponentDefinitionDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetResetNeededComp()
        End If
    End Sub

    Protected Sub GetResetNeededComp()
        grdComponentUsage.DataSource = CompData.fnGetResetNeededCompList()
        grdComponentUsage.DataBind()
    End Sub

    Protected Sub btnReload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReload.Click
        GetResetNeededComp()
    End Sub
End Class


Partial Class Payroll_frmSalComponnetUsage
    Inherits System.Web.UI.Page

    Dim ComponentData As New clsComponentDefinitionDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowComponentList()
        End If
    End Sub

    Protected Sub ShowComponentList()
        drpComponentList.DataTextField = "Component"
        drpComponentList.DataValueField = "ComponentID"
        drpComponentList.DataSource = ComponentData.fnShowComponentList()
        drpComponentList.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "N\A"
        drpComponentList.Items.Insert(0, A)

    End Sub

    Protected Sub drpComponentList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpComponentList.SelectedIndexChanged
        ShowCompWiseEmpList(drpComponentList.SelectedValue)
    End Sub

    Protected Sub ShowCompWiseEmpList(ByVal ComponentID As String)
        grdComponentUsage.DataSource = ComponentData.fnGetCompWiseEmpList(ComponentID)
        grdComponentUsage.DataBind()
    End Sub

End Class

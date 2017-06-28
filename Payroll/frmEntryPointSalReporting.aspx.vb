
Partial Class Payroll_frmEntryPointSalReporting
    Inherits System.Web.UI.Page

    Dim SalProcessData As New clsSalaryProcessDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowEntryPoints()
        End If
    End Sub

    Protected Sub ShowEntryPoints()
        chkBxSalEntryPoint.DataTextField = "EntryPointText"
        chkBxSalEntryPoint.DataValueField = "EntryPoint"
        chkBxSalEntryPoint.DataSource = SalProcessData.fnFindProcessEntryPoint()
        chkBxSalEntryPoint.DataBind()
    End Sub

    Protected Sub btnProcessReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcessReport.Click

    End Sub

End Class

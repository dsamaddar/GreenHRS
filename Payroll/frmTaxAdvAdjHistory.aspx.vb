
Partial Class Payroll_frmTaxAdvAdjHistory
    Inherits System.Web.UI.Page

    Dim TaxAdvAdjData As New clsTaxAdvAdjHistoryDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim TaxAdvanceID As String = Request.QueryString("TaxAdvanceID")

            grdTaxAdvAdjHistory.DataSource = TaxAdvAdjData.fnGetTaxAdvAdjHistoryByAdvID(TaxAdvanceID)
            grdTaxAdvAdjHistory.DataBind()

        End If
    End Sub


End Class

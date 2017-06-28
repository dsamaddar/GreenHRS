
Partial Class EmployeeProfile_frmBenefitDetailsView
    Inherits System.Web.UI.Page

    Dim LoanAppData As New clsLoanApplicationDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim BenefitID As String = Request.QueryString("BenefitID")

            grdBenefitDetailsView.DataSource = LoanAppData.fnGetBenefitDetailsToView(BenefitID)
            grdBenefitDetailsView.DataBind()

        End If
    End Sub
End Class

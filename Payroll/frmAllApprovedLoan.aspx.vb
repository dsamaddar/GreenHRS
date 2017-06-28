
Partial Class Payroll_frmAllApprovedLoan
    Inherits System.Web.UI.Page

    Dim EmpLoanAccData As New clsEmpLoanAccountDataAccess()
    Dim BenefitTypeData As New clsBenefitTypeDataAccess()
    Dim MobileBenfitData As New clsMobileBenefitDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetBenefitType()
            txtStartDate.Text = Now.Month.ToString() + "/1/" + Now.Year.ToString()
            txtEndDate.Text = Now.Month.ToString() + "/" + Now.Day.ToString() + "/" + Now.Year.ToString()
        End If
    End Sub

    Protected Sub GetBenefitType()
        drpBenefitType.DataTextField = "BenefitType"
        drpBenefitType.DataValueField = "BenefitTypeID"
        drpBenefitType.DataSource = BenefitTypeData.fnGetBenefitList()
        drpBenefitType.DataBind()
    End Sub

    Protected Sub GetAllApprovedLoanAccount(ByVal BenefitTypeID As String, ByVal StartDate As Date, ByVal EndDate As Date)
        grdEmpLoanAcc.DataSource = EmpLoanAccData.fnGetAllApprovedLoanAcc(BenefitTypeID, StartDate, EndDate)
        grdEmpLoanAcc.DataBind()
    End Sub

    Protected Sub btnFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFilter.Click
        Try
            GetAllApprovedLoanAccount(drpBenefitType.SelectedValue, Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text))
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnMobileEntitlementRpt_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMobileEntitlementRpt.Click
        Try
            grdMobEntRpt.DataSource = MobileBenfitData.fnGetMobileEntitlementRpt(Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text))
            grdMobEntRpt.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

End Class

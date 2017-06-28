
Partial Class EmployeeProfile_frmCostOfTheCompany
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim EmployeeID As String = Request.QueryString("EmployeeID")
            Dim COC As New clsCOC()

            Try
                COC = COC.fnGetCOCByEmp(EmployeeID)

                lblBasic.Text = String.Format("{0:N2}", COC.BasicSalary)
                lblHouseRent.Text = String.Format("{0:N2}", COC.HouseRent)
                lblTransport.Text = String.Format("{0:N2}", COC.TransportAllowance)
                lblSalary.Text = String.Format("{0:N2}", COC.Salary)

                lblEmpContribution.Text = String.Format("{0:N2}", COC.PFContribution)
                lblPF.Text = String.Format("{0:N2}", COC.PFContribution)

                lblFestivalComponent.Text = String.Format("{0:N2}", COC.FestivalComponent)
                lblMobile.Text = String.Format("{0:N2}", COC.MobileAllowance)
                lblLocalConveyence.Text = String.Format("{0:N2}", COC.LocalConveyance)
                lblMedicalAllowance.Text = String.Format("{0:N2}", COC.MedicalAllowance)
                lblMotorBikeAllow.Text = String.Format("{0:N2}", COC.MotorbikeAllowance)
                lblSpecialAllow.Text = String.Format("{0:N2}", COC.SpecialAllowance)
                lblBenefits.Text = String.Format("{0:N2}", COC.Benefits)

                lblDriverAllow.Text = String.Format("{0:N2}", COC.DriverAllowance)
                lblCarMaintenance.Text = String.Format("{0:N2}", COC.VehicleMaintenance)
                lblCarSubsidyAllow.Text = String.Format("{0:N2}", COC.CarSubsidy)
                lblAllwFuelExp.Text = String.Format("{0:N2}", COC.FuelAllowance)

                lblTransportAllowance.Text = String.Format("{0:N2}", COC.TotalTransport)

                lblFestivalAllowance.Text = String.Format("{0:N2}", COC.FestivalComponent)
                lblBonusMonthlyEqui.Text = String.Format("{0:N2}", COC.FestivalComponent)

                lblTotalCashComp.Text = String.Format("{0:N2}", COC.TotalCashComp)

            Catch ex As Exception
                MessageBox(ex.Message)
            End Try
        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

End Class

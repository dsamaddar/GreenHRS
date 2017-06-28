Imports System.IO

Partial Class Payroll_frmSalaryLargeReport
    Inherits System.Web.UI.Page

    Dim EmpSalSumData As New clsEmpSalSummaryDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            drpSalaryYear.SelectedValue = Now.Year
            drpSalaryMonth.SelectedValue = Now.Month
        End If
    End Sub

    Protected Sub btnShowReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowReport.Click

        grdSalLargeReport.DataSource = EmpSalSumData.fnGenerateSalReportLarge(Convert.ToInt32(drpSalaryYear.SelectedValue), Convert.ToInt32(drpSalaryMonth.SelectedValue))
        grdSalLargeReport.DataBind()

    End Sub


    Protected Sub imgBtnExport_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnExport.Click
        Dim sw As New StringWriter()
        Dim hw As New System.Web.UI.HtmlTextWriter(sw)
        Dim frm As HtmlForm = New HtmlForm()

        Page.Response.AddHeader("content-disposition", "attachment;filename=SalaryLargeReport.xls")
        Page.Response.ContentType = "application/vnd.ms-excel"
        Page.Response.Charset = ""
        Page.EnableViewState = False
        frm.Attributes("runat") = "server"
        Controls.Add(frm)
        frm.Controls.Add(grdSalLargeReport)
        frm.RenderControl(hw)
        Response.Write(sw.ToString())
        Response.End()

    End Sub

    Dim TotalBasicSal As Double = 0
    Dim TotalHouseRent As Double = 0
    Dim TotalMobileAllowance As Double = 0
    Dim TotalLocalConveyance As Double = 0
    Dim TotalTransport As Double = 0
    Dim TotalArrear As Double = 0

    Dim TotalFestivalAllowance As Double = 0
    Dim TotalMedicalAllowance As Double = 0
    Dim TotalMotorbikeAllowance As Double = 0
    Dim TotalProfessionalAllowance As Double = 0
    Dim TotalSpecialAllowance As Double = 0
    Dim TotalFestival As Double = 0
    Dim TotalPerformance As Double = 0
    Dim TotalBenefit As Double = 0
    Dim TotalAccountRecoverable As Double = 0
    Dim TotalPF As Double = 0

    Dim TotalINSPF As Double = 0
    Dim TotalINSCAR As Double = 0
    Dim TotalINSGEN As Double = 0
    Dim TotalOther As Double = 0
    Dim TotalTax As Double = 0
    Dim TotalDeduction As Double = 0
    Dim Total As Double = 0

    Protected Sub grdSalLargeReport_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdSalLargeReport.RowDataBound

        Dim lblBasicSal, lblHouseRent, lblMobileAllowance, lblLocalConveyance, lblTransport, lblArrear, _
        lblFestivalAllowance, lblMedicalAllowance, lblMotorbikeAllowance, lblProfessionalAllowance, _
        lblSpecialAllowance, lblFestival, lblPerformance, lblTotalBenefit, lblAccountRecoverable, lblPF, _
        lblINSPF, lblINSCAR, lblINSGEN, lblOther, lblTax, lblTotalDeduction, lblTotal As New Label

        lblBasicSal = e.Row.FindControl("lblBasicSal")
        lblHouseRent = e.Row.FindControl("lblHouseRent")
        lblMobileAllowance = e.Row.FindControl("lblMobileAllowance")
        lblLocalConveyance = e.Row.FindControl("lblLocalConveyance")
        lblTransport = e.Row.FindControl("lblTransport")
        lblArrear = e.Row.FindControl("lblArrear")
        lblLocalConveyance = e.Row.FindControl("lblLocalConveyance")
        lblTransport = e.Row.FindControl("lblTransport")
        lblArrear = e.Row.FindControl("lblArrear")
        lblFestivalAllowance = e.Row.FindControl("lblFestivalAllowance")
        lblMedicalAllowance = e.Row.FindControl("lblMedicalAllowance")
        lblMotorbikeAllowance = e.Row.FindControl("lblMotorbikeAllowance")
        lblProfessionalAllowance = e.Row.FindControl("lblProfessionalAllowance")
        lblSpecialAllowance = e.Row.FindControl("lblSpecialAllowance")
        lblFestival = e.Row.FindControl("lblFestival")
        lblPerformance = e.Row.FindControl("lblPerformance")
        lblTotalBenefit = e.Row.FindControl("lblTotalBenefit")
        lblAccountRecoverable = e.Row.FindControl("lblAccountRecoverable")
        lblPF = e.Row.FindControl("lblPF")
        lblINSPF = e.Row.FindControl("lblINSPF")
        lblINSCAR = e.Row.FindControl("lblINSCAR")
        lblINSGEN = e.Row.FindControl("lblINSGEN")
        lblOther = e.Row.FindControl("lblOther")
        lblTax = e.Row.FindControl("lblTax")
        lblTotalDeduction = e.Row.FindControl("lblTotalDeduction")
        lblTotal = e.Row.FindControl("lblTotal")

        If e.Row.RowType = DataControlRowType.DataRow Then
            TotalBasicSal += Convert.ToDouble(lblBasicSal.Text)
            TotalHouseRent += Convert.ToDouble(lblHouseRent.Text)
            TotalMobileAllowance += Convert.ToDouble(lblMobileAllowance.Text)
            TotalLocalConveyance += Convert.ToDouble(lblLocalConveyance.Text)
            TotalTransport += Convert.ToDouble(lblTransport.Text)
            TotalArrear += Convert.ToDouble(lblArrear.Text)
            TotalFestivalAllowance += Convert.ToDouble(lblFestivalAllowance.Text)
            TotalMedicalAllowance += Convert.ToDouble(lblMedicalAllowance.Text)
            TotalMotorbikeAllowance += Convert.ToDouble(lblMotorbikeAllowance.Text)
            TotalProfessionalAllowance += Convert.ToDouble(lblProfessionalAllowance.Text)
            TotalSpecialAllowance += Convert.ToDouble(lblSpecialAllowance.Text)
            TotalFestival += Convert.ToDouble(lblFestival.Text)
            TotalPerformance += Convert.ToDouble(lblPerformance.Text)
            TotalBenefit += Convert.ToDouble(lblTotalBenefit.Text)
            TotalAccountRecoverable += Convert.ToDouble(lblAccountRecoverable.Text)
            TotalPF += Convert.ToDouble(lblPF.Text)
            TotalINSPF += Convert.ToDouble(lblINSPF.Text)
            TotalINSCAR += Convert.ToDouble(lblINSCAR.Text)
            TotalINSGEN += Convert.ToDouble(lblINSGEN.Text)
            TotalOther += Convert.ToDouble(lblOther.Text)
            TotalTax += Convert.ToDouble(lblTax.Text)
            TotalDeduction += Convert.ToDouble(lblTotalDeduction.Text)
            Total += Convert.ToDouble(lblTotal.Text)

        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(1).Text = "Total:"
            e.Row.Cells(2).Text = grdSalLargeReport.Rows.Count.ToString()
            e.Row.Cells(4).Text = TotalBasicSal.ToString()
            e.Row.Cells(5).Text = TotalHouseRent.ToString()
            e.Row.Cells(6).Text = TotalMobileAllowance.ToString()
            e.Row.Cells(7).Text = TotalLocalConveyance.ToString()
            e.Row.Cells(8).Text = TotalTransport.ToString()
            e.Row.Cells(9).Text = TotalArrear.ToString()
            e.Row.Cells(10).Text = TotalFestivalAllowance.ToString()
            e.Row.Cells(11).Text = TotalMedicalAllowance.ToString()
            e.Row.Cells(12).Text = TotalMotorbikeAllowance.ToString()
            e.Row.Cells(13).Text = TotalProfessionalAllowance.ToString()
            e.Row.Cells(14).Text = TotalSpecialAllowance.ToString()
            e.Row.Cells(15).Text = TotalFestival.ToString()
            e.Row.Cells(16).Text = TotalPerformance.ToString()
            e.Row.Cells(17).Text = TotalBenefit.ToString()
            e.Row.Cells(18).Text = TotalAccountRecoverable.ToString()
            e.Row.Cells(19).Text = TotalPF.ToString()
            e.Row.Cells(20).Text = TotalINSPF.ToString()
            e.Row.Cells(21).Text = TotalINSCAR.ToString()
            e.Row.Cells(22).Text = TotalINSGEN.ToString()
            e.Row.Cells(23).Text = TotalOther.ToString()
            e.Row.Cells(24).Text = TotalTax.ToString()
            e.Row.Cells(25).Text = TotalDeduction.ToString()
            e.Row.Cells(26).Text = Total.ToString()
        End If
    End Sub

End Class

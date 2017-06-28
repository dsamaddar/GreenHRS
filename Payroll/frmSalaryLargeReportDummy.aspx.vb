Imports System.IO

Partial Class Payroll_frmSalaryLargeReportDummy
    Inherits System.Web.UI.Page

    Dim EmpSalSumData As New clsEmpSalSummaryDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        
    End Sub

    Protected Sub btnShowReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowReport.Click

        Dim WithFestival As Boolean = False
        Dim WithPB As Boolean = False

        If chkWithFestivalBonus.Checked = True Then
            WithFestival = True
        End If

        If chkWithPerformanceBonus.Checked = True Then
            WithPB = True
        End If

        grdSalLargeReport.DataSource = EmpSalSumData.fnProcessDummySalary(WithFestival, WithPB)
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

End Class

Imports System.IO
Imports System.IO.StreamWriter
Imports System.Data

Partial Class frmGratuityCalculation
    Inherits System.Web.UI.Page

    Dim TotalGratuity As Double = 0
    Dim EmpBasicData As New clsEmpBasicProfileDataAccess()

    Protected Sub btnProcessReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcessReport.Click
        Try
            grdGratuityCalculation.DataSource = EmpBasicData.fnGratuityCalculation(txtAsOnDate.Text)
            grdGratuityCalculation.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
        
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtAsOnDate.Text = Now.Date
        End If
    End Sub

    Protected Sub grdGratuityCalculation_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdGratuityCalculation.RowDataBound
        Dim lblGratuityValue As New Label()
        If e.Row.RowType = DataControlRowType.DataRow Then
            lblGratuityValue = e.Row.FindControl("lblGratuityValue")
            TotalGratuity += Convert.ToDouble(lblGratuityValue.Text)
        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(9).Text = "Total:"
            e.Row.Cells(10).Text = TotalGratuity.ToString("N2")
        End If

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub imgBtnExportResult_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnExportResult.Click
        Dim sw As New StringWriter()
        Dim hw As New System.Web.UI.HtmlTextWriter(sw)
        Dim frm As HtmlForm = New HtmlForm()

        Dim AsOnDate As String = Year(txtAsOnDate.Text).ToString() & "-" & Month(txtAsOnDate.Text).ToString() & "-" & Day(txtAsOnDate.Text).ToString()
        Dim DocName As String = "GratuityCalculation" & AsOnDate

        Page.Response.AddHeader("content-disposition", "attachment;filename=" & DocName & ".xls")
        Page.Response.ContentType = "application/vnd.ms-excel"
        Page.Response.Charset = ""
        Page.EnableViewState = False
        frm.Attributes("runat") = "server"
        Controls.Add(frm)
        frm.Controls.Add(grdGratuityCalculation)
        frm.RenderControl(hw)
        Response.Write(sw.ToString())
        Response.End()
    End Sub

End Class

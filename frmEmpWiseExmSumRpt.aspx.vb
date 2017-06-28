Imports System.IO

Partial Class frmEmpWiseExmSumRpt
    Inherits System.Web.UI.Page

    Dim EmpInfoData As New clsEmployeeInfoDataAccess()
    Dim ExamData As New clsExamDataAccess()

    Protected Sub btnShowResult_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowResult.Click

        If drpUserList.SelectedValue = "N\A" Then
            MessageBox("Select An Employee First")
            Exit Sub
        End If

        grdEmpWiseExmSumRpt.DataSource = ""
        grdEmpWiseExmSumRpt.DataBind()

        Try
            grdEmpWiseExmSumRpt.DataSource = ExamData.fnGetEmpWiseExamSummary(drpUserList.SelectedValue)
            grdEmpWiseExmSumRpt.DataBind()
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowUserList()
        End If
    End Sub

    Protected Sub ShowUserList()
        drpUserList.DataTextField = "EmployeeName"
        drpUserList.DataValueField = "EmployeeID"
        drpUserList.DataSource = EmpInfoData.fnGetEmployeeList()
        drpUserList.DataBind()

        Dim A As New ListItem()

        A.Text = "N\A"
        A.Value = "N\A"

        drpUserList.Items.Insert(0, A)
    End Sub


    Protected Sub imgBtnExport_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnExport.Click
        Dim sw As New StringWriter()
        Dim hw As New System.Web.UI.HtmlTextWriter(sw)
        Dim frm As HtmlForm = New HtmlForm()

        Page.Response.AddHeader("content-disposition", "attachment;filename=EmpWiseExamSummary.xls")
        Page.Response.ContentType = "application/vnd.ms-excel"
        Page.Response.Charset = ""
        Page.EnableViewState = False
        frm.Attributes("runat") = "server"
        Controls.Add(frm)
        frm.Controls.Add(grdEmpWiseExmSumRpt)
        frm.RenderControl(hw)
        Response.Write(sw.ToString())
        Response.End()
    End Sub
End Class

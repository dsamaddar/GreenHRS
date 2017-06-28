
Partial Class Payroll_frmReverseSalary
    Inherits System.Web.UI.Page

    Dim SalProcessData As New clsSalaryProcessDataAccess()

    Protected Sub btnFinalizeSalary_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFinalizeSalary.Click
        Try
            Dim Check As Integer = SalProcessData.fnFinalizeEntryPoint(drpFinalizeEntryPoints.SelectedValue)
            If Check = 1 Then
                ShowEntryPoints()
                MessageBox("Entry Point Finalized.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
        
    End Sub

    Protected Sub btnReverseSalary_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReverseSalary.Click
        Try
            Dim Check As Integer = SalProcessData.fnReverseSalByEntryPoint(drpReverseSalaryEntryPoint.SelectedValue)
            If Check = 1 Then
                ShowEntryPoints()
                MessageBox("Entry Point Reversed.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
        
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowEntryPoints()
        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub ShowEntryPoints()
        drpFinalizeEntryPoints.DataTextField = "EntryPointText"
        drpFinalizeEntryPoints.DataValueField = "EntryPoint"
        drpFinalizeEntryPoints.DataSource = SalProcessData.fnFindProssEntPntToFinalize()
        drpFinalizeEntryPoints.DataBind()

        drpReverseSalaryEntryPoint.DataTextField = "EntryPointText"
        drpReverseSalaryEntryPoint.DataValueField = "EntryPoint"
        drpReverseSalaryEntryPoint.DataSource = SalProcessData.fnFindProssEntPntToFinalize()
        drpReverseSalaryEntryPoint.DataBind()
    End Sub

End Class

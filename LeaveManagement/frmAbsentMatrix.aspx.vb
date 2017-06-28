
Partial Class LeaveManagement_frmAbsentMatrix
    Inherits System.Web.UI.Page

    Dim UsrAttData As New clsUserAttendanceDataAccess()

    Protected Sub btnShow_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShow.Click

        ShowAbsentMatrix(Convert.ToDateTime(txtDateFrom.Text), Convert.ToDateTime(txtDateTo.Text))

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtDateFrom.Text = Now.Month.ToString() + "/1/" + Now.Year.ToString()
            txtDateTo.Text = Now.Date

        End If
    End Sub

    Protected Sub ShowAbsentMatrix(ByVal DateFrom As DateTime, ByVal DateTo As DateTime)
        grdAbsentMatrix.DataSource = UsrAttData.fnGetAbsentMatrix(DateFrom, DateTo)
        grdAbsentMatrix.DataBind()
    End Sub

    Protected Sub btnDedFrmLeaveBalance_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDedFrmLeaveBalance.Click

        If grdAbsentMatrix.SelectedIndex = -1 Then
            MessageBox("Select An Employee First.")
            Exit Sub
        End If



    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

End Class

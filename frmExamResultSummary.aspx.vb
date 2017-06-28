
Partial Class frmExamResultSummary
    Inherits System.Web.UI.Page

    Dim ExamData As New clsExamDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetAvailableExams()
        End If
    End Sub

    Protected Sub GetAvailableExams()
        chkLstExamList.DataTextField = "ExamName"
        chkLstExamList.DataValueField = "ExamID"
        chkLstExamList.DataSource = ExamData.fnGetAvailableExams()
        chkLstExamList.DataBind()
    End Sub

    Protected Sub chkSelectAll_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkSelectAll.CheckedChanged
        If chkSelectAll.Checked = True Then
            For Each itm As ListItem In chkLstExamList.Items
                itm.Selected = True
            Next

            chkSelectAll.Text = "Un Select All"
        Else
            For Each itm As ListItem In chkLstExamList.Items
                itm.Selected = False
            Next

            chkSelectAll.Text = "Select All"
        End If
    End Sub

    Protected Sub btnProcessReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcessReport.Click

        Dim ExamIDList As String = ""
        For Each itm As ListItem In chkLstExamList.Items
            If itm.Selected = True Then
                ExamIDList += itm.Value + ","
            End If
        Next

        If ExamIDList = "" Then
            MessageBox("Select At Least One Exam")
            Exit Sub
        Else
            ExamIDList = ExamIDList.Remove(Len(ExamIDList) - 1, 1)
        End If

        grdExamResultSummary.DataSource = ExamData.fnGetExamResultSummary(ExamIDList, Convert.ToInt32(drpPassMark.SelectedValue))
        grdExamResultSummary.DataBind()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

End Class

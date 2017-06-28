
Partial Class EmployeeProfile_frmEmpSkillSet
    Inherits System.Web.UI.Page

    Dim ExamData As New clsExamDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Try
                Dim EmployeeID As String = Request.QueryString("EmployeeID")
                GetSkillSet(EmployeeID)
            Catch ex As Exception
                MessageBox(ex.Message)
            End Try
        End If

        'If grdEmpWiseExmSumRpt.Rows.Count > 0 Then
        '    'This replaces <td> with <th> and adds the scope attribute
        '    grdEmpWiseExmSumRpt.UseAccessibleHeader = True
        '    'This will add the <thead> and <tbody> elements
        '    grdEmpWiseExmSumRpt.HeaderRow.TableSection = TableRowSection.TableHeader
        '    'This adds the <tfoot> element.Remove if you don't have a footer row
        '    grdEmpWiseExmSumRpt.FooterRow.TableSection = TableRowSection.TableFooter
        'End If
    End Sub

    Protected Sub GetSkillSet(ByVal EmployeeID As String)
        Try
            grdEmpSkillSet.DataSource = ExamData.fnGetEmpWiseExamSummary(EmployeeID).Tables(0)
            grdEmpSkillSet.DataBind()
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

End Class

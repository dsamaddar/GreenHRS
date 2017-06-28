
Partial Class EmployeeProfile_frmEmpTransitionHistory
    Inherits System.Web.UI.Page

    Dim EmpInfoData As New clsEmployeeInfoDataAccess()
    Dim DocumentListData As clsDocumentListDataAccess = New clsDocumentListDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Dim EmployeeID As String = Request.QueryString("EmployeeID")
            GetTransitionHistory(EmployeeID)
        End If

        If grdEmpTranHistory.Rows.Count > 0 Then
            'This replaces <td> with <th> and adds the scope attribute
            grdEmpTranHistory.UseAccessibleHeader = True
            'This will add the <thead> and <tbody> elements
            grdEmpTranHistory.HeaderRow.TableSection = TableRowSection.TableHeader
            'This adds the <tfoot> element.Remove if you don't have a footer row
            grdEmpTranHistory.FooterRow.TableSection = TableRowSection.TableFooter
        End If

    End Sub

    Protected Sub GetTransitionHistory(ByVal EmployeeID As String)
        grdEmpTranHistory.DataSource = EmpInfoData.fnGetEmpTransitionNew(EmployeeID)
        grdEmpTranHistory.DataBind()
    End Sub

    Protected Sub grdEmpTranHistory_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdEmpTranHistory.RowDeleting
        Try
            Dim lblTransitionHistoryID As New Label
            lblTransitionHistoryID = grdEmpTranHistory.Rows(e.RowIndex).FindControl("lblTransitionHistoryID")

            Dim Check As Integer = EmpInfoData.fnDeleteEmpTransition(lblTransitionHistoryID.Text)

            If Check = 1 Then
                MessageBox("Transition Deleted.")
                Dim EmployeeID As String = Request.QueryString("EmployeeID")
                GetTransitionHistory(EmployeeID)
            End If
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

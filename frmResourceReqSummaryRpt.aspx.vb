
Partial Class frmResourceReqSummaryRpt
    Inherits System.Web.UI.Page

    Dim ResReqData As New clsResourceReqDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetResReqSummaryRpt()
        End If
    End Sub

    Protected Sub GetResReqSummaryRpt()
        grdResReqSummary.DataSource = ResReqData.fnGetResReqSummaryReport()
        grdResReqSummary.DataBind()
    End Sub

End Class

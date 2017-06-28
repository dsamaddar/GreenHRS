
Partial Class frmResourceRequirement
    Inherits System.Web.UI.Page

    Dim ResReqData As New clsResourceReqDataAccess()
    Dim resreqno As Integer = 0
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetResourceReq()
            ClearForm()
        End If
    End Sub

    Protected Sub ClearForm()
        btnProvided.Enabled = False
        btnRejected.Enabled = False
        hdfldResourceReqID.Value = ""
        txtResourceProvidedOn.Text = Now.Month.ToString() + "/" + Now.Day.ToString() + "/" + Now.Year.ToString()
        txtProvidedResource.Text = ""
        txtProviderRemarks.Text = ""

        If grdPendingResourceReq.Rows.Count > 0 Then
            grdPendingResourceReq.SelectedIndex = -1
        End If

    End Sub

    Protected Sub GetResourceReq()
        grdPendingResourceReq.DataSource = ResReqData.fnGetResourceReq()
        grdPendingResourceReq.DataBind()
    End Sub

    Protected Sub grdPendingResourceReq_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdPendingResourceReq.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then
            resreqno += 1
        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(2).Text = "Total Requests : " + resreqno.ToString
        End If

    End Sub

    Protected Sub grdPendingResourceReq_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdPendingResourceReq.SelectedIndexChanged

        Dim lblResourceReqID, lblReqNoOfResource As New Label
        lblResourceReqID = grdPendingResourceReq.SelectedRow.FindControl("lblResourceReqID")
        lblReqNoOfResource = grdPendingResourceReq.SelectedRow.FindControl("lblReqNoOfResource")

        hdfldResourceReqID.Value = lblResourceReqID.Text
        txtProvidedResource.Text = lblReqNoOfResource.Text
        btnProvided.Enabled = True
        btnRejected.Enabled = True

    End Sub

    Protected Sub btnProvided_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProvided.Click

        Dim ResReq As New clsResourceReq()

        Try
            ResReq.ResourceReqID = hdfldResourceReqID.Value
            ResReq.ProvidedBy = Session("UniqueUserID")
            ResReq.ProviderRemarks = txtProviderRemarks.Text
            ResReq.ProvidedOn = Convert.ToDateTime(txtResourceProvidedOn.Text)
            ResReq.ProvidedNoOfResource = Convert.ToInt32(txtProvidedResource.Text)
            ResReq.ProvidedStatus = "Provided"

            Dim Check As Integer = ResReqData.fnProvideSupportForResReq(ResReq)

            If Check = 1 Then
                ClearForm()
                GetResourceReq()
                MessageBox("Process Done.")
            End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub btnRejected_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRejected.Click
        Dim ResReq As New clsResourceReq()

        Try
            ResReq.ResourceReqID = hdfldResourceReqID.Value
            ResReq.ProvidedBy = Session("UniqueUserID")
            ResReq.ProviderRemarks = txtProviderRemarks.Text
            ResReq.ProvidedOn = Convert.ToDateTime(txtResourceProvidedOn.Text)
            ResReq.ProvidedNoOfResource = Convert.ToInt32(txtProvidedResource.Text)
            ResReq.ProvidedStatus = "Rejected"

            Dim Check As Integer = ResReqData.fnProvideSupportForResReq(ResReq)

            If Check = 1 Then
                ClearForm()
                GetResourceReq()
                MessageBox("Process Done.")
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

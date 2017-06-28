Imports System.Net
Imports System.IO

Partial Class frmBranchWiseExamAttendee
    Inherits System.Web.UI.Page

    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim ExamData As New clsExamDataAccess()

    Protected Sub btnShowReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowReport.Click
        Try
            If Convert.ToDateTime(txtStartDate.Text) > Convert.ToDateTime(txtEndDate.Text) Then
                Dim a As DateTime = txtStartDate.Text
                txtStartDate.Text = txtEndDate.Text
                txtEndDate.Text = a
            End If

            grdExamAttendeeReport.DataSource = ExamData.fnGetBranchWiseExamAttendee(ddlULCBranch.SelectedValue, Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text))
            grdExamAttendeeReport.DataBind()
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
            ShowULCBranch()
            txtStartDate.Text = Now.Date
            txtEndDate.Text = DateAdd(DateInterval.Day, 1, Now.Date)
        End If
    End Sub

    Protected Sub ShowULCBranch()
        ddlULCBranch.DataTextField = "ULCBranchName"
        ddlULCBranch.DataValueField = "ULCBranchID"
        ddlULCBranch.DataSource = EmployeeInfoData.fnGetULCBranch()
        ddlULCBranch.DataBind()

        Dim A As New ListItem()
        A.Text = "All"
        A.Value = "All"
        ddlULCBranch.Items.Insert(0, A)
    End Sub

    Protected Sub grdExamAttendeeReport_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdExamAttendeeReport.RowDataBound
        Dim lblExamTakerID, lblPassword, lblPhotoID As New Label()
        Dim imgEmployee As New Image

        If e.Row.RowType = DataControlRowType.DataRow Then
            lblExamTakerID = e.Row.FindControl("lblExamTakerID")
            If lblExamTakerID.Text.Contains("EMP") Then
                lblPassword = e.Row.FindControl("lblPassword")
                lblPassword.Text = "****"
            End If

            lblPhotoID = e.Row.FindControl("lblPhotoID")
            imgEmployee = e.Row.FindControl("imgEmployee")

            Dim tClient As WebClient = New WebClient
            Dim memStrmPic As MemoryStream = New MemoryStream(tClient.DownloadData(ConfigurationManager.AppSettings("AttachmentsShow") & lblPhotoID.Text))
            Dim bytesPic As Byte() = memStrmPic.ToArray()
            Dim base64StringPic As String = Convert.ToBase64String(bytesPic, 0, bytesPic.Length)
            imgEmployee.ImageUrl = "data:image/png;base64," & base64StringPic
            memStrmPic.Dispose()

        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(2).Text = "Total:"
            e.Row.Cells(3).Text = grdExamAttendeeReport.Rows.Count.ToString()
        End If

    End Sub
End Class

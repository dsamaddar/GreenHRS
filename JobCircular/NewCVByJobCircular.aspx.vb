
Partial Class JobCircular_NewCVByJobCircular
    Inherits System.Web.UI.Page
    Protected Sub chkHead_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim chk As System.Web.UI.WebControls.CheckBox
        Dim chkIn As System.Web.UI.WebControls.CheckBox

        chk = grdApplicaiton.HeaderRow.FindControl("chkHead")

        For Each rw As GridViewRow In grdApplicaiton.Rows
            chkIn = rw.FindControl("chkSelect")
            chkIn.Checked = chk.Checked
        Next


    End Sub

    Protected Sub chkSelect_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim chk As System.Web.UI.WebControls.CheckBox
        Dim chkIn As System.Web.UI.WebControls.CheckBox
        Dim flag As Boolean

        chk = grdApplicaiton.HeaderRow.FindControl("chkHead")
        flag = True
        For Each rw As GridViewRow In grdApplicaiton.Rows
            chkIn = rw.FindControl("chkSelect")
            If chkIn.Checked = False Then
                flag = False
                Exit For
            End If
        Next

        chk.Checked = flag
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If
    End Sub

    Protected Sub grdApplicaiton_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdApplicaiton.RowDataBound
        Try
            e.Row.Cells(0).Visible = False
        Catch ex As Exception
        End Try
    End Sub

    Protected Sub btnReviewed_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReviewed.Click
        Dim chk As System.Web.UI.WebControls.CheckBox
        Dim CircularID As String
        Dim CandidateID As String
        Dim UserID As String

        Dim msg As String

        UserID = Session("LoginUserID")
        For Each rw As GridViewRow In grdApplicaiton.Rows
            chk = rw.FindControl("chkSelect")

            If chk.Checked = True Then
                CandidateID = rw.Cells(0).Text
                CircularID = rw.Cells(3).Text

                msg = Common.ChangeStatus(CircularID, CandidateID, UserID, "Reviewed")


                If msg = "Successfully Changed Status" Then
                    MessageBox("Successful")
                Else
                    MessageBox("Error Found")
                End If

            End If
        Next
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnReject_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReject.Click
        Dim chk As System.Web.UI.WebControls.CheckBox
        Dim CircularID As String
        Dim CandidateID As String
        Dim UserID As String
        Dim msg As String

        UserID = Session("LoginUserID")


        For Each rw As GridViewRow In grdApplicaiton.Rows
            chk = rw.FindControl("chkSelect")
            If chk.Checked = True Then
                CandidateID = rw.Cells(0).Text
                CircularID = rw.Cells(3).Text

                msg = Common.ChangeStatus(CircularID, CandidateID, UserID, "Rejected")

                If msg = "Successfully Changed Status" Then
                    MessageBox("Successful")
                Else
                    MessageBox("Error Found")
                End If

            End If
        Next

    End Sub
End Class

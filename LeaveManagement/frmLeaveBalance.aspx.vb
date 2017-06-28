
Partial Class LeaveManagement_frmLeaveBalance
    Inherits System.Web.UI.Page
    Dim LeaveRequestData As New clsLeaveRequestDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            btnInsert.Visible = True

            grdEmployeeName.DataSource = LeaveRequestData.fnGetEmployeeDetailInfoFprLeave()
            grdEmployeeName.DataBind()
        End If
    End Sub

    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsert.Click
        Try
            Dim EntryByID As String
            Dim LeaveYear As String
            Dim TotalLeave As String

            EntryByID = Session("LoginUserID")

            Dim CurrentYear As Integer = Year(Now)

            If txtLeaveYr.Text <> CurrentYear Then
                MessageBox("You Can Balace Only for Current Year")
                Exit Sub
            End If

            LeaveYear = txtLeaveYr.Text
            TotalLeave = txtTotalLeave.Text

            Dim chk As System.Web.UI.WebControls.CheckBox
            Dim lblEID As System.Web.UI.WebControls.Label
            Dim EmployeeID As String
            Dim AllEmployeeID As String = ""
            Dim BalancedEmployee As String = ""

            For Each rw As GridViewRow In grdEmployeeName.Rows
                chk = rw.FindControl("chkSelect")
                If chk.Checked = True Then
                    lblEID = rw.FindControl("lblEmployeeID")
                    EmployeeID = lblEID.Text
                    Dim Result As String = LeaveRequestData.GetBalancedEmployee(EmployeeID, LeaveYear)
                    If Result <> "" Then
                        BalancedEmployee = BalancedEmployee & Result & ","
                        chk.Checked = False
                    Else
                        AllEmployeeID = AllEmployeeID & EmployeeID & "~|"
                    End If

                End If
            Next

            If AllEmployeeID = "" Then
                MessageBox("Please Select At least one Employee")
                Exit Sub
            End If

            ' Dim Result As String = LeaveRequestData.GetBalancedEmployee(AllEmployeeID, LeaveYear)

            'If Result <> "" Then
            '    lblMsg.Text = "Leave balace is already adjusted for " + Result
            '    Exit Sub
            'End If

            Dim Check As Integer = LeaveRequestData.fnInsertLeaveBalance(TotalLeave, LeaveYear, AllEmployeeID, EntryByID)

            If Check = 1 Then
                MessageBox("Submitted Successfully.")

                If BalancedEmployee <> "" Then
                    MessageBox("Leave balace is already adjusted for " + BalancedEmployee)
                End If

                ClearLeaveRequest()
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub ClearLeaveRequest()
        txtLeaveYr.Text = ""
        txtTotalLeave.Text = ""
        lblMsg.Text = ""

        grdEmployeeName.DataSource = LeaveRequestData.fnGetEmployeeDetailInfoFprLeave()
        grdEmployeeName.DataBind()
    End Sub

    Protected Sub btnCancelSelection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelSelection.Click
        ClearLeaveRequest()
    End Sub

    Protected Sub chkHead_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim chk As System.Web.UI.WebControls.CheckBox
        Dim chkIn As System.Web.UI.WebControls.CheckBox

        chk = grdEmployeeName.HeaderRow.FindControl("chkHead")

        For Each rw As GridViewRow In grdEmployeeName.Rows
            chkIn = rw.FindControl("chkSelect")
            chkIn.Checked = chk.Checked
        Next

    End Sub

    Protected Sub chkSelect_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim chk As System.Web.UI.WebControls.CheckBox
        Dim chkIn As System.Web.UI.WebControls.CheckBox
        Dim flag As Boolean

        Dim lblEID As System.Web.UI.WebControls.Label
        Dim EmployeeID As String

        chk = grdEmployeeName.HeaderRow.FindControl("chkHead")
        flag = True
        For Each rw As GridViewRow In grdEmployeeName.Rows
            chkIn = rw.FindControl("chkSelect")

            lblEID = rw.FindControl("lblEmployeeID")
            EmployeeID = lblEID.Text

            If chkIn.Checked = False Then
                flag = False
                Exit For
            End If
        Next

        chk.Checked = flag
    End Sub

End Class

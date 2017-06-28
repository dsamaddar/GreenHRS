
Partial Class LeaveManagement_ApprovedLeave
    Inherits System.Web.UI.Page
    Dim LeaveData As New clsLeaveRequestDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        Dim MenuIDs As String

        MenuIDs = Session("PermittedMenus")

        If InStr(MenuIDs, "MngBranch~") = 0 Then
            Response.Redirect("~\frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            Dim EmployeeID As String
            EmployeeID = Session("EmployeeID")

            GetLeaveType()
            grdLeave.DataSource = LeaveData.fnGetApprovedLeave(EmployeeID, "", "", "All")
            grdLeave.DataBind()
        End If
    End Sub

    Protected Sub GetLeaveType()
        Dim EmployeeID As String = ""
        EmployeeID = Session("EmployeeID")
        ddlLeaveType.DataTextField = "LeaveType"
        ddlLeaveType.DataValueField = "LeaveTypeID"
        ddlLeaveType.DataSource = LeaveData.fnGetLeaveTypeGenderWise(EmployeeID)
        ddlLeaveType.DataBind()

        ddlLeaveType.Items.Insert(0, "All")
    End Sub


    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        Dim DateFrom As String
        Dim DateTo As String
        Dim LeaveTypeID As String

        Dim EmployeeID As String
        EmployeeID = Session("EmployeeID")

        DateFrom = dtDateFrom.Text
        DateTo = dtDateTo.Text
        LeaveTypeID = ddlLeaveType.SelectedValue

        If DateFrom <> "" And DateTo = "" Then
            MessageBox("Please Give Leave To")
            Exit Sub
        End If

        If DateFrom = "" And DateTo <> "" Then
            MessageBox("Please Give Leave From")
            Exit Sub
        End If


        grdLeave.DataSource = LeaveData.fnGetApprovedLeave(EmployeeID, DateFrom, DateTo, LeaveTypeID)
        grdLeave.DataBind()

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub
End Class

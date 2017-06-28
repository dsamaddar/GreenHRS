
Partial Class LeaveManagement_QueryOnLeave
    Inherits System.Web.UI.Page
    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim LeaveTypeData As New clsLeaveTypeDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            GetEmployeeName()
            GetLeaveType()
            drpLeaveYear.SelectedValue = Now.Year
        End If
    End Sub

    Protected Sub GetEmployeeName()
        ddlEmployeeName.DataTextField = "EmployeeName"
        ddlEmployeeName.DataValueField = "EmployeeID"
        ddlEmployeeName.DataSource = EmployeeInfoData.fnGetEmployeeList()
        ddlEmployeeName.DataBind()

        ddlEmployeeName.Items.Insert(0, "All")
    End Sub

    Protected Sub GetLeaveType()
        ddlLeaveType.DataTextField = "LeaveType"
        ddlLeaveType.DataValueField = "LeaveTypeID"
        ddlLeaveType.DataSource = LeaveTypeData.fnShowLeaveType()
        ddlLeaveType.DataBind()

        ddlLeaveType.Items.Insert(0, "All")
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        Dim EmployeeId As String = ddlEmployeeName.SelectedValue
        Dim LeaveYear As String = drpLeaveYear.SelectedValue
        Dim LeaveTypeID As String = ddlLeaveType.SelectedValue

        grdLeave.DataSource = LeaveTypeData.fnGetQueryForLeave(EmployeeId, LeaveYear, LeaveTypeID)
        grdLeave.DataBind()
    End Sub
End Class

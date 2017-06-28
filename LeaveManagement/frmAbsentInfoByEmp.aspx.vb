
Partial Class LeaveManagement_frmAbsentInfoByEmp
    Inherits System.Web.UI.Page

    Dim UsrAttData As New clsUserAttendanceDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim UsrAtt As New clsUserAttendance()
            UsrAtt.DateFrom = Request.QueryString("DateFrom")
            UsrAtt.DateTo = Request.QueryString("DateTo")
            UsrAtt.EmployeeID = Request.QueryString("EmployeeID")



            grdAbsentInfoByEmp.DataSource = UsrAttData.fnGetAbsentReport(UsrAtt)
            grdAbsentInfoByEmp.DataBind()

        End If
    End Sub



End Class

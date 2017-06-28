Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class frmEmployeeStatus
    Inherits System.Web.UI.Page

    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim ULCBranchData As New clsULCBranchDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Dim MenuIDs As String

        'MenuIDs = Session("PermittedMenus")

        'If InStr(MenuIDs, "~") = 0 Then
        '    Response.Redirect("~\frmHRMLogin.aspx")
        'End If

        If Not IsPostBack Then
            ShowBranchList()
            ShowEmployeeType()
        End If

       
    End Sub

    Protected Sub ShowBranchList()
        chkListBranch.DataTextField = "ULCBranchName"
        chkListBranch.DataValueField = "ULCBranchID"
        chkListBranch.DataSource = ULCBranchData.fnGetTotalULCBranch()
        chkListBranch.DataBind()
    End Sub

    Protected Sub ShowEmployeeType()
        ddlEmpType.DataTextField = "EmployeeTypeName"
        ddlEmpType.DataValueField = "EmployeeTypeID"
        ddlEmpType.DataSource = EmployeeInfoData.fnGetEmployeeType()
        ddlEmpType.DataBind()
        ddlEmpType.Items.Insert(0, "ALL")
    End Sub

    Protected Sub btnShowReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowReport.Click
        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]


        Dim BranchID As String = ""
        Dim isExists As Boolean = False
        Dim BranchArray As String = ""
        For Each itm As ListItem In chkListBranch.Items
            If itm.Selected = True Then
                isExists = True
                BranchID = itm.Value
                BranchArray = BranchArray & BranchID & ","
            End If
        Next

        If BranchArray <> "" Then
            BranchArray = BranchArray.Remove(Len(BranchArray) - 1, 1)
        End If

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try
            f = "~/Reports/"
            folder = Server.MapPath(f)
            repName = folder & "EmployeeStatus.rpt"
            myReport.Load(repName)

            retArr = conStr.Split(";")
            serverArr = retArr(0).Split("=")
            dbArr = retArr(1).Split("=")
            usrArr = retArr(2).Split("=")
            pwdArr = retArr(3).Split("=")

            serverName = serverArr(1)
            uid = usrArr(1)
            pwd = pwdArr(1)
            dbName = dbArr(1)

            myReport.SetDatabaseLogon(uid, pwd, serverName, dbName)

            If txtJoiningDtFrom.Text = "" Then
                txtJoiningDtFrom.Text = "1900-01-01"
            End If

            If txtJoiningDtTo.Text = "" Then
                txtJoiningDtTo.Text = Convert.ToString(DateTime.Today)
            End If


            Dim Gender As String
            If rdbtnGender.SelectedValue = "" Then
                Gender = "ALL"
            Else
                Gender = rdbtnGender.SelectedValue
            End If

            Dim EType As String
            If ddlEmpType.SelectedValue = "ALL" Then
                EType = "ALL"
            Else
                EType = ddlEmpType.SelectedValue
            End If

            Dim parameters As CrystalDecisions.Web.Parameter = New CrystalDecisions.Web.Parameter()
            myReport.SetParameterValue("@JoiningDateFrom", Convert.ToDateTime(txtJoiningDtFrom.Text))
            myReport.SetParameterValue("@JoiningDateTo", Convert.ToDateTime(txtJoiningDtTo.Text))
            myReport.SetParameterValue("@EmployeeType", EType)
            myReport.SetParameterValue("@Branch", BranchArray)
            myReport.SetParameterValue("@AsOnDate", Convert.ToDateTime(txtReportDate.Text))
            myReport.SetParameterValue("@Gender", Gender)
            'myReport.ExportToHttpResponse(ExportFormatType.WordForWindows, Response, True, "ExportedReport")
            myReport.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, "ExportedReport")
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

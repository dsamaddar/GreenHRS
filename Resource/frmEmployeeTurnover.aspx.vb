Imports System.Data
Imports System.Web.UI.DataVisualization.Charting
Imports System.Drawing

Partial Class Resource_frmEmployeeTurnover
    Inherits System.Web.UI.Page

    Dim ResReqData As New clsResourceReqDataAccess()

    Protected Sub btnShowReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowReport.Click
        GetOffDesignationWiseROR(Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text))
        GetOffDesigWiseResource()
        GetFuncDesignationWiseROR(Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text))
        GetFuncDesigWiseResource()
        GetDeptWiseROR(Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text))
        GetDeptWiseResource()
    End Sub

    Protected Sub GetOffDesignationWiseROR(ByVal StartDate As DateTime, ByVal EndDate As DateTime)

        Dim fnt As New System.Drawing.Font("Verdana", 8.0F, FontStyle.Bold)
        Dim dt As New DataTable()
        Try
            dt = ResReqData.fnGetOffDesignationWiseROR(StartDate, EndDate).Tables(0)

            Dim x(dt.Rows.Count - 1) As String
            Dim y(dt.Rows.Count - 1) As Integer

            For i = 0 To dt.Rows.Count - 1 Step 1
                x(i) = dt.Rows(i)(0).ToString()
                y(i) = Convert.ToInt32(dt.Rows(i)(1))
            Next

            crtOffDesignationWiseTurnOver.Titles.Add(New Title("Official Designation Wise Turnover", Docking.Top, fnt, Color.Black))
            crtOffDesignationWiseTurnOver.Series(0).Points.DataBindXY(x, y)
            crtOffDesignationWiseTurnOver.Series(0).ChartType = Convert.ToInt32(drpChartType.SelectedValue)
            crtOffDesignationWiseTurnOver.Series(0).Label = "#VALY" ' "#PERCENT{P0}"
            crtOffDesignationWiseTurnOver.Series(0).LegendText = "#AXISLABEL"
            crtOffDesignationWiseTurnOver.ChartAreas("crtAreaOffDesignationROR").Area3DStyle.Enable3D = Convert.ToBoolean(drp3DEnabled.SelectedValue)
            crtOffDesignationWiseTurnOver.ChartAreas("crtAreaOffDesignationROR").AxisX.Interval = 1
            crtOffDesignationWiseTurnOver.Legends(0).Enabled = True
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub GetOffDesigWiseResource()
        Dim fnt As New System.Drawing.Font("Verdana", 8.0F, FontStyle.Bold)
        Dim dt As New DataTable()
        Try
            dt = ResReqData.fnGetOffDesignationWiseResource.Tables(0)

            Dim x(dt.Rows.Count - 1) As String
            Dim y(dt.Rows.Count - 1) As Integer

            For i = 0 To dt.Rows.Count - 1 Step 1
                x(i) = dt.Rows(i)(0).ToString()
                y(i) = Convert.ToInt32(dt.Rows(i)(1))
            Next

            crtOffDesigWiseResource.Titles.Add(New Title("Official Designation Wise Resource", Docking.Top, fnt, Color.Black))
            crtOffDesigWiseResource.Series(0).Points.DataBindXY(x, y)
            crtOffDesigWiseResource.Series(0).ChartType = Convert.ToInt32(drpChartType.SelectedValue)
            crtOffDesigWiseResource.Series(0).Label = "#VALY" ' "#PERCENT{P0}"
            crtOffDesigWiseResource.Series(0).LegendText = "#AXISLABEL"
            crtOffDesigWiseResource.ChartAreas("crtAreaOffDesigWiseResource").Area3DStyle.Enable3D = Convert.ToBoolean(drp3DEnabled.SelectedValue)
            crtOffDesigWiseResource.ChartAreas("crtAreaOffDesigWiseResource").AxisX.Interval = 1
            crtOffDesigWiseResource.Legends(0).Enabled = True
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub GetFuncDesignationWiseROR(ByVal StartDate As DateTime, ByVal EndDate As DateTime)

        Dim fnt As New System.Drawing.Font("Verdana", 8.0F, FontStyle.Bold)
        Dim dt As New DataTable()
        Try
            dt = ResReqData.fnGetFuncDesignationWiseROR(StartDate, EndDate).Tables(0)

            Dim x(dt.Rows.Count - 1) As String
            Dim y(dt.Rows.Count - 1) As Integer

            For i = 0 To dt.Rows.Count - 1 Step 1
                x(i) = dt.Rows(i)(0).ToString()
                y(i) = Convert.ToInt32(dt.Rows(i)(1))
            Next

            crtFuncDesignationWiseTurnOver.Titles.Add(New Title("Functional Designation Wise Turnover", Docking.Top, fnt, Color.Black))
            crtFuncDesignationWiseTurnOver.Series(0).Points.DataBindXY(x, y)
            crtFuncDesignationWiseTurnOver.Series(0).ChartType = Convert.ToInt32(drpChartType.SelectedValue)
            crtFuncDesignationWiseTurnOver.Series(0).Label = "#VALY" ' "#PERCENT{P0}"
            crtFuncDesignationWiseTurnOver.Series(0).LegendText = "#AXISLABEL"
            crtFuncDesignationWiseTurnOver.ChartAreas("crtAreaFuncDesignationROR").Area3DStyle.Enable3D = Convert.ToBoolean(drp3DEnabled.SelectedValue)
            crtFuncDesignationWiseTurnOver.ChartAreas("crtAreaFuncDesignationROR").AxisX.Interval = 1
            crtFuncDesignationWiseTurnOver.Legends(0).Enabled = True
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub GetFuncDesigWiseResource()
        Dim fnt As New System.Drawing.Font("Verdana", 8.0F, FontStyle.Bold)
        Dim dt As New DataTable()
        Try
            dt = ResReqData.fnGetFuncDesignationWiseResource.Tables(0)

            Dim x(dt.Rows.Count - 1) As String
            Dim y(dt.Rows.Count - 1) As Integer

            For i = 0 To dt.Rows.Count - 1 Step 1
                x(i) = dt.Rows(i)(0).ToString()
                y(i) = Convert.ToInt32(dt.Rows(i)(1))
            Next
            crtFuncDesigWiseResource.Titles.Add(New Title("Functional Designation Wise Resource", Docking.Top, fnt, Color.Black))
            crtFuncDesigWiseResource.Series(0).Points.DataBindXY(x, y)
            crtFuncDesigWiseResource.Series(0).ChartType = Convert.ToInt32(drpChartType.SelectedValue)
            crtFuncDesigWiseResource.Series(0).Label = "#VALY" ' "#PERCENT{P0}"
            crtFuncDesigWiseResource.Series(0).LegendText = "#AXISLABEL"
            crtFuncDesigWiseResource.ChartAreas("crtAreaFuncDesigWiseResource").Area3DStyle.Enable3D = Convert.ToBoolean(drp3DEnabled.SelectedValue)
            crtFuncDesigWiseResource.ChartAreas("crtAreaFuncDesigWiseResource").AxisX.Interval = 1
            crtFuncDesigWiseResource.Legends(0).Enabled = True
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub GetDeptWiseROR(ByVal StartDate As DateTime, ByVal EndDate As DateTime)
        Dim fnt As New System.Drawing.Font("Verdana", 8.0F, FontStyle.Bold)
        Dim dt As New DataTable()
        Try
            dt = ResReqData.fnGetDepartmentWiseROR(StartDate, EndDate).Tables(0)

            Dim x(dt.Rows.Count - 1) As String
            Dim y(dt.Rows.Count - 1) As Integer

            For i = 0 To dt.Rows.Count - 1 Step 1
                x(i) = dt.Rows(i)(0).ToString()
                y(i) = Convert.ToInt32(dt.Rows(i)(1))
            Next

            crtDeptWiseROR.Titles.Add(New Title("Department Wise Turnover", Docking.Top, fnt, Color.Black))
            crtDeptWiseROR.Series(0).Points.DataBindXY(x, y)
            crtDeptWiseROR.Series(0).ChartType = Convert.ToInt32(drpChartType.SelectedValue)
            crtDeptWiseROR.Series(0).Label = "#VALY" ' "#PERCENT{P0}"
            crtDeptWiseROR.Series(0).LegendText = "#AXISLABEL"
            crtDeptWiseROR.ChartAreas("crtAreaDeptROR").Area3DStyle.Enable3D = Convert.ToBoolean(drp3DEnabled.SelectedValue)
            crtDeptWiseROR.ChartAreas("crtAreaDeptROR").AxisX.Interval = 1
            crtDeptWiseROR.Legends(0).Enabled = True
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub GetDeptWiseResource()
        Dim fnt As New System.Drawing.Font("Verdana", 8.0F, FontStyle.Bold)
        Dim dt As New DataTable()
        Try
            dt = ResReqData.fnGetDeptWiseResource().Tables(0)

            Dim x(dt.Rows.Count - 1) As String
            Dim y(dt.Rows.Count - 1) As Integer

            For i = 0 To dt.Rows.Count - 1 Step 1
                x(i) = dt.Rows(i)(0).ToString()
                y(i) = Convert.ToInt32(dt.Rows(i)(1))
            Next

            crtDeptWiseResource.Titles.Add(New Title("Department Wise Turnover", Docking.Top, fnt, Color.Black))
            crtDeptWiseResource.Series(0).Points.DataBindXY(x, y)
            crtDeptWiseResource.Series(0).ChartType = Convert.ToInt32(drpChartType.SelectedValue)
            crtDeptWiseResource.Series(0).Label = "#VALY" ' "#PERCENT{P0}"
            crtDeptWiseResource.Series(0).LegendText = "#AXISLABEL"
            crtDeptWiseResource.ChartAreas("crtAreaDeptResource").Area3DStyle.Enable3D = Convert.ToBoolean(drp3DEnabled.SelectedValue)
            crtDeptWiseResource.ChartAreas("crtAreaDeptResource").AxisX.Interval = 1
            crtDeptWiseResource.Legends(0).Enabled = True
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
            txtStartDate.Text = "1/1/2014"
            txtEndDate.Text = Now.ToString("MM/dd/yyyy")
        End If
    End Sub

End Class

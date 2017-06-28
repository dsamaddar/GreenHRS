Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.OleDb
Imports System.Data.Common
Imports System.IO
Imports System.Math
Imports System.Configuration
Imports System.Web.UI

Partial Class frmGradingSystem
    Inherits System.Web.UI.Page

    Dim GradSysTypeData As New clsGradSysTypeDataAccess()
    Dim GradSystemData As New clsGradingSystemDataAccess()

    Protected Sub btnInsertGradingSystemType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertGradingSystemType.Click
        Dim GradSysType As New clsGradSysType()

        GradSysType.GradSysType = txtGradingSystemType.Text
        GradSysType.EntryBy = Session("LoginUserID")

        Dim Check As Integer = GradSysTypeData.fnInsertGradingSystemType(GradSysType)

        If Check = 1 Then
            MessageBox("Inserted Successfully.")
            ShowGradSysType()
            ClearGradSysType()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ClearGradSysType()
        txtGradingSystemType.Text = ""
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Function FormatGradingSystem() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("FromPercentage", System.Type.GetType("System.Double"))
        dt.Columns.Add("ToPercentage", System.Type.GetType("System.Double"))
        dt.Columns.Add("LetterGrade", System.Type.GetType("System.String"))
        dt.Columns.Add("GradePoint", System.Type.GetType("System.Double"))
        dt.Columns.Add("GradingExplanation", System.Type.GetType("System.String"))
        Return dt
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then

            Dim dtGradingSystem As DataTable = New DataTable()
            dtGradingSystem = FormatGradingSystem()
            Session("GradingSystem") = dtGradingSystem

            GetGradePoint()
            ShowGradSysType()
        End If
    End Sub

    Protected Sub GetGradePoint()
        drpGradePoint.DataTextField = "GradePoint"
        drpGradePoint.DataValueField = "GradePoint"
        drpGradePoint.DataSource = GradSystemData.fnGradingPoints()
        drpGradePoint.DataBind()
    End Sub

    Protected Sub ShowGradSysType()
        drpGradSysType.DataTextField = "GradSysType"
        drpGradSysType.DataValueField = "GradSysTypeID"
        drpGradSysType.DataSource = GradSysTypeData.fnShowGradSysType()
        drpGradSysType.DataBind()

        Dim lst As New ListItem()
        lst.Text = "-- Select Grading System Type --"
        lst.Value = ""
        drpGradSysType.Items.Insert(0, lst)

    End Sub

    Protected Sub btnAddGrade_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddGrade.Click
        Try
            Dim GradingSystem As New clsGradingSystem()

            GradingSystem.FromPercentage = Convert.ToDouble(txtPercentageFrom.Text)
            GradingSystem.ToPercentage = Convert.ToDouble(txtPercentageTo.Text)
            GradingSystem.LetterGrade = txtLetterGrade.Text
            GradingSystem.GradePoint = Convert.ToDouble(drpGradePoint.SelectedValue)
            GradingSystem.GradingExplanation = txtGradeExplanation.Text

            Dim dt As DataTable = GetGradingSystem(GradingSystem)
            Session("GradingSystem") = dt

            grdExamWiseGradingSystem.DataSource = dt
            grdExamWiseGradingSystem.DataBind()
            ClearGradSystem()

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Function GetGradingSystem(ByVal GradingSystem As clsGradingSystem) As DataTable
        Dim dtExamWiseGradingInfo = Session("GradingSystem")

        If (CheckDuplicateExamWisePercentageFrom() = 0) Then
            MessageBox("Check For Duplicate Percentage(From).")
            Return dtExamWiseGradingInfo
        End If

        If (CheckDuplicateExamWisePercentageTo() = 0) Then
            MessageBox("Check For Duplicate Percentage(To).")
            Return dtExamWiseGradingInfo
        End If

        If (CheckDuplicateExamWiseGradingLetter() = 0) Then
            MessageBox("Check For Duplicate Letter Grade.")
            Return dtExamWiseGradingInfo
        End If

        If (CheckDuplicateExamWiseGradingPoint() = 0) Then
            MessageBox("Check For Duplicate Grading Point.")
            Return dtExamWiseGradingInfo
        End If

        Dim dr As DataRow
        dr = dtExamWiseGradingInfo.NewRow()
        dr("FromPercentage") = GradingSystem.FromPercentage
        dr("ToPercentage") = GradingSystem.ToPercentage
        dr("LetterGrade") = GradingSystem.LetterGrade
        dr("GradePoint") = GradingSystem.GradePoint
        dr("GradingExplanation") = GradingSystem.GradingExplanation

        dtExamWiseGradingInfo.Rows.Add(dr)
        dtExamWiseGradingInfo.AcceptChanges()
        Return dtExamWiseGradingInfo
    End Function

    Public Function CheckDuplicateExamWisePercentageFrom() As Integer
        Dim lbl As System.Web.UI.WebControls.Label
        For Each rw As GridViewRow In grdExamWiseGradingSystem.Rows
            lbl = rw.FindControl("lblFromPercentage")
            If lbl.Text = Nothing Then
                Return 0
            End If
            If Convert.ToDouble(txtPercentageFrom.Text) = Convert.ToDouble(lbl.Text) Then
                MessageBox("You Cant's Insert Duplicate Percentage(From).")
                Return 0
            End If
        Next
        Return 1
    End Function

    Public Function CheckDuplicateExamWisePercentageTo() As Integer
        Dim lbl As System.Web.UI.WebControls.Label
        For Each rw As GridViewRow In grdExamWiseGradingSystem.Rows
            lbl = rw.FindControl("lblToPercentage")
            If lbl.Text = Nothing Then
                Return 0
            End If
            If Convert.ToDouble(txtPercentageTo.Text) = Convert.ToDouble(lbl.Text) Then
                MessageBox("You Cant's Insert Duplicate Percentage(To).")
                Return 0
            End If
        Next
        Return 1
    End Function

    Public Function CheckDuplicateExamWiseGradingLetter() As Integer
        Dim lbl As System.Web.UI.WebControls.Label
        For Each rw As GridViewRow In grdExamWiseGradingSystem.Rows
            lbl = rw.FindControl("lblLetterGrade")
            If lbl.Text = Nothing Then
                Return 0
            End If
            If txtLetterGrade.Text = lbl.Text Then
                MessageBox("You Cant's Insert Duplicate Letter Grade.")
                Return 0
            End If
        Next
        Return 1
    End Function

    Public Function CheckDuplicateExamWiseGradingPoint() As Integer
        Dim lbl As System.Web.UI.WebControls.Label
        For Each rw As GridViewRow In grdExamWiseGradingSystem.Rows
            lbl = rw.FindControl("lblGradePoint")
            If lbl.Text = Nothing Then
                Return 0
            End If
            If Convert.ToDouble(drpGradePoint.SelectedValue) = Convert.ToDouble(lbl.Text) Then
                MessageBox("You Cant's Insert Duplicate Grading Point.")
                Return 0
            End If
        Next
        Return 1
    End Function

    Protected Sub ClearGradSystem()
        txtPercentageFrom.Text = ""
        txtPercentageTo.Text = ""
        txtLetterGrade.Text = ""
        drpGradePoint.SelectedIndex = -1
        txtGradeExplanation.Text = "N\A"
    End Sub

    Protected Sub drpGradSysType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpGradSysType.SelectedIndexChanged
        If drpGradSysType.SelectedValue = "" Then
            MessageBox("Select A Grading System Type.")
            grdExamWiseGradingSystem.DataSource = ""
            grdExamWiseGradingSystem.DataBind()
            ClearGradSystem()
            Exit Sub
        End If

        Dim GradSysType As New clsGradSysType()
        Dim dtGradingSystem As DataTable = New DataTable()
        dtGradingSystem = FormatGradingSystem()

        GradSysType.GradSysTypeID = drpGradSysType.SelectedValue
        dtGradingSystem = GradSystemData.fnShowGradSysByTypeID(GradSysType).Tables(0)
        grdExamWiseGradingSystem.DataSource = dtGradingSystem
        grdExamWiseGradingSystem.DataBind()

        Session("GradingSystem") = dtGradingSystem

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Dim dtGradingSystem As DataTable = New DataTable()
        dtGradingSystem = Session("GradingSystem")

        Dim GradingSystemData As String = ""
        Dim GradSystem As New clsGradingSystem()

        Try
            '' Grading System Data
            For Each rw As DataRow In dtGradingSystem.Rows
                GradSystem.FromPercentage = rw.Item("FromPercentage")
                GradSystem.ToPercentage = rw.Item("ToPercentage")
                GradSystem.LetterGrade = rw.Item("LetterGrade")
                GradSystem.GradePoint = rw.Item("GradePoint")
                GradSystem.GradingExplanation = If(rw.Item("GradingExplanation") Is Nothing, "N\A", rw.Item("GradingExplanation"))
                GradingSystemData = GradingSystemData & GradSystem.FromPercentage & "~" & GradSystem.ToPercentage & "~" & GradSystem.LetterGrade & "~" & GradSystem.GradePoint & "~" & GradSystem.GradingExplanation & "~|"
            Next

            GradSystem.GradingSystemData = GradingSystemData
            GradSystem.GradSysTypeID = drpGradSysType.SelectedValue
            GradSystem.EntryBy = Session("LoginUserID")

            Dim Check As Integer = GradSystemData.fnInsertTotalGradingSystem(GradSystem)

            If Check = 1 Then
                ClearGradSystem()
                drpGradSysType.SelectedIndex = -1
                grdExamWiseGradingSystem.DataSource = ""
                grdExamWiseGradingSystem.DataBind()
                MessageBox("Successfully Inserted.")
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub grdExamWiseGradingSystem_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdExamWiseGradingSystem.RowDeleting
        Try
            Dim i As Integer
            Dim dtGradingSystem As DataTable = New DataTable()

            dtGradingSystem = Session("GradingSystem")

            i = e.RowIndex

            dtGradingSystem.Rows(i).Delete()
            dtGradingSystem.AcceptChanges()
            grdExamWiseGradingSystem.DataSource = dtGradingSystem
            grdExamWiseGradingSystem.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
        
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearGradSystem()
        drpGradSysType.SelectedIndex = -1
        grdExamWiseGradingSystem.DataSource = ""
        grdExamWiseGradingSystem.DataBind()
    End Sub

End Class

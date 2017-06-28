
Partial Class HRMMaster
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Try
                lblEmpLoggedInUser.Text = "Welcome " + Session("UserName") + " ! "

                Dim mnu As New Menu
                Dim MenuIDs As String

                mnu = Me.FindControl("mnuControl")
                MenuIDs = Session("PermittedMenus")

                mnu.Items(0).Enabled = IIf(InStr(MenuIDs, "Administration~"), True, False)
                mnu.Items(0).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "AppSett~"), True, False)
                mnu.Items(0).ChildItems(0).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "Department~"), True, False)
                mnu.Items(0).ChildItems(0).ChildItems(1).Enabled = IIf(InStr(MenuIDs, "Organization~"), True, False)
                mnu.Items(0).ChildItems(0).ChildItems(1).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "OrgSetting~"), True, False)
                mnu.Items(0).ChildItems(0).ChildItems(2).Enabled = IIf(InStr(MenuIDs, "JobSettings~"), True, False)
                mnu.Items(0).ChildItems(0).ChildItems(3).Enabled = IIf(InStr(MenuIDs, "CvSettings~"), True, False)
                mnu.Items(0).ChildItems(0).ChildItems(4).Enabled = IIf(InStr(MenuIDs, "EmpSettings~"), True, False)
                mnu.Items(0).ChildItems(0).ChildItems(5).Enabled = IIf(InStr(MenuIDs, "HRServices~"), True, False)
                mnu.Items(0).ChildItems(1).Enabled = IIf(InStr(MenuIDs, "JobDesc~"), True, False)
                mnu.Items(0).ChildItems(1).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "JDDef~"), True, False)
                mnu.Items(0).ChildItems(2).Enabled = IIf(InStr(MenuIDs, "RepFeedback~"), True, False)
                mnu.Items(0).ChildItems(3).Enabled = IIf(InStr(MenuIDs, "TrngSettings~"), True, False)
                mnu.Items(0).ChildItems(4).Enabled = IIf(InStr(MenuIDs, "LeaveMgmt~"), True, False)
                mnu.Items(0).ChildItems(4).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "LeaveSettings~"), True, False)
                mnu.Items(0).ChildItems(4).ChildItems(1).Enabled = IIf(InStr(MenuIDs, "ManageHolidays~"), True, False)
                mnu.Items(0).ChildItems(4).ChildItems(2).Enabled = IIf(InStr(MenuIDs, "LeaveBalance~"), True, False)
                mnu.Items(0).ChildItems(4).ChildItems(3).Enabled = IIf(InStr(MenuIDs, "LBanalceReport~"), True, False)
                mnu.Items(0).ChildItems(5).Enabled = IIf(InStr(MenuIDs, "MngLetterRecipient~"), True, False)
                mnu.Items(0).ChildItems(6).Enabled = IIf(InStr(MenuIDs, "MngBranch~"), True, False)
                mnu.Items(0).ChildItems(7).Enabled = IIf(InStr(MenuIDs, "ManageJD~"), True, False)
                mnu.Items(0).ChildItems(8).Enabled = IIf(InStr(MenuIDs, "WebAdmin~"), True, False)
                mnu.Items(0).ChildItems(8).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "RoleManagement~"), True, False)
                mnu.Items(0).ChildItems(8).ChildItems(1).Enabled = IIf(InStr(MenuIDs, "RoleWiseMenu~"), True, False)
                mnu.Items(0).ChildItems(8).ChildItems(2).Enabled = IIf(InStr(MenuIDs, "UserWiseRole~"), True, False)
                mnu.Items(0).ChildItems(9).Enabled = IIf(InStr(MenuIDs, "EdtEmpBInf~"), True, False)
                mnu.Items(0).ChildItems(10).Enabled = IIf(InStr(MenuIDs, "ExtTestTypeDef~"), True, False)
                mnu.Items(0).ChildItems(11).Enabled = IIf(InStr(MenuIDs, "PutExtTestScore~"), True, False)
                mnu.Items(0).ChildItems(12).Enabled = IIf(InStr(MenuIDs, "RecTypeDef~"), True, False)
                ' OK

                mnu.Items(1).Enabled = IIf(InStr(MenuIDs, "RecruitmentProcess~"), True, False)
                mnu.Items(1).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "UnscrnedResume~"), True, False)
                mnu.Items(1).ChildItems(1).Enabled = IIf(InStr(MenuIDs, "ScreenedResume~"), True, False)
                mnu.Items(1).ChildItems(2).Enabled = IIf(InStr(MenuIDs, "CircularWiseReport~"), True, False)
                mnu.Items(1).ChildItems(3).Enabled = IIf(InStr(MenuIDs, "SearchApplicant~"), True, False)
                mnu.Items(1).ChildItems(4).Enabled = IIf(InStr(MenuIDs, "RecruitInterview~"), True, False)
                mnu.Items(1).ChildItems(5).Enabled = IIf(InStr(MenuIDs, "ExamAttReport~"), True, False)
                mnu.Items(1).ChildItems(6).Enabled = IIf(InStr(MenuIDs, "BranchWiseExamAttendee~"), True, False)
                mnu.Items(1).ChildItems(7).Enabled = IIf(InStr(MenuIDs, "ReactivatePausedExam~"), True, False)
                mnu.Items(1).ChildItems(8).Enabled = IIf(InStr(MenuIDs, "ExamNotAttReport~"), True, False)
                mnu.Items(1).ChildItems(9).Enabled = IIf(InStr(MenuIDs, "ExamResult~"), True, False)
                mnu.Items(1).ChildItems(10).Enabled = IIf(InStr(MenuIDs, "ExamDefReport~"), True, False)
                mnu.Items(1).ChildItems(11).Enabled = IIf(InStr(MenuIDs, "TakeInterview~"), True, False)
                mnu.Items(1).ChildItems(12).Enabled = IIf(InStr(MenuIDs, "InterviewResult~"), True, False)
                mnu.Items(1).ChildItems(13).Enabled = IIf(InStr(MenuIDs, "ReSchedule~"), True, False)
                mnu.Items(1).ChildItems(13).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "InterviewReschedule~"), True, False)
                mnu.Items(1).ChildItems(13).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "ExamReschedule~"), True, False)
                mnu.Items(1).ChildItems(14).Enabled = IIf(InStr(MenuIDs, "CommServices~"), True, False)
                mnu.Items(1).ChildItems(14).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "NotifyExamSchedule~"), True, False)
                mnu.Items(1).ChildItems(14).ChildItems(1).Enabled = IIf(InStr(MenuIDs, "NotifyInterviewSchedule~"), True, False)
                mnu.Items(1).ChildItems(14).ChildItems(2).Enabled = IIf(InStr(MenuIDs, "SendMailReject~"), True, False)
                mnu.Items(1).ChildItems(14).ChildItems(3).Enabled = IIf(InStr(MenuIDs, "AcceptRejectPendingSMS~"), True, False)
                mnu.Items(1).ChildItems(15).Enabled = IIf(InStr(MenuIDs, "Settings~"), True, False)
                mnu.Items(1).ChildItems(15).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "ExamDefSettings~"), True, False)
                mnu.Items(1).ChildItems(15).ChildItems(0).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "GradingSystem~"), True, False)
                mnu.Items(1).ChildItems(15).ChildItems(0).ChildItems(1).Enabled = IIf(InStr(MenuIDs, "ExamDef~"), True, False)
                mnu.Items(1).ChildItems(15).ChildItems(0).ChildItems(2).Enabled = IIf(InStr(MenuIDs, "ExamDefView~"), True, False)
                mnu.Items(1).ChildItems(15).ChildItems(0).ChildItems(3).Enabled = IIf(InStr(MenuIDs, "SubjectDef~"), True, False)
                mnu.Items(1).ChildItems(15).ChildItems(0).ChildItems(4).Enabled = IIf(InStr(MenuIDs, "MakingExamPaper~"), True, False)
                mnu.Items(1).ChildItems(15).ChildItems(0).ChildItems(5).Enabled = IIf(InStr(MenuIDs, "AssignExam~"), True, False)
                mnu.Items(1).ChildItems(15).ChildItems(1).Enabled = IIf(InStr(MenuIDs, "InterviewPnlSettings~"), True, False)
                mnu.Items(1).ChildItems(15).ChildItems(1).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "IntCanGrade~"), True, False)
                mnu.Items(1).ChildItems(15).ChildItems(1).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "InterviewSettings~"), True, False)
                mnu.Items(1).ChildItems(15).ChildItems(1).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "IntMandatoryQuestion~"), True, False)
                mnu.Items(1).ChildItems(15).ChildItems(2).Enabled = IIf(InStr(MenuIDs, "QuesPaperSettings~"), True, False)
                mnu.Items(1).ChildItems(15).ChildItems(2).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "MakeQuestion~"), True, False)
                mnu.Items(1).ChildItems(15).ChildItems(3).Enabled = IIf(InStr(MenuIDs, "JobCircular~"), True, False)
                mnu.Items(1).ChildItems(15).ChildItems(3).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "NewCircular~"), True, False)
                mnu.Items(1).ChildItems(15).ChildItems(3).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "JobCircularSettings~"), True, False)
                mnu.Items(1).ChildItems(16).Enabled = IIf(InStr(MenuIDs, "DetExmResult~"), True, False)
                mnu.Items(1).ChildItems(17).Enabled = IIf(InStr(MenuIDs, "ExWiseSumRpt~"), True, False)
                mnu.Items(1).ChildItems(18).Enabled = IIf(InStr(MenuIDs, "EmpWiseExmSum~"), True, False)
                mnu.Items(1).ChildItems(19).Enabled = IIf(InStr(MenuIDs, "ExmEmpRelRpt~"), True, False)
                mnu.Items(1).ChildItems(20).Enabled = IIf(InStr(MenuIDs, "CandidateTag~"), True, False)
                'mnu.Items(1).ChildItems(21).Enabled = IIf(InStr(MenuIDs, "CVSelRecType~"), True, False)
                mnu.Items(1).ChildItems(21).Enabled = IIf(InStr(MenuIDs, "CVArchive~"), True, False)
                mnu.Items(1).ChildItems(22).Enabled = IIf(InStr(MenuIDs, "reassCanInt~"), True, False)
                'OK
                mnu.Items(2).Enabled = IIf(InStr(MenuIDs, "Employment~"), True, False)
                mnu.Items(2).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "OfferEmployment~"), True, False)
                mnu.Items(2).ChildItems(1).Enabled = IIf(InStr(MenuIDs, "CreateEmployment~"), True, False)
                mnu.Items(2).ChildItems(2).Enabled = IIf(InStr(MenuIDs, "AddExistingEmp~"), True, False)
                mnu.Items(2).ChildItems(3).Enabled = IIf(InStr(MenuIDs, "RecProposalToEmp~"), True, False)
                'OK
                mnu.Items(3).Enabled = IIf(InStr(MenuIDs, "HRDBServices~"), True, False)
                mnu.Items(3).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "OrgStructure~"), True, False)
                mnu.Items(3).ChildItems(1).Enabled = IIf(InStr(MenuIDs, "GratuityCalculation~"), True, False)
                mnu.Items(3).ChildItems(2).Enabled = IIf(InStr(MenuIDs, "PendingResigReq~"), True, False)
                mnu.Items(3).ChildItems(3).Enabled = IIf(InStr(MenuIDs, "SyncUserAtt~"), True, False)
                mnu.Items(3).ChildItems(4).Enabled = IIf(InStr(MenuIDs, "ConfirmationDue~"), True, False)
                mnu.Items(3).ChildItems(5).Enabled = IIf(InStr(MenuIDs, "HRServiceReq~"), True, False)
                mnu.Items(3).ChildItems(6).Enabled = IIf(InStr(MenuIDs, "HRServiceReport~"), True, False)
                mnu.Items(3).ChildItems(6).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "NOCForPassport~"), True, False)
                mnu.Items(3).ChildItems(6).ChildItems(1).Enabled = IIf(InStr(MenuIDs, "NOCForVisa~"), True, False)
                mnu.Items(3).ChildItems(6).ChildItems(2).Enabled = IIf(InStr(MenuIDs, "ExpCertActiveEmp~"), True, False)
                mnu.Items(3).ChildItems(6).ChildItems(3).Enabled = IIf(InStr(MenuIDs, "ExpCertOnRelease~"), True, False)
                mnu.Items(3).ChildItems(6).ChildItems(4).Enabled = IIf(InStr(MenuIDs, "ReferenceLetter~"), True, False)
                mnu.Items(3).ChildItems(6).ChildItems(5).Enabled = IIf(InStr(MenuIDs, "ReleaseLetter~"), True, False)
                mnu.Items(3).ChildItems(6).ChildItems(6).Enabled = IIf(InStr(MenuIDs, "EmpTrainingRpt~"), True, False)
                mnu.Items(3).ChildItems(6).ChildItems(7).Enabled = IIf(InStr(MenuIDs, "SalAccOpenning~"), True, False)
                mnu.Items(3).ChildItems(6).ChildItems(8).Enabled = IIf(InStr(MenuIDs, "IDCardForm~"), True, False)
                mnu.Items(3).ChildItems(6).ChildItems(9).Enabled = IIf(InStr(MenuIDs, "ServiceReport~"), True, False)
                mnu.Items(3).ChildItems(6).ChildItems(10).Enabled = IIf(InStr(MenuIDs, "EmpDashBoard~"), True, False)
                'OK

                mnu.Items(4).Enabled = IIf(InStr(MenuIDs, "SalarySetup~"), True, False)
                mnu.Items(4).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "EditBasicEmpInfo~"), True, False)
                mnu.Items(4).ChildItems(1).Enabled = IIf(InStr(MenuIDs, "DefComponent~"), True, False)
                mnu.Items(4).ChildItems(2).Enabled = IIf(InStr(MenuIDs, "ComponentUsage~"), True, False)
                mnu.Items(4).ChildItems(3).Enabled = IIf(InStr(MenuIDs, "RoleWiseComponent~"), True, False)
                mnu.Items(4).ChildItems(4).Enabled = IIf(InStr(MenuIDs, "EmpWiseRole~"), True, False)
                mnu.Items(4).ChildItems(5).Enabled = IIf(InStr(MenuIDs, "EmpWiseSalary~"), True, False)
                mnu.Items(4).ChildItems(6).Enabled = IIf(InStr(MenuIDs, "ProcessSalary~"), True, False)
                mnu.Items(4).ChildItems(7).Enabled = IIf(InStr(MenuIDs, "AdvanceTax~"), True, False)
                mnu.Items(4).ChildItems(8).Enabled = IIf(InStr(MenuIDs, "SalaryReport~"), True, False)
                mnu.Items(4).ChildItems(8).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "FundTransferReport~"), True, False)
                mnu.Items(4).ChildItems(8).ChildItems(1).Enabled = IIf(InStr(MenuIDs, "FndTrnsRptEntPnt~"), True, False)
                mnu.Items(4).ChildItems(8).ChildItems(2).Enabled = IIf(InStr(MenuIDs, "EmpSalCertificate~"), True, False)
                mnu.Items(4).ChildItems(8).ChildItems(3).Enabled = IIf(InStr(MenuIDs, "BrWiseSalary~"), True, False)
                mnu.Items(4).ChildItems(8).ChildItems(4).Enabled = IIf(InStr(MenuIDs, "DesigWiseSal~"), True, False)
                mnu.Items(4).ChildItems(8).ChildItems(5).Enabled = IIf(InStr(MenuIDs, "SalJVRpt~"), True, False)
                mnu.Items(4).ChildItems(8).ChildItems(6).Enabled = IIf(InStr(MenuIDs, "BrSalDetails~"), True, False)
                mnu.Items(4).ChildItems(8).ChildItems(7).Enabled = IIf(InStr(MenuIDs, "SalReconciliation~"), True, False)
                mnu.Items(4).ChildItems(8).ChildItems(8).Enabled = IIf(InStr(MenuIDs, "SalLargeRpt~"), True, False)
                mnu.Items(4).ChildItems(8).ChildItems(9).Enabled = IIf(InStr(MenuIDs, "TaxCertificate~"), True, False)
                mnu.Items(4).ChildItems(9).Enabled = IIf(InStr(MenuIDs, "SalGenPer~"), True, False)
                mnu.Items(4).ChildItems(10).Enabled = IIf(InStr(MenuIDs, "PFInfo~"), True, False)
                mnu.Items(4).ChildItems(11).Enabled = IIf(InStr(MenuIDs, "FinRevSal~"), True, False)
                mnu.Items(4).ChildItems(12).Enabled = IIf(InStr(MenuIDs, "COA~"), True, False)
                mnu.Items(4).ChildItems(13).Enabled = IIf(InStr(MenuIDs, "EmpLoan~"), True, False)
                mnu.Items(4).ChildItems(13).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "BenDef~"), True, False)
                mnu.Items(4).ChildItems(13).ChildItems(1).Enabled = IIf(InStr(MenuIDs, "ApproveLoanApp~"), True, False)
                mnu.Items(4).ChildItems(13).ChildItems(2).Enabled = IIf(InStr(MenuIDs, "AllAppLoanAcc~"), True, False)
                mnu.Items(4).ChildItems(14).Enabled = IIf(InStr(MenuIDs, "TaxSlabDef~"), True, False)
                mnu.Items(4).ChildItems(15).Enabled = IIf(InStr(MenuIDs, "TransportAllowance~"), True, False)
                mnu.Items(4).ChildItems(15).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "FuelPriceSett~"), True, False)
                mnu.Items(4).ChildItems(15).ChildItems(1).Enabled = IIf(InStr(MenuIDs, "ProcessETA~"), True, False)

                'OK

                mnu.Items(5).Enabled = IIf(InStr(MenuIDs, "ManageBankAcc~"), True, False)
                mnu.Items(5).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "ManageBankBranch~"), True, False)
                mnu.Items(5).ChildItems(1).Enabled = IIf(InStr(MenuIDs, "ULCBankAcc~"), True, False)
                'OK

                mnu.Items(6).Enabled = IIf(InStr(MenuIDs, "GenAdmin~"), True, False)
                mnu.Items(6).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "InpDailyAtt~"), True, False)
                mnu.Items(6).ChildItems(1).Enabled = IIf(InStr(MenuIDs, "DailyAttReport~"), True, False)
                mnu.Items(6).ChildItems(2).Enabled = IIf(InStr(MenuIDs, "AttStatInd~"), True, False)
                mnu.Items(6).ChildItems(3).Enabled = IIf(InStr(MenuIDs, "IndAbsRpt~"), True, False)
                mnu.Items(6).ChildItems(4).Enabled = IIf(InStr(MenuIDs, "AllEmpAbsRpt~"), True, False)
                mnu.Items(6).ChildItems(5).Enabled = IIf(InStr(MenuIDs, "LateAttReport~"), True, False)
                mnu.Items(6).ChildItems(6).Enabled = IIf(InStr(MenuIDs, "MnthlyAttRpt~"), True, False)
                mnu.Items(6).ChildItems(7).Enabled = IIf(InStr(MenuIDs, "SAbsentMail~"), True, False)
                mnu.Items(6).ChildItems(8).Enabled = IIf(InStr(MenuIDs, "AttSettFinal~"), True, False)
                mnu.Items(6).ChildItems(9).Enabled = IIf(InStr(MenuIDs, "LeaveMatrix~"), True, False)
                mnu.Items(6).ChildItems(10).Enabled = IIf(InStr(MenuIDs, "AttRptByAdmin~"), True, False)
                mnu.Items(6).ChildItems(11).Enabled = IIf(InStr(MenuIDs, "AbsentMatrix~"), True, False)
                mnu.Items(6).ChildItems(12).Enabled = IIf(InStr(MenuIDs, "AbsentMail~"), True, False)
                mnu.Items(6).ChildItems(12).ChildItems(0).Enabled = IIf(InStr(MenuIDs, "TodaysAbsInf~"), True, False)
                mnu.Items(6).ChildItems(12).ChildItems(1).Enabled = IIf(InStr(MenuIDs, "PrimaryWarning~"), True, False)
                mnu.Items(6).ChildItems(12).ChildItems(2).Enabled = IIf(InStr(MenuIDs, "FinalWarning~"), True, False)
                mnu.Items(6).ChildItems(13).Enabled = IIf(InStr(MenuIDs, "EmpStatusRpt~"), True, False)
                'OK

            Catch ex As Exception
                MessageBox(ex.Message)
            End Try
        End If

    End Sub


    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

End Class


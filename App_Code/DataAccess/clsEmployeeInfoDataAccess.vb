Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsEmployeeInfoDataAccess
    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Employee Info "
    Public Function fnInsertTotalGradingSystem(ByVal EmployeeInfo As clsEmployeeInfo, ByVal EntryBy As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertEmployeeInformation", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeName", EmployeeInfo.EmployeeName)
            cmd.Parameters.AddWithValue("@EmpCode", EmployeeInfo.EmpCode)
            cmd.Parameters.AddWithValue("@UserID", EmployeeInfo.UserID)
            cmd.Parameters.AddWithValue("@Password", EmployeeInfo.Password)
            cmd.Parameters.AddWithValue("@EmpTypeID", EmployeeInfo.EmpTypeID)
            cmd.Parameters.AddWithValue("@TerminationTypeID", EmployeeInfo.TerminationTypeID)
            cmd.Parameters.AddWithValue("@RemarksOnTermination", EmployeeInfo.RemarksOnTermination)
            cmd.Parameters.AddWithValue("@JoiningDesignationID", EmployeeInfo.JoiningDesignationID)
            cmd.Parameters.AddWithValue("@OfficialDesignationID", EmployeeInfo.OfficialDesignationID)
            cmd.Parameters.AddWithValue("@FunctionalDesignationID", EmployeeInfo.FunctionalDesignationID)
            cmd.Parameters.AddWithValue("@DepartmentID", EmployeeInfo.DepartmentID)
            cmd.Parameters.AddWithValue("@ULCBranchID", EmployeeInfo.ULCBranchID)
            cmd.Parameters.AddWithValue("@CurrentSupervisor", EmployeeInfo.CurrentSupervisor)
            cmd.Parameters.AddWithValue("@JDno", EmployeeInfo.JDno)
            cmd.Parameters.AddWithValue("@Status", EmployeeInfo.Status)
            cmd.Parameters.AddWithValue("@BankID", EmployeeInfo.BankID)
            cmd.Parameters.AddWithValue("@BranchID", EmployeeInfo.BranchID)
            cmd.Parameters.AddWithValue("@BankAccountNo", EmployeeInfo.BankAccountNo)
            cmd.Parameters.AddWithValue("@Email", EmployeeInfo.Email)
            cmd.Parameters.AddWithValue("@DateOfBirth", EmployeeInfo.DateOfBirth)
            cmd.Parameters.AddWithValue("@JoiningDate", EmployeeInfo.JoiningDate)
            cmd.Parameters.AddWithValue("@ConfirmationDate", EmployeeInfo.ConfirmationDate)
            cmd.Parameters.AddWithValue("@PromotionDate", EmployeeInfo.PromotionDate)
            cmd.Parameters.AddWithValue("@ContractExpiryDate", EmployeeInfo.ContractExpiryDate)
            cmd.Parameters.AddWithValue("@ContractRenewalDate", EmployeeInfo.ContractRenewalDate)
            cmd.Parameters.AddWithValue("@TerminationDate", EmployeeInfo.TerminationDate)
            cmd.Parameters.AddWithValue("@EntryExamScore", EmployeeInfo.EntryExamScore)
            cmd.Parameters.AddWithValue("@PromotionalExamScore", EmployeeInfo.PromotionalExamScore)
            cmd.Parameters.AddWithValue("@isActive", EmployeeInfo.isActive)
            cmd.Parameters.AddWithValue("@UserType", EmployeeInfo.UserType)
            cmd.Parameters.AddWithValue("@LeaveApprover", EmployeeInfo.LeaveApprover)
            cmd.Parameters.AddWithValue("@LeaveRecommender", EmployeeInfo.LeaveRecommender)
            cmd.Parameters.AddWithValue("@EntryBy", EntryBy)


            cmd.ExecuteNonQuery()
            con.Close()
            Return 1
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function
#End Region

#Region " Update Employee Info "
    Public Function fnUpdateTotalGradingSystem(ByVal EmployeeInfo As clsEmployeeInfo, ByVal EmployeeID As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateEmployeeInformation", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
            cmd.Parameters.AddWithValue("@UserID", EmployeeInfo.UserID)
            cmd.Parameters.AddWithValue("@Password", EmployeeInfo.Password)
            cmd.Parameters.AddWithValue("@UserType", EmployeeInfo.UserType)
            cmd.Parameters.AddWithValue("@EmployeeName", EmployeeInfo.EmployeeName)
            cmd.Parameters.AddWithValue("@EmpCode", EmployeeInfo.EmpCode)
            cmd.Parameters.AddWithValue("@EmpTypeID", EmployeeInfo.EmpTypeID)
            cmd.Parameters.AddWithValue("@TerminationTypeID", EmployeeInfo.TerminationTypeID)
            cmd.Parameters.AddWithValue("@RemarksOnTermination", EmployeeInfo.RemarksOnTermination)
            cmd.Parameters.AddWithValue("@JoiningDesignationID", EmployeeInfo.JoiningDesignationID)
            cmd.Parameters.AddWithValue("@OfficialDesignationID", EmployeeInfo.OfficialDesignationID)
            cmd.Parameters.AddWithValue("@FunctionalDesignationID", EmployeeInfo.FunctionalDesignationID)
            cmd.Parameters.AddWithValue("@DepartmentID", EmployeeInfo.DepartmentID)
            cmd.Parameters.AddWithValue("@ULCBranchID", EmployeeInfo.ULCBranchID)
            cmd.Parameters.AddWithValue("@CurrentSupervisor", EmployeeInfo.CurrentSupervisor)
            cmd.Parameters.AddWithValue("@JDno", EmployeeInfo.JDno)
            cmd.Parameters.AddWithValue("@Status", EmployeeInfo.Status)
            cmd.Parameters.AddWithValue("@BankID", EmployeeInfo.BankID)
            cmd.Parameters.AddWithValue("@BranchID", EmployeeInfo.BranchID)
            cmd.Parameters.AddWithValue("@BankAccountNo", EmployeeInfo.BankAccountNo)
            cmd.Parameters.AddWithValue("@Email", EmployeeInfo.Email)
            cmd.Parameters.AddWithValue("@DateOfBirth", EmployeeInfo.DateOfBirth)
            cmd.Parameters.AddWithValue("@JoiningDate", EmployeeInfo.JoiningDate)
            cmd.Parameters.AddWithValue("@ConfirmationDate", EmployeeInfo.ConfirmationDate)
            cmd.Parameters.AddWithValue("@PromotionDate", EmployeeInfo.PromotionDate)
            cmd.Parameters.AddWithValue("@ContractExpiryDate", EmployeeInfo.ContractExpiryDate)
            cmd.Parameters.AddWithValue("@ContractRenewalDate", EmployeeInfo.ContractRenewalDate)
            cmd.Parameters.AddWithValue("@TerminationDate", EmployeeInfo.TerminationDate)
            cmd.Parameters.AddWithValue("@EntryExamScore", EmployeeInfo.EntryExamScore)
            cmd.Parameters.AddWithValue("@PromotionalExamScore", EmployeeInfo.PromotionalExamScore)
            cmd.Parameters.AddWithValue("@isActive", EmployeeInfo.isActive)
            cmd.Parameters.AddWithValue("@LeaveApprover", EmployeeInfo.LeaveApprover)
            cmd.Parameters.AddWithValue("@LeaveRecommender", EmployeeInfo.LeaveRecommender)


            cmd.ExecuteNonQuery()
            con.Close()
            Return 1
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function
#End Region

#Region " Emp. Change Password "
    Public Function fnChangeEmpPassword(ByVal EmployeeID As String, ByVal Password As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spChangeEmpPassword", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
            cmd.Parameters.AddWithValue("@Password", Password)
            cmd.ExecuteNonQuery()
            con.Close()
            Return 1
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function
#End Region

#Region " Check Prev Password "
    Public Function fnCheckPrevPassword(ByVal EmployeeID As String, ByVal Password As String) As Integer
        Dim Count As Integer = 0
        Try
            Dim dr As SqlDataReader

            Dim cmd As SqlCommand = New SqlCommand("spCheckPrevPassword", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
            cmd.Parameters.AddWithValue("@Password", Password)
            dr = cmd.ExecuteReader()
            While dr.Read()
                Count = dr.Item("Count")
            End While
            con.Close()
            Return Count
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Count
        End Try
    End Function
#End Region

#Region " Get Employee Information "

    Public Function fnGetExamWiseSubjectStatus(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetEmployeeInformation"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Disparity Calculation "

    Public Function fnDisparityCalculation(ByVal EmpInfo As clsEmployeeInfo) As DataSet

        Dim sp As String = "spDisparityCalculation"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@DesignationID", EmpInfo.OfficialDesignationID)
                cmd.Parameters.AddWithValue("@DepartmentID", EmpInfo.DepartmentID)
                cmd.Parameters.AddWithValue("@ULCBranchID", EmpInfo.ULCBranchID)
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Employee Type "

    Public Function fnGetEmployeeType() As DataSet

        Dim sp As String = "spGetEmployeeType"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Termination Type "

    Public Function fnGetTerminationType() As DataSet

        Dim sp As String = "spGetTerminationType"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Official Designation Type "

    Public Function fnGetOfficialDesignation() As DataSet

        Dim sp As String = "spGetOfficialDesignation"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get functional Designation Type "

    Public Function fnGetFunctionalDesignation() As DataSet

        Dim sp As String = "spGetFunctionalDesignation"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get ULC Branch "

    Public Function fnGetULCBranch() As DataSet

        Dim sp As String = "spGetULCBranch"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Search Emp By Type Code "

    Public Function fnSearchEmpByTypeCode(ByVal EmpTypeCode As String, ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spSearchEmpByTypeCode"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmpTypeCode", EmpTypeCode)
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " List All Active Emp Att Settings "

    Public Function fnListAllActiveEmpAttSettings() As DataSet

        Dim sp As String = "spListAllActiveEmpAttSettings"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()
                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Employee List "

    Public Function fnGetEmployeeList() As DataSet

        Dim sp As String = "spGetEmployeeList"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Employee List All For Tax Cert "

    Public Function fnGetEmployeeListAllForTaxCert() As DataSet

        Dim sp As String = "spGetEmployeeListAllForTaxCert"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Emp List By Dept "

    Public Function fnGetEmpListByDept(ByVal DepartmentID As String) As DataSet
        Dim sp As String = "spGetEmpListByDept"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@DepartmentID", DepartmentID)
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get SubOrdinate List "

    Public Function fnGetSubOrdinateList(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetSubOrdinateList"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Bank Name "

    Public Function fnGetBankName() As DataSet

        Dim sp As String = "spGetBankName"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Branch Name "

    Public Function fnGetBranchName(ByVal BankID As String) As DataSet

        Dim sp As String = "spGetBranchName"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@BankID", BankID)
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Confirmation Due "

    Public Function fnGetConfirmationDue() As DataSet

        Dim sp As String = "spGetConfirmationDue"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()
                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Contract Renewal Due List "

    Public Function fnGetContractRenewalDue() As DataSet

        Dim sp As String = "spGetContractRenewalDue"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()
                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Employee Details "

    Public Function fnGetEmployeeDetailInfo() As DataSet

        Dim sp As String = "spGetEmployeeInfo"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Emp Info List Active "

    Public Function fnGetEmpInfoListActive() As DataSet

        Dim sp As String = "spGetEmpInfoListActive"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Resigned Emp List "

    Public Function fnGetResignedEmpList() As DataSet

        Dim sp As String = "spGetResignedEmpList"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Emp Transition History By Emp ID "

    Public Function fnGetEmpTranHistoryByEmpID(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetEmpTranHistoryByEmpID"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Emp Transition New "

    Public Function fnGetEmpTransitionNew(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetEmpTransitionNew"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Delete Emp Transition "

    Public Function fnDeleteEmpTransition(ByVal TransitionHistoryID As String) As Integer
        Dim sp As String = "spDeleteEmpTransition"
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@TransitionHistoryID", TransitionHistoryID)
                cmd.ExecuteNonQuery()
                con.Close()
                Return 1
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function

#End Region

#Region "Emp info by id"
    Public Function fnGetEmpInformationByID(ByVal EmployeeID As String) As clsEmployeeInfo
        Dim EmployeeInfo As New clsEmployeeInfo()
        Dim sp As String = "spGetEmployeeInfoByID"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    EmployeeInfo.UserID = dr.Item("UserID")
                    EmployeeInfo.Password = dr.Item("Password")
                    EmployeeInfo.UserType = dr.Item("UserType")
                    EmployeeInfo.EmployeeName = dr.Item("EmployeeName")
                    EmployeeInfo.EmpCode = dr.Item("EmpCode")
                    EmployeeInfo.EmpTypeID = dr.Item("EmpTypeID")
                    EmployeeInfo.DateOfBirth = dr.Item("DateOfBirth")
                    EmployeeInfo.BasicSalary = dr.Item("BasicSalary")
                    EmployeeInfo.JoiningDate = dr.Item("JoiningDate")
                    EmployeeInfo.ConfirmationDate = dr.Item("ConfirmationDate")
                    EmployeeInfo.PromotionDate = dr.Item("PromotionDate")
                    EmployeeInfo.ContractExpiryDate = dr.Item("ContractExpiryDate")
                    EmployeeInfo.ContractRenewalDate = dr.Item("ContractRenewalDate")
                    EmployeeInfo.TerminationTypeID = dr.Item("TerminationTypeID")
                    EmployeeInfo.TerminationDate = dr.Item("TerminationDate")
                    EmployeeInfo.RemarksOnTermination = dr.Item("RemarksOnTermination")
                    EmployeeInfo.JoiningDesignationID = dr.Item("JoiningDesignationID")
                    EmployeeInfo.OfficialDesignationID = dr.Item("OfficialDesignationID")
                    EmployeeInfo.FunctionalDesignationID = dr.Item("FunctionalDesignationID")
                    EmployeeInfo.DepartmentID = dr.Item("DepartmentID")
                    EmployeeInfo.ULCBranchID = dr.Item("ULCBranchID")
                    EmployeeInfo.CurrentSupervisor = dr.Item("CurrentSupervisor")
                    EmployeeInfo.JDno = dr.Item("JDno")
                    EmployeeInfo.Status = dr.Item("Status")
                    EmployeeInfo.BankID = dr.Item("BankID")
                    EmployeeInfo.BranchID = dr.Item("BranchID")
                    EmployeeInfo.BankAccountNo = dr.Item("BankAccountNo")
                    EmployeeInfo.Email = dr.Item("Email")
                    EmployeeInfo.EntryExamScore = dr.Item("EntryExamScore")
                    EmployeeInfo.PromotionalExamScore = dr.Item("PromotionalExamScore")
                    EmployeeInfo.isActive = dr.Item("isActive")
                    EmployeeInfo.LeaveApprover = dr.Item("LeaveApprover")
                    EmployeeInfo.LeaveRecommender = dr.Item("LeaveRecommender")
                    EmployeeInfo.IsPermittedToShowOwn = dr.Item("IsPermittedToShowOwn")
                    EmployeeInfo.IsPermittedToShowOthers = dr.Item("IsPermittedToShowOthers")
                    EmployeeInfo.AttendanceID = dr.Item("AttendanceID")
                    EmployeeInfo.ProbationEffectiveDate = dr.Item("ProbationEffectiveDate")
                    EmployeeInfo.ProbationPeriod = dr.Item("ProbationPeriod")
                    EmployeeInfo.AutoAdvTaxDeduction = dr.Item("AutoAdvTaxDeduction")
                    EmployeeInfo.IncludedInPayroll = dr.Item("IncludedInPayroll")
                End While
                con.Close()

                Return EmployeeInfo
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Edit Basic Employee Info "
    Public Function fnEditBasicEmpInfo(ByVal EmpInfo As clsEmployeeInfo) As Integer
        Dim sp As String = "spEditBasicEmpInfo"
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmpInfo.EmployeeID)
                cmd.Parameters.AddWithValue("@UserType", EmpInfo.UserType)
                cmd.Parameters.AddWithValue("@UserID", EmpInfo.UserID)
                cmd.Parameters.AddWithValue("@Password", EmpInfo.Password)
                cmd.Parameters.AddWithValue("@BasicSalary", EmpInfo.BasicSalary)
                cmd.Parameters.AddWithValue("@EmpCode", EmpInfo.EmpCode)
                cmd.Parameters.AddWithValue("@isActive", EmpInfo.isActive)
                cmd.Parameters.AddWithValue("@IncludedInPayroll", EmpInfo.IncludedInPayroll)
                cmd.Parameters.AddWithValue("@IsPermittedToShowOwn", EmpInfo.IsPermittedToShowOwn)
                cmd.Parameters.AddWithValue("@IsPermittedToShowOthers", EmpInfo.IsPermittedToShowOthers)
                cmd.Parameters.AddWithValue("@AttendanceID", EmpInfo.AttendanceID)
                cmd.Parameters.AddWithValue("@ProbationEffectiveDate", EmpInfo.ProbationEffectiveDate)
                cmd.Parameters.AddWithValue("@ProbationPeriod", EmpInfo.ProbationPeriod)
                cmd.Parameters.AddWithValue("@AutoAdvTaxDeduction", EmpInfo.AutoAdvTaxDeduction)
                cmd.Parameters.AddWithValue("@EntryBy", EmpInfo.EntryBy)
                cmd.ExecuteNonQuery()
                con.Close()
                Return 1
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function

#End Region

#Region " Edit Basic Employee Info Admin "
    Public Function fnEditBasicEmpInfoAdmin(ByVal EmpInfo As clsEmployeeInfo) As Integer
        Dim sp As String = "spEditBasicEmpInfoAdmin"
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmpInfo.EmployeeID)
                cmd.Parameters.AddWithValue("@UserType", EmpInfo.UserType)
                cmd.Parameters.AddWithValue("@UserID", EmpInfo.UserID)
                cmd.Parameters.AddWithValue("@Password", EmpInfo.Password)
                cmd.Parameters.AddWithValue("@EmpCode", EmpInfo.EmpCode)
                cmd.Parameters.AddWithValue("@isActive", EmpInfo.isActive)
                cmd.Parameters.AddWithValue("@IncludedInPayroll", EmpInfo.IncludedInPayroll)
                cmd.Parameters.AddWithValue("@IsPermittedToShowOwn", EmpInfo.IsPermittedToShowOwn)
                cmd.Parameters.AddWithValue("@IsPermittedToShowOthers", EmpInfo.IsPermittedToShowOthers)
                cmd.Parameters.AddWithValue("@AttendanceID", EmpInfo.AttendanceID)
                cmd.Parameters.AddWithValue("@ProbationEffectiveDate", EmpInfo.ProbationEffectiveDate)
                cmd.Parameters.AddWithValue("@ProbationPeriod", EmpInfo.ProbationPeriod)
                cmd.Parameters.AddWithValue("@AutoAdvTaxDeduction", EmpInfo.AutoAdvTaxDeduction)
                cmd.ExecuteNonQuery()
                con.Close()
                Return 1
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function

#End Region

#Region " Search Employee "

    Public Function fnSearchEmployee(ByVal EmpInfo As clsEmployeeInfo) As DataSet

        Dim sp As String = "spSearchEmployee"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeName", EmpInfo.EmployeeName)
                cmd.Parameters.AddWithValue("@DepartmentID", EmpInfo.DepartmentID)
                cmd.Parameters.AddWithValue("@OfficialDesignationID", EmpInfo.OfficialDesignationID)
                cmd.Parameters.AddWithValue("@ULCBranchID", EmpInfo.ULCBranchID)
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Search Emp By Name or ID "

    Public Function fnSearchEmpByNameorID(ByVal EmpIDorName As String) As DataSet
        Dim sp As String = "spSearchEmpByNameorID"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmpIDorName", EmpIDorName)
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Search Employee For Edit "

    Public Function fnSearchEmployeeForEdit(ByVal OrgSrchStr As clsSearchOrgStructure) As DataSet

        Dim sp As String = "spSearchEmployeeForEdit"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmpIDOrName", OrgSrchStr.EmpIDOrName)
                cmd.Parameters.AddWithValue("@EmployeeTypeID", OrgSrchStr.EmployeeTypeID)
                cmd.Parameters.AddWithValue("@DepartmentID", OrgSrchStr.DepartmentID)
                cmd.Parameters.AddWithValue("@DesignationID", OrgSrchStr.DesignationID)
                cmd.Parameters.AddWithValue("@ULCBranchID", OrgSrchStr.ULCBranchID)
                cmd.Parameters.AddWithValue("@IsActive", OrgSrchStr.IsActive)
                cmd.Parameters.AddWithValue("@Gender", OrgSrchStr.Gender)
                cmd.Parameters.AddWithValue("@BloodGroupID", OrgSrchStr.BloodGroupID)
                cmd.Parameters.AddWithValue("@PerDistrict", OrgSrchStr.PerDistrict)
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Show Org Structure "

    Public Function fnShowOrgStructure(ByVal OrgSrchStr As clsSearchOrgStructure) As DataSet

        Dim sp As String = "spShowOrgStructure"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmpIDOrName", OrgSrchStr.EmpIDOrName)
                cmd.Parameters.AddWithValue("@EmployeeTypeID", OrgSrchStr.EmployeeTypeID)
                cmd.Parameters.AddWithValue("@DesignationID", OrgSrchStr.DesignationID)
                cmd.Parameters.AddWithValue("@FunctionalDesignationID", OrgSrchStr.FunctionalDesignationID)
                cmd.Parameters.AddWithValue("@DepartmentID", OrgSrchStr.DepartmentID)
                cmd.Parameters.AddWithValue("@ULCBranchID", OrgSrchStr.ULCBranchID)
                cmd.Parameters.AddWithValue("@IsActive", OrgSrchStr.IsActive)
                cmd.Parameters.AddWithValue("@Gender", OrgSrchStr.Gender)
                cmd.Parameters.AddWithValue("@CurrentSupervisor", OrgSrchStr.CurrentSupervisor)
                cmd.Parameters.AddWithValue("@BloodGroupID", OrgSrchStr.BloodGroupID)
                cmd.Parameters.AddWithValue("@Religion", OrgSrchStr.Religion)
                cmd.Parameters.AddWithValue("@PerDistrict", OrgSrchStr.PerDistrict)
                cmd.Parameters.AddWithValue("@ActualBirthDay", OrgSrchStr.ActualBirthDay)
                cmd.Parameters.AddWithValue("@ActualBirthMonth", OrgSrchStr.ActualBirthMonth)
                cmd.Parameters.AddWithValue("@JoiningDate", OrgSrchStr.JoiningDate)
                cmd.Parameters.AddWithValue("@JoiningDateTo", OrgSrchStr.JoiningDateTo)
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()
                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get JD List "

    Public Function fnGetJDList() As DataSet

        Dim sp As String = "spGetJDList"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Eligible List Of ETA "

    Public Function fnGetEligibleListOfETA() As DataSet

        Dim sp As String = "spGetEligibleListOfETA"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()

                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region


    Public Function fnInsertJDAcceptance(ByVal EmployeeJDID As String, ByVal JobDescriptionID As String, ByVal EmployeeID As String) As String
        Dim CandidateID As String
        'Dim rd As SqlDataReader
        CandidateID = ""
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertJDAcceptance", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeJDID", EmployeeJDID)
            cmd.Parameters.AddWithValue("@JobDescriptionID", JobDescriptionID)
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)

            cmd.ExecuteNonQuery()
            con.Close()
            Return 1
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function

    Public Function fnUpdateETAInfoByEmp(ByVal Emp As clsEmployeeInfo) As clsResult
        Dim res As New clsResult()
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateETAInfoByEmp", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", Emp.EmployeeID)
            cmd.Parameters.AddWithValue("@SecondaryBankID", Emp.SecondaryBankID)
            cmd.Parameters.AddWithValue("@SecondaryBranchID", Emp.SecondaryBranchID)
            cmd.Parameters.AddWithValue("@SecondaryBankAccountNo", Emp.SecondaryBankAccountNo)
            cmd.Parameters.AddWithValue("@Fuel", Emp.Fuel)
            cmd.Parameters.AddWithValue("@DriverAllowance", Emp.DriverAllowance)
            cmd.Parameters.AddWithValue("@VehicleMaintenance", Emp.VehicleMaintenance)
            cmd.Parameters.AddWithValue("@CarSubsidy", Emp.CarSubsidy)
            cmd.Parameters.AddWithValue("@IsEligibleForExternalTA", Emp.IsEligibleForExternalTA)
            cmd.ExecuteNonQuery()
            con.Close()
            res.Success = True
            res.Message = "Updated Successfully."
            Return res
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            res.Success = False
            res.Message = ex.Message
            Return res
        End Try
    End Function

    Public Shared Function EmpJDCount(ByVal EmployeeID As String) As Integer

        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim rtn As Integer
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
        Try
            cn.Open()
            cmd.Connection = cn

            cmd.CommandText = "select count(1) from dbo.tblEmployeeInfo where JDno in (select JobDescriptionID from dbo.tblUserAcceptanceJD where tblUserAcceptanceJD.EmployeeID ='" + EmployeeID + "') and dbo.tblEmployeeInfo.EmployeeID='" & EmployeeID & " '"
            rd = cmd.ExecuteReader()

            rtn = 0
            While (rd.Read())
                rtn = rd.GetValue(0)
            End While
            cn.Close()
            Return rtn
        Catch ex As SqlException
            cn.Close()
            Return 0
        End Try
    End Function

#Region " Get Emp DashBoard "

    Public Function fnGetEmpDashBoard(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetEmpDashBoard"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
               
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()
                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Emp List By Designation "

    Public Function fnGetEmpListByDesignation(ByVal DesignationID As String) As DataSet

        Dim sp As String = "spGetEmpListByDesignation"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@DesignationID", DesignationID)
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()
                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

    Public Function fnHasConfidentialAccess(ByVal EmployeeID As String) As Boolean

        Dim sp As String = "spHasConfidentialAccess"
        Dim dr As SqlDataReader
        Dim ConfidentialAccess As Boolean = 0
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    ConfidentialAccess = dr.Item("ConfidentialAccess")
                End While
                con.Close()
                Return ConfidentialAccess
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return False
        End Try
    End Function

    Public Function fnGetETAInfoByEmp(ByVal EmployeeID As String) As clsEmployeeInfo

        Dim sp As String = "spGetETAInfoByEmp"
        Dim dr As SqlDataReader
        Dim Emp As New clsEmployeeInfo()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    Emp.SecondaryBankID = dr.Item("SecondaryBankID")
                    Emp.SecondaryBranchID = dr.Item("SecondaryBranchID")
                    Emp.SecondaryBankAccountNo = dr.Item("SecondaryBankAccountNo")
                    Emp.Fuel = dr.Item("Fuel")
                    Emp.DriverAllowance = dr.Item("DriverAllowance")
                    Emp.VehicleMaintenance = dr.Item("VehicleMaintenance")
                    Emp.CarSubsidy = dr.Item("CarSubsidy")
                    Emp.IsEligibleForExternalTA = dr.Item("IsEligibleForExternalTA")
                End While
                con.Close()
                Return Emp
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

End Class

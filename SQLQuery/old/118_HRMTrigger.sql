-- drop table [tblLogEmployeeInfo]
CREATE TABLE [dbo].[tblLogEmployeeInfo](
	[EmployeeID] [nvarchar](50) NOT NULL,
	[CandidateID] [nvarchar](50) NULL,
	[UserID] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[UserType] [nvarchar](50) NULL,
	[EmployeeName] [nvarchar](200) NULL,
	[EmpCode] [nvarchar](50) NULL,
	[EmpTypeID] [nvarchar](50) NULL,
	[DateOfBirth] [datetime] NULL,
	[JoiningDate] [datetime] NULL,
	[ConfirmationDate] [datetime] NULL,
	[PromotionDate] [datetime] NULL,
	[ContractExpiryDate] [datetime] NULL,
	[ContractRenewalDate] [datetime] NULL,
	[TerminationTypeID] [nvarchar](50) NULL,
	[TerminationDate] [datetime] NULL,
	[RemarksOnTermination] [nvarchar](1000) NULL,
	[JoiningDesignationID] [nvarchar](50) NULL,
	[OfficialDesignationID] [nvarchar](50) NULL,
	[FunctionalDesignationID] [nvarchar](50) NULL,
	[DepartmentID] [nvarchar](50) NULL,
	[ULCBranchID] [nvarchar](50) NULL,
	[CurrentSupervisor] [nvarchar](50) NULL,
	[JDno] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[BankID] [nvarchar](50) NULL,
	[BranchID] [nvarchar](50) NULL,
	[BankAccountNo] [nvarchar](200) NULL,
	[EntryExamScore] [decimal](18, 0) NULL,
	[PromotionalExamScore] [decimal](18, 0) NULL,
	[isActive] [bit] NULL,
	[EntryBy] [nvarchar](50) NULL,
	[EntryDate] [datetime],
);

GO

-- drop trigger [EmpTrigger]
Create TRIGGER [dbo].[EmpTrigger]
ON [dbo].[tblEmployeeInfo] after INSERT, UPDATE, DELETE
AS 
begin

declare @Event as nvarchar(1)

if exists (select * from deleted)
	set @Event='D'
if @Event='D'
begin
	delete from [tblLogEmployeeInfo] where [EmployeeID]=
		(select [EmployeeID] from deleted)
end
else
	begin

		INSERT INTO [tblLogEmployeeInfo]
			   ([EmployeeID],[CandidateID] ,[UserID],[Password],[UserType],[EmployeeName],[EmpCode],[EmpTypeID]
			   ,[DateOfBirth],[JoiningDate],[ConfirmationDate],[PromotionDate],[ContractExpiryDate],[ContractRenewalDate]			   ,[TerminationTypeID]
			   ,[TerminationDate],[RemarksOnTermination],[JoiningDesignationID],[OfficialDesignationID],[FunctionalDesignationID],[DepartmentID]
			   ,[ULCBranchID],[CurrentSupervisor],[JDno],[Status],[BankID],[BranchID],[BankAccountNo],[EntryExamScore]
			   ,[PromotionalExamScore],[isActive],[EntryBy],[EntryDate])
		   
		SELECT [EmployeeID],[CandidateID],[UserID],[Password],[UserType],[EmployeeName],[EmpCode],[EmpTypeID],[DateOfBirth]
			  ,[JoiningDate],[ConfirmationDate],[PromotionDate],[ContractExpiryDate],[ContractRenewalDate],[TerminationTypeID]
			  ,[TerminationDate],[RemarksOnTermination],[JoiningDesignationID],[OfficialDesignationID],[FunctionalDesignationID]
			  ,[DepartmentID],[ULCBranchID],[CurrentSupervisor],[JDno],[Status],[BankID],[BranchID],[BankAccountNo],[EntryExamScore]
			  ,[PromotionalExamScore],[isActive],[EntryBy],[EntryDate]
		  FROM INSERTED
	end
end
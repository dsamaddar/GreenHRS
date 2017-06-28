



--Employee Type Table creation



CREATE TABLE [dbo].[tblEmployeeType](
	[EmployeeTypeID] [nvarchar](50) NOT NULL,
	[EmployeeTypeName] [nvarchar](200) NULL,
	[isActive] [bit] NULL,
	[EntryBy] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_tblEmployeeType] PRIMARY KEY CLUSTERED 
(
	[EmployeeTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblEmployeeType] ADD  CONSTRAINT [DF_tblEmployeeType_isActive]  DEFAULT ((1)) FOR [isActive]
GO

ALTER TABLE [dbo].[tblEmployeeType] ADD  CONSTRAINT [DF_tblEmployeeType_EntryDate]  DEFAULT (getdate()) FOR [EntryDate]
GO



--insert EMPLOYEE TYPE




insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentEmployeeTypeID',0)

GO

--insert EMPLOYEE TYPE

CREATE proc [dbo].[spInsertEmployeeType]
@EmployeeTypeName nvarchar(200),
@IsActive bit,
@EntryBy nvarchar(50)
as
begin
	Declare @EmployeeTypeID nvarchar(50)
	Declare @CurrentEmployeeTypeID numeric(18,0)
	Declare @EmployeeTypeIDPrefix as nvarchar(9)

	set @EmployeeTypeIDPrefix='EMP-TYPE-'

begin tran
	
	select @CurrentEmployeeTypeID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentEmployeeTypeID'
	
	set @CurrentEmployeeTypeID=isnull(@CurrentEmployeeTypeID,0)+1
	Select @EmployeeTypeID=dbo.generateID(@EmployeeTypeIDPrefix,@CurrentEmployeeTypeID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblEmployeeType(EmployeeTypeID,EmployeeTypeName,IsActive,EntryBy)
	Values(@EmployeeTypeID,@EmployeeTypeName,@IsActive,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentEmployeeTypeID where PropertyName='CurrentEmployeeTypeID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

exec spInsertEmployeeType 'Permanent',1,'tahmed1'
exec spInsertEmployeeType 'Contractual',1,'tahmed1'


--GetEmployee Type


CREATE proc [dbo].[spGetEmployeeType]
as


SELECT [EmployeeTypeID]
      ,[EmployeeTypeName]
  FROM [dbo].[tblEmployeeType] where isActive =1

GO




--designation table creation



CREATE TABLE [dbo].[tblDesignation](
	[DesignationID] [nvarchar](50) NOT NULL,
	[DesignationName] [nvarchar](200) NOT NULL unique(DesignationName),
	[DesignationType] [nvarchar](200) NOT NULL,
	[intOrder] [int] NULL,
	[isActive] [bit] NULL,
	[EntryBy] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_tblDesignation] PRIMARY KEY CLUSTERED 
(
	[DesignationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblDesignation] ADD  CONSTRAINT [DF_tblDesignation_isActive]  DEFAULT ((1)) FOR [isActive]
GO

ALTER TABLE [dbo].[tblDesignation] ADD  CONSTRAINT [DF_tblDesignation_EntryDate]  DEFAULT (getdate()) FOR [EntryDate]
GO





insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentDesignationID',0)

GO

--insert designation



CREATE proc [dbo].[spInsertDesignation]
@DesignationName nvarchar(200),
@DesignationType nvarchar(50),
@intOrder integer,
@IsActive bit,
@EntryBy nvarchar(50)
as
begin
	Declare @DesignationID nvarchar(50)
	Declare @CurrentDesignationID numeric(18,0)
	Declare @DesignationIDPrefix as nvarchar(6)

	set @DesignationIDPrefix='DESIG-'

begin tran
	
	select @CurrentDesignationID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentDesignationID'
	
	set @CurrentDesignationID=isnull(@CurrentDesignationID,0)+1
	Select @DesignationID=dbo.generateID(@DesignationIDPrefix,@CurrentDesignationID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblDesignation(DesignationID,DesignationName,DesignationType ,intOrder,IsActive,EntryBy)
	Values(@DesignationID,@DesignationName,@DesignationType,@intOrder ,@IsActive,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentDesignationID where PropertyName='CurrentDesignationID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end
GO



Create Proc spUpdateDesignation
@DesignationID nvarchar(50),
@DesignationName nvarchar(50),
@DesignationType nvarchar(50),
@intOrder int,
@IsActive bit
as

begin
	UPDATE [tblDesignation]
		   SET [DesignationName] = @DesignationName
			  ,[DesignationType] = @DesignationType
			  ,[intOrder] = @intOrder
			  ,[isActive] = @IsActive
		 WHERE [DesignationID]=@DesignationID
end



exec spInsertDesignation '','Official',50,1,'tahmed1'
exec spInsertDesignation '','Functional',1,1,'tahmed1'





--get functional Designation


CREATE proc [dbo].[spGetFunctionalDesignation]
as

SELECT [DesignationID]
      ,[DesignationName]
  FROM [dbo].[tblDesignation]
where isActive =1 and [DesignationType]='Functional' order by [intOrder]

GO





--get official designation



CREATE proc [dbo].[spGetOfficialDesignation]
as

SELECT [DesignationID]
      ,[DesignationName]
  FROM [dbo].[tblDesignation]
where isActive =1 and [DesignationType]='Official' order by [intOrder] desc

GO


CREATE proc spGetDesignation
as
begin
	select DesignationID,DesignationName,DesignationType,intOrder
	,case when isActive ='True' then 'Active' else 'InActive' end as isActive from dbo.tblDesignation  where DesignationName<>'' order by DesignationType,intOrder
end


--Bank Name Table



CREATE TABLE [dbo].[tblBank](
	[BankID] [nvarchar](50) NOT NULL,
	[BankName] [nvarchar](200) NULL,
	[isActive] [bit] NULL,
	[EntryBy] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_tblBank] PRIMARY KEY CLUSTERED 
(
	[BankID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[BankName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblBank] ADD  CONSTRAINT [DF_tblBank_isActive]  DEFAULT ((1)) FOR [isActive]
GO

ALTER TABLE [dbo].[tblBank] ADD  CONSTRAINT [DF_tblBank_EntryDate]  DEFAULT (getdate()) FOR [EntryDate]
GO





insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentBankID',0)

GO

--insert bank name




--insert bank name

CREATE proc [dbo].[spInsertBank]
@BankName nvarchar(200),
@IsActive bit,
@EntryBy nvarchar(50)
as
begin
	Declare @BankID nvarchar(50)
	Declare @CurrentBankNameID numeric(18,0)
	Declare @BankNameIDPrefix as nvarchar(5)

	set @BankNameIDPrefix='Bank-'

begin tran
	
	select @CurrentBankNameID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentBankID'
	
	set @CurrentBankNameID=isnull(@CurrentBankNameID,0)+1
	Select @BankID=dbo.generateID(@BankNameIDPrefix,@CurrentBankNameID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblBank(BankID,BankName,IsActive,EntryBy)
	Values(@BankID,@BankName,@IsActive,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentBankNameID where PropertyName='CurrentBankID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end


GO

exec spInsertBank '',1,'tahmed1'
exec spInsertBank 'Sonali bank',1,'tahmed1'
exec spInsertBank 'Ripali bank',1,'tahmed1'
exec spInsertBank 'Agrani bank',1,'tahmed1'
exec spInsertBank 'Bangladesh bank',1,'tahmed1'
exec spInsertBank 'HSBC',1,'tahmed1'
exec spInsertBank 'SCB',1,'tahmed1'
exec spInsertBank 'DBBL',1,'tahmed1'


--get bank name



CREATE proc [dbo].[spGetBankName]
as

SELECT [BankID]
      ,[BankName]
  FROM [dbo].[tblBank]
where isActive =1 order by [BankName]


GO



--Create Branch Table




CREATE TABLE [dbo].[tblBranch](
	[BranchID] [nvarchar](50) NOT NULL,
	[BankID] [nvarchar](50) NOT NULL,
	[BranchName] [nvarchar](200) NOT NULL,
	[isActive] [bit] NULL,
	[EntryBy] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_tblBranch] PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblBranch]  WITH CHECK ADD  CONSTRAINT [FK_tblBranch_tblBank] FOREIGN KEY([BankID])
REFERENCES [dbo].[tblBank] ([BankID])
GO

ALTER TABLE [dbo].[tblBranch] CHECK CONSTRAINT [FK_tblBranch_tblBank]
GO

ALTER TABLE [dbo].[tblBranch] ADD  CONSTRAINT [DF_tblBranch_isActive]  DEFAULT ((1)) FOR [isActive]
GO

ALTER TABLE [dbo].[tblBranch] ADD  CONSTRAINT [DF_tblBranch_EntryDate]  DEFAULT (getdate()) FOR [EntryDate]
GO




insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentBranchID',0)

GO

--insert Branch name




--insert Branch name

CREATE proc [dbo].[spInsertBranch]
@BankID nvarchar(50),
@BranchName nvarchar(200),
@IsActive bit,
@EntryBy nvarchar(50)
as
begin
	Declare @BranchID nvarchar(50)
	Declare @CurrentBranchNameID numeric(18,0)
	Declare @BranchNameIDPrefix as nvarchar(7)

	set @BranchNameIDPrefix='Branch-'

begin tran
	
	select @CurrentBranchNameID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentBranchID'
	
	set @CurrentBranchNameID=isnull(@CurrentBranchNameID,0)+1
	Select @BranchID=dbo.generateID(@BranchNameIDPrefix,@CurrentBranchNameID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblBranch(BranchID,BankID,BranchName,IsActive,EntryBy)
	Values(@BranchID,@BankID,@BranchName,@IsActive,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentBranchNameID where PropertyName='CurrentBranchID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

exec spInsertBranch 'Bank-00000001','',1,'tahmed1'
--get branch



CREATE proc [dbo].[spGetBranchName]
@BankID nvarchar(50)
as

SELECT [BranchID]
      ,[BranchName]
  FROM [dbo].[tblBranch]
where isActive =1 and [BankID]=@BankID order by [BranchName]

GO




--Create TerminationType Table



CREATE TABLE [dbo].[tblTerminationType](
	[TerminationTypeID] [nvarchar](50) NOT NULL,
	[TerminationTypeName] [nvarchar](200) NULL,
	[isActive] [bit] NULL,
	[EntryBy] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_tblTerminationType] PRIMARY KEY CLUSTERED 
(
	[TerminationTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblTerminationType] ADD  CONSTRAINT [DF_tblTerminationType_isActive]  DEFAULT ((1)) FOR [isActive]
GO

ALTER TABLE [dbo].[tblTerminationType] ADD  CONSTRAINT [DF_tblTerminationType_EntryDate]  DEFAULT (getdate()) FOR [EntryDate]
GO




insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentTerminationTypeID',0)

GO

--insert Termination Type



CREATE proc [dbo].[spInsertTerminationType]
@TerminationTypeName nvarchar(200),
@IsActive bit,
@EntryBy nvarchar(50)
as
begin
	Declare @TerminationTypeID nvarchar(50)
	Declare @CurrentTerminationTypeID numeric(18,0)
	Declare @TerminationTypeIDPrefix as nvarchar(7)

	set @TerminationTypeIDPrefix='Ter-Typ-'

begin tran
	
	select @CurrentTerminationTypeID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentTerminationTypeID'
	
	set @CurrentTerminationTypeID=isnull(@CurrentTerminationTypeID,0)+1
	Select @TerminationTypeID=dbo.generateID(@TerminationTypeIDPrefix,@CurrentTerminationTypeID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblTerminationType(TerminationTypeID,TerminationTypeName,IsActive,EntryBy)
	Values(@TerminationTypeID,@TerminationTypeName,@IsActive,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentTerminationTypeID where PropertyName='CurrentTerminationTypeID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

exec spInsertTerminationType '',1,'tahmed1'
exec spInsertTerminationType 'Irregular',1,'tahmed1'



--get termination type




CREATE proc [dbo].[spGetTerminationType]
as

SELECT [TerminationTypeID]
      ,[TerminationTypeName]
  FROM [dbo].[tblTerminationType] where isActive =1 order by [TerminationTypeName]

GO




--Create ULC Branch Table



CREATE TABLE [dbo].[tblULCBranch](
	[ULCBranchID] [nvarchar](50) NOT NULL,
	[ULCBranchName] [nvarchar](200) NULL,
	[BranchLocation] [nvarchar](500) NULL,
	[isActive] [bit] NULL,
	[EntryBy] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_tblULCBranch] PRIMARY KEY CLUSTERED 
(
	[ULCBranchID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblULCBranch] ADD  CONSTRAINT [DF_tblULCBranch_isActive]  DEFAULT ((1)) FOR [isActive]
GO

ALTER TABLE [dbo].[tblULCBranch] ADD  CONSTRAINT [DF_tblULCBranch_EntryDate]  DEFAULT (getdate()) FOR [EntryDate]
GO




insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentULCBranchID',0)

GO

--insert ULC Branch 


CREATE proc [dbo].[spInsertULCBranch]
@ULCBranchName nvarchar(200),
@BranchLocation nvarchar(500),
@IsActive bit,
@EntryBy nvarchar(50)
as
begin
	Declare @ULCBranchID nvarchar(50)
	Declare @CurrentULCBranchID numeric(18,0)
	Declare @ULCBranchIDPrefix as nvarchar(10)

	set @ULCBranchIDPrefix='ULCBranch-'

begin tran
	
	select @CurrentULCBranchID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentULCBranchID'
	
	set @CurrentULCBranchID=isnull(@CurrentULCBranchID,0)+1
	Select @ULCBranchID=dbo.generateID(@ULCBranchIDPrefix,@CurrentULCBranchID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblULCBranch(ULCBranchID,ULCBranchName,BranchLocation,IsActive,EntryBy)
	Values(@ULCBranchID,@ULCBranchName,@BranchLocation,@IsActive,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentULCBranchID where PropertyName='CurrentULCBranchID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end


GO


exec spInsertULCBranch '','',1,'tahmed1'
exec spInsertULCBranch 'Camellia House','',1,'tahmed1'
exec spInsertULCBranch 'ULX','',1,'tahmed1'
exec spInsertULCBranch 'Farmgate','',1,'tahmed1'


--get ULC Branch



CREATE proc [dbo].[spGetULCBranch]
as

SELECT [ULCBranchID]
      ,[ULCBranchName]
  FROM [dbo].[tblULCBranch]
where isActive =1 order by ULCBranchName 

GO



CREATE TABLE [dbo].[tblEmployeeInfo](
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
	[Email] [nvarchar](50) NULL,
	[EntryExamScore] [decimal](18, 0) NULL,
	[PromotionalExamScore] [decimal](18, 0) NULL,
	[isActive] [bit] NULL,
	[LeaveApprover] [nvarchar](50) NULL,
	[LeaveRecommender] [nvarchar](50) NULL,
	[EntryBy] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK__tblEmplo__7AD04FF1184C96B4] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ__tblEmplo__7DA847CA1B29035F] UNIQUE NONCLUSTERED 
(
	[EmpCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblEmployeeInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeInfo_tblBank] FOREIGN KEY([BankID])
REFERENCES [dbo].[tblBank] ([BankID])
GO

ALTER TABLE [dbo].[tblEmployeeInfo] CHECK CONSTRAINT [FK_tblEmployeeInfo_tblBank]
GO

ALTER TABLE [dbo].[tblEmployeeInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeInfo_tblBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[tblBranch] ([BranchID])
GO

ALTER TABLE [dbo].[tblEmployeeInfo] CHECK CONSTRAINT [FK_tblEmployeeInfo_tblBranch]
GO

ALTER TABLE [dbo].[tblEmployeeInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeInfo_tblDepartment] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[tblDepartment] ([DepartmentID])
GO

ALTER TABLE [dbo].[tblEmployeeInfo] CHECK CONSTRAINT [FK_tblEmployeeInfo_tblDepartment]
GO

ALTER TABLE [dbo].[tblEmployeeInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeInfo_tblDesignation] FOREIGN KEY([JoiningDesignationID])
REFERENCES [dbo].[tblDesignation] ([DesignationID])
GO

ALTER TABLE [dbo].[tblEmployeeInfo] CHECK CONSTRAINT [FK_tblEmployeeInfo_tblDesignation]
GO

ALTER TABLE [dbo].[tblEmployeeInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeInfo_tblDesignation1] FOREIGN KEY([FunctionalDesignationID])
REFERENCES [dbo].[tblDesignation] ([DesignationID])
GO

ALTER TABLE [dbo].[tblEmployeeInfo] CHECK CONSTRAINT [FK_tblEmployeeInfo_tblDesignation1]
GO

ALTER TABLE [dbo].[tblEmployeeInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeInfo_tblDesignation2] FOREIGN KEY([OfficialDesignationID])
REFERENCES [dbo].[tblDesignation] ([DesignationID])
GO

ALTER TABLE [dbo].[tblEmployeeInfo] CHECK CONSTRAINT [FK_tblEmployeeInfo_tblDesignation2]
GO

ALTER TABLE [dbo].[tblEmployeeInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeInfo_tblEmployeeInfo] FOREIGN KEY([LeaveApprover])
REFERENCES [dbo].[tblEmployeeInfo] ([EmployeeID])
GO

ALTER TABLE [dbo].[tblEmployeeInfo] CHECK CONSTRAINT [FK_tblEmployeeInfo_tblEmployeeInfo]
GO

ALTER TABLE [dbo].[tblEmployeeInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeInfo_tblEmployeeInfo1] FOREIGN KEY([LeaveRecommender])
REFERENCES [dbo].[tblEmployeeInfo] ([EmployeeID])
GO

ALTER TABLE [dbo].[tblEmployeeInfo] CHECK CONSTRAINT [FK_tblEmployeeInfo_tblEmployeeInfo1]
GO

ALTER TABLE [dbo].[tblEmployeeInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeInfo_tblEmployeeType] FOREIGN KEY([EmpTypeID])
REFERENCES [dbo].[tblEmployeeType] ([EmployeeTypeID])
GO

ALTER TABLE [dbo].[tblEmployeeInfo] CHECK CONSTRAINT [FK_tblEmployeeInfo_tblEmployeeType]
GO

ALTER TABLE [dbo].[tblEmployeeInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeInfo_tblJobDescription] FOREIGN KEY([JDno])
REFERENCES [dbo].[tblJobDescription] ([JobDescriptionID])
GO

ALTER TABLE [dbo].[tblEmployeeInfo] CHECK CONSTRAINT [FK_tblEmployeeInfo_tblJobDescription]
GO

ALTER TABLE [dbo].[tblEmployeeInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeInfo_tblTerminationType] FOREIGN KEY([TerminationTypeID])
REFERENCES [dbo].[tblTerminationType] ([TerminationTypeID])
GO

ALTER TABLE [dbo].[tblEmployeeInfo] CHECK CONSTRAINT [FK_tblEmployeeInfo_tblTerminationType]
GO

ALTER TABLE [dbo].[tblEmployeeInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeInfo_tblULCBranch] FOREIGN KEY([ULCBranchID])
REFERENCES [dbo].[tblULCBranch] ([ULCBranchID])
GO

ALTER TABLE [dbo].[tblEmployeeInfo] CHECK CONSTRAINT [FK_tblEmployeeInfo_tblULCBranch]
GO

ALTER TABLE [dbo].[tblEmployeeInfo] ADD  CONSTRAINT [DF_tblEmployeeInfo_isActive]  DEFAULT ((1)) FOR [isActive]
GO

ALTER TABLE [dbo].[tblEmployeeInfo] ADD  CONSTRAINT [DF__tblEmploy__Entry__1D114BD1]  DEFAULT (getdate()) FOR [EntryDate]
GO



-----------------------------------------------
insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentEmployeeID',0)

GO



--insert Emp Info


CREATE procedure [dbo].[spInsertEmployeeInformation]
@EmployeeName nvarchar(200),
@EmpCode nvarchar(50),
@UserID nvarchar(50),
@Password	nvarchar(50),
@EmpTypeID nvarchar(50),
@TerminationTypeID nvarchar(50),
@RemarksOnTermination nvarchar(1000),
@JoiningDesignationID nvarchar(50),
@OfficialDesignationID nvarchar(50),
@FunctionalDesignationID nvarchar(50),
@DepartmentID nvarchar(50),
@ULCBranchID nvarchar(50),
@CurrentSupervisor nvarchar(50),
@JDno nvarchar(50),
@Status nvarchar(50),
@BankID nvarchar(50),
@BranchID nvarchar(50),
@BankAccountNo nvarchar(200),
@Email nvarchar(50),
@DateOfBirth datetime,
@JoiningDate datetime,
@ConfirmationDate datetime,
@PromotionDate datetime,
@ContractExpiryDate datetime,
@ContractRenewalDate datetime,
@TerminationDate datetime,
@EntryExamScore decimal(18,2),
@PromotionalExamScore decimal(18,2),
@isActive int,
@UserType nvarchar(50),
@LeaveApprover nvarchar(50),
@LeaveRecommender nvarchar(50),
@EntryBy nvarchar(50)
as

begin 

	Declare @EmpID nvarchar(50)
	Declare @CurrentEmpID numeric(18,0)
	Declare @EmpIDPrefix as nvarchar(4)
	
	set @EmpIDPrefix='EMP-'
	
	begin tran
	
	select @CurrentEmpID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentEmployeeID'
	
	set @CurrentEmpID=isnull(@CurrentEmpID,0)+1
	Select @EmpID=dbo.generateID(@EmpIDPrefix,@CurrentEmpID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	
	INSERT INTO [dbo].[tblEmployeeInfo]
           ([EmployeeID]
           ,UserID
           ,[Password]
           ,UserType 
           ,[EmployeeName]
           ,[EmpCode]
           ,[EmpTypeID]
           ,[DateOfBirth]
           ,[JoiningDate]
           ,[ConfirmationDate]
           ,[PromotionDate]
           ,[ContractExpiryDate]
           ,[ContractRenewalDate]
           ,[TerminationTypeID]
           ,[TerminationDate]
           ,[RemarksOnTermination]
           ,[JoiningDesignationID]
           ,[OfficialDesignationID]
           ,[FunctionalDesignationID]
           ,[DepartmentID]
           ,[ULCBranchID]
           ,[CurrentSupervisor]
           ,[JDno]
           ,[Status]
           ,[BankID]
           ,[BranchID]
           ,[BankAccountNo]
           ,Email 
           ,[EntryExamScore]
           ,[PromotionalExamScore]
           ,isActive
           ,LeaveApprover
           ,LeaveRecommender 
           ,[EntryBy]
           )
     VALUES
           (@EmpID,@UserID ,@Password, @UserType   ,@EmployeeName ,@EmpCode ,@EmpTypeID ,@DateOfBirth ,@JoiningDate ,@ConfirmationDate ,
           @PromotionDate ,@ContractExpiryDate ,@ContractRenewalDate ,@TerminationTypeID ,@TerminationDate ,@RemarksOnTermination 
           ,@JoiningDesignationID ,@OfficialDesignationID ,@FunctionalDesignationID ,@DepartmentID ,@ULCBranchID ,@CurrentSupervisor ,
           @JDno ,@Status ,@BankID ,@BranchID ,@BankAccountNo,@Email  ,@EntryExamScore ,@PromotionalExamScore,@isActive,
           @LeaveApprover ,@LeaveRecommender ,@EntryBy )

	
	update tblAppSettings set PropertyValue=@CurrentEmpID where PropertyName='CurrentEmployeeID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	commit tran
	return 0
	
	ERR_HANDLER:
	ROLLBACK TRAN
	RETURN 1
end

GO

exec  spInsertEmployeeInformation '',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1,null ,null


-- get employee list


CREATE proc [dbo].[spGetEmployeeList]
as

SELECT EmployeeID
      ,EmployeeName
  FROM [dbo].tblEmployeeInfo
where isActive =1 order by EmployeeName

GO


CREATE proc [dbo].[spGetJDList]
as

SELECT [JobDescriptionID]
      ,([JobDescriptionNo]+'('+[JobTitle]+')') JDName
  FROM [dbo].[tblJobDescription] order by JDName



CREATE procedure [dbo].[spGetEmployeeInfo]
as


SELECT [EmployeeID]
	  ,UserID 
	  ,[Password]
	  ,UserType 
      ,[EmployeeName]
      ,[EmpCode]
      ,(select EmployeeTypeName from dbo.tblEmployeeType where EmployeeTypeID=[EmpTypeID]) EmployeeTypeName
      ,convert(varchar,[DateOfBirth],106) DateOfBirth
      ,convert(varchar,[JoiningDate],106) JoiningDate
      ,convert(varchar,[ConfirmationDate],106) ConfirmationDate
      ,convert(varchar,[PromotionDate],106) PromotionDate
      ,convert(varchar,[ContractExpiryDate],106) ContractExpiryDate
      ,convert(varchar,[ContractRenewalDate],106) ContractRenewalDate
      ,(select TerminationTypeName from dbo.tblTerminationType where TerminationTypeID=[tblEmployeeInfo].TerminationTypeID) TerminationTypeName
      ,convert(varchar,[TerminationDate],106) TerminationDate
      ,[RemarksOnTermination]
      ,(select DesignationName from dbo.tblDesignation where DesignationID= [tblEmployeeInfo].[JoiningDesignationID]) JoiningDesignationName
      ,(select DesignationName from dbo.tblDesignation where DesignationID= [tblEmployeeInfo].[OfficialDesignationID]) OfficialDesignationName
      ,(select DesignationName from dbo.tblDesignation where DesignationID= [tblEmployeeInfo].[FunctionalDesignationID]) FunctionalDesignationName
      ,(select DeptName from dbo.tblDepartment where DepartmentID=[tblEmployeeInfo].[DepartmentID]) DeptName
      ,(select ULCBranchName from dbo.tblULCBranch where ULCBranchID=[tblEmployeeInfo].[ULCBranchID]) ULCBranchName
      ,(select EmployeeName from dbo.tblEmployeeInfo where EmployeeID=[CurrentSupervisor]) CurrentSupervisor
      ,[JDno]
      ,[Status]
      ,(select BankName from dbo.tblBank where BankID=[tblEmployeeInfo].[BankID]) BankName
      ,(select BranchName from dbo.tblBranch where [BranchID]=[tblEmployeeInfo].BranchID) BranchName
      ,[BankAccountNo]
      ,[EntryExamScore]
      ,[PromotionalExamScore]
      ,[isActive]
      ,Email 
      ,(select EmployeeName from dbo.tblEmployeeInfo where EmployeeID=[LeaveApprover]) LeaveApprover
      ,(select EmployeeName from dbo.tblEmployeeInfo where EmployeeID=[LeaveRecommender]) LeaveRecommender
  FROM [dbo].[tblEmployeeInfo] where [EmployeeName]<>''


GO


-- get information by employee id


CREATE proc [dbo].[spGetEmployeeInfoByID]
@EmployeeID as nvarchar(50)
as
SELECT [EmployeeID]
	  ,UserID
	  ,Password
	  ,UserType
      ,[EmployeeName]
      ,[EmpCode]
      ,(case when [EmpTypeID] is null then (select EmployeeTypeID from dbo.tblEmployeeType where EmployeeTypeName='') else EmpTypeID end) as EmpTypeID
      ,[DateOfBirth]
      ,(case when [JoiningDate] is null then '1911-01-01' else [JoiningDate] end) as [JoiningDate]
      ,(case when [ConfirmationDate] is null then '1911-01-01' else [ConfirmationDate] end) as [ConfirmationDate]
      ,(case when [PromotionDate] is null then '1911-01-01' else [PromotionDate] end) as [PromotionDate]
      ,(case when [ContractExpiryDate] is null then '1911-01-01' else [ContractExpiryDate] end) as [ContractExpiryDate]
      ,(case when [ContractRenewalDate] is null then '1911-01-01' else [ContractRenewalDate] end) as [ContractRenewalDate]
      ,(case when [TerminationTypeID] is null then (select TerminationTypeID from dbo.tblTerminationType where TerminationTypeName='') else TerminationTypeID end) as TerminationTypeID
      ,(case when [TerminationDate] is null then '1911-01-01' else [TerminationDate] end) as [TerminationDate]
      ,(case when [RemarksOnTermination] is null then '' else [RemarksOnTermination] end) as [RemarksOnTermination]
      ,(case when [JoiningDesignationID] is null then (select DesignationID from dbo.tblDesignation where DesignationName='' and DesignationType='Official') else [JoiningDesignationID] end) as [JoiningDesignationID]
      ,(case when [OfficialDesignationID] is null then (select DesignationID from dbo.tblDesignation where DesignationName='' and DesignationType='Official') else [OfficialDesignationID] end) as [OfficialDesignationID]
      ,(case when [FunctionalDesignationID] is null then (select DesignationID from dbo.tblDesignation where DesignationName='' and DesignationType='Functional') else [FunctionalDesignationID] end) as [FunctionalDesignationID]
      ,(case when [DepartmentID] is null then (select DepartmentID from dbo.tblDepartment where DeptName='') else [DepartmentID] end) as [DepartmentID]
      ,(case when [ULCBranchID] is null then (select ULCBranchID from dbo.tblULCBranch where ULCBranchName='') else [ULCBranchID] end) as [ULCBranchID]
      ,(case when [CurrentSupervisor] is null then (select EmployeeID from dbo.tblEmployeeInfo where EmployeeName='') else [CurrentSupervisor] end) as [CurrentSupervisor]
      --,(case when [JDno] is null then '' else [JDno] end) as [JDno]
     -- ,(select JobDescriptionNo+'('+JobTitle+')' from dbo.tblJobDescription where JobDescriptionID=[tblEmployeeInfo].JDno) JDno
      ,JDno
      ,(case when [Status] is null then '' else [Status] end) as [Status]
      ,(case when [BankID] is null then (select BankID from dbo.tblBank where BankName='') else [BankID] end) as [BankID]
      ,(case when [BranchID] is null then (select [BranchID] from dbo.tblBranch where BranchName='') else [BranchID] end) as [BranchID]
      ,(case when [BankAccountNo] is null then '' else [BankAccountNo] end) as [BankAccountNo]
      ,(case when [EntryExamScore] is null then 0 else [EntryExamScore] end) as [EntryExamScore]
      ,(case when [PromotionalExamScore] is null then 0 else [PromotionalExamScore] end) as [PromotionalExamScore]
      ,[isActive]
      ,Email 
      ,(case when [LeaveApprover] is null then (select EmployeeID from dbo.tblEmployeeInfo where EmployeeName='') else [LeaveApprover] end) as [LeaveApprover]
      ,(case when [LeaveRecommender] is null then (select EmployeeID from dbo.tblEmployeeInfo where EmployeeName='') else [LeaveRecommender] end) as [LeaveRecommender]

  FROM [dbo].[tblEmployeeInfo] where [EmployeeID]=@EmployeeID

--exec spGetEmployeeInfoByID 'EMP-00000002'
GO

-------------------update employee Info



CREATE procedure [dbo].[spUpdateEmployeeInformation]
@EmployeeID nvarchar(50),
@UserID nvarchar(50),
@Password nvarchar(50),
@UserType nvarchar(50),
@EmployeeName nvarchar(200),
@EmpCode nvarchar(50),
@EmpTypeID nvarchar(50),
@TerminationTypeID nvarchar(50),
@RemarksOnTermination nvarchar(1000),
@JoiningDesignationID nvarchar(50),
@OfficialDesignationID nvarchar(50),
@FunctionalDesignationID nvarchar(50),
@DepartmentID nvarchar(50),
@ULCBranchID nvarchar(50),
@CurrentSupervisor nvarchar(50),
@JDno nvarchar(50),
@Status nvarchar(50),
@BankID nvarchar(50),
@BranchID nvarchar(50),
@BankAccountNo nvarchar(200),
@Email nvarchar(50),
@DateOfBirth datetime,
@JoiningDate datetime,
@ConfirmationDate datetime,
@PromotionDate datetime,
@ContractExpiryDate datetime,
@ContractRenewalDate datetime,
@TerminationDate datetime,
@EntryExamScore decimal(18,2),
@PromotionalExamScore decimal(18,2),
@isActive int,
@LeaveApprover nvarchar(50),
@LeaveRecommender nvarchar(50)
as
begin
	begin tran
	
	UPDATE [dbo].[tblEmployeeInfo]
   SET UserID =@UserID 
	  ,Password =@Password 
	  ,UserType =@UserType 
	  ,[EmployeeName] = @EmployeeName
      ,[EmpCode] = @EmpCode
      ,[EmpTypeID] = @EmpTypeID
      ,[DateOfBirth] = @DateOfBirth
      ,[JoiningDate] = @JoiningDate
      ,[ConfirmationDate] = @ConfirmationDate
      ,[PromotionDate] = @PromotionDate
      ,[ContractExpiryDate] = @ContractExpiryDate
      ,[ContractRenewalDate] = @ContractRenewalDate
      ,[TerminationTypeID] = @TerminationTypeID
      ,[TerminationDate] = @TerminationDate
      ,[RemarksOnTermination] = @RemarksOnTermination
      ,[JoiningDesignationID] = @JoiningDesignationID
      ,[OfficialDesignationID] = @OfficialDesignationID
      ,[FunctionalDesignationID] = @FunctionalDesignationID
      ,[DepartmentID] = @DepartmentID
      ,[ULCBranchID] = @ULCBranchID
      ,[CurrentSupervisor] = @CurrentSupervisor
      ,[JDno] = @JDno
      ,[Status] = @Status
      ,[BankID] = @BankID
      ,[BranchID] = @BranchID
      ,[BankAccountNo] = @BankAccountNo
      ,Email =@Email 
      ,[EntryExamScore] = @EntryExamScore
      ,[PromotionalExamScore] = @PromotionalExamScore
      ,[isActive] = @isActive
      ,LeaveApprover =@LeaveApprover 
      ,LeaveRecommender =@LeaveRecommender 
			WHERE EmployeeID=@EmployeeID

	IF (@@ERROR <> 0) GOTO ERR_HANDLER

commit tran
	return 0
	
	ERR_HANDLER:
	ROLLBACK TRAN
	RETURN 1
end


GO



----------------------------------


CREATE TABLE [dbo].[tblEmployeeBasicInfo](
	[EmployeeBasicInfoID] [nvarchar](50) NOT NULL,
	[EmployeeID] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[FathersName] [nvarchar](100) NULL,
	[FathersOccupation] [nvarchar](200) NULL,
	[MothersName] [nvarchar](100) NULL,
	[MothersOccupation] [nvarchar](200) NULL,
	[SpouseName] [nvarchar](100) NULL,
	[SpouseOccupation] [nvarchar](200) NULL,
	[NoOfChildrenAge] [nvarchar](200) NULL,
	[SibblingsNameOccupation] [nvarchar](500) NULL,
	[RelationshipStatus] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[NIDNo] [nvarchar](100) NULL,
	[Nationality] [nvarchar](50) NULL,
	[Religion] [nvarchar](50) NULL,
	[PresentAddress] [nvarchar](500) NULL,
	[PreDistrict] [nvarchar](50) NULL,
	[PreThana] [nvarchar](50) NULL,
	[PermanentAddress] [nvarchar](500) NULL,
	[PerDistrict] [nvarchar](50) NULL,
	[PerThana] [nvarchar](50) NULL,
	[MobileNo] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[AlternateEmail] [nvarchar](50) NULL,
	[Photos] [nvarchar](500) NULL,
	[Signature] [nvarchar](500) NULL,
	[bitActive] [bit] NULL,
	[BloodGroupID] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblEmployeeBasicInfo] PRIMARY KEY CLUSTERED 
(
	[EmployeeBasicInfoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblEmployeeBasicInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeBasicInfo_tblBloodGroup] FOREIGN KEY([BloodGroupID])
REFERENCES [dbo].[tblBloodGroup] ([BloodGroupID])
GO

ALTER TABLE [dbo].[tblEmployeeBasicInfo] CHECK CONSTRAINT [FK_tblEmployeeBasicInfo_tblBloodGroup]
GO


-----------------------------------------



CREATE proc [dbo].[spGetEmployeeBasicInfo]
@EmployeeID nvarchar(50)

as
SELECT 
      [Name]
      ,[FathersName]
      ,[FathersOccupation]
      ,[MothersName]
      ,[MothersOccupation]
      ,[SpouseName]
      ,[SpouseOccupation]
      ,[NoOfChildrenAge]
      ,[SibblingsNameOccupation]
      ,[RelationshipStatus]
      ,[Gender]
      ,[NIDNo]
      ,[Nationality]
      ,[Religion]
      ,[PresentAddress]
      ,[PreDistrict]
      ,[PreThana]
      ,[PermanentAddress]
      ,[PerDistrict]
      ,[PerThana]
      ,[MobileNo]
      ,[Email]
      ,[AlternateEmail]
      ,isnull([Photos],'') [Photos]
      ,isnull([Signature],'') [Signature]
      ,BloodGroupID 
  FROM [dbo].[tblEmployeeBasicInfo] where [tblEmployeeBasicInfo].EmployeeID =@EmployeeID 


GO

---------------------------------------------
insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentEmployeeBasicID',0)

GO

----------------------------------------


CREATE proc [dbo].[spInsertEmployeeBasicInfo]
@EmployeeID nvarchar(50),
@Name nvarchar(50),
@FatherName nvarchar(100),
@FathersOccupation nvarchar(200),
@MotherName nvarchar(100),
@MothersOccupation nvarchar(200),
@SpouseName nvarchar(100),
@SpouseOccupation nvarchar(200),
@NoOfChildrenAge nvarchar(200),
@SibblingsNameOccupation nvarchar(500),
@Gender nvarchar(50),
@NIDNo nvarchar(100),
@Nationality nvarchar(100),
@Religion nvarchar(50),
@PresentAddress nvarchar(500),
@PreDistrict nvarchar(50),
@PreThana nvarchar(50),
@PermanentAddress nvarchar(500),
@PerDistrict nvarchar(50), 
@PerThana nvarchar(50),
@MobileNumber nvarchar(50),
@EMail nvarchar(50),
@AltEMail nvarchar(50),
@AttachmentFileName nvarchar(500),
@DocFileNameSign nvarchar(500),
@RelationshipStatus nvarchar(50),
@BloodGroupID nvarchar(50),
@UserDocuments nvarchar(500),
@UserID nvarchar(50)
as

begin
	Declare @total int
	Declare @EmpBasicID nvarchar(50)
	Declare @CurrentEmpBasicID numeric(18,0)
	Declare @EmpBasicIDPrefix as nvarchar(8)

	set @EmpBasicIDPrefix='EMP-BAS-'
	
	begin tran

	
	select @total=COUNT (1) from tblEmployeeBasicInfo where EmployeeID=@EmployeeID
	
		if @total=0
				begin
				
					select @CurrentEmpBasicID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentEmployeeBasicID'
				
					set @CurrentEmpBasicID=isnull(@CurrentEmpBasicID,0)+1
					Select @EmpBasicID=dbo.generateID(@EmpBasicIDPrefix,@CurrentEmpBasicID,8)		
					IF (@@ERROR <> 0) GOTO ERR_HANDLER
				
				
					INSERT INTO [dbo].[tblEmployeeBasicInfo]
				   ([EmployeeBasicInfoID]
				   ,[EmployeeID]
				   ,[Name]
				   ,[FathersName]
				   ,[FathersOccupation]
				   ,[MothersName]
				   ,[MothersOccupation]
				   ,[SpouseName]
				   ,[SpouseOccupation]
				   ,[NoOfChildrenAge]
				   ,[SibblingsNameOccupation]
				   ,[RelationshipStatus]
				   ,[Gender]
				   ,[NIDNo]
				   ,[Nationality]
				   ,[Religion]
				   ,[PresentAddress]
				   ,[PreDistrict]
				   ,[PreThana]
				   ,[PermanentAddress]
				   ,[PerDistrict]
				   ,[PerThana]
				   ,[MobileNo]
				   ,[Email]
				   ,[AlternateEmail]
				   ,[Photos]
				   ,[Signature]
				   ,[bitActive]
				   ,BloodGroupID )
			 VALUES
				   (@EmpBasicID ,@EmployeeID ,@Name  ,@FatherName,@FathersOccupation ,@MotherName,@MothersOccupation ,@SpouseName,
				   @SpouseOccupation ,@NoOfChildrenAge ,@SibblingsNameOccupation,@RelationshipStatus  ,@Gender
				   ,@NIDNo,@Nationality,@Religion,@PresentAddress,@PreDistrict ,@PreThana ,@PermanentAddress
				   ,@PerDistrict ,@PerThana,@MobileNumber,@EMail ,@AltEMail,@AttachmentFileName
				   ,@DocFileNameSign,1 ,@BloodGroupID )
				   
				   
			if @UserDocuments  <>''
				begin
					exec spInsertUserDocuments @UserDocuments,@EmployeeID,@UserID
				end
		           
				   update tblAppSettings set PropertyValue=@CurrentEmpBasicID where PropertyName='CurrentEmployeeBasicID'
					IF (@@ERROR <> 0) GOTO ERR_HANDLER

			end
			
			else
				
			begin
					UPDATE [dbo].[tblEmployeeBasicInfo]
					   SET [Name] = @Name
						  ,[FathersName] = @FatherName
						  ,[FathersOccupation]=@FathersOccupation 
						  ,[MothersName] = @MotherName
						  ,MothersOccupation =@MothersOccupation 
						  ,[SpouseName] = @SpouseName
						  ,SpouseOccupation =@SpouseOccupation 
						  ,[NoOfChildrenAge] =@NoOfChildrenAge 
						  ,[SibblingsNameOccupation] =@SibblingsNameOccupation 
						  ,RelationshipStatus=@RelationshipStatus 
						  ,[Gender] = @Gender
						  ,[NIDNo] = @NIDNo
						  ,[Nationality] = @Nationality
						  ,[Religion] = @Religion
						  ,[PresentAddress] = @PresentAddress
						  ,PreDistrict=@PreDistrict 
						  ,PreThana=@PreThana 
						  ,[PermanentAddress] = @PermanentAddress
						  ,PerDistrict=@PerDistrict 
						  ,PerThana=@PerThana 
						  ,[MobileNo] = @MobileNumber
						  ,[Email] = @EMail
						  ,[AlternateEmail] = @AltEMail
						  ,[Photos] = @AttachmentFileName
						  ,[Signature] = @DocFileNameSign
						  ,BloodGroupID =@BloodGroupID 
						  
					 WHERE EmployeeID=@EmployeeID
					 
					 if @UserDocuments  <>''
					begin
					
						delete from dbo.tblUserDocuments where UniqueUserID=@EmployeeID 
					
						exec spInsertUserDocuments @UserDocuments,@EmployeeID,@UserID
					end
					 
					-- IF (@@ERROR <> 0) GOTO ERR_HANDLER
			select @EmpBasicID=EmployeeBasicInfoID from [tblEmployeeBasicInfo] WHERE EmployeeID=@EmployeeID
			
			end

COMMIT TRAN
	select @EmpBasicID

ERR_HANDLER:
ROLLBACK TRAN
	select @EmpBasicID

end


GO




-------------------------------------------


CREATE TABLE [dbo].[tblEmployeeEducationInfo](
	[EmployeeEducationID] [nvarchar](50) NOT NULL,
	[EmployeeID] [nvarchar](50) NULL,
	[ExamID] [nvarchar](50) NULL,
	[Major] [nvarchar](50) NULL,
	[InstitutionID] [nvarchar](200) NULL,
	[PassingYear] [int] NULL,
	[ResultType] [nvarchar](50) NULL,
	[Result] [nvarchar](50) NULL,
	[OutOf] [decimal](18, 2) NULL,
 CONSTRAINT [PK_tblEmployeeEducationInfo] PRIMARY KEY CLUSTERED 
(
	[EmployeeEducationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


----------------------------

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentEmployeeEducationID',0)

GO

-----------------------------------------


--Insert Employee Education by CandidateID



CREATE procedure [dbo].[InsertEmployeeEducationInfo]
@CandidateID nvarchar(50)
as

begin
	Declare @ExamID nvarchar(50)
	Declare @MajorID nvarchar(50)
	Declare @InstitutionID nvarchar(50)
	Declare @PassingYear int
	Declare @ResultType nvarchar(50)
	Declare @Result nvarchar(50)
	
	Declare @EmployeeID nvarchar(50)
	Declare @EducationID nvarchar(50)
	Declare @CurrentEducationID numeric(18,0)
	Declare @EducationIDPrefix as nvarchar(8)

	set @EducationIDPrefix='EMP-EDU-'
	
	begin tran
	
	
	select @EmployeeID=EmployeeID from  dbo.tblEmployeeInfo where CandidateID=@CandidateID
	
	Declare @NCount as int
	--Declare @Count as int
	--Set @Count=0
	Set @NCount=0 
	
	Declare @CanEduInfo table(
	CandidateEducationID nvarchar(50),
	Taken bit default 0
	);
	
	Insert into @CanEduInfo(CandidateEducationID)
	Select CandidateEducationID from tblCandidateEducationInfo Where CandidateID=@CandidateID
	
	Declare @CandidateEducationID as nvarchar(50)
	
	Select @NCount= COUNT(*) from tblCandidateEducationInfo Where CandidateID=@CandidateID
		
	While @NCount >0
	begin
	
		Select top 1 @CandidateEducationID=CandidateEducationID from @CanEduInfo  Where Taken=0
		
		Select top 1  @ExamID=ExamID,@MajorID=Major,@InstitutionID=InstitutionID, @PassingYear=PassingYear, 
		@ResultType=ResultType ,@Result=Result from dbo.tblCandidateEducationInfo 
		where CandidateEducationID=@CandidateEducationID
		
		
		select @CurrentEducationID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentEmployeeEducationID'
	
	
		set @CurrentEducationID=isnull(@CurrentEducationID,0)+1
		Select @EducationID=dbo.generateID(@EducationIDPrefix,@CurrentEducationID,8)		
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	
		INSERT INTO [dbo].[tblEmployeeEducationInfo]
			   ([EmployeeEducationID]
			   ,[EmployeeID]
			   ,[ExamID]
			   ,[Major]
			   ,[InstitutionID]
			   ,[PassingYear]
			   ,[ResultType]
			   ,[Result])
		 VALUES
			   (@EducationID
			   ,@EmployeeID
			   ,@ExamID
			   ,@MajorID 
			   ,@InstitutionID 
			   ,@PassingYear 
			   ,@ResultType 
			   ,@Result )



		update tblAppSettings set PropertyValue=@CurrentEducationID where PropertyName='CurrentEmployeeEducationID'
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
		
		Update @CanEduInfo Set Taken=1 Where CandidateEducationID=@CandidateEducationID
		
		Set @NCount = @NCount - 1 
		
		set @ExamID=''	set @InstitutionID=''
		set @MajorID=''  set @PassingYear =0
		set @ResultType=''  set @Result=''
		
	end
	
	
	

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO



-----------------------------------



CREATE TABLE [dbo].[tblEmployeeExperienceInfo](
	[EmployeeExperienceID] [nvarchar](50) NOT NULL,
	[EmployeeID] [nvarchar](50) NOT NULL,
	[CompanyName] [nvarchar](100) NOT NULL,
	[PositionHeld] [nvarchar](50) NULL,
	[Department] [nvarchar](50) NULL,
	[Responsibilities] [nvarchar](500) NULL,
	[DateFrom] [datetime] NULL,
	[DateTo] [datetime] NULL,
	[TillDate] [bit] NULL,
 CONSTRAINT [PK_tblEmployeeExperienceInfo] PRIMARY KEY CLUSTERED 
(
	[EmployeeExperienceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



-------------------------------------

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentEmployeeExperienceID',0)

GO



---------------------------------------



CREATE procedure [dbo].[InsertEmployeeExperienceInfo]
@CandidateID nvarchar(50)
as

begin
	DECLARE @CompanyName nvarchar(100)	
	DECLARE @PositionHeld nvarchar(100)	
	DECLARE @Department nvarchar(50)
	DECLARE @Responsibilities nvarchar(500)
	DECLARE @DateFrom datetime
	DECLARE @DateTo datetime
	
	DECLARE @EmployeeID nvarchar(50)
	
	Declare @ExpID as nvarchar(50)
	Declare @CurrentExpID as numeric(18,0)
	Declare @ExpIDPrefix as nvarchar(8)
	
	set @ExpIDPrefix='EMP-EXP-'


	BEGIN TRAN
	
	select @EmployeeID=EmployeeID from dbo.tblEmployeeInfo where CandidateID=@CandidateID
	
	DECLARE @NCount int
	
	DECLARE @tblTempExp table(
	 CandidateExperienceID nvarchar(50),
	 Taken bit default 0)
	 
	 insert into @tblTempExp(CandidateExperienceID)
	 Select CandidateExperienceID from dbo.tblCandidateExperienceInfo 
	 where CandidateID=@CandidateID
	 
	 DECLARE @CandidateExperienceID nvarchar(50)
	 
	 select @NCount=COUNT(1) from dbo.tblCandidateExperienceInfo where CandidateID=@CandidateID
	 
	 while @NCount>0
	 begin
		select top 1 @CandidateExperienceID=CandidateExperienceID from @tblTempExp
		where Taken=0
		
		select @CompanyName=CompanyName,@PositionHeld=PositionHeld,@Department=Department,
		@Responsibilities=Responsibilities,@DateFrom=DateFrom,@DateTo=DateTo from 
		dbo.tblCandidateExperienceInfo where CandidateExperienceID=@CandidateExperienceID
		
		
		select @CurrentExpID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentEmployeeExperienceID'
	
	
		set @CurrentExpID=isnull(@CurrentExpID,0)+1
		Select @ExpID=dbo.generateID(@ExpIDPrefix,@CurrentExpID,8)		
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
		
		INSERT INTO [dbo].[tblEmployeeExperienceInfo]
           ([EmployeeExperienceID]
           ,[EmployeeID]
           ,[CompanyName]
           ,[PositionHeld]
           ,[Department]
           ,[Responsibilities]
           ,[DateFrom]
           ,[DateTo])
     VALUES
           (@ExpID,@EmployeeID,@CompanyName,@PositionHeld,@Department,@Responsibilities
           ,@DateFrom,@DateTo)
           
      
      set @CompanyName=''		set @Department=''
      set @PositionHeld=''		set @Responsibilities=''
      set @DateFrom =''			set @DateTo =''
      
	  update @tblTempExp set Taken =1
      where CandidateExperienceID=@CandidateExperienceID	
      
      set @NCount =@NCount - 1
      
      update tblAppSettings set PropertyValue=@CurrentExpID where PropertyName='CurrentEmployeeExperienceID'
	  IF (@@ERROR <> 0) GOTO ERR_HANDLER
		
		
	 end
	
	COMMIT TRAN
	Return 0
	
	ERR_HANDLER:
	ROLLBACK TRAN
	Return 1
	
end
GO


------------------------------------------------


CREATE TABLE [dbo].[tblEmployeeTrainingInfo](
	[EmployeeTrainingID] [nvarchar](50) NOT NULL,
	[EmployeeID] [nvarchar](50) NULL,
	[TrainingName] [nvarchar](100) NULL,
	[InstituteName] [nvarchar](200) NULL,
	[Country] [nvarchar](50) NULL,
	[TrainingYear] [int] NULL,
	[DateFrom] [datetime] NULL,
	[DateTo] [datetime] NULL,
 CONSTRAINT [PK_tblEmployeeTrainingInfo] PRIMARY KEY CLUSTERED 
(
	[EmployeeTrainingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


--insert Employee Training Info by CandidateID

--------------------------------------

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentEmployeeTrainingID',0)

GO

-----------------------------------------



CREATE proc [dbo].[InsertEmployeeTrainingInfo]
@CandidateID nvarchar(50)
as

begin 

	DECLARE @TrainingName nvarchar(100)	
	DECLARE @InstituteName nvarchar(200)	
	DECLARE @Country nvarchar(50)
	DECLARE @TrainingYear int
	DECLARE @DateFrom datetime
	DECLARE @DateTo datetime
	
	DECLARE @EmployeeID nvarchar(50)
	
	Declare @TrainingID as nvarchar(50)
	Declare @CurrentTrainingID as numeric(18,0)
	Declare @TrainingIDPrefix as nvarchar(8)
	
	set @TrainingIDPrefix='EMP-TRA-'


	BEGIN TRAN
	
	select @EmployeeID=EmployeeID from dbo.tblEmployeeInfo where CandidateID=@CandidateID
	
	DECLARE @NCount int
	
	DECLARE @tblTempTraining table(
	 CandidateTrainingID nvarchar(50),
	 Taken bit default 0)
	 
	 insert into @tblTempTraining(CandidateTrainingID)
	 Select CandidateTrainingID from dbo.tblCandidateTrainingInfo 
	 where CandidateID=@CandidateID
	 
	 DECLARE @CandidateTrainingID nvarchar(50)
	 
	 select @NCount=COUNT(1) from dbo.tblCandidateTrainingInfo where CandidateID=@CandidateID

	while @NCount>0
	 begin
		select top 1 @CandidateTrainingID=CandidateTrainingID from @tblTempTraining
		where Taken=0
		
		select @TrainingName=TrainingName,@InstituteName=InstituteName,@Country=Country,
		@TrainingYear=TrainingYear,@DateFrom=DateFrom,@DateTo=DateTo from 
		dbo.tblCandidateTrainingInfo where CandidateTrainingID=@CandidateTrainingID
		
		
		select @CurrentTrainingID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentEmployeeTrainingID'
	
	
		set @CurrentTrainingID=isnull(@CurrentTrainingID,0)+1
		Select @TrainingID=dbo.generateID(@TrainingIDPrefix,@CurrentTrainingID,8)		
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
		
		INSERT INTO [dbo].[tblEmployeeTrainingInfo]
           ([EmployeeTrainingID]
           ,[EmployeeID]
           ,[TrainingName]
           ,[InstituteName]
           ,[Country]
           ,[TrainingYear]
           ,[DateFrom]
           ,[DateTo])
           
     VALUES
           (@TrainingID,@EmployeeID,@TrainingName,@InstituteName,@Country,@TrainingYear
           ,@DateFrom,@DateTo)
           
      
      set @TrainingName=''		set @InstituteName=''
      set @Country=''			set @TrainingYear=0
      set @DateFrom =''			set @DateTo =''
      
	  update @tblTempTraining set Taken =1
      where CandidateTrainingID=@CandidateTrainingID	
      
      set @NCount =@NCount - 1
      
      update tblAppSettings set PropertyValue=@CurrentTrainingID where PropertyName='CurrentEmployeeTrainingID'
	  IF (@@ERROR <> 0) GOTO ERR_HANDLER
		
		
	 end
	COMMIT TRAN
	Return 0
	
	ERR_HANDLER:
	ROLLBACK TRAN
	Return 1
end
GO

---------------------------------------


CREATE TABLE [dbo].[tblEmployeeProfessionalCertificationInfo](
	[EmployeeProCerID] [nvarchar](50) NOT NULL,
	[EmployeeID] [nvarchar](50) NOT NULL,
	[CertificationName] [nvarchar](100) NULL,
	[InstituteName] [nvarchar](100) NULL,
	[Location] [nvarchar](500) NULL,
	[IssuingDate] [datetime] NULL,
	[ExpireDate] [datetime] NULL,
	[NeverExpire] [bit] NULL,
 CONSTRAINT [PK_tblEmployeeProfessionalCertificationInfo] PRIMARY KEY CLUSTERED 
(
	[EmployeeProCerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO





-------------------------------------------

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentEmployeeProCertiID',0)

GO

------------------------------------------


--insert Employee Professional Certification by CandidateID


create proc [dbo].[InsertEmployeeProCertification]
@CandidateID nvarchar(50)
as
begin

	DECLARE @CertificationName nvarchar(100)	
	DECLARE @InstituteName nvarchar(100)	
	DECLARE @Location nvarchar(500)
	DECLARE @DateFrom datetime
	DECLARE @DateTo datetime
	
	DECLARE @EmployeeID nvarchar(50)
	
	Declare @PCID as nvarchar(50)
	Declare @CurrentPCID as numeric(18,0)
	Declare @PCIDPrefix as nvarchar(9)
	
	set @PCIDPrefix='EMP-PrCr-'
	
	BEGIN TRAN
	
	select @EmployeeID=EmployeeID from dbo.tblEmployeeInfo where CandidateID=@CandidateID
	
	DECLARE @NCount int
	
	DECLARE @tblTempProCr table(
	 CanProCerID nvarchar(50),
	 Taken bit default 0)
	 
	 insert into @tblTempProCr(CanProCerID)
	 Select CanProCerID from dbo.tblCandidateProfessionalCertificationInfo 
	 where CandidateID=@CandidateID
	 
	 DECLARE @CanProCerID nvarchar(50)
	 
	 select @NCount=COUNT(1) from dbo.tblCandidateProfessionalCertificationInfo where CandidateID=@CandidateID
	 
	 
	 
	 while @NCount>0
	 begin
		select top 1 @CanProCerID=CanProCerID from @tblTempProCr
		where Taken=0
		
		select @CertificationName=CertificationName,@InstituteName=InstituteName,@Location=Location,
		@DateFrom=DateFrom,@DateTo=DateTo from 
		dbo.tblCandidateProfessionalCertificationInfo where CanProCerID=@CanProCerID
		
		
		select @CurrentPCID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentEmployeeProCertiID'
	
	
		set @CurrentPCID=isnull(@CurrentPCID,0)+1
		Select @PCID=dbo.generateID(@PCIDPrefix,@CurrentPCID,8)		
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
		
		
		
		INSERT INTO [dbo].[tblEmployeeProfessionalCertificationInfo]
           ([EmployeeProCerID]
           ,[EmployeeID]
           ,[CertificationName]
           ,[InstituteName]
           ,[Location]
           ,[DateFrom]
           ,[DateTo])
     VALUES
           
           (@PCID,@EmployeeID,@CertificationName,@InstituteName,@Location ,@DateFrom,@DateTo)
           
      
      set @CertificationName=''		set @InstituteName=''
      set @Location=''		
      set @DateFrom =''			set @DateTo =''
      
	 
	  update @tblTempProCr set Taken =1
      where CanProCerID=@CanProCerID
      
      set @NCount =@NCount - 1
      
      update tblAppSettings set PropertyValue=@CurrentPCID where PropertyName='CurrentEmployeeProCertiID'
	  IF (@@ERROR <> 0) GOTO ERR_HANDLER
		
		
	 end
	 
	COMMIT TRAN
	Return 0
	
	ERR_HANDLER:
	ROLLBACK TRAN
	Return 1
	
end
GO

--------------------------------------------------


CREATE proc [dbo].[InsertEmployeeBasicInfo]
@CandidateID nvarchar(50)
as

begin

	Declare @EmployeeID nvarchar(50)
	declare @Name nvarchar(100)
	declare @FathersName nvarchar(100)
	declare @FathersOccupation nvarchar(200)
	declare @MothersName nvarchar(100)
	declare @MothersOccupation nvarchar(200)
	declare @SpouseName nvarchar(100)
	declare @SpouseOccupation nvarchar(200)
	declare @NoOfChildrenAge nvarchar(200)
	declare @SibblingsNameOccupation nvarchar(500)
	Declare @RelationshipStatus nvarchar(50)
	declare @Gender nvarchar(50)
	declare @NIDNo nvarchar(100)
	declare @Nationality nvarchar(50)
	Declare @Religion nvarchar(50)
	declare @PresentAddress nvarchar(500)
	declare @PreDistrict nvarchar(50)
	declare @PreThana nvarchar(50)
	declare @PermanentAddress nvarchar(500)
	declare @PerDistrict nvarchar(50)
	Declare @PerThana nvarchar(50)
	Declare @MobileNo nvarchar(50)
	Declare @Email nvarchar(50)
	Declare @AltEmail nvarchar(50)
	Declare @Photo nvarchar(50)
	Declare @Signature nvarchar(50)
	Declare @BloodGroup nvarchar(50)
	
	
	Declare @EmpID nvarchar(50)
	Declare @CurrentEmpID numeric(18,0)
	Declare @EmpIDPrefix as nvarchar(8)

	set @EmpIDPrefix='EMP-BAS-'
	
	begin tran
	
			SELECT @Name=[CandidateName]
			  ,@FathersName=[FathersName]
			  ,@FathersOccupation=[FathersOccupation]
			  ,@MothersName=[MothersName]
			  ,@MothersOccupation=[MothersOccupation]
			  ,@SpouseName=[SpouseName]
			  ,@SpouseOccupation=[SpouseOccupation]
			  ,@NoOfChildrenAge=[NoOfChildrenAge]
			  ,@SibblingsNameOccupation=[SibblingsNameOccupation]
			  ,@RelationshipStatus=[RelationshipStatus]
			  ,@Gender=[Gender]
			  ,@NIDNo=[NIDNo]
			  ,@Nationality=[Nationality]
			  ,@Religion=[Religion]
			  ,@PresentAddress=[PresentAddress]
			  ,@PreDistrict=[PreDistrict]
			  ,@PreThana=[PreThana]
			  ,@PermanentAddress=[PermanentAddress]
			  ,@PerDistrict=[PerDistrict]
			  ,@PerThana=[PerThana]
			  ,@MobileNo=[PersonalPhoneNo]
			  ,@Email=dbo.tblRegisterUser.Email
			  ,@AltEmail=[AlternateEmail]
			  ,@Photo=dbo.tblPhotos.photos
			  ,@Signature =dbo.tblSignature.[Signature]
			  ,@BloodGroup =[BloodGroupID]
		  FROM [dbo].[tblCandidateBasicInfo] CB
		   inner join dbo.tblPhotos on dbo.tblPhotos.CandidateID=CB.CandidateID 
		   inner join dbo.tblSignature on dbo.tblSignature.CandidateID=CB.CandidateID
		   inner join dbo.tblRegisterUser on tblRegisterUser.RegistrationID=CB .RegistrationID
		   where CB.CandidateID=@CandidateID
 
	
	
		select @CurrentEmpID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentEmployeeBasicID'
	
	
		set @CurrentEmpID=isnull(@CurrentEmpID,0)+1
		Select @EmpID=dbo.generateID(@EmpIDPrefix,@CurrentEmpID,8)		
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
		
		
		Select @EmployeeID=EmployeeID   from tblEmployeeInfo where CandidateID =@CandidateID 
		
		INSERT INTO [dbo].[tblEmployeeBasicInfo]
           ([EmployeeBasicInfoID]
           ,[EmployeeID]
           ,[Name]
           ,[FathersName]
           ,[FathersOccupation]
           ,[MothersName]
           ,[MothersOccupation]
           ,[SpouseName]
           ,[SpouseOccupation]
           ,[NoOfChildrenAge]
           ,[SibblingsNameOccupation]
           ,[RelationshipStatus]
           ,[Gender]
           ,[NIDNo]
           ,[Nationality]
           ,[Religion]
           ,[PresentAddress]
           ,[PreDistrict]
           ,[PreThana]
           ,[PermanentAddress]
           ,[PerDistrict]
           ,[PerThana]
           ,[MobileNo]
           ,[Email]
           ,[AlternateEmail]
           ,[Photos]
           ,[Signature]
           ,[bitActive]
           ,BloodGroupID )
     VALUES
           (@EmpID,@EmployeeID,@Name ,@FathersName ,@FathersOccupation ,@MothersName ,@MothersOccupation 
           ,@SpouseName ,@SpouseOccupation ,@NoOfChildrenAge ,@SibblingsNameOccupation ,@RelationshipStatus 
           ,@Gender ,@NIDNo ,@Nationality ,@Religion ,@PresentAddress ,@PreDistrict ,@PreThana ,@PermanentAddress 
           ,@PerDistrict ,@PerThana ,@MobileNo ,@Email ,@AltEmail ,@Photo ,@Signature ,1,@BloodGroup)

		update tblAppSettings set PropertyValue=@CurrentEmpID where PropertyName='CurrentEmployeeBasicID'
		IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
 
end
GO

----------------------------------


--insert basicInfo by CandidateID


CREATE procedure [dbo].[InsertEmployeeInfo]
@CandidateID nvarchar(50)
as
begin

declare @UserID as nvarchar(50)
declare @Password as nvarchar(100)
declare @CandidateName as nvarchar(200)
declare @DateOfBirth as datetime
declare @count as int

	Declare @EmployeeID nvarchar(50)
	Declare @CurrentEmployeeID numeric(18,0)
	Declare @EmployeeIDPrefix as nvarchar(7)
	
	Declare @EmpCodeID nvarchar(50)
	Declare @CurrentEmpCodeID numeric(18,0)
	Declare @EmpCodeIDPrefix as nvarchar(2)
	
	set @EmployeeIDPrefix='EMP-'

	set @EmpCodeIDPrefix='A-'
	--Set Nocount on
begin tran


	select @count=COUNT(1) from dbo.tblEmployeeInfo where CandidateID =@CandidateID 
	
	if @count=0
	
	begin
			select @CurrentEmployeeID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentEmployeeID'
			
			set @CurrentEmployeeID=isnull(@CurrentEmployeeID,0)+1
			Select @EmployeeID=dbo.generateID(@EmployeeIDPrefix,@CurrentEmployeeID,8)		
			IF (@@ERROR <> 0) GOTO ERR_HANDLER
			
			
			select @CurrentEmpCodeID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentGeneralEmpID'
			
			set @CurrentEmpCodeID=isnull(@CurrentEmpCodeID,0)+1
			Select @EmpCodeID=dbo.generateID(@EmpCodeIDPrefix,@CurrentEmpCodeID,5)		
			IF (@@ERROR <> 0) GOTO ERR_HANDLER


		  SELECT @UserID=tblRegisterUser.[UserID] 
				,@Password =tblRegisterUser .[Password]
			    ,@CandidateName=[CandidateName]
			    ,@DateOfBirth =tblRegisterUser.DateOfBirth  
		  FROM [dbo].[tblCandidateBasicInfo] inner join dbo.tblRegisterUser on
		  dbo.tblRegisterUser.RegistrationID =[tblCandidateBasicInfo].RegistrationID 
		  
		  
		  
		  insert into dbo.tblEmployeeInfo (EmployeeID,CandidateID,UserID,[Password],UserType,EmployeeName,EmpCode,DateOfBirth)
		  values(@EmployeeID,@CandidateID,@UserID,@Password,'User' ,@CandidateName,@EmpCodeID,@DateOfBirth)
		  
		  

			update tblAppSettings set PropertyValue=@CurrentEmployeeID where PropertyName='CurrentEmployeeID'
			IF (@@ERROR <> 0) GOTO ERR_HANDLER
			
			update tblAppSettings set PropertyValue=@CurrentEmpCodeID where PropertyName='CurrentGeneralEmpID'
			IF (@@ERROR <> 0) GOTO ERR_HANDLER


			exec dbo.InsertEmployeeBasicInfo @CandidateID
			exec dbo.InsertEmployeeEducationInfo @CandidateID
			exec dbo.InsertEmployeeExperienceInfo @CandidateID
			exec dbo.InsertEmployeeProCertification @CandidateID
			exec dbo.InsertEmployeeTrainingInfo @CandidateID
			
			
			update dbo.tblRegisterUser set IsActive=0
			where UserID=@UserID 
			
	end
	
	else
	 return 0

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

--exec InsertEmployeeBasicInfo 'Can-00000002'
GO




CREATE proc [dbo].[spGetEmployeeEduInformation]
@EmployeeID varchar(50)
as
begin

SELECT EmployeeEducationID
      ,EmployeeID
      ,(select ExamName from  dbo.tblExamName where tblExamName.ExamID=tblEmployeeEducationInfo.ExamID ) ExamName
      ,(select MajorType from dbo.tblMajorType where MajorTypeID=tblEmployeeEducationInfo.Major)[Major]
      ,tblEmployeeEducationInfo.InstitutionID InstitutionID
      ,(select InstitutionName from dbo.tblInstitutionName where InstitutionID=tblEmployeeEducationInfo.[InstitutionID]) InstitutionName
      ,[PassingYear]
      ,[ResultType]
      ,[Result]
      ,tblEmployeeEducationInfo.ExamID ExamID
      ,tblEmployeeEducationInfo.Major MajorID
      ,case when OutOf =0 then 'N\A' else convert(nvarchar,OutOf) end as OutOf
  FROM [dbo].tblEmployeeEducationInfo where EmployeeID=@EmployeeID
end

-- exec spGetEmployeeEduInformation 'Can-00000001'


GO



CREATE proc [dbo].[spGetEmployeeExpInformation]
@EmployeeID varchar(50)
as
begin
SELECT EmployeeExperienceID
      ,EmployeeID
      ,[CompanyName]
      ,[PositionHeld]
      ,Department
      ,[Responsibilities]
      ,convert(varchar,[DateFrom],106) DateFrom
      --,convert(varchar,[DateTo],106) DateTo
      ,(case when [DateTo]='01-01-1911' then '' else convert(varchar,[DateTo],106) end)as [DateTo]
      ,case when TillDate =1 then 'Till Date' else '' end as TillDate
  FROM [dbo].tblEmployeeExperienceInfo where EmployeeID=@EmployeeID

end
GO




CREATE proc [dbo].[spGetEmployeeProCertiInformation]
@EmployeeID varchar(50)
as
begin
SELECT EmployeeProCerID
      ,EmployeeID
      ,[CertificationName]
      ,[InstituteName]
      ,[Location]
      --,convert(varchar,DateFrom,106)[DateFrom]
      --,convert(varchar,[DateTo],106) DateTo
      ,convert(varchar,IssuingDate,106)[IssuingDate]
      ,(case when [ExpireDate]='01-01-1911' then '' else convert(varchar,[ExpireDate],106) end)as [ExpireDate]
      ,case when NeverExpire=1 then 'Never Expire' else '' end as NeverExpire

  FROM [dbo].tblEmployeeProfessionalCertificationInfo
 where EmployeeID=@EmployeeID

end
GO




CREATE proc [dbo].[spGetEmployeeTrainingInformation]
@EmployeeID varchar(50)
as
begin
SELECT EmployeeTrainingID
      ,EmployeeID
      ,[TrainingName]
      ,[InstituteName]
      ,tblEmployeeTrainingInfo.Country   CountryID
      ,(select CountryName from dbo.tblCountryName where CountryID=[Country]) Country
      ,[TrainingYear]
      ,convert(varchar,[DateFrom],106)[DateFrom]
      ,convert(varchar,[DateTo],106) [DateTo]
  FROM [dbo].tblEmployeeTrainingInfo where EmployeeID=@EmployeeID
end
GO


--------------------------------------------


create proc spGetEmpCode
@EmployeeID as nvarchar(50)
as
begin
	select EmpCode from dbo.tblEmployeeInfo where EmployeeID=@EmployeeID
end

GO

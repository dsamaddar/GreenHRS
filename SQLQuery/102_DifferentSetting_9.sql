

CREATE TABLE [dbo].[tblDistrict](
	[DistrictID] [int] NOT NULL,
	[DivisionID] [int] NULL,
	[DistrictName] [nvarchar](200) NULL,
	[EntryUser] [nvarchar](200) NULL,
	[EmtryDate] [datetime] NULL,
 CONSTRAINT [PK_tblDistrict] PRIMARY KEY CLUSTERED 
(
	[DistrictID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


INSERT INTO [dbo].[tblDistrict]
           ([DistrictID] ,[DivisionID],[DistrictName],[EntryUser],[EmtryDate])
     VALUES
           (1,1,'','tahmed1',GETDATE())





CREATE TABLE [dbo].[tblDepartment](
	[DepartmentID] [nvarchar](50) NOT NULL,
	[DeptName] [nvarchar](200) NULL,
	[IsActive] [bit] NULL,
	[EntryBy] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[DeptName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblDepartment] ADD  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[tblDepartment] ADD  DEFAULT (getdate()) FOR [EntryDate]
GO




insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentDeptID',0)

GO



-- drop proc spInsertDepartment
Create proc [dbo].[spInsertDepartment]
@DeptName nvarchar(200),
@IsActive bit,
@EntryBy nvarchar(50)
as
begin
	Declare @DepartmentID nvarchar(50)
	Declare @CurrentDepartmentID numeric(18,0)
	Declare @DepartmentIDPrefix as nvarchar(5)

	set @DepartmentIDPrefix='DEPT-'

begin tran
	
	select @CurrentDepartmentID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentDeptID'
	
	set @CurrentDepartmentID=isnull(@CurrentDepartmentID,0)+1
	Select @DepartmentID=dbo.generateID(@DepartmentIDPrefix,@CurrentDepartmentID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblDepartment(DepartmentID,DeptName,IsActive,EntryBy)
	Values(@DepartmentID,@DeptName,@IsActive,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentDepartmentID where PropertyName='CurrentDeptID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end


GO

exec spInsertDepartment '',1,'tahmed1'
--exec spInsertDepartment 'System Development',1,'tahmed1'
--exec spInsertDepartment 'HRM',1,'tahmed1'
--exec spInsertDepartment 'ICT',1,'tahmed1'








CREATE proc [dbo].[spGetDeptList]
as
begin
	Select distinct DepartmentID,DeptName from tblDepartment Where IsActive=1 order by DeptName 
end



GO




CREATE TABLE [dbo].[tblUpazila](
	[UpazilaID] [int] NOT NULL,
	[DivisionID] [int] NULL,
	[DistrictID] [int] NULL,
	[UpazilaName] [nvarchar](200) NULL,
	[EntryUser] [nvarchar](100) NULL,
	[EntryDate] [datetime] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblUpazila]  WITH CHECK ADD  CONSTRAINT [FK_tblUpazila_tblDistrict] FOREIGN KEY([DistrictID])
REFERENCES [dbo].[tblDistrict] ([DistrictID])
GO

ALTER TABLE [dbo].[tblUpazila] CHECK CONSTRAINT [FK_tblUpazila_tblDistrict]
GO


INSERT INTO [dbo].[tblUpazila]
           ([UpazilaID],[DivisionID],[DistrictID],[UpazilaName],[EntryUser],[EntryDate])
     VALUES
           (1 ,1 ,1 ,'','tahmed1',GETDATE())
GO


CREATE TABLE [dbo].[tblInstitutionName](
	[InstitutionID] [nvarchar](50) NOT NULL,
	[InstitutionName] [nvarchar](500) NULL unique(InstitutionName),
	[InstitutionType] [nvarchar](50) NULL,
	[isActive] [bit] NULL,
	[EntryBy] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_tblInstitutionName] PRIMARY KEY CLUSTERED 
(
	[InstitutionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ__tblInsti__22547BF408362A7C] UNIQUE NONCLUSTERED 
(
	[InstitutionName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblInstitutionName] ADD  CONSTRAINT [DF_tblInstitutionName_isActive]  DEFAULT ((1)) FOR [isActive]
GO

ALTER TABLE [dbo].[tblInstitutionName] ADD  CONSTRAINT [DF_tblInstitutionName_EntryDate]  DEFAULT (getdate()) FOR [EntryDate]
GO




CREATE TABLE [dbo].[tblJobType](
	[JobTypeID] [nvarchar](50) NOT NULL,
	[JobType] [nvarchar](200) NULL,
	[IsActive] [bit] NULL,
	[EntryBy] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[JobTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[JobType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblJobType] ADD  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[tblJobType] ADD  DEFAULT (getdate()) FOR [EntryDate]
GO





insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentJobTypeID',0)

GO



Create proc [dbo].[spInsertJobType]
@JobType nvarchar(200),
@IsActive bit,
@EntryBy nvarchar(50)
as
begin
	Declare @JobTypeID nvarchar(50)
	Declare @CurrentJobTypeID numeric(18,0)
	Declare @JobTypeIDPrefix as nvarchar(8)

	set @JobTypeIDPrefix='JOB-TYP-'

begin tran
	
	select @CurrentJobTypeID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentJobTypeID'
	
	set @CurrentJobTypeID=isnull(@CurrentJobTypeID,0)+1
	Select @JobTypeID=dbo.generateID(@JobTypeIDPrefix,@CurrentJobTypeID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblJobType(JobTypeID,JobType,IsActive,EntryBy)
	Values(@JobTypeID,@JobType,@IsActive,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentJobTypeID where PropertyName='CurrentJobTypeID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end
GO


exec [spInsertJobType] 'Sedentary',1,'tahmed1'
exec [spInsertJobType] 'Mobility',1,'tahmed1'
exec [spInsertJobType] 'Both',1,'tahmed1'




CREATE TABLE [dbo].[tblServiceType](
	[ServiceTypeID] [nvarchar](50) NOT NULL,
	[ServiceType] [nvarchar](200) NULL,
	[IsActive] [bit] NULL,
	[EntryBy] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ServiceTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ServiceType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblServiceType] ADD  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[tblServiceType] ADD  DEFAULT (getdate()) FOR [EntryDate]
GO



insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentServiceTypeID',0)

GO




Create proc [dbo].[spInsertServiceType]
@ServiceType nvarchar(200),
@IsActive bit,
@EntryBy nvarchar(50)
as
begin
	Declare @ServiceTypeID nvarchar(50)
	Declare @CurrentServiceTypeID numeric(18,0)
	Declare @ServiceTypeIDPrefix as nvarchar(8)

	set @ServiceTypeIDPrefix='SRV-TYP-'

begin tran
	
	select @CurrentServiceTypeID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentServiceTypeID'
	
	set @CurrentServiceTypeID=isnull(@CurrentServiceTypeID,0)+1
	Select @ServiceTypeID=dbo.generateID(@ServiceTypeIDPrefix,@CurrentServiceTypeID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblServiceType(ServiceTypeID,ServiceType,IsActive,EntryBy)
	Values(@ServiceTypeID,@ServiceType,@IsActive,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentServiceTypeID where PropertyName='CurrentServiceTypeID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end
GO

exec [spInsertServiceType] 'Full Time',1,'tahmed1'
exec [spInsertServiceType] 'Part Time',1,'tahmed1'





CREATE TABLE [dbo].[tblRelationShipStatus](
	[RelationshipID] [int] IDENTITY(1,1) NOT NULL,
	[RelName] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[EntryBy] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_tblRelationShipStatus] PRIMARY KEY CLUSTERED 
(
	[RelationshipID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO





--------------------



CREATE TABLE [dbo].[tblMajorType](
	[MajorTypeID] [nvarchar](50) NOT NULL,
	[MajorType] [nvarchar](200) NULL unique(MajorType),
	[IsActive] [bit] NULL,
	[EntryBy] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MajorTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MajorType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblMajorType] ADD  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[tblMajorType] ADD  DEFAULT (getdate()) FOR [EntryDate]
GO



-------------------------

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentMajorTypeID',0)

GO
-----------------------



Create proc [dbo].[spInsertMajorType]
@MajorType nvarchar(200),
@IsActive bit,
@EntryBy nvarchar(50)
as
begin
	Declare @MajorTypeID nvarchar(50)
	Declare @CurrentMajorTypeID numeric(18,0)
	Declare @MajorTypeIDPrefix as nvarchar(8)

	set @MajorTypeIDPrefix='MRV-TYP-'

begin tran
	
	select @CurrentMajorTypeID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentMajorTypeID'
	
	set @CurrentMajorTypeID=isnull(@CurrentMajorTypeID,0)+1
	Select @MajorTypeID=dbo.generateID(@MajorTypeIDPrefix,@CurrentMajorTypeID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblMajorType(MajorTypeID,MajorType,IsActive,EntryBy)
	Values(@MajorTypeID,@MajorType,@IsActive,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentMajorTypeID where PropertyName='CurrentMajorTypeID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end
GO

exec spInsertMajorType 'Science',1,'tahmed1'
exec spInsertMajorType 'Arts',1,'tahmed1'
exec spInsertMajorType 'Commerce',1,'tahmed1'
exec spInsertMajorType 'Accounting',1,'tahmed1'
exec spInsertMajorType 'CSE',1,'tahmed1'
exec spInsertMajorType 'EEE',1,'tahmed1'



CREATE proc [dbo].[spGetMajorList]
as
begin
	Select distinct MajorTypeID,MajorType from tblMajorType Where IsActive=1 order by MajorType 
end


GO

---------------------------------------


CREATE proc [dbo].[spUpdateMajorType]
@MajorType nvarchar(200),
@IsActive bit,
@MajorID nvarchar(50)
as
begin
begin tran
	
	UPDATE [tblMajorType]
		   SET [MajorType] = @MajorType
			  ,[IsActive] = @IsActive
			 WHERE [MajorTypeID]=@MajorID

	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end


---------------------






------------------


insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentInstitutionID',0)

GO

----------------------------


CREATE proc [dbo].[spInsertInstitutionName]
@InstitutionName nvarchar(500),
@BUType nvarchar(50),
@IsActive integer,
@EntryBy nvarchar(50)
as 


begin
	Declare @InstitutionID nvarchar(50)
	Declare @CurrentInstitutionID numeric(18,0)
	Declare @InstitutionIDPrefix as nvarchar(10)

	set @InstitutionIDPrefix='InstName-'

begin tran
	
	select @CurrentInstitutionID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentInstitutionID'
	
	set @CurrentInstitutionID=isnull(@CurrentInstitutionID,0)+1
	Select @InstitutionID=dbo.generateID(@InstitutionIDPrefix,@CurrentInstitutionID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	INSERT INTO [dbo].[tblInstitutionName]
           (InstitutionID 
           ,[InstitutionName]
           ,InstitutionType
           ,[isActive]
           ,[EntryBy]
           )
     VALUES
           (@InstitutionID 
           ,@InstitutionName
           ,@BUType 
           ,@IsActive
           ,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentInstitutionID where PropertyName='CurrentInstitutionID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

exec spInsertInstitutionName 'Others','N\A',1,'tahmed1'
--exec spInsertInstitutionName 'Dhaka Board',1,'tahmed1'
--exec spInsertInstitutionName 'Jessore Board',1,'tahmed1'
--exec spInsertInstitutionName 'Commila Board',1,'tahmed1'
--exec spInsertInstitutionName 'Dhaka University',1,'tahmed1'


CREATE proc [dbo].[spGetInstitutionList]
as
SELECT [InstitutionID],[InstitutionName]  FROM [dbo].[tblInstitutionName] where isActive=1 order by [InstitutionName] 

------------------------------------------------------------------------here

CREATE proc [dbo].[spUpdateInstitutionName]
@InstitutionName nvarchar(500),
@BUType nvarchar(50),
@IsActive integer,
@InstitutionID nvarchar(50)
as 

begin
	
begin tran
	
	UPDATE [tblInstitutionName]
	   SET [InstitutionName] = @InstitutionName
		  ,InstitutionType=@BUType 
		  ,[isActive] = @IsActive
			WHERE [InstitutionID]=@InstitutionID
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end





-----------------------


CREATE TABLE [dbo].[tblExamName](
	[ExamID] [nvarchar](50) NOT NULL,
	[ExamName] [nvarchar](100) NULL unique(ExamName),
	[bitActive] [bit] NULL,
	[ExamOrder] [int] NULL,
	[EntryBy] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_tblExamName] PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblExamName] ADD  CONSTRAINT [DF_tblExamName_bitActive]  DEFAULT ((1)) FOR [bitActive]
GO

ALTER TABLE [dbo].[tblExamName] ADD  CONSTRAINT [DF_tblExamName_EntryDate]  DEFAULT (getdate()) FOR [EntryDate]
GO


insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentExamID',0)

GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentExamOrderID',0)

GO


CREATE proc [dbo].[spInsertExamName]
@ExamName nvarchar(200),
@Order int,
@IsActive integer,
@EntryBy nvarchar(50)
as 


begin
	Declare @ExamID nvarchar(50)
	DECLARE @ExamOrder integer
	Declare @CurrentExamID numeric(18,0)
	Declare @ExamIDPrefix as nvarchar(8)

	set @ExamIDPrefix='Ex-Name-'

begin tran

	--select @ExamOrder= PropertyValue from tblAppSettings where  PropertyName='CurrentExamOrderID'
	--set @ExamOrder=@ExamOrder+1
	
	select @CurrentExamID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentExamID'
	
	set @CurrentExamID=isnull(@CurrentExamID,0)+1
	Select @ExamID=dbo.generateID(@ExamIDPrefix,@CurrentExamID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	INSERT INTO [dbo].[tblExamName]
           ([ExamID]
           ,[ExamName]
           ,[bitActive]
           ,[ExamOrder]
           ,[EntryBy]
           )
     VALUES
           (@ExamID
           ,@ExamName
           ,@IsActive
           ,@Order
           ,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentExamID where PropertyName='CurrentExamID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	--update tblAppSettings set PropertyValue=@ExamOrder where PropertyName='CurrentExamOrderID'
	--IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO


exec spInsertExamName 'SSC(Equvalent)',1,1,'tahmed1'
exec spInsertExamName 'HSC(Equvalent)',1,2,'tahmed1'
exec spInsertExamName 'Degree(Equvalent)',1,3,'tahmed1'
exec spInsertExamName 'Honors',1,3,'tahmed1'
exec spInsertExamName 'M Phil',1,4,'tahmed1'
exec spInsertExamName 'PHD',1,5,'tahmed1'


CREATE proc [dbo].[spGetExamList]
as
begin
	Select distinct ExamID,ExamName from [tblExamName] Where bitActive=1 order by ExamName 
end


GO



CREATE proc [dbo].[spUpdateExamName]
@ExamName nvarchar(200),
@Order int,
@IsActive integer,
@ExamID nvarchar(50)
as 


begin

begin tran


	UPDATE [dbo].[tblExamName]
	   SET [ExamName] = @ExamName
		  ,[bitActive] = @IsActive
		  ,ExamOrder =@Order 
			WHERE ExamID =@ExamID
	 IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end



-----------------------------


CREATE TABLE [dbo].[tblCountryName](
	[CountryID] [nvarchar](50) NOT NULL,
	[CountryName] [nvarchar](200) NULL,
	[IsActive] [bit] NULL,
	[EntryBy] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_tblCountryName] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentCountryID',0)

GO

----------------------------


CREATE proc [dbo].[spInsertCountryName]
@CountryName nvarchar(200),
@IsActive integer,
@EntryBy nvarchar(50)
as 


begin
	Declare @CountryID nvarchar(50)
	Declare @CurrentCountryID numeric(18,0)
	Declare @CountryIDPrefix as nvarchar(9)

	set @CountryIDPrefix='Con-Name-'

begin tran
	
	select @CurrentCountryID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentCountryID'
	
	set @CurrentCountryID=isnull(@CurrentCountryID,0)+1
	Select @CountryID=dbo.generateID(@CountryIDPrefix,@CurrentCountryID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	INSERT INTO [dbo].[tblCountryName]
           ([CountryID] 
           ,[CountryName]
           ,[isActive]
           ,[EntryBy]
           )
     VALUES
           (@CountryID 
           ,@CountryName
           ,@IsActive
           ,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentCountryID where PropertyName='CurrentCountryID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end
GO

exec [spInsertCountryName] 'Bangladesh',1,'tahmed1'
exec [spInsertCountryName] 'India',1,'tahmed1'
exec [spInsertCountryName] 'Malaysia',1,'tahmed1'
exec [spInsertCountryName] 'USA',1,'tahmed1'
exec [spInsertCountryName] 'Thailand',1,'tahmed1'


---------------------


create table tblBloodGroup(
BloodGroupID nvarchar(50) NOT NULL,
BloodGroupName nvarchar(50) unique(BloodGroupName),
isActive bit,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);


insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentBloodGrpID',0)

GO


CREATE proc [dbo].[spInsertBloodGroup]
@BloodGroupName nvarchar(200),
@IsActive integer,
@EntryBy nvarchar(50)
as 


begin
	Declare @BloodGroupID nvarchar(50)
	Declare @CurrentBloodGroupID numeric(18,0)
	Declare @BloodGroupIDPrefix as nvarchar(3)

	set @BloodGroupIDPrefix='BG-'

begin tran
	
	select @CurrentBloodGroupID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentBloodGrpID'
	
	set @CurrentBloodGroupID=isnull(@CurrentBloodGroupID,0)+1
	Select @BloodGroupID=dbo.generateID(@BloodGroupIDPrefix,@CurrentBloodGroupID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER


	INSERT INTO [dbo].[tblBloodGroup]
           (BloodGroupID
           ,[BloodGroupName]
           ,[isActive]
           ,[EntryBy]
           )
     VALUES
           (@BloodGroupID
           ,@BloodGroupName
           ,@IsActive
           ,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentBloodGroupID where PropertyName='CurrentBloodGrpID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end
GO

exec spInsertBloodGroup '',1,'tahmed1'
exec spInsertBloodGroup 'A+',1,'tahmed1'
exec spInsertBloodGroup 'A-',1,'tahmed1'
exec spInsertBloodGroup 'B+',1,'tahmed1'
exec spInsertBloodGroup 'B-',1,'tahmed1'
exec spInsertBloodGroup 'AB+',1,'tahmed1'
exec spInsertBloodGroup 'AB-',1,'tahmed1'
exec spInsertBloodGroup 'O+',1,'tahmed1'
exec spInsertBloodGroup 'O-',1,'tahmed1'




CREATE TABLE [dbo].[tblOccupation](
	[OccupationID] [nvarchar](50) NOT NULL,
	[OccupationName] [nvarchar](200) NULL,
	[isActive] [bit] NULL,
	[EntryBy] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_tblOccupation] PRIMARY KEY CLUSTERED 
(
	[OccupationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[OccupationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblOccupation] ADD  CONSTRAINT [DF_tblOccupation_EntryDate]  DEFAULT (getdate()) FOR [EntryDate]
GO




insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentOccupationID',0)

GO




CREATE proc [dbo].[spInsertOccupation]
@OccupationName nvarchar(200),
@IsActive integer,
@EntryBy nvarchar(50)
as 


begin
	Declare @OccupationID nvarchar(50)
	Declare @CurrentOccupationID numeric(18,0)
	Declare @OccupationIDPrefix as nvarchar(5)

	set @OccupationIDPrefix='OCCU-'

begin tran
	
	select @CurrentOccupationID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentOccupationID'
	
	set @CurrentOccupationID=isnull(@CurrentOccupationID,0)+1
	Select @OccupationID=dbo.generateID(@OccupationIDPrefix,@CurrentOccupationID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER


	INSERT INTO [dbo].[tblOccupation]
           (OccupationID
           ,[OccupationName]
           ,[isActive]
           ,[EntryBy]
           )
     VALUES
           (@OccupationID
           ,@OccupationName
           ,@IsActive
           ,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentOccupationID where PropertyName='CurrentOccupationID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end
GO


spInsertOccupation  'ACCOUNTANT',1,'tahmed1'
spInsertOccupation  'ATRIST',1,'tahmed1'
spInsertOccupation 'BACHELOR',1,'tahmed1'
spInsertOccupation 'BANKER',1,'tahmed1'
spInsertOccupation 'BARBER',1,'tahmed1'
spInsertOccupation 'BARRISTER AT LAW',1,'tahmed1'
spInsertOccupation 'BLACKSMITH',1,'tahmed1'
spInsertOccupation  '',1,'tahmed1'



CREATE proc [dbo].[spGetOccupationList]
as
SELECT OccupationID,OccupationName  FROM [tblOccupation] where isActive=1 order by OccupationName



CREATE proc [dbo].[spGetAlloccupationList]
as
SELECT OccupationID,OccupationName,
case when isActive='True' then 'Active' else 'InActive' end as  isActive FROM [tblOccupation] where OccupationName<>'' order by OccupationName




CREATE proc [dbo].[spUpdateOccupation]
@OccupationName nvarchar(500),
@IsActive integer,
@OccupationID nvarchar(50)
as 

begin
	
begin tran

	UPDATE [tblOccupation]
	   SET  [OccupationName] = @OccupationName
		  ,[isActive] = @IsActive
	 WHERE [OccupationID]=@OccupationID

	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end




CREATE proc [dbo].[spGetAllExamList]
as
begin
	Select distinct ExamID,ExamName,
	case when bitActive='True' then 'Active' else 'InActive' end as bitActive,ExamOrder from [tblExamName] order by ExamOrder 
end



CREATE proc [dbo].[spGetAllInstitutionList]
as
SELECT [InstitutionID],[InstitutionName],isActive,InstitutionType  FROM [dbo].[tblInstitutionName] order by [InstitutionName]



CREATE proc [dbo].[spGetAllMajorList]
as
begin
	Select distinct MajorTypeID,MajorType,
	case when IsActive='True' then 'Active' else 'InActive' end as IsActive from tblMajorType order by MajorType 
end





CREATE TABLE [dbo].[tblReferenceRelationType](
	[RefRelationID] [nvarchar](50) NOT NULL,
	[RefRelationName] [nvarchar](200) NULL unique(RefRelationName),
	[isActive] [bit] NULL,
	[EntryBy] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_tblReferenceRelationType] PRIMARY KEY CLUSTERED 
(
	[RefRelationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblReferenceRelationType] ADD  CONSTRAINT [DF_tblReferenceRelationType_EntryDate]  DEFAULT (getdate()) FOR [EntryDate]
GO


insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentRefRelationID',0)

GO




CREATE proc [dbo].[spInsertRefRelationType]
@RefRelationName nvarchar(200),
@IsActive integer,
@EntryBy nvarchar(50)
as 


begin
	Declare @RefRelationID nvarchar(50)
	Declare @CurrentRefRelationID numeric(18,0)
	Declare @RefRelationIDPrefix as nvarchar(8)

	set @RefRelationIDPrefix='REF-REL-'

begin tran
	
	select @CurrentRefRelationID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentRefRelationID'
	
	set @CurrentRefRelationID=isnull(@CurrentRefRelationID,0)+1
	Select @RefRelationID=dbo.generateID(@RefRelationIDPrefix,@CurrentRefRelationID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER


	INSERT INTO [dbo].tblReferenceRelationType
           (RefRelationID
           ,RefRelationName
           ,[isActive]
           ,[EntryBy]
           )
     VALUES
           (@RefRelationID
           ,@RefRelationName
           ,@IsActive
           ,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentRefRelationID where PropertyName='CurrentRefRelationID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end
GO


CREATE proc [dbo].[spGetAllRefRelationList]
as
begin
	Select distinct RefRelationID,RefRelationName,
	case when isActive='True' then 'Active' else 'InActive' end as isActive from tblReferenceRelationType order by RefRelationName 
end


CREATE proc [dbo].[spGetRefRelationList]
as
begin
	Select distinct RefRelationID,RefRelationName from tblReferenceRelationType where isActive=1 order by RefRelationName 
end



CREATE proc [dbo].[spUpdateRefRelationType]
@RefRelationName nvarchar(500),
@IsActive integer,
@RefRelationID nvarchar(50)
as 

begin
	
begin tran
	
	UPDATE tblReferenceRelationType
	   SET RefRelationName = @RefRelationName
		  ,isActive = @IsActive
			WHERE RefRelationID=@RefRelationID
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end



CREATE proc [dbo].[spGetAllInstitutionListForGrid]
as
SELECT [InstitutionID],[InstitutionName],
case when isActive='True' then 'Active' else 'Inactive' end as isActive,InstitutionType  FROM [dbo].[tblInstitutionName] order by [InstitutionName]





CREATE TABLE [dbo].[tblSpecilizedSector](
	[SpecilizedID] [nvarchar](50) NOT NULL,
	[SpecilizedName] [nvarchar](200) NULL unique(SpecilizedName),
	[isActive] [bit] NULL,
	[EntryBy] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_tblSpecilizedSector] PRIMARY KEY CLUSTERED 
(
	[SpecilizedID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblSpecilizedSector] ADD  CONSTRAINT [DF_tblSpecilizedSector_EntryDate]  DEFAULT (getdate()) FOR [EntryDate]
GO



insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentSpecilizedID',0)

GO




CREATE proc [dbo].[spInsertSpecilizedIn]
@SpecilizedName nvarchar(200),
@IsActive integer,
@EntryBy nvarchar(50)
as 


begin
	Declare @SpecilizedID nvarchar(50)
	Declare @CurrentSpecilizedID numeric(18,0)
	Declare @SpecilizedIDPrefix as nvarchar(4)

	set @SpecilizedIDPrefix='SPEC'

begin tran
	
	select @CurrentSpecilizedID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentSpecilizedID'
	
	set @CurrentSpecilizedID=isnull(@CurrentSpecilizedID,0)+1
	Select @SpecilizedID=dbo.generateID(@SpecilizedIDPrefix,@CurrentSpecilizedID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	INSERT INTO [dbo].tblSpecilizedSector
           (SpecilizedID 
           ,SpecilizedName
           ,[isActive]
           ,[EntryBy]
           )
     VALUES
           (@SpecilizedID
           ,@SpecilizedName
           ,@IsActive
           ,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentSpecilizedID where PropertyName='CurrentSpecilizedID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end


create proc spGetSpecilizedIn
as
begin
	select SpecilizedID,SpecilizedName from dbo.tblSpecilizedSector
	where isActive=1 order by SpecilizedName
end


create proc spGetAllSpecilizedList
as

begin
	SELECT [SpecilizedID]
      ,[SpecilizedName]
      ,case when [isActive]='True' then 'Active' else 'InActive' end as isActive
	from  [tblSpecilizedSector]
end

CREATE proc [dbo].[spUpdateSpecilizedIn]
@SpecilizedName nvarchar(500),
@IsActive integer,
@SpecilizedID nvarchar(50)
as 

begin
	
begin tran
	
	UPDATE tblSpecilizedSector
	   SET SpecilizedName = @SpecilizedName
		  ,isActive = @IsActive
			WHERE SpecilizedID=@SpecilizedID
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end
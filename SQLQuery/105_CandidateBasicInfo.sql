CREATE TABLE [dbo].[tblCandidateBasicInfo](
	[CandidateID] [nvarchar](50) NOT NULL,
	[RegistrationID] [nvarchar](50) NULL,
	[UserID] [nvarchar](50) NULL,
	[CandidateName] [nvarchar](100) NULL,
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
	[PassportNo] [nvarchar](100) NULL,
	[Nationality] [nvarchar](50) NULL,
	[Religion] [nvarchar](50) NULL,
	[PresentAddress] [nvarchar](500) NOT NULL,
	[PreDistrict] [nvarchar](50) NULL,
	[PreThana] [nvarchar](50) NULL,
	[PermanentAddress] [nvarchar](500) NULL,
	[PerDistrict] [nvarchar](50) NULL,
	[PerThana] [nvarchar](50) NULL,
	[HomePhoneNo] [nvarchar](50) NULL,
	[PersonalPhoneNo] [nvarchar](50) NULL,
	[OfficePhoneNo] [nvarchar](50) NULL,
	[AlternateEmail] [nvarchar](50) NULL,
	[CareerObjective] [nvarchar](500) NULL,
	[AboutYourself] [nvarchar](500) NULL,
	[SpecilizedIn] [nvarchar](500) NULL,
	[YearOfExperience] [int] NULL,
	[ExpInMonth] [int] NULL,
	[PresentSalary] [decimal](18, 2) NULL,
	[LastDrawnDate] [datetime] NULL,
	[Employeer] [nvarchar](200) NULL,
	[ExpectedSalary] [decimal](18, 2) NULL,
	[LookingFor] [nvarchar](50) NULL,
	[AvailableFor] [nvarchar](50) NULL,
	[PreferredJobLocation] [nvarchar](50) NULL,
	[ComputerLiteracy] [nvarchar](50) NULL,
	[EnglishLanguageProficiency] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[Status] [bit] NULL,
	[IsAccepted] [bit] NULL,
	[IsSubmitted] [bit] NULL,
	[BloodGroupID] [nvarchar](50) NULL,
	[IsScreened] [bit] NULL,
	[ScreenedDate] [datetime] NULL,
	[ScreenedStatus] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblCandidateBasicInfo] PRIMARY KEY CLUSTERED 
(
	[CandidateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblCandidateBasicInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblCandidateBasicInfo_tblBloodGroup] FOREIGN KEY([BloodGroupID])
REFERENCES [dbo].[tblBloodGroup] ([BloodGroupID])
GO

ALTER TABLE [dbo].[tblCandidateBasicInfo] CHECK CONSTRAINT [FK_tblCandidateBasicInfo_tblBloodGroup]
GO

ALTER TABLE [dbo].[tblCandidateBasicInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblCandidateBasicInfo_tblCandidateBasicInfo] FOREIGN KEY([CandidateID])
REFERENCES [dbo].[tblCandidateBasicInfo] ([CandidateID])
GO

ALTER TABLE [dbo].[tblCandidateBasicInfo] CHECK CONSTRAINT [FK_tblCandidateBasicInfo_tblCandidateBasicInfo]
GO

ALTER TABLE [dbo].[tblCandidateBasicInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblCandidateBasicInfo_tblCandidateBasicInfo1] FOREIGN KEY([CandidateID])
REFERENCES [dbo].[tblCandidateBasicInfo] ([CandidateID])
GO

ALTER TABLE [dbo].[tblCandidateBasicInfo] CHECK CONSTRAINT [FK_tblCandidateBasicInfo_tblCandidateBasicInfo1]
GO

ALTER TABLE [dbo].[tblCandidateBasicInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblCandidateBasicInfo_tblCandidateBasicInfo2] FOREIGN KEY([CandidateID])
REFERENCES [dbo].[tblCandidateBasicInfo] ([CandidateID])
GO

ALTER TABLE [dbo].[tblCandidateBasicInfo] CHECK CONSTRAINT [FK_tblCandidateBasicInfo_tblCandidateBasicInfo2]
GO

ALTER TABLE [dbo].[tblCandidateBasicInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblCandidateBasicInfo_tblCandidateBasicInfo3] FOREIGN KEY([CandidateID])
REFERENCES [dbo].[tblCandidateBasicInfo] ([CandidateID])
GO

ALTER TABLE [dbo].[tblCandidateBasicInfo] CHECK CONSTRAINT [FK_tblCandidateBasicInfo_tblCandidateBasicInfo3]
GO

ALTER TABLE [dbo].[tblCandidateBasicInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblCandidateBasicInfo_tblRegisterUser] FOREIGN KEY([RegistrationID])
REFERENCES [dbo].[tblRegisterUser] ([RegistrationID])
GO

ALTER TABLE [dbo].[tblCandidateBasicInfo] CHECK CONSTRAINT [FK_tblCandidateBasicInfo_tblRegisterUser]
GO

ALTER TABLE [dbo].[tblCandidateBasicInfo] ADD  CONSTRAINT [DF_tblCandidateBasicInfo_IsSubmitted]  DEFAULT ((0)) FOR [IsSubmitted]
GO

ALTER TABLE [dbo].[tblCandidateBasicInfo] ADD  CONSTRAINT [DF_tblCandidateBasicInfo_IsScreened]  DEFAULT ((0)) FOR [IsScreened]
GO

ALTER TABLE [dbo].[tblCandidateBasicInfo] ADD  CONSTRAINT [DF_tblCandidateBasicInfo_ScreenedDate]  DEFAULT (getdate()) FOR [ScreenedDate]
GO


-----------------------------


CREATE TABLE [dbo].[tblPhotos](
	[CandidateID] [nvarchar](50) NOT NULL,
	[photos] [nvarchar](500) NULL,
	[bitActive] [bit] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblPhotos]  WITH CHECK ADD  CONSTRAINT [FK_tblPhotos_tblCandidateBasicInfo] FOREIGN KEY([CandidateID])
REFERENCES [dbo].[tblCandidateBasicInfo] ([CandidateID])
GO

ALTER TABLE [dbo].[tblPhotos] CHECK CONSTRAINT [FK_tblPhotos_tblCandidateBasicInfo]
GO

--------------------------------------



CREATE TABLE [dbo].[tblSignature](
	[CandidateID] [nvarchar](50) NOT NULL,
	[Signature] [nvarchar](500) NULL,
	[bitActive] [bit] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblSignature]  WITH CHECK ADD  CONSTRAINT [FK_tblSignature_tblCandidateBasicInfo] FOREIGN KEY([CandidateID])
REFERENCES [dbo].[tblCandidateBasicInfo] ([CandidateID])
GO

ALTER TABLE [dbo].[tblSignature] CHECK CONSTRAINT [FK_tblSignature_tblCandidateBasicInfo]
GO

-------------------------------------



CREATE TABLE [dbo].[tblUserDocuments](
	[DocumentID] [nvarchar](50) NULL,
	[DocTypeID] [nvarchar](50) NULL,
	[UniqueUserID] [nvarchar](50) NULL,
	[DocumentName] [nvarchar](200) NULL,
	[FileName] [nvarchar](200) NULL,
	[UploadedBy] [nvarchar](50) NULL,
	[UploadedDate] [datetime] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblUserDocuments]  WITH CHECK ADD FOREIGN KEY([DocTypeID])
REFERENCES [dbo].[tblDocumentType] ([DocTypeID])
GO

ALTER TABLE [dbo].[tblUserDocuments] ADD  DEFAULT (getdate()) FOR [UploadedDate]
GO




insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentDocumentID',0)

GO




CREATE proc [dbo].[spInsertUserDocuments]
@Documents nvarchar(4000),
@UniqueUserID nvarchar(50),
@UploadedBy nvarchar(50)
as
begin
	Declare @CurrentDocumentsID as bigint
	Declare @DocumentID as nvarchar(50)
	Declare @DocumentsPrefix as nvarchar(4)
	Declare @CurrentDocuments as nvarchar(200)	
	Declare @RestDocuments as nvarchar(4000)
	Declare @Title as nvarchar(50)
	Declare @FileName as nvarchar(50)

	Declare @Index as int
	Declare @RestPortion as nvarchar(4000)
	
	declare @Todate datetime	
	set @Todate=getdate()
	
	Declare @DocTypeID as nvarchar(50)

begin tran

	Select @CurrentDocumentsID=PropertyValue from tblAppSettings where PropertyName='CurrentDocumentID'
	set @CurrentDocumentsID=isnull(@CurrentDocumentsID,0)+1
	set @DocumentsPrefix='DOC-'
	Select @DocumentID = dbo.generateID(@DocumentsPrefix,@CurrentDocumentsID,8)		

	set @RestDocuments=@Documents
	while @RestDocuments<>''
	begin
		set @Index=CHARINDEX('|',@RestDocuments)
		set @CurrentDocuments=substring(@RestDocuments,1,@Index-1)
		set @RestDocuments=substring(@RestDocuments,@Index+1,len(@RestDocuments))		

		set @RestPortion=@CurrentDocuments

		set @Index=CHARINDEX('~',@RestPortion)		
		set @Title=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))		

		set @Index=CHARINDEX('~',@RestPortion)		
		set @FileName=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	

		set @Index=CHARINDEX('~',@RestPortion)		
		set @DocTypeID=substring(@RestPortion,1,@Index-1)
		
		set @CurrentDocumentsID=@CurrentDocumentsID+1
		Select @DocumentID=dbo.generateID(@DocumentsPrefix,@CurrentDocumentsID,8)

		INSERT INTO tblUserDocuments(DocumentID,DocTypeID,UniqueUserID, DocumentName,[FileName],UploadedBy,UploadedDate)
		VALUES(@DocumentID,@DocTypeID,@UniqueUserID,@Title,@FileName,@UploadedBy,@Todate)	
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
		
		set @CurrentDocumentsID=@CurrentDocumentsID + 1
		Select @DocumentID = dbo.generateID(@DocumentsPrefix,@CurrentDocumentsID,8)	
		
	end

	update tblAppSettings set PropertyValue=@CurrentDocumentsID where PropertyName='CurrentDocumentID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
commit tran
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

--------------------------------------------------------------

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentCandidateID',0)

GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentCanSpecilizedID',0)

GO




CREATE proc [dbo].[spInsertCandidateBasicInfo]
@RegistrationID nvarchar(50),
@UserID nvarchar(50),
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
@PassportNo nvarchar(100),
@Nationality nvarchar(100),
@Religion nvarchar(50),
@PresentAddress nvarchar(500),
@PreDistrict nvarchar(50),
@PreThana nvarchar(50),
@PermanentAddress nvarchar(500),
@PerDistrict nvarchar(50), 
@PerThana nvarchar(50),
@ComputerLiteracy nvarchar(50),
@HomePhoneNo nvarchar(50),
@MobileNumber nvarchar(50),
@OfficePhoneNo nvarchar(50),
@AltEMail nvarchar(50),
@CareerObjective nvarchar(500),
@PreferredJobLocation nvarchar(50),
@LookingFor nvarchar(50),
@AvailableFor nvarchar(50),
@EnglishProficiency nvarchar(50),
@YearOfExperience int,
@ExpInMonth int,
@PresentSalary decimal(18,2),
@LastDrawnDate datetime,
@Employeer nvarchar(200),
@ExpectedSalary decimal(18,2),
@AttachmentFileName nvarchar(500),
@DocFileNameSign nvarchar(500),
@RelationshipStatus nvarchar(50),
@BloodGroupID nvarchar(50),
@AboutYourself nvarchar(500),
@SpecilizedIn nvarchar(500),
@DocumentInformation nvarchar(4000),
@SpecilizedInformation nvarchar(4000)
as
begin
	Declare @CandidateID nvarchar(50)
	Declare @CandidateName nvarchar(50)
	Declare @total int
	Declare @CurrentCandidateID numeric(18,0)
	Declare @RegistrationIDPrefix as nvarchar(4)
	
	
	set @RegistrationIDPrefix='Can-'
	

begin tran

	select @total=COUNT (1) from [tblCandidateBasicInfo] where UserID=@UserID
	select @CandidateName=UserName from dbo.tblRegisterUser where UserID=@UserID
	
	if @total=0
	begin    
		select @CurrentCandidateID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentCandidateID'
		set @CurrentCandidateID=isnull(@CurrentCandidateID,0)+1
		Select @CandidateID=dbo.generateID(@RegistrationIDPrefix,@CurrentCandidateID,8)		
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
		
		INSERT INTO [dbo].[tblCandidateBasicInfo]
           (RegistrationID
           ,[CandidateID]
           ,[UserID]
           ,[CandidateName]
           ,[FathersName]
           ,[FathersOccupation]
           ,[MothersName]
           ,[MothersOccupation]
           ,[SpouseName]
           ,[SpouseOccupation]
           ,[NoOfChildrenAge]
           ,[SibblingsNameOccupation]
           ,RelationshipStatus
           ,[Gender]
           ,[NIDNo]
           ,PassportNo 
           ,[Nationality]
           ,[Religion]
           ,[PresentAddress]
           ,[PreDistrict]
           ,[PreThana]
           ,[PermanentAddress]
           ,[PerDistrict]
           ,[PerThana]
           ,[HomePhoneNo]
           ,[PersonalPhoneNo]
           ,[OfficePhoneNo]
           ,[AlternateEmail]
           ,[CareerObjective]
           ,AboutYourself
           ,SpecilizedIn
           ,[YearOfExperience]
           ,ExpInMonth 
           ,[PresentSalary]
           ,[LastDrawnDate]
           ,[Employeer]
           ,[ExpectedSalary]
           ,[LookingFor]
           ,[AvailableFor]
           ,[PreferredJobLocation]
           ,[ComputerLiteracy]
           ,[EnglishLanguageProficiency]
           ,[IsActive]
           ,BloodGroupID)

     VALUES
           (@RegistrationID ,@CandidateID,@UserID ,@CandidateName,@FatherName,@FathersOccupation ,@MotherName,@MothersOccupation ,@SpouseName,
           @SpouseOccupation ,@NoOfChildrenAge ,@SibblingsNameOccupation,@RelationshipStatus  ,@Gender
           ,@NIDNo,@PassportNo ,@Nationality,@Religion,@PresentAddress,@PreDistrict ,@PreThana ,@PermanentAddress
           ,@PerDistrict ,@PerThana 
           ,@HomePhoneNo,@MobileNumber,@OfficePhoneNo,@AltEMail,@CareerObjective,@AboutYourself ,@SpecilizedIn ,@YearOfExperience,@ExpInMonth 
           ,@PresentSalary,@LastDrawnDate ,@Employeer ,@ExpectedSalary,@LookingFor,@AvailableFor,@PreferredJobLocation ,@ComputerLiteracy,@EnglishProficiency
           ,1,@BloodGroupID )
      
      
        if @AttachmentFileName<>''
		begin     
			 INSERT INTO [dbo].[tblPhotos]
				   ([CandidateID]
				   ,[photos]
				   ,[bitActive])
			 VALUES
				   (@CandidateID
				   ,@AttachmentFileName
				   ,1)
        end
        
        if @DocFileNameSign<>''
		begin
			INSERT INTO [dbo].[tblSignature]
				   ([CandidateID]
				   ,[Signature]
				   ,[bitActive])
			 VALUES
				   (@CandidateID
				   ,@DocFileNameSign
				   ,1)
		end
		
		if @DocumentInformation <>''
		begin
			exec spInsertUserDocuments @DocumentInformation,@RegistrationID,@UserID
		end
		
		
		if @SpecilizedInformation <>''
			begin
				exec spInsertCanSpecilizedInfo @SpecilizedInformation, @CandidateID
			end
		
		update tblAppSettings set PropertyValue=@CurrentCandidateID where PropertyName='CurrentCandidateID'
		IF (@@ERROR <> 0) GOTO ERR_HANDLER

	end
	
	else
		begin
		
		select @CandidateID=CandidateID from [tblCandidateBasicInfo] where UserID=@UserID
		
				UPDATE [dbo].[tblCandidateBasicInfo]
					 SET UserID = @UserID
					  ,[CandidateName] = @CandidateName
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
					  ,PassportNo =@PassportNo 
					  ,[Nationality] = @Nationality
					  ,[Religion] = @Religion
					  ,[PresentAddress] = @PresentAddress
					  ,PreDistrict=@PreDistrict 
					  ,PreThana=@PreThana 
					  ,[PermanentAddress] = @PermanentAddress
					  ,PerDistrict=@PerDistrict 
					  ,PerThana=@PerThana 
					  ,[HomePhoneNo] = @HomePhoneNo
					  ,[PersonalPhoneNo] = @MobileNumber
					  ,[OfficePhoneNo] = @OfficePhoneNo
					  ,[AlternateEmail] = @AltEMail
					  ,[CareerObjective] = @CareerObjective
					  ,AboutYourself =@AboutYourself 
					  ,SpecilizedIn =@SpecilizedIn 
					  ,[YearOfExperience] = @YearOfExperience
					  ,ExpInMonth =@ExpInMonth 
					  ,[PresentSalary] = @PresentSalary
					  ,LastDrawnDate =@LastDrawnDate
					  ,Employeer =@Employeer 
					  ,[ExpectedSalary] = @ExpectedSalary
					  ,[LookingFor] = @LookingFor
					  ,[AvailableFor] = @AvailableFor
					  ,PreferredJobLocation =@PreferredJobLocation 
					  ,[ComputerLiteracy] = @ComputerLiteracy
					  ,[EnglishLanguageProficiency] = @EnglishProficiency
					  ,[IsActive] = 1
					  ,BloodGroupID=@BloodGroupID 
					  
				 WHERE [CandidateID]=@CandidateID
				 
				 
				 if @AttachmentFileName<>''
				 begin
					delete from dbo.tblPhotos where CandidateID=@CandidateID 
					
					INSERT INTO [dbo].[tblPhotos]
						   ([CandidateID]
						   ,[photos]
						   ,[bitActive])
					 VALUES
						   (@CandidateID
						   ,@AttachmentFileName
						   ,1)
				 end
				 
				 
				if @DocFileNameSign<>''
					 begin
						delete from dbo.tblSignature where CandidateID=@CandidateID 
						
						INSERT INTO [dbo].[tblSignature]
							   ([CandidateID]
							   ,[Signature]
							   ,[bitActive])
						 VALUES
							   (@CandidateID
							   ,@DocFileNameSign
							   ,1)
					 end
					 
			   if @DocumentInformation <>''
					begin
					
						delete from dbo.tblUserDocuments where UniqueUserID=@RegistrationID 
					
						exec spInsertUserDocuments @DocumentInformation,@RegistrationID,@UserID
					end
				
			if @SpecilizedInformation <>''
			begin
				delete from dbo.[tblCandidateSpecilization] where CandidateID=@CandidateID
				IF (@@ERROR <> 0) GOTO ERR_HANDLER
				
				exec dbo.spInsertCanSpecilizedInfo @SpecilizedInformation, @CandidateID
				IF (@@ERROR <> 0) GOTO ERR_HANDLER
			end	
				 
		end
	
	Select @CandidateID
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end




GO




--------------------------------------


CREATE procedure [dbo].[prGetCandidateBasicInfo]
@UserID nvarchar(50)
as
begin

--exec prGetCandidateBasicInfo 'test1'

  SELECT dbo.tblRegisterUser.UserName
      ,[FathersName]
      ,[MothersName]
      ,[SpouseName]
      ,[Gender]
      ,[NIDNo]
      ,PassportNo 
      ,[Nationality]
      ,[Religion]
      ,[PresentAddress]
      ,PreDistrict
      ,PreThana
      ,[PermanentAddress]
      ,PerDistrict
      ,PerThana
      ,[HomePhoneNo]
      ,[PersonalPhoneNo]
      ,[OfficePhoneNo]
      ,[AlternateEmail]
      ,[CareerObjective]
      ,[YearOfExperience]
      ,ExpInMonth 
      ,[PresentSalary]
      ,[ExpectedSalary]
      ,[LookingFor]
      ,[AvailableFor]
      ,[ComputerLiteracy]
      ,[EnglishLanguageProficiency]
      ,[tblCandidateBasicInfo].[IsActive]
      ,isnull(tblPhotos.photos,'') photos
      ,FathersOccupation
      ,MothersOccupation
      ,SpouseOccupation
      ,[NoOfChildrenAge] NoOfChildrenAge
      ,[SibblingsNameOccupation] SibblingsNameOccupation
      ,CONVERT(varchar, LastDrawnDate,106) LastDrawnDate
      ,Employeer
      ,PreferredJobLocation
      ,isnull(tblSignature.[Signature],'') [Signature]
      ,RelationshipStatus
      ,BloodGroupID
  FROM [dbo].[tblCandidateBasicInfo] inner join dbo.tblRegisterUser on 
  dbo.tblRegisterUser.UserID=[tblCandidateBasicInfo].[UserID]
  left join dbo.tblPhotos on dbo.tblPhotos.CandidateID=[tblCandidateBasicInfo].CandidateID
  left join dbo.tblSignature on dbo.tblSignature.CandidateID=[tblCandidateBasicInfo].CandidateID
  where [tblCandidateBasicInfo].UserID=@UserID


end

GO


--CREATE proc spCandidateExperirnce
--@CandidateID nvarchar(50)
--as
--declare @YearOfExperience as numeric(18,2)
--begin
--	Select @YearOfExperience= YearOfExperience from tblCandidateBasicInfo where CandidateID=@CandidateID
	
--	select @YearOfExperience as YearOfExperience
-- end

CREATE proc [dbo].[spCandidateExperirnce]
@CandidateID nvarchar(50)
as
declare @YearOfExperience int
declare @ExpInMonth int
begin
	Select @YearOfExperience= YearOfExperience from tblCandidateBasicInfo where CandidateID=@CandidateID
	select @ExpInMonth=ExpInMonth from tblCandidateBasicInfo where CandidateID=@CandidateID
	
	select @YearOfExperience+''+@ExpInMonth as YearOfExperience
	end
 --exec spCandidateExperirnce 'Can-00000002'
 
 GO
 
 

CREATE TABLE [dbo].[tblCandidateSpecilization](
	[CandidateSpecilizedID] [nvarchar](50) NOT NULL,
	[CandidateID] [nvarchar](50) NULL,
	[SpecilizedID] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCandidateSpecilization] PRIMARY KEY CLUSTERED 
(
	[CandidateSpecilizedID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblCandidateSpecilization]  WITH CHECK ADD  CONSTRAINT [FK_tblCandidateSpecilization_tblCandidateBasicInfo] FOREIGN KEY([CandidateID])
REFERENCES [dbo].[tblCandidateBasicInfo] ([CandidateID])
GO

ALTER TABLE [dbo].[tblCandidateSpecilization] CHECK CONSTRAINT [FK_tblCandidateSpecilization_tblCandidateBasicInfo]
GO

ALTER TABLE [dbo].[tblCandidateSpecilization]  WITH CHECK ADD  CONSTRAINT [FK_tblCandidateSpecilization_tblSpecilizedSector] FOREIGN KEY([SpecilizedID])
REFERENCES [dbo].[tblSpecilizedSector] ([SpecilizedID])
GO

ALTER TABLE [dbo].[tblCandidateSpecilization] CHECK CONSTRAINT [FK_tblCandidateSpecilization_tblSpecilizedSector]
GO




create procedure [dbo].[spInsertCanSpecilizedInfo]
@SpecilizedInformation nvarchar(4000),
@CandidateID nvarchar(50)
as
begin
	Declare @RestISOParts as nvarchar(4000)
	Declare @CurrentISOParts as nvarchar(4000)
	Declare @Index as int
	Declare @RestPortion as nvarchar(1000)
	
	Declare @CanSpecilizedID as nvarchar(50)
	Declare @CurrentCanSpecilizedID as numeric(18,0)
	Declare @CanSpecilizedIDPrefix as nvarchar(9)
	
	Declare @SpecilizedID as nvarchar(50)
	
	set @CanSpecilizedIDPrefix='CAN-SPEC-'

begin tran
		set @RestISOParts=@SpecilizedInformation
		
		select @CurrentCanSpecilizedID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentCanSpecilizedID'
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
		while @RestISOParts<>''
			begin
	
				set @CurrentCanSpecilizedID=isnull(@CurrentCanSpecilizedID,0)+1
				Select @CanSpecilizedID=dbo.generateID(@CanSpecilizedIDPrefix,@CurrentCanSpecilizedID,8)		
				IF (@@ERROR <> 0) GOTO ERR_HANDLER

				set @Index=CHARINDEX('|',@RestISOParts)
				set @CurrentISOParts=substring(@RestISOParts,1,@Index-1)
				set @RestISOParts=substring(@RestISOParts,@Index+1,len(@RestISOParts))	

				set @RestPortion=@CurrentISOParts

				set @Index=CHARINDEX('~',@RestPortion)		
				set @SpecilizedID =substring(@RestPortion,1,@Index-1)
				set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))		
								
				INSERT INTO [dbo].[tblCandidateSpecilization]([CandidateSpecilizedID],[CandidateID],[SpecilizedID])
				VALUES(@CanSpecilizedID,@CandidateID,@SpecilizedID)
				   
				Set @SpecilizedID = ''
				
			end
			
			update tblAppSettings set PropertyValue=@CurrentCanSpecilizedID where PropertyName='CurrentCanSpecilizedID'
			IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end




create proc spGetCanSpecilizedInformation
@CandidateID nvarchar(50)
as
begin
	select SpecilizedID from dbo.tblCandidateSpecilization where CandidateID=@CandidateID 
end












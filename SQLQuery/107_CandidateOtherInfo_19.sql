

CREATE TABLE [dbo].[tblCandidateExperienceInfo](
	[CandidateExperienceID] [nvarchar](50) NOT NULL,
	[CandidateID] [nvarchar](50) NOT NULL,
	[CompanyName] [nvarchar](300) NOT NULL,
	[OfficialDesig] [nvarchar](300) NULL,
	[FuncDesig] [nvarchar](300) NULL,
	[Department] [nvarchar](300) NULL,
	[Responsibilities] [nvarchar](1000) NULL,
	[CompanyAddress] [nvarchar](500) NULL,
	[CompanyConNo] [nvarchar](100) NULL,
	[DateFrom] [datetime] NULL,
	[DateTo] [datetime] NULL,
	[TillDate] [bit] NULL,
 CONSTRAINT [PK_tblCandidateExperienceInfo] PRIMARY KEY CLUSTERED 
(
	[CandidateExperienceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblCandidateExperienceInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblCandidateExperienceInfo_tblCandidateExperienceInfo] FOREIGN KEY([CandidateID])
REFERENCES [dbo].[tblCandidateBasicInfo] ([CandidateID])
GO

ALTER TABLE [dbo].[tblCandidateExperienceInfo] CHECK CONSTRAINT [FK_tblCandidateExperienceInfo_tblCandidateExperienceInfo]
GO


-------------------


insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentExperienceID',0)

GO


--------------------



CREATE procedure [dbo].[prExperienceInputAdd]
@UserID as nvarchar(100),
@isoExperienceParts as nvarchar(4000)
as
begin

	Declare @CandidateID  as nvarchar(50)
	Declare @LogID  as nvarchar(50)

	Declare @RestISOPartsExperience as nvarchar(4000)
	Declare @CurrentISOPartsExperience as nvarchar(4000)
	Declare @IndexExperience as int
	Declare @RestPortionExperience as nvarchar(1000)
	declare @CompanyName as varchar(500)
	declare @OfficialDesig as varchar(500)
	declare @FunctionalDesig as varchar(500)
	declare @Department as varchar(300)
	declare @Responsibilities as varchar(500)
	declare @CompanyAddress as varchar(500)
	declare @CompanyConNo as nvarchar(100)
	declare @DateFromExperience as datetime
	declare @DateToExperience as datetime
	declare @TillDate as bit
	
	
	Declare @ExpID as nvarchar(50)
	Declare @CurrentExpID as numeric(18,0)
	Declare @ExpIDPrefix as nvarchar(5)
	
	set @ExpIDPrefix='Can-EXP-'
	
	begin tran
	
	
	select @CandidateID=CandidateID from dbo.tblCandidateBasicInfo where UserID=@UserID
	
	DELETE FROM [dbo].tblCandidateExperienceInfo
    WHERE CandidateID=@CandidateID 
    
		 
	set @RestISOPartsExperience=@isoExperienceParts
	
	if @RestISOPartsExperience<>''
		begin
		
		while @RestISOPartsExperience<>''
			begin
			
			select @CurrentExpID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentExperienceID'
	
				set @CurrentExpID=isnull(@CurrentExpID,0)+1
				Select @ExpID=dbo.generateID(@ExpIDPrefix,@CurrentExpID,8)		
				IF (@@ERROR <> 0) GOTO ERR_HANDLER
				
				
				set @IndexExperience=CHARINDEX('|',@RestISOPartsExperience)
				set @CurrentISOPartsExperience=substring(@RestISOPartsExperience,1,@IndexExperience-1)
				set @RestISOPartsExperience=substring(@RestISOPartsExperience,@IndexExperience+1,len(@RestISOPartsExperience))	


				set @RestPortionExperience=@CurrentISOPartsExperience

				set @IndexExperience=CHARINDEX('~',@RestPortionExperience)		
				set @CompanyName=substring(@RestPortionExperience,1,@IndexExperience-1)
				set @RestPortionExperience=substring(@RestPortionExperience,@IndexExperience+1,len(@RestPortionExperience))		

				set @IndexExperience=CHARINDEX('~',@RestPortionExperience)		
				set @OfficialDesig=substring(@RestPortionExperience,1,@IndexExperience-1)
				set @RestPortionExperience=substring(@RestPortionExperience,@IndexExperience+1,len(@RestPortionExperience))	
				
				set @IndexExperience=CHARINDEX('~',@RestPortionExperience)		
				set @FunctionalDesig=substring(@RestPortionExperience,1,@IndexExperience-1)
				set @RestPortionExperience=substring(@RestPortionExperience,@IndexExperience+1,len(@RestPortionExperience))	

				set @IndexExperience=CHARINDEX('~',@RestPortionExperience)		
				set @Department=substring(@RestPortionExperience,1,@IndexExperience-1)
				set @RestPortionExperience=substring(@RestPortionExperience,@IndexExperience+1,len(@RestPortionExperience))	
				
				set @IndexExperience=CHARINDEX('~',@RestPortionExperience)		
				set @Responsibilities=substring(@RestPortionExperience,1,@IndexExperience-1)
				set @RestPortionExperience=substring(@RestPortionExperience,@IndexExperience+1,len(@RestPortionExperience))	
				
				set @IndexExperience=CHARINDEX('~',@RestPortionExperience)		
				set @CompanyAddress=substring(@RestPortionExperience,1,@IndexExperience-1)
				set @RestPortionExperience=substring(@RestPortionExperience,@IndexExperience+1,len(@RestPortionExperience))	
				
				set @IndexExperience=CHARINDEX('~',@RestPortionExperience)		
				set @CompanyConNo=substring(@RestPortionExperience,1,@IndexExperience-1)
				set @RestPortionExperience=substring(@RestPortionExperience,@IndexExperience+1,len(@RestPortionExperience))	
				
				set @IndexExperience=CHARINDEX('~',@RestPortionExperience)		
				set @DateFromExperience=substring(@RestPortionExperience,1,@IndexExperience-1)
				set @RestPortionExperience=substring(@RestPortionExperience,@IndexExperience+1,len(@RestPortionExperience))	

				set @IndexExperience=CHARINDEX('~',@RestPortionExperience)		
				set @DateToExperience=substring(@RestPortionExperience,1,@IndexExperience-1)
				set @RestPortionExperience=substring(@RestPortionExperience,@IndexExperience+1,len(@RestPortionExperience))
				
				set @IndexExperience=CHARINDEX('~',@RestPortionExperience)		
				set @TillDate =substring(@RestPortionExperience,1,@IndexExperience-1)
				set @RestPortionExperience=substring(@RestPortionExperience,@IndexExperience+1,len(@RestPortionExperience))
				
			INSERT INTO [dbo].tblCandidateExperienceInfo
				   (CandidateExperienceID 
				   ,[CandidateID]
				   ,CompanyName
				   ,OfficialDesig
				   ,FuncDesig  
				   ,Department
				   ,Responsibilities
				   ,CompanyAddress 
				   ,CompanyConNo 
				   ,DateFrom
				   ,DateTo
				   ,TillDate )
			 VALUES
				   (@ExpID 
				   ,@CandidateID
				   ,@CompanyName
				   ,@OfficialDesig 
				   ,@FunctionalDesig 
				   ,@Department
				   ,@Responsibilities
				   ,@CompanyAddress 
				   ,@CompanyConNo 
				   ,@DateFromExperience
				   ,@DateToExperience
				   ,@TillDate)
				   
				   update tblAppSettings set PropertyValue=@CurrentExpID where PropertyName='CurrentExperienceID'
					IF (@@ERROR <> 0) GOTO ERR_HANDLER


			end
		end 	
		COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end



GO



------------------------


--CREATE proc [dbo].[spGetExperienceInformation]
--@CandidateID varchar(50)
--as
--begin
--SELECT [CandidateExperienceID]
  --    ,[CandidateID]
    --  ,[CompanyName]
      --,[OfficialDesig] 
   --   ,FuncDesig 
   --   ,Department
   --   ,[Responsibilities]
   --   ,convert(varchar,[DateFrom],106) DateFrom
   --   ,(case when [DateTo]='01-01-1911' then '' else convert(varchar,[DateTo],106) end)as [DateTo]
   --   ,case when TillDate =1 then 'Till Date' else '' end as TillDate
      --,convert(varchar,[DateTo],106) DateTo
--  FROM [dbo].[tblCandidateExperienceInfo] where CandidateID=@CandidateID

-- end


CREATE proc [dbo].[spGetExperienceInformation]
@CandidateID varchar(50)
as
begin
SELECT [CandidateExperienceID]
      ,[CandidateID]
      ,[CompanyName]
      ,[OfficialDesig] 
      ,FuncDesig 
      ,Department
      ,[Responsibilities]
      ,CompanyAddress 
      ,CompanyConNo 
      ,convert(varchar,[DateFrom],106) DateFrom
      ,(case when [DateTo]='01-01-1911' then '' else convert(varchar,[DateTo],106) end)as [DateTo]
      ,case when TillDate =1 then 'Till Now' else '' end as TillDate
      --,convert(varchar,[DateTo],106) DateTo
  FROM [dbo].[tblCandidateExperienceInfo] where CandidateID=@CandidateID

end

GO





-----------------------------

--drop table [tblCandidateTrainingInfo]
CREATE TABLE [dbo].[tblCandidateTrainingInfo](
	[CandidateTrainingID] [nvarchar](50) NOT NULL,
	[CandidateID] [nvarchar](50) NULL,
	[TrainingName] [nvarchar](300) NULL,
	[InstituteName] [nvarchar](300) NULL,
	[Country] [nvarchar](50) NULL,
	[TrainingYear] [int] NULL,
	[TotalTrainingDay] [int] NULL,
	[DateFrom] [datetime] NULL,
	[DateTo] [datetime] NULL,
 CONSTRAINT [PK_tblCandidateTrainingInfo] PRIMARY KEY CLUSTERED 
(
	[CandidateTrainingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblCandidateTrainingInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblCandidateTrainingInfo_tblCandidateBasicInfo] FOREIGN KEY([CandidateID])
REFERENCES [dbo].[tblCandidateBasicInfo] ([CandidateID])
GO

ALTER TABLE [dbo].[tblCandidateTrainingInfo] CHECK CONSTRAINT [FK_tblCandidateTrainingInfo_tblCandidateBasicInfo]
GO




------------------------------

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentTrainingID',0)

GO

----------------------------------

CREATE procedure [dbo].[prTrainingInputAdd]
@UserID as nvarchar(100),
@isoTrainingParts as nvarchar(4000)
as
begin


	Declare @CandidateID  as nvarchar(50)
	Declare @LogID  as nvarchar(50)
	Declare @Coverage as numeric(18,2)


	
	Declare @RestISOPartsTraining as nvarchar(4000)
	Declare @CurrentISOPartsTraining as nvarchar(4000)
	Declare @IndexTraining as int
	Declare @RestPortionTraining as nvarchar(1000)
	declare @TrainingName as varchar(500)
	declare @Country as varchar(500)
	declare @IInstituteName as varchar(500)
	declare @TrainingYear as integer
	declare @TotalTrainingDay as integer
	declare @DateFrom as varchar(50)
	declare @DateTo as varchar(500)
	
	Declare @TrainingID as nvarchar(50)
	Declare @CurrentTrainingID as numeric(18,0)
	Declare @TrainingIDPrefix as nvarchar(5)
	
	
	begin tran
	
	set @TrainingIDPrefix='Can-Training-'

	select @CandidateID=CandidateID from dbo.tblCandidateBasicInfo where UserID=@UserID
		 
	DELETE FROM [dbo].[tblCandidateTrainingInfo]
    WHERE CandidateID=@CandidateID
    
			
	set @RestISOPartsTraining=@isoTrainingParts

	if @RestISOPartsTraining<>''
		begin
		
		while @RestISOPartsTraining<>''
			begin
			
			select @CurrentTrainingID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentTrainingID'
	
				set @CurrentTrainingID=isnull(@CurrentTrainingID,0)+1
				Select @TrainingID=dbo.generateID(@TrainingIDPrefix,@CurrentTrainingID,8)		
				IF (@@ERROR <> 0) GOTO ERR_HANDLER


				set @IndexTraining=CHARINDEX('|',@RestISOPartsTraining)
				set @CurrentISOPartsTraining=substring(@RestISOPartsTraining,1,@IndexTraining-1)
				set @RestISOPartsTraining=substring(@RestISOPartsTraining,@IndexTraining+1,len(@RestISOPartsTraining))	


				set @RestPortionTraining=@CurrentISOPartsTraining

				set @IndexTraining=CHARINDEX('~',@RestPortionTraining)		
				set @TrainingName=substring(@RestPortionTraining,1,@IndexTraining-1)
				set @RestPortionTraining=substring(@RestPortionTraining,@IndexTraining+1,len(@RestPortionTraining))		

				set @IndexTraining=CHARINDEX('~',@RestPortionTraining)		
				set @IInstituteName=substring(@RestPortionTraining,1,@IndexTraining-1)
				set @RestPortionTraining=substring(@RestPortionTraining,@IndexTraining+1,len(@RestPortionTraining))	

				set @IndexTraining=CHARINDEX('~',@RestPortionTraining)		
				set @Country=substring(@RestPortionTraining,1,@IndexTraining-1)
				set @RestPortionTraining=substring(@RestPortionTraining,@IndexTraining+1,len(@RestPortionTraining))	
				
				set @IndexTraining=CHARINDEX('~',@RestPortionTraining)		
				set @TrainingYear=substring(@RestPortionTraining,1,@IndexTraining-1)
				set @RestPortionTraining=substring(@RestPortionTraining,@IndexTraining+1,len(@RestPortionTraining))	
				
				set @IndexTraining=CHARINDEX('~',@RestPortionTraining)		
				set @TotalTrainingDay =substring(@RestPortionTraining,1,@IndexTraining-1)
				set @RestPortionTraining=substring(@RestPortionTraining,@IndexTraining+1,len(@RestPortionTraining))	
				
				set @IndexTraining=CHARINDEX('~',@RestPortionTraining)		
				set @DateFrom=substring(@RestPortionTraining,1,@IndexTraining-1)
				set @RestPortionTraining=substring(@RestPortionTraining,@IndexTraining+1,len(@RestPortionTraining))	

				set @IndexTraining=CHARINDEX('~',@RestPortionTraining)		
				set @DateTo=substring(@RestPortionTraining,1,@IndexTraining-1)
				set @RestPortionTraining=substring(@RestPortionTraining,@IndexTraining+1,len(@RestPortionTraining))
				
				   
	INSERT INTO [dbo].[tblCandidateTrainingInfo]
           (CandidateTrainingID 
           ,[CandidateID]
           ,[TrainingName]
           ,[InstituteName]
           ,[Country]
           ,[TrainingYear]
           ,TotalTrainingDay 
           ,[DateFrom]
           ,[DateTo])
     VALUES
           (@TrainingID 
           ,@CandidateID
           ,@TrainingName
           ,@IInstituteName
           ,@Country
           ,@TrainingYear
           ,@TotalTrainingDay 
           ,@DateFrom
           ,@DateTo)
           
           update tblAppSettings set PropertyValue=@CurrentTrainingID where PropertyName='CurrentTrainingID'
					IF (@@ERROR <> 0) GOTO ERR_HANDLER

		end	
		end 
	
		COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end


GO



 -------------------------------


CREATE proc [dbo].[spGetTrainingInformation]
@CandidateID varchar(50)
as
begin
SELECT [CandidateTrainingID]
      ,[CandidateID]
      ,[TrainingName]
      ,[InstituteName]
      ,[tblCandidateTrainingInfo].Country   CountryID
      ,(select CountryName from dbo.tblCountryName where CountryID=[Country]) Country
      ,[TrainingYear]
      ,TotalTrainingDay 
      ,convert(varchar,[DateFrom],106)[DateFrom]
      ,convert(varchar,[DateTo],106) [DateTo]
  FROM [dbo].[tblCandidateTrainingInfo] where CandidateID=@CandidateID

end


GO





------------------------------



CREATE TABLE [dbo].[tblCandidateReferenceInfo](
	[CandidateReferenceID] [nvarchar](50) NOT NULL,
	[CandidateID] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[Designation] [nvarchar](50) NULL,
	[OrganizationName] [nvarchar](100) NULL,
	[RefRelationWith] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[MobileNo] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCandidateReferenceInfo] PRIMARY KEY CLUSTERED 
(
	[CandidateReferenceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblCandidateReferenceInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblCandidateReferenceInfo_tblCandidateBasicInfo] FOREIGN KEY([CandidateID])
REFERENCES [dbo].[tblCandidateBasicInfo] ([CandidateID])
GO

ALTER TABLE [dbo].[tblCandidateReferenceInfo] CHECK CONSTRAINT [FK_tblCandidateReferenceInfo_tblCandidateBasicInfo]
GO

ALTER TABLE [dbo].[tblCandidateReferenceInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblCandidateReferenceInfo_tblReferenceRelationType] FOREIGN KEY([RefRelationWith])
REFERENCES [dbo].[tblReferenceRelationType] ([RefRelationID])
GO

ALTER TABLE [dbo].[tblCandidateReferenceInfo] CHECK CONSTRAINT [FK_tblCandidateReferenceInfo_tblReferenceRelationType]
GO





----------------------------


insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentReferenceID',0)

GO

---------------------------------


CREATE procedure [dbo].[prCandidateReferenceInputAdd]
@UserID as nvarchar(100),
@isoReference as nvarchar(4000)

as
begin


	Declare @CandidateID  as nvarchar(50)
	Declare @LogID  as nvarchar(50)
	Declare @Coverage as numeric(18,2)


	Declare @RestISOPartsRef as nvarchar(4000)
	Declare @CurrentISOPartsRef as nvarchar(4000)
	Declare @IndexRef as int
	Declare @RestPortionRef as nvarchar(1000)
	declare @Name as varchar(500)
	declare @Designation as varchar(500)
	declare @OrganizationName as varchar(500)
	declare @Address as varchar(500)
	declare @MobileNo as varchar(50)
	declare @PhoneNo as varchar(500)	
	declare @Email as varchar(500)	
	declare @RelationID as varchar(500)	
	
	Declare @ReferenceID as nvarchar(50)
	Declare @CurrentReferenceID as numeric(18,0)
	Declare @ReferenceIDPrefix as nvarchar(5)
	
	begin tran
	
	set @ReferenceIDPrefix='Can-Ref-'
	
	select @CandidateID=CandidateID from dbo.tblCandidateBasicInfo where UserID=@UserID
	
	DELETE FROM [dbo].[tblCandidateReferenceInfo]
    WHERE CandidateID=@CandidateID 	
    
		
	set @RestISOPartsRef=@isoReference

	if @RestISOPartsRef<>''
		begin
		
		while @RestISOPartsRef<>''
			begin
			
				select @CurrentReferenceID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentReferenceID'
	
				set @CurrentReferenceID=isnull(@CurrentReferenceID,0)+1
				Select @ReferenceID=dbo.generateID(@ReferenceIDPrefix,@CurrentReferenceID,8)		
				IF (@@ERROR <> 0) GOTO ERR_HANDLER
				
				
				set @IndexRef=CHARINDEX('|',@RestISOPartsRef)
				set @CurrentISOPartsRef=substring(@RestISOPartsRef,1,@IndexRef-1)
				set @RestISOPartsRef=substring(@RestISOPartsRef,@IndexRef+1,len(@RestISOPartsRef))	


				set @RestPortionRef=@CurrentISOPartsRef

				set @IndexRef=CHARINDEX('~',@RestPortionRef)		
				set @Name=substring(@RestPortionRef,1,@IndexRef-1)
				set @RestPortionRef=substring(@RestPortionRef,@IndexRef+1,len(@RestPortionRef))		

				set @IndexRef=CHARINDEX('~',@RestPortionRef)		
				set @Designation=substring(@RestPortionRef,1,@IndexRef-1)
				set @RestPortionRef=substring(@RestPortionRef,@IndexRef+1,len(@RestPortionRef))	

				set @IndexRef=CHARINDEX('~',@RestPortionRef)		
				set @OrganizationName=substring(@RestPortionRef,1,@IndexRef-1)
				set @RestPortionRef=substring(@RestPortionRef,@IndexRef+1,len(@RestPortionRef))	
				
				set @IndexRef=CHARINDEX('~',@RestPortionRef)		
				set @RelationID =substring(@RestPortionRef,1,@IndexRef-1)
				set @RestPortionRef=substring(@RestPortionRef,@IndexRef+1,len(@RestPortionRef))	
				
				set @IndexRef=CHARINDEX('~',@RestPortionRef)		
				set @Address=substring(@RestPortionRef,1,@IndexRef-1)
				set @RestPortionRef=substring(@RestPortionRef,@IndexRef+1,len(@RestPortionRef))	
				
				set @IndexRef=CHARINDEX('~',@RestPortionRef)		
				set @MobileNo=substring(@RestPortionRef,1,@IndexRef-1)
				set @RestPortionRef=substring(@RestPortionRef,@IndexRef+1,len(@RestPortionRef))	
								
				set @IndexRef=CHARINDEX('~',@RestPortionRef)		
				set @Email=substring(@RestPortionRef,1,@IndexRef-1)
				set @RestPortionRef=substring(@RestPortionRef,@IndexRef+1,len(@RestPortionRef))	
				
				--set @IndexRef=CHARINDEX('~',@RestPortionRef)		
				--set @Relation=substring(@RestPortionRef,1,@IndexRef-1)
				--set @RestPortionRef=substring(@RestPortionRef,@IndexRef+1,len(@RestPortionRef))
				
	
	INSERT INTO [dbo].[tblCandidateReferenceInfo]
           (CandidateReferenceID 
           ,[CandidateID]
           ,[Name]
           ,[Designation]
           ,[OrganizationName]
           ,RefRelationWith
           ,[Address]
           ,[MobileNo]
           ,[Email]
           )
     VALUES
           (@ReferenceID 
           ,@CandidateID
           ,@Name
           ,@Designation
           ,@OrganizationName
           ,@RelationID 
           ,@Address
           ,@MobileNo
           ,@Email
           )
           
            update tblAppSettings set PropertyValue=@CurrentReferenceID where PropertyName='CurrentReferenceID'
			IF (@@ERROR <> 0) GOTO ERR_HANDLER


	end	
		end 
	
		COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO




---------------------------------------


CREATE proc [dbo].[spGetReferenceInformation]
@CandidateID varchar(50)
as
begin
SELECT [CandidateReferenceID]
      ,[CandidateID]
      ,[Name]
      ,[Designation]
      ,[OrganizationName]
      ,RefRelationWith RefRelationID
      ,(select RefRelationName from dbo.tblReferenceRelationType where RefRelationID=RefRelationWith) RefRelationName
      ,[Address]
      ,[MobileNo]
      ,[Email]
  FROM [dbo].[tblCandidateReferenceInfo]
 where CandidateID=@CandidateID

end
GO


----------------------------------


CREATE TABLE [dbo].[tblCandidateProfessionalCertificationInfo](
	[CanProCerID] [nvarchar](50) NOT NULL,
	[CandidateID] [nvarchar](50) NOT NULL,
	[CertificationName] [nvarchar](100) NULL,
	[InstituteName] [nvarchar](100) NULL,
	[Location] [nvarchar](500) NULL,
	[IssuingDate] [datetime] NULL,
	[ExpireDate] [datetime] NULL,
	[NeverExpire] [bit] NULL,
 CONSTRAINT [PK_tblCandidateProfessionalCertificationInfo] PRIMARY KEY CLUSTERED 
(
	[CanProCerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblCandidateProfessionalCertificationInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblCandidateProfessionalCertificationInfo_tblCandidateBasicInfo] FOREIGN KEY([CandidateID])
REFERENCES [dbo].[tblCandidateBasicInfo] ([CandidateID])
GO

ALTER TABLE [dbo].[tblCandidateProfessionalCertificationInfo] CHECK CONSTRAINT [FK_tblCandidateProfessionalCertificationInfo_tblCandidateBasicInfo]
GO




--------------------------------------


insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentProfessionalCerID',0)

GO

---------------------------------



CREATE procedure [dbo].[prCandidateOthersInputAdd]
@UserID as nvarchar(100),
@isoProfessionalCertificationParts as nvarchar(4000)

as
begin


	Declare @CandidateID  as nvarchar(50)
	Declare @LogID  as nvarchar(50)
	Declare @Coverage as numeric(18,2)


	Declare @RestISOParts as nvarchar(4000)
	Declare @CurrentISOParts as nvarchar(4000)
	Declare @Index as int
	Declare @RestPortion as nvarchar(1000)
	declare @CertificationName as varchar(500)
	declare @InstituteName as varchar(500)
	declare @Location as varchar(500)
	declare @DateFrom as datetime
	declare @DateTo as datetime
	declare @NeverExpire as bit
	
	Declare @ProfessionalID as nvarchar(50)
	Declare @CurrentProfessionalID as numeric(18,0)
	Declare @ProfessionalIDPrefix as nvarchar(5)
	
	begin tran
	
	set @ProfessionalIDPrefix='Can-Pro-'
	
	select @CandidateID=CandidateID from dbo.tblCandidateBasicInfo where UserID=@UserID
	
	DELETE FROM [dbo].[tblCandidateProfessionalCertificationInfo]
    WHERE CandidateID=@CandidateID 
    
		 
		set @RestISOParts=@isoProfessionalCertificationParts
		while @RestISOParts<>''
			begin
			
				select @CurrentProfessionalID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentProfessionalCerID'
	
				set @CurrentProfessionalID=isnull(@CurrentProfessionalID,0)+1
				Select @ProfessionalID=dbo.generateID(@ProfessionalIDPrefix,@CurrentProfessionalID,8)		
				IF (@@ERROR <> 0) GOTO ERR_HANDLER
				
				
				set @Index=CHARINDEX('|',@RestISOParts)
				set @CurrentISOParts=substring(@RestISOParts,1,@Index-1)
				set @RestISOParts=substring(@RestISOParts,@Index+1,len(@RestISOParts))	


				set @RestPortion=@CurrentISOParts

				set @Index=CHARINDEX('~',@RestPortion)		
				set @CertificationName=substring(@RestPortion,1,@Index-1)
				set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))		

				set @Index=CHARINDEX('~',@RestPortion)		
				set @InstituteName=substring(@RestPortion,1,@Index-1)
				set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	

				set @Index=CHARINDEX('~',@RestPortion)		
				set @Location=substring(@RestPortion,1,@Index-1)
				set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	
				
				set @Index=CHARINDEX('~',@RestPortion)		
				set @DateFrom=substring(@RestPortion,1,@Index-1)
				set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	
				
				set @Index=CHARINDEX('~',@RestPortion)		
				set @DateTo=substring(@RestPortion,1,@Index-1)
				set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	
				
				
				set @Index=CHARINDEX('~',@RestPortion)		
				set @NeverExpire =substring(@RestPortion,1,@Index-1)
				set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	

				
				
	INSERT INTO [dbo].[tblCandidateProfessionalCertificationInfo]
           (CanProCerID 
           ,[CandidateID]
           ,[CertificationName]
           ,[InstituteName]
           ,[Location]
           ,[IssuingDate]
           ,[ExpireDate]
           ,NeverExpire)
     VALUES
           (@ProfessionalID 
           ,@CandidateID
           ,@CertificationName
           ,@InstituteName
           ,@Location
           ,@DateFrom
           ,@DateTo
           ,@NeverExpire )
           
            update tblAppSettings set PropertyValue=@CurrentProfessionalID where PropertyName='CurrentProfessionalCerID'
					IF (@@ERROR <> 0) GOTO ERR_HANDLER

	end
		COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end



GO



-----------------------------

CREATE proc [dbo].[spGetProCertificationInformation]
@CandidateID varchar(50)
as
begin
SELECT [CanProCerID]
      ,[CandidateID]
      ,[CertificationName]
      ,[InstituteName]
      ,[Location]
      ,convert(varchar,IssuingDate,106)[IssuingDate]
      ,(case when [ExpireDate]='01-01-1911' then '' else convert(varchar,[ExpireDate],106) end)as [ExpireDate]
      ,case when NeverExpire=1 then 'Never Expire' else '' end as NeverExpire
  FROM [dbo].[tblCandidateProfessionalCertificationInfo]
 where CandidateID=@CandidateID

end
GO



--------------------------------------------------


CREATE procedure [dbo].[spMessageShow]
@CandidateID nvarchar(50)
as 
	--exec spMessageShow 'Can-00000010'
	Declare @Message as nvarchar(500)
	Declare @EduCount as integer
	Declare @RefCount as integer

	Declare @PhotoCount as Integer
	Declare @SigCount as Integer

	Declare @EduMessage as nvarchar(500)
	Declare @RefMessage as nvarchar(500)
	Declare @PhotoMessage as nvarchar(500)
	Declare @SigMessage as nvarchar(500)

	Set @EduCount = 0
	Set @RefCount=0
	Set @Message = ''
	Set @RefMessage = ''
	Set @EduMessage = ''
	Set @PhotoMessage = ''
	Set @SigMessage = ''

begin
		Select @EduCount= COUNT(*) from dbo.tblCandidateEducationInfo Where CandidateID=@CandidateID

		if @EduCount = 0 
		begin
			Set @EduMessage= 'Education'
		end

		Select @RefCount= COUNT(*) from dbo.tblCandidateReferenceInfo Where CandidateID=@CandidateID

		if @RefCount = 0 or @RefCount = 1
		begin
			Set @RefMessage='two References'
		end

		if @EduCount=0 or (@RefCount=0 or @RefCount=1)
		begin
		 Set @Message ='Put '+@EduMessage+' '+@RefMessage+' Info'
		end

		Select @PhotoCount=COUNT(*) from dbo.tblPhotos where CandidateID=@CandidateID

		if @PhotoCount = 0 
		begin
			Set @PhotoMessage='Photo'
		end
		
		Print 'A:' +isnull(@Message,'N\A')
		--Select @SigCount=COUNT(*) from dbo.tblSignature where CandidateID=@CandidateID

		--if @SigCount = 0 
		--begin
		--	Set @SigMessage='Signature'
		--end
		
		--if @PhotoCount=0 or @SigCount=0
		--begin
		--	Set @Message =@Message + ' and Upload '+@PhotoMessage+' '+@SigMessage
		--end
		
		if @PhotoCount=0 
		begin
			Set @Message =@Message + ' and Upload '+@PhotoMessage
		end

		Print 'B:' +isnull(@Message,'N\A')

		--Select isnull(@Message,'N\A') as [Message]
		
		select isnull(@Message,'N\A') as 'Message'

end

-- exec spMessageShow 'Can-00000010'


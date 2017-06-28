
CREATE TABLE [dbo].[tblCandidateEducationInfo](
	[CandidateEducationID] [nvarchar](50) NOT NULL,
	[CandidateID] [nvarchar](50) NULL,
	[DegreeType] [nvarchar](100) NULL,
	[ExamID] [nvarchar](50) NULL,
	[Major] [nvarchar](50) NULL,
	[InstitutionID] [nvarchar](200) NULL,
	[OtherInstitutionName] [nvarchar](200) NULL,
	[PassingYear] [int] NULL,
	[ResultType] [nvarchar](50) NULL,
	[Result] [nvarchar](50) NULL,
	[OutOf] [decimal](18, 2) NULL,
 CONSTRAINT [PK_tblCandidateEducationInfo] PRIMARY KEY CLUSTERED 
(
	[CandidateEducationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblCandidateEducationInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblCandidateEducationInfo_tblCandidateBasicInfo] FOREIGN KEY([CandidateID])
REFERENCES [dbo].[tblCandidateBasicInfo] ([CandidateID])
GO

ALTER TABLE [dbo].[tblCandidateEducationInfo] CHECK CONSTRAINT [FK_tblCandidateEducationInfo_tblCandidateBasicInfo]
GO

ALTER TABLE [dbo].[tblCandidateEducationInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblCandidateEducationInfo_tblCandidateEducationInfo] FOREIGN KEY([CandidateEducationID])
REFERENCES [dbo].[tblCandidateEducationInfo] ([CandidateEducationID])
GO

ALTER TABLE [dbo].[tblCandidateEducationInfo] CHECK CONSTRAINT [FK_tblCandidateEducationInfo_tblCandidateEducationInfo]
GO





--------------------------


insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentEducationID',0)

GO


--------------------


CREATE procedure [dbo].[prEducationInputAdd]
@CandidateID as nvarchar(100),
@IsoParts as nvarchar(4000)
as
begin


	--Declare @CandidateID  as nvarchar(50)
	Declare @LogID  as nvarchar(50)

	Declare @RestISOParts as nvarchar(4000)
	Declare @CurrentISOParts as nvarchar(4000)
	Declare @Index as int
	Declare @RestPortion as nvarchar(1000)
	declare @DegreeType as varchar(100)
	declare @ExamName as varchar(500)
	declare @Major as varchar(500)
	declare @InstitutionName as varchar(500)
	declare @OtherInstitutionName as varchar(200)
	declare @PassingYear as integer
	declare @ResultType as varchar(50)
	declare @Result as varchar(500)
	declare @OutOf as numeric(18,2)
	
	DECLARE @count as int
	
	
	Declare @EduID as nvarchar(50)
	Declare @CurrentEduID as numeric(18,0)
	Declare @EduIDPrefix as nvarchar(8)
	
		
	begin tran
	set @EduIDPrefix='Can-Edu-'

	
	--select @CandidateID=CandidateID from dbo.tblCandidateBasicInfo where UserID=@UserID
		
	DELETE FROM [dbo].[tblCandidateEducationInfo]
    WHERE CandidateID=@CandidateID
    
	
		 
		set @RestISOParts=@IsoParts

		while @RestISOParts<>''
			begin
			
				select @CurrentEduID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentEducationID'
	
				set @CurrentEduID=isnull(@CurrentEduID,0)+1
				Select @EduID=dbo.generateID(@EduIDPrefix,@CurrentEduID,8)		
				IF (@@ERROR <> 0) GOTO ERR_HANDLER


				set @Index=CHARINDEX('|',@RestISOParts)
				set @CurrentISOParts=substring(@RestISOParts,1,@Index-1)
				set @RestISOParts=substring(@RestISOParts,@Index+1,len(@RestISOParts))	


				set @RestPortion=@CurrentISOParts

				set @Index=CHARINDEX('~',@RestPortion)		
				set @DegreeType =substring(@RestPortion,1,@Index-1)
				set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))		
				
				set @Index=CHARINDEX('~',@RestPortion)		
				set @ExamName=substring(@RestPortion,1,@Index-1)
				set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))		

				set @Index=CHARINDEX('~',@RestPortion)		
				set @Major=substring(@RestPortion,1,@Index-1)
				set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	

				set @Index=CHARINDEX('~',@RestPortion)		
				set @PassingYear=substring(@RestPortion,1,@Index-1)
				set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	
				
				set @Index=CHARINDEX('~',@RestPortion)		
				set @InstitutionName=substring(@RestPortion,1,@Index-1)
				set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))
				
				set @Index=CHARINDEX('~',@RestPortion)		
				set @OtherInstitutionName =substring(@RestPortion,1,@Index-1)
				set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	
				
				set @Index=CHARINDEX('~',@RestPortion)		
				set @ResultType=substring(@RestPortion,1,@Index-1)
				set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	

				set @Index=CHARINDEX('~',@RestPortion)		
				set @Result=substring(@RestPortion,1,@Index-1)
				set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))
				
				set @Index=CHARINDEX('~',@RestPortion)		
				set @OutOf=substring(@RestPortion,1,@Index-1)
				set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))
				
			INSERT INTO [dbo].[tblCandidateEducationInfo]
				   (CandidateEducationID 
				   ,[CandidateID]
				   ,DegreeType 
				   ,[ExamID] 
				   ,[Major]
				   ,[InstitutionID]
				   ,OtherInstitutionName
				   ,[PassingYear]
				   ,[ResultType]
				   ,[Result]
				   ,OutOf )
			 VALUES
				   (@EduID 
				   ,@CandidateID
				   ,@DegreeType 
				   ,@ExamName
				   ,@Major
				   ,@InstitutionName
				   ,@OtherInstitutionName 
				   ,@PassingYear
				   ,@ResultType
				   ,@Result
				   ,@OutOf )
				   
				   update tblAppSettings set PropertyValue=@CurrentEduID where PropertyName='CurrentEducationID'
					IF (@@ERROR <> 0) GOTO ERR_HANDLER

			end
		COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end



GO



-------------------------------


CREATE proc [dbo].[spGetEducationInformation]
@CandidateID varchar(50)
as
begin

	SELECT [CandidateEducationID]
		,[CandidateID]
		,DegreeType 
		,(select ExamName from  dbo.tblExamName where tblExamName.ExamID=[tblCandidateEducationInfo].ExamID ) ExamName
		,(select MajorType from dbo.tblMajorType where MajorTypeID=[tblCandidateEducationInfo].Major)[Major]
		,[tblCandidateEducationInfo].InstitutionID InstitutionID
		,case when OtherInstitutionName='N\A' then 
		(select InstitutionName from dbo.tblInstitutionName where 
		InstitutionID=[tblCandidateEducationInfo].[InstitutionID]) else
		'Others'+'('+ OtherInstitutionName +')' end as InstitutionName
		,OtherInstitutionName 
		,[PassingYear]
		,[ResultType]
		,[Result]
		,[tblCandidateEducationInfo].ExamID ExamID
		,[tblCandidateEducationInfo].Major MajorID
		,case when OutOf =0 then 'N\A' else convert(nvarchar,OutOf) end as OutOf
		FROM [dbo].[tblCandidateEducationInfo] 
	where CandidateID=@CandidateID
end

-- exec spGetEducationInformation 'Can-00000002'




GO



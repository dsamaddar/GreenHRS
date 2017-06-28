
CREATE procedure [dbo].[prEmployeeEducationInputAdd]
@EmployeeID as nvarchar(100),
@IsoParts as nvarchar(4000)
as
begin


	Declare @LogID  as nvarchar(50)

	Declare @RestISOParts as nvarchar(4000)
	Declare @CurrentISOParts as nvarchar(4000)
	Declare @Index as int
	Declare @RestPortion as nvarchar(1000)
	declare @ExamName as varchar(500)
	declare @Major as varchar(500)
	declare @InstitutionName as varchar(500)
	declare @PassingYear as integer
	declare @ResultType as varchar(50)
	declare @Result as varchar(500)
	declare @OutOf as numeric(18,2)
	
	DECLARE @count as int
	
	
	Declare @EduID as nvarchar(50)
	Declare @CurrentEduID as numeric(18,0)
	Declare @EduIDPrefix as nvarchar(8)
	
		
	begin tran
	set @EduIDPrefix='EMP-EDU-'

			
	DELETE FROM [dbo].tblEmployeeEducationInfo
    WHERE EmployeeID=@EmployeeID
    
	
		 
		set @RestISOParts=@IsoParts

		while @RestISOParts<>''
			begin
			
				select @CurrentEduID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentEmployeeEducationID'
	
				set @CurrentEduID=isnull(@CurrentEduID,0)+1
				Select @EduID=dbo.generateID(@EduIDPrefix,@CurrentEduID,8)		
				IF (@@ERROR <> 0) GOTO ERR_HANDLER


				set @Index=CHARINDEX('|',@RestISOParts)
				set @CurrentISOParts=substring(@RestISOParts,1,@Index-1)
				set @RestISOParts=substring(@RestISOParts,@Index+1,len(@RestISOParts))	


				set @RestPortion=@CurrentISOParts

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
				set @ResultType=substring(@RestPortion,1,@Index-1)
				set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	

				set @Index=CHARINDEX('~',@RestPortion)		
				set @Result=substring(@RestPortion,1,@Index-1)
				set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))
				
				set @Index=CHARINDEX('~',@RestPortion)		
				set @OutOf=substring(@RestPortion,1,@Index-1)
				set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))
				
			INSERT INTO [dbo].tblEmployeeEducationInfo
				   (EmployeeEducationID 
				   ,EmployeeID
				   ,[ExamID] 
				   ,[Major]
				   ,[InstitutionID]
				   ,[PassingYear]
				   ,[ResultType]
				   ,[Result]
				   ,OutOf )
			 VALUES
				   (@EduID 
				   ,@EmployeeID
				   ,@ExamName
				   ,@Major
				   ,@InstitutionName
				   ,@PassingYear
				   ,@ResultType
				   ,@Result
				   ,@OutOf )
				   
				   update tblAppSettings set PropertyValue=@CurrentEduID where PropertyName='CurrentEmployeeEducationID'
					IF (@@ERROR <> 0) GOTO ERR_HANDLER

			end
		COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

---------------------------




CREATE procedure [dbo].[prEmployeeExpInputAdd]
@EmployeeID as nvarchar(100),
@isoExperienceParts as nvarchar(4000)
as
begin

	Declare @LogID  as nvarchar(50)

	Declare @RestISOPartsExperience as nvarchar(4000)
	Declare @CurrentISOPartsExperience as nvarchar(4000)
	Declare @IndexExperience as int
	Declare @RestPortionExperience as nvarchar(1000)
	declare @CompanyName as varchar(500)
	declare @PositionHeld as varchar(500)
	declare @Department as varchar(200)
	declare @Responsibilities as varchar(500)
	declare @DateFromExperience as datetime
	declare @DateToExperience as datetime
	declare @TillDate as bit
	
	Declare @ExpID as nvarchar(50)
	Declare @CurrentExpID as numeric(18,0)
	Declare @ExpIDPrefix as nvarchar(5)
	
	set @ExpIDPrefix='EMP-EXP-'
	
	begin tran
		
	DELETE FROM [dbo].tblEmployeeExperienceInfo
    WHERE EmployeeID=@EmployeeID 
    
		 
	set @RestISOPartsExperience=@isoExperienceParts
	
	if @RestISOPartsExperience<>''
		begin
		
		while @RestISOPartsExperience<>''
			begin
			
			select @CurrentExpID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentEmployeeExperienceID'
	
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
				set @PositionHeld=substring(@RestPortionExperience,1,@IndexExperience-1)
				set @RestPortionExperience=substring(@RestPortionExperience,@IndexExperience+1,len(@RestPortionExperience))	

				set @IndexExperience=CHARINDEX('~',@RestPortionExperience)		
				set @Department=substring(@RestPortionExperience,1,@IndexExperience-1)
				set @RestPortionExperience=substring(@RestPortionExperience,@IndexExperience+1,len(@RestPortionExperience))	
				
				set @IndexExperience=CHARINDEX('~',@RestPortionExperience)		
				set @Responsibilities=substring(@RestPortionExperience,1,@IndexExperience-1)
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
				
			INSERT INTO [dbo].tblEmployeeExperienceInfo
				   (EmployeeExperienceID 
				   ,EmployeeID
				   ,CompanyName
				   ,PositionHeld
				   ,Department
				   ,Responsibilities
				   ,DateFrom
				   ,DateTo
				   ,TillDate )
			 VALUES
				   (@ExpID 
				   ,@EmployeeID
				   ,@CompanyName
				   ,@PositionHeld
				   ,@Department
				   ,@Responsibilities
				   ,@DateFromExperience
				   ,@DateToExperience
				   ,@TillDate )
				   
				   update tblAppSettings set PropertyValue=@CurrentExpID where PropertyName='CurrentEmployeeExperienceID'
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


----------------------------



CREATE procedure [dbo].[prEmployeeProCerInputAdd]
@EmployeeID as nvarchar(100),
@isoProfessionalCertificationParts as nvarchar(4000)

as
begin


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
	Declare @ProfessionalIDPrefix as nvarchar(9)
	
	begin tran
	
	set @ProfessionalIDPrefix='EMP-PrCr-'
		
	DELETE FROM [dbo].tblEmployeeProfessionalCertificationInfo
    WHERE EmployeeID =@EmployeeID 
    
		 
		set @RestISOParts=@isoProfessionalCertificationParts
		while @RestISOParts<>''
			begin
			
				select @CurrentProfessionalID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentEmployeeProCertiID'
	
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


				
				
	INSERT INTO [dbo].tblEmployeeProfessionalCertificationInfo
           (EmployeeProCerID 
           ,EmployeeID
           ,[CertificationName]
           ,[InstituteName]
           ,[Location]
           ,[IssuingDate] 
           ,[ExpireDate] 
           ,NeverExpire )
     VALUES
           (@ProfessionalID 
           ,@EmployeeID 
           ,@CertificationName
           ,@InstituteName
           ,@Location
           ,@DateFrom
           ,@DateTo
           ,@NeverExpire )
           
            update tblAppSettings set PropertyValue=@CurrentProfessionalID where PropertyName='CurrentEmployeeProCertiID'
					IF (@@ERROR <> 0) GOTO ERR_HANDLER

	end
		COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

--------------------------

CREATE procedure [dbo].[prEmployeeTrainingInputAdd]
@EmployeeID as nvarchar(100),
@isoTrainingParts as nvarchar(4000)
as
begin


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
	declare @DateFrom as varchar(50)
	declare @DateTo as varchar(500)
	
	Declare @TrainingID as nvarchar(50)
	Declare @CurrentTrainingID as numeric(18,0)
	Declare @TrainingIDPrefix as nvarchar(8)
	
	
	begin tran
	
	set @TrainingIDPrefix='EMP-TRA-'

		 
	DELETE FROM [dbo].tblEmployeeTrainingInfo
    WHERE EmployeeID=@EmployeeID
    
			
	set @RestISOPartsTraining=@isoTrainingParts

	if @RestISOPartsTraining<>''
		begin
		
		while @RestISOPartsTraining<>''
			begin
			
			select @CurrentTrainingID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentEmployeeTrainingID'
	
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
				set @DateFrom=substring(@RestPortionTraining,1,@IndexTraining-1)
				set @RestPortionTraining=substring(@RestPortionTraining,@IndexTraining+1,len(@RestPortionTraining))	

				set @IndexTraining=CHARINDEX('~',@RestPortionTraining)		
				set @DateTo=substring(@RestPortionTraining,1,@IndexTraining-1)
				set @RestPortionTraining=substring(@RestPortionTraining,@IndexTraining+1,len(@RestPortionTraining))
				
				   
	INSERT INTO [dbo].tblEmployeeTrainingInfo
           (EmployeeTrainingID 
           ,EmployeeID
           ,[TrainingName]
           ,[InstituteName]
           ,[Country]
           ,[TrainingYear]
           ,[DateFrom]
           ,[DateTo])
     VALUES
           (@TrainingID 
           ,@EmployeeID
           ,@TrainingName
           ,@IInstituteName
           ,@Country
           ,@TrainingYear
           ,@DateFrom
           ,@DateTo)
           
           update tblAppSettings set PropertyValue=@CurrentTrainingID where PropertyName='CurrentEmployeeTrainingID'
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



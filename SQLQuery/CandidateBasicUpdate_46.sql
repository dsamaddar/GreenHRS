CREATE proc [dbo].[spUpdateCandidateBasicInfo]
@CandidateID nvarchar(50),
@UserID nvarchar(50),
@CandidateName nvarchar(100),
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
	

begin tran

		begin
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
				 IF (@@ERROR <> 0) GOTO ERR_HANDLER
				 
				 
				
				 if @AttachmentFileName<>''
					 begin
					 
					  delete from dbo.tblPhotos where CandidateID=@CandidateID 
						IF (@@ERROR <> 0) GOTO ERR_HANDLER
						
						INSERT INTO [dbo].[tblPhotos]
							   ([CandidateID]
							   ,[photos]
							   ,[bitActive])
						 VALUES
							   (@CandidateID
							   ,@AttachmentFileName
							   ,1)
							   IF (@@ERROR <> 0) GOTO ERR_HANDLER
					 end
				 
				 
				
				if @DocFileNameSign<>''
					 begin
						delete from dbo.tblSignature where CandidateID=@CandidateID 
						IF (@@ERROR <> 0) GOTO ERR_HANDLER
				
						INSERT INTO [dbo].[tblSignature]
							   ([CandidateID]
							   ,[Signature]
							   ,[bitActive])
						 VALUES
							   (@CandidateID
							   ,@DocFileNameSign
							   ,1)
							   IF (@@ERROR <> 0) GOTO ERR_HANDLER
					 end
					 
			  
				 
				if @DocumentInformation <>''
					begin
						delete from dbo.tblUserDocuments where UniqueUserID=@CandidateID 
						IF (@@ERROR <> 0) GOTO ERR_HANDLER
						
						exec spInsertUserDocuments @DocumentInformation,@CandidateID,@UserID
						IF (@@ERROR <> 0) GOTO ERR_HANDLER
					end
			
			
					
			if @SpecilizedInformation <>''
			begin
				delete from dbo.[tblCandidateSpecilization] where CandidateID=@CandidateID
				IF (@@ERROR <> 0) GOTO ERR_HANDLER
				
				exec dbo.spInsertCanSpecilizedInfo @SpecilizedInformation, @CandidateID
				IF (@@ERROR <> 0) GOTO ERR_HANDLER
			end	
				 
		end
		
COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end




CREATE procedure [dbo].[spGetCandidateDetailsView]
@CircularID nvarchar(50),
@CandidateID nvarchar(50)
as
--exec spGetCandidateDetailsView 'CIR-00000001','Can-00000001'
--declare @CandidateID as nvarchar(50)

--select @CandidateID=CandidateID from dbo.tblAppliedJob where CircularID=@CircularID

SELECT [tblCandidateBasicInfo].[CandidateName] 
      ,[FathersName]
      ,[MothersName]
      ,[SpouseName]
      ,[Gender]
      ,[NIDNo]
      ,[Nationality]
      ,[Religion]
      ,[PresentAddress]
      --,[PreDistrict]
      ,(select DistrictName from dbo.tblDistrict where DistrictID=PreDistrict) [PreDistrict]
      ,(select UpazilaName from dbo.tblUpazila where UpazilaID=PreThana) [PreThana]
      ,[PermanentAddress]
      ,(select DistrictName from dbo.tblDistrict where DistrictID=PerDistrict) [PerDistrict]
      ,(select UpazilaName from dbo.tblUpazila where UpazilaID=PerThana) [PerThana]
      ,[HomePhoneNo]
      ,[PersonalPhoneNo]
      ,[OfficePhoneNo]
      ,[AlternateEmail]
      ,[CareerObjective]
      ,[YearOfExperience]
      ,dbo.getCommaseperatedval([PresentSalary]) as PresentSalary
      ,dbo.getCommaseperatedval([ExpectedSalary]) as ExpectedSalary
      ,(select JobType from dbo.tblJobType where JobTypeID=[LookingFor]) LookingFor
      ,(select ServiceType from dbo.tblServiceType where ServiceTypeID=AvailableFor) AvailableFor
      ,[ComputerLiteracy]
      ,[EnglishLanguageProficiency]
      ,isnull(tblPhotos.photos ,'') photos
      ,tblRegisterUser.Email 
      ,isnull(dbo.tblSignature.[Signature],'') [Signature]
      ,FathersOccupation
      ,MothersOccupation
      ,SpouseOccupation
      ,[NoOfChildrenAge]
      ,[SibblingsNameOccupation]
      ,CONVERT(varchar, LastDrawnDate,106) LastDrawnDate
      ,Employeer
      ,(select DistrictName from dbo.tblDistrict where DistrictID=PreferredJobLocation) PreferredJobLocation
      ,(select RelName from dbo.tblRelationShipStatus where RelationshipID=RelationshipStatus) RelationshipStatus
      ,(select BloodGroupName from dbo.tblBloodGroup where BloodGroupID=tblCandidateBasicInfo.BloodGroupID ) BloodGroupName
  FROM [dbo].[tblCandidateBasicInfo] left join dbo.tblPhotos on dbo.tblPhotos.CandidateID=[tblCandidateBasicInfo].CandidateID
  left join dbo.tblRegisterUser on dbo.tblRegisterUser.UserID=[tblCandidateBasicInfo].UserID
  left join dbo.tblSignature on dbo.tblSignature.CandidateID=tblCandidateBasicInfo.CandidateID
where [tblCandidateBasicInfo].[CandidateID]=@CandidateID 

GO

-------------------------------------


CREATE TABLE [dbo].[tblAppliedJob](
	[AppliedJobID] [nvarchar](50) NOT NULL,
	[CircularID] [nvarchar](50) NOT NULL,
	[CandidateID] [nvarchar](50) NOT NULL,
	[CurrentStatus] [varchar](100) NULL,
	[ReviewedBy] [nvarchar](50) NULL,
	[ReviewedDate] [datetime] NULL,
	[RejectedBy] [nvarchar](50) NULL,
	[RejectedDate] [datetime] NULL,
	[EntryBy] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_tblAppliedJob_1] PRIMARY KEY CLUSTERED 
(
	[AppliedJobID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


-------------------------------------


CREATE TABLE [dbo].[tblUserAction](
	[CircularID] [nvarchar](50) NOT NULL,
	[CandidateID] [nvarchar](50) NOT NULL,
	[UserID] [nvarchar](50) NULL,
	[TakenAction] [nvarchar](100) NULL,
	[PerformedTime] [datetime] NULL,
 CONSTRAINT [PK_tblUserAction] PRIMARY KEY CLUSTERED 
(
	[CircularID] ASC,
	[CandidateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



------------------------------------

CREATE procedure [dbo].[spChangeStatus](
@CircularID	nvarchar(50),
@CandidateID	nvarchar(50),
@UserID	nvarchar(50),
@TakenAction	nvarchar(50)
)
as
--exec prChangeApplicationStatus 'FinApp-B1920B60-F506-4078-84FA-E52E8DD767D7','smhossain','Reviewed','Remarks44'
begin
	
	begin tran

	begin Try
	
		DECLARE @Approver as varchar(50)
		Declare @msg as nvarchar(100)
		
		
		if @TakenAction='Reviewed'
		begin
			UPDATE dbo.tblAppliedJob SET CurrentStatus = @TakenAction,ReviewedBy=@UserID,
			ReviewedDate=GETDATE ()
			where CircularID=@CircularID and CandidateID=@CandidateID
		end
		
		else if @TakenAction='Rejected'
		begin
			UPDATE dbo.tblAppliedJob SET CurrentStatus = @TakenAction,RejectedBy=@UserID,
			RejectedDate=GETDATE ()
			where CircularID=@CircularID and CandidateID=@CandidateID
		end
		
		INSERT dbo.tblUserAction(CircularID,CandidateID,UserID,TakenAction,PerformedTime)
		VALUES(@CircularID,@CandidateID,@UserID,@TakenAction,GETDATE())
		
				
		set @msg='Successfully Changed Status'
		commit tran	
	end try 
	begin catch
		set @msg='Failed to Change Status'
		rollback tran
	end catch
	
	select @msg as Msg
end 


GO




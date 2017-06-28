

CREATE procedure [dbo].[prGetCandidateBasicInformation]
@CandidateID nvarchar(50)
as
--exec prGetCandidateBasicInformation 'Can-00000003'
SELECT [tblCandidateBasicInfo].[CandidateName] 
      ,[FathersName]
      ,[MothersName]
      ,[SpouseName]
      ,[Gender]
      ,[NIDNo]
      ,PassportNo 
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
      ,ExpInMonth 
      ,dbo.getCommaseperatedval([PresentSalary]) as PresentSalary
      ,dbo.getCommaseperatedval([ExpectedSalary]) as ExpectedSalary
      ,(select JobType from dbo.tblJobType where JobTypeID=[LookingFor]) LookingFor
      ,(select ServiceType from dbo.tblServiceType where ServiceTypeID=AvailableFor) AvailableFor
      ,[ComputerLiteracy]
      ,[EnglishLanguageProficiency]
      ,isnull(tblPhotos.photos,'') photos
      ,tblRegisterUser.Email 
      ,isnull(dbo.tblSignature.[Signature],'') [Signature]
      ,(select OccupationName from dbo.tblOccupation where OccupationID=FathersOccupation) FathersOccupation
      --,FathersOccupation
      ,(select OccupationName from dbo.tblOccupation where OccupationID=MothersOccupation) MothersOccupation
      ,(select OccupationName from dbo.tblOccupation where OccupationID=SpouseOccupation) SpouseOccupation
      --,MothersOccupation
      --,SpouseOccupation
      ,[NoOfChildrenAge]
      ,[SibblingsNameOccupation]
      ,CONVERT(varchar, LastDrawnDate,106) LastDrawnDate
      ,Employeer
      ,(select DistrictName from dbo.tblDistrict where DistrictID=PreferredJobLocation) PreferredJobLocation
      ,(Select RelName from  tblRelationShipStatus R Where  R.RelationshipID=[tblCandidateBasicInfo].RelationshipStatus ) as 'RelationshipStatus'
      ,(select BloodGroupName from dbo.tblBloodGroup B where B.BloodGroupID =[tblCandidateBasicInfo].BloodGroupID ) BloodGroupName
      ,AboutYourself 
      ,SpecilizedIn 
  FROM [dbo].[tblCandidateBasicInfo] 
  left join dbo.tblPhotos on dbo.tblPhotos.CandidateID=[tblCandidateBasicInfo].CandidateID
  left join dbo.tblRegisterUser on dbo.tblRegisterUser.UserID=[tblCandidateBasicInfo].UserID
  left join dbo.tblSignature on dbo.tblSignature.CandidateID=tblCandidateBasicInfo.CandidateID
where [tblCandidateBasicInfo].[CandidateID]=@CandidateID 

GO



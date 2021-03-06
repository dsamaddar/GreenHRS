

CREATE procedure [dbo].[prGetEmployeeAllInformation]
@EmployeeID nvarchar(50)
as
--exec prGetCandidateBasicInformation 'Can-00000003'

SELECT [EmployeeBasicInfoID]
      ,[EmployeeID]
      ,[Name]
      ,[FathersName]
      ,(select OccupationName from tblOccupation where OccupationID=FathersOccupation) FathersOccupation
      --,[FathersOccupation]
      ,[MothersName]
      ,(select OccupationName from tblOccupation where OccupationID=MothersOccupation) MothersOccupation
      --,[MothersOccupation]
      ,[SpouseName]
      ,(select OccupationName from tblOccupation where OccupationID=SpouseOccupation) SpouseOccupation
      --,[SpouseOccupation]
      ,[NoOfChildrenAge]
      ,[SibblingsNameOccupation]
      ,(select RelName from dbo.tblRelationShipStatus where RelationshipID=[tblEmployeeBasicInfo].[RelationshipStatus]) [RelationshipStatus]
      ,[Gender]
      ,[NIDNo]
      ,[Nationality]
      ,[Religion]
      ,[PresentAddress]
      ,(select DistrictName from dbo.tblDistrict where DistrictID=PreDistrict) [PreDistrict]
      ,(select UpazilaName from dbo.tblUpazila where UpazilaID=PreThana) [PreThana]
      ,[PermanentAddress]
      ,(select DistrictName from dbo.tblDistrict where DistrictID=PerDistrict) [PerDistrict]
      ,(select UpazilaName from dbo.tblUpazila where UpazilaID=PerThana) [PerThana]
      ,[MobileNo]
      ,[Email]
      ,[AlternateEmail]
      ,[Photos]
      ,[Signature]
      ,[bitActive]
      ,(select BloodGroupName from tblBloodGroup where BloodGroupID=[tblEmployeeBasicInfo].BloodGroupID) BloodGroupName
  FROM [dbo].[tblEmployeeBasicInfo]
  where [tblEmployeeBasicInfo].EmployeeID =@EmployeeID







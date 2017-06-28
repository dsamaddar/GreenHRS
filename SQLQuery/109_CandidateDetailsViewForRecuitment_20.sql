
create   function [dbo].[getCommaseperatedval](@value numeric(18,2)) returns nvarchar(100) as

begin

	if @value=0 
		return '0'
		
	declare @tmpval int
	declare @FractopmText as nvarchar(10)

	set @FractopmText=right(convert(nvarchar,@value),2)

	--set @value = round(@value,0)	

	declare @val bigint
	
	declare @fraction numeric(18,2)
	
	declare @valstr as nvarchar(200)
	
	declare @tmpstr as nvarchar(200)
	

	
	set @fraction = round(@value,2) - floor(@value)

	
	set @val= convert(numeric,left(convert(nvarchar,@value),len(convert(nvarchar,@value))-3))                 --floor(@value)
	
	set @valstr = ''
	

	while(@val > 999)
	
	begin
		
		set @tmpval=@val % 1000
		
		if (@tmpval <= 9 )
		
		begin
		
			set @tmpstr='00' + cast(@val%1000 as nvarchar(50))
		
		end
		
		else if (@tmpval <= 99 )
		
		begin
		
			set @tmpstr='0' + cast(@val%1000 as nvarchar(50))
		
		end
		
		else if (@tmpval <= 999 )
		
		begin
		
			--print @tmpval
			
			set @tmpstr=cast(@val%1000 as nvarchar(50))
			
			--print @tmpstr
		
		end
		
		set @valstr= ',' + @tmpstr + @valstr
		
		set @val= @val / 1000
	
	end
	
	if @value=0
		set @valstr='-'
	else
		set @valstr=convert(nvarchar,@val)+@valstr

/*
	set @FractopmText=''
	
	if @fraction=0
		set @valstr=convert(nvarchar,@val)+@valstr+'.00'
	else
		set @valstr=convert(nvarchar,@val)+@valstr+'.'
	
	while @fraction<>0
	begin
		
		set @FractopmText = @FractopmText+convert(nvarchar,floor(@fraction*10))
		set @fraction = (@fraction*10) - floor(@fraction*10)
	end
	
	set @valstr=@valstr+@FractopmText
	*/
	--return convert(nvarchar,@fraction)
	return @valstr+'.'+@FractopmText

end

--select dbo.getCommaseperatedval(123456789.85)
--select round(0.52,0)









GO

-------------------------------------------
--drop proc [spGetCandidateDetailsViewForRecuitment]
CREATE procedure [dbo].[spGetCandidateDetailsViewForRecuitment]
@CandidateID nvarchar(50)
as
--exec spGetCandidateDetailsViewForRecuitment 'Can-00000005'
SELECT [tblCandidateBasicInfo].[CandidateName] 
	  ,convert(nvarchar,tblRegisterUser.DateOfBirth,106) DateOfBirth
      ,[FathersName]
      ,[MothersName]
      ,[SpouseName]
      ,[Gender]
      ,isnull([NIDNo],'') NIDNo
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
      ,isnull(tblPhotos.photos,'N\A') as 'photos'
     ,tblRegisterUser.Email 
      ,isnull(tblSignature.[Signature],'') as 'Signature'
       ,(select OccupationName from dbo.tblOccupation where OccupationID=FathersOccupation) FathersOccupation
      --,FathersOccupation
      ,(select OccupationName from dbo.tblOccupation where OccupationID=MothersOccupation) MothersOccupation
      ,(select OccupationName from dbo.tblOccupation where OccupationID=SpouseOccupation) SpouseOccupation
      --,MothersOccupation
      --,SpouseOccupation
      ,[NoOfChildrenAge] NoOfChildrenAge
      ,[SibblingsNameOccupation] SibblingsNameOccupation
      ,CONVERT(varchar, LastDrawnDate,106) LastDrawnDate
      ,Employeer
      ,(select DistrictName from dbo.tblDistrict where DistrictID=PreferredJobLocation) PreferredJobLocation
      ,(select RelName from dbo.tblRelationShipStatus where RelationshipID=RelationshipStatus) RelationshipStatus 
      ,(select BloodGroupName from dbo.tblBloodGroup where BloodGroupID=[tblCandidateBasicInfo].BloodGroupID ) BloodGroupName
      ,AboutYourself 
      ,SpecilizedIn 
  FROM [dbo].[tblCandidateBasicInfo] left join tblPhotos on tblPhotos.CandidateID=[tblCandidateBasicInfo].CandidateID
  left join dbo.tblRegisterUser on dbo.tblRegisterUser.RegistrationID=[tblCandidateBasicInfo].RegistrationID 
  left join tblSignature on tblSignature.CandidateID=tblCandidateBasicInfo.CandidateID
where [tblCandidateBasicInfo].[CandidateID]=@CandidateID 


GO


create proc [dbo].[spGetRefForCanDetailView]
@CandidateID nvarchar(50)
as

SELECT [Name]   ,[Designation]  ,[OrganizationName]  ,[Address]  ,[MobileNo] ,[Email] ,
(select RefRelationName from dbo.tblReferenceRelationType where RefRelationID=RefRelationWith) RefRelationWith
                             FROM [dbo].[tblCandidateReferenceInfo] where CandidateID=@CandidateID
                             
      
go

                       
                             
Create proc [dbo].[spGetEduForCanDetailView]
@CandidateID nvarchar(50)
as

SELECT DegreeType ,tblExamName.[ExamName] ExamName,tblMajorType.[MajorType] MajorType
,case when OtherInstitutionName='N\A' then 
		(select InstitutionName from dbo.tblInstitutionName where 
		InstitutionID=[tblCandidateEducationInfo].[InstitutionID]) else
		'Others'+'('+ OtherInstitutionName +')' end as InstitutionName
		,OtherInstitutionName ,[PassingYear],[ResultType],[Result],
case when OutOf =0 then 'N\A'  else CONVERT (nvarchar,OutOf) end as OutOf
FROM [dbo].[tblCandidateEducationInfo] 
left join dbo.tblInstitutionName on dbo.tblInstitutionName.InstitutionID= [tblCandidateEducationInfo].InstitutionID 
inner join dbo.tblMajorType on dbo.tblMajorType.MajorTypeID =[tblCandidateEducationInfo].Major 
inner join dbo.tblExamName on dbo.tblExamName.ExamID=[tblCandidateEducationInfo].ExamID
where CandidateID=@CandidateID


GO

create proc [dbo].[spGetExpForCanDetailView]
@CandidateID nvarchar(50)
as

SELECT [CompanyName],OfficialDesig,FuncDesig, Department [Department],[Responsibilities],
CompanyAddress ,CompanyConNo ,convert(nvarchar(20),[DateFrom],106) DateFrom
,(case when [DateTo]='01-01-1911' then '' else convert(varchar,[DateTo],106) end)as [DateTo]
,case when TillDate =1 then 'Till Date' else '' end as TillDate FROM [dbo].[tblCandidateExperienceInfo] 
where CandidateID =@CandidateID                  


GO



create proc spGetProCertiForCanDetailView
@CandidateID nvarchar(50)
as

SELECT [CertificationName],[InstituteName],[Location]
,convert(nvarchar(20),IssuingDate ,106) DateFrom,
case when [ExpireDate]='01-01-1911' then '' else convert(nvarchar(20),[ExpireDate],106) end as DateTo
,case when NeverExpire=1 then 'Never Expire' else '' end as NeverExpire
FROM [dbo].[tblCandidateProfessionalCertificationInfo] where CandidateID=@CandidateID

GO


create proc [dbo].[spGetTrainingForCanDetailView]
@CandidateID nvarchar(50)
as

SELECT [TrainingName],[InstituteName] ,tblCountryName.[CountryName] Country ,[TrainingYear],TotalTrainingDay,
convert(nvarchar(20),[DateFrom],106) DateFrom,convert(nvarchar(20),[DateTo],106) DateTo
FROM [dbo].[tblCandidateTrainingInfo] 
join dbo.tblCountryName on dbo.tblCountryName.CountryID=[tblCandidateTrainingInfo].Country where CandidateID=@CandidateID

GO


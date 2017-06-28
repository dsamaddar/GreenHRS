
-- drop proc spSearchApplicantForScreening
ALTER proc [dbo].[spSearchApplicantForScreening]
@CircularID nvarchar(50),
@CandidateName nvarchar(200),
@InstitutionID nvarchar(50),
@PresentDistrictID int,
@PermanentDistrictID int,
@Gender nvarchar(50),
@AgeFrom int,
@AgeTo int,
@Religion nvarchar(50),
@YearOfExperience int,
@SpecializedID nvarchar(4000),
@MajorTypeID nvarchar(50)
as
begin

	Declare @PreDistParam as nvarchar(10)
	Declare @PerDistParam as nvarchar(10)
	Declare @GenderParam as nvarchar(50)
	Declare @CandidateNameParam as nvarchar(200)
	Declare @InstitutionIDParam as nvarchar(50)
	
	Declare @ReligionParam as nvarchar(50)
	Declare @MajorTypeIDParam as nvarchar(50)

	if @PresentDistrictID=0
		set @PreDistParam = '%'
	else
		set @PreDistParam = convert(nvarchar,@PresentDistrictID)

	if @PermanentDistrictID=0
		set @PerDistParam ='%'
	else
		set @PerDistParam = convert(nvarchar,@PermanentDistrictID)

	if @Gender = '0'
		Set @GenderParam='%'
	else
		Set @GenderParam = @Gender+'%'

	if @CandidateName = ''
		Set @CandidateNameParam = '%'
	else
		Set @CandidateNameParam = '%'+@CandidateName+'%'
	
	if @InstitutionID='0'
		Set @InstitutionIDParam = '%'
	else
		Set @InstitutionIDParam = '%'+@InstitutionID+'%'
	
	if @Religion = 'N\A'
		Set @ReligionParam = '%'
	else
		Set @ReligionParam =  '%'+ @Religion +'%'
	
	if @MajorTypeID = '0'
		Set @MajorTypeIDParam = '%'
	else
		Set @MajorTypeIDParam =  '%'+ @MajorTypeID +'%'
		
	Print @ReligionParam
	if @CircularID <> 'N\A'
	begin
		Select * from vwAppliedCandidatesForScreening Where CircularID=@CircularID And
		CandidateName like ''+@CandidateNameParam+'' And InstitutionID like ''+@InstitutionIDParam+'' And PreDistrict like ''+@PreDistParam+'' And 
		PerDistrict like ''+@PerDistParam+'' And Gender like ''+@GenderParam+'' And
		Age between @AgeFrom and @AgeTo And CurrentStatus='Applied'
		And Religion like ''+@ReligionParam+'' And YearOfExperience >= @YearOfExperience
		And MajorTypeID like ''+ @MajorTypeIDParam +''
		order by Convert(datetime,EntryDate) 
	end
	else
	begin
		Select * from vwUnAppliedCandidates Where CircularID=@CircularID And
		CandidateName like ''+@CandidateNameParam+'' And InstitutionID like ''+@InstitutionIDParam+'' And PreDistrict like ''+@PreDistParam+'' And 
		PerDistrict like ''+@PerDistParam+'' And Gender like ''+@GenderParam+'' And
		Age between @AgeFrom and @AgeTo And CurrentStatus='Not-Applied'
		And Religion like ''+@ReligionParam+'' And YearOfExperience >= @YearOfExperience
		And MajorTypeID like ''+ @MajorTypeIDParam +''
		order by convert(datetime, EntryDate )
		
	end
	
end

-- exec spSearchApplicantForScreening 'N\A','','0','0','0','0',20,60,'N\A',0,'','0'


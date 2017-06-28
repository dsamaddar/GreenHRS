
insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentScrQuesOptSelectedID',0)

GO

-- drop table tblCanScrQuesOptionsSelected
Create table tblCanScrQuesOptionsSelected(
ScrQuesOptSelectedID nvarchar(50) primary key,
CandidateID nvarchar(50) foreign key references tblCandidateBasicInfo(CandidateID),
ScreeningQuesID nvarchar(50) foreign key references tblScreeningQuestion(ScreeningQuesID),
ScrQuesOptionID nvarchar(50) foreign key references tblScreeningQuesOptions(ScrQuesOptionID),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

-- Select * from tblCanScrQuesOptionsSelected

GO

-- drop proc spInsertCanScrQuesOptSelected
Create proc spInsertCanScrQuesOptSelected
@CandidateID nvarchar(50),
@ScreeningQuesID nvarchar(50),
@ScrQuesOptionID nvarchar(50),
@EntryBy nvarchar(50)
as
begin
	Declare @ScrQuesOptSelectedID as nvarchar(50)
	Declare @CurrentScrQuesOptSelectedID numeric(18,0)
	Declare @ScrQuesOptSelectedIDPrefix as nvarchar(17)

	set @ScrQuesOptSelectedIDPrefix='CAN-SCR-QUES-OPT-'

begin tran
	
	select @CurrentScrQuesOptSelectedID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentScrQuesOptSelectedID'
	
	set @CurrentScrQuesOptSelectedID=isnull(@CurrentScrQuesOptSelectedID,0)+1
	Select @ScrQuesOptSelectedID=dbo.generateID(@ScrQuesOptSelectedIDPrefix,@CurrentScrQuesOptSelectedID,8)	
	
	Insert Into tblCanScrQuesOptionsSelected(ScrQuesOptSelectedID,CandidateID,ScreeningQuesID,ScrQuesOptionID,EntryBy)
	Values(@ScrQuesOptSelectedID,@CandidateID,@ScreeningQuesID,@ScrQuesOptionID,@EntryBy)
	
	update tblAppSettings set PropertyValue=@CurrentScrQuesOptSelectedID where PropertyName='CurrentScrQuesOptSelectedID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

-- drop proc spInsertCanScrQuesOptSelectedList
Create proc spInsertCanScrQuesOptSelectedList
@CanResMatchedInfoData nvarchar(4000)
as
begin

	Declare @Index as int
	Declare @CurrentData as nvarchar(4000)
	Declare @RestData as nvarchar(4000)
	Declare @RestPortion as nvarchar(4000)
	
	Declare @CandidateID as nvarchar(50)
	Declare @ScreeningQuesID as nvarchar(50)
	Declare @ScrQuesOptionID as nvarchar(50)
	Declare @EntryBy as nvarchar(50)

begin tran
	set @RestData=@CanResMatchedInfoData
	while @RestData<>''
	begin
		set @Index=CHARINDEX('|',@RestData)
		set @CurrentData=substring(@RestData,1,@Index-1)
		set @RestData=substring(@RestData,@Index+1,len(@RestData))		
		
		set @RestPortion=@CurrentData
		
		set @Index=CHARINDEX('~',@RestPortion)		
		set @CandidateID=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	
		
		set @Index=CHARINDEX('~',@RestPortion)		
		set @ScreeningQuesID=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))
		
		set @Index=CHARINDEX('~',@RestPortion)		
		set @ScrQuesOptionID=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	
		
		set @Index=CHARINDEX('~',@RestPortion)		
		set @EntryBy=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	
	
		exec spInsertCanScrQuesOptSelected @CandidateID,@ScreeningQuesID,@ScrQuesOptionID,@EntryBy
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
		
		Set @CandidateID=''
		Set @ScreeningQuesID=''
		Set @ScrQuesOptionID=''
		Set @EntryBy=''
						
	end
	
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end
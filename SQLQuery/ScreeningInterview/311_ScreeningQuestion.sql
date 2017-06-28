
insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentScreeningQuesID',0)

GO

-- drop table tblScreeningQuestion
Create table tblScreeningQuestion(
ScreeningQuesID nvarchar(50) primary key,
Question nvarchar(1000),
QuesSerial int,
IsActive bit default 1,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

-- Select * from tblScreeningQuestion

GO

-- drop proc spInsertScreeningQuestion
Create proc spInsertScreeningQuestion
@Question nvarchar(1000),
@QuesSerial int,
@IsActive bit,
@EntryBy nvarchar(50)
as
begin
	Declare @ScreeningQuesID as nvarchar(50)
	Declare @CurrentScreeningQuesID numeric(18,0)
	Declare @ScreeningQuesIDPrefix as nvarchar(9)

	set @ScreeningQuesIDPrefix='SCR-QUES-'

begin tran
	
	select @CurrentScreeningQuesID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentScreeningQuesID'
	
	set @CurrentScreeningQuesID=isnull(@CurrentScreeningQuesID,0)+1
	Select @ScreeningQuesID=dbo.generateID(@ScreeningQuesIDPrefix,@CurrentScreeningQuesID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	Insert Into tblScreeningQuestion(ScreeningQuesID,Question,QuesSerial,IsActive,EntryBy)
	Values(@ScreeningQuesID,@Question,@QuesSerial,@IsActive,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	update tblAppSettings set PropertyValue=@CurrentScreeningQuesID where PropertyName='CurrentScreeningQuesID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

create proc spGetAllScreeningQuestions
as
begin
	select ScreeningQuesID,Question,QuesSerial,
	case when IsActive='True' then 'Active' else 'InActive' end as IsActive 
	from dbo.tblScreeningQuestion
end


CREATE proc [dbo].[spGetActiveScreeningQuestions]
as
begin
	select ScreeningQuesID,Question,QuesSerial
	from dbo.tblScreeningQuestion where IsActive =1
	order by QuesSerial
end


/*
exec spInsertScreeningQuestion 'Ask questions about family especially parents, spouse and siblings. Try to find out critical family issues i.e. whether there is any political involvement or other influence from the family references (avoid Police, Lawyer, Journalist, Politician if there is a direct relation).',1,1,'dsamaddar'
GO
exec spInsertScreeningQuestion 'Check References from the CV and ask about applicant’s relation with the references (avoid Police, Lawyer, Journalist, Politician if there is a direct relation).',2,1,'dsamaddar'
GO
exec spInsertScreeningQuestion 'Do you know anyone in this institution ? Whom? ',3,1,'dsamaddar'
GO
exec spInsertScreeningQuestion 'How do you know the above person ?',4,1,'dsamaddar'
GO
exec spInsertScreeningQuestion 'Check University Degree. If from a completely different background, ask questions about reason for applying ?',5,1,'dsamaddar'
GO
exec spInsertScreeningQuestion 'What type of Job you are looking for? Why is that ? ',6,1,'dsamaddar'
GO
exec spInsertScreeningQuestion 'Are you interested to relocate anywhere in Bangladesh ?',7,1,'dsamaddar'
GO
exec spInsertScreeningQuestion 'What do you know about financial sector and ULC ? How do you know about ULC ?',8,1,'dsamaddar'
GO
exec spInsertScreeningQuestion 'What are your current job responsibilities ?',9,1,'dsamaddar'
GO
exec spInsertScreeningQuestion 'Why you would like to switch from your current employer?',10,1,'dsamaddar'
GO
exec spInsertScreeningQuestion 'Why you are interested about financial institutions (if new)?',11,1,'dsamaddar'
GO
exec spInsertScreeningQuestion 'Personality of the applicant',12,1,'dsamaddar'
GO
exec spInsertScreeningQuestion 'Attitude and Behavior',13,1,'dsamaddar'
GO
exec spInsertScreeningQuestion 'Maturity Level',14,1,'dsamaddar'
GO
exec spInsertScreeningQuestion 'Potential for ULC',15,1,'dsamaddar'
GO
exec spInsertScreeningQuestion 'Questions to reveal what kind of person you are',16,1,'dsamaddar'
GO
exec spInsertScreeningQuestion 'Suitable For Which Department ?',17,1,'dsamaddar'
*/

GO

Create table tblScreeningQuesOptions(
ScrQuesOptionID nvarchar(50) primary key,
ScreeningQuesID nvarchar(50) foreign key references tblScreeningQuestion(ScreeningQuesID),
OptionType nvarchar(50),
Options nvarchar(200),
IsActive bit default 1,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO



insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentScreeningQuesOpID',0)

GO


Create proc spInsertScreeningQuestionOptions
@ScreeningQuesID nvarchar(1000),
@OptionType nvarchar(1000),
@Options nvarchar(1000),
@EntryBy nvarchar(50)
as
begin
	Declare @ScrQuesOptionID as nvarchar(50)
	Declare @CurrentScrQuesOptionID numeric(18,0)
	Declare @ScrQuesOptionIDPrefix as nvarchar(12)

	set @ScrQuesOptionIDPrefix='SCR-QUES-OP-'

begin tran
	
	select @CurrentScrQuesOptionID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentScreeningQuesOpID'
	
	set @CurrentScrQuesOptionID=isnull(@CurrentScrQuesOptionID,0)+1
	Select @ScrQuesOptionID=dbo.generateID(@ScrQuesOptionIDPrefix,@CurrentScrQuesOptionID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	Insert Into tblScreeningQuesOptions(ScrQuesOptionID,ScreeningQuesID,OptionType,Options,EntryBy)
	Values(@ScrQuesOptionID,@ScreeningQuesID,@OptionType,@Options,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	update tblAppSettings set PropertyValue=@CurrentScrQuesOptionID where PropertyName='CurrentScreeningQuesOpID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end


create pproc [dbo].[spGetAllScreeningQuestionOptions]
as

begin
	
	select ScrQuesOptionID,tblScreeningQuestion.ScreeningQuesID,tblScreeningQuestion.QuesSerial ,Options ,OptionType
	
	from dbo.tblScreeningQuesOptions inner join dbo.tblScreeningQuestion on 
	dbo.tblScreeningQuestion.ScreeningQuesID=dbo.tblScreeningQuesOptions.ScreeningQuesID
	order by tblScreeningQuestion.QuesSerial 
end


-- drop proc spShowScrQuesOptionsByID 
Create proc spShowScrQuesOptionsByID 
@ScreeningQuesID nvarchar(50) 
as 
begin 
        Select ScrquesOptionID,Options from tblScreeningQuesOptions 
        Where ScreeningQuesID = @ScreeningQuesID 
        Order by Options 
end 


GO
insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentIntManQuestionID',0)
GO

Create table tblMandatoryIntQuestions(
IntManQuestionID nvarchar(50) primary key,
Question nvarchar(500),
QuestionOrder int,
IsActive bit default 1,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

-- drop proc spShowManQuestions
Create proc spShowManQuestions
@IsActive bit
as
begin
	Select IntManQuestionID,Question,QuestionOrder,IsActive from tblMandatoryIntQuestions
	-- Where IsActive=@IsActive
	Order by QuestionOrder
end

GO
Create proc spShowActiveIntManQuestion
@IsActive bit
as
begin
	Select IntManQuestionID,Question,QuestionOrder,IsActive from tblMandatoryIntQuestions
	Where IsActive=@IsActive
	Order by QuestionOrder
end

GO

-- drop proc spInsertIntManQuestion
Create proc spInsertIntManQuestion
@Question nvarchar(500),
@QuestionOrder int,
@IsActive bit,
@EntryBy nvarchar(50)
as
begin
	Declare @IntManQuestionID nvarchar(50)
	Declare @CurrentIntManQuestionID numeric(18,0)
	Declare @IntManQuestionIDPrefix as nvarchar(13)

	set @IntManQuestionIDPrefix='INT-MAN-QUES-'

begin tran
	
	select @CurrentIntManQuestionID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentIntManQuestionID'
	
	set @CurrentIntManQuestionID=isnull(@CurrentIntManQuestionID,0)+1
	Select @IntManQuestionID=dbo.generateID(@IntManQuestionIDPrefix,@CurrentIntManQuestionID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert Into tblMandatoryIntQuestions(IntManQuestionID,Question,QuestionOrder,IsActive,EntryBy)
	Values(@IntManQuestionID,@Question,@QuestionOrder,@IsActive,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	update tblAppSettings set PropertyValue=@CurrentIntManQuestionID where PropertyName='CurrentIntManQuestionID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

-- drop proc spUpdateIntManQuestion
Create proc spUpdateIntManQuestion
@IntManQuestionID nvarchar(50),
@Question nvarchar(500),
@QuestionOrder int,
@IsActive bit,
@EntryBy nvarchar(50)
as
begin
begin tran
	
	Update tblMandatoryIntQuestions Set Question=@Question,QuestionOrder=@QuestionOrder,IsActive=@IsActive,
	EntryBy=@EntryBy
	Where IntManQuestionID=@IntManQuestionID
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

-- drop proc spGetIntManQuesByID
Create proc spGetIntManQuesByID
@IntManQuestionID nvarchar(50)
as
begin
	Select IntManQuestionID,Question,QuestionOrder,IsActive from tblMandatoryIntQuestions Where IntManQuestionID=@IntManQuestionID
end

-- exec spGetIntManQuesByID 'INT-MAN-QUES-00000002'
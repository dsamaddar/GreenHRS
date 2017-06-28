
insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentMailTypeID',0)

GO

Create table tblMailType(
MailTypeID nvarchar(50) primary key,
MailType nvarchar(200) unique(MailType),
IsActive bit default 1,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

Create proc spShowMailType
as
begin
	Select Distinct MailTypeID,MailType from tblMailType Where IsActive=1
	Order By MailType
end

GO

Create proc spInsertMailType
@MailType nvarchar(200),
@IsActive bit,
@EntryBy nvarchar(50)
as
begin

	Declare @MailTypeID as nvarchar(50)
	Declare @CurrentMailTypeID numeric(18,0)
	Declare @MailTypeIDPrefix as nvarchar(10)

	set @MailTypeIDPrefix='MAIL-TYPE-'

begin tran
	
	select @CurrentMailTypeID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentMailTypeID'
	
	set @CurrentMailTypeID=isnull(@CurrentMailTypeID,0)+1
	Select @MailTypeID=dbo.generateID(@MailTypeIDPrefix,@CurrentMailTypeID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	Insert into tblMailType(MailTypeID,MailType,IsActive,EntryBy)
	Values(@MailTypeID,@MailType,@IsActive,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	update tblAppSettings set PropertyValue=@CurrentMailTypeID where PropertyName='CurrentMailTypeID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentMailPropertyID',0)

GO

Create table tblMailProperty(
MailPropertyID nvarchar(50),
MailTypeID nvarchar(50) foreign key references tblMailType(MailTypeID),
MailSubject nvarchar(500),
MailBody nvarchar(1000),
MailFrom nvarchar(500),
MailTo nvarchar(500),
MailCC nvarchar(500),
MailBCC nvarchar(500),
IsAutomated bit default 1,
IsActive bit default 1,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

Create proc spInsertMailProperty
@MailTypeID nvarchar(50),
@MailSubject nvarchar(500),
@MailBody nvarchar(1000),
@MailFrom nvarchar(500),
@MailTo nvarchar(500),
@MailCC nvarchar(500),
@MailBCC nvarchar(500),
@IsAutomated bit,
@IsActive bit,
@EntryBy nvarchar(50)
as
begin

	Declare @MailPropertyID as nvarchar(50)
	Declare @CurrentMailPropertyID numeric(18,0)
	Declare @MailPropertyIDPrefix as nvarchar(9)

	set @MailPropertyIDPrefix='MAIL-PRO-'

begin tran
	
	select @CurrentMailPropertyID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentMailTypeID'
	
	set @CurrentMailPropertyID=isnull(@CurrentMailPropertyID,0)+1
	Select @MailTypeID=dbo.generateID(@MailPropertyIDPrefix,@CurrentMailPropertyID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	Insert into tblMailProperty(MailPropertyID,MailTypeID,MailSubject,MailBody,MailFrom,MailTo,MailCC,MailBCC,IsAutomated,IsActive,EntryBy)
	Values(@MailPropertyID,@MailTypeID,@MailSubject,@MailBody,@MailFrom,@MailTo,@MailCC,@MailBCC,@IsAutomated,@IsActive,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	update tblAppSettings set PropertyValue=@CurrentMailPropertyID where PropertyName='CurrentMailPropertyID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO
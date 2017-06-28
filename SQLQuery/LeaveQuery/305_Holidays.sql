

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentHolidayID',0)

GO
-- drop table tblHolidays
Create table tblHolidays(
HolidayID nvarchar(50) primary key,
DateFrom datetime,
DateTo datetime,
Purpose nvarchar(500),
IsMailSent bit default 0,
MailSentDate datetime,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

-- drop proc spInsertHolidays
Create proc spInsertHolidays
@DateFrom datetime,
@DateTo datetime,
@Purpose nvarchar(500),
@EntryBy nvarchar(50)
as
begin
	Declare @HolidayID as nvarchar(50)
	Declare @CurrentHolidayID numeric(18,0)
	Declare @HolidayIDPrefix as nvarchar(8)

	set @HolidayIDPrefix='HOLIDAY-'

begin tran
	
	select @CurrentHolidayID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentHolidayID'
	
	set @CurrentHolidayID=isnull(@CurrentHolidayID,0)+1
	Select @HolidayID=dbo.generateID(@HolidayIDPrefix,@CurrentHolidayID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	Insert Into tblHolidays(HolidayID,DateFrom,DateTo,Purpose,EntryBy)
	Values(@HolidayID,@DateFrom,@DateTo,@Purpose,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	update tblAppSettings set PropertyValue=@CurrentHolidayID where PropertyName='CurrentHolidayID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO



CREATE proc [dbo].[spUpdateHolidays]
@DateFrom datetime,
@DateTo datetime,
@Purpose nvarchar(500),
@HolidayID nvarchar(50)
as
begin

begin tran
	
	UPDATE [dbo].[tblHolidays]
		   SET [DateFrom] = @DateFrom
			  ,[DateTo] = @DateTo
			  ,[Purpose] = @Purpose
		 WHERE HolidayID =@HolidayID 
		 
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
		
COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

go


create proc spGetHolidayInfoByID
@HolidayID nvarchar(50)

as

begin
		SELECT [HolidayID]
			  ,[DateFrom]
			  ,[DateTo]
			  ,[Purpose]
		  FROM [dbo].[tblHolidays] where [HolidayID]=@HolidayID 
end


go 


create proc spGetHolidayList
as

SELECT [HolidayID]
      ,convert(nvarchar,[DateFrom],106) [DateFrom]
      ,convert(nvarchar,[DateTo],106) [DateTo]
      ,[Purpose]
  FROM [dbo].[tblHolidays]

go


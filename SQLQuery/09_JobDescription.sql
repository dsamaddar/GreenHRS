
-- drop table tblJobDescription
Create table tblJobDescription(
JobDescriptionID nvarchar(50) Primary key,
JobDescriptionNo nvarchar(50) unique(JobDescriptionNo),
JobTitle nvarchar(500),
LastModifiedDate datetime,
JDGoal nvarchar(500),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO


-- drop table tblKeyResponsibilityType

Create table tblKeyResponsibilityType(
KeyResTypeID nvarchar(50) Primary key,
KeyResponsibilityTypeName nvarchar(100),
isActive bit,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);
GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentKeyResTypeID',0)

GO



-- drop proc spInsertKeyResponsibilityType
Create proc [dbo].[spInsertKeyResponsibilityType]
@KeyResTypeName nvarchar(200),
@IsActive bit,
@EntryBy nvarchar(50)
as
begin
	Declare @KeyResTypeID nvarchar(50)
	Declare @CurrentKeyResTypeID numeric(18,0)
	Declare @KeyResTypeIDPrefix as nvarchar(8)

	set @KeyResTypeIDPrefix='Key-Res-'

begin tran
	
	select @CurrentKeyResTypeID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentKeyResTypeID'
	
	set @CurrentKeyResTypeID=isnull(@CurrentKeyResTypeID,0)+1
	Select @KeyResTypeID=dbo.generateID(@KeyResTypeIDPrefix,@CurrentKeyResTypeID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblKeyResponsibilityType(KeyResTypeID,KeyResponsibilityTypeName,IsActive,EntryBy)
	Values(@KeyResTypeID,@KeyResTypeName,@IsActive,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentKeyResTypeID where PropertyName='CurrentKeyResTypeID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end


GO

Create proc spGetKeyResponsibilityList
as
begin
	Select Distinct KeyResTypeID,KeyResponsibilityTypeName from tblKeyResponsibilityType Where IsActive=1
	Order by KeyResponsibilityTypeName
end

Go


-- drop table tblKeyResponsibilityDetail

Create table tblKeyResponsibilityDetail(
JobDescriptionDetailID nvarchar(50) Primary key,
JobDescriptionID nvarchar(50) foreign key references tblJobDescription(JobDescriptionID),
KeyResTypeID nvarchar(50) foreign key references tblKeyResponsibilityType(KeyResTypeID),
JobDetail nvarchar(500),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

-- drop table tblJobDescriptionException

Create table tblJobDescriptionException(
JobDescriptionExcpID nvarchar(50) Primary key,
JobDescriptionID nvarchar(50) foreign key references tblJobDescription(JobDescriptionID),
ExceptionDetail nvarchar(500),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);


-- drop table tblKPI


Create table tblKPI(
KPIID nvarchar(50) Primary key,
JobDescriptionID nvarchar(50) foreign key references tblJobDescription(JobDescriptionID),
KPIDetail nvarchar(500),
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);
GO

-- drop table tblUserAcceptanceJD


Create table tblUserAcceptanceJD(
UserAcptJDID nvarchar(50) Primary key,
JobDescriptionID nvarchar(50) foreign key references tblJobDescription(JobDescriptionID),
EmployeeID nvarchar(50) foreign key references tblEmployeeInfo(EmployeeID),
EntryDate datetime default getdate()
);



create proc [dbo].[spInsertJobDescription]
@JobDescriptionNo nvarchar(50),
@JobTitle nvarchar(500),
@LastModifiedDate datetime,
@JDGoal nvarchar(500),
@UserID nvarchar(50),
@KeyResponsibilityParts as nvarchar(4000),
@ExceptionParts as nvarchar(4000),
@KPIParts as nvarchar(4000)

as

begin
	Declare @JDID nvarchar(50)
	Declare @CurrentJDID numeric(18,0)
	Declare @JDIDPrefix as nvarchar(3)
	
	Declare @KRID nvarchar(50)
	Declare @CurrentKRID numeric(18,0)
	Declare @KRIDPrefix as nvarchar(3)
	
	
	Declare @ExcpID nvarchar(50)
	Declare @CurrentExcpID numeric(18,0)
	Declare @ExcpIDPrefix as nvarchar(3)
	
	Declare @KPIID nvarchar(50)
	Declare @CurrentKPIID numeric(18,0)
	Declare @KPIIDPrefix as nvarchar(4)
	
	
	Declare @RestKeyResponsibilityParts as nvarchar(4000)
	Declare @CurrentKeyResponsibilityParts as nvarchar(4000)
	Declare @IndexKeyResponsibility as int
	Declare @RestPortionKeyResponsibility as nvarchar(1000)
	declare @KeyResTypeID as varchar(50)
	declare @JobDetail as varchar(500)
	
	
	Declare @RestExceptionParts as nvarchar(4000)
	Declare @CurrentExceptionParts as nvarchar(4000)
	Declare @IndexException as int
	Declare @RestPortionException as nvarchar(1000)
	Declare @ExceptionDetail as varchar(500)
	
	
	Declare @RestKPIParts as nvarchar(4000)
	Declare @CurrentKPIParts as nvarchar(4000)
	Declare @IndexKPI as int
	Declare @RestPortionKPI as nvarchar(1000)
	Declare @KPIDetail as varchar(500)
	

	set @JDIDPrefix='JD-'
	set @KRIDPrefix='KR-'
	set @ExcpIDPrefix='EX-'
	set @KPIIDPrefix='KPI-'
	
	begin tran
	
		select @CurrentJDID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentJDID'
		set @CurrentJDID=isnull(@CurrentJDID,0)+1
		Select @JDID=dbo.generateID(@JDIDPrefix,@CurrentJDID,8)		
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
		
		
		INSERT INTO [dbo].[tblJobDescription]
           ([JobDescriptionID]
           ,[JobDescriptionNo]
           ,[JobTitle]
           ,[LastModifiedDate]
           ,[JDGoal]
           ,[EntryBy])
        VALUES
           (@JDID
           ,@JobDescriptionNo
           ,@JobTitle
           ,@LastModifiedDate
           ,@JDGoal
           ,@UserID)
           
           
           
    set @RestKeyResponsibilityParts=@KeyResponsibilityParts
	
	if @RestKeyResponsibilityParts<>''
		begin
		
		while @RestKeyResponsibilityParts<>''
			begin
			
			select @CurrentKRID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentKRDetailID'
	
				set @CurrentKRID=isnull(@CurrentKRID,0)+1
				Select @KRID=dbo.generateID(@KRIDPrefix,@CurrentKRID,8)		
				IF (@@ERROR <> 0) GOTO ERR_HANDLER
				
				
				set @IndexKeyResponsibility=CHARINDEX('|',@RestKeyResponsibilityParts)
				set @CurrentKeyResponsibilityParts=substring(@RestKeyResponsibilityParts,1,@IndexKeyResponsibility-1)
				set @RestKeyResponsibilityParts=substring(@RestKeyResponsibilityParts,@IndexKeyResponsibility+1,len(@RestKeyResponsibilityParts))	


				set @RestPortionKeyResponsibility=@CurrentKeyResponsibilityParts

				set @IndexKeyResponsibility=CHARINDEX('~',@RestPortionKeyResponsibility)		
				set @KeyResTypeID=substring(@RestPortionKeyResponsibility,1,@IndexKeyResponsibility-1)
				set @RestPortionKeyResponsibility=substring(@RestPortionKeyResponsibility,@IndexKeyResponsibility+1,len(@RestPortionKeyResponsibility))		

				set @IndexKeyResponsibility=CHARINDEX('~',@RestPortionKeyResponsibility)		
				set @JobDetail=substring(@RestPortionKeyResponsibility,1,@IndexKeyResponsibility-1)
				set @RestPortionKeyResponsibility=substring(@RestPortionKeyResponsibility,@IndexKeyResponsibility+1,len(@RestPortionKeyResponsibility))
			
			
				
			INSERT INTO [dbo].[tblKeyResponsibilityDetail]
				   ([JobDescriptionDetailID]
				   ,[JobDescriptionID]
				   ,[KeyResTypeID]
				   ,[JobDetail])
			 VALUES
				   (@KRID
				   ,@JDID
				   ,@KeyResTypeID
				   ,@JobDetail)


		   update tblAppSettings set PropertyValue=@CurrentKRID where PropertyName='CurrentKRDetailID'
			IF (@@ERROR <> 0) GOTO ERR_HANDLER


			end
		end
	
	set @RestExceptionParts=@ExceptionParts
	
	if @RestExceptionParts<>''
		begin
		
		while @RestExceptionParts<>''
			begin
			
			select @CurrentExcpID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentJDExceptionID'
	
				set @CurrentExcpID=isnull(@CurrentExcpID,0)+1
				Select @ExcpID=dbo.generateID(@ExcpIDPrefix,@CurrentExcpID,8)		
				IF (@@ERROR <> 0) GOTO ERR_HANDLER
				
				
				set @IndexException=CHARINDEX('|',@RestExceptionParts)
				set @CurrentExceptionParts=substring(@RestExceptionParts,1,@IndexException-1)
				set @RestExceptionParts=substring(@RestExceptionParts,@IndexException+1,len(@RestExceptionParts))	


				set @RestPortionException=@CurrentExceptionParts


				set @IndexException=CHARINDEX('~',@RestPortionException)		
				set @ExceptionDetail=substring(@RestPortionException,1,@IndexException-1)
				set @RestPortionException=substring(@RestPortionException,@IndexException+1,len(@RestPortionException))
			
			
				
			INSERT INTO [dbo].tblJobDescriptionException
				   (JobDescriptionExcpID
				   ,[JobDescriptionID]
				   ,ExceptionDetail)
			 VALUES
				   (@ExcpID
				   ,@JDID
				   ,@ExceptionDetail)


		   update tblAppSettings set PropertyValue=@CurrentKRID where PropertyName='CurrentJDExceptionID'
			IF (@@ERROR <> 0) GOTO ERR_HANDLER


			end
		end	
	
	set @RestKPIParts=@KPIParts
	
	if @RestKPIParts<>''
		begin
		
		while @RestKPIParts<>''
			begin
			
			select @CurrentKPIID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentKPIID'
	
				set @CurrentKPIID=isnull(@CurrentKPIID,0)+1
				Select @KPIID=dbo.generateID(@KPIIDPrefix,@CurrentKPIID,8)		
				IF (@@ERROR <> 0) GOTO ERR_HANDLER
				
				
				set @IndexKPI=CHARINDEX('|',@RestKPIParts)
				set @CurrentKPIParts=substring(@RestKPIParts,1,@IndexKPI-1)
				set @RestKPIParts=substring(@RestKPIParts,@IndexKPI+1,len(@RestKPIParts))	


				set @RestPortionKPI=@CurrentKPIParts


				set @IndexKPI=CHARINDEX('~',@RestPortionKPI)		
				set @KPIDetail=substring(@RestPortionKPI,1,@IndexKPI-1)
				set @RestPortionKPI=substring(@RestPortionKPI,@IndexKPI+1,len(@RestPortionKPI))
			
			
			
			INSERT INTO [dbo].[tblKPI]
				   ([KPIID]
				   ,[JobDescriptionID]
				   ,[KPIDetail]
				   ,[EntryBy])
			 VALUES
				   (@KPIID
				   ,@JDID
				   ,@KPIDetail
				   ,@UserID)
		

		   update tblAppSettings set PropertyValue=@CurrentKPIID where PropertyName='CurrentKPIID'
			IF (@@ERROR <> 0) GOTO ERR_HANDLER

			end
		end		
	
	
	update tblAppSettings set PropertyValue=@CurrentJDID where PropertyName='CurrentJDID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER	

	COMMIT TRAN
	RETURN 0

	ERR_HANDLER:
	ROLLBACK TRAN
	RETURN 1
end


insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentJDID',0)

GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentKRDetailID',0)

GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentJDExceptionID',0)

GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentKPIID',0)

GO


create proc spGetJobDescriptionByID
@JDID nvarchar(50)

as

begin
	SELECT [JobDescriptionID]
      ,[JobDescriptionNo]
      ,[JobTitle]
      ,[LastModifiedDate]
      ,[JDGoal]
  FROM [dbo].[tblJobDescription] where [JobDescriptionID]=@JDID

end


create proc spGetKeyResponsibility
@JDID nvarchar(50)

as

begin

	SELECT [JobDescriptionDetailID]
      ,[JobDescriptionID]
      ,[KeyResTypeID]
      ,(select KeyResponsibilityTypeName from dbo.tblKeyResponsibilityType where
      KeyResTypeID=[tblKeyResponsibilityDetail].KeyResTypeID) KeyResponsibilityTypeName
      ,[JobDetail]
  FROM [dbo].[tblKeyResponsibilityDetail] where [JobDescriptionID]=@JDID 

end


create proc spGetJDException
@JDID nvarchar(50)

as

begin

	SELECT [JobDescriptionExcpID]
      ,[JobDescriptionID]
      ,[ExceptionDetail]
		FROM [dbo].[tblJobDescriptionException]
	where [JobDescriptionID]=@JDID 

end


create proc spGetJDKPI
@JDID nvarchar(50)
as
begin
	SELECT [KPIID]
      ,[KPIDetail]
      ,[EntryBy]
      ,[EntryDate]
    FROM [dbo].[tblKPI] where [JobDescriptionID]=@JDID 
end



create proc spGetJobDescriptionInfo
as
begin
SELECT [JobDescriptionID]
      ,[JobDescriptionNo]
      ,[JobTitle]
  FROM [dbo].[tblJobDescription]

end


create proc spGetJDException
@JDID nvarchar(50)

as

begin

	SELECT [JobDescriptionExcpID]
      ,[JobDescriptionID]
      ,[ExceptionDetail]
		FROM [dbo].[tblJobDescriptionException]
	where [JobDescriptionID]=@JDID 

end



CREATE proc [dbo].[spUpdateInsertJobDescription]
@JDID nvarchar(50),
@JobDescriptionNo nvarchar(50),
@JobTitle nvarchar(500),
@LastModifiedDate datetime,
@JDGoal nvarchar(500),
@KeyResponsibilityParts as nvarchar(4000),
@ExceptionParts as nvarchar(4000),
@KPIParts as nvarchar(4000)

as

begin
	
	Declare @KRID nvarchar(50)
	Declare @CurrentKRID numeric(18,0)
	Declare @KRIDPrefix as nvarchar(3)
	
	
	Declare @ExcpID nvarchar(50)
	Declare @CurrentExcpID numeric(18,0)
	Declare @ExcpIDPrefix as nvarchar(3)
	
	Declare @KPIID nvarchar(50)
	Declare @CurrentKPIID numeric(18,0)
	Declare @KPIIDPrefix as nvarchar(4)
	
	
	Declare @RestKeyResponsibilityParts as nvarchar(4000)
	Declare @CurrentKeyResponsibilityParts as nvarchar(4000)
	Declare @IndexKeyResponsibility as int
	Declare @RestPortionKeyResponsibility as nvarchar(1000)
	declare @KeyResTypeID as varchar(50)
	declare @JobDetail as varchar(500)
	
	
	Declare @RestExceptionParts as nvarchar(4000)
	Declare @CurrentExceptionParts as nvarchar(4000)
	Declare @IndexException as int
	Declare @RestPortionException as nvarchar(1000)
	Declare @ExceptionDetail as varchar(500)
	
	
	Declare @RestKPIParts as nvarchar(4000)
	Declare @CurrentKPIParts as nvarchar(4000)
	Declare @IndexKPI as int
	Declare @RestPortionKPI as nvarchar(1000)
	Declare @KPIDetail as varchar(500)
	

	set @KRIDPrefix='KR-'
	set @ExcpIDPrefix='EX-'
	set @KPIIDPrefix='KPI-'
	
	begin tran
	
		
		UPDATE [dbo].[tblJobDescription]
		   SET [JobDescriptionNo] = @JobDescriptionNo
			  ,[JobTitle] = @JobTitle
			  ,[LastModifiedDate] = @LastModifiedDate
			  ,[JDGoal] = @JDGoal
		 WHERE [JobDescriptionID]=@JDID


   delete from  [tblKeyResponsibilityDetail] where JobDescriptionID =@JDID        
           
    set @RestKeyResponsibilityParts=@KeyResponsibilityParts
	
	if @RestKeyResponsibilityParts<>''
		begin
		
		while @RestKeyResponsibilityParts<>''
			begin
			
			select @CurrentKRID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentKRDetailID'
	
				set @CurrentKRID=isnull(@CurrentKRID,0)+1
				Select @KRID=dbo.generateID(@KRIDPrefix,@CurrentKRID,8)		
				IF (@@ERROR <> 0) GOTO ERR_HANDLER
				
				
				set @IndexKeyResponsibility=CHARINDEX('|',@RestKeyResponsibilityParts)
				set @CurrentKeyResponsibilityParts=substring(@RestKeyResponsibilityParts,1,@IndexKeyResponsibility-1)
				set @RestKeyResponsibilityParts=substring(@RestKeyResponsibilityParts,@IndexKeyResponsibility+1,len(@RestKeyResponsibilityParts))	


				set @RestPortionKeyResponsibility=@CurrentKeyResponsibilityParts

				set @IndexKeyResponsibility=CHARINDEX('~',@RestPortionKeyResponsibility)		
				set @KeyResTypeID=substring(@RestPortionKeyResponsibility,1,@IndexKeyResponsibility-1)
				set @RestPortionKeyResponsibility=substring(@RestPortionKeyResponsibility,@IndexKeyResponsibility+1,len(@RestPortionKeyResponsibility))		

				set @IndexKeyResponsibility=CHARINDEX('~',@RestPortionKeyResponsibility)		
				set @JobDetail=substring(@RestPortionKeyResponsibility,1,@IndexKeyResponsibility-1)
				set @RestPortionKeyResponsibility=substring(@RestPortionKeyResponsibility,@IndexKeyResponsibility+1,len(@RestPortionKeyResponsibility))
			
			
				
			INSERT INTO [dbo].[tblKeyResponsibilityDetail]
				   ([JobDescriptionDetailID]
				   ,[JobDescriptionID]
				   ,[KeyResTypeID]
				   ,[JobDetail])
			 VALUES
				   (@KRID
				   ,@JDID
				   ,@KeyResTypeID
				   ,@JobDetail)


		   update tblAppSettings set PropertyValue=@CurrentKRID where PropertyName='CurrentKRDetailID'
			IF (@@ERROR <> 0) GOTO ERR_HANDLER


			end
		end
		
	delete from tblJobDescriptionException where JobDescriptionID =@JDID 	
		
	
	set @RestExceptionParts=@ExceptionParts
	
	if @RestExceptionParts<>''
		begin
		
		while @RestExceptionParts<>''
			begin
			
			select @CurrentExcpID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentJDExceptionID'
	
				set @CurrentExcpID=isnull(@CurrentExcpID,0)+1
				Select @ExcpID=dbo.generateID(@ExcpIDPrefix,@CurrentExcpID,8)		
				IF (@@ERROR <> 0) GOTO ERR_HANDLER
				
				
				set @IndexException=CHARINDEX('|',@RestExceptionParts)
				set @CurrentExceptionParts=substring(@RestExceptionParts,1,@IndexException-1)
				set @RestExceptionParts=substring(@RestExceptionParts,@IndexException+1,len(@RestExceptionParts))	


				set @RestPortionException=@CurrentExceptionParts


				set @IndexException=CHARINDEX('~',@RestPortionException)		
				set @ExceptionDetail=substring(@RestPortionException,1,@IndexException-1)
				set @RestPortionException=substring(@RestPortionException,@IndexException+1,len(@RestPortionException))
			
			
				
			INSERT INTO [dbo].tblJobDescriptionException
				   (JobDescriptionExcpID
				   ,[JobDescriptionID]
				   ,ExceptionDetail)
			 VALUES
				   (@ExcpID
				   ,@JDID
				   ,@ExceptionDetail)


		   update tblAppSettings set PropertyValue=@CurrentKRID where PropertyName='CurrentJDExceptionID'
			IF (@@ERROR <> 0) GOTO ERR_HANDLER


			end
		end	
		
	delete from [tblKPI] where JobDescriptionID =@JDID 	
	
	set @RestKPIParts=@KPIParts
	
	if @RestKPIParts<>''
		begin
		
		while @RestKPIParts<>''
			begin
			
			select @CurrentKPIID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentKPIID'
	
				set @CurrentKPIID=isnull(@CurrentKPIID,0)+1
				Select @KPIID=dbo.generateID(@KPIIDPrefix,@CurrentKPIID,8)		
				IF (@@ERROR <> 0) GOTO ERR_HANDLER
				
				
				set @IndexKPI=CHARINDEX('|',@RestKPIParts)
				set @CurrentKPIParts=substring(@RestKPIParts,1,@IndexKPI-1)
				set @RestKPIParts=substring(@RestKPIParts,@IndexKPI+1,len(@RestKPIParts))	


				set @RestPortionKPI=@CurrentKPIParts


				set @IndexKPI=CHARINDEX('~',@RestPortionKPI)		
				set @KPIDetail=substring(@RestPortionKPI,1,@IndexKPI-1)
				set @RestPortionKPI=substring(@RestPortionKPI,@IndexKPI+1,len(@RestPortionKPI))
			
			
			
			INSERT INTO [dbo].[tblKPI]
				   ([KPIID]
				   ,[JobDescriptionID]
				   ,[KPIDetail]
				   )
			 VALUES
				   (@KPIID
				   ,@JDID
				   ,@KPIDetail
				   )
		

		   update tblAppSettings set PropertyValue=@CurrentKPIID where PropertyName='CurrentKPIID'
			IF (@@ERROR <> 0) GOTO ERR_HANDLER

			end
		end		
	select @JDID
	
	COMMIT TRAN
	RETURN 0

	ERR_HANDLER:
	ROLLBACK TRAN
	RETURN 1
end


insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentAcceptedJDID',0)
GO




CREATE proc [dbo].[spInsertJDAcceptance]
@JobDescriptionID nvarchar(50),
@EmployeeID nvarchar(50)
as
begin
	Declare @AccJDID nvarchar(50)
	Declare @CurrentJDID numeric(18,0)
	Declare @JDIDPrefix as nvarchar(7)

	set @JDIDPrefix='Acc-JD-'

begin tran
	
	select @CurrentJDID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentAcceptedJDID'
	
	set @CurrentJDID=isnull(@CurrentJDID,0)+1
	Select @AccJDID=dbo.generateID(@JDIDPrefix,@CurrentJDID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	INSERT INTO [dbo].[tblUserAcceptanceJD]
           ([UserAcptJDID]
           ,[JobDescriptionID]
           ,[EmployeeID]
           )
     VALUES
           (@AccJDID
           ,@JobDescriptionID
           ,@EmployeeID
           )


	update tblAppSettings set PropertyValue=@CurrentJDID where PropertyName='CurrentAcceptedJDID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end


-------------------------------------------------------


CREATE function [dbo].[fnGetModifiedDate](@JDID nvarchar(50))
returns nvarchar(200)
as
begin
	Declare @ModifiedDate nvarchar(200)
	Select @ModifiedDate=convert(varchar,LastModifiedDate,106) from dbo.tblJobDescription 
	Where JobDescriptionID=@JDID

	return @ModifiedDate
end


----------------------------------------------------

--create proc spGetCurrentJD
--@EmployeeID nvarchar(50)
--as
--select JDno JobDescriptionID,(tblJobDescription.JobDescriptionNo+'('+JobTitle+')' ) JDName,
--convert(varchar,LastModifiedDate,106) LastModifiedDate,
--isnull(convert(nvarchar,tblUserAcceptanceJD.EntryDate,106),'Yet not Accepted') AcceptedDate
--from dbo.tblEmployeeInfo inner join dbo.tblJobDescription
--on dbo.tblJobDescription.JobDescriptionID=tblEmployeeInfo.JDno
--left join dbo.tblUserAcceptanceJD on dbo.tblUserAcceptanceJD.JobDescriptionID=tblEmployeeInfo.JDno
--where tblEmployeeInfo.EmployeeID=@EmployeeID


CREATE proc spShowCurrentJD
@EmployeeID nvarchar(50)
as
begin
	Declare @CurrentJD as nvarchar(50)
	Declare @AcceptedDate as nvarchar(20)
	Select @CurrentJD = JDno from tblEmployeeInfo Where EmployeeID=@EmployeeID
	
	if exists(Select * from tblUserAcceptanceJD Where JobDescriptionID=@CurrentJD And EmployeeID=@EmployeeID )
	begin
		Select @AcceptedDate = CONVERT(nvarchar,EntryDate,106) from tblUserAcceptanceJD Where JobDescriptionID=@CurrentJD And EmployeeID=@EmployeeID
	end
	else Set @AcceptedDate =  'Not Yet Accepted' 
	
	select JDno JobDescriptionID,(tblJobDescription.JobDescriptionNo+'('+JobTitle+')' ) JDName,
	convert(varchar,LastModifiedDate,106) LastModifiedDate, @AcceptedDate AcceptedDate
	
	from tblEmployeeInfo inner join tblJobDescription on tblJobDescription.JobDescriptionID=tblEmployeeInfo.JDno
	where tblEmployeeInfo.EmployeeID=@EmployeeID 
end

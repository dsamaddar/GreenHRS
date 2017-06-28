
Create table tblDocumentType(
DocTypeID nvarchar(50) primary key,
DocumentType nvarchar(200) unique(DocumentType),
IsMandatory bit default 0,
IsActive bit default 1,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentDocTypeID',0)

GO

-- drop proc spInsertDocumentType
create proc spInsertDocumentType
@DocumentType nvarchar(200),
@IsMandatory bit,
@IsActive bit,
@EntryBy nvarchar(50)
as
begin

	Declare @DocTypeID as nvarchar(50)
	Declare @CurrentDocTypeID numeric(18,0)
	Declare @DocTypeIDPrefix as nvarchar(9)

	set @DocTypeIDPrefix='DOC-TYPE-'

begin tran
	
	select @CurrentDocTypeID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentDocTypeID'
	
	set @CurrentDocTypeID=isnull(@CurrentDocTypeID,0)+1
	Select @DocTypeID=dbo.generateID(@DocTypeIDPrefix,@CurrentDocTypeID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
	insert into tblDocumentType(DocTypeID,DocumentType,IsMandatory,IsActive,EntryBy)
	values(@DocTypeID,@DocumentType,@IsMandatory,@IsActive,@EntryBy)

	update tblAppSettings set PropertyValue=@CurrentDocTypeID where PropertyName='CurrentDocTypeID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

-- drop proc spShowDocumentType
create proc spShowDocumentType
as
begin
	Select DocTypeID,DocumentType from tblDocumentType
	order by DocumentType
end

GO

-- drop proc spGetMandatoryDocumentType
create proc spGetMandatoryDocumentType
@DocTypeIDStr nvarchar(1000)
as
begin
	Select DocumentType from tblDocumentType Where IsMandatory=1
	and @DocTypeIDStr not like  '%|'+DocTypeID+'|%'
end

GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentDocumentID',0)

GO

-- drop table tblUserDocuments
Create table tblUserDocuments(
DocumentID nvarchar(50),
DocTypeID nvarchar(50) foreign key references tblDocumentType(DocTypeID),
UniqueUserID nvarchar(50),
DocumentName nvarchar(200),
FileName nvarchar(200),
UploadedBy nvarchar(50),
UploadedDate datetime default getdate()
);

GO

-- drop proc spInsertUserDocuments
create proc spInsertUserDocuments
@Documents nvarchar(4000),
@UniqueUserID nvarchar(50),
@UploadedBy nvarchar(50)
as
begin
	Declare @CurrentDocumentsID as bigint
	Declare @DocumentID as nvarchar(50)
	Declare @DocumentsPrefix as nvarchar(4)
	Declare @CurrentDocuments as nvarchar(200)	
	Declare @RestDocuments as nvarchar(4000)
	Declare @Title as nvarchar(50)
	Declare @FileName as nvarchar(50)

	Declare @Index as int
	Declare @RestPortion as nvarchar(4000)
	
	declare @Todate datetime	
	set @Todate=getdate()
	
	Declare @DocTypeID as nvarchar(50)

begin tran

	Select @CurrentDocumentsID=PropertyValue from tblAppSettings where PropertyName='CurrentDocumentID'
	set @CurrentDocumentsID=isnull(@CurrentDocumentsID,0)+1
	set @DocumentsPrefix='DOC-'
	Select @DocumentID = dbo.generateID(@DocumentsPrefix,@CurrentDocumentsID,8)		

	set @RestDocuments=@Documents
	while @RestDocuments<>''
	begin
		set @Index=CHARINDEX('|',@RestDocuments)
		set @CurrentDocuments=substring(@RestDocuments,1,@Index-1)
		set @RestDocuments=substring(@RestDocuments,@Index+1,len(@RestDocuments))		

		set @RestPortion=@CurrentDocuments

		set @Index=CHARINDEX('~',@RestPortion)		
		set @Title=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))		

		set @Index=CHARINDEX('~',@RestPortion)		
		set @FileName=substring(@RestPortion,1,@Index-1)
		set @RestPortion=substring(@RestPortion,@Index+1,len(@RestPortion))	

		set @Index=CHARINDEX('~',@RestPortion)		
		set @DocTypeID=substring(@RestPortion,1,@Index-1)
		
		set @CurrentDocumentsID=@CurrentDocumentsID+1
		Select @DocumentID=dbo.generateID(@DocumentsPrefix,@CurrentDocumentsID,8)

		INSERT INTO tblUserDocuments(DocumentID,DocTypeID,UniqueUserID, DocumentName,[FileName],UploadedBy,UploadedDate)
		VALUES(@DocumentID,@DocTypeID,@UniqueUserID,@Title,@FileName,@UploadedBy,@Todate)	
		IF (@@ERROR <> 0) GOTO ERR_HANDLER
		
		set @CurrentDocumentsID=@CurrentDocumentsID + 1
		Select @DocumentID = dbo.generateID(@DocumentsPrefix,@CurrentDocumentsID,8)	
		
	end

	update tblAppSettings set PropertyValue=@CurrentDocumentsID where PropertyName='CurrentDocumentID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
IF (@@ERROR <> 0) GOTO ERR_HANDLER
	
commit tran
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

-- drop proc spGetUserDocuments
create proc spGetUserDocuments
@UniqueUserID nvarchar(50)
as
begin
	Select DocumentName,
	(Select DocumentType from tblDocumentType Where tblDocumentType.DocTypeID=tblUserDocuments.DocTypeID) as DocTypeName,
	FileName,DocTypeID from	tblUserDocuments
	where UniqueUserID=@UniqueUserID
end



GO
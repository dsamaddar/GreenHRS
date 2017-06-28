

-- Create database HRM

GO

-- drop table tblAppSettings
Create table tblAppSettings(
PropertyName nvarchar(50) unique(PropertyName),
PropertyValue nvarchar(500)
);

GO



CREATE    function generateID(@Prefix nvarchar(50),@sl int, @Len int)
returns nvarchar(50)
as
begin
	Declare @SLen as int
	declare @GID as nvarchar(50)

	set @SLen = @Len - len(@sl)
	set @GID=''

	while @SLen>0
	begin
		set @GID=@GID+'0'
		set @SLen=@SLen-1
	end


	set @GID = @Prefix + @GID + convert(nvarchar,@sl)
	
	return @GID
end


GO

-- drop proc spGetEntryPoint
Create proc spGetEntryPoint
as
begin
	Select convert(nvarchar,getdate(),102)+'.'+convert(nvarchar,getdate(),114) as 'EntryPoint'
end

-- exec spGetEntryPoint

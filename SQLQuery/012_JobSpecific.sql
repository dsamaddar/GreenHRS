-- drop proc spShowJobType
Create proc spShowJobType
as
begin
	Select JobTypeID,JobType from tblJobType Where IsActive=1
end

GO


Create proc spShowServiceType
as
begin
	Select ServiceTypeID,ServiceType from tblServiceType Where IsActive=1
end

GO



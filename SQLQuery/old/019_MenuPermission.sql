
Create table tblMenu(
MenuID nvarchar(10) primary key,
MenuName nvarchar(100),
MenuGroupID nvarchar(50),
ViewOrder int
);

GO

Create table tblRole(
RoleID nvarchar(50) primary key,
RoleName nvarchar(50),
isActive bit default 1,
MenuIDs nvarchar(4000),
CreatedBy nvarchar(50),
CreatedDate datetime,
LastUpdatedBy nvarchar(50),
LastUpdatedDate datetime
);

GO

Create table tblUserRole(
SL bigint identity(1,1) primary key,
RoleID nvarchar(50),
EmployeeID nvarchar(50) foreign key references tblEmployeeInfo(EmployeeID),
CreatedBy nvarchar(50),
CreatedDate datetime,
UpdatedBy nvarchar(50),
UpdatedDate datetime
);
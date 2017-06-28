
insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentEmpDesigHistoryID',0)

GO

Create table tblEmpDesigHistory(
EmpDesigHistoryID nvarchar(50) primary key,
EmployeeID nvarchar(50) foreign key references tblEmployeeInfo(EmployeeID),
DesignationID nvarchar(50) foreign key references tblDesignation(DesignationID),
EffectiveFrom datetime,
EffectiveTo datetime,
EffectTaken bit default 0,
EffectBy nvarchar(50),
EffectDate datetime,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

insert into tblAppSettings(PropertyName,PropertyValue)values('CurrentEmpDeptChngHistoryID',0)

GO

Create table tblEmpDeptChngHistory(
EmpDeptChngHistoryID nvarchar(50) primary key,
EmployeeID nvarchar(50) foreign key references tblEmployeeInfo(EmployeeID),
EffectiveFrom datetime,
EffectiveTo datetime,
EffectTaken bit default 0,
EffectBy nvarchar(50),
EffectDate datetime,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO



-- Select * from tblGeneralLoan 

Insert into tblAppSettings(PropertyName,PropertyValue)Values('CurrentGenLoanID',0)

GO

-- drop table tblGeneralLoan
Create table tblGeneralLoan(
GenLoanID nvarchar(50) primary key,
EmployeeID nvarchar(50) foreign key references tblEmployeeInfo(EmployeeID),
LoanAmount numeric(18,2),
ReimbursementDate datetime,
GenLoanType nvarchar(50),
IsInsuranceRequired bit,
Attachment nvarchar(200),
Remarks nvarchar(200),
IsAmortized bit default 0,
AmortizationDate datetime,
EntryBy nvarchar(50),
EntryDate datetime default getdate()
);

GO

alter proc spShowGenLoanInfoByEmp
@EmployeeID nvarchar(50)
as
begin
	Select GenLoanID,EmployeeID,LoanAmount,Convert(nvarchar,ReimbursementDate,106) as 'ReimbursementDate',GenLoanType,
	Case IsInsuranceRequired When 1 Then 'YES' Else 'NO' end as 'IsInsuranceRequired',Attachment,
	Case IsAmortized When 1 Then 'YES' Else 'NO' end as 'IsAmortized',Isnull(Convert(nvarchar,AmortizationDate,106),'N\A') as 'AmortizationDate',
	Remarks,EntryBy 
	from tblGeneralLoan Where EmployeeID=@EmployeeID
end

GO

alter proc spInsertGeneralLoan
@EmployeeID nvarchar(50),
@LoanAmount numeric(18,2),
@ReimbursementDate datetime,
@GenLoanType nvarchar(50),
@IsInsuranceRequired bit,
@Attachment nvarchar(200),
@Remarks nvarchar(200),
@EntryBy nvarchar(50)
as
begin
	Declare @GenLoanID nvarchar(50)
	Declare @CurrentGenLoanID numeric(18,0)
	Declare @GenLoanIDPrefix as nvarchar(3)

	set @GenLoanIDPrefix='GL-'

begin tran
	
	select @CurrentGenLoanID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentGenLoanID'
	
	set @CurrentGenLoanID=isnull(@CurrentGenLoanID,0)+1
	Select @GenLoanID=dbo.generateID(@GenLoanIDPrefix,@CurrentGenLoanID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblGeneralLoan(GenLoanID,EmployeeID,LoanAmount,ReimbursementDate,GenLoanType,IsInsuranceRequired,Attachment,Remarks,EntryBy)
	Values(@GenLoanID,@EmployeeID,@LoanAmount,@ReimbursementDate,@GenLoanType,@IsInsuranceRequired,@Attachment,@Remarks,@EntryBy)
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	update tblAppSettings set PropertyValue=@CurrentGenLoanID where PropertyName='CurrentGenLoanID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end


-- exec spShowAbatementRatio
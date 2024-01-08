
create table `Staff` (
 StaffId int(11) not null,
 FirstName varchar(255)  default null,
 LastName varchar(255)  default null,
 Phone varchar(255)  default null,
 primary key (StaffId)    
) engine=InnoDB default charset=utf8mb4;


create table `SupplierAddress` (
 SupplierAddressId int(11) not null,
 No int(11) not null,
 Street varchar(255)  default null,
 Amphur varchar(255)  default null,
 Province varchar(255)  default null,
 PostalCode varchar(255)  default null,
 primary key (SupplierAddressId)    
) engine=InnoDB default charset=utf8mb4;


create table `Supplier` (
 SupplierId int(11) not null,
 SupplierName varchar(255)  default null,
 SupplierPhone varchar(255)  default null,
 SupplierEmail varchar(255)  default null,
 SupplierAddressId int(11) not null,
 primary key (SupplierId),
 KEY IX_Supplier_SupplierAddressId (SupplierAddressId),
 CONSTRAINT FK_Supplier_SupplierAddress_SupplierAddressId FOREIGN KEY (SupplierAddressId) REFERENCES `SupplierAddress` (SupplierAddressId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Product` (
 ProductId int(11) not null,
 Barcode varchar(255)  default null,
 ProductName varchar(255)  default null,
 ProductDescription varchar(255)  default null,
 ProductType varchar(255)  default null,
 ProductUnit varchar(255)  default null,
 ProductPrice int(11) not null,
 ProductCost int(11) not null,
 ProductMake varchar(255)  default null,
 ProductModelno varchar(255)  default null,
 SupplierId int(11) not null,
 primary key (ProductId),
 KEY IX_Product_SupplierId (SupplierId),
 CONSTRAINT FK_Product_Supplier_SupplierId FOREIGN KEY (SupplierId) REFERENCES `Supplier` (SupplierId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `CheckInItem` (
 CheckInItemId int(11) not null,
 ProductId int(11) not null,
 CheckInQty int(11) not null,
 CheckinId int(11) not null,
 primary key (CheckInItemId),
 KEY IX_CheckInItem_ProductId (ProductId),
 KEY IX_CheckInItem_CheckinId (CheckinId),
 CONSTRAINT FK_CheckInItem_Product_ProductId FOREIGN KEY (ProductId) REFERENCES `Product` (ProductId) ON DELETE CASCADE,
 CONSTRAINT FK_CheckInItem_Checkin_CheckinId FOREIGN KEY (CheckinId) REFERENCES `Checkin` (CheckinId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Checkin` (
 CheckinId int(11) not null,
 CreditTerm int(11) not null,
 CheckInDate datetime not null,
 StaffId int(11) not null,
 primary key (CheckinId),
 KEY IX_Checkin_StaffId (StaffId),
 CONSTRAINT FK_Checkin_Staff_StaffId FOREIGN KEY (StaffId) REFERENCES `Staff` (StaffId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


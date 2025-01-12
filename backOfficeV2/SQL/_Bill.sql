
create table `Permission` (
 PermissionId int(11) not null,
 PermissionName varchar(255)  default null,
 primary key (PermissionId)    
) engine=InnoDB default charset=utf8mb4;


create table `Staff` (
 StaffId int(11) not null,
 StaffFirstname varchar(255)  default null,
 StaffLastname varchar(255)  default null,
 StaffBirthday datetime not null,
 Email varchar(255)  default null,
 Password varchar(255)  default null,
 StaffPhoneNumber varchar(255)  default null,
 PermissionId int(11) not null,
 primary key (StaffId),
 KEY IX_Staff_PermissionId (PermissionId),
 CONSTRAINT FK_Staff_Permission_PermissionId FOREIGN KEY (PermissionId) REFERENCES `Permission` (PermissionId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `ProductName` (
 ProductNameId int(11) not null,
 Name varchar(255)  default null,
 primary key (ProductNameId)    
) engine=InnoDB default charset=utf8mb4;


create table `ShoeSize` (
 ShoeSizeId int(11) not null,
 SizeType varchar(255)  default null,
 SizeNumber double not null,
 primary key (ShoeSizeId)    
) engine=InnoDB default charset=utf8mb4;


create table `Brand` (
 BrandId int(11) not null,
 BrandName varchar(255)  default null,
 BrandLogoUrl varchar(255)  default null,
 primary key (BrandId)    
) engine=InnoDB default charset=utf8mb4;


create table `Product` (
 ProductId int(11) not null,
 Barcode varchar(255)  default null,
 ProductNameId int(11) not null,
 ProductImagePath varchar(255)  default null,
 CostPrice int(11) not null,
 SellingPrice int(11) not null,
 Sku varchar(255)  default null,
 ShoeSizeId int(11) not null,
 BrandId int(11) not null,
 ConditionDescription varchar(255)  default null,
 BoxDescription varchar(255)  default null,
 primary key (ProductId),
 KEY IX_Product_ProductNameId (ProductNameId),
 KEY IX_Product_ShoeSizeId (ShoeSizeId),
 KEY IX_Product_BrandId (BrandId),
 CONSTRAINT FK_Product_ProductName_ProductNameId FOREIGN KEY (ProductNameId) REFERENCES `ProductName` (ProductNameId) ON DELETE CASCADE,
 CONSTRAINT FK_Product_ShoeSize_ShoeSizeId FOREIGN KEY (ShoeSizeId) REFERENCES `ShoeSize` (ShoeSizeId) ON DELETE CASCADE,
 CONSTRAINT FK_Product_Brand_BrandId FOREIGN KEY (BrandId) REFERENCES `Brand` (BrandId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `BillItem` (
 BillItemId int(11) not null,
 ProductId int(11) not null,
 BillId int(11) not null,
 primary key (BillItemId),
 KEY IX_BillItem_ProductId (ProductId),
 KEY IX_BillItem_BillId (BillId),
 CONSTRAINT FK_BillItem_Product_ProductId FOREIGN KEY (ProductId) REFERENCES `Product` (ProductId) ON DELETE CASCADE,
 CONSTRAINT FK_BillItem_Bill_BillId FOREIGN KEY (BillId) REFERENCES `Bill` (BillId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Bill` (
 BillId int(11) not null,
 OrderDate datetime not null,
 DepositMoney int(11) not null,
 IsTransfer int(11) not null,
 AmountPay int(11) not null,
 StaffId int(11) not null,
 primary key (BillId),
 KEY IX_Bill_StaffId (StaffId),
 CONSTRAINT FK_Bill_Staff_StaffId FOREIGN KEY (StaffId) REFERENCES `Staff` (StaffId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


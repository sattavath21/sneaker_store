
create table `CustomerAddress` (
 CustomerAddressId int(11) not null,
 No varchar(255)  default null,
 Street varchar(255)  default null,
 City varchar(255)  default null,
 Zip varchar(255)  default null,
 primary key (CustomerAddressId)    
) engine=InnoDB default charset=utf8mb4;


create table `Customer` (
 CustomerId int(11) not null,
 FirstName varchar(255)  default null,
 LastName varchar(255)  default null,
 DateOfBirth datetime not null,
 Phone varchar(255)  default null,
 Email varchar(255)  default null,
 CustomerAddressId int(11) not null,
 primary key (CustomerId),
 KEY IX_Customer_CustomerAddressId (CustomerAddressId),
 CONSTRAINT FK_Customer_CustomerAddress_CustomerAddressId FOREIGN KEY (CustomerAddressId) REFERENCES `CustomerAddress` (CustomerAddressId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Discount` (
 DiscountId int(11) not null,
 AppliesTo varchar(255)  default null,
 Description varchar(255)  default null,
 DiscountPercentage double not null,
 primary key (DiscountId)    
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


create table `SaleItem` (
 SaleItemId int(11) not null,
 SaleQty int(11) not null,
 DiscountId int(11) not null,
 ProductId int(11) not null,
 SaleId int(11) not null,
 primary key (SaleItemId),
 KEY IX_SaleItem_DiscountId (DiscountId),
 KEY IX_SaleItem_ProductId (ProductId),
 KEY IX_SaleItem_SaleId (SaleId),
 CONSTRAINT FK_SaleItem_Discount_DiscountId FOREIGN KEY (DiscountId) REFERENCES `Discount` (DiscountId) ON DELETE CASCADE,
 CONSTRAINT FK_SaleItem_Product_ProductId FOREIGN KEY (ProductId) REFERENCES `Product` (ProductId) ON DELETE CASCADE,
 CONSTRAINT FK_SaleItem_Sale_SaleId FOREIGN KEY (SaleId) REFERENCES `Sale` (SaleId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Sale` (
 SaleId int(11) not null,
 Date datetime not null,
 CustomerId int(11) not null,
 primary key (SaleId),
 KEY IX_Sale_CustomerId (CustomerId),
 CONSTRAINT FK_Sale_Customer_CustomerId FOREIGN KEY (CustomerId) REFERENCES `Customer` (CustomerId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


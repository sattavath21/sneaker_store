
create table `OrderStatus` (
 OrderStatusId int(11) not null,
 StatusName varchar(255)  default null,
 primary key (OrderStatusId)    
) engine=InnoDB default charset=utf8mb4;


create table `ShippingMethod` (
 ShippingMethodId int(11) not null,
 MethodName varchar(255)  default null,
 primary key (ShippingMethodId)    
) engine=InnoDB default charset=utf8mb4;


create table `CustomerTransferPic` (
 CustomerTransferPicId int(11) not null,
 PicPath varchar(255)  default null,
 primary key (CustomerTransferPicId)    
) engine=InnoDB default charset=utf8mb4;


create table `ShippingMethod` (
 ShippingMethodId int(11) not null,
 MethodName varchar(255)  default null,
 primary key (ShippingMethodId)    
) engine=InnoDB default charset=utf8mb4;


create table `Discount` (
 DiscountId int(11) not null,
 MinSpend int(11) not null,
 Start datetime not null,
 Duration int(11) not null,
 Amount int(11) not null,
 ShippingMethodId int(11) not null,
 Description varchar(255)  default null,
 primary key (DiscountId),
 KEY IX_Discount_ShippingMethodId (ShippingMethodId),
 CONSTRAINT FK_Discount_ShippingMethod_ShippingMethodId FOREIGN KEY (ShippingMethodId) REFERENCES `ShippingMethod` (ShippingMethodId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `DeliveryService` (
 DeliveryServiceId int(11) not null,
 DeliveryCompanyName varchar(255)  default null,
 primary key (DeliveryServiceId)    
) engine=InnoDB default charset=utf8mb4;


create table `BranchTelNumber` (
 BranchTelNumberId int(11) not null,
 TelNumber varchar(255)  default null,
 DeliveryBranchId int(11) not null,
 primary key (BranchTelNumberId),
 KEY IX_BranchTelNumber_DeliveryBranchId (DeliveryBranchId),
 CONSTRAINT FK_BranchTelNumber_DeliveryBranch_DeliveryBranchId FOREIGN KEY (DeliveryBranchId) REFERENCES `DeliveryBranch` (DeliveryBranchId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `BranchAddress` (
 BranchAddressId int(11) not null,
 Province varchar(255)  default null,
 City varchar(255)  default null,
 Village varchar(255)  default null,
 AddressDetail varchar(255)  default null,
 primary key (BranchAddressId)    
) engine=InnoDB default charset=utf8mb4;


create table `DeliveryBranch` (
 DeliveryBranchId int(11) not null,
 DeliveryServiceId int(11) not null,
 BranchName varchar(255)  default null,
 BranchAvailability varchar(255)  default null,
 BranchAddressId int(11) not null,
 BranchGooglemapPosition varchar(255)  default null,
 primary key (DeliveryBranchId),
 KEY IX_DeliveryBranch_DeliveryServiceId (DeliveryServiceId),
 KEY IX_DeliveryBranch_BranchAddressId (BranchAddressId),
 CONSTRAINT FK_DeliveryBranch_DeliveryService_DeliveryServiceId FOREIGN KEY (DeliveryServiceId) REFERENCES `DeliveryService` (DeliveryServiceId) ON DELETE CASCADE,
 CONSTRAINT FK_DeliveryBranch_BranchAddress_BranchAddressId FOREIGN KEY (BranchAddressId) REFERENCES `BranchAddress` (BranchAddressId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Permission` (
 PermissionId int(11) not null,
 PermissionName varchar(255)  default null,
 primary key (PermissionId)    
) engine=InnoDB default charset=utf8mb4;


create table `Staff` (
 StaffId int(11) not null,
 StaffFirstname varchar(255)  default null,
 StaffLastname varchar(255)  default null,
 StaffBirthday varchar(255)  default null,
 Email varchar(255)  default null,
 StaffPhoneNumber varchar(255)  default null,
 PermissionId int(11) not null,
 primary key (StaffId),
 KEY IX_Staff_PermissionId (PermissionId),
 CONSTRAINT FK_Staff_Permission_PermissionId FOREIGN KEY (PermissionId) REFERENCES `Permission` (PermissionId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Customer` (
 CustomerId int(11) not null,
 CustomerFirstname varchar(255)  default null,
 CustomerLastname varchar(255)  default null,
 CustomerBirthday varchar(255)  default null,
 CustomerPhoneNumber varchar(255)  default null,
 CustomerSocialLink varchar(255)  default null,
 Gender varchar(255)  default null,
 Email varchar(255)  default null,
 primary key (CustomerId)    
) engine=InnoDB default charset=utf8mb4;


create table `ShoeSize` (
 ShoeSizeId int(11) not null,
 SizeType varchar(255)  default null,
 SizeNumber double not null,
 primary key (ShoeSizeId)    
) engine=InnoDB default charset=utf8mb4;


create table `ProductCondition` (
 ProductConditionId int(11) not null,
 ConditionName varchar(255)  default null,
 primary key (ProductConditionId)    
) engine=InnoDB default charset=utf8mb4;


create table `ShoeSize` (
 ShoeSizeId int(11) not null,
 SizeType varchar(255)  default null,
 SizeNumber double not null,
 primary key (ShoeSizeId)    
) engine=InnoDB default charset=utf8mb4;


create table `ProductWithSize` (
 ProductWithSizeId int(11) not null,
 InventoryQty int(11) not null,
 ShoeSizeId int(11) not null,
 ProductId int(11) not null,
 primary key (ProductWithSizeId),
 KEY IX_ProductWithSize_ShoeSizeId (ShoeSizeId),
 KEY IX_ProductWithSize_ProductId (ProductId),
 CONSTRAINT FK_ProductWithSize_ShoeSize_ShoeSizeId FOREIGN KEY (ShoeSizeId) REFERENCES `ShoeSize` (ShoeSizeId) ON DELETE CASCADE,
 CONSTRAINT FK_ProductWithSize_Product_ProductId FOREIGN KEY (ProductId) REFERENCES `Product` (ProductId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Brand` (
 BrandId int(11) not null,
 BrandName varchar(255)  default null,
 primary key (BrandId)    
) engine=InnoDB default charset=utf8mb4;


create table `ProductCollection` (
 ProductCollectionId int(11) not null,
 CollectionName varchar(255)  default null,
 BrandId int(11) not null,
 primary key (ProductCollectionId),
 KEY IX_ProductCollection_BrandId (BrandId),
 CONSTRAINT FK_ProductCollection_Brand_BrandId FOREIGN KEY (BrandId) REFERENCES `Brand` (BrandId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `ProductImage` (
 ProductImageId int(11) not null,
 ProductImagePath varchar(255)  default null,
 primary key (ProductImageId)    
) engine=InnoDB default charset=utf8mb4;


create table `Product` (
 ProductId int(11) not null,
 ProductName varchar(255)  default null,
 RetailPrice int(11) not null,
 SellingPrice int(11) not null,
 Sku varchar(255)  default null,
 Colorway varchar(255)  default null,
 Releasedate varchar(255)  default null,
 Amountsold int(11) not null,
 ProductCollectionId int(11) not null,
 ProductImageId int(11) not null,
 primary key (ProductId),
 KEY IX_Product_ProductCollectionId (ProductCollectionId),
 KEY IX_Product_ProductImageId (ProductImageId),
 CONSTRAINT FK_Product_ProductCollection_ProductCollectionId FOREIGN KEY (ProductCollectionId) REFERENCES `ProductCollection` (ProductCollectionId) ON DELETE CASCADE,
 CONSTRAINT FK_Product_ProductImage_ProductImageId FOREIGN KEY (ProductImageId) REFERENCES `ProductImage` (ProductImageId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `BillItem` (
 BillItemId int(11) not null,
 ShoeSizeId int(11) not null,
 ProductConditionId int(11) not null,
 ProductId int(11) not null,
 BillId int(11) not null,
 primary key (BillItemId),
 KEY IX_BillItem_ShoeSizeId (ShoeSizeId),
 KEY IX_BillItem_ProductConditionId (ProductConditionId),
 KEY IX_BillItem_ProductId (ProductId),
 KEY IX_BillItem_BillId (BillId),
 CONSTRAINT FK_BillItem_ShoeSize_ShoeSizeId FOREIGN KEY (ShoeSizeId) REFERENCES `ShoeSize` (ShoeSizeId) ON DELETE CASCADE,
 CONSTRAINT FK_BillItem_ProductCondition_ProductConditionId FOREIGN KEY (ProductConditionId) REFERENCES `ProductCondition` (ProductConditionId) ON DELETE CASCADE,
 CONSTRAINT FK_BillItem_Product_ProductId FOREIGN KEY (ProductId) REFERENCES `Product` (ProductId) ON DELETE CASCADE,
 CONSTRAINT FK_BillItem_Bill_BillId FOREIGN KEY (BillId) REFERENCES `Bill` (BillId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Bill` (
 BillId int(11) not null,
 OrderDate varchar(255)  default null,
 OrderStatusId int(11) not null,
 ShippingMethodId int(11) not null,
 CustomerTransferPicId int(11) not null,
 DiscountId int(11) not null,
 DeliveryBranchId int(11) not null,
 StaffId int(11) not null,
 CustomerId int(11) not null,
 primary key (BillId),
 KEY IX_Bill_OrderStatusId (OrderStatusId),
 KEY IX_Bill_ShippingMethodId (ShippingMethodId),
 KEY IX_Bill_CustomerTransferPicId (CustomerTransferPicId),
 KEY IX_Bill_DiscountId (DiscountId),
 KEY IX_Bill_DeliveryBranchId (DeliveryBranchId),
 KEY IX_Bill_StaffId (StaffId),
 KEY IX_Bill_CustomerId (CustomerId),
 CONSTRAINT FK_Bill_OrderStatus_OrderStatusId FOREIGN KEY (OrderStatusId) REFERENCES `OrderStatus` (OrderStatusId) ON DELETE CASCADE,
 CONSTRAINT FK_Bill_ShippingMethod_ShippingMethodId FOREIGN KEY (ShippingMethodId) REFERENCES `ShippingMethod` (ShippingMethodId) ON DELETE CASCADE,
 CONSTRAINT FK_Bill_CustomerTransferPic_CustomerTransferPicId FOREIGN KEY (CustomerTransferPicId) REFERENCES `CustomerTransferPic` (CustomerTransferPicId) ON DELETE CASCADE,
 CONSTRAINT FK_Bill_Discount_DiscountId FOREIGN KEY (DiscountId) REFERENCES `Discount` (DiscountId) ON DELETE CASCADE,
 CONSTRAINT FK_Bill_DeliveryBranch_DeliveryBranchId FOREIGN KEY (DeliveryBranchId) REFERENCES `DeliveryBranch` (DeliveryBranchId) ON DELETE CASCADE,
 CONSTRAINT FK_Bill_Staff_StaffId FOREIGN KEY (StaffId) REFERENCES `Staff` (StaffId) ON DELETE CASCADE,
 CONSTRAINT FK_Bill_Customer_CustomerId FOREIGN KEY (CustomerId) REFERENCES `Customer` (CustomerId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


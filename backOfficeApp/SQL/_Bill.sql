
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


create table `ShippingMethod` (
 ShippingMethodId int(11) not null,
 MethodName varchar(255)  default null,
 primary key (ShippingMethodId)    
) engine=InnoDB default charset=utf8mb4;


create table `Discount` (
 DiscountId int(11) not null,
 Description varchar(255)  default null,
 DiscountPercentage int(11) not null,
 MinSpend int(11) not null,
 MaxDiscountAmount int(11) not null,
 Start datetime not null,
 Duration int(11) not null,
 Amount int(11) not null,
 ShippingMethodId int(11) not null,
 primary key (DiscountId),
 KEY IX_Discount_ShippingMethodId (ShippingMethodId),
 CONSTRAINT FK_Discount_ShippingMethod_ShippingMethodId FOREIGN KEY (ShippingMethodId) REFERENCES `ShippingMethod` (ShippingMethodId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Province` (
 ProvinceId int(11) not null,
 ProvinceName varchar(255)  default null,
 ProvinceNameEn varchar(255)  default null,
 primary key (ProvinceId)    
) engine=InnoDB default charset=utf8mb4;


create table `Province` (
 ProvinceId int(11) not null,
 ProvinceName varchar(255)  default null,
 ProvinceNameEn varchar(255)  default null,
 primary key (ProvinceId)    
) engine=InnoDB default charset=utf8mb4;


create table `City` (
 CityId int(11) not null,
 CityName varchar(255)  default null,
 CityNameEn varchar(255)  default null,
 ProvinceId int(11) not null,
 primary key (CityId),
 KEY IX_City_ProvinceId (ProvinceId),
 CONSTRAINT FK_City_Province_ProvinceId FOREIGN KEY (ProvinceId) REFERENCES `Province` (ProvinceId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Province` (
 ProvinceId int(11) not null,
 ProvinceName varchar(255)  default null,
 ProvinceNameEn varchar(255)  default null,
 primary key (ProvinceId)    
) engine=InnoDB default charset=utf8mb4;


create table `City` (
 CityId int(11) not null,
 CityName varchar(255)  default null,
 CityNameEn varchar(255)  default null,
 ProvinceId int(11) not null,
 primary key (CityId),
 KEY IX_City_ProvinceId (ProvinceId),
 CONSTRAINT FK_City_Province_ProvinceId FOREIGN KEY (ProvinceId) REFERENCES `Province` (ProvinceId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Village` (
 VillageId int(11) not null,
 VillageName varchar(255)  default null,
 VillageNameEn varchar(255)  default null,
 CityId int(11) not null,
 primary key (VillageId),
 KEY IX_Village_CityId (CityId),
 CONSTRAINT FK_Village_City_CityId FOREIGN KEY (CityId) REFERENCES `City` (CityId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `BranchLocation` (
 BranchLocationId int(11) not null,
 ProvinceId int(11) not null,
 CityId int(11) not null,
 VillageId int(11) not null,
 DeliveryServiceId int(11) not null,
 primary key (BranchLocationId),
 KEY IX_BranchLocation_ProvinceId (ProvinceId),
 KEY IX_BranchLocation_CityId (CityId),
 KEY IX_BranchLocation_VillageId (VillageId),
 KEY IX_BranchLocation_DeliveryServiceId (DeliveryServiceId),
 CONSTRAINT FK_BranchLocation_Province_ProvinceId FOREIGN KEY (ProvinceId) REFERENCES `Province` (ProvinceId) ON DELETE CASCADE,
 CONSTRAINT FK_BranchLocation_City_CityId FOREIGN KEY (CityId) REFERENCES `City` (CityId) ON DELETE CASCADE,
 CONSTRAINT FK_BranchLocation_Village_VillageId FOREIGN KEY (VillageId) REFERENCES `Village` (VillageId) ON DELETE CASCADE,
 CONSTRAINT FK_BranchLocation_DeliveryService_DeliveryServiceId FOREIGN KEY (DeliveryServiceId) REFERENCES `DeliveryService` (DeliveryServiceId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `DeliveryService` (
 DeliveryServiceId int(11) not null,
 DeliveryCompanyName varchar(255)  default null,
 primary key (DeliveryServiceId)    
) engine=InnoDB default charset=utf8mb4;


create table `Province` (
 ProvinceId int(11) not null,
 ProvinceName varchar(255)  default null,
 ProvinceNameEn varchar(255)  default null,
 primary key (ProvinceId)    
) engine=InnoDB default charset=utf8mb4;


create table `Province` (
 ProvinceId int(11) not null,
 ProvinceName varchar(255)  default null,
 ProvinceNameEn varchar(255)  default null,
 primary key (ProvinceId)    
) engine=InnoDB default charset=utf8mb4;


create table `City` (
 CityId int(11) not null,
 CityName varchar(255)  default null,
 CityNameEn varchar(255)  default null,
 ProvinceId int(11) not null,
 primary key (CityId),
 KEY IX_City_ProvinceId (ProvinceId),
 CONSTRAINT FK_City_Province_ProvinceId FOREIGN KEY (ProvinceId) REFERENCES `Province` (ProvinceId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Province` (
 ProvinceId int(11) not null,
 ProvinceName varchar(255)  default null,
 ProvinceNameEn varchar(255)  default null,
 primary key (ProvinceId)    
) engine=InnoDB default charset=utf8mb4;


create table `City` (
 CityId int(11) not null,
 CityName varchar(255)  default null,
 CityNameEn varchar(255)  default null,
 ProvinceId int(11) not null,
 primary key (CityId),
 KEY IX_City_ProvinceId (ProvinceId),
 CONSTRAINT FK_City_Province_ProvinceId FOREIGN KEY (ProvinceId) REFERENCES `Province` (ProvinceId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Village` (
 VillageId int(11) not null,
 VillageName varchar(255)  default null,
 VillageNameEn varchar(255)  default null,
 CityId int(11) not null,
 primary key (VillageId),
 KEY IX_Village_CityId (CityId),
 CONSTRAINT FK_Village_City_CityId FOREIGN KEY (CityId) REFERENCES `City` (CityId) ON DELETE CASCADE    
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
 StaffBirthday datetime not null,
 Email varchar(255)  default null,
 Password varchar(255)  default null,
 StaffPhoneNumber varchar(255)  default null,
 PermissionId int(11) not null,
 primary key (StaffId),
 KEY IX_Staff_PermissionId (PermissionId),
 CONSTRAINT FK_Staff_Permission_PermissionId FOREIGN KEY (PermissionId) REFERENCES `Permission` (PermissionId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Province` (
 ProvinceId int(11) not null,
 ProvinceName varchar(255)  default null,
 ProvinceNameEn varchar(255)  default null,
 primary key (ProvinceId)    
) engine=InnoDB default charset=utf8mb4;


create table `Province` (
 ProvinceId int(11) not null,
 ProvinceName varchar(255)  default null,
 ProvinceNameEn varchar(255)  default null,
 primary key (ProvinceId)    
) engine=InnoDB default charset=utf8mb4;


create table `City` (
 CityId int(11) not null,
 CityName varchar(255)  default null,
 CityNameEn varchar(255)  default null,
 ProvinceId int(11) not null,
 primary key (CityId),
 KEY IX_City_ProvinceId (ProvinceId),
 CONSTRAINT FK_City_Province_ProvinceId FOREIGN KEY (ProvinceId) REFERENCES `Province` (ProvinceId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Province` (
 ProvinceId int(11) not null,
 ProvinceName varchar(255)  default null,
 ProvinceNameEn varchar(255)  default null,
 primary key (ProvinceId)    
) engine=InnoDB default charset=utf8mb4;


create table `City` (
 CityId int(11) not null,
 CityName varchar(255)  default null,
 CityNameEn varchar(255)  default null,
 ProvinceId int(11) not null,
 primary key (CityId),
 KEY IX_City_ProvinceId (ProvinceId),
 CONSTRAINT FK_City_Province_ProvinceId FOREIGN KEY (ProvinceId) REFERENCES `Province` (ProvinceId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Village` (
 VillageId int(11) not null,
 VillageName varchar(255)  default null,
 VillageNameEn varchar(255)  default null,
 CityId int(11) not null,
 primary key (VillageId),
 KEY IX_Village_CityId (CityId),
 CONSTRAINT FK_Village_City_CityId FOREIGN KEY (CityId) REFERENCES `City` (CityId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Location` (
 LocationId int(11) not null,
 ProvinceId int(11) not null,
 CityId int(11) not null,
 VillageId int(11) not null,
 CustomerId int(11) not null,
 primary key (LocationId),
 KEY IX_Location_ProvinceId (ProvinceId),
 KEY IX_Location_CityId (CityId),
 KEY IX_Location_VillageId (VillageId),
 KEY IX_Location_CustomerId (CustomerId),
 CONSTRAINT FK_Location_Province_ProvinceId FOREIGN KEY (ProvinceId) REFERENCES `Province` (ProvinceId) ON DELETE CASCADE,
 CONSTRAINT FK_Location_City_CityId FOREIGN KEY (CityId) REFERENCES `City` (CityId) ON DELETE CASCADE,
 CONSTRAINT FK_Location_Village_VillageId FOREIGN KEY (VillageId) REFERENCES `Village` (VillageId) ON DELETE CASCADE,
 CONSTRAINT FK_Location_Customer_CustomerId FOREIGN KEY (CustomerId) REFERENCES `Customer` (CustomerId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Customer` (
 CustomerId int(11) not null,
 CustomerFirstname varchar(255)  default null,
 CustomerLastname varchar(255)  default null,
 Gender varchar(255)  default null,
 CustomerBirthday datetime not null,
 Email varchar(255)  default null,
 CustomerPhoneNumber varchar(255)  default null,
 CustomerSocialLink varchar(255)  default null,
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


create table `Collection` (
 CollectionId int(11) not null,
 CollectionName varchar(255)  default null,
 primary key (CollectionId)    
) engine=InnoDB default charset=utf8mb4;


create table `BrandWithCollection` (
 BrandWithCollectionId int(11) not null,
 CollectionId int(11) not null,
 BrandId int(11) not null,
 primary key (BrandWithCollectionId),
 KEY IX_BrandWithCollection_CollectionId (CollectionId),
 KEY IX_BrandWithCollection_BrandId (BrandId),
 CONSTRAINT FK_BrandWithCollection_Collection_CollectionId FOREIGN KEY (CollectionId) REFERENCES `Collection` (CollectionId) ON DELETE CASCADE,
 CONSTRAINT FK_BrandWithCollection_Brand_BrandId FOREIGN KEY (BrandId) REFERENCES `Brand` (BrandId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Brand` (
 BrandId int(11) not null,
 BrandName varchar(255)  default null,
 BrandLogoUrl varchar(255)  default null,
 primary key (BrandId)    
) engine=InnoDB default charset=utf8mb4;


create table `Collection` (
 CollectionId int(11) not null,
 CollectionName varchar(255)  default null,
 primary key (CollectionId)    
) engine=InnoDB default charset=utf8mb4;


create table `Product` (
 ProductId int(11) not null,
 Barcode varchar(255)  default null,
 ProductName varchar(255)  default null,
 CostPrice int(11) not null,
 SellingPrice int(11) not null,
 Sku varchar(255)  default null,
 Colorway varchar(255)  default null,
 Releasedate datetime not null,
 Amountsold int(11) not null,
 BrandId int(11) not null,
 CollectionId int(11) not null,
 ProductImageUrl varchar(255)  default null,
 primary key (ProductId),
 KEY IX_Product_BrandId (BrandId),
 KEY IX_Product_CollectionId (CollectionId),
 CONSTRAINT FK_Product_Brand_BrandId FOREIGN KEY (BrandId) REFERENCES `Brand` (BrandId) ON DELETE CASCADE,
 CONSTRAINT FK_Product_Collection_CollectionId FOREIGN KEY (CollectionId) REFERENCES `Collection` (CollectionId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `BillItem` (
 BillItemId int(11) not null,
 ShoeSizeId int(11) not null,
 ProductConditionId int(11) not null,
 ItemQty int(11) not null,
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
 OrderDate datetime not null,
 OrderStatusId int(11) not null,
 ShippingMethodId int(11) not null,
 CustomerTransferPicPath varchar(255)  default null,
 ShippingReceipt varchar(255)  default null,
 DepositMoney int(11) not null,
 DiscountId int(11) not null,
 DeliveryServiceId int(11) not null,
 ProvinceId int(11) not null,
 CityId int(11) not null,
 VillageId int(11) not null,
 AdditionalAddressInfo varchar(255)  default null,
 StaffId int(11) not null,
 CustomerId int(11) not null,
 primary key (BillId),
 KEY IX_Bill_OrderStatusId (OrderStatusId),
 KEY IX_Bill_ShippingMethodId (ShippingMethodId),
 KEY IX_Bill_DiscountId (DiscountId),
 KEY IX_Bill_DeliveryServiceId (DeliveryServiceId),
 KEY IX_Bill_ProvinceId (ProvinceId),
 KEY IX_Bill_CityId (CityId),
 KEY IX_Bill_VillageId (VillageId),
 KEY IX_Bill_StaffId (StaffId),
 KEY IX_Bill_CustomerId (CustomerId),
 CONSTRAINT FK_Bill_OrderStatus_OrderStatusId FOREIGN KEY (OrderStatusId) REFERENCES `OrderStatus` (OrderStatusId) ON DELETE CASCADE,
 CONSTRAINT FK_Bill_ShippingMethod_ShippingMethodId FOREIGN KEY (ShippingMethodId) REFERENCES `ShippingMethod` (ShippingMethodId) ON DELETE CASCADE,
 CONSTRAINT FK_Bill_Discount_DiscountId FOREIGN KEY (DiscountId) REFERENCES `Discount` (DiscountId) ON DELETE CASCADE,
 CONSTRAINT FK_Bill_DeliveryService_DeliveryServiceId FOREIGN KEY (DeliveryServiceId) REFERENCES `DeliveryService` (DeliveryServiceId) ON DELETE CASCADE,
 CONSTRAINT FK_Bill_Province_ProvinceId FOREIGN KEY (ProvinceId) REFERENCES `Province` (ProvinceId) ON DELETE CASCADE,
 CONSTRAINT FK_Bill_City_CityId FOREIGN KEY (CityId) REFERENCES `City` (CityId) ON DELETE CASCADE,
 CONSTRAINT FK_Bill_Village_VillageId FOREIGN KEY (VillageId) REFERENCES `Village` (VillageId) ON DELETE CASCADE,
 CONSTRAINT FK_Bill_Staff_StaffId FOREIGN KEY (StaffId) REFERENCES `Staff` (StaffId) ON DELETE CASCADE,
 CONSTRAINT FK_Bill_Customer_CustomerId FOREIGN KEY (CustomerId) REFERENCES `Customer` (CustomerId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


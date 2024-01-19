
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


create table `DeliveryReceiptPic` (
 DeliveryReceiptPicId int(11) not null,
 PicString varchar(255)  default null,
 BillId int(11) not null,
 primary key (DeliveryReceiptPicId),
 KEY IX_DeliveryReceiptPic_BillId (BillId),
 CONSTRAINT FK_DeliveryReceiptPic_Bill_BillId FOREIGN KEY (BillId) REFERENCES `Bill` (BillId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `StoreBranch` (
 StoreBranchId int(11) not null,
 Province varchar(255)  default null,
 primary key (StoreBranchId)    
) engine=InnoDB default charset=utf8mb4;


create table `Address` (
 AddressId int(11) not null,
 SellerName varchar(255)  default null,
 SellerTelNumber int(11) not null,
 Province varchar(255)  default null,
 City varchar(255)  default null,
 Village varchar(255)  default null,
 AddressDetail varchar(255)  default null,
 PostCode int(11) not null,
 primary key (AddressId)    
) engine=InnoDB default charset=utf8mb4;


create table `CustomerAddress` (
 CustomerAddressId int(11) not null,
 AddressId int(11) not null,
 CustomerId int(11) not null,
 primary key (CustomerAddressId),
 KEY IX_CustomerAddress_AddressId (AddressId),
 KEY IX_CustomerAddress_CustomerId (CustomerId),
 CONSTRAINT FK_CustomerAddress_Address_AddressId FOREIGN KEY (AddressId) REFERENCES `Address` (AddressId) ON DELETE CASCADE,
 CONSTRAINT FK_CustomerAddress_Customer_CustomerId FOREIGN KEY (CustomerId) REFERENCES `Customer` (CustomerId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Bank` (
 BankId int(11) not null,
 BankName varchar(255)  default null,
 primary key (BankId)    
) engine=InnoDB default charset=utf8mb4;


create table `CustomerBankAccount` (
 CustomerBankAccountId int(11) not null,
 BankId int(11) not null,
 AccountName varchar(255)  default null,
 AccountNumber int(11) not null,
 AccountQr varchar(255)  default null,
 CustomerId int(11) not null,
 primary key (CustomerBankAccountId),
 KEY IX_CustomerBankAccount_BankId (BankId),
 KEY IX_CustomerBankAccount_CustomerId (CustomerId),
 CONSTRAINT FK_CustomerBankAccount_Bank_BankId FOREIGN KEY (BankId) REFERENCES `Bank` (BankId) ON DELETE CASCADE,
 CONSTRAINT FK_CustomerBankAccount_Customer_CustomerId FOREIGN KEY (CustomerId) REFERENCES `Customer` (CustomerId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `ShoeSize` (
 ShoeSizeId int(11) not null,
 SizeType varchar(255)  default null,
 SizeNumber double not null,
 primary key (ShoeSizeId)    
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
 BrandLogo varchar(255)  default null,
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


create table `ProductCat` (
 ProductCatId int(11) not null,
 CatName varchar(255)  default null,
 primary key (ProductCatId)    
) engine=InnoDB default charset=utf8mb4;


create table `ProductImage` (
 ProductImageId int(11) not null,
 ProductImageUrl varchar(255)  default null,
 ProductId int(11) not null,
 primary key (ProductImageId),
 KEY IX_ProductImage_ProductId (ProductId),
 CONSTRAINT FK_ProductImage_Product_ProductId FOREIGN KEY (ProductId) REFERENCES `Product` (ProductId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Product` (
 ProductId int(11) not null,
 Name varchar(255)  default null,
 StorePrice int(11) not null,
 LowestSellingPrice int(11) not null,
 Sku varchar(255)  default null,
 Colorway varchar(255)  default null,
 ReleaseDate datetime not null,
 AmountSold int(11) not null,
 ProductCollectionId int(11) not null,
 ProductCatId int(11) not null,
 primary key (ProductId),
 KEY IX_Product_ProductCollectionId (ProductCollectionId),
 KEY IX_Product_ProductCatId (ProductCatId),
 CONSTRAINT FK_Product_ProductCollection_ProductCollectionId FOREIGN KEY (ProductCollectionId) REFERENCES `ProductCollection` (ProductCollectionId) ON DELETE CASCADE,
 CONSTRAINT FK_Product_ProductCat_ProductCatId FOREIGN KEY (ProductCatId) REFERENCES `ProductCat` (ProductCatId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `CustomerWishlist` (
 CustomerWishlistId int(11) not null,
 ShoeSizeId int(11) not null,
 ProductId int(11) not null,
 CustomerId int(11) not null,
 primary key (CustomerWishlistId),
 KEY IX_CustomerWishlist_ShoeSizeId (ShoeSizeId),
 KEY IX_CustomerWishlist_ProductId (ProductId),
 KEY IX_CustomerWishlist_CustomerId (CustomerId),
 CONSTRAINT FK_CustomerWishlist_ShoeSize_ShoeSizeId FOREIGN KEY (ShoeSizeId) REFERENCES `ShoeSize` (ShoeSizeId) ON DELETE CASCADE,
 CONSTRAINT FK_CustomerWishlist_Product_ProductId FOREIGN KEY (ProductId) REFERENCES `Product` (ProductId) ON DELETE CASCADE,
 CONSTRAINT FK_CustomerWishlist_Customer_CustomerId FOREIGN KEY (CustomerId) REFERENCES `Customer` (CustomerId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `OrderStatus` (
 OrderStatusId int(11) not null,
 StatusName varchar(255)  default null,
 primary key (OrderStatusId)    
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


create table `CustomerProductImage` (
 CustomerProductImageId int(11) not null,
 ProductImage varchar(255)  default null,
 ProductSellingId int(11) not null,
 primary key (CustomerProductImageId),
 KEY IX_CustomerProductImage_ProductSellingId (ProductSellingId),
 CONSTRAINT FK_CustomerProductImage_ProductSelling_ProductSellingId FOREIGN KEY (ProductSellingId) REFERENCES `ProductSelling` (ProductSellingId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `CustomerDefectImage` (
 CustomerDefectImageId int(11) not null,
 DefectImage varchar(255)  default null,
 ProductSellingId int(11) not null,
 primary key (CustomerDefectImageId),
 KEY IX_CustomerDefectImage_ProductSellingId (ProductSellingId),
 CONSTRAINT FK_CustomerDefectImage_ProductSelling_ProductSellingId FOREIGN KEY (ProductSellingId) REFERENCES `ProductSelling` (ProductSellingId) ON DELETE CASCADE    
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
 BrandLogo varchar(255)  default null,
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


create table `ProductCat` (
 ProductCatId int(11) not null,
 CatName varchar(255)  default null,
 primary key (ProductCatId)    
) engine=InnoDB default charset=utf8mb4;


create table `ProductImage` (
 ProductImageId int(11) not null,
 ProductImageUrl varchar(255)  default null,
 ProductId int(11) not null,
 primary key (ProductImageId),
 KEY IX_ProductImage_ProductId (ProductId),
 CONSTRAINT FK_ProductImage_Product_ProductId FOREIGN KEY (ProductId) REFERENCES `Product` (ProductId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Product` (
 ProductId int(11) not null,
 Name varchar(255)  default null,
 StorePrice int(11) not null,
 LowestSellingPrice int(11) not null,
 Sku varchar(255)  default null,
 Colorway varchar(255)  default null,
 ReleaseDate datetime not null,
 AmountSold int(11) not null,
 ProductCollectionId int(11) not null,
 ProductCatId int(11) not null,
 primary key (ProductId),
 KEY IX_Product_ProductCollectionId (ProductCollectionId),
 KEY IX_Product_ProductCatId (ProductCatId),
 CONSTRAINT FK_Product_ProductCollection_ProductCollectionId FOREIGN KEY (ProductCollectionId) REFERENCES `ProductCollection` (ProductCollectionId) ON DELETE CASCADE,
 CONSTRAINT FK_Product_ProductCat_ProductCatId FOREIGN KEY (ProductCatId) REFERENCES `ProductCat` (ProductCatId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `ProductSelling` (
 ProductSellingId int(11) not null,
 ProductLiveDate datetime not null,
 OrderStatusId int(11) not null,
 CustomerPlacedPrice int(11) not null,
 Qty int(11) not null,
 ShoeSizeId int(11) not null,
 ProductConditionId int(11) not null,
 ProductDefect boolean  not null,
 BoxDefect boolean  not null,
 ProductId int(11) not null,
 CustomerId int(11) not null,
 primary key (ProductSellingId),
 KEY IX_ProductSelling_OrderStatusId (OrderStatusId),
 KEY IX_ProductSelling_ShoeSizeId (ShoeSizeId),
 KEY IX_ProductSelling_ProductConditionId (ProductConditionId),
 KEY IX_ProductSelling_ProductId (ProductId),
 KEY IX_ProductSelling_CustomerId (CustomerId),
 CONSTRAINT FK_ProductSelling_OrderStatus_OrderStatusId FOREIGN KEY (OrderStatusId) REFERENCES `OrderStatus` (OrderStatusId) ON DELETE CASCADE,
 CONSTRAINT FK_ProductSelling_ShoeSize_ShoeSizeId FOREIGN KEY (ShoeSizeId) REFERENCES `ShoeSize` (ShoeSizeId) ON DELETE CASCADE,
 CONSTRAINT FK_ProductSelling_ProductCondition_ProductConditionId FOREIGN KEY (ProductConditionId) REFERENCES `ProductCondition` (ProductConditionId) ON DELETE CASCADE,
 CONSTRAINT FK_ProductSelling_Product_ProductId FOREIGN KEY (ProductId) REFERENCES `Product` (ProductId) ON DELETE CASCADE,
 CONSTRAINT FK_ProductSelling_Customer_CustomerId FOREIGN KEY (CustomerId) REFERENCES `Customer` (CustomerId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Customer` (
 CustomerId int(11) not null,
 FirstName varchar(255)  default null,
 LastName varchar(255)  default null,
 Age int(11) not null,
 Birthday datetime not null,
 Email varchar(255)  default null,
 VacationMode boolean  not null,
 EmailSubscription boolean  not null,
 DefaultAddress int(11) not null,
 primary key (CustomerId)    
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


create table `ShippingMethod` (
 ShippingMethodId int(11) not null,
 MethodName varchar(255)  default null,
 primary key (ShippingMethodId)    
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
 BrandLogo varchar(255)  default null,
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


create table `ProductCat` (
 ProductCatId int(11) not null,
 CatName varchar(255)  default null,
 primary key (ProductCatId)    
) engine=InnoDB default charset=utf8mb4;


create table `ProductImage` (
 ProductImageId int(11) not null,
 ProductImageUrl varchar(255)  default null,
 ProductId int(11) not null,
 primary key (ProductImageId),
 KEY IX_ProductImage_ProductId (ProductId),
 CONSTRAINT FK_ProductImage_Product_ProductId FOREIGN KEY (ProductId) REFERENCES `Product` (ProductId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `Product` (
 ProductId int(11) not null,
 Name varchar(255)  default null,
 StorePrice int(11) not null,
 LowestSellingPrice int(11) not null,
 Sku varchar(255)  default null,
 Colorway varchar(255)  default null,
 ReleaseDate datetime not null,
 AmountSold int(11) not null,
 ProductCollectionId int(11) not null,
 ProductCatId int(11) not null,
 primary key (ProductId),
 KEY IX_Product_ProductCollectionId (ProductCollectionId),
 KEY IX_Product_ProductCatId (ProductCatId),
 CONSTRAINT FK_Product_ProductCollection_ProductCollectionId FOREIGN KEY (ProductCollectionId) REFERENCES `ProductCollection` (ProductCollectionId) ON DELETE CASCADE,
 CONSTRAINT FK_Product_ProductCat_ProductCatId FOREIGN KEY (ProductCatId) REFERENCES `ProductCat` (ProductCatId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


create table `BillItem` (
 BillItemId int(11) not null,
 Qty int(11) not null,
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
 OrderDate datetime not null,
 StatusDate datetime not null,
 OrderStatusId int(11) not null,
 DiscountId int(11) not null,
 StoreBranchId int(11) not null,
 CustomerId int(11) not null,
 DeliveryBranchId int(11) not null,
 ShippingMethodId int(11) not null,
 primary key (BillId),
 KEY IX_Bill_OrderStatusId (OrderStatusId),
 KEY IX_Bill_DiscountId (DiscountId),
 KEY IX_Bill_StoreBranchId (StoreBranchId),
 KEY IX_Bill_CustomerId (CustomerId),
 KEY IX_Bill_DeliveryBranchId (DeliveryBranchId),
 KEY IX_Bill_ShippingMethodId (ShippingMethodId),
 CONSTRAINT FK_Bill_OrderStatus_OrderStatusId FOREIGN KEY (OrderStatusId) REFERENCES `OrderStatus` (OrderStatusId) ON DELETE CASCADE,
 CONSTRAINT FK_Bill_Discount_DiscountId FOREIGN KEY (DiscountId) REFERENCES `Discount` (DiscountId) ON DELETE CASCADE,
 CONSTRAINT FK_Bill_StoreBranch_StoreBranchId FOREIGN KEY (StoreBranchId) REFERENCES `StoreBranch` (StoreBranchId) ON DELETE CASCADE,
 CONSTRAINT FK_Bill_Customer_CustomerId FOREIGN KEY (CustomerId) REFERENCES `Customer` (CustomerId) ON DELETE CASCADE,
 CONSTRAINT FK_Bill_DeliveryBranch_DeliveryBranchId FOREIGN KEY (DeliveryBranchId) REFERENCES `DeliveryBranch` (DeliveryBranchId) ON DELETE CASCADE,
 CONSTRAINT FK_Bill_ShippingMethod_ShippingMethodId FOREIGN KEY (ShippingMethodId) REFERENCES `ShippingMethod` (ShippingMethodId) ON DELETE CASCADE    
) engine=InnoDB default charset=utf8mb4;


import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'customer_defect_image.dart';
import 'customer_product_image.dart';
import 'order_status.dart';
import 'product.dart';
import 'product_condition.dart';
import 'shoe_size.dart';

class ProductSelling {
  final String productLiveDate;
  final OrderStatus orderStatus;
  final int customerPlacedPrice;
  final int qty;
  final ShoeSize shoeSize;
  final ProductCondition productCondition;
  final bool productDefect;
  final bool boxDefect;
  final List<CustomerProductImage> customerProductImages;
  final List<CustomerDefectImage> customerDefectImages;
  final Product product;
  ProductSelling({
    required this.productLiveDate,
    required this.orderStatus,
    required this.customerPlacedPrice,
    required this.qty,
    required this.shoeSize,
    required this.productCondition,
    required this.productDefect,
    required this.boxDefect,
    required this.customerProductImages,
    required this.customerDefectImages,
    required this.product,
  });

  ProductSelling copyWith({
    String? productLiveDate,
    OrderStatus? orderStatus,
    int? customerPlacedPrice,
    int? qty,
    ShoeSize? shoeSize,
    ProductCondition? productCondition,
    bool? productDefect,
    bool? boxDefect,
    List<CustomerProductImage>? customerProductImages,
    List<CustomerDefectImage>? customerDefectImages,
    Product? product,
  }) {
    return ProductSelling(
      productLiveDate: productLiveDate ?? this.productLiveDate,
      orderStatus: orderStatus ?? this.orderStatus,
      customerPlacedPrice: customerPlacedPrice ?? this.customerPlacedPrice,
      qty: qty ?? this.qty,
      shoeSize: shoeSize ?? this.shoeSize,
      productCondition: productCondition ?? this.productCondition,
      productDefect: productDefect ?? this.productDefect,
      boxDefect: boxDefect ?? this.boxDefect,
      customerProductImages: customerProductImages ?? this.customerProductImages,
      customerDefectImages: customerDefectImages ?? this.customerDefectImages,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productLiveDate': productLiveDate,
      'orderStatus': orderStatus.toMap(),
      'customerPlacedPrice': customerPlacedPrice,
      'qty': qty,
      'shoeSize': shoeSize.toMap(),
      'productCondition': productCondition.toMap(),
      'productDefect': productDefect,
      'boxDefect': boxDefect,
      'customerProductImages': customerProductImages.map((x) => x.toMap()).toList(),
      'customerDefectImages': customerDefectImages.map((x) => x.toMap()).toList(),
      'product': product.toMap(),
    };
  }

  factory ProductSelling.fromMap(Map<String, dynamic> map) {
    return ProductSelling(
      productLiveDate: map['productLiveDate'] as String,
      orderStatus: OrderStatus.fromMap(map['orderStatus'] as Map<String,dynamic>),
      customerPlacedPrice: map['customerPlacedPrice'].toInt() as int,
      qty: map['qty'].toInt() as int,
      shoeSize: ShoeSize.fromMap(map['shoeSize'] as Map<String,dynamic>),
      productCondition: ProductCondition.fromMap(map['productCondition'] as Map<String,dynamic>),
      productDefect: map['productDefect'] as bool,
      boxDefect: map['boxDefect'] as bool,
      customerProductImages: List<CustomerProductImage>.from((map['customerProductImages'] as List<int>).map<CustomerProductImage>((x) => CustomerProductImage.fromMap(x as Map<String,dynamic>),),),
      customerDefectImages: List<CustomerDefectImage>.from((map['customerDefectImages'] as List<int>).map<CustomerDefectImage>((x) => CustomerDefectImage.fromMap(x as Map<String,dynamic>),),),
      product: Product.fromMap(map['product'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductSelling.fromJson(String source) => ProductSelling.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductSelling(productLiveDate: $productLiveDate, orderStatus: $orderStatus, customerPlacedPrice: $customerPlacedPrice, qty: $qty, shoeSize: $shoeSize, productCondition: $productCondition, productDefect: $productDefect, boxDefect: $boxDefect, customerProductImages: $customerProductImages, customerDefectImages: $customerDefectImages, product: $product)';
  }

  @override
  bool operator ==(covariant ProductSelling other) {
    if (identical(this, other)) return true;
  
    return 
      other.productLiveDate == productLiveDate &&
      other.orderStatus == orderStatus &&
      other.customerPlacedPrice == customerPlacedPrice &&
      other.qty == qty &&
      other.shoeSize == shoeSize &&
      other.productCondition == productCondition &&
      other.productDefect == productDefect &&
      other.boxDefect == boxDefect &&
      listEquals(other.customerProductImages, customerProductImages) &&
      listEquals(other.customerDefectImages, customerDefectImages) &&
      other.product == product;
  }

  @override
  int get hashCode {
    return productLiveDate.hashCode ^
      orderStatus.hashCode ^
      customerPlacedPrice.hashCode ^
      qty.hashCode ^
      shoeSize.hashCode ^
      productCondition.hashCode ^
      productDefect.hashCode ^
      boxDefect.hashCode ^
      customerProductImages.hashCode ^
      customerDefectImages.hashCode ^
      product.hashCode;
  }
}
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'order_status.dart';
import 'product.dart';
import 'product_condition.dart';
import 'shoe_size.dart';
import 'user_defect_image.dart';
import 'user_product_image.dart';

class UserWithProductSelling {
  final String productLiveDate;
  final OrderStatus orderStatus;
  final int userPlacedPrice;
  final ShoeSize shoeSize;
  final ProductCondition productCondition;
  final bool productDefect;
  final bool boxDefect;
  final List<UserProductImage> userProductImages;
  List<UserDefectImage>? userDefectImages;
  final Product product;
  UserWithProductSelling({
    required this.productLiveDate,
    required this.orderStatus,
    required this.userPlacedPrice,
    required this.shoeSize,
    required this.productCondition,
    required this.productDefect,
    required this.boxDefect,
    required this.userProductImages,
    this.userDefectImages,
    required this.product,
  });

  UserWithProductSelling copyWith({
    String? productLiveDate,
    OrderStatus? orderStatus,
    int? userPlacedPrice,
    ShoeSize? shoeSize,
    ProductCondition? productCondition,
    bool? productDefect,
    bool? boxDefect,
    List<UserProductImage>? userProductImages,
    List<UserDefectImage>? userDefectImages,
    Product? product,
  }) {
    return UserWithProductSelling(
      productLiveDate: productLiveDate ?? this.productLiveDate,
      orderStatus: orderStatus ?? this.orderStatus,
      userPlacedPrice: userPlacedPrice ?? this.userPlacedPrice,
      shoeSize: shoeSize ?? this.shoeSize,
      productCondition: productCondition ?? this.productCondition,
      productDefect: productDefect ?? this.productDefect,
      boxDefect: boxDefect ?? this.boxDefect,
      userProductImages: userProductImages ?? this.userProductImages,
      userDefectImages: userDefectImages ?? this.userDefectImages,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productLiveDate': productLiveDate,
      'orderStatus': orderStatus.toMap(),
      'userPlacedPrice': userPlacedPrice,
      'shoeSize': shoeSize.toMap(),
      'productCondition': productCondition.toMap(),
      'productDefect': productDefect,
      'boxDefect': boxDefect,
      'userProductImages': userProductImages.map((x) => x.toMap()).toList(),
      'userDefectImages': userDefectImages?.map((x) => x.toMap()).toList(),
      'product': product.toMap(),
    };
  }

  factory UserWithProductSelling.fromMap(Map<String, dynamic> map) {
    return UserWithProductSelling(
      productLiveDate: map['productLiveDate'] as String,
      orderStatus: OrderStatus.fromMap(map['orderStatus'] as Map<String,dynamic>),
      userPlacedPrice: map['userPlacedPrice'].toInt() as int,
      shoeSize: ShoeSize.fromMap(map['shoeSize'] as Map<String,dynamic>),
      productCondition: ProductCondition.fromMap(map['productCondition'] as Map<String,dynamic>),
      productDefect: map['productDefect'] as bool,
      boxDefect: map['boxDefect'] as bool,
      userProductImages: List<UserProductImage>.from((map['userProductImages'] as List<int>).map<UserProductImage>((x) => UserProductImage.fromMap(x as Map<String,dynamic>),),),
      userDefectImages: List<UserDefectImage>.from((map['userDefectImages'] as List<int>).map<UserDefectImage>((x) => UserDefectImage.fromMap(x as Map<String,dynamic>),),),
      product: Product.fromMap(map['product'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserWithProductSelling.fromJson(String source) => UserWithProductSelling.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserWithProductSelling(productLiveDate: $productLiveDate, orderStatus: $orderStatus, userPlacedPrice: $userPlacedPrice, shoeSize: $shoeSize, productCondition: $productCondition, productDefect: $productDefect, boxDefect: $boxDefect, userProductImages: $userProductImages, userDefectImages: $userDefectImages, product: $product)';
  }

  @override
  bool operator ==(covariant UserWithProductSelling other) {
    if (identical(this, other)) return true;
  
    return 
      other.productLiveDate == productLiveDate &&
      other.orderStatus == orderStatus &&
      other.userPlacedPrice == userPlacedPrice &&
      other.shoeSize == shoeSize &&
      other.productCondition == productCondition &&
      other.productDefect == productDefect &&
      other.boxDefect == boxDefect &&
      listEquals(other.userProductImages, userProductImages) &&
      listEquals(other.userDefectImages, userDefectImages) &&
      other.product == product;
  }

  @override
  int get hashCode {
    return productLiveDate.hashCode ^
      orderStatus.hashCode ^
      userPlacedPrice.hashCode ^
      shoeSize.hashCode ^
      productCondition.hashCode ^
      productDefect.hashCode ^
      boxDefect.hashCode ^
      userProductImages.hashCode ^
      userDefectImages.hashCode ^
      product.hashCode;
  }
}
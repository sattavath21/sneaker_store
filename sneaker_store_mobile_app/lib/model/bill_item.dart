import 'dart:convert';

import 'package:sneaker_store_mobile_app/model/product.dart';
import 'package:sneaker_store_mobile_app/model/product_condition.dart';
import 'package:sneaker_store_mobile_app/model/shoe_size.dart';
import 'package:sneaker_store_mobile_app/model/user.dart';

class BillItem {
  final ShoeSize shoeSize;
  final ProductCondition productCondition;
  final Product product;
  final User user;
  BillItem({
    required this.shoeSize,
    required this.productCondition,
    required this.product,
    required this.user,
  });

  BillItem copyWith({
    ShoeSize? shoeSize,
    ProductCondition? productCondition,
    Product? product,
    User? user,
  }) {
    return BillItem(
      shoeSize: shoeSize ?? this.shoeSize,
      productCondition: productCondition ?? this.productCondition,
      product: product ?? this.product,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shoeSize': shoeSize.toMap(),
      'productCondition': productCondition.toMap(),
      'product': product.toMap(),
      'user': user.toMap(),
    };
  }

  factory BillItem.fromMap(Map<String, dynamic> map) {
    return BillItem(
      shoeSize: ShoeSize.fromMap(map['shoeSize'] as Map<String,dynamic>),
      productCondition: ProductCondition.fromMap(map['productCondition'] as Map<String,dynamic>),
      product: Product.fromMap(map['product'] as Map<String,dynamic>),
      user: User.fromMap(map['user'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory BillItem.fromJson(String source) => BillItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BillItem(shoeSize: $shoeSize, productCondition: $productCondition, product: $product, user: $user)';
  }

  @override
  bool operator ==(covariant BillItem other) {
    if (identical(this, other)) return true;
  
    return 
      other.shoeSize == shoeSize &&
      other.productCondition == productCondition &&
      other.product == product &&
      other.user == user;
  }

  @override
  int get hashCode {
    return shoeSize.hashCode ^
      productCondition.hashCode ^
      product.hashCode ^
      user.hashCode;
  }
}

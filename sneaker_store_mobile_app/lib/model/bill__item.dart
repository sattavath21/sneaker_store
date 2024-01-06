import 'dart:convert';

import 'product.dart';
import 'product__condition.dart';
import 'shoe__size.dart';

class Bill_item {
  final int qty;
  final Shoe_size shoe_size;
  final Product_condition product_condition;
  final Product product;
  Bill_item({
    required this.qty,
    required this.shoe_size,
    required this.product_condition,
    required this.product,
  });

  Bill_item copyWith({
    int? qty,
    Shoe_size? shoe_size,
    Product_condition? product_condition,
    Product? product,
  }) {
    return Bill_item(
      qty: qty ?? this.qty,
      shoe_size: shoe_size ?? this.shoe_size,
      product_condition: product_condition ?? this.product_condition,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'qty': qty,
      'shoe_size': shoe_size.toMap(),
      'product_condition': product_condition.toMap(),
      'product': product.toMap(),
    };
  }

  factory Bill_item.fromMap(Map<String, dynamic> map) {
    return Bill_item(
      qty: map['qty'].toInt() as int,
      shoe_size: Shoe_size.fromMap(map['shoe_size'] as Map<String,dynamic>),
      product_condition: Product_condition.fromMap(map['product_condition'] as Map<String,dynamic>),
      product: Product.fromMap(map['product'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Bill_item.fromJson(String source) => Bill_item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Bill_item(qty: $qty, shoe_size: $shoe_size, product_condition: $product_condition, product: $product)';
  }

  @override
  bool operator ==(covariant Bill_item other) {
    if (identical(this, other)) return true;
  
    return 
      other.qty == qty &&
      other.shoe_size == shoe_size &&
      other.product_condition == product_condition &&
      other.product == product;
  }

  @override
  int get hashCode {
    return qty.hashCode ^
      shoe_size.hashCode ^
      product_condition.hashCode ^
      product.hashCode;
  }
}
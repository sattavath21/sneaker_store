import 'dart:convert';

import 'product.dart';
import 'product_condition.dart';
import 'shoe_size.dart';

class BillItem {
  final int qty;
  final ShoeSize shoeSize;
  final ProductCondition productCondition;
  final Product product;
  BillItem({
    required this.qty,
    required this.shoeSize,
    required this.productCondition,
    required this.product,
  });

  BillItem copyWith({
    int? qty,
    ShoeSize? shoeSize,
    ProductCondition? productCondition,
    Product? product,
  }) {
    return BillItem(
      qty: qty ?? this.qty,
      shoeSize: shoeSize ?? this.shoeSize,
      productCondition: productCondition ?? this.productCondition,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'qty': qty,
      'shoeSize': shoeSize.toMap(),
      'productCondition': productCondition.toMap(),
      'product': product.toMap(),
    };
  }

  factory BillItem.fromMap(Map<String, dynamic> map) {
    return BillItem(
      qty: map['qty'].toInt() as int,
      shoeSize: ShoeSize.fromMap(map['shoeSize'] as Map<String,dynamic>),
      productCondition: ProductCondition.fromMap(map['productCondition'] as Map<String,dynamic>),
      product: Product.fromMap(map['product'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory BillItem.fromJson(String source) => BillItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BillItem(qty: $qty, shoeSize: $shoeSize, productCondition: $productCondition, product: $product)';
  }

  @override
  bool operator ==(covariant BillItem other) {
    if (identical(this, other)) return true;
  
    return 
      other.qty == qty &&
      other.shoeSize == shoeSize &&
      other.productCondition == productCondition &&
      other.product == product;
  }

  @override
  int get hashCode {
    return qty.hashCode ^
      shoeSize.hashCode ^
      productCondition.hashCode ^
      product.hashCode;
  }
}
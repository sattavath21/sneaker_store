import 'dart:convert';

import 'shoe_size.dart';

class ProductWithSize {
  final int inventoryQty;
  final ShoeSize shoeSize;
  ProductWithSize({
    required this.inventoryQty,
    required this.shoeSize,
  });

  ProductWithSize copyWith({
    int? inventoryQty,
    ShoeSize? shoeSize,
  }) {
    return ProductWithSize(
      inventoryQty: inventoryQty ?? this.inventoryQty,
      shoeSize: shoeSize ?? this.shoeSize,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'inventoryQty': inventoryQty,
      'shoeSize': shoeSize.toMap(),
    };
  }

  factory ProductWithSize.fromMap(Map<String, dynamic> map) {
    return ProductWithSize(
      inventoryQty: map['inventoryQty'].toInt() as int,
      shoeSize: ShoeSize.fromMap(map['shoeSize'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductWithSize.fromJson(String source) => ProductWithSize.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductWithSize(inventoryQty: $inventoryQty, shoeSize: $shoeSize)';

  @override
  bool operator ==(covariant ProductWithSize other) {
    if (identical(this, other)) return true;
  
    return 
      other.inventoryQty == inventoryQty &&
      other.shoeSize == shoeSize;
  }

  @override
  int get hashCode => inventoryQty.hashCode ^ shoeSize.hashCode;
}
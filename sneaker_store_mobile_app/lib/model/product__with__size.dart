import 'dart:convert';

import 'shoe__size.dart';

class Product_with_size {
  final int inventory_qty;
  final Shoe_size shoe_size;
  Product_with_size({
    required this.inventory_qty,
    required this.shoe_size,
  });

  Product_with_size copyWith({
    int? inventory_qty,
    Shoe_size? shoe_size,
  }) {
    return Product_with_size(
      inventory_qty: inventory_qty ?? this.inventory_qty,
      shoe_size: shoe_size ?? this.shoe_size,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'inventory_qty': inventory_qty,
      'shoe_size': shoe_size.toMap(),
    };
  }

  factory Product_with_size.fromMap(Map<String, dynamic> map) {
    return Product_with_size(
      inventory_qty: map['inventory_qty'].toInt() as int,
      shoe_size: Shoe_size.fromMap(map['shoe_size'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product_with_size.fromJson(String source) => Product_with_size.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Product_with_size(inventory_qty: $inventory_qty, shoe_size: $shoe_size)';

  @override
  bool operator ==(covariant Product_with_size other) {
    if (identical(this, other)) return true;
  
    return 
      other.inventory_qty == inventory_qty &&
      other.shoe_size == shoe_size;
  }

  @override
  int get hashCode => inventory_qty.hashCode ^ shoe_size.hashCode;
}
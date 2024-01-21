import 'dart:convert';

import 'product.dart';
import 'shoe_size.dart';

class CustomerWishlist {
  final ShoeSize shoeSize;
  final Product product;
  CustomerWishlist({
    required this.shoeSize,
    required this.product,
  });

  CustomerWishlist copyWith({
    ShoeSize? shoeSize,
    Product? product,
  }) {
    return CustomerWishlist(
      shoeSize: shoeSize ?? this.shoeSize,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shoeSize': shoeSize.toMap(),
      'product': product.toMap(),
    };
  }

  factory CustomerWishlist.fromMap(Map<String, dynamic> map) {
    return CustomerWishlist(
      shoeSize: ShoeSize.fromMap(map['shoeSize'] as Map<String,dynamic>),
      product: Product.fromMap(map['product'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerWishlist.fromJson(String source) => CustomerWishlist.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CustomerWishlist(shoeSize: $shoeSize, product: $product)';

  @override
  bool operator ==(covariant CustomerWishlist other) {
    if (identical(this, other)) return true;
  
    return 
      other.shoeSize == shoeSize &&
      other.product == product;
  }

  @override
  int get hashCode => shoeSize.hashCode ^ product.hashCode;
}
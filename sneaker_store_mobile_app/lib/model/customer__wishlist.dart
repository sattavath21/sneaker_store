import 'dart:convert';

import 'package:sneaker_store_mobile_app/model/product.dart';
import 'package:sneaker_store_mobile_app/model/shoe__size.dart';

class Customer_wishlist {
  final Shoe_size shoe_size;
  final Product product;
  Customer_wishlist({
    required this.shoe_size,
    required this.product,
  });

  Customer_wishlist copyWith({
    Shoe_size? shoe_size,
    Product? product,
  }) {
    return Customer_wishlist(
      shoe_size: shoe_size ?? this.shoe_size,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shoe_size': shoe_size.toMap(),
      'product': product.toMap(),
    };
  }

  factory Customer_wishlist.fromMap(Map<String, dynamic> map) {
    return Customer_wishlist(
      shoe_size: Shoe_size.fromMap(map['shoe_size'] as Map<String,dynamic>),
      product: Product.fromMap(map['product'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer_wishlist.fromJson(String source) => Customer_wishlist.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Customer_wishlist(shoe_size: $shoe_size, product: $product)';

  @override
  bool operator ==(covariant Customer_wishlist other) {
    if (identical(this, other)) return true;
  
    return 
      other.shoe_size == shoe_size &&
      other.product == product;
  }

  @override
  int get hashCode => shoe_size.hashCode ^ product.hashCode;
}






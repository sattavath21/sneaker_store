import 'dart:convert';

import 'product.dart';
import 'shoe_size.dart';

class UserWishlist {
  final ShoeSize shoeSize;
  final Product product;
  UserWishlist({
    required this.shoeSize,
    required this.product,
  });

  UserWishlist copyWith({
    ShoeSize? shoeSize,
    Product? product,
  }) {
    return UserWishlist(
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

  factory UserWishlist.fromMap(Map<String, dynamic> map) {
    return UserWishlist(
      shoeSize: ShoeSize.fromMap(map['shoeSize'] as Map<String,dynamic>),
      product: Product.fromMap(map['product'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserWishlist.fromJson(String source) => UserWishlist.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserWishlist(shoeSize: $shoeSize, product: $product)';

  @override
  bool operator ==(covariant UserWishlist other) {
    if (identical(this, other)) return true;
  
    return 
      other.shoeSize == shoeSize &&
      other.product == product;
  }

  @override
  int get hashCode => shoeSize.hashCode ^ product.hashCode;
}
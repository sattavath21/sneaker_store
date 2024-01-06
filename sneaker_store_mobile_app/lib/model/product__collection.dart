import 'dart:convert';

import 'brand.dart';

class Product_collection {
  final String collection_name;
  final Brand brand;
  Product_collection({
    required this.collection_name,
    required this.brand,
  });

  Product_collection copyWith({
    String? collection_name,
    Brand? brand,
  }) {
    return Product_collection(
      collection_name: collection_name ?? this.collection_name,
      brand: brand ?? this.brand,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'collection_name': collection_name,
      'brand': brand.toMap(),
    };
  }

  factory Product_collection.fromMap(Map<String, dynamic> map) {
    return Product_collection(
      collection_name: map['collection_name'] as String,
      brand: Brand.fromMap(map['brand'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product_collection.fromJson(String source) => Product_collection.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Product_collection(collection_name: $collection_name, brand: $brand)';

  @override
  bool operator ==(covariant Product_collection other) {
    if (identical(this, other)) return true;
  
    return 
      other.collection_name == collection_name &&
      other.brand == brand;
  }

  @override
  int get hashCode => collection_name.hashCode ^ brand.hashCode;
}
import 'dart:convert';

import 'brand.dart';

class ProductCollection {
  final String collectionName;
  final Brand brand;
  ProductCollection({
    required this.collectionName,
    required this.brand,
  });

  ProductCollection copyWith({
    String? collectionName,
    Brand? brand,
  }) {
    return ProductCollection(
      collectionName: collectionName ?? this.collectionName,
      brand: brand ?? this.brand,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'collectionName': collectionName,
      'brand': brand.toMap(),
    };
  }

  factory ProductCollection.fromMap(Map<String, dynamic> map) {
    return ProductCollection(
      collectionName: map['collectionName'] as String,
      brand: Brand.fromMap(map['brand'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCollection.fromJson(String source) => ProductCollection.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductCollection(collectionName: $collectionName, brand: $brand)';

  @override
  bool operator ==(covariant ProductCollection other) {
    if (identical(this, other)) return true;
  
    return 
      other.collectionName == collectionName &&
      other.brand == brand;
  }

  @override
  int get hashCode => collectionName.hashCode ^ brand.hashCode;
}
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sneaker_store_mobile_app/model/product_cat.dart';
import 'package:sneaker_store_mobile_app/model/product_collection.dart';
import 'package:sneaker_store_mobile_app/model/product_image.dart';
import 'package:sneaker_store_mobile_app/model/product_with_size.dart';

class Product {
  final String name;
  int? startingPrice;
  final int retailPrice;
  int? lastSalePrice;
  final String SKU;
  final String colorway;
  final String releaseDate;
  final int amountSold;
  final List<ProductWithSize> productWithSizes;
  final ProductCollection productCollection;
  final ProductCat productCat;
  final List<ProductImage> productImages;
  Product({
    required this.name,
    this.startingPrice,
    required this.retailPrice,
  this.lastSalePrice,
    required this.SKU,
    required this.colorway,
    required this.releaseDate,
    required this.amountSold,
    required this.productWithSizes,
    required this.productCollection,
    required this.productCat,
    required this.productImages,
  });

  Product copyWith({
    String? name,
    int? startingPrice,
    int? retailPrice,
    int? lastSalePrice,
    String? SKU,
    String? colorway,
    String? releaseDate,
    int? amountSold,
    List<ProductWithSize>? productWithSizes,
    ProductCollection? productCollection,
    ProductCat? productCat,
    List<ProductImage>? productImages,
  }) {
    return Product(
      name: name ?? this.name,
      startingPrice: startingPrice ?? this.startingPrice,
      retailPrice: retailPrice ?? this.retailPrice,
      lastSalePrice: lastSalePrice ?? this.lastSalePrice,
      SKU: SKU ?? this.SKU,
      colorway: colorway ?? this.colorway,
      releaseDate: releaseDate ?? this.releaseDate,
      amountSold: amountSold ?? this.amountSold,
      productWithSizes: productWithSizes ?? this.productWithSizes,
      productCollection: productCollection ?? this.productCollection,
      productCat: productCat ?? this.productCat,
      productImages: productImages ?? this.productImages,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'startingPrice': startingPrice,
      'retailPrice': retailPrice,
      'lastSalePrice': lastSalePrice,
      'SKU': SKU,
      'colorway': colorway,
      'releaseDate': releaseDate,
      'amountSold': amountSold,
      'productWithSizes': productWithSizes.map((x) => x.toMap()).toList(),
      'productCollection': productCollection.toMap(),
      'productCat': productCat.toMap(),
      'productImages': productImages.map((x) => x.toMap()).toList(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      startingPrice: map['startingPrice'].toInt() as int,
      retailPrice: map['retailPrice'].toInt() as int,
      lastSalePrice: map['lastSalePrice'].toInt() as int,
      SKU: map['SKU'] as String,
      colorway: map['colorway'] as String,
      releaseDate: map['releaseDate'] as String,
      amountSold: map['amountSold'].toInt() as int,
      productWithSizes: List<ProductWithSize>.from((map['productWithSizes'] as List<int>).map<ProductWithSize>((x) => ProductWithSize.fromMap(x as Map<String,dynamic>),),),
      productCollection: ProductCollection.fromMap(map['productCollection'] as Map<String,dynamic>),
      productCat: ProductCat.fromMap(map['productCat'] as Map<String,dynamic>),
      productImages: List<ProductImage>.from((map['productImages'] as List<int>).map<ProductImage>((x) => ProductImage.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(name: $name, startingPrice: $startingPrice, retailPrice: $retailPrice, lastSalePrice: $lastSalePrice, SKU: $SKU, colorway: $colorway, releaseDate: $releaseDate, amountSold: $amountSold, productWithSizes: $productWithSizes, productCollection: $productCollection, productCat: $productCat, productImages: $productImages)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.startingPrice == startingPrice &&
      other.retailPrice == retailPrice &&
      other.lastSalePrice == lastSalePrice &&
      other.SKU == SKU &&
      other.colorway == colorway &&
      other.releaseDate == releaseDate &&
      other.amountSold == amountSold &&
      listEquals(other.productWithSizes, productWithSizes) &&
      other.productCollection == productCollection &&
      other.productCat == productCat &&
      listEquals(other.productImages, productImages);
  }

  @override
  int get hashCode {
    return name.hashCode ^
      startingPrice.hashCode ^
      retailPrice.hashCode ^
      lastSalePrice.hashCode ^
      SKU.hashCode ^
      colorway.hashCode ^
      releaseDate.hashCode ^
      amountSold.hashCode ^
      productWithSizes.hashCode ^
      productCollection.hashCode ^
      productCat.hashCode ^
      productImages.hashCode;
  }
}

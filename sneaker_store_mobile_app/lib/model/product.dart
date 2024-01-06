import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sneaker_store_mobile_app/model/product__cat.dart';
import 'package:sneaker_store_mobile_app/model/product__collection.dart';
import 'package:sneaker_store_mobile_app/model/product__image.dart';
import 'package:sneaker_store_mobile_app/model/product__with__size.dart';

class Product {
  final String name;
  final int store_price;
  final int? lowest_selling_price;
  final String SKU;
  final String colorway;
  final String release_date;
  final int amount_sold;
  final List<Product_with_size> product_with_sizes;
  final Product_collection product_collection;
  final Product_cat product_cat;
  final List<Product_image> product_images;
  Product({
    required this.name,
    required this.store_price,
    this.lowest_selling_price,
    required this.SKU,
    required this.colorway,
    required this.release_date,
    required this.amount_sold,
    required this.product_with_sizes,
    required this.product_collection,
    required this.product_cat,
    required this.product_images,
  });

  Product copyWith({
    String? name,
    int? store_price,
    int? lowest_selling_price,
    String? SKU,
    String? colorway,
    String? release_date,
    int? amount_sold,
    List<Product_with_size>? product_with_sizes,
    Product_collection? product_collection,
    Product_cat? product_cat,
    List<Product_image>? product_images,
  }) {
    return Product(
      name: name ?? this.name,
      store_price: store_price ?? this.store_price,
      lowest_selling_price: lowest_selling_price ?? this.lowest_selling_price,
      SKU: SKU ?? this.SKU,
      colorway: colorway ?? this.colorway,
      release_date: release_date ?? this.release_date,
      amount_sold: amount_sold ?? this.amount_sold,
      product_with_sizes: product_with_sizes ?? this.product_with_sizes,
      product_collection: product_collection ?? this.product_collection,
      product_cat: product_cat ?? this.product_cat,
      product_images: product_images ?? this.product_images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'store_price': store_price,
      'lowest_selling_price': lowest_selling_price,
      'SKU': SKU,
      'colorway': colorway,
      'release_date': release_date,
      'amount_sold': amount_sold,
      'product_with_sizes': product_with_sizes.map((x) => x.toMap()).toList(),
      'product_collection': product_collection.toMap(),
      'product_cat': product_cat.toMap(),
      'product_images': product_images.map((x) => x.toMap()).toList(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      store_price: map['store_price'].toInt() as int,
      lowest_selling_price: map['lowest_selling_price'].toInt() as int,
      SKU: map['SKU'] as String,
      colorway: map['colorway'] as String,
      release_date: map['release_date'] as String,
      amount_sold: map['amount_sold'].toInt() as int,
      product_with_sizes: List<Product_with_size>.from((map['product_with_sizes'] as List<int>).map<Product_with_size>((x) => Product_with_size.fromMap(x as Map<String,dynamic>),),),
      product_collection: Product_collection.fromMap(map['product_collection'] as Map<String,dynamic>),
      product_cat: Product_cat.fromMap(map['product_cat'] as Map<String,dynamic>),
      product_images: List<Product_image>.from((map['product_images'] as List<int>).map<Product_image>((x) => Product_image.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(name: $name, store_price: $store_price, lowest_selling_price: $lowest_selling_price, SKU: $SKU, colorway: $colorway, release_date: $release_date, amount_sold: $amount_sold, product_with_sizes: $product_with_sizes, product_collection: $product_collection, product_cat: $product_cat, product_images: $product_images)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.store_price == store_price &&
      other.lowest_selling_price == lowest_selling_price &&
      other.SKU == SKU &&
      other.colorway == colorway &&
      other.release_date == release_date &&
      other.amount_sold == amount_sold &&
      listEquals(other.product_with_sizes, product_with_sizes) &&
      other.product_collection == product_collection &&
      other.product_cat == product_cat &&
      listEquals(other.product_images, product_images);
  }

  @override
  int get hashCode {
    return name.hashCode ^
      store_price.hashCode ^
      lowest_selling_price.hashCode ^
      SKU.hashCode ^
      colorway.hashCode ^
      release_date.hashCode ^
      amount_sold.hashCode ^
      product_with_sizes.hashCode ^
      product_collection.hashCode ^
      product_cat.hashCode ^
      product_images.hashCode;
  }
}

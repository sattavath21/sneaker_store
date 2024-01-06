import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'customer__defect__image.dart';
import 'customer__product__image.dart';
import 'order__status.dart';
import 'product.dart';
import 'product__condition.dart';
import 'shoe__size.dart';

class Product_selling {
  final String product_live_date;
  final Order_status order_status;
  final int customer_placed_price;
  final int qty;
  final Shoe_size shoe_size;
  final Product_condition product_condition;
  final bool product_defect;
  final bool box_defect;
  final List<Customer_product_image> customer_product_images;
  final List<Customer_defect_image> customer_defect_images;
  final Product product;
  Product_selling({
    required this.product_live_date,
    required this.order_status,
    required this.customer_placed_price,
    required this.qty,
    required this.shoe_size,
    required this.product_condition,
    required this.product_defect,
    required this.box_defect,
    required this.customer_product_images,
    required this.customer_defect_images,
    required this.product,
  });

  Product_selling copyWith({
    String? product_live_date,
    Order_status? order_status,
    int? customer_placed_price,
    int? qty,
    Shoe_size? shoe_size,
    Product_condition? product_condition,
    bool? product_defect,
    bool? box_defect,
    List<Customer_product_image>? customer_product_images,
    List<Customer_defect_image>? customer_defect_images,
    Product? product,
  }) {
    return Product_selling(
      product_live_date: product_live_date ?? this.product_live_date,
      order_status: order_status ?? this.order_status,
      customer_placed_price: customer_placed_price ?? this.customer_placed_price,
      qty: qty ?? this.qty,
      shoe_size: shoe_size ?? this.shoe_size,
      product_condition: product_condition ?? this.product_condition,
      product_defect: product_defect ?? this.product_defect,
      box_defect: box_defect ?? this.box_defect,
      customer_product_images: customer_product_images ?? this.customer_product_images,
      customer_defect_images: customer_defect_images ?? this.customer_defect_images,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product_live_date': product_live_date,
      'order_status': order_status.toMap(),
      'customer_placed_price': customer_placed_price,
      'qty': qty,
      'shoe_size': shoe_size.toMap(),
      'product_condition': product_condition.toMap(),
      'product_defect': product_defect,
      'box_defect': box_defect,
      'customer_product_images': customer_product_images.map((x) => x.toMap()).toList(),
      'customer_defect_images': customer_defect_images.map((x) => x.toMap()).toList(),
      'product': product.toMap(),
    };
  }

  factory Product_selling.fromMap(Map<String, dynamic> map) {
    return Product_selling(
      product_live_date: map['product_live_date'] as String,
      order_status: Order_status.fromMap(map['order_status'] as Map<String,dynamic>),
      customer_placed_price: map['customer_placed_price'].toInt() as int,
      qty: map['qty'].toInt() as int,
      shoe_size: Shoe_size.fromMap(map['shoe_size'] as Map<String,dynamic>),
      product_condition: Product_condition.fromMap(map['product_condition'] as Map<String,dynamic>),
      product_defect: map['product_defect'] as bool,
      box_defect: map['box_defect'] as bool,
      customer_product_images: List<Customer_product_image>.from((map['customer_product_images'] as List<int>).map<Customer_product_image>((x) => Customer_product_image.fromMap(x as Map<String,dynamic>),),),
      customer_defect_images: List<Customer_defect_image>.from((map['customer_defect_images'] as List<int>).map<Customer_defect_image>((x) => Customer_defect_image.fromMap(x as Map<String,dynamic>),),),
      product: Product.fromMap(map['product'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product_selling.fromJson(String source) => Product_selling.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product_selling(product_live_date: $product_live_date, order_status: $order_status, customer_placed_price: $customer_placed_price, qty: $qty, shoe_size: $shoe_size, product_condition: $product_condition, product_defect: $product_defect, box_defect: $box_defect, customer_product_images: $customer_product_images, customer_defect_images: $customer_defect_images, product: $product)';
  }

  @override
  bool operator ==(covariant Product_selling other) {
    if (identical(this, other)) return true;
  
    return 
      other.product_live_date == product_live_date &&
      other.order_status == order_status &&
      other.customer_placed_price == customer_placed_price &&
      other.qty == qty &&
      other.shoe_size == shoe_size &&
      other.product_condition == product_condition &&
      other.product_defect == product_defect &&
      other.box_defect == box_defect &&
      listEquals(other.customer_product_images, customer_product_images) &&
      listEquals(other.customer_defect_images, customer_defect_images) &&
      other.product == product;
  }

  @override
  int get hashCode {
    return product_live_date.hashCode ^
      order_status.hashCode ^
      customer_placed_price.hashCode ^
      qty.hashCode ^
      shoe_size.hashCode ^
      product_condition.hashCode ^
      product_defect.hashCode ^
      box_defect.hashCode ^
      customer_product_images.hashCode ^
      customer_defect_images.hashCode ^
      product.hashCode;
  }
}
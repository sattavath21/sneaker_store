import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'bill__item.dart';
import 'customer.dart';
import 'delivery__branch.dart';
import 'delivery__receipt__pic.dart';
import 'discount.dart';
import 'order__status.dart';
import 'shipping__method.dart';
import 'store__branch.dart';

class Bill {
  final String order_date;
  final String status_date;
  final Order_status order_status;
  final Discount? discount;
  final List<Delivery_receipt_pic> delivery_receipt_pics;
  final Store_branch store_branch;
  final Customer customer;
  final Delivery_branch delivery_branch;
  final Shipping_method shipping_method;
  final List<Bill_item> bill_items;
  Bill({
    required this.order_date,
    required this.status_date,
    required this.order_status,
    this.discount,
    required this.delivery_receipt_pics,
    required this.store_branch,
    required this.customer,
    required this.delivery_branch,
    required this.shipping_method,
    required this.bill_items,
  });

  Bill copyWith({
    String? order_date,
    String? status_date,
    Order_status? order_status,
    Discount? discount,
    List<Delivery_receipt_pic>? delivery_receipt_pics,
    Store_branch? store_branch,
    Customer? customer,
    Delivery_branch? delivery_branch,
    Shipping_method? shipping_method,
    List<Bill_item>? bill_items,
  }) {
    return Bill(
      order_date: order_date ?? this.order_date,
      status_date: status_date ?? this.status_date,
      order_status: order_status ?? this.order_status,
      discount: discount ?? this.discount,
      delivery_receipt_pics: delivery_receipt_pics ?? this.delivery_receipt_pics,
      store_branch: store_branch ?? this.store_branch,
      customer: customer ?? this.customer,
      delivery_branch: delivery_branch ?? this.delivery_branch,
      shipping_method: shipping_method ?? this.shipping_method,
      bill_items: bill_items ?? this.bill_items,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'order_date': order_date,
      'status_date': status_date,
      'order_status': order_status.toMap(),
      'discount': discount?.toMap(),
      'delivery_receipt_pics': delivery_receipt_pics.map((x) => x.toMap()).toList(),
      'store_branch': store_branch.toMap(),
      'customer': customer.toMap(),
      'delivery_branch': delivery_branch.toMap(),
      'shipping_method': shipping_method.toMap(),
      'bill_items': bill_items.map((x) => x.toMap()).toList(),
    };
  }

  factory Bill.fromMap(Map<String, dynamic> map) {
    return Bill(
      order_date: map['order_date'] as String,
      status_date: map['status_date'] as String,
      order_status: Order_status.fromMap(map['order_status'] as Map<String,dynamic>),
      discount: Discount.fromMap(map['discount'] as Map<String,dynamic>),
      delivery_receipt_pics: List<Delivery_receipt_pic>.from((map['delivery_receipt_pics'] as List<int>).map<Delivery_receipt_pic>((x) => Delivery_receipt_pic.fromMap(x as Map<String,dynamic>),),),
      store_branch: Store_branch.fromMap(map['store_branch'] as Map<String,dynamic>),
      customer: Customer.fromMap(map['customer'] as Map<String,dynamic>),
      delivery_branch: Delivery_branch.fromMap(map['delivery_branch'] as Map<String,dynamic>),
      shipping_method: Shipping_method.fromMap(map['shipping_method'] as Map<String,dynamic>),
      bill_items: List<Bill_item>.from((map['bill_items'] as List<int>).map<Bill_item>((x) => Bill_item.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Bill.fromJson(String source) => Bill.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Bill(order_date: $order_date, status_date: $status_date, order_status: $order_status, discount: $discount, delivery_receipt_pics: $delivery_receipt_pics, store_branch: $store_branch, customer: $customer, delivery_branch: $delivery_branch, shipping_method: $shipping_method, bill_items: $bill_items)';
  }

  @override
  bool operator ==(covariant Bill other) {
    if (identical(this, other)) return true;
  
    return 
      other.order_date == order_date &&
      other.status_date == status_date &&
      other.order_status == order_status &&
      other.discount == discount &&
      listEquals(other.delivery_receipt_pics, delivery_receipt_pics) &&
      other.store_branch == store_branch &&
      other.customer == customer &&
      other.delivery_branch == delivery_branch &&
      other.shipping_method == shipping_method &&
      listEquals(other.bill_items, bill_items);
  }

  @override
  int get hashCode {
    return order_date.hashCode ^
      status_date.hashCode ^
      order_status.hashCode ^
      discount.hashCode ^
      delivery_receipt_pics.hashCode ^
      store_branch.hashCode ^
      customer.hashCode ^
      delivery_branch.hashCode ^
      shipping_method.hashCode ^
      bill_items.hashCode;
  }
}
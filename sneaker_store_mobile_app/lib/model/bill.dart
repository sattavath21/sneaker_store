import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'bill_item.dart';
import 'user.dart';
import 'delivery_branch.dart';
import 'delivery_receipt_pic.dart';
import 'discount.dart';
import 'order_status.dart';
import 'shipping_method.dart';
import 'store_branch.dart';

class Bill {
  final String orderDate;
  final String statusDate;
  final OrderStatus orderStatus;
  Discount? discount;
   List<DeliveryReceiptPic>? deliveryReceiptPics;
  final StoreBranch storeBranch;
  final User user;
  final DeliveryBranch deliveryBranch;
  final ShippingMethod shippingMethod;
  final List<BillItem> billItems;
  Bill({
    required this.orderDate,
    required this.statusDate,
    required this.orderStatus,
    this.discount,
     this.deliveryReceiptPics,
    required this.storeBranch,
    required this.user,
    required this.deliveryBranch,
    required this.shippingMethod,
    required this.billItems,
  });

  Bill copyWith({
    String? orderDate,
    String? statusDate,
    OrderStatus? orderStatus,
    Discount? discount,
    List<DeliveryReceiptPic>? deliveryReceiptPics,
    StoreBranch? storeBranch,
    User? user,
    DeliveryBranch? deliveryBranch,
    ShippingMethod? shippingMethod,
    List<BillItem>? billItems,
  }) {
    return Bill(
      orderDate: orderDate ?? this.orderDate,
      statusDate: statusDate ?? this.statusDate,
      orderStatus: orderStatus ?? this.orderStatus,
      discount: discount ?? this.discount,
      deliveryReceiptPics: deliveryReceiptPics ?? this.deliveryReceiptPics,
      storeBranch: storeBranch ?? this.storeBranch,
      user: user ?? this.user,
      deliveryBranch: deliveryBranch ?? this.deliveryBranch,
      shippingMethod: shippingMethod ?? this.shippingMethod,
      billItems: billItems ?? this.billItems,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderDate': orderDate,
      'statusDate': statusDate,
      'orderStatus': orderStatus.toMap(),
      'discount': discount?.toMap(),
      'deliveryReceiptPics': deliveryReceiptPics?.map((x) => x.toMap()).toList(),
      'storeBranch': storeBranch.toMap(),
      'user': user.toMap(),
      'deliveryBranch': deliveryBranch.toMap(),
      'shippingMethod': shippingMethod.toMap(),
      'billItems': billItems.map((x) => x.toMap()).toList(),
    };
  }

  factory Bill.fromMap(Map<String, dynamic> map) {
    return Bill(
      orderDate: map['orderDate'] as String,
      statusDate: map['statusDate'] as String,
      orderStatus: OrderStatus.fromMap(map['orderStatus'] as Map<String,dynamic>),
      discount: Discount.fromMap(map['discount'] as Map<String,dynamic>),
      deliveryReceiptPics: List<DeliveryReceiptPic>.from((map['deliveryReceiptPics'] as List<int>).map<DeliveryReceiptPic>((x) => DeliveryReceiptPic.fromMap(x as Map<String,dynamic>),),),
      storeBranch: StoreBranch.fromMap(map['storeBranch'] as Map<String,dynamic>),
      user: User.fromMap(map['user'] as Map<String,dynamic>),
      deliveryBranch: DeliveryBranch.fromMap(map['deliveryBranch'] as Map<String,dynamic>),
      shippingMethod: ShippingMethod.fromMap(map['shippingMethod'] as Map<String,dynamic>),
      billItems: List<BillItem>.from((map['billItems'] as List<int>).map<BillItem>((x) => BillItem.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Bill.fromJson(String source) => Bill.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Bill(orderDate: $orderDate, statusDate: $statusDate, orderStatus: $orderStatus, discount: $discount, deliveryReceiptPics: $deliveryReceiptPics, storeBranch: $storeBranch, user: $user, deliveryBranch: $deliveryBranch, shippingMethod: $shippingMethod, billItems: $billItems)';
  }

  @override
  bool operator ==(covariant Bill other) {
    if (identical(this, other)) return true;
  
    return 
      other.orderDate == orderDate &&
      other.statusDate == statusDate &&
      other.orderStatus == orderStatus &&
      other.discount == discount &&
      listEquals(other.deliveryReceiptPics, deliveryReceiptPics) &&
      other.storeBranch == storeBranch &&
      other.user == user &&
      other.deliveryBranch == deliveryBranch &&
      other.shippingMethod == shippingMethod &&
      listEquals(other.billItems, billItems);
  }

  @override
  int get hashCode {
    return orderDate.hashCode ^
      statusDate.hashCode ^
      orderStatus.hashCode ^
      discount.hashCode ^
      deliveryReceiptPics.hashCode ^
      storeBranch.hashCode ^
      user.hashCode ^
      deliveryBranch.hashCode ^
      shippingMethod.hashCode ^
      billItems.hashCode;
  }
}
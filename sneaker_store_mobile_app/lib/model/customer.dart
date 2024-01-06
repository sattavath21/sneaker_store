import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'customer__addresse.dart';
import 'customer__bank__account.dart';
import 'customer__wishlist.dart';
import 'product__selling.dart';

class Customer {
  final String first_name;
  final String last_name;
  final String age;
  bool vacation_mode = false;
  bool email_subscribtion = true;
  int default_address = 0;
  final List<Customer_addresse>? customer_addresses;
  final List<Customer_bank_account> customer_bank_accounts;
  final List<Customer_wishlist>? customer_wishlists;
  final List<Product_selling>? product_sellings;
  Customer({
    required this.first_name,
    required this.last_name,
    required this.age,
    required this.vacation_mode,
    required this.email_subscribtion,
    required this.default_address,
    this.customer_addresses,
    required this.customer_bank_accounts,
    this.customer_wishlists,
    this.product_sellings,
  });

  Customer copyWith({
    String? first_name,
    String? last_name,
    String? age,
    bool? vacation_mode,
    bool? email_subscribtion,
    int? default_address,
    List<Customer_addresse>? customer_addresses,
    List<Customer_bank_account>? customer_bank_accounts,
    List<Customer_wishlist>? customer_wishlists,
    List<Product_selling>? product_sellings,
  }) {
    return Customer(
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      age: age ?? this.age,
      vacation_mode: vacation_mode ?? this.vacation_mode,
      email_subscribtion: email_subscribtion ?? this.email_subscribtion,
      default_address: default_address ?? this.default_address,
      customer_addresses: customer_addresses ?? this.customer_addresses,
      customer_bank_accounts: customer_bank_accounts ?? this.customer_bank_accounts,
      customer_wishlists: customer_wishlists ?? this.customer_wishlists,
      product_sellings: product_sellings ?? this.product_sellings,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first_name': first_name,
      'last_name': last_name,
      'age': age,
      'vacation_mode': vacation_mode,
      'email_subscribtion': email_subscribtion,
      'default_address': default_address,
      'customer_addresses': customer_addresses?.map((x) => x.toMap()).toList(),
      'customer_bank_accounts': customer_bank_accounts.map((x) => x.toMap()).toList(),
      'customer_wishlists': customer_wishlists?.map((x) => x.toMap()).toList(),
      'product_sellings': product_sellings?.map((x) => x.toMap()).toList(),
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      first_name: map['first_name'] as String,
      last_name: map['last_name'] as String,
      age: map['age'] as String,
      vacation_mode: map['vacation_mode'] as bool,
      email_subscribtion: map['email_subscribtion'] as bool,
      default_address: map['default_address'].toInt() as int,
      customer_addresses: List<Customer_addresse>.from((map['customer_addresses'] as List<int>).map<Customer_addresse>((x) => Customer_addresse.fromMap(x as Map<String,dynamic>),),),
      customer_bank_accounts: List<Customer_bank_account>.from((map['customer_bank_accounts'] as List<int>).map<Customer_bank_account>((x) => Customer_bank_account.fromMap(x as Map<String,dynamic>),),),
      customer_wishlists: List<Customer_wishlist>.from((map['customer_wishlists'] as List<int>).map<Customer_wishlist>((x) => Customer_wishlist.fromMap(x as Map<String,dynamic>),),),
      product_sellings: List<Product_selling>.from((map['product_sellings'] as List<int>).map<Product_selling>((x) => Product_selling.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) => Customer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Customer(first_name: $first_name, last_name: $last_name, age: $age, vacation_mode: $vacation_mode, email_subscribtion: $email_subscribtion, default_address: $default_address, customer_addresses: $customer_addresses, customer_bank_accounts: $customer_bank_accounts, customer_wishlists: $customer_wishlists, product_sellings: $product_sellings)';
  }

  @override
  bool operator ==(covariant Customer other) {
    if (identical(this, other)) return true;
  
    return 
      other.first_name == first_name &&
      other.last_name == last_name &&
      other.age == age &&
      other.vacation_mode == vacation_mode &&
      other.email_subscribtion == email_subscribtion &&
      other.default_address == default_address &&
      listEquals(other.customer_addresses, customer_addresses) &&
      listEquals(other.customer_bank_accounts, customer_bank_accounts) &&
      listEquals(other.customer_wishlists, customer_wishlists) &&
      listEquals(other.product_sellings, product_sellings);
  }

  @override
  int get hashCode {
    return first_name.hashCode ^
      last_name.hashCode ^
      age.hashCode ^
      vacation_mode.hashCode ^
      email_subscribtion.hashCode ^
      default_address.hashCode ^
      customer_addresses.hashCode ^
      customer_bank_accounts.hashCode ^
      customer_wishlists.hashCode ^
      product_sellings.hashCode;
  }
}
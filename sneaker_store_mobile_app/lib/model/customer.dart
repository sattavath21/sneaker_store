import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sneaker_store_mobile_app/model/customer_addresse.dart';
import 'package:sneaker_store_mobile_app/model/customer_bank_account.dart';
import 'package:sneaker_store_mobile_app/model/customer_wishlist.dart';
import 'package:sneaker_store_mobile_app/model/product_selling.dart';

class Customer {
  final String firstName;
  final String lastName;
  final String age;
  final String birthday;
  final String email;
  final bool vacationMode;
  final bool emailSubscribtion;
  final int defaultAddress;
  final List<CustomerAddresse> customerAddresses;
  final List<CustomerBankAccount> customerBankAccounts;
  final List<CustomerWishlist> customerWishlists;
  final List<ProductSelling> productSellings;
  Customer({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.birthday,
    required this.email,
    required this.vacationMode,
    required this.emailSubscribtion,
    required this.defaultAddress,
    required this.customerAddresses,
    required this.customerBankAccounts,
    required this.customerWishlists,
    required this.productSellings,
  });

  Customer copyWith({
    String? firstName,
    String? lastName,
    String? age,
    String? birthday,
    String? email,
    bool? vacationMode,
    bool? emailSubscribtion,
    int? defaultAddress,
    List<CustomerAddresse>? customerAddresses,
    List<CustomerBankAccount>? customerBankAccounts,
    List<CustomerWishlist>? customerWishlists,
    List<ProductSelling>? productSellings,
  }) {
    return Customer(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      birthday: birthday ?? this.birthday,
      email: email ?? this.email,
      vacationMode: vacationMode ?? this.vacationMode,
      emailSubscribtion: emailSubscribtion ?? this.emailSubscribtion,
      defaultAddress: defaultAddress ?? this.defaultAddress,
      customerAddresses: customerAddresses ?? this.customerAddresses,
      customerBankAccounts: customerBankAccounts ?? this.customerBankAccounts,
      customerWishlists: customerWishlists ?? this.customerWishlists,
      productSellings: productSellings ?? this.productSellings,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'birthday': birthday,
      'email': email,
      'vacationMode': vacationMode,
      'emailSubscribtion': emailSubscribtion,
      'defaultAddress': defaultAddress,
      'customerAddresses': customerAddresses.map((x) => x.toMap()).toList(),
      'customerBankAccounts': customerBankAccounts.map((x) => x.toMap()).toList(),
      'customerWishlists': customerWishlists.map((x) => x.toMap()).toList(),
      'productSellings': productSellings.map((x) => x.toMap()).toList(),
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      age: map['age'] as String,
      birthday: map['birthday'] as String,
      email: map['email'] as String,
      vacationMode: map['vacationMode'] as bool,
      emailSubscribtion: map['emailSubscribtion'] as bool,
      defaultAddress: map['defaultAddress'].toInt() as int,
      customerAddresses: List<CustomerAddresse>.from((map['customerAddresses'] as List<int>).map<CustomerAddresse>((x) => CustomerAddresse.fromMap(x as Map<String,dynamic>),),),
      customerBankAccounts: List<CustomerBankAccount>.from((map['customerBankAccounts'] as List<int>).map<CustomerBankAccount>((x) => CustomerBankAccount.fromMap(x as Map<String,dynamic>),),),
      customerWishlists: List<CustomerWishlist>.from((map['customerWishlists'] as List<int>).map<CustomerWishlist>((x) => CustomerWishlist.fromMap(x as Map<String,dynamic>),),),
      productSellings: List<ProductSelling>.from((map['productSellings'] as List<int>).map<ProductSelling>((x) => ProductSelling.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) => Customer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Customer(firstName: $firstName, lastName: $lastName, age: $age, birthday: $birthday, email: $email, vacationMode: $vacationMode, emailSubscribtion: $emailSubscribtion, defaultAddress: $defaultAddress, customerAddresses: $customerAddresses, customerBankAccounts: $customerBankAccounts, customerWishlists: $customerWishlists, productSellings: $productSellings)';
  }

  @override
  bool operator ==(covariant Customer other) {
    if (identical(this, other)) return true;
  
    return 
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.age == age &&
      other.birthday == birthday &&
      other.email == email &&
      other.vacationMode == vacationMode &&
      other.emailSubscribtion == emailSubscribtion &&
      other.defaultAddress == defaultAddress &&
      listEquals(other.customerAddresses, customerAddresses) &&
      listEquals(other.customerBankAccounts, customerBankAccounts) &&
      listEquals(other.customerWishlists, customerWishlists) &&
      listEquals(other.productSellings, productSellings);
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
      lastName.hashCode ^
      age.hashCode ^
      birthday.hashCode ^
      email.hashCode ^
      vacationMode.hashCode ^
      emailSubscribtion.hashCode ^
      defaultAddress.hashCode ^
      customerAddresses.hashCode ^
      customerBankAccounts.hashCode ^
      customerWishlists.hashCode ^
      productSellings.hashCode;
  }
}


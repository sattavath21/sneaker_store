import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'user_addresse.dart';
import 'user_bank_account.dart';
import 'user_wishlist.dart';
import 'user_with_product_selling.dart';

class User {
   String firstName;
   String lastName;
   String age;
  final String birthday;
   String email;
  final bool vacationMode;
  final bool emailSubscribtion;
  final int defaultAddress;
   List<UserAddresse> userAddresses;
   List<UserBankAccount>? userBankAccounts;
   List<UserWishlist>? userWishlists;
   List<UserWithProductSelling>? userWithProductSellings;
  User({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.birthday,
    required this.email,
    required this.vacationMode,
    required this.emailSubscribtion,
    required this.defaultAddress,
    required this.userAddresses,
     this.userBankAccounts,
     this.userWishlists,
     this.userWithProductSellings,
  });

  User copyWith({
    String? firstName,
    String? lastName,
    String? age,
    String? birthday,
    String? email,
    bool? vacationMode,
    bool? emailSubscribtion,
    int? defaultAddress,
    List<UserAddresse>? userAddresses,
    List<UserBankAccount>? userBankAccounts,
    List<UserWishlist>? userWishlists,
    List<UserWithProductSelling>? userWithProductSellings,
  }) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      birthday: birthday ?? this.birthday,
      email: email ?? this.email,
      vacationMode: vacationMode ?? this.vacationMode,
      emailSubscribtion: emailSubscribtion ?? this.emailSubscribtion,
      defaultAddress: defaultAddress ?? this.defaultAddress,
      userAddresses: userAddresses ?? this.userAddresses,
      userBankAccounts: userBankAccounts ?? this.userBankAccounts,
      userWishlists: userWishlists ?? this.userWishlists,
      userWithProductSellings: userWithProductSellings ?? this.userWithProductSellings,
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
      'userAddresses': userAddresses.map((x) => x.toMap()).toList(),
      'userBankAccounts': userBankAccounts?.map((x) => x.toMap()).toList(),
      'userWishlists': userWishlists?.map((x) => x.toMap()).toList(),
      'userWithProductSellings': userWithProductSellings?.map((x) => x.toMap()).toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      age: map['age'] as String,
      birthday: map['birthday'] as String,
      email: map['email'] as String,
      vacationMode: map['vacationMode'] as bool,
      emailSubscribtion: map['emailSubscribtion'] as bool,
      defaultAddress: map['defaultAddress'].toInt() as int,
      userAddresses: List<UserAddresse>.from((map['userAddresses'] as List<int>).map<UserAddresse>((x) => UserAddresse.fromMap(x as Map<String,dynamic>),),),
      userBankAccounts: List<UserBankAccount>.from((map['userBankAccounts'] as List<int>).map<UserBankAccount>((x) => UserBankAccount.fromMap(x as Map<String,dynamic>),),),
      userWishlists: List<UserWishlist>.from((map['userWishlists'] as List<int>).map<UserWishlist>((x) => UserWishlist.fromMap(x as Map<String,dynamic>),),),
      userWithProductSellings: List<UserWithProductSelling>.from((map['userWithProductSellings'] as List<int>).map<UserWithProductSelling>((x) => UserWithProductSelling.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(firstName: $firstName, lastName: $lastName, age: $age, birthday: $birthday, email: $email, vacationMode: $vacationMode, emailSubscribtion: $emailSubscribtion, defaultAddress: $defaultAddress, userAddresses: $userAddresses, userBankAccounts: $userBankAccounts, userWishlists: $userWishlists, userWithProductSellings: $userWithProductSellings)';
  }

  @override
  bool operator ==(covariant User other) {
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
      listEquals(other.userAddresses, userAddresses) &&
      listEquals(other.userBankAccounts, userBankAccounts) &&
      listEquals(other.userWishlists, userWishlists) &&
      listEquals(other.userWithProductSellings, userWithProductSellings);
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
      userAddresses.hashCode ^
      userBankAccounts.hashCode ^
      userWishlists.hashCode ^
      userWithProductSellings.hashCode;
  }
}
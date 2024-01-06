import 'dart:convert';

import 'address.dart';

class Customer_addresse {
  final Address address;
  Customer_addresse({
    required this.address,
  });

  Customer_addresse copyWith({
    Address? address,
  }) {
    return Customer_addresse(
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address.toMap(),
    };
  }

  factory Customer_addresse.fromMap(Map<String, dynamic> map) {
    return Customer_addresse(
      address: Address.fromMap(map['address'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer_addresse.fromJson(String source) => Customer_addresse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Customer_addresse(address: $address)';

  @override
  bool operator ==(covariant Customer_addresse other) {
    if (identical(this, other)) return true;
  
    return 
      other.address == address;
  }

  @override
  int get hashCode => address.hashCode;
}
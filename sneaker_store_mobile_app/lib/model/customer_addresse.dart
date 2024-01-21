import 'dart:convert';

import 'address.dart';

class CustomerAddresse {
  final Address address;
  CustomerAddresse({
    required this.address,
  });

  CustomerAddresse copyWith({
    Address? address,
  }) {
    return CustomerAddresse(
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address.toMap(),
    };
  }

  factory CustomerAddresse.fromMap(Map<String, dynamic> map) {
    return CustomerAddresse(
      address: Address.fromMap(map['address'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerAddresse.fromJson(String source) => CustomerAddresse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CustomerAddresse(address: $address)';

  @override
  bool operator ==(covariant CustomerAddresse other) {
    if (identical(this, other)) return true;
  
    return 
      other.address == address;
  }

  @override
  int get hashCode => address.hashCode;
}
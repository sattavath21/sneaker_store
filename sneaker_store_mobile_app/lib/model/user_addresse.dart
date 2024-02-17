import 'dart:convert';

import 'address.dart';

class UserAddresse {
  final Address address;
  UserAddresse({
    required this.address,
  });

  UserAddresse copyWith({
    Address? address,
  }) {
    return UserAddresse(
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address.toMap(),
    };
  }

  factory UserAddresse.fromMap(Map<String, dynamic> map) {
    return UserAddresse(
      address: Address.fromMap(map['address'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAddresse.fromJson(String source) => UserAddresse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserAddresse(address: $address)';

  @override
  bool operator ==(covariant UserAddresse other) {
    if (identical(this, other)) return true;
  
    return 
      other.address == address;
  }

  @override
  int get hashCode => address.hashCode;
}
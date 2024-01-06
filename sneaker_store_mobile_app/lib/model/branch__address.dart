import 'dart:convert';

class Branch_address {
  final String province;
  final String city;
  final String village;
  final String address_detail;
  Branch_address({
    required this.province,
    required this.city,
    required this.village,
    required this.address_detail,
  });

  Branch_address copyWith({
    String? province,
    String? city,
    String? village,
    String? address_detail,
  }) {
    return Branch_address(
      province: province ?? this.province,
      city: city ?? this.city,
      village: village ?? this.village,
      address_detail: address_detail ?? this.address_detail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'province': province,
      'city': city,
      'village': village,
      'address_detail': address_detail,
    };
  }

  factory Branch_address.fromMap(Map<String, dynamic> map) {
    return Branch_address(
      province: map['province'] as String,
      city: map['city'] as String,
      village: map['village'] as String,
      address_detail: map['address_detail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Branch_address.fromJson(String source) => Branch_address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Branch_address(province: $province, city: $city, village: $village, address_detail: $address_detail)';
  }

  @override
  bool operator ==(covariant Branch_address other) {
    if (identical(this, other)) return true;
  
    return 
      other.province == province &&
      other.city == city &&
      other.village == village &&
      other.address_detail == address_detail;
  }

  @override
  int get hashCode {
    return province.hashCode ^
      city.hashCode ^
      village.hashCode ^
      address_detail.hashCode;
  }
}
import 'dart:convert';

class Address {
  final String seller_name;
  final String seller_tel_number;
  final String province;
  final String city;
  final String village;
  final String address_detail;
  final String post_code;
  Address({
    required this.seller_name,
    required this.seller_tel_number,
    required this.province,
    required this.city,
    required this.village,
    required this.address_detail,
    required this.post_code,
  });

  Address copyWith({
    String? seller_name,
    String? seller_tel_number,
    String? province,
    String? city,
    String? village,
    String? address_detail,
    String? post_code,
  }) {
    return Address(
      seller_name: seller_name ?? this.seller_name,
      seller_tel_number: seller_tel_number ?? this.seller_tel_number,
      province: province ?? this.province,
      city: city ?? this.city,
      village: village ?? this.village,
      address_detail: address_detail ?? this.address_detail,
      post_code: post_code ?? this.post_code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'seller_name': seller_name,
      'seller_tel_number': seller_tel_number,
      'province': province,
      'city': city,
      'village': village,
      'address_detail': address_detail,
      'post_code': post_code,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      seller_name: map['seller_name'] as String,
      seller_tel_number: map['seller_tel_number'] as String,
      province: map['province'] as String,
      city: map['city'] as String,
      village: map['village'] as String,
      address_detail: map['address_detail'] as String,
      post_code: map['post_code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(seller_name: $seller_name, seller_tel_number: $seller_tel_number, province: $province, city: $city, village: $village, address_detail: $address_detail, post_code: $post_code)';
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;
  
    return 
      other.seller_name == seller_name &&
      other.seller_tel_number == seller_tel_number &&
      other.province == province &&
      other.city == city &&
      other.village == village &&
      other.address_detail == address_detail &&
      other.post_code == post_code;
  }

  @override
  int get hashCode {
    return seller_name.hashCode ^
      seller_tel_number.hashCode ^
      province.hashCode ^
      city.hashCode ^
      village.hashCode ^
      address_detail.hashCode ^
      post_code.hashCode;
  }
}
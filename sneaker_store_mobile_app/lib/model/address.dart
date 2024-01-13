import 'dart:convert';

class Address {
  final String sellerName;
  final String sellerTelNumber;
  final String province;
  final String city;
  final String village;
  final String addressDetail;
  final String postCode;
  Address({
    required this.sellerName,
    required this.sellerTelNumber,
    required this.province,
    required this.city,
    required this.village,
    required this.addressDetail,
    required this.postCode,
  });

  Address copyWith({
    String? sellerName,
    String? sellerTelNumber,
    String? province,
    String? city,
    String? village,
    String? addressDetail,
    String? postCode,
  }) {
    return Address(
      sellerName: sellerName ?? this.sellerName,
      sellerTelNumber: sellerTelNumber ?? this.sellerTelNumber,
      province: province ?? this.province,
      city: city ?? this.city,
      village: village ?? this.village,
      addressDetail: addressDetail ?? this.addressDetail,
      postCode: postCode ?? this.postCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sellerName': sellerName,
      'sellerTelNumber': sellerTelNumber,
      'province': province,
      'city': city,
      'village': village,
      'addressDetail': addressDetail,
      'postCode': postCode,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      sellerName: map['sellerName'] as String,
      sellerTelNumber: map['sellerTelNumber'] as String,
      province: map['province'] as String,
      city: map['city'] as String,
      village: map['village'] as String,
      addressDetail: map['addressDetail'] as String,
      postCode: map['postCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(sellerName: $sellerName, sellerTelNumber: $sellerTelNumber, province: $province, city: $city, village: $village, addressDetail: $addressDetail, postCode: $postCode)';
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;
  
    return 
      other.sellerName == sellerName &&
      other.sellerTelNumber == sellerTelNumber &&
      other.province == province &&
      other.city == city &&
      other.village == village &&
      other.addressDetail == addressDetail &&
      other.postCode == postCode;
  }

  @override
  int get hashCode {
    return sellerName.hashCode ^
      sellerTelNumber.hashCode ^
      province.hashCode ^
      city.hashCode ^
      village.hashCode ^
      addressDetail.hashCode ^
      postCode.hashCode;
  }
}
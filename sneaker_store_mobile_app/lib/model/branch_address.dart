import 'dart:convert';

class BranchAddress {
  final String province;
  final String city;
  final String village;
  final String addressDetail;
  BranchAddress({
    required this.province,
    required this.city,
    required this.village,
    required this.addressDetail,
  });

  BranchAddress copyWith({
    String? province,
    String? city,
    String? village,
    String? addressDetail,
  }) {
    return BranchAddress(
      province: province ?? this.province,
      city: city ?? this.city,
      village: village ?? this.village,
      addressDetail: addressDetail ?? this.addressDetail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'province': province,
      'city': city,
      'village': village,
      'addressDetail': addressDetail,
    };
  }

  factory BranchAddress.fromMap(Map<String, dynamic> map) {
    return BranchAddress(
      province: map['province'] as String,
      city: map['city'] as String,
      village: map['village'] as String,
      addressDetail: map['addressDetail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BranchAddress.fromJson(String source) => BranchAddress.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BranchAddress(province: $province, city: $city, village: $village, addressDetail: $addressDetail)';
  }

  @override
  bool operator ==(covariant BranchAddress other) {
    if (identical(this, other)) return true;
  
    return 
      other.province == province &&
      other.city == city &&
      other.village == village &&
      other.addressDetail == addressDetail;
  }

  @override
  int get hashCode {
    return province.hashCode ^
      city.hashCode ^
      village.hashCode ^
      addressDetail.hashCode;
  }
}
import 'dart:convert';

class Brand {
  final String brand_name;
  final String brand_logo;
  Brand({
    required this.brand_name,
    required this.brand_logo,
  });

  Brand copyWith({
    String? brand_name,
    String? brand_logo,
  }) {
    return Brand(
      brand_name: brand_name ?? this.brand_name,
      brand_logo: brand_logo ?? this.brand_logo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'brand_name': brand_name,
      'brand_logo': brand_logo,
    };
  }

  factory Brand.fromMap(Map<String, dynamic> map) {
    return Brand(
      brand_name: map['brand_name'] as String,
      brand_logo: map['brand_logo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Brand.fromJson(String source) => Brand.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Brand(brand_name: $brand_name, brand_logo: $brand_logo)';

  @override
  bool operator ==(covariant Brand other) {
    if (identical(this, other)) return true;
  
    return 
      other.brand_name == brand_name &&
      other.brand_logo == brand_logo;
  }

  @override
  int get hashCode => brand_name.hashCode ^ brand_logo.hashCode;
}
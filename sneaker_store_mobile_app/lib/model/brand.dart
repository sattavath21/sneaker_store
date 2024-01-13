import 'dart:convert';

class Brand {
  final String brandName;
  final String brandLogo;
  Brand({
    required this.brandName,
    required this.brandLogo,
  });

  Brand copyWith({
    String? brandName,
    String? brandLogo,
  }) {
    return Brand(
      brandName: brandName ?? this.brandName,
      brandLogo: brandLogo ?? this.brandLogo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'brandName': brandName,
      'brandLogo': brandLogo,
    };
  }

  factory Brand.fromMap(Map<String, dynamic> map) {
    return Brand(
      brandName: map['brandName'] as String,
      brandLogo: map['brandLogo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Brand.fromJson(String source) => Brand.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Brand(brandName: $brandName, brandLogo: $brandLogo)';

  @override
  bool operator ==(covariant Brand other) {
    if (identical(this, other)) return true;
  
    return 
      other.brandName == brandName &&
      other.brandLogo == brandLogo;
  }

  @override
  int get hashCode => brandName.hashCode ^ brandLogo.hashCode;
}
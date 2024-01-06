import 'dart:convert';

class Customer_defect_image {
  final String defect_image;
  Customer_defect_image({
    required this.defect_image,
  });

  Customer_defect_image copyWith({
    String? defect_image,
  }) {
    return Customer_defect_image(
      defect_image: defect_image ?? this.defect_image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'defect_image': defect_image,
    };
  }

  factory Customer_defect_image.fromMap(Map<String, dynamic> map) {
    return Customer_defect_image(
      defect_image: map['defect_image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer_defect_image.fromJson(String source) => Customer_defect_image.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Customer_defect_image(defect_image: $defect_image)';

  @override
  bool operator ==(covariant Customer_defect_image other) {
    if (identical(this, other)) return true;
  
    return 
      other.defect_image == defect_image;
  }

  @override
  int get hashCode => defect_image.hashCode;
}
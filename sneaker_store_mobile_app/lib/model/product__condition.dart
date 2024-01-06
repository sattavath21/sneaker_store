import 'dart:convert';

class Product_condition {
  final String condition_name;
  Product_condition({
    required this.condition_name,
  });

  Product_condition copyWith({
    String? condition_name,
  }) {
    return Product_condition(
      condition_name: condition_name ?? this.condition_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'condition_name': condition_name,
    };
  }

  factory Product_condition.fromMap(Map<String, dynamic> map) {
    return Product_condition(
      condition_name: map['condition_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product_condition.fromJson(String source) => Product_condition.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Product_condition(condition_name: $condition_name)';

  @override
  bool operator ==(covariant Product_condition other) {
    if (identical(this, other)) return true;
  
    return 
      other.condition_name == condition_name;
  }

  @override
  int get hashCode => condition_name.hashCode;
}
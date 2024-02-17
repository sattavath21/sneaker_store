import 'dart:convert';

class ProductCondition {
  final String conditionName;
  ProductCondition({
    required this.conditionName,
  });

  ProductCondition copyWith({
    String? conditionName,
  }) {
    return ProductCondition(
      conditionName: conditionName ?? this.conditionName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'conditionName': conditionName,
    };
  }

  factory ProductCondition.fromMap(Map<String, dynamic> map) {
    return ProductCondition(
      conditionName: map['conditionName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCondition.fromJson(String source) => ProductCondition.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductCondition(conditionName: $conditionName)';

  @override
  bool operator ==(covariant ProductCondition other) {
    if (identical(this, other)) return true;
  
    return 
      other.conditionName == conditionName;
  }

  @override
  int get hashCode => conditionName.hashCode;
}
import 'dart:convert';

class ShippingMethod {
  final String methodName;
  ShippingMethod({
    required this.methodName,
  });

  ShippingMethod copyWith({
    String? methodName,
  }) {
    return ShippingMethod(
      methodName: methodName ?? this.methodName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'methodName': methodName,
    };
  }

  factory ShippingMethod.fromMap(Map<String, dynamic> map) {
    return ShippingMethod(
      methodName: map['methodName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShippingMethod.fromJson(String source) => ShippingMethod.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ShippingMethod(methodName: $methodName)';

  @override
  bool operator ==(covariant ShippingMethod other) {
    if (identical(this, other)) return true;
  
    return 
      other.methodName == methodName;
  }

  @override
  int get hashCode => methodName.hashCode;
}
import 'dart:convert';

class Shipping_method {
  final String method_name;
  Shipping_method({
    required this.method_name,
  });

  Shipping_method copyWith({
    String? method_name,
  }) {
    return Shipping_method(
      method_name: method_name ?? this.method_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'method_name': method_name,
    };
  }

  factory Shipping_method.fromMap(Map<String, dynamic> map) {
    return Shipping_method(
      method_name: map['method_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Shipping_method.fromJson(String source) => Shipping_method.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Shipping_method(method_name: $method_name)';

  @override
  bool operator ==(covariant Shipping_method other) {
    if (identical(this, other)) return true;
  
    return 
      other.method_name == method_name;
  }

  @override
  int get hashCode => method_name.hashCode;
}
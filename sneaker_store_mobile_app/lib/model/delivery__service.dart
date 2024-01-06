import 'dart:convert';

class Delivery_service {
  final String delivery_company_name;
  Delivery_service({
    required this.delivery_company_name,
  });

  Delivery_service copyWith({
    String? delivery_company_name,
  }) {
    return Delivery_service(
      delivery_company_name: delivery_company_name ?? this.delivery_company_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'delivery_company_name': delivery_company_name,
    };
  }

  factory Delivery_service.fromMap(Map<String, dynamic> map) {
    return Delivery_service(
      delivery_company_name: map['delivery_company_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Delivery_service.fromJson(String source) => Delivery_service.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Delivery_service(delivery_company_name: $delivery_company_name)';

  @override
  bool operator ==(covariant Delivery_service other) {
    if (identical(this, other)) return true;
  
    return 
      other.delivery_company_name == delivery_company_name;
  }

  @override
  int get hashCode => delivery_company_name.hashCode;
}
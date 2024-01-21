import 'dart:convert';

class DeliveryService {
  final String deliveryCompanyName;
  DeliveryService({
    required this.deliveryCompanyName,
  });

  DeliveryService copyWith({
    String? deliveryCompanyName,
  }) {
    return DeliveryService(
      deliveryCompanyName: deliveryCompanyName ?? this.deliveryCompanyName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'deliveryCompanyName': deliveryCompanyName,
    };
  }

  factory DeliveryService.fromMap(Map<String, dynamic> map) {
    return DeliveryService(
      deliveryCompanyName: map['deliveryCompanyName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryService.fromJson(String source) => DeliveryService.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DeliveryService(deliveryCompanyName: $deliveryCompanyName)';

  @override
  bool operator ==(covariant DeliveryService other) {
    if (identical(this, other)) return true;
  
    return 
      other.deliveryCompanyName == deliveryCompanyName;
  }

  @override
  int get hashCode => deliveryCompanyName.hashCode;
}
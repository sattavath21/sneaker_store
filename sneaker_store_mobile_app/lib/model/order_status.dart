import 'dart:convert';

class OrderStatus {
  final String statusName;
  OrderStatus({
    required this.statusName,
  });

  OrderStatus copyWith({
    String? statusName,
  }) {
    return OrderStatus(
      statusName: statusName ?? this.statusName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statusName': statusName,
    };
  }

  factory OrderStatus.fromMap(Map<String, dynamic> map) {
    return OrderStatus(
      statusName: map['statusName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderStatus.fromJson(String source) => OrderStatus.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'OrderStatus(statusName: $statusName)';

  @override
  bool operator ==(covariant OrderStatus other) {
    if (identical(this, other)) return true;
  
    return 
      other.statusName == statusName;
  }

  @override
  int get hashCode => statusName.hashCode;
}
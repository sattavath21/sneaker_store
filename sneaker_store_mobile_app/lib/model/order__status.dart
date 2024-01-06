import 'dart:convert';

class Order_status {
  final String status_name;
  Order_status({
    required this.status_name,
  });

  Order_status copyWith({
    String? status_name,
  }) {
    return Order_status(
      status_name: status_name ?? this.status_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status_name': status_name,
    };
  }

  factory Order_status.fromMap(Map<String, dynamic> map) {
    return Order_status(
      status_name: map['status_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order_status.fromJson(String source) => Order_status.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Order_status(status_name: $status_name)';

  @override
  bool operator ==(covariant Order_status other) {
    if (identical(this, other)) return true;
  
    return 
      other.status_name == status_name;
  }

  @override
  int get hashCode => status_name.hashCode;
}
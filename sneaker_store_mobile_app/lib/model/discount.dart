import 'dart:convert';

import 'shipping_method.dart';

class Discount {
  final int minSpend;
  final String start;
  final int duration;
  final int amount;
  final ShippingMethod shippingMethod;
  final String description;
  Discount({
    required this.minSpend,
    required this.start,
    required this.duration,
    required this.amount,
    required this.shippingMethod,
    required this.description,
  });

  Discount copyWith({
    int? minSpend,
    String? start,
    int? duration,
    int? amount,
    ShippingMethod? shippingMethod,
    String? description,
  }) {
    return Discount(
      minSpend: minSpend ?? this.minSpend,
      start: start ?? this.start,
      duration: duration ?? this.duration,
      amount: amount ?? this.amount,
      shippingMethod: shippingMethod ?? this.shippingMethod,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'minSpend': minSpend,
      'start': start,
      'duration': duration,
      'amount': amount,
      'shippingMethod': shippingMethod.toMap(),
      'description': description,
    };
  }

  factory Discount.fromMap(Map<String, dynamic> map) {
    return Discount(
      minSpend: map['minSpend'].toInt() as int,
      start: map['start'] as String,
      duration: map['duration'].toInt() as int,
      amount: map['amount'].toInt() as int,
      shippingMethod: ShippingMethod.fromMap(map['shippingMethod'] as Map<String,dynamic>),
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Discount.fromJson(String source) => Discount.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Discount(minSpend: $minSpend, start: $start, duration: $duration, amount: $amount, shippingMethod: $shippingMethod, description: $description)';
  }

  @override
  bool operator ==(covariant Discount other) {
    if (identical(this, other)) return true;
  
    return 
      other.minSpend == minSpend &&
      other.start == start &&
      other.duration == duration &&
      other.amount == amount &&
      other.shippingMethod == shippingMethod &&
      other.description == description;
  }

  @override
  int get hashCode {
    return minSpend.hashCode ^
      start.hashCode ^
      duration.hashCode ^
      amount.hashCode ^
      shippingMethod.hashCode ^
      description.hashCode;
  }
}
import 'dart:convert';

import 'shipping__method.dart';

class Discount {
  final int min_spend;
  final String start;
  final int duration;
  final int amount;
  final Shipping_method shipping_method;
  final String description;
  Discount({
    required this.min_spend,
    required this.start,
    required this.duration,
    required this.amount,
    required this.shipping_method,
    required this.description,
  });

  Discount copyWith({
    int? min_spend,
    String? start,
    int? duration,
    int? amount,
    Shipping_method? shipping_method,
    String? description,
  }) {
    return Discount(
      min_spend: min_spend ?? this.min_spend,
      start: start ?? this.start,
      duration: duration ?? this.duration,
      amount: amount ?? this.amount,
      shipping_method: shipping_method ?? this.shipping_method,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'min_spend': min_spend,
      'start': start,
      'duration': duration,
      'amount': amount,
      'shipping_method': shipping_method.toMap(),
      'description': description,
    };
  }

  factory Discount.fromMap(Map<String, dynamic> map) {
    return Discount(
      min_spend: map['min_spend'].toInt() as int,
      start: map['start'] as String,
      duration: map['duration'].toInt() as int,
      amount: map['amount'].toInt() as int,
      shipping_method: Shipping_method.fromMap(map['shipping_method'] as Map<String,dynamic>),
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Discount.fromJson(String source) => Discount.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Discount(min_spend: $min_spend, start: $start, duration: $duration, amount: $amount, shipping_method: $shipping_method, description: $description)';
  }

  @override
  bool operator ==(covariant Discount other) {
    if (identical(this, other)) return true;
  
    return 
      other.min_spend == min_spend &&
      other.start == start &&
      other.duration == duration &&
      other.amount == amount &&
      other.shipping_method == shipping_method &&
      other.description == description;
  }

  @override
  int get hashCode {
    return min_spend.hashCode ^
      start.hashCode ^
      duration.hashCode ^
      amount.hashCode ^
      shipping_method.hashCode ^
      description.hashCode;
  }
}
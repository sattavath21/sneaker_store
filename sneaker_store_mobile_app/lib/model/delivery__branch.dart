import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'branch__address.dart';
import 'branch__tel__number.dart';
import 'delivery__service.dart';

class Delivery_branch {
  final Delivery_service delivery_service;
  final String branch_name;
  final List<Branch_tel_number> branch_tel_numbers;
  final String branch_availability;
  final Branch_address branch_address;
  final String branch_googlemap_position;
  Delivery_branch({
    required this.delivery_service,
    required this.branch_name,
    required this.branch_tel_numbers,
    required this.branch_availability,
    required this.branch_address,
    required this.branch_googlemap_position,
  });

  Delivery_branch copyWith({
    Delivery_service? delivery_service,
    String? branch_name,
    List<Branch_tel_number>? branch_tel_numbers,
    String? branch_availability,
    Branch_address? branch_address,
    String? branch_googlemap_position,
  }) {
    return Delivery_branch(
      delivery_service: delivery_service ?? this.delivery_service,
      branch_name: branch_name ?? this.branch_name,
      branch_tel_numbers: branch_tel_numbers ?? this.branch_tel_numbers,
      branch_availability: branch_availability ?? this.branch_availability,
      branch_address: branch_address ?? this.branch_address,
      branch_googlemap_position: branch_googlemap_position ?? this.branch_googlemap_position,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'delivery_service': delivery_service.toMap(),
      'branch_name': branch_name,
      'branch_tel_numbers': branch_tel_numbers.map((x) => x.toMap()).toList(),
      'branch_availability': branch_availability,
      'branch_address': branch_address.toMap(),
      'branch_googlemap_position': branch_googlemap_position,
    };
  }

  factory Delivery_branch.fromMap(Map<String, dynamic> map) {
    return Delivery_branch(
      delivery_service: Delivery_service.fromMap(map['delivery_service'] as Map<String,dynamic>),
      branch_name: map['branch_name'] as String,
      branch_tel_numbers: List<Branch_tel_number>.from((map['branch_tel_numbers'] as List<int>).map<Branch_tel_number>((x) => Branch_tel_number.fromMap(x as Map<String,dynamic>),),),
      branch_availability: map['branch_availability'] as String,
      branch_address: Branch_address.fromMap(map['branch_address'] as Map<String,dynamic>),
      branch_googlemap_position: map['branch_googlemap_position'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Delivery_branch.fromJson(String source) => Delivery_branch.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Delivery_branch(delivery_service: $delivery_service, branch_name: $branch_name, branch_tel_numbers: $branch_tel_numbers, branch_availability: $branch_availability, branch_address: $branch_address, branch_googlemap_position: $branch_googlemap_position)';
  }

  @override
  bool operator ==(covariant Delivery_branch other) {
    if (identical(this, other)) return true;
  
    return 
      other.delivery_service == delivery_service &&
      other.branch_name == branch_name &&
      listEquals(other.branch_tel_numbers, branch_tel_numbers) &&
      other.branch_availability == branch_availability &&
      other.branch_address == branch_address &&
      other.branch_googlemap_position == branch_googlemap_position;
  }

  @override
  int get hashCode {
    return delivery_service.hashCode ^
      branch_name.hashCode ^
      branch_tel_numbers.hashCode ^
      branch_availability.hashCode ^
      branch_address.hashCode ^
      branch_googlemap_position.hashCode;
  }
}
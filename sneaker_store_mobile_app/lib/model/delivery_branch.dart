import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'branch_address.dart';
import 'branch_tel_number.dart';
import 'delivery_service.dart';

class DeliveryBranch {
  final DeliveryService deliveryService;
  final String branchName;
  final List<BranchTelNumber> branchTelNumbers;
  final String branchAvailability;
  final BranchAddress branchAddress;
  String? branchGooglemapPosition;
  DeliveryBranch({
    required this.deliveryService,
    required this.branchName,
    required this.branchTelNumbers,
    required this.branchAvailability,
    required this.branchAddress,
    this.branchGooglemapPosition,
  });

  DeliveryBranch copyWith({
    DeliveryService? deliveryService,
    String? branchName,
    List<BranchTelNumber>? branchTelNumbers,
    String? branchAvailability,
    BranchAddress? branchAddress,
    String? branchGooglemapPosition,
  }) {
    return DeliveryBranch(
      deliveryService: deliveryService ?? this.deliveryService,
      branchName: branchName ?? this.branchName,
      branchTelNumbers: branchTelNumbers ?? this.branchTelNumbers,
      branchAvailability: branchAvailability ?? this.branchAvailability,
      branchAddress: branchAddress ?? this.branchAddress,
      branchGooglemapPosition: branchGooglemapPosition ?? this.branchGooglemapPosition,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'deliveryService': deliveryService.toMap(),
      'branchName': branchName,
      'branchTelNumbers': branchTelNumbers.map((x) => x.toMap()).toList(),
      'branchAvailability': branchAvailability,
      'branchAddress': branchAddress.toMap(),
      'branchGooglemapPosition': branchGooglemapPosition,
    };
  }

  factory DeliveryBranch.fromMap(Map<String, dynamic> map) {
    return DeliveryBranch(
      deliveryService: DeliveryService.fromMap(map['deliveryService'] as Map<String,dynamic>),
      branchName: map['branchName'] as String,
      branchTelNumbers: List<BranchTelNumber>.from((map['branchTelNumbers'] as List<int>).map<BranchTelNumber>((x) => BranchTelNumber.fromMap(x as Map<String,dynamic>),),),
      branchAvailability: map['branchAvailability'] as String,
      branchAddress: BranchAddress.fromMap(map['branchAddress'] as Map<String,dynamic>),
      branchGooglemapPosition: map['branchGooglemapPosition'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryBranch.fromJson(String source) => DeliveryBranch.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DeliveryBranch(deliveryService: $deliveryService, branchName: $branchName, branchTelNumbers: $branchTelNumbers, branchAvailability: $branchAvailability, branchAddress: $branchAddress, branchGooglemapPosition: $branchGooglemapPosition)';
  }

  @override
  bool operator ==(covariant DeliveryBranch other) {
    if (identical(this, other)) return true;
  
    return 
      other.deliveryService == deliveryService &&
      other.branchName == branchName &&
      listEquals(other.branchTelNumbers, branchTelNumbers) &&
      other.branchAvailability == branchAvailability &&
      other.branchAddress == branchAddress &&
      other.branchGooglemapPosition == branchGooglemapPosition;
  }

  @override
  int get hashCode {
    return deliveryService.hashCode ^
      branchName.hashCode ^
      branchTelNumbers.hashCode ^
      branchAvailability.hashCode ^
      branchAddress.hashCode ^
      branchGooglemapPosition.hashCode;
  }
}
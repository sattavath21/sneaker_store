import 'dart:convert';

class BranchTelNumber {
  final String telNumber;
  BranchTelNumber({
    required this.telNumber,
  });

  BranchTelNumber copyWith({
    String? telNumber,
  }) {
    return BranchTelNumber(
      telNumber: telNumber ?? this.telNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'telNumber': telNumber,
    };
  }

  factory BranchTelNumber.fromMap(Map<String, dynamic> map) {
    return BranchTelNumber(
      telNumber: map['telNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BranchTelNumber.fromJson(String source) => BranchTelNumber.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BranchTelNumber(telNumber: $telNumber)';

  @override
  bool operator ==(covariant BranchTelNumber other) {
    if (identical(this, other)) return true;
  
    return 
      other.telNumber == telNumber;
  }

  @override
  int get hashCode => telNumber.hashCode;
}
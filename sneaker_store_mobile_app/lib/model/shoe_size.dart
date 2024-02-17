import 'dart:convert';

class ShoeSize {
  final String sizeType;
  final double sizeNumber;
  ShoeSize({
    required this.sizeType,
    required this.sizeNumber,
  });

  ShoeSize copyWith({
    String? sizeType,
    double? sizeNumber,
  }) {
    return ShoeSize(
      sizeType: sizeType ?? this.sizeType,
      sizeNumber: sizeNumber ?? this.sizeNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sizeType': sizeType,
      'sizeNumber': sizeNumber,
    };
  }

  factory ShoeSize.fromMap(Map<String, dynamic> map) {
    return ShoeSize(
      sizeType: map['sizeType'] as String,
      sizeNumber: map['sizeNumber'].toDouble() as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShoeSize.fromJson(String source) => ShoeSize.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ShoeSize(sizeType: $sizeType, sizeNumber: $sizeNumber)';

  @override
  bool operator ==(covariant ShoeSize other) {
    if (identical(this, other)) return true;
  
    return 
      other.sizeType == sizeType &&
      other.sizeNumber == sizeNumber;
  }

  @override
  int get hashCode => sizeType.hashCode ^ sizeNumber.hashCode;
}
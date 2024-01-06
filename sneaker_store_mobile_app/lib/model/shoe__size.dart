import 'dart:convert';

class Shoe_size {
  final String size_type;
  final double size_number;
  Shoe_size({
    required this.size_type,
    required this.size_number,
  });

  Shoe_size copyWith({
    String? size_type,
    double? size_number,
  }) {
    return Shoe_size(
      size_type: size_type ?? this.size_type,
      size_number: size_number ?? this.size_number,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'size_type': size_type,
      'size_number': size_number,
    };
  }

  factory Shoe_size.fromMap(Map<String, dynamic> map) {
    return Shoe_size(
      size_type: map['size_type'] as String,
      size_number: map['size_number'].toDouble() as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Shoe_size.fromJson(String source) => Shoe_size.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Shoe_size(size_type: $size_type, size_number: $size_number)';

  @override
  bool operator ==(covariant Shoe_size other) {
    if (identical(this, other)) return true;
  
    return 
      other.size_type == size_type &&
      other.size_number == size_number;
  }

  @override
  int get hashCode => size_type.hashCode ^ size_number.hashCode;
}
import 'dart:convert';

class Branch_tel_number {
  final String tel_number;
  Branch_tel_number({
    required this.tel_number,
  });

  Branch_tel_number copyWith({
    String? tel_number,
  }) {
    return Branch_tel_number(
      tel_number: tel_number ?? this.tel_number,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tel_number': tel_number,
    };
  }

  factory Branch_tel_number.fromMap(Map<String, dynamic> map) {
    return Branch_tel_number(
      tel_number: map['tel_number'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Branch_tel_number.fromJson(String source) => Branch_tel_number.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Branch_tel_number(tel_number: $tel_number)';

  @override
  bool operator ==(covariant Branch_tel_number other) {
    if (identical(this, other)) return true;
  
    return 
      other.tel_number == tel_number;
  }

  @override
  int get hashCode => tel_number.hashCode;
}
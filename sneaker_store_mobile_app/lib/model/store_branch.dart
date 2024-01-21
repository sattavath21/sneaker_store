import 'dart:convert';

class StoreBranch {
  final String province;
  StoreBranch({
    required this.province,
  });

  StoreBranch copyWith({
    String? province,
  }) {
    return StoreBranch(
      province: province ?? this.province,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'province': province,
    };
  }

  factory StoreBranch.fromMap(Map<String, dynamic> map) {
    return StoreBranch(
      province: map['province'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreBranch.fromJson(String source) => StoreBranch.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StoreBranch(province: $province)';

  @override
  bool operator ==(covariant StoreBranch other) {
    if (identical(this, other)) return true;
  
    return 
      other.province == province;
  }

  @override
  int get hashCode => province.hashCode;
}
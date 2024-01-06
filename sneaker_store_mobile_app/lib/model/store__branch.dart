import 'dart:convert';

class Store_branch {
  final String province;
  Store_branch({
    required this.province,
  });

  Store_branch copyWith({
    String? province,
  }) {
    return Store_branch(
      province: province ?? this.province,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'province': province,
    };
  }

  factory Store_branch.fromMap(Map<String, dynamic> map) {
    return Store_branch(
      province: map['province'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Store_branch.fromJson(String source) => Store_branch.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Store_branch(province: $province)';

  @override
  bool operator ==(covariant Store_branch other) {
    if (identical(this, other)) return true;
  
    return 
      other.province == province;
  }

  @override
  int get hashCode => province.hashCode;
}
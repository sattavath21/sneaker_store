import 'dart:convert';

class ProductCat {
  final String catName;
  ProductCat({
    required this.catName,
  });

  ProductCat copyWith({
    String? catName,
  }) {
    return ProductCat(
      catName: catName ?? this.catName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'catName': catName,
    };
  }

  factory ProductCat.fromMap(Map<String, dynamic> map) {
    return ProductCat(
      catName: map['catName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCat.fromJson(String source) => ProductCat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductCat(catName: $catName)';

  @override
  bool operator ==(covariant ProductCat other) {
    if (identical(this, other)) return true;
  
    return 
      other.catName == catName;
  }

  @override
  int get hashCode => catName.hashCode;
}
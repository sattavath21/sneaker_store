import 'dart:convert';

class Product_cat {
  final String cat_name;
  Product_cat({
    required this.cat_name,
  });

  Product_cat copyWith({
    String? cat_name,
  }) {
    return Product_cat(
      cat_name: cat_name ?? this.cat_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cat_name': cat_name,
    };
  }

  factory Product_cat.fromMap(Map<String, dynamic> map) {
    return Product_cat(
      cat_name: map['cat_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product_cat.fromJson(String source) => Product_cat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Product_cat(cat_name: $cat_name)';

  @override
  bool operator ==(covariant Product_cat other) {
    if (identical(this, other)) return true;
  
    return 
      other.cat_name == cat_name;
  }

  @override
  int get hashCode => cat_name.hashCode;
}
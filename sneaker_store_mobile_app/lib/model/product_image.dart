import 'dart:convert';

class ProductImage {
  final String productImageUrl;
  ProductImage({
    required this.productImageUrl,
  });

  ProductImage copyWith({
    String? productImageUrl,
  }) {
    return ProductImage(
      productImageUrl: productImageUrl ?? this.productImageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productImageUrl': productImageUrl,
    };
  }

  factory ProductImage.fromMap(Map<String, dynamic> map) {
    return ProductImage(
      productImageUrl: map['productImageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductImage.fromJson(String source) => ProductImage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductImage(productImageUrl: $productImageUrl)';

  @override
  bool operator ==(covariant ProductImage other) {
    if (identical(this, other)) return true;
  
    return 
      other.productImageUrl == productImageUrl;
  }

  @override
  int get hashCode => productImageUrl.hashCode;
}
import 'dart:convert';

class Product_image {
  final String product_image_url;
  Product_image({
    required this.product_image_url,
  });

  Product_image copyWith({
    String? product_image_url,
  }) {
    return Product_image(
      product_image_url: product_image_url ?? this.product_image_url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product_image_url': product_image_url,
    };
  }

  factory Product_image.fromMap(Map<String, dynamic> map) {
    return Product_image(
      product_image_url: map['product_image_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product_image.fromJson(String source) => Product_image.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Product_image(product_image_url: $product_image_url)';

  @override
  bool operator ==(covariant Product_image other) {
    if (identical(this, other)) return true;
  
    return 
      other.product_image_url == product_image_url;
  }

  @override
  int get hashCode => product_image_url.hashCode;
}
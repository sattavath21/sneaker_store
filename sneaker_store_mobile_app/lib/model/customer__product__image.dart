import 'dart:convert';

class Customer_product_image {
  final String product_image;
  Customer_product_image({
    required this.product_image,
  });

  Customer_product_image copyWith({
    String? product_image,
  }) {
    return Customer_product_image(
      product_image: product_image ?? this.product_image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product_image': product_image,
    };
  }

  factory Customer_product_image.fromMap(Map<String, dynamic> map) {
    return Customer_product_image(
      product_image: map['product_image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer_product_image.fromJson(String source) => Customer_product_image.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Customer_product_image(product_image: $product_image)';

  @override
  bool operator ==(covariant Customer_product_image other) {
    if (identical(this, other)) return true;
  
    return 
      other.product_image == product_image;
  }

  @override
  int get hashCode => product_image.hashCode;
}